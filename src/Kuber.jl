__precompile__(true)

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

export KuberContext, set_server, set_ns, kuber_type, kuber_obj, @K_str
export ComponentStatus, Endpoints, Namespace, Pod, PodTemplate, ReplicationController, Service, PersistentVolume, PersistentVolumeClaim, Job, Secret, ResourceQuota
export get, put!, update!, delete!, sel

end # module
