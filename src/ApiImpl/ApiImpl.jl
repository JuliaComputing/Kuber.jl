module ApiImpl

using Swagger

include("api/Kubernetes.jl")
using .Kubernetes
import .Kubernetes: getAPIVersions

import Base: convert, get, put!, delete!, show
import Swagger: SwaggerModel

include("typealiases.jl")
include("apialiases.jl")

end # module
