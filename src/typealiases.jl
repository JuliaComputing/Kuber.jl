module Typedefs
    using ..Kubernetes
    module AutoscalingV1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const HorizontalPodAutoscalerStatus = Kubernetes.IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus
        const HorizontalPodAutoscalerList = Kubernetes.IoK8sApiAutoscalingV1HorizontalPodAutoscalerList
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const CrossVersionObjectReference = Kubernetes.IoK8sApiAutoscalingV1CrossVersionObjectReference
        const Scale = Kubernetes.IoK8sApiAutoscalingV1Scale
        const HorizontalPodAutoscaler = Kubernetes.IoK8sApiAutoscalingV1HorizontalPodAutoscaler
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const HorizontalPodAutoscalerSpec = Kubernetes.IoK8sApiAutoscalingV1HorizontalPodAutoscalerSpec
        const ScaleSpec = Kubernetes.IoK8sApiAutoscalingV1ScaleSpec
        const ScaleStatus = Kubernetes.IoK8sApiAutoscalingV1ScaleStatus
    end # module AutoscalingV1
    module Networking
        using ..Kubernetes
        const APIGroup = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroup
    end # module Networking
    module BatchV1
        using ..Kubernetes
        const JobSpec = Kubernetes.IoK8sApiBatchV1JobSpec
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const JobStatus = Kubernetes.IoK8sApiBatchV1JobStatus
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const JobList = Kubernetes.IoK8sApiBatchV1JobList
        const JobCondition = Kubernetes.IoK8sApiBatchV1JobCondition
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const Job = Kubernetes.IoK8sApiBatchV1Job
    end # module BatchV1
    module StorageV1
        using ..Kubernetes
        const StorageClassList = Kubernetes.IoK8sApiStorageV1StorageClassList
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const StorageClass = Kubernetes.IoK8sApiStorageV1StorageClass
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
    end # module StorageV1
    module AuthenticationV1beta1
        using ..Kubernetes
        const UserInfo = Kubernetes.IoK8sApiAuthenticationV1beta1UserInfo
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const TokenReview = Kubernetes.IoK8sApiAuthenticationV1beta1TokenReview
        const TokenReviewSpec = Kubernetes.IoK8sApiAuthenticationV1beta1TokenReviewSpec
        const TokenReviewStatus = Kubernetes.IoK8sApiAuthenticationV1beta1TokenReviewStatus
    end # module AuthenticationV1beta1
    module AuthorizationV1beta1
        using ..Kubernetes
        const SubjectAccessReview = Kubernetes.IoK8sApiAuthorizationV1beta1SubjectAccessReview
        const SelfSubjectRulesReviewSpec = Kubernetes.IoK8sApiAuthorizationV1beta1SelfSubjectRulesReviewSpec
        const SubjectAccessReviewSpec = Kubernetes.IoK8sApiAuthorizationV1beta1SubjectAccessReviewSpec
        const SelfSubjectAccessReviewSpec = Kubernetes.IoK8sApiAuthorizationV1beta1SelfSubjectAccessReviewSpec
        const ResourceAttributes = Kubernetes.IoK8sApiAuthorizationV1beta1ResourceAttributes
        const SubjectRulesReviewStatus = Kubernetes.IoK8sApiAuthorizationV1beta1SubjectRulesReviewStatus
        const LocalSubjectAccessReview = Kubernetes.IoK8sApiAuthorizationV1beta1LocalSubjectAccessReview
        const SelfSubjectRulesReview = Kubernetes.IoK8sApiAuthorizationV1beta1SelfSubjectRulesReview
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const ResourceRule = Kubernetes.IoK8sApiAuthorizationV1beta1ResourceRule
        const NonResourceAttributes = Kubernetes.IoK8sApiAuthorizationV1beta1NonResourceAttributes
        const SelfSubjectAccessReview = Kubernetes.IoK8sApiAuthorizationV1beta1SelfSubjectAccessReview
        const SubjectAccessReviewStatus = Kubernetes.IoK8sApiAuthorizationV1beta1SubjectAccessReviewStatus
        const NonResourceRule = Kubernetes.IoK8sApiAuthorizationV1beta1NonResourceRule
    end # module AuthorizationV1beta1
    module StorageV1beta1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const StorageClassList = Kubernetes.IoK8sApiStorageV1beta1StorageClassList
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const StorageClass = Kubernetes.IoK8sApiStorageV1beta1StorageClass
    end # module StorageV1beta1
    module Apis
        using ..Kubernetes
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
    end # module Apis
    module Certificates
        using ..Kubernetes
        const APIGroup = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroup
    end # module Certificates
    module Extensions
        using ..Kubernetes
        const APIGroup = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroup
    end # module Extensions
    module PolicyV1beta1
        using ..Kubernetes
        const PodDisruptionBudget = Kubernetes.IoK8sApiPolicyV1beta1PodDisruptionBudget
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const PodDisruptionBudgetStatus = Kubernetes.IoK8sApiPolicyV1beta1PodDisruptionBudgetStatus
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const PodDisruptionBudgetList = Kubernetes.IoK8sApiPolicyV1beta1PodDisruptionBudgetList
        const PodDisruptionBudgetSpec = Kubernetes.IoK8sApiPolicyV1beta1PodDisruptionBudgetSpec
        const Eviction = Kubernetes.IoK8sApiPolicyV1beta1Eviction
    end # module PolicyV1beta1
    module Autoscaling
        using ..Kubernetes
        const APIGroup = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroup
    end # module Autoscaling
    module AppsV1beta2
        using ..Kubernetes
        const StatefulSet = Kubernetes.IoK8sApiAppsV1beta2StatefulSet
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const RollingUpdateStatefulSetStrategy = Kubernetes.IoK8sApiAppsV1beta2RollingUpdateStatefulSetStrategy
        const ScaleStatus = Kubernetes.IoK8sApiAppsV1beta2ScaleStatus
        const DaemonSetSpec = Kubernetes.IoK8sApiAppsV1beta2DaemonSetSpec
        const DeploymentSpec = Kubernetes.IoK8sApiAppsV1beta2DeploymentSpec
        const RollingUpdateDaemonSet = Kubernetes.IoK8sApiAppsV1beta2RollingUpdateDaemonSet
        const ReplicaSetCondition = Kubernetes.IoK8sApiAppsV1beta2ReplicaSetCondition
        const DeploymentStrategy = Kubernetes.IoK8sApiAppsV1beta2DeploymentStrategy
        const ReplicaSetStatus = Kubernetes.IoK8sApiAppsV1beta2ReplicaSetStatus
        const RollingUpdateDeployment = Kubernetes.IoK8sApiAppsV1beta2RollingUpdateDeployment
        const StatefulSetSpec = Kubernetes.IoK8sApiAppsV1beta2StatefulSetSpec
        const DeploymentStatus = Kubernetes.IoK8sApiAppsV1beta2DeploymentStatus
        const ReplicaSet = Kubernetes.IoK8sApiAppsV1beta2ReplicaSet
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const ControllerRevisionList = Kubernetes.IoK8sApiAppsV1beta2ControllerRevisionList
        const DaemonSetStatus = Kubernetes.IoK8sApiAppsV1beta2DaemonSetStatus
        const ScaleSpec = Kubernetes.IoK8sApiAppsV1beta2ScaleSpec
        const Deployment = Kubernetes.IoK8sApiAppsV1beta2Deployment
        const DaemonSetList = Kubernetes.IoK8sApiAppsV1beta2DaemonSetList
        const Scale = Kubernetes.IoK8sApiAppsV1beta2Scale
        const DaemonSet = Kubernetes.IoK8sApiAppsV1beta2DaemonSet
        const ControllerRevision = Kubernetes.IoK8sApiAppsV1beta2ControllerRevision
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const DeploymentList = Kubernetes.IoK8sApiAppsV1beta2DeploymentList
        const DeploymentCondition = Kubernetes.IoK8sApiAppsV1beta2DeploymentCondition
        const StatefulSetStatus = Kubernetes.IoK8sApiAppsV1beta2StatefulSetStatus
        const StatefulSetUpdateStrategy = Kubernetes.IoK8sApiAppsV1beta2StatefulSetUpdateStrategy
        const ReplicaSetList = Kubernetes.IoK8sApiAppsV1beta2ReplicaSetList
        const DaemonSetUpdateStrategy = Kubernetes.IoK8sApiAppsV1beta2DaemonSetUpdateStrategy
        const StatefulSetList = Kubernetes.IoK8sApiAppsV1beta2StatefulSetList
        const ReplicaSetSpec = Kubernetes.IoK8sApiAppsV1beta2ReplicaSetSpec
    end # module AppsV1beta2
    module Core
        using ..Kubernetes
        const APIVersions = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIVersions
    end # module Core
    module Authorization
        using ..Kubernetes
        const APIGroup = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroup
    end # module Authorization
    module Version
        using ..Kubernetes
        const Info = Kubernetes.IoK8sApimachineryPkgVersionInfo
    end # module Version
    module RbacAuthorization
        using ..Kubernetes
        const APIGroup = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroup
    end # module RbacAuthorization
    module AdmissionregistrationV1alpha1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const InitializerConfiguration = Kubernetes.IoK8sApiAdmissionregistrationV1alpha1InitializerConfiguration
        const InitializerConfigurationList = Kubernetes.IoK8sApiAdmissionregistrationV1alpha1InitializerConfigurationList
        const ExternalAdmissionHookConfiguration = Kubernetes.IoK8sApiAdmissionregistrationV1alpha1ExternalAdmissionHookConfiguration
        const ServiceReference = Kubernetes.IoK8sApiAdmissionregistrationV1alpha1ServiceReference
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const Rule = Kubernetes.IoK8sApiAdmissionregistrationV1alpha1Rule
        const RuleWithOperations = Kubernetes.IoK8sApiAdmissionregistrationV1alpha1RuleWithOperations
        const ExternalAdmissionHookConfigurationList = Kubernetes.IoK8sApiAdmissionregistrationV1alpha1ExternalAdmissionHookConfigurationList
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const Initializer = Kubernetes.IoK8sApiAdmissionregistrationV1alpha1Initializer
        const AdmissionHookClientConfig = Kubernetes.IoK8sApiAdmissionregistrationV1alpha1AdmissionHookClientConfig
        const ExternalAdmissionHook = Kubernetes.IoK8sApiAdmissionregistrationV1alpha1ExternalAdmissionHook
    end # module AdmissionregistrationV1alpha1
    module CertificatesV1beta1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const CertificateSigningRequestList = Kubernetes.IoK8sApiCertificatesV1beta1CertificateSigningRequestList
        const CertificateSigningRequestCondition = Kubernetes.IoK8sApiCertificatesV1beta1CertificateSigningRequestCondition
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const CertificateSigningRequestSpec = Kubernetes.IoK8sApiCertificatesV1beta1CertificateSigningRequestSpec
        const CertificateSigningRequestStatus = Kubernetes.IoK8sApiCertificatesV1beta1CertificateSigningRequestStatus
        const CertificateSigningRequest = Kubernetes.IoK8sApiCertificatesV1beta1CertificateSigningRequest
    end # module CertificatesV1beta1
    module Admissionregistration
        using ..Kubernetes
        const APIGroup = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroup
    end # module Admissionregistration
    module AutoscalingV2beta1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const PodsMetricSource = Kubernetes.IoK8sApiAutoscalingV2beta1PodsMetricSource
        const ResourceMetricStatus = Kubernetes.IoK8sApiAutoscalingV2beta1ResourceMetricStatus
        const MetricStatus = Kubernetes.IoK8sApiAutoscalingV2beta1MetricStatus
        const HorizontalPodAutoscalerCondition = Kubernetes.IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerCondition
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const CrossVersionObjectReference = Kubernetes.IoK8sApiAutoscalingV2beta1CrossVersionObjectReference
        const ResourceMetricSource = Kubernetes.IoK8sApiAutoscalingV2beta1ResourceMetricSource
        const ObjectMetricStatus = Kubernetes.IoK8sApiAutoscalingV2beta1ObjectMetricStatus
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const PodsMetricStatus = Kubernetes.IoK8sApiAutoscalingV2beta1PodsMetricStatus
        const MetricSpec = Kubernetes.IoK8sApiAutoscalingV2beta1MetricSpec
        const HorizontalPodAutoscalerList = Kubernetes.IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerList
        const HorizontalPodAutoscalerSpec = Kubernetes.IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerSpec
        const HorizontalPodAutoscaler = Kubernetes.IoK8sApiAutoscalingV2beta1HorizontalPodAutoscaler
        const HorizontalPodAutoscalerStatus = Kubernetes.IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerStatus
        const ObjectMetricSource = Kubernetes.IoK8sApiAutoscalingV2beta1ObjectMetricSource
    end # module AutoscalingV2beta1
    module BatchV1beta1
        using ..Kubernetes
        const CronJobList = Kubernetes.IoK8sApiBatchV1beta1CronJobList
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const CronJobSpec = Kubernetes.IoK8sApiBatchV1beta1CronJobSpec
        const JobTemplateSpec = Kubernetes.IoK8sApiBatchV1beta1JobTemplateSpec
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const CronJobStatus = Kubernetes.IoK8sApiBatchV1beta1CronJobStatus
        const CronJob = Kubernetes.IoK8sApiBatchV1beta1CronJob
    end # module BatchV1beta1
    module ExtensionsV1beta1
        using ..Kubernetes
        const IngressList = Kubernetes.IoK8sApiExtensionsV1beta1IngressList
        const ReplicaSetSpec = Kubernetes.IoK8sApiExtensionsV1beta1ReplicaSetSpec
        const ReplicaSet = Kubernetes.IoK8sApiExtensionsV1beta1ReplicaSet
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const RollingUpdateDeployment = Kubernetes.IoK8sApiExtensionsV1beta1RollingUpdateDeployment
        const NetworkPolicyPort = Kubernetes.IoK8sApiExtensionsV1beta1NetworkPolicyPort
        const IDRange = Kubernetes.IoK8sApiExtensionsV1beta1IDRange
        const ScaleSpec = Kubernetes.IoK8sApiExtensionsV1beta1ScaleSpec
        const DaemonSetStatus = Kubernetes.IoK8sApiExtensionsV1beta1DaemonSetStatus
        const Deployment = Kubernetes.IoK8sApiExtensionsV1beta1Deployment
        const NetworkPolicySpec = Kubernetes.IoK8sApiExtensionsV1beta1NetworkPolicySpec
        const DaemonSet = Kubernetes.IoK8sApiExtensionsV1beta1DaemonSet
        const AllowedHostPath = Kubernetes.IoK8sApiExtensionsV1beta1AllowedHostPath
        const DeploymentStatus = Kubernetes.IoK8sApiExtensionsV1beta1DeploymentStatus
        const NetworkPolicy = Kubernetes.IoK8sApiExtensionsV1beta1NetworkPolicy
        const DeploymentList = Kubernetes.IoK8sApiExtensionsV1beta1DeploymentList
        const NetworkPolicyPeer = Kubernetes.IoK8sApiExtensionsV1beta1NetworkPolicyPeer
        const IngressRule = Kubernetes.IoK8sApiExtensionsV1beta1IngressRule
        const Scale = Kubernetes.IoK8sApiExtensionsV1beta1Scale
        const FSGroupStrategyOptions = Kubernetes.IoK8sApiExtensionsV1beta1FSGroupStrategyOptions
        const DeploymentRollback = Kubernetes.IoK8sApiExtensionsV1beta1DeploymentRollback
        const HTTPIngressRuleValue = Kubernetes.IoK8sApiExtensionsV1beta1HTTPIngressRuleValue
        const ScaleStatus = Kubernetes.IoK8sApiExtensionsV1beta1ScaleStatus
        const PodSecurityPolicy = Kubernetes.IoK8sApiExtensionsV1beta1PodSecurityPolicy
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const ReplicaSetCondition = Kubernetes.IoK8sApiExtensionsV1beta1ReplicaSetCondition
        const ReplicaSetList = Kubernetes.IoK8sApiExtensionsV1beta1ReplicaSetList
        const IngressBackend = Kubernetes.IoK8sApiExtensionsV1beta1IngressBackend
        const IngressSpec = Kubernetes.IoK8sApiExtensionsV1beta1IngressSpec
        const DaemonSetSpec = Kubernetes.IoK8sApiExtensionsV1beta1DaemonSetSpec
        const Ingress = Kubernetes.IoK8sApiExtensionsV1beta1Ingress
        const IngressStatus = Kubernetes.IoK8sApiExtensionsV1beta1IngressStatus
        const SupplementalGroupsStrategyOptions = Kubernetes.IoK8sApiExtensionsV1beta1SupplementalGroupsStrategyOptions
        const NetworkPolicyList = Kubernetes.IoK8sApiExtensionsV1beta1NetworkPolicyList
        const IngressTLS = Kubernetes.IoK8sApiExtensionsV1beta1IngressTLS
        const PodSecurityPolicySpec = Kubernetes.IoK8sApiExtensionsV1beta1PodSecurityPolicySpec
        const ReplicaSetStatus = Kubernetes.IoK8sApiExtensionsV1beta1ReplicaSetStatus
        const RunAsUserStrategyOptions = Kubernetes.IoK8sApiExtensionsV1beta1RunAsUserStrategyOptions
        const IPBlock = Kubernetes.IoK8sApiExtensionsV1beta1IPBlock
        const NetworkPolicyEgressRule = Kubernetes.IoK8sApiExtensionsV1beta1NetworkPolicyEgressRule
        const DeploymentSpec = Kubernetes.IoK8sApiExtensionsV1beta1DeploymentSpec
        const SELinuxStrategyOptions = Kubernetes.IoK8sApiExtensionsV1beta1SELinuxStrategyOptions
        const NetworkPolicyIngressRule = Kubernetes.IoK8sApiExtensionsV1beta1NetworkPolicyIngressRule
        const RollingUpdateDaemonSet = Kubernetes.IoK8sApiExtensionsV1beta1RollingUpdateDaemonSet
        const DaemonSetList = Kubernetes.IoK8sApiExtensionsV1beta1DaemonSetList
        const DeploymentCondition = Kubernetes.IoK8sApiExtensionsV1beta1DeploymentCondition
        const HostPortRange = Kubernetes.IoK8sApiExtensionsV1beta1HostPortRange
        const DeploymentStrategy = Kubernetes.IoK8sApiExtensionsV1beta1DeploymentStrategy
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const HTTPIngressPath = Kubernetes.IoK8sApiExtensionsV1beta1HTTPIngressPath
        const DaemonSetUpdateStrategy = Kubernetes.IoK8sApiExtensionsV1beta1DaemonSetUpdateStrategy
        const PodSecurityPolicyList = Kubernetes.IoK8sApiExtensionsV1beta1PodSecurityPolicyList
        const RollbackConfig = Kubernetes.IoK8sApiExtensionsV1beta1RollbackConfig
    end # module ExtensionsV1beta1
    module ApiregistrationV1beta1
        using ..Kubernetes
        const APIService = Kubernetes.IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIService
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const ServiceReference = Kubernetes.IoK8sKubeAggregatorPkgApisApiregistrationV1beta1ServiceReference
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const APIServiceCondition = Kubernetes.IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceCondition
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const APIServiceList = Kubernetes.IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceList
        const APIServiceStatus = Kubernetes.IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceStatus
        const APIServiceSpec = Kubernetes.IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceSpec
    end # module ApiregistrationV1beta1
    module AuthenticationV1
        using ..Kubernetes
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const TokenReviewStatus = Kubernetes.IoK8sApiAuthenticationV1TokenReviewStatus
        const TokenReview = Kubernetes.IoK8sApiAuthenticationV1TokenReview
        const TokenReviewSpec = Kubernetes.IoK8sApiAuthenticationV1TokenReviewSpec
        const UserInfo = Kubernetes.IoK8sApiAuthenticationV1UserInfo
    end # module AuthenticationV1
    module Apiextensions
        using ..Kubernetes
        const APIGroup = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroup
    end # module Apiextensions
    module ApiextensionsV1beta1
        using ..Kubernetes
        const CustomResourceDefinitionCondition = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionCondition
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const JSONSchemaProps = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps
        const CustomResourceDefinitionNames = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionNames
        const JSONSchemaPropsOrArray = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaPropsOrArray
        const CustomResourceDefinition = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinition
        const JSON = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSON
        const JSONSchemaPropsOrBool = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaPropsOrBool
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const CustomResourceDefinitionList = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionList
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const CustomResourceDefinitionSpec = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionSpec
        const ExternalDocumentation = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1ExternalDocumentation
        const CustomResourceDefinitionStatus = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionStatus
        const CustomResourceValidation = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceValidation
        const JSONSchemaPropsOrStringArray = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaPropsOrStringArray
    end # module ApiextensionsV1beta1
    module RbacAuthorizationV1alpha1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const ClusterRoleBindingList = Kubernetes.IoK8sApiRbacV1alpha1ClusterRoleBindingList
        const ClusterRole = Kubernetes.IoK8sApiRbacV1alpha1ClusterRole
        const RoleBinding = Kubernetes.IoK8sApiRbacV1alpha1RoleBinding
        const RoleRef = Kubernetes.IoK8sApiRbacV1alpha1RoleRef
        const RoleBindingList = Kubernetes.IoK8sApiRbacV1alpha1RoleBindingList
        const Role = Kubernetes.IoK8sApiRbacV1alpha1Role
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const Subject = Kubernetes.IoK8sApiRbacV1alpha1Subject
        const ClusterRoleList = Kubernetes.IoK8sApiRbacV1alpha1ClusterRoleList
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const PolicyRule = Kubernetes.IoK8sApiRbacV1alpha1PolicyRule
        const ClusterRoleBinding = Kubernetes.IoK8sApiRbacV1alpha1ClusterRoleBinding
        const RoleList = Kubernetes.IoK8sApiRbacV1alpha1RoleList
    end # module RbacAuthorizationV1alpha1
    module NetworkingV1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const NetworkPolicyIngressRule = Kubernetes.IoK8sApiNetworkingV1NetworkPolicyIngressRule
        const NetworkPolicyEgressRule = Kubernetes.IoK8sApiNetworkingV1NetworkPolicyEgressRule
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const NetworkPolicyList = Kubernetes.IoK8sApiNetworkingV1NetworkPolicyList
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const NetworkPolicyPort = Kubernetes.IoK8sApiNetworkingV1NetworkPolicyPort
        const NetworkPolicySpec = Kubernetes.IoK8sApiNetworkingV1NetworkPolicySpec
        const NetworkPolicy = Kubernetes.IoK8sApiNetworkingV1NetworkPolicy
        const NetworkPolicyPeer = Kubernetes.IoK8sApiNetworkingV1NetworkPolicyPeer
        const IPBlock = Kubernetes.IoK8sApiNetworkingV1IPBlock
    end # module NetworkingV1
    module SettingsV1alpha1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const PodPreset = Kubernetes.IoK8sApiSettingsV1alpha1PodPreset
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const PodPresetSpec = Kubernetes.IoK8sApiSettingsV1alpha1PodPresetSpec
        const PodPresetList = Kubernetes.IoK8sApiSettingsV1alpha1PodPresetList
    end # module SettingsV1alpha1
    module Storage
        using ..Kubernetes
        const APIGroup = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroup
    end # module Storage
    module RbacAuthorizationV1beta1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const ClusterRoleBinding = Kubernetes.IoK8sApiRbacV1beta1ClusterRoleBinding
        const PolicyRule = Kubernetes.IoK8sApiRbacV1beta1PolicyRule
        const RoleList = Kubernetes.IoK8sApiRbacV1beta1RoleList
        const RoleBinding = Kubernetes.IoK8sApiRbacV1beta1RoleBinding
        const Subject = Kubernetes.IoK8sApiRbacV1beta1Subject
        const ClusterRole = Kubernetes.IoK8sApiRbacV1beta1ClusterRole
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const RoleBindingList = Kubernetes.IoK8sApiRbacV1beta1RoleBindingList
        const ClusterRoleList = Kubernetes.IoK8sApiRbacV1beta1ClusterRoleList
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const RoleRef = Kubernetes.IoK8sApiRbacV1beta1RoleRef
        const ClusterRoleBindingList = Kubernetes.IoK8sApiRbacV1beta1ClusterRoleBindingList
        const Role = Kubernetes.IoK8sApiRbacV1beta1Role
    end # module RbacAuthorizationV1beta1
    module Batch
        using ..Kubernetes
        const APIGroup = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroup
    end # module Batch
    module SchedulingV1alpha1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const PriorityClassList = Kubernetes.IoK8sApiSchedulingV1alpha1PriorityClassList
        const PriorityClass = Kubernetes.IoK8sApiSchedulingV1alpha1PriorityClass
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
    end # module SchedulingV1alpha1
    module Settings
        using ..Kubernetes
        const APIGroup = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroup
    end # module Settings
    module Apps
        using ..Kubernetes
        const APIGroup = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroup
    end # module Apps
    module AppsV1beta1
        using ..Kubernetes
        const DeploymentStatus = Kubernetes.IoK8sApiAppsV1beta1DeploymentStatus
        const DeploymentRollback = Kubernetes.IoK8sApiAppsV1beta1DeploymentRollback
        const ControllerRevisionList = Kubernetes.IoK8sApiAppsV1beta1ControllerRevisionList
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const DeploymentSpec = Kubernetes.IoK8sApiAppsV1beta1DeploymentSpec
        const ScaleSpec = Kubernetes.IoK8sApiAppsV1beta1ScaleSpec
        const StatefulSetList = Kubernetes.IoK8sApiAppsV1beta1StatefulSetList
        const DeploymentCondition = Kubernetes.IoK8sApiAppsV1beta1DeploymentCondition
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const DeploymentList = Kubernetes.IoK8sApiAppsV1beta1DeploymentList
        const StatefulSetUpdateStrategy = Kubernetes.IoK8sApiAppsV1beta1StatefulSetUpdateStrategy
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const Scale = Kubernetes.IoK8sApiAppsV1beta1Scale
        const RollingUpdateDeployment = Kubernetes.IoK8sApiAppsV1beta1RollingUpdateDeployment
        const ScaleStatus = Kubernetes.IoK8sApiAppsV1beta1ScaleStatus
        const StatefulSetSpec = Kubernetes.IoK8sApiAppsV1beta1StatefulSetSpec
        const ControllerRevision = Kubernetes.IoK8sApiAppsV1beta1ControllerRevision
        const StatefulSet = Kubernetes.IoK8sApiAppsV1beta1StatefulSet
        const RollingUpdateStatefulSetStrategy = Kubernetes.IoK8sApiAppsV1beta1RollingUpdateStatefulSetStrategy
        const DeploymentStrategy = Kubernetes.IoK8sApiAppsV1beta1DeploymentStrategy
        const RollbackConfig = Kubernetes.IoK8sApiAppsV1beta1RollbackConfig
        const StatefulSetStatus = Kubernetes.IoK8sApiAppsV1beta1StatefulSetStatus
        const Deployment = Kubernetes.IoK8sApiAppsV1beta1Deployment
    end # module AppsV1beta1
    module Authentication
        using ..Kubernetes
        const APIGroup = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroup
    end # module Authentication
    module AuthorizationV1
        using ..Kubernetes
        const SelfSubjectRulesReview = Kubernetes.IoK8sApiAuthorizationV1SelfSubjectRulesReview
        const LocalSubjectAccessReview = Kubernetes.IoK8sApiAuthorizationV1LocalSubjectAccessReview
        const SubjectAccessReviewSpec = Kubernetes.IoK8sApiAuthorizationV1SubjectAccessReviewSpec
        const ResourceAttributes = Kubernetes.IoK8sApiAuthorizationV1ResourceAttributes
        const NonResourceRule = Kubernetes.IoK8sApiAuthorizationV1NonResourceRule
        const SubjectAccessReview = Kubernetes.IoK8sApiAuthorizationV1SubjectAccessReview
        const SelfSubjectAccessReviewSpec = Kubernetes.IoK8sApiAuthorizationV1SelfSubjectAccessReviewSpec
        const SubjectAccessReviewStatus = Kubernetes.IoK8sApiAuthorizationV1SubjectAccessReviewStatus
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const SubjectRulesReviewStatus = Kubernetes.IoK8sApiAuthorizationV1SubjectRulesReviewStatus
        const SelfSubjectRulesReviewSpec = Kubernetes.IoK8sApiAuthorizationV1SelfSubjectRulesReviewSpec
        const NonResourceAttributes = Kubernetes.IoK8sApiAuthorizationV1NonResourceAttributes
        const ResourceRule = Kubernetes.IoK8sApiAuthorizationV1ResourceRule
        const SelfSubjectAccessReview = Kubernetes.IoK8sApiAuthorizationV1SelfSubjectAccessReview
    end # module AuthorizationV1
    module MetaV1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const GroupVersionForDiscovery = Kubernetes.IoK8sApimachineryPkgApisMetaV1GroupVersionForDiscovery
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const APIGroup = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroup
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const APIVersions = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIVersions
        const LabelSelector = Kubernetes.IoK8sApimachineryPkgApisMetaV1LabelSelector
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const StatusCause = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusCause
        const DeleteOptions = Kubernetes.IoK8sApimachineryPkgApisMetaV1DeleteOptions
        const LabelSelectorRequirement = Kubernetes.IoK8sApimachineryPkgApisMetaV1LabelSelectorRequirement
        const ServerAddressByClientCIDR = Kubernetes.IoK8sApimachineryPkgApisMetaV1ServerAddressByClientCIDR
        const APIResource = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResource
        const Initializer = Kubernetes.IoK8sApimachineryPkgApisMetaV1Initializer
        const Initializers = Kubernetes.IoK8sApimachineryPkgApisMetaV1Initializers
        const OwnerReference = Kubernetes.IoK8sApimachineryPkgApisMetaV1OwnerReference
        const Preconditions = Kubernetes.IoK8sApimachineryPkgApisMetaV1Preconditions
    end # module MetaV1
    module BatchV2alpha1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const CronJobSpec = Kubernetes.IoK8sApiBatchV2alpha1CronJobSpec
        const CronJob = Kubernetes.IoK8sApiBatchV2alpha1CronJob
        const CronJobStatus = Kubernetes.IoK8sApiBatchV2alpha1CronJobStatus
        const CronJobList = Kubernetes.IoK8sApiBatchV2alpha1CronJobList
        const JobTemplateSpec = Kubernetes.IoK8sApiBatchV2alpha1JobTemplateSpec
    end # module BatchV2alpha1
    module Scheduling
        using ..Kubernetes
        const APIGroup = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroup
    end # module Scheduling
    module Apiregistration
        using ..Kubernetes
        const APIGroup = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroup
    end # module Apiregistration
    module Policy
        using ..Kubernetes
        const APIGroup = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroup
    end # module Policy
    module CoreV1
        using ..Kubernetes
        const Capabilities = Kubernetes.IoK8sApiCoreV1Capabilities
        const NodeConfigSource = Kubernetes.IoK8sApiCoreV1NodeConfigSource
        const NodeSystemInfo = Kubernetes.IoK8sApiCoreV1NodeSystemInfo
        const PodTemplate = Kubernetes.IoK8sApiCoreV1PodTemplate
        const Volume = Kubernetes.IoK8sApiCoreV1Volume
        const ContainerStatus = Kubernetes.IoK8sApiCoreV1ContainerStatus
        const NodeCondition = Kubernetes.IoK8sApiCoreV1NodeCondition
        const NamespaceStatus = Kubernetes.IoK8sApiCoreV1NamespaceStatus
        const EnvFromSource = Kubernetes.IoK8sApiCoreV1EnvFromSource
        const FlexVolumeSource = Kubernetes.IoK8sApiCoreV1FlexVolumeSource
        const EndpointPort = Kubernetes.IoK8sApiCoreV1EndpointPort
        const Namespace = Kubernetes.IoK8sApiCoreV1Namespace
        const Handler = Kubernetes.IoK8sApiCoreV1Handler
        const ProjectedVolumeSource = Kubernetes.IoK8sApiCoreV1ProjectedVolumeSource
        const PodAffinity = Kubernetes.IoK8sApiCoreV1PodAffinity
        const PodTemplateSpec = Kubernetes.IoK8sApiCoreV1PodTemplateSpec
        const VsphereVirtualDiskVolumeSource = Kubernetes.IoK8sApiCoreV1VsphereVirtualDiskVolumeSource
        const Probe = Kubernetes.IoK8sApiCoreV1Probe
        const HostAlias = Kubernetes.IoK8sApiCoreV1HostAlias
        const ComponentStatusList = Kubernetes.IoK8sApiCoreV1ComponentStatusList
        const EndpointsList = Kubernetes.IoK8sApiCoreV1EndpointsList
        const WeightedPodAffinityTerm = Kubernetes.IoK8sApiCoreV1WeightedPodAffinityTerm
        const EndpointSubset = Kubernetes.IoK8sApiCoreV1EndpointSubset
        const NodeSelector = Kubernetes.IoK8sApiCoreV1NodeSelector
        const DaemonEndpoint = Kubernetes.IoK8sApiCoreV1DaemonEndpoint
        const DownwardAPIVolumeFile = Kubernetes.IoK8sApiCoreV1DownwardAPIVolumeFile
        const LocalVolumeSource = Kubernetes.IoK8sApiCoreV1LocalVolumeSource
        const ResourceFieldSelector = Kubernetes.IoK8sApiCoreV1ResourceFieldSelector
        const ConfigMapEnvSource = Kubernetes.IoK8sApiCoreV1ConfigMapEnvSource
        const CephFSPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1CephFSPersistentVolumeSource
        const DownwardAPIVolumeSource = Kubernetes.IoK8sApiCoreV1DownwardAPIVolumeSource
        const NamespaceSpec = Kubernetes.IoK8sApiCoreV1NamespaceSpec
        const EventList = Kubernetes.IoK8sApiCoreV1EventList
        const ContainerStateRunning = Kubernetes.IoK8sApiCoreV1ContainerStateRunning
        const PersistentVolumeList = Kubernetes.IoK8sApiCoreV1PersistentVolumeList
        const Scale = Kubernetes.IoK8sApiAutoscalingV1Scale
        const PortworxVolumeSource = Kubernetes.IoK8sApiCoreV1PortworxVolumeSource
        const SecretVolumeSource = Kubernetes.IoK8sApiCoreV1SecretVolumeSource
        const PhotonPersistentDiskVolumeSource = Kubernetes.IoK8sApiCoreV1PhotonPersistentDiskVolumeSource
        const NodeAddress = Kubernetes.IoK8sApiCoreV1NodeAddress
        const EndpointAddress = Kubernetes.IoK8sApiCoreV1EndpointAddress
        const PersistentVolumeClaimList = Kubernetes.IoK8sApiCoreV1PersistentVolumeClaimList
        const ContainerStateTerminated = Kubernetes.IoK8sApiCoreV1ContainerStateTerminated
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const SessionAffinityConfig = Kubernetes.IoK8sApiCoreV1SessionAffinityConfig
        const Event = Kubernetes.IoK8sApiCoreV1Event
        const EnvVar = Kubernetes.IoK8sApiCoreV1EnvVar
        const FCVolumeSource = Kubernetes.IoK8sApiCoreV1FCVolumeSource
        const VolumeProjection = Kubernetes.IoK8sApiCoreV1VolumeProjection
        const FlockerVolumeSource = Kubernetes.IoK8sApiCoreV1FlockerVolumeSource
        const NodeSpec = Kubernetes.IoK8sApiCoreV1NodeSpec
        const PersistentVolumeClaimStatus = Kubernetes.IoK8sApiCoreV1PersistentVolumeClaimStatus
        const ResourceQuota = Kubernetes.IoK8sApiCoreV1ResourceQuota
        const ResourceRequirements = Kubernetes.IoK8sApiCoreV1ResourceRequirements
        const Lifecycle = Kubernetes.IoK8sApiCoreV1Lifecycle
        const ServiceAccountList = Kubernetes.IoK8sApiCoreV1ServiceAccountList
        const EnvVarSource = Kubernetes.IoK8sApiCoreV1EnvVarSource
        const SecretProjection = Kubernetes.IoK8sApiCoreV1SecretProjection
        const ConfigMapVolumeSource = Kubernetes.IoK8sApiCoreV1ConfigMapVolumeSource
        const PodStatus = Kubernetes.IoK8sApiCoreV1PodStatus
        const ReplicationControllerStatus = Kubernetes.IoK8sApiCoreV1ReplicationControllerStatus
        const ContainerImage = Kubernetes.IoK8sApiCoreV1ContainerImage
        const NFSVolumeSource = Kubernetes.IoK8sApiCoreV1NFSVolumeSource
        const ClientIPConfig = Kubernetes.IoK8sApiCoreV1ClientIPConfig
        const PreferredSchedulingTerm = Kubernetes.IoK8sApiCoreV1PreferredSchedulingTerm
        const AWSElasticBlockStoreVolumeSource = Kubernetes.IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource
        const LimitRange = Kubernetes.IoK8sApiCoreV1LimitRange
        const SecretKeySelector = Kubernetes.IoK8sApiCoreV1SecretKeySelector
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const ServiceAccount = Kubernetes.IoK8sApiCoreV1ServiceAccount
        const EmptyDirVolumeSource = Kubernetes.IoK8sApiCoreV1EmptyDirVolumeSource
        const PodTemplateList = Kubernetes.IoK8sApiCoreV1PodTemplateList
        const VolumeMount = Kubernetes.IoK8sApiCoreV1VolumeMount
        const ConfigMapKeySelector = Kubernetes.IoK8sApiCoreV1ConfigMapKeySelector
        const Service = Kubernetes.IoK8sApiCoreV1Service
        const SecretEnvSource = Kubernetes.IoK8sApiCoreV1SecretEnvSource
        const LimitRangeSpec = Kubernetes.IoK8sApiCoreV1LimitRangeSpec
        const ServiceStatus = Kubernetes.IoK8sApiCoreV1ServiceStatus
        const ReplicationController = Kubernetes.IoK8sApiCoreV1ReplicationController
        const LimitRangeItem = Kubernetes.IoK8sApiCoreV1LimitRangeItem
        const GlusterfsVolumeSource = Kubernetes.IoK8sApiCoreV1GlusterfsVolumeSource
        const AzureDiskVolumeSource = Kubernetes.IoK8sApiCoreV1AzureDiskVolumeSource
        const LoadBalancerIngress = Kubernetes.IoK8sApiCoreV1LoadBalancerIngress
        const Binding = Kubernetes.IoK8sApiCoreV1Binding
        const Node = Kubernetes.IoK8sApiCoreV1Node
        const PodAntiAffinity = Kubernetes.IoK8sApiCoreV1PodAntiAffinity
        const PersistentVolumeSpec = Kubernetes.IoK8sApiCoreV1PersistentVolumeSpec
        const DownwardAPIProjection = Kubernetes.IoK8sApiCoreV1DownwardAPIProjection
        const SecretList = Kubernetes.IoK8sApiCoreV1SecretList
        const GitRepoVolumeSource = Kubernetes.IoK8sApiCoreV1GitRepoVolumeSource
        const ReplicationControllerSpec = Kubernetes.IoK8sApiCoreV1ReplicationControllerSpec
        const NodeDaemonEndpoints = Kubernetes.IoK8sApiCoreV1NodeDaemonEndpoints
        const NodeList = Kubernetes.IoK8sApiCoreV1NodeList
        const PersistentVolumeClaimSpec = Kubernetes.IoK8sApiCoreV1PersistentVolumeClaimSpec
        const PersistentVolumeClaimCondition = Kubernetes.IoK8sApiCoreV1PersistentVolumeClaimCondition
        const ContainerPort = Kubernetes.IoK8sApiCoreV1ContainerPort
        const StorageOSPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1StorageOSPersistentVolumeSource
        const PodList = Kubernetes.IoK8sApiCoreV1PodList
        const GCEPersistentDiskVolumeSource = Kubernetes.IoK8sApiCoreV1GCEPersistentDiskVolumeSource
        const ReplicationControllerCondition = Kubernetes.IoK8sApiCoreV1ReplicationControllerCondition
        const ServiceSpec = Kubernetes.IoK8sApiCoreV1ServiceSpec
        const NodeSelectorRequirement = Kubernetes.IoK8sApiCoreV1NodeSelectorRequirement
        const LocalObjectReference = Kubernetes.IoK8sApiCoreV1LocalObjectReference
        const ServicePort = Kubernetes.IoK8sApiCoreV1ServicePort
        const Endpoints = Kubernetes.IoK8sApiCoreV1Endpoints
        const PodCondition = Kubernetes.IoK8sApiCoreV1PodCondition
        const NodeStatus = Kubernetes.IoK8sApiCoreV1NodeStatus
        const CephFSVolumeSource = Kubernetes.IoK8sApiCoreV1CephFSVolumeSource
        const SecretReference = Kubernetes.IoK8sApiCoreV1SecretReference
        const Container = Kubernetes.IoK8sApiCoreV1Container
        const SecurityContext = Kubernetes.IoK8sApiCoreV1SecurityContext
        const ScaleIOPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1ScaleIOPersistentVolumeSource
        const ObjectFieldSelector = Kubernetes.IoK8sApiCoreV1ObjectFieldSelector
        const PodSpec = Kubernetes.IoK8sApiCoreV1PodSpec
        const Affinity = Kubernetes.IoK8sApiCoreV1Affinity
        const CinderVolumeSource = Kubernetes.IoK8sApiCoreV1CinderVolumeSource
        const Pod = Kubernetes.IoK8sApiCoreV1Pod
        const LoadBalancerStatus = Kubernetes.IoK8sApiCoreV1LoadBalancerStatus
        const Taint = Kubernetes.IoK8sApiCoreV1Taint
        const AzureFileVolumeSource = Kubernetes.IoK8sApiCoreV1AzureFileVolumeSource
        const NamespaceList = Kubernetes.IoK8sApiCoreV1NamespaceList
        const Eviction = Kubernetes.IoK8sApiPolicyV1beta1Eviction
        const ExecAction = Kubernetes.IoK8sApiCoreV1ExecAction
        const NodeSelectorTerm = Kubernetes.IoK8sApiCoreV1NodeSelectorTerm
        const ConfigMap = Kubernetes.IoK8sApiCoreV1ConfigMap
        const ComponentCondition = Kubernetes.IoK8sApiCoreV1ComponentCondition
        const KeyToPath = Kubernetes.IoK8sApiCoreV1KeyToPath
        const ResourceQuotaList = Kubernetes.IoK8sApiCoreV1ResourceQuotaList
        const RBDVolumeSource = Kubernetes.IoK8sApiCoreV1RBDVolumeSource
        const StorageOSVolumeSource = Kubernetes.IoK8sApiCoreV1StorageOSVolumeSource
        const Secret = Kubernetes.IoK8sApiCoreV1Secret
        const ContainerState = Kubernetes.IoK8sApiCoreV1ContainerState
        const LimitRangeList = Kubernetes.IoK8sApiCoreV1LimitRangeList
        const PersistentVolume = Kubernetes.IoK8sApiCoreV1PersistentVolume
        const TCPSocketAction = Kubernetes.IoK8sApiCoreV1TCPSocketAction
        const Toleration = Kubernetes.IoK8sApiCoreV1Toleration
        const PersistentVolumeStatus = Kubernetes.IoK8sApiCoreV1PersistentVolumeStatus
        const NodeAffinity = Kubernetes.IoK8sApiCoreV1NodeAffinity
        const ServiceList = Kubernetes.IoK8sApiCoreV1ServiceList
        const ReplicationControllerList = Kubernetes.IoK8sApiCoreV1ReplicationControllerList
        const ResourceQuotaSpec = Kubernetes.IoK8sApiCoreV1ResourceQuotaSpec
        const AttachedVolume = Kubernetes.IoK8sApiCoreV1AttachedVolume
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const ScaleIOVolumeSource = Kubernetes.IoK8sApiCoreV1ScaleIOVolumeSource
        const SELinuxOptions = Kubernetes.IoK8sApiCoreV1SELinuxOptions
        const ConfigMapList = Kubernetes.IoK8sApiCoreV1ConfigMapList
        const EventSource = Kubernetes.IoK8sApiCoreV1EventSource
        const ContainerStateWaiting = Kubernetes.IoK8sApiCoreV1ContainerStateWaiting
        const PodSecurityContext = Kubernetes.IoK8sApiCoreV1PodSecurityContext
        const ResourceQuotaStatus = Kubernetes.IoK8sApiCoreV1ResourceQuotaStatus
        const PersistentVolumeClaim = Kubernetes.IoK8sApiCoreV1PersistentVolumeClaim
        const HostPathVolumeSource = Kubernetes.IoK8sApiCoreV1HostPathVolumeSource
        const ConfigMapProjection = Kubernetes.IoK8sApiCoreV1ConfigMapProjection
        const QuobyteVolumeSource = Kubernetes.IoK8sApiCoreV1QuobyteVolumeSource
        const ISCSIVolumeSource = Kubernetes.IoK8sApiCoreV1ISCSIVolumeSource
        const ObjectReference = Kubernetes.IoK8sApiCoreV1ObjectReference
        const HTTPHeader = Kubernetes.IoK8sApiCoreV1HTTPHeader
        const PodAffinityTerm = Kubernetes.IoK8sApiCoreV1PodAffinityTerm
        const PersistentVolumeClaimVolumeSource = Kubernetes.IoK8sApiCoreV1PersistentVolumeClaimVolumeSource
        const AzureFilePersistentVolumeSource = Kubernetes.IoK8sApiCoreV1AzureFilePersistentVolumeSource
        const ComponentStatus = Kubernetes.IoK8sApiCoreV1ComponentStatus
        const HTTPGetAction = Kubernetes.IoK8sApiCoreV1HTTPGetAction
    end # module CoreV1
    module RbacAuthorizationV1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const ClusterRoleBinding = Kubernetes.IoK8sApiRbacV1ClusterRoleBinding
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const RoleList = Kubernetes.IoK8sApiRbacV1RoleList
        const PolicyRule = Kubernetes.IoK8sApiRbacV1PolicyRule
        const RoleBinding = Kubernetes.IoK8sApiRbacV1RoleBinding
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const RoleBindingList = Kubernetes.IoK8sApiRbacV1RoleBindingList
        const Subject = Kubernetes.IoK8sApiRbacV1Subject
        const ClusterRole = Kubernetes.IoK8sApiRbacV1ClusterRole
        const RoleRef = Kubernetes.IoK8sApiRbacV1RoleRef
        const ClusterRoleList = Kubernetes.IoK8sApiRbacV1ClusterRoleList
        const Role = Kubernetes.IoK8sApiRbacV1Role
        const ClusterRoleBindingList = Kubernetes.IoK8sApiRbacV1ClusterRoleBindingList
    end # module RbacAuthorizationV1
end # module Typedefs
