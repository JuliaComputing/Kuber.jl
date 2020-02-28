# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiCoreV1PodSpec <: SwaggerModel
    activeDeadlineSeconds::Any # spec type: Union{ Nothing, Int64 } # spec name: activeDeadlineSeconds
    affinity::Any # spec type: Union{ Nothing, IoK8sApiCoreV1Affinity } # spec name: affinity
    automountServiceAccountToken::Any # spec type: Union{ Nothing, Bool } # spec name: automountServiceAccountToken
    containers::Any # spec type: Union{ Nothing, Vector{IoK8sApiCoreV1Container} } # spec name: containers
    dnsConfig::Any # spec type: Union{ Nothing, IoK8sApiCoreV1PodDNSConfig } # spec name: dnsConfig
    dnsPolicy::Any # spec type: Union{ Nothing, String } # spec name: dnsPolicy
    enableServiceLinks::Any # spec type: Union{ Nothing, Bool } # spec name: enableServiceLinks
    ephemeralContainers::Any # spec type: Union{ Nothing, Vector{IoK8sApiCoreV1EphemeralContainer} } # spec name: ephemeralContainers
    hostAliases::Any # spec type: Union{ Nothing, Vector{IoK8sApiCoreV1HostAlias} } # spec name: hostAliases
    hostIPC::Any # spec type: Union{ Nothing, Bool } # spec name: hostIPC
    hostNetwork::Any # spec type: Union{ Nothing, Bool } # spec name: hostNetwork
    hostPID::Any # spec type: Union{ Nothing, Bool } # spec name: hostPID
    hostname::Any # spec type: Union{ Nothing, String } # spec name: hostname
    imagePullSecrets::Any # spec type: Union{ Nothing, Vector{IoK8sApiCoreV1LocalObjectReference} } # spec name: imagePullSecrets
    initContainers::Any # spec type: Union{ Nothing, Vector{IoK8sApiCoreV1Container} } # spec name: initContainers
    nodeName::Any # spec type: Union{ Nothing, String } # spec name: nodeName
    nodeSelector::Any # spec type: Union{ Nothing, Dict{String, String} } # spec name: nodeSelector
    overhead::Any # spec type: Union{ Nothing, Dict{String, IoK8sApimachineryPkgApiResourceQuantity} } # spec name: overhead
    preemptionPolicy::Any # spec type: Union{ Nothing, String } # spec name: preemptionPolicy
    priority::Any # spec type: Union{ Nothing, Int32 } # spec name: priority
    priorityClassName::Any # spec type: Union{ Nothing, String } # spec name: priorityClassName
    readinessGates::Any # spec type: Union{ Nothing, Vector{IoK8sApiCoreV1PodReadinessGate} } # spec name: readinessGates
    restartPolicy::Any # spec type: Union{ Nothing, String } # spec name: restartPolicy
    runtimeClassName::Any # spec type: Union{ Nothing, String } # spec name: runtimeClassName
    schedulerName::Any # spec type: Union{ Nothing, String } # spec name: schedulerName
    securityContext::Any # spec type: Union{ Nothing, IoK8sApiCoreV1PodSecurityContext } # spec name: securityContext
    serviceAccount::Any # spec type: Union{ Nothing, String } # spec name: serviceAccount
    serviceAccountName::Any # spec type: Union{ Nothing, String } # spec name: serviceAccountName
    shareProcessNamespace::Any # spec type: Union{ Nothing, Bool } # spec name: shareProcessNamespace
    subdomain::Any # spec type: Union{ Nothing, String } # spec name: subdomain
    terminationGracePeriodSeconds::Any # spec type: Union{ Nothing, Int64 } # spec name: terminationGracePeriodSeconds
    tolerations::Any # spec type: Union{ Nothing, Vector{IoK8sApiCoreV1Toleration} } # spec name: tolerations
    topologySpreadConstraints::Any # spec type: Union{ Nothing, Vector{IoK8sApiCoreV1TopologySpreadConstraint} } # spec name: topologySpreadConstraints
    volumes::Any # spec type: Union{ Nothing, Vector{IoK8sApiCoreV1Volume} } # spec name: volumes

    function IoK8sApiCoreV1PodSpec(;activeDeadlineSeconds=nothing, affinity=nothing, automountServiceAccountToken=nothing, containers=nothing, dnsConfig=nothing, dnsPolicy=nothing, enableServiceLinks=nothing, ephemeralContainers=nothing, hostAliases=nothing, hostIPC=nothing, hostNetwork=nothing, hostPID=nothing, hostname=nothing, imagePullSecrets=nothing, initContainers=nothing, nodeName=nothing, nodeSelector=nothing, overhead=nothing, preemptionPolicy=nothing, priority=nothing, priorityClassName=nothing, readinessGates=nothing, restartPolicy=nothing, runtimeClassName=nothing, schedulerName=nothing, securityContext=nothing, serviceAccount=nothing, serviceAccountName=nothing, shareProcessNamespace=nothing, subdomain=nothing, terminationGracePeriodSeconds=nothing, tolerations=nothing, topologySpreadConstraints=nothing, volumes=nothing)
        o = new()
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("activeDeadlineSeconds"), activeDeadlineSeconds)
        setfield!(o, Symbol("activeDeadlineSeconds"), activeDeadlineSeconds)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("affinity"), affinity)
        setfield!(o, Symbol("affinity"), affinity)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("automountServiceAccountToken"), automountServiceAccountToken)
        setfield!(o, Symbol("automountServiceAccountToken"), automountServiceAccountToken)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("containers"), containers)
        setfield!(o, Symbol("containers"), containers)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("dnsConfig"), dnsConfig)
        setfield!(o, Symbol("dnsConfig"), dnsConfig)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("dnsPolicy"), dnsPolicy)
        setfield!(o, Symbol("dnsPolicy"), dnsPolicy)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("enableServiceLinks"), enableServiceLinks)
        setfield!(o, Symbol("enableServiceLinks"), enableServiceLinks)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("ephemeralContainers"), ephemeralContainers)
        setfield!(o, Symbol("ephemeralContainers"), ephemeralContainers)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("hostAliases"), hostAliases)
        setfield!(o, Symbol("hostAliases"), hostAliases)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("hostIPC"), hostIPC)
        setfield!(o, Symbol("hostIPC"), hostIPC)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("hostNetwork"), hostNetwork)
        setfield!(o, Symbol("hostNetwork"), hostNetwork)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("hostPID"), hostPID)
        setfield!(o, Symbol("hostPID"), hostPID)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("hostname"), hostname)
        setfield!(o, Symbol("hostname"), hostname)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("imagePullSecrets"), imagePullSecrets)
        setfield!(o, Symbol("imagePullSecrets"), imagePullSecrets)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("initContainers"), initContainers)
        setfield!(o, Symbol("initContainers"), initContainers)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("nodeName"), nodeName)
        setfield!(o, Symbol("nodeName"), nodeName)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("nodeSelector"), nodeSelector)
        setfield!(o, Symbol("nodeSelector"), nodeSelector)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("overhead"), overhead)
        setfield!(o, Symbol("overhead"), overhead)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("preemptionPolicy"), preemptionPolicy)
        setfield!(o, Symbol("preemptionPolicy"), preemptionPolicy)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("priority"), priority)
        setfield!(o, Symbol("priority"), priority)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("priorityClassName"), priorityClassName)
        setfield!(o, Symbol("priorityClassName"), priorityClassName)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("readinessGates"), readinessGates)
        setfield!(o, Symbol("readinessGates"), readinessGates)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("restartPolicy"), restartPolicy)
        setfield!(o, Symbol("restartPolicy"), restartPolicy)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("runtimeClassName"), runtimeClassName)
        setfield!(o, Symbol("runtimeClassName"), runtimeClassName)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("schedulerName"), schedulerName)
        setfield!(o, Symbol("schedulerName"), schedulerName)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("securityContext"), securityContext)
        setfield!(o, Symbol("securityContext"), securityContext)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("serviceAccount"), serviceAccount)
        setfield!(o, Symbol("serviceAccount"), serviceAccount)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("serviceAccountName"), serviceAccountName)
        setfield!(o, Symbol("serviceAccountName"), serviceAccountName)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("shareProcessNamespace"), shareProcessNamespace)
        setfield!(o, Symbol("shareProcessNamespace"), shareProcessNamespace)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("subdomain"), subdomain)
        setfield!(o, Symbol("subdomain"), subdomain)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("terminationGracePeriodSeconds"), terminationGracePeriodSeconds)
        setfield!(o, Symbol("terminationGracePeriodSeconds"), terminationGracePeriodSeconds)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("tolerations"), tolerations)
        setfield!(o, Symbol("tolerations"), tolerations)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("topologySpreadConstraints"), topologySpreadConstraints)
        setfield!(o, Symbol("topologySpreadConstraints"), topologySpreadConstraints)
        validate_property(IoK8sApiCoreV1PodSpec, Symbol("volumes"), volumes)
        setfield!(o, Symbol("volumes"), volumes)
        o
    end
end # type IoK8sApiCoreV1PodSpec

const _property_map_IoK8sApiCoreV1PodSpec = Dict{Symbol,Symbol}(Symbol("activeDeadlineSeconds")=>Symbol("activeDeadlineSeconds"), Symbol("affinity")=>Symbol("affinity"), Symbol("automountServiceAccountToken")=>Symbol("automountServiceAccountToken"), Symbol("containers")=>Symbol("containers"), Symbol("dnsConfig")=>Symbol("dnsConfig"), Symbol("dnsPolicy")=>Symbol("dnsPolicy"), Symbol("enableServiceLinks")=>Symbol("enableServiceLinks"), Symbol("ephemeralContainers")=>Symbol("ephemeralContainers"), Symbol("hostAliases")=>Symbol("hostAliases"), Symbol("hostIPC")=>Symbol("hostIPC"), Symbol("hostNetwork")=>Symbol("hostNetwork"), Symbol("hostPID")=>Symbol("hostPID"), Symbol("hostname")=>Symbol("hostname"), Symbol("imagePullSecrets")=>Symbol("imagePullSecrets"), Symbol("initContainers")=>Symbol("initContainers"), Symbol("nodeName")=>Symbol("nodeName"), Symbol("nodeSelector")=>Symbol("nodeSelector"), Symbol("overhead")=>Symbol("overhead"), Symbol("preemptionPolicy")=>Symbol("preemptionPolicy"), Symbol("priority")=>Symbol("priority"), Symbol("priorityClassName")=>Symbol("priorityClassName"), Symbol("readinessGates")=>Symbol("readinessGates"), Symbol("restartPolicy")=>Symbol("restartPolicy"), Symbol("runtimeClassName")=>Symbol("runtimeClassName"), Symbol("schedulerName")=>Symbol("schedulerName"), Symbol("securityContext")=>Symbol("securityContext"), Symbol("serviceAccount")=>Symbol("serviceAccount"), Symbol("serviceAccountName")=>Symbol("serviceAccountName"), Symbol("shareProcessNamespace")=>Symbol("shareProcessNamespace"), Symbol("subdomain")=>Symbol("subdomain"), Symbol("terminationGracePeriodSeconds")=>Symbol("terminationGracePeriodSeconds"), Symbol("tolerations")=>Symbol("tolerations"), Symbol("topologySpreadConstraints")=>Symbol("topologySpreadConstraints"), Symbol("volumes")=>Symbol("volumes"))
const _property_types_IoK8sApiCoreV1PodSpec = Dict{Symbol,String}(Symbol("activeDeadlineSeconds")=>"Int64", Symbol("affinity")=>"IoK8sApiCoreV1Affinity", Symbol("automountServiceAccountToken")=>"Bool", Symbol("containers")=>"Vector{IoK8sApiCoreV1Container}", Symbol("dnsConfig")=>"IoK8sApiCoreV1PodDNSConfig", Symbol("dnsPolicy")=>"String", Symbol("enableServiceLinks")=>"Bool", Symbol("ephemeralContainers")=>"Vector{IoK8sApiCoreV1EphemeralContainer}", Symbol("hostAliases")=>"Vector{IoK8sApiCoreV1HostAlias}", Symbol("hostIPC")=>"Bool", Symbol("hostNetwork")=>"Bool", Symbol("hostPID")=>"Bool", Symbol("hostname")=>"String", Symbol("imagePullSecrets")=>"Vector{IoK8sApiCoreV1LocalObjectReference}", Symbol("initContainers")=>"Vector{IoK8sApiCoreV1Container}", Symbol("nodeName")=>"String", Symbol("nodeSelector")=>"Dict{String, String}", Symbol("overhead")=>"Dict{String, IoK8sApimachineryPkgApiResourceQuantity}", Symbol("preemptionPolicy")=>"String", Symbol("priority")=>"Int32", Symbol("priorityClassName")=>"String", Symbol("readinessGates")=>"Vector{IoK8sApiCoreV1PodReadinessGate}", Symbol("restartPolicy")=>"String", Symbol("runtimeClassName")=>"String", Symbol("schedulerName")=>"String", Symbol("securityContext")=>"IoK8sApiCoreV1PodSecurityContext", Symbol("serviceAccount")=>"String", Symbol("serviceAccountName")=>"String", Symbol("shareProcessNamespace")=>"Bool", Symbol("subdomain")=>"String", Symbol("terminationGracePeriodSeconds")=>"Int64", Symbol("tolerations")=>"Vector{IoK8sApiCoreV1Toleration}", Symbol("topologySpreadConstraints")=>"Vector{IoK8sApiCoreV1TopologySpreadConstraint}", Symbol("volumes")=>"Vector{IoK8sApiCoreV1Volume}")
Base.propertynames(::Type{ IoK8sApiCoreV1PodSpec }) = collect(keys(_property_map_IoK8sApiCoreV1PodSpec))
Swagger.property_type(::Type{ IoK8sApiCoreV1PodSpec }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1PodSpec[name]))}
Swagger.field_name(::Type{ IoK8sApiCoreV1PodSpec }, property_name::Symbol) =  _property_map_IoK8sApiCoreV1PodSpec[property_name]

function check_required(o::IoK8sApiCoreV1PodSpec)
    (getproperty(o, Symbol("containers")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiCoreV1PodSpec }, name::Symbol, val)
end
