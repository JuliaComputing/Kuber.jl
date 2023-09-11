## Generate OpenAPI Client

Use the bundled `generate.sh` script to generate OpenAPI client implementations.

- Fetch the OpenAPI v2 (Swagger) specification from the `/openapi/v2` endpoint of a running k8s api server. For K8s servers that serve only the OpenAPI v3 specifications, use the included [K8sOpenAPISpec.jl](K8sOpenAPISpec.jl) script to consolidate specs from the API discovery endpoints into a single specfification file.
    - Ensure the k8s server has all the required CRDs installed
    - The specification file must be named `swagger.json`. It can be stored in any location, but store it in the `spec` folder if you wish to update the Kuber.jl package itself
- The k8s OpenAPI spec uses a custom `int-or-string` format, that needs to be tweaked in the specification to be able to generate it correctly (see: https://github.com/kubernetes/kube-openapi/issues/52)
    - Open the downloaded spec and change the type of `io.k8s.apimachinery.pkg.util.intstr.IntOrString` from `string` to `object`
- Ensure:
    - `julia` is in `PATH` or set in environment variable `JULIA`
    - `java` is in `PATH` or set in environment variable `JAVA_CMD`
    - `openapi-generator-cli.jar` is in `CLASSPATH` or set in environment variable `JAVA_CMD`
    - package directory is writable
- Run `generate.sh <path to kubernetes specifications folder> [output path]`
    - output path is optional, if not specified `../src/ApiImpl/api` folder relative to this script will be used
- Note:
    - the `api` folder in the output path will be renamed to `api_bak`
    - existing `api_bak` folder if any in output folder will be deleted

## List Supported API Versions

The included [K8sOpenAPISpec.jl](K8sOpenAPISpec.jl) script can be used to list the supported APIs and their versions from a given K8s OpenAPI specification.

## K8sOpenAPISpec

A standalone tool included to help in generating the API OpenAPI client from Kubernetes OpenAPI specifications.

### `get_specification(; outfile::String="k8s.json", api_server::String=DEFAULT_API_SERVER)`

Consolidate all discovered OpenAPI endpoint specifications and write them to a file.

Keyword arguments:
- `outfile::String`: The file to write the OpenAPI specification to. Defaults to `k8s.json`.
- `api_server::String`: The URL of the k8s API server. Defaults to `http://localhost:8001`.

### `merge_specifications(folder::String; outfile::String="k8s.json")`

Merge all JSON files in a given folder into a single OpenAPI specification.

Arguments:
- `folder::String`: The folder to read the JSON files from.

Keyword arguments:
- `outfile::String`: The file to write the OpenAPI specification to. Defaults to `k8s.json`.

### `show_api_versions(; specification_file::String="k8s.json")`

Display all discovered API versions in a generated `k8s.json` file.

Keyword arguments:
- `specification_file::String`: The JSON file to read the OpenAPI specification from. Defaults to `k8s.json`.

### show_api_versions(specification::Dict{String,Any})

Display all discovered API versions in a given OpenAPI specification.

Arguments:
- `specification::Dict{String,Any}`: The OpenAPI specification to read the API versions from.
