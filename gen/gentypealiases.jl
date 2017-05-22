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
    for apiname in apinames
        if startswith(apiname, "Core")
            pfx = "IoK8sKubernetesPkgApi"
            typ = apiname[5:end]
        else
            pfx = "IoK8sKubernetesPkgApis"
            typ = apiname
        end

        push!(prefixes, (pfx * typ, apiname))
    end
    push!(prefixes, ("IoK8sKubernetesPkgApisRbacV1alpha1", "RbacAuthorizationV1alpha1"))
    push!(prefixes, ("IoK8sKubernetesPkgApisRbacV1beta1", "RbacAuthorizationV1beta1"))
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
