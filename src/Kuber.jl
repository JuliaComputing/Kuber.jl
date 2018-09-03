module Kuber

using JSON
using Swagger
using HTTP

include("api/Kubernetes.jl")
using .Kubernetes
import .Kubernetes: getAPIVersions

import Base: convert, get, put!, delete!, show
import Swagger: SwaggerModel

include("typealiases.jl")
include("apialiases.jl")
include("helpers.jl")
include("simpleapi.jl")

export KuberContext, set_server, set_ns, get_server, get_ns, kuber_type, kuber_obj, @K_str
export get, put!, update!, delete!, sel, get_logs

end # module
