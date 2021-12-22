module Kuber

using JSON
using Swagger
using Downloads

include("ApiImpl/ApiImpl.jl")

import Base: convert, get, put!, delete!, show
import Swagger: SwaggerModel

include("helpers.jl")
include("simpleapi.jl")

export KuberContext, set_server, set_ns, set_retries, get_server, get_ns, kuber_type, kuber_obj, @K_str
export get, list, watch, put!, update!, delete!, sel, get_logs, list_namespaced_custom_metrics, list_custom_metrics

end # module
