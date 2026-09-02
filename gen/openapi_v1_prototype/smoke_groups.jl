# Live smoke test: load all 27 generated group modules, call every
# zero-positional-arg list operation with a STRICT client (validation on),
# then one typed watch through a patched /watch/ path on apps/v1.
using Test

const SERVER = "http://127.0.0.1:8801"
const MODS = sort(filter(f -> startswith(f, "K8s") && endswith(f, ".jl"), readdir("groups")))

loaded = Module[]
@testset "load all generated group modules" begin
    for f in MODS
        m = include(joinpath("groups", f))
        @test m isa Module
        push!(loaded, m)
    end
    println("    loaded $(length(loaded)) modules")
end

# every list operation that needs no positional args (cluster-scoped or
# for-all-namespaces), called with strict validation
total_ops = 0; total_items = 0
@testset "strict live list calls across all groups" begin
    for m in loaded
        client = m.Client(SERVER; require_credentials = false)
        ops = filter(names(m; all = true)) do n
            s = String(n)
            startswith(s, "list") || return false
            f = getfield(m, n)
            f isa Function || return false
            # single method, no required positional args (just the function itself)
            mt = methods(f)
            length(mt) == 1 && first(mt).nargs == 1
        end
        for op in ops
            f = getfield(m, op)
            res = try
                f(; client)
            catch e
                println("    FAILED $(nameof(m)).$op: ", sprint(showerror, e)[1:min(end, 300)])
                @test false
                continue
            end
            n = hasproperty(res, :items) && !(res.items isa m.Absent) ? length(res.items) : 0
            global total_ops += 1; global total_items += n
            @test true
        end
    end
    println("    $(total_ops) list ops succeeded, $(total_items) items decoded strictly")
end

@testset "typed watch via patched /watch/ path (apps/v1 deployments)" begin
    A = loaded[findfirst(m -> nameof(m) == :K8sAppsV1, loaded)]
    client = A.Client(SERVER; require_credentials = false)
    deps = A.listappsv1namespaceddeployment("default"; client)
    events = Channel{Any}(16)
    A.watchappsv1namespaceddeploymentlist("default"; client,
        resourceversion = deps.metadata.resourceversion, stream_to = events)
    run(`kubectl delete deployment smoke-dep -n default --ignore-not-found`)
    run(`kubectl create deployment smoke-dep --image=busybox -n default -- sleep 3600`)
    @test timedwait(() -> isready(events), 20.0) == :ok
    ev = take!(events)
    @test ev isa A.IoK8sApimachineryPkgApisMetaV1WatchEvent
    @test ev.type_ in ("ADDED", "MODIFIED", "DELETED")
    println("    watch event: $(typeof(ev).name.name) type=$(ev.type_)")
    close(events)
    run(`kubectl delete deployment smoke-dep -n default --ignore-not-found`)
end
println("GROUP SMOKE DONE")
