## Generate OpenAPI Client

Use the bundled `generate.sh` script to generate OpenAPI client implementations.

- Fetch the OpenAPI v2 (Swagger) specification from the `/openapi/v2` endpoint of a running k8s api server
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
