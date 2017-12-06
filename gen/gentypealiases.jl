include("../src/api/Kubernetes.jl")

function model_prefixes()
    apinames = String[]
    typemap = Dict{String,Vector{Pair{String,String}}}()
    modelnames = String[]

    for name in names(Kubernetes)
        sname = string(name)
        if endswith(sname, "Api")
            apiname = sname[1:(end-3)]
            if !isempty(apiname)
                push!(apinames, apiname)
                typemap[apiname] = Vector{Pair{String,String}}()
            end
        else
            push!(modelnames, sname)
        end
    end

    prefixes = []
    newapinames = [
        "Core", "Apps", "Batch", "Autoscaling", "Admissionregistration", "Authentication",
        "Authorization", "Certificates", "Extensions", "Networking", "Policy", "Scheduling",
        "Settings", "Storage", "Apis", "Apiregistration", "Apiextensions"
    ]
    for apiname in apinames
        suffix = apiname
        if startswith(apiname, "RbacAuthorization")
            pfx = "IoK8sApi"
            suffix = replace(apiname, "Authorization", "")
        elseif startswith(apiname, "Apiextensions")
            pfx = "IoK8sApiextensionsApiserverPkgApis"
        elseif startswith(apiname, "Apiregistration")
            pfx = "IoK8sKubeAggregatorPkgApis"
        elseif startswith(apiname, "Version")
            pfx = "IoK8sApimachineryPkg"
        elseif startswith(apiname, "Logs")
            pfx = "IoK8sApimachineryPkg"
        else
            pfx = "IoK8sKubernetesPkgApis"
            for n in newapinames
                if startswith(apiname, n)
                    pfx = "IoK8sApi"
                    break
                end
            end
        end
        push!(prefixes, (pfx * suffix, apiname))
    end
    push!(prefixes, ("IoK8sApimachineryPkgApi", "Apis"))
    push!(prefixes, ("IoK8sApimachineryPkgApisMetaV1", "Apis"))
    push!(prefixes, ("IoK8sApimachineryPkgUtil", "Apis"))
    reverse!(sort!(prefixes))

    for name in modelnames
        sname = string(name)
        for (pfx,typ) in prefixes
            if startswith(sname, pfx)
                push!(typemap[typ], sname => sname[(length(pfx)+1):end])
                break
            end
        end
    end

    open("../src/typealiases.jl", "w") do io
        println(io, "module Typedefs")
        println(io, "    using ..Kubernetes")
        println(io, "")
        println(io, "    const PFX = [")
        isfirst = true
        for (n,v) in prefixes
            println(io, "        ", isfirst ? "" : ",", "(\"$n\", :$v)")
            isfirst && (isfirst = false)
        end
        println(io, "    ]")
        println(io, "")
        for (name,val) in typemap
            isempty(val) && continue

            println(io, "    module ", name)
            println(io, "        using ..Kubernetes")
            for (t1,t2) in val
                println(io, "        const $t2 = Kubernetes.$t1")
            end
            println(io, "    end # module ", name)
        end
        println(io, "end # module Typedefs")
    end
end

model_prefixes()
