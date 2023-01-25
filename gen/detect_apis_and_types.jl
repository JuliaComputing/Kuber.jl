const rx_apiname = r"^struct ([a-zA-Z0-9_]*) <: OpenAPI.APIClientImpl$"
const rx_apipath = r"^_ctx = OpenAPI\.Clients\.Ctx\(_api\.client, \"[A-Z]+\", [_a-z0-9]+, .*\"([0-9a-z\/\._{}]+)\", .*\)$"
const rx_validapipath = r"^\/apis\/.+\/.+\/.*$"
const rx_coreapipath = r"^\/api\/(v[1-9])\/.*$"
const rx_apisapipath = r"^\/(apis)\/$"
const rx_methodexports = r"^function _oacinternal_([a-zA-Z0-9_-]+)\(_api::.*\)$"

const rx_model_api_returntype = r"^Regex\(.*\) => ([A-Za-z0-9]+),$"
const rx_model_api_bodytype = r"^function _oacinternal_.*\(_api::.*, body::([A-Za-z0-9]+).*\)$"

const rx_model_spec_name_from_docstring = r"^@doc raw\"\"\"([a-zA-Z\.0-9-_]+)$"
const rx_model_name_from_filename = r"model_([a-zA-Z0-9]+).jl"
const rx_model_name_from_modelfile = r"^.* # spec type: Union{ Nothing, ([A-Za-z0-9]+) }$"
const rx_model_name_from_modelfile_vector = r"^.* # spec type: Union{ Nothing, Vector{([A-Za-z0-9]+)} }$"

# function to_snake_case(camel_case_str::String)
#     s = replace(camel_case_str, r"([A-Z]+)([A-Z][a-z])" => s"\1_\2")
#     s = replace(s, r"([a-z\d])([A-Z])" => s"\1_\2")
#     replace(lowercase(s), r"[_\s]+" => "_")
# end

function to_snake_case(camel_case_str::String)
    iob = IOBuffer()
    for c in camel_case_str
        if isuppercase(c)
            (iob.size > 0) && write(iob, '_')
            write(iob, lowercase(c))
        else
            write(iob, c)
        end
    end
    String(take!(iob))
end

function detect_api_map(api_file::String)
    modeldir = abspath(joinpath(dirname(api_file), "..", "models"))
    apiname = ""
    apipaths = String[]
    methods = String[]
    models = String[]
    for line in eachline(api_file)
        line = strip(line)
        match_apiname = match(rx_apiname, line)
        match_apipath = match(rx_apipath, line)
        match_methodexports = match(rx_methodexports, line)
        match_model_api_returntype = match(rx_model_api_returntype, line)
        match_model_api_bodytype = match(rx_model_api_bodytype, line)
        if !isnothing(match_apiname)
            apiname = match_apiname.captures[1]
        elseif !isnothing(match_apipath)
            apipath = match_apipath.captures[1]
            if !isnothing(match(rx_validapipath, apipath))
                pathparts =  split(apipath, '/'; keepempty=false)[2:3]
                push!(apipaths, join(pathparts, '/'))
            elseif !isnothing(match(rx_coreapipath, apipath))
                push!(apipaths, match(rx_coreapipath, apipath).captures[1])
            elseif !isnothing(match(rx_apisapipath, apipath))
                push!(apipaths, match(rx_apisapipath, apipath).captures[1])
            end
        elseif !isnothing(match_methodexports)
            push!(methods, match_methodexports.captures[1])
        elseif !isnothing(match_model_api_returntype)
            push!(models, match_model_api_returntype.captures[1])
        elseif !isnothing(match_model_api_bodytype)
            push!(models, match_model_api_bodytype.captures[1])
        end
    end
    unique!(apipaths)
    filter!(!isempty, apipaths)
    unique!(methods)
    filter!(!isempty, methods)
    unique!(models)
    filter!(!isempty, models)
    filter!(x->isfile(joinpath(modeldir, string("model_", x, ".jl"))), models)
    @debug("detect_api_map", apiname, apipaths, methods, models)
    return apiname, apipaths, methods, models
end

function detect_model_map(model_file::String)
    model_spec_name = ""
    dependent_models = String[]
    for line in eachline(model_file)
        line = strip(line)
        match_modelname = match(rx_model_spec_name_from_docstring, line)
        match_dependent_modelname = match(rx_model_name_from_modelfile, line)
        match_dependent_modelname_from_vector = match(rx_model_name_from_modelfile_vector, line)
        if !isnothing(match_modelname)
            model_spec_name = match_modelname.captures[1]
        elseif !isnothing(match_dependent_modelname_from_vector)
            push!(dependent_models, match_dependent_modelname_from_vector.captures[1])
        elseif !isnothing(match_dependent_modelname)
            push!(dependent_models, match_dependent_modelname.captures[1])
        end
    end

    return model_spec_name, dependent_models
end

function detect_api_and_type_maps(apiimpl_dir::String)
    apis_path = joinpath(apiimpl_dir, "api", "apis")
    models_path = joinpath(apiimpl_dir, "api", "models")

    # maps api spec names to generated names, e.g. "settings.k8s.io/v1alpha1" => "SettingsV1alpha1Api"
    api_names = Dict{String,String}()
    # maps model generated names to spec names, e.g. "IoK8sApiCoreV1Pod" => "io.k8s.api.core.v1.Pod"
    model_names = Dict{String, String}()
    api_method_map = Dict{String, Vector{Pair{String,String}}}()
    api_models_map = Dict{String, Vector{String}}()
    model_models_map = Dict{String, Vector{String}}()

    for file in readdir(models_path)
        @debug("detect_api_and_type_maps", model_file=file)
        if endswith(file, ".jl")
            modelname = match(rx_model_name_from_filename, file).captures[1]
            model_spec_name, dependent_models = detect_model_map(joinpath(models_path, file))
            if !isempty(model_spec_name)
                model_names[modelname] = model_spec_name
            end
            if !isempty(dependent_models)
                deps = get!(model_models_map, modelname, String[])
                append!(deps, dependent_models)
            end
        end
    end

    for file in readdir(apis_path)
        @debug("detect_api_and_type_maps", api_file=file)
        if endswith(file, ".jl")
            apiname, apipaths, methods, models = detect_api_map(joinpath(apis_path, file))
            apiname_snake_case = to_snake_case(replace(apiname, r"Api$" => ""))
            if !isempty(apiname) && !isempty(apipaths) && length(apipaths) == 1
                apipath = apipaths[1]
                if !isempty(apipath)
                    api_names[apipath] = apiname
                end
                for method in methods
                    args = string("(_api::Kubernetes.", apiname, ", args...; kwargs...)")
                    to_name = replace(method, string("_", apiname_snake_case) => "")
                    to_method = string(replace(method, string("_", apiname_snake_case) => ""), args)
                    from_method = string("Kubernetes.", method, args)
                    map_for_name = get!(api_method_map, to_name) do
                        Pair{String,String}[]
                    end
                    push!(map_for_name, to_method => from_method)
                end
                map_for_models = get!(api_models_map, apiname) do
                    String[]
                end
                append!(map_for_models, models)
            end
        end
    end

    # add models of the unversioned ApisApi to all api-model maps
    apisapi_models = get(api_models_map, "ApisApi", String[])
    for (_, models) in api_models_map
        union!(models, apisapi_models)
    end

    # add all dependent models to the api-model map
    for (_, models) in api_models_map
        all_resolved = false
        while !all_resolved
            modelset = Set(models)
            initial_model_count = length(modelset)
            for model in models
                dependent_models = get(model_models_map, model, String[])
                union!(modelset, dependent_models)
            end
            empty!(models)
            append!(models, collect(modelset))
            if length(modelset) == initial_model_count
                all_resolved = true
            end
        end
    end

    open(joinpath(apiimpl_dir, "api_versions.jl"), "w") do f
        println(f, "const APIVersionMap = Dict(")
        for (n,v) in api_names
            println(f, "    \"$n\" => \"$v\",")
        end
        println(f, ")")
        for (to_name, map_for_name) in api_method_map
            println(f, "")
            println(f, "# ", to_name)
            for pair in map_for_name
                println(f, pair[1], " = ", pair[2])
            end
        end
    end

    open(joinpath(apiimpl_dir, "api_typemap.jl"), "w") do f
        println(f, "module Typedefs")
        println(f, "    using ..Kubernetes")
        for (apiname, models) in api_models_map
            println(f, "    module ", replace(apiname, r"Api$" => ""))
            println(f, "        using ..Kubernetes")
            for model in models
                model_spec_name = last(split(model_names[model], '.'))
                println(f, "        const ", model_spec_name, " = Kubernetes.", model)
            end
            println(f, "    end")
        end
        println(f, "end")
    end
end

@assert length(ARGS) == 1
detect_api_and_type_maps(ARGS[1])