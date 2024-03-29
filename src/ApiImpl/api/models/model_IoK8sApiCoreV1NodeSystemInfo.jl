# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.core.v1.NodeSystemInfo
NodeSystemInfo is a set of ids/uuids to uniquely identify the node.

    IoK8sApiCoreV1NodeSystemInfo(;
        architecture=nothing,
        bootID=nothing,
        containerRuntimeVersion=nothing,
        kernelVersion=nothing,
        kubeProxyVersion=nothing,
        kubeletVersion=nothing,
        machineID=nothing,
        operatingSystem=nothing,
        osImage=nothing,
        systemUUID=nothing,
    )

    - architecture::String : The Architecture reported by the node
    - bootID::String : Boot ID reported by the node.
    - containerRuntimeVersion::String : ContainerRuntime Version reported by the node through runtime remote API (e.g. docker://1.5.0).
    - kernelVersion::String : Kernel Version reported by the node from &#39;uname -r&#39; (e.g. 3.16.0-0.bpo.4-amd64).
    - kubeProxyVersion::String : KubeProxy Version reported by the node.
    - kubeletVersion::String : Kubelet Version reported by the node.
    - machineID::String : MachineID reported by the node. For unique machine identification in the cluster this field is preferred. Learn more from man(5) machine-id: http://man7.org/linux/man-pages/man5/machine-id.5.html
    - operatingSystem::String : The Operating System reported by the node
    - osImage::String : OS Image reported by the node from /etc/os-release (e.g. Debian GNU/Linux 7 (wheezy)).
    - systemUUID::String : SystemUUID reported by the node. For unique machine identification MachineID is preferred. This field is specific to Red Hat hosts https://access.redhat.com/documentation/en-US/Red_Hat_Subscription_Management/1/html/RHSM/getting-system-uuid.html
"""
Base.@kwdef mutable struct IoK8sApiCoreV1NodeSystemInfo <: OpenAPI.APIModel
    architecture::Union{Nothing, String} = nothing
    bootID::Union{Nothing, String} = nothing
    containerRuntimeVersion::Union{Nothing, String} = nothing
    kernelVersion::Union{Nothing, String} = nothing
    kubeProxyVersion::Union{Nothing, String} = nothing
    kubeletVersion::Union{Nothing, String} = nothing
    machineID::Union{Nothing, String} = nothing
    operatingSystem::Union{Nothing, String} = nothing
    osImage::Union{Nothing, String} = nothing
    systemUUID::Union{Nothing, String} = nothing

    function IoK8sApiCoreV1NodeSystemInfo(architecture, bootID, containerRuntimeVersion, kernelVersion, kubeProxyVersion, kubeletVersion, machineID, operatingSystem, osImage, systemUUID, )
        OpenAPI.validate_property(IoK8sApiCoreV1NodeSystemInfo, Symbol("architecture"), architecture)
        OpenAPI.validate_property(IoK8sApiCoreV1NodeSystemInfo, Symbol("bootID"), bootID)
        OpenAPI.validate_property(IoK8sApiCoreV1NodeSystemInfo, Symbol("containerRuntimeVersion"), containerRuntimeVersion)
        OpenAPI.validate_property(IoK8sApiCoreV1NodeSystemInfo, Symbol("kernelVersion"), kernelVersion)
        OpenAPI.validate_property(IoK8sApiCoreV1NodeSystemInfo, Symbol("kubeProxyVersion"), kubeProxyVersion)
        OpenAPI.validate_property(IoK8sApiCoreV1NodeSystemInfo, Symbol("kubeletVersion"), kubeletVersion)
        OpenAPI.validate_property(IoK8sApiCoreV1NodeSystemInfo, Symbol("machineID"), machineID)
        OpenAPI.validate_property(IoK8sApiCoreV1NodeSystemInfo, Symbol("operatingSystem"), operatingSystem)
        OpenAPI.validate_property(IoK8sApiCoreV1NodeSystemInfo, Symbol("osImage"), osImage)
        OpenAPI.validate_property(IoK8sApiCoreV1NodeSystemInfo, Symbol("systemUUID"), systemUUID)
        return new(architecture, bootID, containerRuntimeVersion, kernelVersion, kubeProxyVersion, kubeletVersion, machineID, operatingSystem, osImage, systemUUID, )
    end
end # type IoK8sApiCoreV1NodeSystemInfo

const _property_types_IoK8sApiCoreV1NodeSystemInfo = Dict{Symbol,String}(Symbol("architecture")=>"String", Symbol("bootID")=>"String", Symbol("containerRuntimeVersion")=>"String", Symbol("kernelVersion")=>"String", Symbol("kubeProxyVersion")=>"String", Symbol("kubeletVersion")=>"String", Symbol("machineID")=>"String", Symbol("operatingSystem")=>"String", Symbol("osImage")=>"String", Symbol("systemUUID")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiCoreV1NodeSystemInfo }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1NodeSystemInfo[name]))}

function check_required(o::IoK8sApiCoreV1NodeSystemInfo)
    o.architecture === nothing && (return false)
    o.bootID === nothing && (return false)
    o.containerRuntimeVersion === nothing && (return false)
    o.kernelVersion === nothing && (return false)
    o.kubeProxyVersion === nothing && (return false)
    o.kubeletVersion === nothing && (return false)
    o.machineID === nothing && (return false)
    o.operatingSystem === nothing && (return false)
    o.osImage === nothing && (return false)
    o.systemUUID === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCoreV1NodeSystemInfo }, name::Symbol, val)
end
