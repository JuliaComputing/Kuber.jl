# Emit src/ApiImpl/generated/registry.jl — the tables that replace the old
# api_typemap.jl / api_versions.jl and the string-munging + `eval` lookups in
# simpleapi.jl.
#
# Run with the trial branch environment activated, after generate.jl:
#     julia --project=. gen/openapi_v1/emit_registry.jl
#
# Everything here is derived from the patched spec JSONs, never from parsing
# generated Julia. Four tables (OpenAPIv1TrialBranchPlan.md §2.4):
#
#   GROUP_MODULES  apiVersion string -> group module
#   MODULE_GVS     group module -> its own apiVersion string
#   KIND_TYPES     (apiVersion, kind) -> generated model type
#   OPS            (module, verb, kind, scope) -> generated operation function
#   OP_PARAMS      same key -> positional argument names, in call order
#
# Deviations from the plan's sketch, both forced by the spec:
#
# * OPS is keyed by module as well as (verb, kind, scope). The plan's 3-tuple
#   cannot express two shipped versions of one kind, and the trial ships two:
#   autoscaling/v1 and autoscaling/v2 both define HorizontalPodAutoscaler.
#   Callers resolve the module first (apiversion kwarg or ctx.modelapi) exactly
#   as before, then index OPS — so the resolution flow is unchanged.
# * OP_PARAMS exists because the generated positional order is path order:
#   `readcorev1namespacedpod(namespace, name)` takes the namespace FIRST, and
#   bodies come last. Emitting the order keeps simpleapi from re-deriving it.
using JSON

include(joinpath(@__DIR__, "generate.jl"))   # module_name, group_version, patched_specs, OUTDIR

# k8s x-kubernetes-action -> Kuber verb. `connect` (exec/attach/proxy/…) is out
# of the trial's scope, and `watch` is deliberately excluded: the middle path
# has no /watch/ patch, so nothing in Kuber may reference watch* operationIds
# (trap 8) — watching is `watch=true` on the list op.
const ACTION_VERBS = Dict(
    "get" => :get,
    "list" => :list,
    "post" => :create,
    "put" => :replace,
    "patch" => :patch,
    "delete" => :delete,
    "deletecollection" => :deletecollection,
)

const HTTP_METHODS = ("get", "put", "post", "delete", "options", "head", "patch", "trace")

const SCHEMA_POINTER = "/components/schemas/"

"""
    model_names(plan) -> Dict{String,String}

Schema key (`io.k8s.api.core.v1.Pod`) to generated model name
(`IoK8sApiCoreV1Pod`), for the document's top-level component schemas. Read off
the plan rather than derived: see `plan_all`.
"""
function model_names(plan)
    names = Dict{String,String}()
    for m in plan.models
        pointer = string(m.provenance.node.pointer)
        startswith(pointer, SCHEMA_POINTER) || continue
        key = pointer[length(SCHEMA_POINTER)+1:end]
        occursin('/', key) && continue          # a nested/projected sub-schema
        names[key] = m.name
    end
    return names
end

"""
    operation_names(plan) -> Dict{String,String}

`operationId` to generated function name, again read off the plan.
"""
operation_names(plan) = Dict(o.operation.id => o.name for o in plan.operations)

"""
    request_bodies(plan) -> Dict{String,Tuple{String,Vector{String}}}

`operationId` to `(generated body type, documented request media types)`, for
operations with a required body.

Both halves are needed by `update!`: a patch body has to be built as the
generated `Patch` type (an open object) rather than passed as a bare `Dict`, and
k8s documents *only* the five patch media types — there is no plain
`application/json` — so a bad `content_type` has to be reported as such.
"""
function request_bodies(plan)
    out = Dict{String,Tuple{String,Vector{String}}}()
    for o in plan.operations
        body = o.request_body
        (body === nothing || !body.required) && continue
        out[o.operation.id] = (body.type, String[String(first(m)) for m in body.media_types])
    end
    return out
end

api_version(gvk) = isempty(gvk["group"]) ? gvk["version"] : string(gvk["group"], "/", gvk["version"])

path_prefix(gv::AbstractString) = gv == "v1" ? "/api/v1" : "/apis/" * gv

"""
    path_shape(path, prefix) -> (namespaced, plural, has_name, subresource)

Decompose a k8s path relative to its document's API root. `subresource` holds
the literal segments after `{name}` (templated segments dropped).
"""
function path_shape(path::AbstractString, prefix::AbstractString)
    startswith(path, prefix) || return nothing
    rest = strip(path[length(prefix)+1:end], '/')
    isempty(rest) && return nothing
    segs = split(rest, '/')
    "watch" in segs && return nothing          # deprecated dedicated watch paths
    nsidx = findfirst(==("{namespace}"), segs)
    namespaced = nsidx !== nothing
    resource = namespaced ? segs[nsidx+1:end] : segs
    isempty(resource) && return nothing
    plural = resource[1]
    startswith(plural, "{") && return nothing
    has_name = length(resource) >= 2 && resource[2] == "{name}"
    sub = has_name ? filter(s -> !startswith(s, "{"), resource[3:end]) : String[]
    return (; namespaced, plural, has_name, subresource = sub)
end

"""
    scope_of(shape, operation_id) -> Symbol

`:namespaced`, `:allns` (a `…ForAllNamespaces` collection op) or `:cluster`.
"""
function scope_of(shape, operation_id::AbstractString)
    shape.namespaced && return :namespaced
    endswith(operation_id, "ForAllNamespaces") && return :allns
    return :cluster
end

"""
    positional_params(path, operation) -> Vector{Symbol}

Generated operations take path parameters in path order, then a *required*
request body last. An optional body stays a keyword argument — `delete` and
`deletecollection` document an optional `DeleteOptions` body, and their
generated signatures take no positional body.
"""
function positional_params(path::AbstractString, operation)
    params = Symbol[Symbol(m.captures[1]) for m in eachmatch(r"\{([^}]+)\}", path)]
    body = get(operation, "requestBody", nothing)
    body isa AbstractDict && get(body, "required", false) === true && push!(params, :body)
    return params
end

struct Doc
    file::String
    modname::String
    gv::String
    json::Dict{String,Any}
    models::Dict{String,String}       # schema key -> generated model name
    operations::Dict{String,String}   # operationId -> generated function name
    bodies::Dict{String,Tuple{String,Vector{String}}}   # operationId -> (body type, media types)
end

function load_docs()
    plans = plan_all()
    docs = Doc[]
    for f in patched_specs()
        modname = module_name(f)
        plan = plans[modname]
        push!(docs, Doc(f, modname, group_version(f),
                        JSON.parsefile(f; dicttype = Dict{String,Any}),
                        model_names(plan), operation_names(plan), request_bodies(plan)))
    end
    return docs
end

"""
    kind_types(docs) -> Dict{Tuple{String,String},Tuple{String,String}}

`(apiVersion, kind)` -> `(module, generated type name)`, restricted to the
group-versions the trial actually ships.

Every k8s schema carries `x-kubernetes-group-version-kind`, but the meta types
(`Status`, `DeleteOptions`, `WatchEvent`, `APIResourceList`) are registered
under *every* group-version in *every* document, and each group module has its
own copy of the type — so the table would be `readdir`-order dependent without
a policy. The policy: the module whose own group-version matches the key wins,
then core, then the alphabetically first — deterministic in all three cases.
"""
function kind_types(docs::Vector{Doc})
    shipped = Set(d.gv for d in docs)
    candidates = Dict{Tuple{String,String},Vector{Doc}}()
    schemas = Dict{Tuple{String,String,String},String}()   # (module, apiVersion, kind) -> schema key
    for d in docs
        for (schema, body) in get(d.json["components"], "schemas", Dict())
            body isa AbstractDict || continue
            for gvk in get(body, "x-kubernetes-group-version-kind", ())
                av = api_version(gvk)
                av in shipped || continue
                key = (av, gvk["kind"])
                push!(get!(candidates, key, Doc[]), d)
                schemas[(d.modname, key...)] = schema
            end
        end
    end
    out = Dict{Tuple{String,String},Tuple{String,String}}()
    for (key, cands) in candidates
        av, _ = key
        pick = findfirst(d -> d.gv == av, cands)
        pick === nothing && (pick = findfirst(d -> d.gv == "v1", cands))
        pick === nothing && (pick = argmin([d.modname for d in cands]))
        d = cands[pick]
        out[key] = (d.modname, d.models[schemas[(d.modname, key...)]])
    end
    return out
end

"""
    ops(docs) -> (ops, params)

`(module, verb, kind, scope)` -> generated function name, plus the positional
argument names for the same key.

The kind is *not* the operation's own `x-kubernetes-group-version-kind`: on a
subresource path that extension names the subresource's type
(`pods/{name}/eviction` is `policy/v1 Eviction`, `pods/{name}/exec` is
`PodExecOptions`), which would collide with — or hide — the parent resource.
Instead the parent resource's kind comes from the bare `…/{plural}/{name}`
path, and a subresource gets a synthetic kind of parent + capitalized
subresource: `PodLog`, `PodStatus`, `DeploymentScale`. That reproduces the
operationId tails exactly, and it is how `:PodLog` (§5.4) enters the table
through the generic path rather than as a special case.
"""
function ops(docs::Vector{Doc})
    table = Dict{Tuple{String,Symbol,Symbol,Symbol},String}()
    params = Dict{Tuple{String,Symbol,Symbol,Symbol},Vector{Symbol}}()
    bodies = Dict{Tuple{String,Symbol,Symbol,Symbol},Tuple{String,Vector{String}}}()
    for d in docs
        prefix = path_prefix(d.gv)
        # first pass: the kind behind each (namespaced, plural) resource
        resource_kinds = Dict{Tuple{Bool,String},String}()
        for (path, item) in d.json["paths"]
            shape = path_shape(path, prefix)
            shape === nothing && continue
            isempty(shape.subresource) || continue
            for method in HTTP_METHODS
                op = get(item, method, nothing)
                op isa AbstractDict || continue
                gvk = get(op, "x-kubernetes-group-version-kind", nothing)
                gvk === nothing && continue
                haskey(ACTION_VERBS, get(op, "x-kubernetes-action", "")) || continue
                resource_kinds[(shape.namespaced, shape.plural)] = gvk["kind"]
            end
        end
        # second pass: the operations themselves
        for (path, item) in d.json["paths"]
            shape = path_shape(path, prefix)
            shape === nothing && continue
            parent = get(resource_kinds, (shape.namespaced, shape.plural), nothing)
            parent === nothing && continue
            kind = Symbol(parent * join(uppercasefirst.(shape.subresource)))
            for method in HTTP_METHODS
                op = get(item, method, nothing)
                op isa AbstractDict || continue
                verb = get(ACTION_VERBS, get(op, "x-kubernetes-action", ""), nothing)
                verb === nothing && continue
                opid = op["operationId"]
                fname = d.operations[opid]
                key = (d.modname, verb, kind, scope_of(shape, opid))
                if haskey(table, key) && table[key] != fname
                    error("ambiguous operation for $key: $(table[key]) vs $fname")
                end
                table[key] = fname
                params[key] = positional_params(path, op)
                haskey(d.bodies, opid) && (bodies[key] = d.bodies[opid])
            end
        end
    end
    return table, params, bodies
end

sortkey(k::Tuple{String,String}) = k
sortkey(k::Tuple{String,Symbol,Symbol,Symbol}) = (k[1], string(k[2]), string(k[3]), string(k[4]))

function emit(io::IO, docs::Vector{Doc})
    types = kind_types(docs)
    optable, opparams, opbodies = ops(docs)

    println(io, """
    # Generated by gen/openapi_v1/emit_registry.jl from the patched specs in
    # gen/openapi_v1/specs. Do not edit — rerun the pipeline instead
    # (fetch_specs.sh -> patch_k8s_spec.jq -> generate.jl -> emit_registry.jl).
    #
    # Kubernetes $(K8S_TAG[]), $(length(docs)) group modules.
    """)

    println(io, "\"\"\"\nGroup-version string (a k8s `apiVersion`) to the generated module serving it.\n\"\"\"")
    println(io, "const GROUP_MODULES = Dict{String,Module}(")
    for d in sort(docs; by = x -> x.gv)
        println(io, "    ", repr(d.gv), " => ", d.modname, ",")
    end
    println(io, ")\n")

    println(io, "\"\"\"\nInverse of [`GROUP_MODULES`]: each group module's own `apiVersion`.\n\"\"\"")
    println(io, "const MODULE_GVS = Dict{Module,String}(")
    for d in sort(docs; by = x -> x.modname)
        println(io, "    ", d.modname, " => ", repr(d.gv), ",")
    end
    println(io, ")\n")

    println(io, """
    \"\"\"
    `(apiVersion, kind)` to the generated model type, from every schema carrying
    `x-kubernetes-group-version-kind`. Replaces the old `Typedefs` aliases and
    `kuber_type`'s response sniffing, and gives exactly the addressable kinds
    rather than every model a `names()` scan would find.
    \"\"\"""")
    println(io, "const KIND_TYPES = Dict{Tuple{String,String},Type}(")
    for key in sort!(collect(keys(types)); by = sortkey)
        mod, T = types[key]
        println(io, "    (", repr(key[1]), ", ", repr(key[2]), ") => ", mod, ".", T, ",")
    end
    println(io, ")\n")

    println(io, """
    \"\"\"
    `(module, verb, kind, scope)` to the generated operation function, where
    `verb ∈ (:get, :list, :create, :replace, :patch, :delete, :deletecollection)`
    and `scope ∈ (:namespaced, :cluster, :allns)`. A build-time table: no `eval`,
    no `isdefined` probing, and a missing verb/kind is a clean lookup miss.
    \"\"\"""")
    println(io, "const OPS = Dict{Tuple{Module,Symbol,Symbol,Symbol},Function}(")
    for key in sort!(collect(keys(optable)); by = sortkey)
        mod, verb, kind, scope = key
        println(io, "    (", mod, ", ", repr(verb), ", ", repr(kind), ", ", repr(scope), ") => ",
                mod, ".", optable[key], ",")
    end
    println(io, ")\n")

    println(io, """
    \"\"\"
    Positional argument names for each [`OPS`] entry, in call order: path
    parameters in path order (namespace before name), then `:body`.
    \"\"\"""")
    println(io, "const OP_PARAMS = Dict{Tuple{Module,Symbol,Symbol,Symbol},Vector{Symbol}}(")
    for key in sort!(collect(keys(opparams)); by = sortkey)
        mod, verb, kind, scope = key
        println(io, "    (", mod, ", ", repr(verb), ", ", repr(kind), ", ", repr(scope), ") => ",
                repr(opparams[key]), ",")
    end
    println(io, ")\n")

    println(io, """
    \"\"\"
    For each [`OPS`] entry with a required request body, the generated body type
    and the media types the document accepts for it.

    `update!` needs both: a patch body has to be built as the generated `Patch`
    type (an open object) rather than handed over as a bare `Dict`, and k8s
    documents only the five patch media types for a PATCH — there is no plain
    `application/json` — so a wrong `content_type` can be reported as such
    instead of failing deep inside media selection.
    \"\"\"""")
    println(io, "const OP_BODIES = Dict{Tuple{Module,Symbol,Symbol,Symbol},Tuple{Type,Vector{String}}}(")
    for key in sort!(collect(keys(opbodies)); by = sortkey)
        mod, verb, kind, scope = key
        T, media = opbodies[key]
        println(io, "    (", mod, ", ", repr(verb), ", ", repr(kind), ", ", repr(scope), ") => (",
                mod, ".", T, ", ", repr(media), "),")
    end
    println(io, ")")
    return length(types), length(optable)
end

const K8S_TAG = Ref("unknown")

function main()
    origin = joinpath(SPECDIR, "SPECS_ORIGIN")
    if isfile(origin)
        m = match(r"tag (\S+)", readline(origin))
        m === nothing || (K8S_TAG[] = m.captures[1])
    end
    docs = load_docs()
    out = joinpath(OUTDIR, "registry.jl")
    ntypes, nops = open(io -> emit(io, docs), out, "w")
    @info "emitted registry.jl" modules = length(docs) kinds = ntypes operations = nops KiB =
        round(filesize(out) / 1024; digits = 1)
end

abspath(PROGRAM_FILE) == (@__FILE__) && main()
