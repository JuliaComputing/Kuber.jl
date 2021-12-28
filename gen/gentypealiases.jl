using CSTParser

"""
List of all aliases parsed.
Used to maintain state and write out the aliases file at the end.
"""
const KuberTypeAliasesSet = Dict{String,Set{String}}
const KuberTypeAliasesUnique = Dict{String,Vector{Pair{String,String}}}
const BaseTypes = ("String", "Float64", "Float32", "Int", "Int64", "Int32", "Int16", "UInt", "UInt64", "UInt32", "UInt16", "DateTime", "Bool", "Nothing")
const ModelPrefixes = ("IoK8sApimachineryPkgApis", "IoK8sApimachineryPkg", "IoK8sApi", "IoK8sKubeAggregatorPkgApis", "IoK8sApiextensionsApiserverPkgApis")

function get_swagger_ctx_call_return_type(fn_body)
    all_calls = findall(x->(x.typ === CSTParser.BinaryOpCall), fn_body.args)
    for nidx in all_calls
        ncall = fn_body.args[nidx]
        fc = ncall.args[3]
        if CSTParser.is_func_call(fc)
            binop = fc.args[1]
            if binop.typ === CSTParser.BinaryOpCall
                if (CSTParser.str_value(binop.args[1]) == "Swagger") && CSTParser.is_dot(binop.args[2]) && (binop.args[3].typ === CSTParser.Quotenode) && (CSTParser.str_value(binop.args[3].args[1]) == "Ctx")
                    if (length(fc.args) > 6) && CSTParser.isidentifier(fc.args[7])
                        return CSTParser.str_value(fc.args[7])
                    end
                end
            end
        end
    end
    nothing
end

"""
Adds Swagger API call return types to be aliased to undecorated names.
"""
function emit_alias(fn_expr::CSTParser.EXPR, api_decoration::String, aliases::KuberTypeAliasesSet)
    fn_body = CSTParser.get_body(fn_expr)
    return_type = get_swagger_ctx_call_return_type(fn_body)
    ((nothing === return_type) || (return_type in BaseTypes)) && return
    push!(get!(()->Set{String}(), aliases, api_decoration), return_type)
    nothing
end

"""
Populates all models refered to by API groups detected in the specified file.
"""
function kuberapitypes(file::String, aliases_set::KuberTypeAliasesSet)
    x, ps = CSTParser.parse(ParseState(String(readchomp(file))))
    api_decoration = ""

    while !ps.done
        structsig = nothing
        if CSTParser.defines_struct(x)
            structsig = CSTParser.get_sig(x)
        elseif x.typ == CSTParser.MacroCall && CSTParser.str_value(x[1]) == "@doc"
            structsig = CSTParser.get_sig(x[3])
        end

        if structsig !== nothing
            if structsig.typ === CSTParser.BinaryOpCall
                op = structsig.args[2]
                if CSTParser.is_issubt(op)
                    subtyp = CSTParser.str_value(CSTParser.get_name(structsig.args[3]))
                    if subtyp == "SwaggerApi"
                        typename = CSTParser.str_value(CSTParser.get_name(structsig.args[1]))
                        if endswith(typename, "Api")
                            api_decoration = typename[1:(end-3)]
                        end
                    end
                end
            end
        elseif !isempty(api_decoration)
            # Note: We are guaranteed to receive the struct definition before methods
            #       because of the sequence in which Swagger code is generated and also
            #       because of the Julia restriction of type being defined before use
            fn_expr = ((x.typ === CSTParser.MacroCall) && CSTParser.defines_function(x.args[3])) ? x.args[3] : CSTParser.defines_function(x) ? x : nothing
            if fn_expr !== nothing
                emit_alias(fn_expr, api_decoration, aliases_set)
            end
        end
        x, ps = CSTParser.parse(ps)
    end
    nothing
end

function find_matching_api(sorted_apis::Vector{String}, model_name::String)
    rbac_apis = map(x->startswith(x, "RbacAuthorization") ? replace(x, "Authorization"=>"") : x, sorted_apis)
    flowcontrol_apis = map(x->startswith(x, "FlowcontrolApiserver") ? replace(x, "Apiserver"=>"") : x, sorted_apis)

    for apis in (sorted_apis, rbac_apis, flowcontrol_apis)
        for pfx in ModelPrefixes
            api_idx = findfirst(x->startswith(model_name, pfx*x), apis)
            (api_idx !== nothing) && (return api_idx)
        end
    end
    nothing
end

function get_common_name(sorted_apis::Vector{String}, model_name::String)
    rbac_apis = map(x->startswith(x, "RbacAuthorization") ? replace(x, "Authorization"=>"") : x, sorted_apis)
    flowcontrol_apis = map(x->startswith(x, "FlowcontrolApiserver") ? replace(x, "Apiserver"=>"") : x, sorted_apis)

    for apis in (sorted_apis, rbac_apis, flowcontrol_apis)
        for pfx in ModelPrefixes
            api_idx = findfirst(x->startswith(model_name, pfx*x), apis)
            (api_idx !== nothing) && (return replace(model_name, (pfx*apis[api_idx])=>""))
        end
    end
    nothing
end

function kubermodeltypes(file::String, sorted_apis::Vector{String}, aliases_set::KuberTypeAliasesSet, unmapped::Set{String})
    x, ps = CSTParser.parse(ParseState(String(readchomp(file))))
    
    while !ps.done
        structsig = nothing
        if CSTParser.defines_struct(x)
            structsig = CSTParser.get_sig(x)
        elseif x.typ == CSTParser.MacroCall && CSTParser.str_value(x[1]) == "@doc"
            structsig = CSTParser.get_sig(x[3])
        end

        if structsig !== nothing
            model_name = CSTParser.str_value(CSTParser.get_name(structsig.args[1]))
            if !startswith(model_name, "IoK8sKubernetes") && !(model_name == "IoK8sApimachineryPkgRuntimeRawExtension")
                api_idx = find_matching_api(sorted_apis, model_name)
                if api_idx !== nothing
                    push!(aliases_set[sorted_apis[api_idx]], model_name)
                else
                    push!(unmapped, model_name)
                end
            end
        end
        x, ps = CSTParser.parse(ps)
    end
end

function detect_aliases(folder::String)
    aliases_set = KuberTypeAliasesSet()
    unmapped = Set{String}()

    for file in filter(x->startswith(x, "api_"), readdir(folder))
        @info("    - " * file)
        kuberapitypes(joinpath(folder, file), aliases_set)
    end

    # inject pseudo APIs (Meta is an alias of Core)
    get!(()->Set{String}(), aliases_set, "MetaV1")
    # sort in order of search (ordered by version numbers)
    sorted_apis = reverse!(sort!(collect(keys(aliases_set))))

    for file in filter(x->startswith(x, "model_"), readdir(folder))
        @info("    - " * file)
        kubermodeltypes(joinpath(folder, file), sorted_apis, aliases_set, unmapped)
    end

    # merge Meta with Core
    union!(aliases_set["CoreV1"], aliases_set["MetaV1"])

    @info("got $(length(aliases_set)) sets with $(sum(map(length, values(aliases_set)))) aliases")
    for n in unmapped
        @info("could not place model " * n)
    end
    aliases_set
end

function map_to_common_names(aliases_set::KuberTypeAliasesSet)
    sorted_apis = reverse!(sort!(collect(keys(aliases_set))))
    cnames = KuberTypeAliasesUnique()

    for (api_name, model_names) in aliases_set
        namesmap = get!(()->Vector{Pair{String,String}}(), cnames, api_name)
        for model_name in model_names
            cn = get_common_name(sorted_apis, model_name)
            existing_names = map(x->x[1], namesmap)
            (cn in existing_names) && error("duplicate name found", cn, api_name)
            push!(namesmap, cn=>model_name)
        end
    end
    cnames
end

function gen_aliases(folder::String, output::String)
    @info("reading $folder/api_*.jl")
    @info("generating $output")

    aliases_set = detect_aliases(folder)
    cnames = map_to_common_names(aliases_set)

    open("$output", "w") do faliases
        println(faliases, "module Typedefs")
        println(faliases, "    using ..Kubernetes")
        for (n,s) in cnames
            println(faliases, "    module ", n)
            println(faliases, "        using ..Kubernetes")
            for v in s
                println(faliases, "        const ", v[1], " = Kubernetes.", v[2])
            end
            println(faliases, "    end # module ", n)
        end
        println(faliases, "end # module Typedefs")
    end
end

function main()
    DIR = dirname(@__FILE__)
    gen_aliases(joinpath(DIR, "../src/ApiImpl/api"), joinpath(DIR, "../src/ApiImpl/typealiases.jl"))
end

main()
