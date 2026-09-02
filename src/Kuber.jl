module Kuber

using JSON
using OpenAPI
using HTTP

include("ApiImpl/ApiImpl.jl")

import Base: get, put!, delete!, show, showerror

include("helpers.jl")
include("simpleapi.jl")

export KuberContext, KuberEvent, KuberException, set_server, set_ns, set_retries
export get_server, get_ns, get_timeout, set_timeout, with_timeout
export get_request_options, set_request_options
export kind_to_type, kuber_type, kuber_obj, kuber_kind, kuber_props
export get, list, watch, put!, update!, delete!, sel, get_logs
export list_namespaced_custom_metrics, list_custom_metrics

end # module
