"""
To consolidate all discovered OpenAPI endpoint specifications:
- Ensure all required CRDs are applied on the k8s server
- Preferably use `kubectl proxy` temporarily to avoid having to install certificates
- Run `julia -e 'include("K8sOpenAPISpec.jl"); K8sOpenAPISpec.get_specification()'`. This should create a file named `k8s.json` with all discovered OpenAPI specifications included.

To display all discovered API versions in a generated `k8s.json` file:
- Run `julia -e 'include("K8sOpenAPISpec.jl"); K8sOpenAPISpec.show_api_versions()'`
"""
module K8sOpenAPISpec

using Downloads
using JSON
using YAML

const DEFAULT_API_SERVER = "http://localhost:8001"
const API_DISCOVERY = "/openapi/v3"

function fetch_json(url::String)
    iob = IOBuffer()
    Downloads.download(url, iob)
    return JSON.parse(String(take!(iob)))
end

function discover_apis(api_server::String=DEFAULT_API_SERVER)
    api_discovery_url = string(api_server, API_DISCOVERY)
    api_discovery = fetch_json(api_discovery_url)
    api_discovery["paths"]
end

function merge_l1!(merged_spec::Dict{String,Any}, spec::Dict{String,Any}, key::String)
    haskey(spec, key) || return
    if haskey(merged_spec, key)
        merge!(merged_spec[key], spec[key])
    else
        merged_spec[key] = spec[key]
    end
    return merged_spec
end

function merge_l2(merged_spec::Dict{String,Any}, spec::Dict{String,Any}, key1::String)
    haskey(spec, key1) || return

    if !haskey(merged_spec, key1)
        merged_spec[key1] = Dict{String,Any}()
    end

    for key2 in keys(spec[key1])
        merge_l1!(merged_spec[key1], spec[key1], key2)
    end
    return merged_spec
end

function merge_array!(merged_spec::Dict{String,Any}, spec::Dict{String,Any}, key::String)
    if haskey(spec, key)
        if haskey(merged_spec, key)
            merged_spec[key] = vcat(merged_spec[key], spec[key])
        else
            merged_spec[key] = spec[key]
        end
    end
    return merged_spec
end

function merge_spec!(merged_spec::Dict{String,Any}, spec::Dict{String,Any})
    # /openapi
    haskey(spec, "openapi") && (merged_spec["openapi"] = spec["openapi"])

    # /info
    merge_l1!(merged_spec, spec, "info")
    # /externalDocs
    merge_l1!(merged_spec, spec, "externalDocs")

    # /servers
    merge_array!(merged_spec, spec, "servers")
    # /tags
    merge_array!(merged_spec, spec, "tags")

    # /paths/{path}/{method}
    merge_l2(merged_spec, spec, "paths")

    # /components/schemas/{schema}
    # /components/responses/{response}
    # /components/parameters/{parameter}
    # /components/securitySchemes/{securityScheme}
    merge_l2(merged_spec, spec, "components")

    # /definitions/{definition}
    merge_l1!(merged_spec, spec, "definitions")
    # /securityDefinitions/{securityDefinition}
    merge_l1!(merged_spec, spec, "securityDefinitions")
    # /security (merge arrays)
    merge_array!(merged_spec, spec, "security")

    return merged_spec
end

function create_merged_spec(api_server::String=DEFAULT_API_SERVER)
    paths = discover_apis(api_server)
    merged_spec = Dict{String,Any}()
    for name in keys(paths)
        @info("merging $name")
        url = string(api_server, paths[name]["serverRelativeURL"])
        api_spec = fetch_json(url)
        merge_spec!(merged_spec, api_spec)
    end
    if !haskey(merged_spec, "openapi")
        merged_spec["openapi"] = "3.0.0"
    end
    return merged_spec
end

"""
    get_specification(; outfile::String="k8s.json", api_server::String=DEFAULT_API_SERVER)

Consolidate all discovered OpenAPI endpoint specifications and write them to a file.

Keyword arguments:
- `outfile::String`: The file to write the OpenAPI specification to. Defaults to `k8s.json`.
- `api_server::String`: The URL of the k8s API server. Defaults to `http://localhost:8001`.
"""
function get_specification(; outfile::String="k8s.json", api_server::String=DEFAULT_API_SERVER)
    merged_spec = create_merged_spec(api_server)
    open(outfile, "w") do f
        JSON.print(f, merged_spec, 2)
    end
end

"""
    merge_specifications(folder::String; outfile::String="k8s.json")

Merge all JSON files in a given folder into a single OpenAPI specification.

Arguments:
- `folder::String`: The folder to read the JSON files from.

Keyword arguments:
- `outfile::String`: The file to write the OpenAPI specification to. Defaults to `k8s.json`.
"""
function merge_specifications(folder::String; outfile::String="k8s.json")
    merged_spec = Dict{String,Any}()
    for file in readdir(folder)
        if endswith(file, ".json")
            spec = JSON.parsefile(joinpath(folder, file))
        elseif endswith(file, ".yaml")
            spec = YAML.load_file(joinpath(folder, file))
        else
            continue
        end
        @info("merging $file")
        merge_spec!(merged_spec, convert(Dict{String,Any}, spec))
    end
    if !haskey(merged_spec, "openapi")
        merged_spec["openapi"] = "3.0.0"
    end
    open(outfile, "w") do f
        JSON.print(f, merged_spec, 2)
    end
end

"""
    show_api_versions(specification::Dict{String,Any})

Display all discovered API versions in a given OpenAPI specification.

Arguments:
- `specification::Dict{String,Any}`: The OpenAPI specification to read the API versions from.
"""
function show_api_versions(specification::Dict{String,Any})
    tags = Set{String}()
    for path in keys(specification["paths"])
        for op in keys(specification["paths"][path])
            if !isa(specification["paths"][path][op], Dict)
                # @warn("possible invalid specification: /paths/$path/$op")
                continue
            end
            if haskey(specification["paths"][path][op], "tags")
                for tag in specification["paths"][path][op]["tags"]
                    push!(tags, tag)
                end
            end
        end
    end
    sorted_tags = sort(collect(tags))
    for tag in sorted_tags
        println(tag)
    end
end

"""
    show_api_versions(; specification_file::String="k8s.json")

Display all discovered API versions in a generated `k8s.json` file.

Keyword arguments:
- `specification_file::String`: The JSON file to read the OpenAPI specification from. Defaults to `k8s.json`.
"""
function show_api_versions(; specification_file::String="k8s.json")
    specification = JSON.parsefile(specification_file)
    show_api_versions(specification)
end

end # module K8sOpenAPISpec
