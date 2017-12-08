module Typedefs
    using ..Kubernetes

    const PFX = [
        ("IoK8sKubeAggregatorPkgApisApiregistrationV1beta1", :ApiregistrationV1beta1)
        ,("IoK8sKubeAggregatorPkgApisApiregistration", :Apiregistration)
        ,("IoK8sApimachineryPkgVersion", :Version)
        ,("IoK8sApimachineryPkgUtil", :Apis)
        ,("IoK8sApimachineryPkgLogs", :Logs)
        ,("IoK8sApimachineryPkgApisMetaV1", :Apis)
        ,("IoK8sApimachineryPkgApi", :Apis)
        ,("IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1", :ApiextensionsV1beta1)
        ,("IoK8sApiextensionsApiserverPkgApisApiextensions", :Apiextensions)
        ,("IoK8sApiStorageV1beta1", :StorageV1beta1)
        ,("IoK8sApiStorageV1", :StorageV1)
        ,("IoK8sApiStorage", :Storage)
        ,("IoK8sApiSettingsV1alpha1", :SettingsV1alpha1)
        ,("IoK8sApiSettings", :Settings)
        ,("IoK8sApiSchedulingV1alpha1", :SchedulingV1alpha1)
        ,("IoK8sApiScheduling", :Scheduling)
        ,("IoK8sApiRbacV1beta1", :RbacAuthorizationV1beta1)
        ,("IoK8sApiRbacV1alpha1", :RbacAuthorizationV1alpha1)
        ,("IoK8sApiRbacV1", :RbacAuthorizationV1)
        ,("IoK8sApiRbac", :RbacAuthorization)
        ,("IoK8sApiPolicyV1beta1", :PolicyV1beta1)
        ,("IoK8sApiPolicy", :Policy)
        ,("IoK8sApiNetworkingV1", :NetworkingV1)
        ,("IoK8sApiNetworking", :Networking)
        ,("IoK8sApiExtensionsV1beta1", :ExtensionsV1beta1)
        ,("IoK8sApiExtensions", :Extensions)
        ,("IoK8sApiCoreV1", :CoreV1)
        ,("IoK8sApiCore", :Core)
        ,("IoK8sApiCertificatesV1beta1", :CertificatesV1beta1)
        ,("IoK8sApiCertificates", :Certificates)
        ,("IoK8sApiBatchV2alpha1", :BatchV2alpha1)
        ,("IoK8sApiBatchV1beta1", :BatchV1beta1)
        ,("IoK8sApiBatchV1", :BatchV1)
        ,("IoK8sApiBatch", :Batch)
        ,("IoK8sApiAutoscalingV2beta1", :AutoscalingV2beta1)
        ,("IoK8sApiAutoscalingV1", :AutoscalingV1)
        ,("IoK8sApiAutoscaling", :Autoscaling)
        ,("IoK8sApiAuthorizationV1beta1", :AuthorizationV1beta1)
        ,("IoK8sApiAuthorizationV1", :AuthorizationV1)
        ,("IoK8sApiAuthorization", :Authorization)
        ,("IoK8sApiAuthenticationV1beta1", :AuthenticationV1beta1)
        ,("IoK8sApiAuthenticationV1", :AuthenticationV1)
        ,("IoK8sApiAuthentication", :Authentication)
        ,("IoK8sApiAppsV1beta2", :AppsV1beta2)
        ,("IoK8sApiAppsV1beta1", :AppsV1beta1)
        ,("IoK8sApiApps", :Apps)
        ,("IoK8sApiApis", :Apis)
        ,("IoK8sApiAdmissionregistrationV1alpha1", :AdmissionregistrationV1alpha1)
        ,("IoK8sApiAdmissionregistration", :Admissionregistration)
    ]

    module AutoscalingV1
        using ..Kubernetes
        const CrossVersionObjectReference = Kubernetes.IoK8sApiAutoscalingV1CrossVersionObjectReference
        const HorizontalPodAutoscaler = Kubernetes.IoK8sApiAutoscalingV1HorizontalPodAutoscaler
        const HorizontalPodAutoscalerList = Kubernetes.IoK8sApiAutoscalingV1HorizontalPodAutoscalerList
        const HorizontalPodAutoscalerSpec = Kubernetes.IoK8sApiAutoscalingV1HorizontalPodAutoscalerSpec
        const HorizontalPodAutoscalerStatus = Kubernetes.IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus
        const Scale = Kubernetes.IoK8sApiAutoscalingV1Scale
        const ScaleSpec = Kubernetes.IoK8sApiAutoscalingV1ScaleSpec
        const ScaleStatus = Kubernetes.IoK8sApiAutoscalingV1ScaleStatus
    end # module AutoscalingV1
    module BatchV1
        using ..Kubernetes
        const Job = Kubernetes.IoK8sApiBatchV1Job
        const JobCondition = Kubernetes.IoK8sApiBatchV1JobCondition
        const JobList = Kubernetes.IoK8sApiBatchV1JobList
        const JobSpec = Kubernetes.IoK8sApiBatchV1JobSpec
        const JobStatus = Kubernetes.IoK8sApiBatchV1JobStatus
    end # module BatchV1
    module StorageV1
        using ..Kubernetes
        const StorageClass = Kubernetes.IoK8sApiStorageV1StorageClass
        const StorageClassList = Kubernetes.IoK8sApiStorageV1StorageClassList
    end # module StorageV1
    module AuthenticationV1beta1
        using ..Kubernetes
        const TokenReview = Kubernetes.IoK8sApiAuthenticationV1beta1TokenReview
        const TokenReviewSpec = Kubernetes.IoK8sApiAuthenticationV1beta1TokenReviewSpec
        const TokenReviewStatus = Kubernetes.IoK8sApiAuthenticationV1beta1TokenReviewStatus
        const UserInfo = Kubernetes.IoK8sApiAuthenticationV1beta1UserInfo
    end # module AuthenticationV1beta1
    module AuthorizationV1beta1
        using ..Kubernetes
        const LocalSubjectAccessReview = Kubernetes.IoK8sApiAuthorizationV1beta1LocalSubjectAccessReview
        const NonResourceAttributes = Kubernetes.IoK8sApiAuthorizationV1beta1NonResourceAttributes
        const NonResourceRule = Kubernetes.IoK8sApiAuthorizationV1beta1NonResourceRule
        const ResourceAttributes = Kubernetes.IoK8sApiAuthorizationV1beta1ResourceAttributes
        const ResourceRule = Kubernetes.IoK8sApiAuthorizationV1beta1ResourceRule
        const SelfSubjectAccessReview = Kubernetes.IoK8sApiAuthorizationV1beta1SelfSubjectAccessReview
        const SelfSubjectAccessReviewSpec = Kubernetes.IoK8sApiAuthorizationV1beta1SelfSubjectAccessReviewSpec
        const SelfSubjectRulesReview = Kubernetes.IoK8sApiAuthorizationV1beta1SelfSubjectRulesReview
        const SelfSubjectRulesReviewSpec = Kubernetes.IoK8sApiAuthorizationV1beta1SelfSubjectRulesReviewSpec
        const SubjectAccessReview = Kubernetes.IoK8sApiAuthorizationV1beta1SubjectAccessReview
        const SubjectAccessReviewSpec = Kubernetes.IoK8sApiAuthorizationV1beta1SubjectAccessReviewSpec
        const SubjectAccessReviewStatus = Kubernetes.IoK8sApiAuthorizationV1beta1SubjectAccessReviewStatus
        const SubjectRulesReviewStatus = Kubernetes.IoK8sApiAuthorizationV1beta1SubjectRulesReviewStatus
    end # module AuthorizationV1beta1
    module StorageV1beta1
        using ..Kubernetes
        const StorageClass = Kubernetes.IoK8sApiStorageV1beta1StorageClass
        const StorageClassList = Kubernetes.IoK8sApiStorageV1beta1StorageClassList
    end # module StorageV1beta1
    module Apis
        using ..Kubernetes
        const ResourceQuantity = Kubernetes.IoK8sApimachineryPkgApiResourceQuantity
        const APIGroup = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroup
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const APIResource = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResource
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const APIVersions = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIVersions
        const DeleteOptions = Kubernetes.IoK8sApimachineryPkgApisMetaV1DeleteOptions
        const GroupVersionForDiscovery = Kubernetes.IoK8sApimachineryPkgApisMetaV1GroupVersionForDiscovery
        const Initializer = Kubernetes.IoK8sApimachineryPkgApisMetaV1Initializer
        const Initializers = Kubernetes.IoK8sApimachineryPkgApisMetaV1Initializers
        const LabelSelector = Kubernetes.IoK8sApimachineryPkgApisMetaV1LabelSelector
        const LabelSelectorRequirement = Kubernetes.IoK8sApimachineryPkgApisMetaV1LabelSelectorRequirement
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const OwnerReference = Kubernetes.IoK8sApimachineryPkgApisMetaV1OwnerReference
        const Preconditions = Kubernetes.IoK8sApimachineryPkgApisMetaV1Preconditions
        const ServerAddressByClientCIDR = Kubernetes.IoK8sApimachineryPkgApisMetaV1ServerAddressByClientCIDR
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const StatusCause = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusCause
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const Time = Kubernetes.IoK8sApimachineryPkgApisMetaV1Time
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const IntstrIntOrString = Kubernetes.IoK8sApimachineryPkgUtilIntstrIntOrString
    end # module Apis
    module PolicyV1beta1
        using ..Kubernetes
        const Eviction = Kubernetes.IoK8sApiPolicyV1beta1Eviction
        const PodDisruptionBudget = Kubernetes.IoK8sApiPolicyV1beta1PodDisruptionBudget
        const PodDisruptionBudgetList = Kubernetes.IoK8sApiPolicyV1beta1PodDisruptionBudgetList
        const PodDisruptionBudgetSpec = Kubernetes.IoK8sApiPolicyV1beta1PodDisruptionBudgetSpec
        const PodDisruptionBudgetStatus = Kubernetes.IoK8sApiPolicyV1beta1PodDisruptionBudgetStatus
    end # module PolicyV1beta1
    module AppsV1beta2
        using ..Kubernetes
        const ControllerRevision = Kubernetes.IoK8sApiAppsV1beta2ControllerRevision
        const ControllerRevisionList = Kubernetes.IoK8sApiAppsV1beta2ControllerRevisionList
        const DaemonSet = Kubernetes.IoK8sApiAppsV1beta2DaemonSet
        const DaemonSetList = Kubernetes.IoK8sApiAppsV1beta2DaemonSetList
        const DaemonSetSpec = Kubernetes.IoK8sApiAppsV1beta2DaemonSetSpec
        const DaemonSetStatus = Kubernetes.IoK8sApiAppsV1beta2DaemonSetStatus
        const DaemonSetUpdateStrategy = Kubernetes.IoK8sApiAppsV1beta2DaemonSetUpdateStrategy
        const Deployment = Kubernetes.IoK8sApiAppsV1beta2Deployment
        const DeploymentCondition = Kubernetes.IoK8sApiAppsV1beta2DeploymentCondition
        const DeploymentList = Kubernetes.IoK8sApiAppsV1beta2DeploymentList
        const DeploymentSpec = Kubernetes.IoK8sApiAppsV1beta2DeploymentSpec
        const DeploymentStatus = Kubernetes.IoK8sApiAppsV1beta2DeploymentStatus
        const DeploymentStrategy = Kubernetes.IoK8sApiAppsV1beta2DeploymentStrategy
        const ReplicaSet = Kubernetes.IoK8sApiAppsV1beta2ReplicaSet
        const ReplicaSetCondition = Kubernetes.IoK8sApiAppsV1beta2ReplicaSetCondition
        const ReplicaSetList = Kubernetes.IoK8sApiAppsV1beta2ReplicaSetList
        const ReplicaSetSpec = Kubernetes.IoK8sApiAppsV1beta2ReplicaSetSpec
        const ReplicaSetStatus = Kubernetes.IoK8sApiAppsV1beta2ReplicaSetStatus
        const RollingUpdateDaemonSet = Kubernetes.IoK8sApiAppsV1beta2RollingUpdateDaemonSet
        const RollingUpdateDeployment = Kubernetes.IoK8sApiAppsV1beta2RollingUpdateDeployment
        const RollingUpdateStatefulSetStrategy = Kubernetes.IoK8sApiAppsV1beta2RollingUpdateStatefulSetStrategy
        const Scale = Kubernetes.IoK8sApiAppsV1beta2Scale
        const ScaleSpec = Kubernetes.IoK8sApiAppsV1beta2ScaleSpec
        const ScaleStatus = Kubernetes.IoK8sApiAppsV1beta2ScaleStatus
        const StatefulSet = Kubernetes.IoK8sApiAppsV1beta2StatefulSet
        const StatefulSetList = Kubernetes.IoK8sApiAppsV1beta2StatefulSetList
        const StatefulSetSpec = Kubernetes.IoK8sApiAppsV1beta2StatefulSetSpec
        const StatefulSetStatus = Kubernetes.IoK8sApiAppsV1beta2StatefulSetStatus
        const StatefulSetUpdateStrategy = Kubernetes.IoK8sApiAppsV1beta2StatefulSetUpdateStrategy
    end # module AppsV1beta2
    module Version
        using ..Kubernetes
        const Info = Kubernetes.IoK8sApimachineryPkgVersionInfo
    end # module Version
    module AdmissionregistrationV1alpha1
        using ..Kubernetes
        const AdmissionHookClientConfig = Kubernetes.IoK8sApiAdmissionregistrationV1alpha1AdmissionHookClientConfig
        const ExternalAdmissionHook = Kubernetes.IoK8sApiAdmissionregistrationV1alpha1ExternalAdmissionHook
        const ExternalAdmissionHookConfiguration = Kubernetes.IoK8sApiAdmissionregistrationV1alpha1ExternalAdmissionHookConfiguration
        const ExternalAdmissionHookConfigurationList = Kubernetes.IoK8sApiAdmissionregistrationV1alpha1ExternalAdmissionHookConfigurationList
        const Initializer = Kubernetes.IoK8sApiAdmissionregistrationV1alpha1Initializer
        const InitializerConfiguration = Kubernetes.IoK8sApiAdmissionregistrationV1alpha1InitializerConfiguration
        const InitializerConfigurationList = Kubernetes.IoK8sApiAdmissionregistrationV1alpha1InitializerConfigurationList
        const Rule = Kubernetes.IoK8sApiAdmissionregistrationV1alpha1Rule
        const RuleWithOperations = Kubernetes.IoK8sApiAdmissionregistrationV1alpha1RuleWithOperations
        const ServiceReference = Kubernetes.IoK8sApiAdmissionregistrationV1alpha1ServiceReference
    end # module AdmissionregistrationV1alpha1
    module CertificatesV1beta1
        using ..Kubernetes
        const CertificateSigningRequest = Kubernetes.IoK8sApiCertificatesV1beta1CertificateSigningRequest
        const CertificateSigningRequestCondition = Kubernetes.IoK8sApiCertificatesV1beta1CertificateSigningRequestCondition
        const CertificateSigningRequestList = Kubernetes.IoK8sApiCertificatesV1beta1CertificateSigningRequestList
        const CertificateSigningRequestSpec = Kubernetes.IoK8sApiCertificatesV1beta1CertificateSigningRequestSpec
        const CertificateSigningRequestStatus = Kubernetes.IoK8sApiCertificatesV1beta1CertificateSigningRequestStatus
    end # module CertificatesV1beta1
    module AutoscalingV2beta1
        using ..Kubernetes
        const CrossVersionObjectReference = Kubernetes.IoK8sApiAutoscalingV2beta1CrossVersionObjectReference
        const HorizontalPodAutoscaler = Kubernetes.IoK8sApiAutoscalingV2beta1HorizontalPodAutoscaler
        const HorizontalPodAutoscalerCondition = Kubernetes.IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerCondition
        const HorizontalPodAutoscalerList = Kubernetes.IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerList
        const HorizontalPodAutoscalerSpec = Kubernetes.IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerSpec
        const HorizontalPodAutoscalerStatus = Kubernetes.IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerStatus
        const MetricSpec = Kubernetes.IoK8sApiAutoscalingV2beta1MetricSpec
        const MetricStatus = Kubernetes.IoK8sApiAutoscalingV2beta1MetricStatus
        const ObjectMetricSource = Kubernetes.IoK8sApiAutoscalingV2beta1ObjectMetricSource
        const ObjectMetricStatus = Kubernetes.IoK8sApiAutoscalingV2beta1ObjectMetricStatus
        const PodsMetricSource = Kubernetes.IoK8sApiAutoscalingV2beta1PodsMetricSource
        const PodsMetricStatus = Kubernetes.IoK8sApiAutoscalingV2beta1PodsMetricStatus
        const ResourceMetricSource = Kubernetes.IoK8sApiAutoscalingV2beta1ResourceMetricSource
        const ResourceMetricStatus = Kubernetes.IoK8sApiAutoscalingV2beta1ResourceMetricStatus
    end # module AutoscalingV2beta1
    module BatchV1beta1
        using ..Kubernetes
        const CronJob = Kubernetes.IoK8sApiBatchV1beta1CronJob
        const CronJobList = Kubernetes.IoK8sApiBatchV1beta1CronJobList
        const CronJobSpec = Kubernetes.IoK8sApiBatchV1beta1CronJobSpec
        const CronJobStatus = Kubernetes.IoK8sApiBatchV1beta1CronJobStatus
        const JobTemplateSpec = Kubernetes.IoK8sApiBatchV1beta1JobTemplateSpec
    end # module BatchV1beta1
    module ExtensionsV1beta1
        using ..Kubernetes
        const AllowedHostPath = Kubernetes.IoK8sApiExtensionsV1beta1AllowedHostPath
        const DaemonSet = Kubernetes.IoK8sApiExtensionsV1beta1DaemonSet
        const DaemonSetList = Kubernetes.IoK8sApiExtensionsV1beta1DaemonSetList
        const DaemonSetSpec = Kubernetes.IoK8sApiExtensionsV1beta1DaemonSetSpec
        const DaemonSetStatus = Kubernetes.IoK8sApiExtensionsV1beta1DaemonSetStatus
        const DaemonSetUpdateStrategy = Kubernetes.IoK8sApiExtensionsV1beta1DaemonSetUpdateStrategy
        const Deployment = Kubernetes.IoK8sApiExtensionsV1beta1Deployment
        const DeploymentCondition = Kubernetes.IoK8sApiExtensionsV1beta1DeploymentCondition
        const DeploymentList = Kubernetes.IoK8sApiExtensionsV1beta1DeploymentList
        const DeploymentRollback = Kubernetes.IoK8sApiExtensionsV1beta1DeploymentRollback
        const DeploymentSpec = Kubernetes.IoK8sApiExtensionsV1beta1DeploymentSpec
        const DeploymentStatus = Kubernetes.IoK8sApiExtensionsV1beta1DeploymentStatus
        const DeploymentStrategy = Kubernetes.IoK8sApiExtensionsV1beta1DeploymentStrategy
        const FSGroupStrategyOptions = Kubernetes.IoK8sApiExtensionsV1beta1FSGroupStrategyOptions
        const HTTPIngressPath = Kubernetes.IoK8sApiExtensionsV1beta1HTTPIngressPath
        const HTTPIngressRuleValue = Kubernetes.IoK8sApiExtensionsV1beta1HTTPIngressRuleValue
        const HostPortRange = Kubernetes.IoK8sApiExtensionsV1beta1HostPortRange
        const IDRange = Kubernetes.IoK8sApiExtensionsV1beta1IDRange
        const IPBlock = Kubernetes.IoK8sApiExtensionsV1beta1IPBlock
        const Ingress = Kubernetes.IoK8sApiExtensionsV1beta1Ingress
        const IngressBackend = Kubernetes.IoK8sApiExtensionsV1beta1IngressBackend
        const IngressList = Kubernetes.IoK8sApiExtensionsV1beta1IngressList
        const IngressRule = Kubernetes.IoK8sApiExtensionsV1beta1IngressRule
        const IngressSpec = Kubernetes.IoK8sApiExtensionsV1beta1IngressSpec
        const IngressStatus = Kubernetes.IoK8sApiExtensionsV1beta1IngressStatus
        const IngressTLS = Kubernetes.IoK8sApiExtensionsV1beta1IngressTLS
        const NetworkPolicy = Kubernetes.IoK8sApiExtensionsV1beta1NetworkPolicy
        const NetworkPolicyEgressRule = Kubernetes.IoK8sApiExtensionsV1beta1NetworkPolicyEgressRule
        const NetworkPolicyIngressRule = Kubernetes.IoK8sApiExtensionsV1beta1NetworkPolicyIngressRule
        const NetworkPolicyList = Kubernetes.IoK8sApiExtensionsV1beta1NetworkPolicyList
        const NetworkPolicyPeer = Kubernetes.IoK8sApiExtensionsV1beta1NetworkPolicyPeer
        const NetworkPolicyPort = Kubernetes.IoK8sApiExtensionsV1beta1NetworkPolicyPort
        const NetworkPolicySpec = Kubernetes.IoK8sApiExtensionsV1beta1NetworkPolicySpec
        const PodSecurityPolicy = Kubernetes.IoK8sApiExtensionsV1beta1PodSecurityPolicy
        const PodSecurityPolicyList = Kubernetes.IoK8sApiExtensionsV1beta1PodSecurityPolicyList
        const PodSecurityPolicySpec = Kubernetes.IoK8sApiExtensionsV1beta1PodSecurityPolicySpec
        const ReplicaSet = Kubernetes.IoK8sApiExtensionsV1beta1ReplicaSet
        const ReplicaSetCondition = Kubernetes.IoK8sApiExtensionsV1beta1ReplicaSetCondition
        const ReplicaSetList = Kubernetes.IoK8sApiExtensionsV1beta1ReplicaSetList
        const ReplicaSetSpec = Kubernetes.IoK8sApiExtensionsV1beta1ReplicaSetSpec
        const ReplicaSetStatus = Kubernetes.IoK8sApiExtensionsV1beta1ReplicaSetStatus
        const RollbackConfig = Kubernetes.IoK8sApiExtensionsV1beta1RollbackConfig
        const RollingUpdateDaemonSet = Kubernetes.IoK8sApiExtensionsV1beta1RollingUpdateDaemonSet
        const RollingUpdateDeployment = Kubernetes.IoK8sApiExtensionsV1beta1RollingUpdateDeployment
        const RunAsUserStrategyOptions = Kubernetes.IoK8sApiExtensionsV1beta1RunAsUserStrategyOptions
        const SELinuxStrategyOptions = Kubernetes.IoK8sApiExtensionsV1beta1SELinuxStrategyOptions
        const Scale = Kubernetes.IoK8sApiExtensionsV1beta1Scale
        const ScaleSpec = Kubernetes.IoK8sApiExtensionsV1beta1ScaleSpec
        const ScaleStatus = Kubernetes.IoK8sApiExtensionsV1beta1ScaleStatus
        const SupplementalGroupsStrategyOptions = Kubernetes.IoK8sApiExtensionsV1beta1SupplementalGroupsStrategyOptions
    end # module ExtensionsV1beta1
    module ApiregistrationV1beta1
        using ..Kubernetes
        const APIService = Kubernetes.IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIService
        const APIServiceCondition = Kubernetes.IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceCondition
        const APIServiceList = Kubernetes.IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceList
        const APIServiceSpec = Kubernetes.IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceSpec
        const APIServiceStatus = Kubernetes.IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceStatus
        const ServiceReference = Kubernetes.IoK8sKubeAggregatorPkgApisApiregistrationV1beta1ServiceReference
    end # module ApiregistrationV1beta1
    module AuthenticationV1
        using ..Kubernetes
        const TokenReview = Kubernetes.IoK8sApiAuthenticationV1TokenReview
        const TokenReviewSpec = Kubernetes.IoK8sApiAuthenticationV1TokenReviewSpec
        const TokenReviewStatus = Kubernetes.IoK8sApiAuthenticationV1TokenReviewStatus
        const UserInfo = Kubernetes.IoK8sApiAuthenticationV1UserInfo
    end # module AuthenticationV1
    module ApiextensionsV1beta1
        using ..Kubernetes
        const CustomResourceDefinition = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinition
        const CustomResourceDefinitionCondition = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionCondition
        const CustomResourceDefinitionList = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionList
        const CustomResourceDefinitionNames = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionNames
        const CustomResourceDefinitionSpec = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionSpec
        const CustomResourceDefinitionStatus = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionStatus
        const CustomResourceValidation = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceValidation
        const ExternalDocumentation = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1ExternalDocumentation
        const JSON = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSON
        const JSONSchemaProps = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps
        const JSONSchemaPropsOrArray = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaPropsOrArray
        const JSONSchemaPropsOrBool = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaPropsOrBool
        const JSONSchemaPropsOrStringArray = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaPropsOrStringArray
    end # module ApiextensionsV1beta1
    module RbacAuthorizationV1alpha1
        using ..Kubernetes
        const ClusterRole = Kubernetes.IoK8sApiRbacV1alpha1ClusterRole
        const ClusterRoleBinding = Kubernetes.IoK8sApiRbacV1alpha1ClusterRoleBinding
        const ClusterRoleBindingList = Kubernetes.IoK8sApiRbacV1alpha1ClusterRoleBindingList
        const ClusterRoleList = Kubernetes.IoK8sApiRbacV1alpha1ClusterRoleList
        const PolicyRule = Kubernetes.IoK8sApiRbacV1alpha1PolicyRule
        const Role = Kubernetes.IoK8sApiRbacV1alpha1Role
        const RoleBinding = Kubernetes.IoK8sApiRbacV1alpha1RoleBinding
        const RoleBindingList = Kubernetes.IoK8sApiRbacV1alpha1RoleBindingList
        const RoleList = Kubernetes.IoK8sApiRbacV1alpha1RoleList
        const RoleRef = Kubernetes.IoK8sApiRbacV1alpha1RoleRef
        const Subject = Kubernetes.IoK8sApiRbacV1alpha1Subject
    end # module RbacAuthorizationV1alpha1
    module NetworkingV1
        using ..Kubernetes
        const IPBlock = Kubernetes.IoK8sApiNetworkingV1IPBlock
        const NetworkPolicy = Kubernetes.IoK8sApiNetworkingV1NetworkPolicy
        const NetworkPolicyEgressRule = Kubernetes.IoK8sApiNetworkingV1NetworkPolicyEgressRule
        const NetworkPolicyIngressRule = Kubernetes.IoK8sApiNetworkingV1NetworkPolicyIngressRule
        const NetworkPolicyList = Kubernetes.IoK8sApiNetworkingV1NetworkPolicyList
        const NetworkPolicyPeer = Kubernetes.IoK8sApiNetworkingV1NetworkPolicyPeer
        const NetworkPolicyPort = Kubernetes.IoK8sApiNetworkingV1NetworkPolicyPort
        const NetworkPolicySpec = Kubernetes.IoK8sApiNetworkingV1NetworkPolicySpec
    end # module NetworkingV1
    module SettingsV1alpha1
        using ..Kubernetes
        const PodPreset = Kubernetes.IoK8sApiSettingsV1alpha1PodPreset
        const PodPresetList = Kubernetes.IoK8sApiSettingsV1alpha1PodPresetList
        const PodPresetSpec = Kubernetes.IoK8sApiSettingsV1alpha1PodPresetSpec
    end # module SettingsV1alpha1
    module RbacAuthorizationV1beta1
        using ..Kubernetes
        const ClusterRole = Kubernetes.IoK8sApiRbacV1beta1ClusterRole
        const ClusterRoleBinding = Kubernetes.IoK8sApiRbacV1beta1ClusterRoleBinding
        const ClusterRoleBindingList = Kubernetes.IoK8sApiRbacV1beta1ClusterRoleBindingList
        const ClusterRoleList = Kubernetes.IoK8sApiRbacV1beta1ClusterRoleList
        const PolicyRule = Kubernetes.IoK8sApiRbacV1beta1PolicyRule
        const Role = Kubernetes.IoK8sApiRbacV1beta1Role
        const RoleBinding = Kubernetes.IoK8sApiRbacV1beta1RoleBinding
        const RoleBindingList = Kubernetes.IoK8sApiRbacV1beta1RoleBindingList
        const RoleList = Kubernetes.IoK8sApiRbacV1beta1RoleList
        const RoleRef = Kubernetes.IoK8sApiRbacV1beta1RoleRef
        const Subject = Kubernetes.IoK8sApiRbacV1beta1Subject
    end # module RbacAuthorizationV1beta1
    module SchedulingV1alpha1
        using ..Kubernetes
        const PriorityClass = Kubernetes.IoK8sApiSchedulingV1alpha1PriorityClass
        const PriorityClassList = Kubernetes.IoK8sApiSchedulingV1alpha1PriorityClassList
    end # module SchedulingV1alpha1
    module AppsV1beta1
        using ..Kubernetes
        const ControllerRevision = Kubernetes.IoK8sApiAppsV1beta1ControllerRevision
        const ControllerRevisionList = Kubernetes.IoK8sApiAppsV1beta1ControllerRevisionList
        const Deployment = Kubernetes.IoK8sApiAppsV1beta1Deployment
        const DeploymentCondition = Kubernetes.IoK8sApiAppsV1beta1DeploymentCondition
        const DeploymentList = Kubernetes.IoK8sApiAppsV1beta1DeploymentList
        const DeploymentRollback = Kubernetes.IoK8sApiAppsV1beta1DeploymentRollback
        const DeploymentSpec = Kubernetes.IoK8sApiAppsV1beta1DeploymentSpec
        const DeploymentStatus = Kubernetes.IoK8sApiAppsV1beta1DeploymentStatus
        const DeploymentStrategy = Kubernetes.IoK8sApiAppsV1beta1DeploymentStrategy
        const RollbackConfig = Kubernetes.IoK8sApiAppsV1beta1RollbackConfig
        const RollingUpdateDeployment = Kubernetes.IoK8sApiAppsV1beta1RollingUpdateDeployment
        const RollingUpdateStatefulSetStrategy = Kubernetes.IoK8sApiAppsV1beta1RollingUpdateStatefulSetStrategy
        const Scale = Kubernetes.IoK8sApiAppsV1beta1Scale
        const ScaleSpec = Kubernetes.IoK8sApiAppsV1beta1ScaleSpec
        const ScaleStatus = Kubernetes.IoK8sApiAppsV1beta1ScaleStatus
        const StatefulSet = Kubernetes.IoK8sApiAppsV1beta1StatefulSet
        const StatefulSetList = Kubernetes.IoK8sApiAppsV1beta1StatefulSetList
        const StatefulSetSpec = Kubernetes.IoK8sApiAppsV1beta1StatefulSetSpec
        const StatefulSetStatus = Kubernetes.IoK8sApiAppsV1beta1StatefulSetStatus
        const StatefulSetUpdateStrategy = Kubernetes.IoK8sApiAppsV1beta1StatefulSetUpdateStrategy
    end # module AppsV1beta1
    module AuthorizationV1
        using ..Kubernetes
        const LocalSubjectAccessReview = Kubernetes.IoK8sApiAuthorizationV1LocalSubjectAccessReview
        const NonResourceAttributes = Kubernetes.IoK8sApiAuthorizationV1NonResourceAttributes
        const NonResourceRule = Kubernetes.IoK8sApiAuthorizationV1NonResourceRule
        const ResourceAttributes = Kubernetes.IoK8sApiAuthorizationV1ResourceAttributes
        const ResourceRule = Kubernetes.IoK8sApiAuthorizationV1ResourceRule
        const SelfSubjectAccessReview = Kubernetes.IoK8sApiAuthorizationV1SelfSubjectAccessReview
        const SelfSubjectAccessReviewSpec = Kubernetes.IoK8sApiAuthorizationV1SelfSubjectAccessReviewSpec
        const SelfSubjectRulesReview = Kubernetes.IoK8sApiAuthorizationV1SelfSubjectRulesReview
        const SelfSubjectRulesReviewSpec = Kubernetes.IoK8sApiAuthorizationV1SelfSubjectRulesReviewSpec
        const SubjectAccessReview = Kubernetes.IoK8sApiAuthorizationV1SubjectAccessReview
        const SubjectAccessReviewSpec = Kubernetes.IoK8sApiAuthorizationV1SubjectAccessReviewSpec
        const SubjectAccessReviewStatus = Kubernetes.IoK8sApiAuthorizationV1SubjectAccessReviewStatus
        const SubjectRulesReviewStatus = Kubernetes.IoK8sApiAuthorizationV1SubjectRulesReviewStatus
    end # module AuthorizationV1
    module BatchV2alpha1
        using ..Kubernetes
        const CronJob = Kubernetes.IoK8sApiBatchV2alpha1CronJob
        const CronJobList = Kubernetes.IoK8sApiBatchV2alpha1CronJobList
        const CronJobSpec = Kubernetes.IoK8sApiBatchV2alpha1CronJobSpec
        const CronJobStatus = Kubernetes.IoK8sApiBatchV2alpha1CronJobStatus
        const JobTemplateSpec = Kubernetes.IoK8sApiBatchV2alpha1JobTemplateSpec
    end # module BatchV2alpha1
    module CoreV1
        using ..Kubernetes
        const AWSElasticBlockStoreVolumeSource = Kubernetes.IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource
        const Affinity = Kubernetes.IoK8sApiCoreV1Affinity
        const AttachedVolume = Kubernetes.IoK8sApiCoreV1AttachedVolume
        const AzureDiskVolumeSource = Kubernetes.IoK8sApiCoreV1AzureDiskVolumeSource
        const AzureFilePersistentVolumeSource = Kubernetes.IoK8sApiCoreV1AzureFilePersistentVolumeSource
        const AzureFileVolumeSource = Kubernetes.IoK8sApiCoreV1AzureFileVolumeSource
        const Binding = Kubernetes.IoK8sApiCoreV1Binding
        const Capabilities = Kubernetes.IoK8sApiCoreV1Capabilities
        const CephFSPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1CephFSPersistentVolumeSource
        const CephFSVolumeSource = Kubernetes.IoK8sApiCoreV1CephFSVolumeSource
        const CinderVolumeSource = Kubernetes.IoK8sApiCoreV1CinderVolumeSource
        const ClientIPConfig = Kubernetes.IoK8sApiCoreV1ClientIPConfig
        const ComponentCondition = Kubernetes.IoK8sApiCoreV1ComponentCondition
        const ComponentStatus = Kubernetes.IoK8sApiCoreV1ComponentStatus
        const ComponentStatusList = Kubernetes.IoK8sApiCoreV1ComponentStatusList
        const ConfigMap = Kubernetes.IoK8sApiCoreV1ConfigMap
        const ConfigMapEnvSource = Kubernetes.IoK8sApiCoreV1ConfigMapEnvSource
        const ConfigMapKeySelector = Kubernetes.IoK8sApiCoreV1ConfigMapKeySelector
        const ConfigMapList = Kubernetes.IoK8sApiCoreV1ConfigMapList
        const ConfigMapProjection = Kubernetes.IoK8sApiCoreV1ConfigMapProjection
        const ConfigMapVolumeSource = Kubernetes.IoK8sApiCoreV1ConfigMapVolumeSource
        const Container = Kubernetes.IoK8sApiCoreV1Container
        const ContainerImage = Kubernetes.IoK8sApiCoreV1ContainerImage
        const ContainerPort = Kubernetes.IoK8sApiCoreV1ContainerPort
        const ContainerState = Kubernetes.IoK8sApiCoreV1ContainerState
        const ContainerStateRunning = Kubernetes.IoK8sApiCoreV1ContainerStateRunning
        const ContainerStateTerminated = Kubernetes.IoK8sApiCoreV1ContainerStateTerminated
        const ContainerStateWaiting = Kubernetes.IoK8sApiCoreV1ContainerStateWaiting
        const ContainerStatus = Kubernetes.IoK8sApiCoreV1ContainerStatus
        const DaemonEndpoint = Kubernetes.IoK8sApiCoreV1DaemonEndpoint
        const DownwardAPIProjection = Kubernetes.IoK8sApiCoreV1DownwardAPIProjection
        const DownwardAPIVolumeFile = Kubernetes.IoK8sApiCoreV1DownwardAPIVolumeFile
        const DownwardAPIVolumeSource = Kubernetes.IoK8sApiCoreV1DownwardAPIVolumeSource
        const EmptyDirVolumeSource = Kubernetes.IoK8sApiCoreV1EmptyDirVolumeSource
        const EndpointAddress = Kubernetes.IoK8sApiCoreV1EndpointAddress
        const EndpointPort = Kubernetes.IoK8sApiCoreV1EndpointPort
        const EndpointSubset = Kubernetes.IoK8sApiCoreV1EndpointSubset
        const Endpoints = Kubernetes.IoK8sApiCoreV1Endpoints
        const EndpointsList = Kubernetes.IoK8sApiCoreV1EndpointsList
        const EnvFromSource = Kubernetes.IoK8sApiCoreV1EnvFromSource
        const EnvVar = Kubernetes.IoK8sApiCoreV1EnvVar
        const EnvVarSource = Kubernetes.IoK8sApiCoreV1EnvVarSource
        const Event = Kubernetes.IoK8sApiCoreV1Event
        const EventList = Kubernetes.IoK8sApiCoreV1EventList
        const EventSource = Kubernetes.IoK8sApiCoreV1EventSource
        const ExecAction = Kubernetes.IoK8sApiCoreV1ExecAction
        const FCVolumeSource = Kubernetes.IoK8sApiCoreV1FCVolumeSource
        const FlexVolumeSource = Kubernetes.IoK8sApiCoreV1FlexVolumeSource
        const FlockerVolumeSource = Kubernetes.IoK8sApiCoreV1FlockerVolumeSource
        const GCEPersistentDiskVolumeSource = Kubernetes.IoK8sApiCoreV1GCEPersistentDiskVolumeSource
        const GitRepoVolumeSource = Kubernetes.IoK8sApiCoreV1GitRepoVolumeSource
        const GlusterfsVolumeSource = Kubernetes.IoK8sApiCoreV1GlusterfsVolumeSource
        const HTTPGetAction = Kubernetes.IoK8sApiCoreV1HTTPGetAction
        const HTTPHeader = Kubernetes.IoK8sApiCoreV1HTTPHeader
        const Handler = Kubernetes.IoK8sApiCoreV1Handler
        const HostAlias = Kubernetes.IoK8sApiCoreV1HostAlias
        const HostPathVolumeSource = Kubernetes.IoK8sApiCoreV1HostPathVolumeSource
        const ISCSIVolumeSource = Kubernetes.IoK8sApiCoreV1ISCSIVolumeSource
        const KeyToPath = Kubernetes.IoK8sApiCoreV1KeyToPath
        const Lifecycle = Kubernetes.IoK8sApiCoreV1Lifecycle
        const LimitRange = Kubernetes.IoK8sApiCoreV1LimitRange
        const LimitRangeItem = Kubernetes.IoK8sApiCoreV1LimitRangeItem
        const LimitRangeList = Kubernetes.IoK8sApiCoreV1LimitRangeList
        const LimitRangeSpec = Kubernetes.IoK8sApiCoreV1LimitRangeSpec
        const LoadBalancerIngress = Kubernetes.IoK8sApiCoreV1LoadBalancerIngress
        const LoadBalancerStatus = Kubernetes.IoK8sApiCoreV1LoadBalancerStatus
        const LocalObjectReference = Kubernetes.IoK8sApiCoreV1LocalObjectReference
        const LocalVolumeSource = Kubernetes.IoK8sApiCoreV1LocalVolumeSource
        const NFSVolumeSource = Kubernetes.IoK8sApiCoreV1NFSVolumeSource
        const Namespace = Kubernetes.IoK8sApiCoreV1Namespace
        const NamespaceList = Kubernetes.IoK8sApiCoreV1NamespaceList
        const NamespaceSpec = Kubernetes.IoK8sApiCoreV1NamespaceSpec
        const NamespaceStatus = Kubernetes.IoK8sApiCoreV1NamespaceStatus
        const Node = Kubernetes.IoK8sApiCoreV1Node
        const NodeAddress = Kubernetes.IoK8sApiCoreV1NodeAddress
        const NodeAffinity = Kubernetes.IoK8sApiCoreV1NodeAffinity
        const NodeCondition = Kubernetes.IoK8sApiCoreV1NodeCondition
        const NodeConfigSource = Kubernetes.IoK8sApiCoreV1NodeConfigSource
        const NodeDaemonEndpoints = Kubernetes.IoK8sApiCoreV1NodeDaemonEndpoints
        const NodeList = Kubernetes.IoK8sApiCoreV1NodeList
        const NodeSelector = Kubernetes.IoK8sApiCoreV1NodeSelector
        const NodeSelectorRequirement = Kubernetes.IoK8sApiCoreV1NodeSelectorRequirement
        const NodeSelectorTerm = Kubernetes.IoK8sApiCoreV1NodeSelectorTerm
        const NodeSpec = Kubernetes.IoK8sApiCoreV1NodeSpec
        const NodeStatus = Kubernetes.IoK8sApiCoreV1NodeStatus
        const NodeSystemInfo = Kubernetes.IoK8sApiCoreV1NodeSystemInfo
        const ObjectFieldSelector = Kubernetes.IoK8sApiCoreV1ObjectFieldSelector
        const ObjectReference = Kubernetes.IoK8sApiCoreV1ObjectReference
        const PersistentVolume = Kubernetes.IoK8sApiCoreV1PersistentVolume
        const PersistentVolumeClaim = Kubernetes.IoK8sApiCoreV1PersistentVolumeClaim
        const PersistentVolumeClaimCondition = Kubernetes.IoK8sApiCoreV1PersistentVolumeClaimCondition
        const PersistentVolumeClaimList = Kubernetes.IoK8sApiCoreV1PersistentVolumeClaimList
        const PersistentVolumeClaimSpec = Kubernetes.IoK8sApiCoreV1PersistentVolumeClaimSpec
        const PersistentVolumeClaimStatus = Kubernetes.IoK8sApiCoreV1PersistentVolumeClaimStatus
        const PersistentVolumeClaimVolumeSource = Kubernetes.IoK8sApiCoreV1PersistentVolumeClaimVolumeSource
        const PersistentVolumeList = Kubernetes.IoK8sApiCoreV1PersistentVolumeList
        const PersistentVolumeSpec = Kubernetes.IoK8sApiCoreV1PersistentVolumeSpec
        const PersistentVolumeStatus = Kubernetes.IoK8sApiCoreV1PersistentVolumeStatus
        const PhotonPersistentDiskVolumeSource = Kubernetes.IoK8sApiCoreV1PhotonPersistentDiskVolumeSource
        const Pod = Kubernetes.IoK8sApiCoreV1Pod
        const PodAffinity = Kubernetes.IoK8sApiCoreV1PodAffinity
        const PodAffinityTerm = Kubernetes.IoK8sApiCoreV1PodAffinityTerm
        const PodAntiAffinity = Kubernetes.IoK8sApiCoreV1PodAntiAffinity
        const PodCondition = Kubernetes.IoK8sApiCoreV1PodCondition
        const PodList = Kubernetes.IoK8sApiCoreV1PodList
        const PodSecurityContext = Kubernetes.IoK8sApiCoreV1PodSecurityContext
        const PodSpec = Kubernetes.IoK8sApiCoreV1PodSpec
        const PodStatus = Kubernetes.IoK8sApiCoreV1PodStatus
        const PodTemplate = Kubernetes.IoK8sApiCoreV1PodTemplate
        const PodTemplateList = Kubernetes.IoK8sApiCoreV1PodTemplateList
        const PodTemplateSpec = Kubernetes.IoK8sApiCoreV1PodTemplateSpec
        const PortworxVolumeSource = Kubernetes.IoK8sApiCoreV1PortworxVolumeSource
        const PreferredSchedulingTerm = Kubernetes.IoK8sApiCoreV1PreferredSchedulingTerm
        const Probe = Kubernetes.IoK8sApiCoreV1Probe
        const ProjectedVolumeSource = Kubernetes.IoK8sApiCoreV1ProjectedVolumeSource
        const QuobyteVolumeSource = Kubernetes.IoK8sApiCoreV1QuobyteVolumeSource
        const RBDVolumeSource = Kubernetes.IoK8sApiCoreV1RBDVolumeSource
        const ReplicationController = Kubernetes.IoK8sApiCoreV1ReplicationController
        const ReplicationControllerCondition = Kubernetes.IoK8sApiCoreV1ReplicationControllerCondition
        const ReplicationControllerList = Kubernetes.IoK8sApiCoreV1ReplicationControllerList
        const ReplicationControllerSpec = Kubernetes.IoK8sApiCoreV1ReplicationControllerSpec
        const ReplicationControllerStatus = Kubernetes.IoK8sApiCoreV1ReplicationControllerStatus
        const ResourceFieldSelector = Kubernetes.IoK8sApiCoreV1ResourceFieldSelector
        const ResourceQuota = Kubernetes.IoK8sApiCoreV1ResourceQuota
        const ResourceQuotaList = Kubernetes.IoK8sApiCoreV1ResourceQuotaList
        const ResourceQuotaSpec = Kubernetes.IoK8sApiCoreV1ResourceQuotaSpec
        const ResourceQuotaStatus = Kubernetes.IoK8sApiCoreV1ResourceQuotaStatus
        const ResourceRequirements = Kubernetes.IoK8sApiCoreV1ResourceRequirements
        const SELinuxOptions = Kubernetes.IoK8sApiCoreV1SELinuxOptions
        const ScaleIOPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1ScaleIOPersistentVolumeSource
        const ScaleIOVolumeSource = Kubernetes.IoK8sApiCoreV1ScaleIOVolumeSource
        const Secret = Kubernetes.IoK8sApiCoreV1Secret
        const SecretEnvSource = Kubernetes.IoK8sApiCoreV1SecretEnvSource
        const SecretKeySelector = Kubernetes.IoK8sApiCoreV1SecretKeySelector
        const SecretList = Kubernetes.IoK8sApiCoreV1SecretList
        const SecretProjection = Kubernetes.IoK8sApiCoreV1SecretProjection
        const SecretReference = Kubernetes.IoK8sApiCoreV1SecretReference
        const SecretVolumeSource = Kubernetes.IoK8sApiCoreV1SecretVolumeSource
        const SecurityContext = Kubernetes.IoK8sApiCoreV1SecurityContext
        const Service = Kubernetes.IoK8sApiCoreV1Service
        const ServiceAccount = Kubernetes.IoK8sApiCoreV1ServiceAccount
        const ServiceAccountList = Kubernetes.IoK8sApiCoreV1ServiceAccountList
        const ServiceList = Kubernetes.IoK8sApiCoreV1ServiceList
        const ServicePort = Kubernetes.IoK8sApiCoreV1ServicePort
        const ServiceSpec = Kubernetes.IoK8sApiCoreV1ServiceSpec
        const ServiceStatus = Kubernetes.IoK8sApiCoreV1ServiceStatus
        const SessionAffinityConfig = Kubernetes.IoK8sApiCoreV1SessionAffinityConfig
        const StorageOSPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1StorageOSPersistentVolumeSource
        const StorageOSVolumeSource = Kubernetes.IoK8sApiCoreV1StorageOSVolumeSource
        const TCPSocketAction = Kubernetes.IoK8sApiCoreV1TCPSocketAction
        const Taint = Kubernetes.IoK8sApiCoreV1Taint
        const Toleration = Kubernetes.IoK8sApiCoreV1Toleration
        const Volume = Kubernetes.IoK8sApiCoreV1Volume
        const VolumeMount = Kubernetes.IoK8sApiCoreV1VolumeMount
        const VolumeProjection = Kubernetes.IoK8sApiCoreV1VolumeProjection
        const VsphereVirtualDiskVolumeSource = Kubernetes.IoK8sApiCoreV1VsphereVirtualDiskVolumeSource
        const WeightedPodAffinityTerm = Kubernetes.IoK8sApiCoreV1WeightedPodAffinityTerm
    end # module CoreV1
    module RbacAuthorizationV1
        using ..Kubernetes
        const ClusterRole = Kubernetes.IoK8sApiRbacV1ClusterRole
        const ClusterRoleBinding = Kubernetes.IoK8sApiRbacV1ClusterRoleBinding
        const ClusterRoleBindingList = Kubernetes.IoK8sApiRbacV1ClusterRoleBindingList
        const ClusterRoleList = Kubernetes.IoK8sApiRbacV1ClusterRoleList
        const PolicyRule = Kubernetes.IoK8sApiRbacV1PolicyRule
        const Role = Kubernetes.IoK8sApiRbacV1Role
        const RoleBinding = Kubernetes.IoK8sApiRbacV1RoleBinding
        const RoleBindingList = Kubernetes.IoK8sApiRbacV1RoleBindingList
        const RoleList = Kubernetes.IoK8sApiRbacV1RoleList
        const RoleRef = Kubernetes.IoK8sApiRbacV1RoleRef
        const Subject = Kubernetes.IoK8sApiRbacV1Subject
    end # module RbacAuthorizationV1
end # module Typedefs
