module Kuber

using JSON
using Swagger
using HttpCommon

include("api/Kubernetes.jl")
using .Kubernetes

import Base: convert, get, put!, delete!
import Swagger: SwaggerModel

include("typealiases.jl")
include("helpers.jl")
include("simpleapi.jl")

export set_server, set_ns, @K_str
export ComponentStatus, Endpoints, Namespace, Pod, PodTemplate, ReplicationController, Service, PersistentVolume, PersistentVolumeClaim
export get, put!, update!, delete!

end # module
