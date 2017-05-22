module Typedefs
    using ..Kubernetes

    const PFX = [
        ("IoK8sKubernetesPkgApisVersion", :Version)
        ,("IoK8sKubernetesPkgApisStorageV1beta1", :StorageV1beta1)
        ,("IoK8sKubernetesPkgApisStorageV1", :StorageV1)
        ,("IoK8sKubernetesPkgApisStorage", :Storage)
        ,("IoK8sKubernetesPkgApisSettingsV1alpha1", :SettingsV1alpha1)
        ,("IoK8sKubernetesPkgApisSettings", :Settings)
        ,("IoK8sKubernetesPkgApisRbacV1beta1", :RbacAuthorizationV1beta1)
        ,("IoK8sKubernetesPkgApisRbacV1alpha1", :RbacAuthorizationV1alpha1)
        ,("IoK8sKubernetesPkgApisRbacAuthorizationV1beta1", :RbacAuthorizationV1beta1)
        ,("IoK8sKubernetesPkgApisRbacAuthorizationV1alpha1", :RbacAuthorizationV1alpha1)
        ,("IoK8sKubernetesPkgApisRbacAuthorization", :RbacAuthorization)
        ,("IoK8sKubernetesPkgApisPolicyV1beta1", :PolicyV1beta1)
        ,("IoK8sKubernetesPkgApisPolicy", :Policy)
        ,("IoK8sKubernetesPkgApisLogs", :Logs)
        ,("IoK8sKubernetesPkgApisExtensionsV1beta1", :ExtensionsV1beta1)
        ,("IoK8sKubernetesPkgApisExtensions", :Extensions)
        ,("IoK8sKubernetesPkgApisCertificatesV1beta1", :CertificatesV1beta1)
        ,("IoK8sKubernetesPkgApisCertificates", :Certificates)
        ,("IoK8sKubernetesPkgApisBatchV2alpha1", :BatchV2alpha1)
        ,("IoK8sKubernetesPkgApisBatchV1", :BatchV1)
        ,("IoK8sKubernetesPkgApisBatch", :Batch)
        ,("IoK8sKubernetesPkgApisAutoscalingV2alpha1", :AutoscalingV2alpha1)
        ,("IoK8sKubernetesPkgApisAutoscalingV1", :AutoscalingV1)
        ,("IoK8sKubernetesPkgApisAutoscaling", :Autoscaling)
        ,("IoK8sKubernetesPkgApisAuthorizationV1beta1", :AuthorizationV1beta1)
        ,("IoK8sKubernetesPkgApisAuthorizationV1", :AuthorizationV1)
        ,("IoK8sKubernetesPkgApisAuthorization", :Authorization)
        ,("IoK8sKubernetesPkgApisAuthenticationV1beta1", :AuthenticationV1beta1)
        ,("IoK8sKubernetesPkgApisAuthenticationV1", :AuthenticationV1)
        ,("IoK8sKubernetesPkgApisAuthentication", :Authentication)
        ,("IoK8sKubernetesPkgApisAppsV1beta1", :AppsV1beta1)
        ,("IoK8sKubernetesPkgApisApps", :Apps)
        ,("IoK8sKubernetesPkgApisApis", :Apis)
        ,("IoK8sKubernetesPkgApiV1", :CoreV1)
        ,("IoK8sKubernetesPkgApi", :Core)
        ,("IoK8sApimachineryPkgUtil", :Apis)
        ,("IoK8sApimachineryPkgApisMetaV1", :Apis)
        ,("IoK8sApimachineryPkgApi", :Apis)
    ]

    module AppsV1beta1
        using ..Kubernetes
        const Deployment = Kubernetes.IoK8sKubernetesPkgApisAppsV1beta1Deployment
        const DeploymentCondition = Kubernetes.IoK8sKubernetesPkgApisAppsV1beta1DeploymentCondition
        const DeploymentList = Kubernetes.IoK8sKubernetesPkgApisAppsV1beta1DeploymentList
        const DeploymentRollback = Kubernetes.IoK8sKubernetesPkgApisAppsV1beta1DeploymentRollback
        const DeploymentSpec = Kubernetes.IoK8sKubernetesPkgApisAppsV1beta1DeploymentSpec
        const DeploymentStatus = Kubernetes.IoK8sKubernetesPkgApisAppsV1beta1DeploymentStatus
        const DeploymentStrategy = Kubernetes.IoK8sKubernetesPkgApisAppsV1beta1DeploymentStrategy
        const RollbackConfig = Kubernetes.IoK8sKubernetesPkgApisAppsV1beta1RollbackConfig
        const RollingUpdateDeployment = Kubernetes.IoK8sKubernetesPkgApisAppsV1beta1RollingUpdateDeployment
        const Scale = Kubernetes.IoK8sKubernetesPkgApisAppsV1beta1Scale
        const ScaleSpec = Kubernetes.IoK8sKubernetesPkgApisAppsV1beta1ScaleSpec
        const ScaleStatus = Kubernetes.IoK8sKubernetesPkgApisAppsV1beta1ScaleStatus
        const StatefulSet = Kubernetes.IoK8sKubernetesPkgApisAppsV1beta1StatefulSet
        const StatefulSetList = Kubernetes.IoK8sKubernetesPkgApisAppsV1beta1StatefulSetList
        const StatefulSetSpec = Kubernetes.IoK8sKubernetesPkgApisAppsV1beta1StatefulSetSpec
        const StatefulSetStatus = Kubernetes.IoK8sKubernetesPkgApisAppsV1beta1StatefulSetStatus
    end # module AppsV1beta1
    module AutoscalingV1
        using ..Kubernetes
        const CrossVersionObjectReference = Kubernetes.IoK8sKubernetesPkgApisAutoscalingV1CrossVersionObjectReference
        const HorizontalPodAutoscaler = Kubernetes.IoK8sKubernetesPkgApisAutoscalingV1HorizontalPodAutoscaler
        const HorizontalPodAutoscalerList = Kubernetes.IoK8sKubernetesPkgApisAutoscalingV1HorizontalPodAutoscalerList
        const HorizontalPodAutoscalerSpec = Kubernetes.IoK8sKubernetesPkgApisAutoscalingV1HorizontalPodAutoscalerSpec
        const HorizontalPodAutoscalerStatus = Kubernetes.IoK8sKubernetesPkgApisAutoscalingV1HorizontalPodAutoscalerStatus
        const Scale = Kubernetes.IoK8sKubernetesPkgApisAutoscalingV1Scale
        const ScaleSpec = Kubernetes.IoK8sKubernetesPkgApisAutoscalingV1ScaleSpec
        const ScaleStatus = Kubernetes.IoK8sKubernetesPkgApisAutoscalingV1ScaleStatus
    end # module AutoscalingV1
    module BatchV1
        using ..Kubernetes
        const Job = Kubernetes.IoK8sKubernetesPkgApisBatchV1Job
        const JobCondition = Kubernetes.IoK8sKubernetesPkgApisBatchV1JobCondition
        const JobList = Kubernetes.IoK8sKubernetesPkgApisBatchV1JobList
        const JobSpec = Kubernetes.IoK8sKubernetesPkgApisBatchV1JobSpec
        const JobStatus = Kubernetes.IoK8sKubernetesPkgApisBatchV1JobStatus
    end # module BatchV1
    module StorageV1
        using ..Kubernetes
        const StorageClass = Kubernetes.IoK8sKubernetesPkgApisStorageV1StorageClass
        const StorageClassList = Kubernetes.IoK8sKubernetesPkgApisStorageV1StorageClassList
    end # module StorageV1
    module AuthorizationV1
        using ..Kubernetes
        const LocalSubjectAccessReview = Kubernetes.IoK8sKubernetesPkgApisAuthorizationV1LocalSubjectAccessReview
        const NonResourceAttributes = Kubernetes.IoK8sKubernetesPkgApisAuthorizationV1NonResourceAttributes
        const ResourceAttributes = Kubernetes.IoK8sKubernetesPkgApisAuthorizationV1ResourceAttributes
        const SelfSubjectAccessReview = Kubernetes.IoK8sKubernetesPkgApisAuthorizationV1SelfSubjectAccessReview
        const SelfSubjectAccessReviewSpec = Kubernetes.IoK8sKubernetesPkgApisAuthorizationV1SelfSubjectAccessReviewSpec
        const SubjectAccessReview = Kubernetes.IoK8sKubernetesPkgApisAuthorizationV1SubjectAccessReview
        const SubjectAccessReviewSpec = Kubernetes.IoK8sKubernetesPkgApisAuthorizationV1SubjectAccessReviewSpec
        const SubjectAccessReviewStatus = Kubernetes.IoK8sKubernetesPkgApisAuthorizationV1SubjectAccessReviewStatus
    end # module AuthorizationV1
    module RbacAuthorizationV1alpha1
        using ..Kubernetes
        const ClusterRole = Kubernetes.IoK8sKubernetesPkgApisRbacV1alpha1ClusterRole
        const ClusterRoleBinding = Kubernetes.IoK8sKubernetesPkgApisRbacV1alpha1ClusterRoleBinding
        const ClusterRoleBindingList = Kubernetes.IoK8sKubernetesPkgApisRbacV1alpha1ClusterRoleBindingList
        const ClusterRoleList = Kubernetes.IoK8sKubernetesPkgApisRbacV1alpha1ClusterRoleList
        const PolicyRule = Kubernetes.IoK8sKubernetesPkgApisRbacV1alpha1PolicyRule
        const Role = Kubernetes.IoK8sKubernetesPkgApisRbacV1alpha1Role
        const RoleBinding = Kubernetes.IoK8sKubernetesPkgApisRbacV1alpha1RoleBinding
        const RoleBindingList = Kubernetes.IoK8sKubernetesPkgApisRbacV1alpha1RoleBindingList
        const RoleList = Kubernetes.IoK8sKubernetesPkgApisRbacV1alpha1RoleList
        const RoleRef = Kubernetes.IoK8sKubernetesPkgApisRbacV1alpha1RoleRef
        const Subject = Kubernetes.IoK8sKubernetesPkgApisRbacV1alpha1Subject
    end # module RbacAuthorizationV1alpha1
    module SettingsV1alpha1
        using ..Kubernetes
        const PodPreset = Kubernetes.IoK8sKubernetesPkgApisSettingsV1alpha1PodPreset
        const PodPresetList = Kubernetes.IoK8sKubernetesPkgApisSettingsV1alpha1PodPresetList
        const PodPresetSpec = Kubernetes.IoK8sKubernetesPkgApisSettingsV1alpha1PodPresetSpec
    end # module SettingsV1alpha1
    module CertificatesV1beta1
        using ..Kubernetes
        const CertificateSigningRequest = Kubernetes.IoK8sKubernetesPkgApisCertificatesV1beta1CertificateSigningRequest
        const CertificateSigningRequestCondition = Kubernetes.IoK8sKubernetesPkgApisCertificatesV1beta1CertificateSigningRequestCondition
        const CertificateSigningRequestList = Kubernetes.IoK8sKubernetesPkgApisCertificatesV1beta1CertificateSigningRequestList
        const CertificateSigningRequestSpec = Kubernetes.IoK8sKubernetesPkgApisCertificatesV1beta1CertificateSigningRequestSpec
        const CertificateSigningRequestStatus = Kubernetes.IoK8sKubernetesPkgApisCertificatesV1beta1CertificateSigningRequestStatus
    end # module CertificatesV1beta1
    module AutoscalingV2alpha1
        using ..Kubernetes
        const CrossVersionObjectReference = Kubernetes.IoK8sKubernetesPkgApisAutoscalingV2alpha1CrossVersionObjectReference
        const HorizontalPodAutoscaler = Kubernetes.IoK8sKubernetesPkgApisAutoscalingV2alpha1HorizontalPodAutoscaler
        const HorizontalPodAutoscalerList = Kubernetes.IoK8sKubernetesPkgApisAutoscalingV2alpha1HorizontalPodAutoscalerList
        const HorizontalPodAutoscalerSpec = Kubernetes.IoK8sKubernetesPkgApisAutoscalingV2alpha1HorizontalPodAutoscalerSpec
        const HorizontalPodAutoscalerStatus = Kubernetes.IoK8sKubernetesPkgApisAutoscalingV2alpha1HorizontalPodAutoscalerStatus
        const MetricSpec = Kubernetes.IoK8sKubernetesPkgApisAutoscalingV2alpha1MetricSpec
        const MetricStatus = Kubernetes.IoK8sKubernetesPkgApisAutoscalingV2alpha1MetricStatus
        const ObjectMetricSource = Kubernetes.IoK8sKubernetesPkgApisAutoscalingV2alpha1ObjectMetricSource
        const ObjectMetricStatus = Kubernetes.IoK8sKubernetesPkgApisAutoscalingV2alpha1ObjectMetricStatus
        const PodsMetricSource = Kubernetes.IoK8sKubernetesPkgApisAutoscalingV2alpha1PodsMetricSource
        const PodsMetricStatus = Kubernetes.IoK8sKubernetesPkgApisAutoscalingV2alpha1PodsMetricStatus
        const ResourceMetricSource = Kubernetes.IoK8sKubernetesPkgApisAutoscalingV2alpha1ResourceMetricSource
        const ResourceMetricStatus = Kubernetes.IoK8sKubernetesPkgApisAutoscalingV2alpha1ResourceMetricStatus
    end # module AutoscalingV2alpha1
    module AuthenticationV1beta1
        using ..Kubernetes
        const TokenReview = Kubernetes.IoK8sKubernetesPkgApisAuthenticationV1beta1TokenReview
        const TokenReviewSpec = Kubernetes.IoK8sKubernetesPkgApisAuthenticationV1beta1TokenReviewSpec
        const TokenReviewStatus = Kubernetes.IoK8sKubernetesPkgApisAuthenticationV1beta1TokenReviewStatus
        const UserInfo = Kubernetes.IoK8sKubernetesPkgApisAuthenticationV1beta1UserInfo
    end # module AuthenticationV1beta1
    module AuthorizationV1beta1
        using ..Kubernetes
        const LocalSubjectAccessReview = Kubernetes.IoK8sKubernetesPkgApisAuthorizationV1beta1LocalSubjectAccessReview
        const NonResourceAttributes = Kubernetes.IoK8sKubernetesPkgApisAuthorizationV1beta1NonResourceAttributes
        const ResourceAttributes = Kubernetes.IoK8sKubernetesPkgApisAuthorizationV1beta1ResourceAttributes
        const SelfSubjectAccessReview = Kubernetes.IoK8sKubernetesPkgApisAuthorizationV1beta1SelfSubjectAccessReview
        const SelfSubjectAccessReviewSpec = Kubernetes.IoK8sKubernetesPkgApisAuthorizationV1beta1SelfSubjectAccessReviewSpec
        const SubjectAccessReview = Kubernetes.IoK8sKubernetesPkgApisAuthorizationV1beta1SubjectAccessReview
        const SubjectAccessReviewSpec = Kubernetes.IoK8sKubernetesPkgApisAuthorizationV1beta1SubjectAccessReviewSpec
        const SubjectAccessReviewStatus = Kubernetes.IoK8sKubernetesPkgApisAuthorizationV1beta1SubjectAccessReviewStatus
    end # module AuthorizationV1beta1
    module RbacAuthorizationV1beta1
        using ..Kubernetes
        const ClusterRole = Kubernetes.IoK8sKubernetesPkgApisRbacV1beta1ClusterRole
        const ClusterRoleBinding = Kubernetes.IoK8sKubernetesPkgApisRbacV1beta1ClusterRoleBinding
        const ClusterRoleBindingList = Kubernetes.IoK8sKubernetesPkgApisRbacV1beta1ClusterRoleBindingList
        const ClusterRoleList = Kubernetes.IoK8sKubernetesPkgApisRbacV1beta1ClusterRoleList
        const PolicyRule = Kubernetes.IoK8sKubernetesPkgApisRbacV1beta1PolicyRule
        const Role = Kubernetes.IoK8sKubernetesPkgApisRbacV1beta1Role
        const RoleBinding = Kubernetes.IoK8sKubernetesPkgApisRbacV1beta1RoleBinding
        const RoleBindingList = Kubernetes.IoK8sKubernetesPkgApisRbacV1beta1RoleBindingList
        const RoleList = Kubernetes.IoK8sKubernetesPkgApisRbacV1beta1RoleList
        const RoleRef = Kubernetes.IoK8sKubernetesPkgApisRbacV1beta1RoleRef
        const Subject = Kubernetes.IoK8sKubernetesPkgApisRbacV1beta1Subject
    end # module RbacAuthorizationV1beta1
    module StorageV1beta1
        using ..Kubernetes
        const StorageClass = Kubernetes.IoK8sKubernetesPkgApisStorageV1beta1StorageClass
        const StorageClassList = Kubernetes.IoK8sKubernetesPkgApisStorageV1beta1StorageClassList
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
    module BatchV2alpha1
        using ..Kubernetes
        const CronJob = Kubernetes.IoK8sKubernetesPkgApisBatchV2alpha1CronJob
        const CronJobList = Kubernetes.IoK8sKubernetesPkgApisBatchV2alpha1CronJobList
        const CronJobSpec = Kubernetes.IoK8sKubernetesPkgApisBatchV2alpha1CronJobSpec
        const CronJobStatus = Kubernetes.IoK8sKubernetesPkgApisBatchV2alpha1CronJobStatus
        const JobTemplateSpec = Kubernetes.IoK8sKubernetesPkgApisBatchV2alpha1JobTemplateSpec
    end # module BatchV2alpha1
    module ExtensionsV1beta1
        using ..Kubernetes
        const APIVersion = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1APIVersion
        const DaemonSet = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSet
        const DaemonSetList = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetList
        const DaemonSetSpec = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetSpec
        const DaemonSetStatus = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetStatus
        const DaemonSetUpdateStrategy = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetUpdateStrategy
        const Deployment = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1Deployment
        const DeploymentCondition = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1DeploymentCondition
        const DeploymentList = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1DeploymentList
        const DeploymentRollback = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1DeploymentRollback
        const DeploymentSpec = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1DeploymentSpec
        const DeploymentStatus = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1DeploymentStatus
        const DeploymentStrategy = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1DeploymentStrategy
        const FSGroupStrategyOptions = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1FSGroupStrategyOptions
        const HTTPIngressPath = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1HTTPIngressPath
        const HTTPIngressRuleValue = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1HTTPIngressRuleValue
        const HostPortRange = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1HostPortRange
        const IDRange = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1IDRange
        const Ingress = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1Ingress
        const IngressBackend = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1IngressBackend
        const IngressList = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1IngressList
        const IngressRule = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1IngressRule
        const IngressSpec = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1IngressSpec
        const IngressStatus = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1IngressStatus
        const IngressTLS = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1IngressTLS
        const NetworkPolicy = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicy
        const NetworkPolicyIngressRule = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicyIngressRule
        const NetworkPolicyList = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicyList
        const NetworkPolicyPeer = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicyPeer
        const NetworkPolicyPort = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicyPort
        const NetworkPolicySpec = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicySpec
        const PodSecurityPolicy = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1PodSecurityPolicy
        const PodSecurityPolicyList = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1PodSecurityPolicyList
        const PodSecurityPolicySpec = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1PodSecurityPolicySpec
        const ReplicaSet = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1ReplicaSet
        const ReplicaSetCondition = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1ReplicaSetCondition
        const ReplicaSetList = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1ReplicaSetList
        const ReplicaSetSpec = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1ReplicaSetSpec
        const ReplicaSetStatus = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1ReplicaSetStatus
        const RollbackConfig = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1RollbackConfig
        const RollingUpdateDaemonSet = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1RollingUpdateDaemonSet
        const RollingUpdateDeployment = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1RollingUpdateDeployment
        const RunAsUserStrategyOptions = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1RunAsUserStrategyOptions
        const SELinuxStrategyOptions = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1SELinuxStrategyOptions
        const Scale = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1Scale
        const ScaleSpec = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1ScaleSpec
        const ScaleStatus = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1ScaleStatus
        const SupplementalGroupsStrategyOptions = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1SupplementalGroupsStrategyOptions
        const ThirdPartyResource = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1ThirdPartyResource
        const ThirdPartyResourceList = Kubernetes.IoK8sKubernetesPkgApisExtensionsV1beta1ThirdPartyResourceList
    end # module ExtensionsV1beta1
    module PolicyV1beta1
        using ..Kubernetes
        const Eviction = Kubernetes.IoK8sKubernetesPkgApisPolicyV1beta1Eviction
        const PodDisruptionBudget = Kubernetes.IoK8sKubernetesPkgApisPolicyV1beta1PodDisruptionBudget
        const PodDisruptionBudgetList = Kubernetes.IoK8sKubernetesPkgApisPolicyV1beta1PodDisruptionBudgetList
        const PodDisruptionBudgetSpec = Kubernetes.IoK8sKubernetesPkgApisPolicyV1beta1PodDisruptionBudgetSpec
        const PodDisruptionBudgetStatus = Kubernetes.IoK8sKubernetesPkgApisPolicyV1beta1PodDisruptionBudgetStatus
    end # module PolicyV1beta1
    module AuthenticationV1
        using ..Kubernetes
        const TokenReview = Kubernetes.IoK8sKubernetesPkgApisAuthenticationV1TokenReview
        const TokenReviewSpec = Kubernetes.IoK8sKubernetesPkgApisAuthenticationV1TokenReviewSpec
        const TokenReviewStatus = Kubernetes.IoK8sKubernetesPkgApisAuthenticationV1TokenReviewStatus
        const UserInfo = Kubernetes.IoK8sKubernetesPkgApisAuthenticationV1UserInfo
    end # module AuthenticationV1
    module CoreV1
        using ..Kubernetes
        const AWSElasticBlockStoreVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1AWSElasticBlockStoreVolumeSource
        const Affinity = Kubernetes.IoK8sKubernetesPkgApiV1Affinity
        const AttachedVolume = Kubernetes.IoK8sKubernetesPkgApiV1AttachedVolume
        const AzureDiskVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1AzureDiskVolumeSource
        const AzureFileVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1AzureFileVolumeSource
        const Binding = Kubernetes.IoK8sKubernetesPkgApiV1Binding
        const Capabilities = Kubernetes.IoK8sKubernetesPkgApiV1Capabilities
        const CephFSVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1CephFSVolumeSource
        const CinderVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1CinderVolumeSource
        const ComponentCondition = Kubernetes.IoK8sKubernetesPkgApiV1ComponentCondition
        const ComponentStatus = Kubernetes.IoK8sKubernetesPkgApiV1ComponentStatus
        const ComponentStatusList = Kubernetes.IoK8sKubernetesPkgApiV1ComponentStatusList
        const ConfigMap = Kubernetes.IoK8sKubernetesPkgApiV1ConfigMap
        const ConfigMapEnvSource = Kubernetes.IoK8sKubernetesPkgApiV1ConfigMapEnvSource
        const ConfigMapKeySelector = Kubernetes.IoK8sKubernetesPkgApiV1ConfigMapKeySelector
        const ConfigMapList = Kubernetes.IoK8sKubernetesPkgApiV1ConfigMapList
        const ConfigMapProjection = Kubernetes.IoK8sKubernetesPkgApiV1ConfigMapProjection
        const ConfigMapVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1ConfigMapVolumeSource
        const Container = Kubernetes.IoK8sKubernetesPkgApiV1Container
        const ContainerImage = Kubernetes.IoK8sKubernetesPkgApiV1ContainerImage
        const ContainerPort = Kubernetes.IoK8sKubernetesPkgApiV1ContainerPort
        const ContainerState = Kubernetes.IoK8sKubernetesPkgApiV1ContainerState
        const ContainerStateRunning = Kubernetes.IoK8sKubernetesPkgApiV1ContainerStateRunning
        const ContainerStateTerminated = Kubernetes.IoK8sKubernetesPkgApiV1ContainerStateTerminated
        const ContainerStateWaiting = Kubernetes.IoK8sKubernetesPkgApiV1ContainerStateWaiting
        const ContainerStatus = Kubernetes.IoK8sKubernetesPkgApiV1ContainerStatus
        const DaemonEndpoint = Kubernetes.IoK8sKubernetesPkgApiV1DaemonEndpoint
        const DownwardAPIProjection = Kubernetes.IoK8sKubernetesPkgApiV1DownwardAPIProjection
        const DownwardAPIVolumeFile = Kubernetes.IoK8sKubernetesPkgApiV1DownwardAPIVolumeFile
        const DownwardAPIVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1DownwardAPIVolumeSource
        const EmptyDirVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1EmptyDirVolumeSource
        const EndpointAddress = Kubernetes.IoK8sKubernetesPkgApiV1EndpointAddress
        const EndpointPort = Kubernetes.IoK8sKubernetesPkgApiV1EndpointPort
        const EndpointSubset = Kubernetes.IoK8sKubernetesPkgApiV1EndpointSubset
        const Endpoints = Kubernetes.IoK8sKubernetesPkgApiV1Endpoints
        const EndpointsList = Kubernetes.IoK8sKubernetesPkgApiV1EndpointsList
        const EnvFromSource = Kubernetes.IoK8sKubernetesPkgApiV1EnvFromSource
        const EnvVar = Kubernetes.IoK8sKubernetesPkgApiV1EnvVar
        const EnvVarSource = Kubernetes.IoK8sKubernetesPkgApiV1EnvVarSource
        const Event = Kubernetes.IoK8sKubernetesPkgApiV1Event
        const EventList = Kubernetes.IoK8sKubernetesPkgApiV1EventList
        const EventSource = Kubernetes.IoK8sKubernetesPkgApiV1EventSource
        const ExecAction = Kubernetes.IoK8sKubernetesPkgApiV1ExecAction
        const FCVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1FCVolumeSource
        const FlexVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1FlexVolumeSource
        const FlockerVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1FlockerVolumeSource
        const GCEPersistentDiskVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1GCEPersistentDiskVolumeSource
        const GitRepoVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1GitRepoVolumeSource
        const GlusterfsVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1GlusterfsVolumeSource
        const HTTPGetAction = Kubernetes.IoK8sKubernetesPkgApiV1HTTPGetAction
        const HTTPHeader = Kubernetes.IoK8sKubernetesPkgApiV1HTTPHeader
        const Handler = Kubernetes.IoK8sKubernetesPkgApiV1Handler
        const HostPathVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1HostPathVolumeSource
        const ISCSIVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1ISCSIVolumeSource
        const KeyToPath = Kubernetes.IoK8sKubernetesPkgApiV1KeyToPath
        const Lifecycle = Kubernetes.IoK8sKubernetesPkgApiV1Lifecycle
        const LimitRange = Kubernetes.IoK8sKubernetesPkgApiV1LimitRange
        const LimitRangeItem = Kubernetes.IoK8sKubernetesPkgApiV1LimitRangeItem
        const LimitRangeList = Kubernetes.IoK8sKubernetesPkgApiV1LimitRangeList
        const LimitRangeSpec = Kubernetes.IoK8sKubernetesPkgApiV1LimitRangeSpec
        const LoadBalancerIngress = Kubernetes.IoK8sKubernetesPkgApiV1LoadBalancerIngress
        const LoadBalancerStatus = Kubernetes.IoK8sKubernetesPkgApiV1LoadBalancerStatus
        const LocalObjectReference = Kubernetes.IoK8sKubernetesPkgApiV1LocalObjectReference
        const NFSVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1NFSVolumeSource
        const Namespace = Kubernetes.IoK8sKubernetesPkgApiV1Namespace
        const NamespaceList = Kubernetes.IoK8sKubernetesPkgApiV1NamespaceList
        const NamespaceSpec = Kubernetes.IoK8sKubernetesPkgApiV1NamespaceSpec
        const NamespaceStatus = Kubernetes.IoK8sKubernetesPkgApiV1NamespaceStatus
        const Node = Kubernetes.IoK8sKubernetesPkgApiV1Node
        const NodeAddress = Kubernetes.IoK8sKubernetesPkgApiV1NodeAddress
        const NodeAffinity = Kubernetes.IoK8sKubernetesPkgApiV1NodeAffinity
        const NodeCondition = Kubernetes.IoK8sKubernetesPkgApiV1NodeCondition
        const NodeDaemonEndpoints = Kubernetes.IoK8sKubernetesPkgApiV1NodeDaemonEndpoints
        const NodeList = Kubernetes.IoK8sKubernetesPkgApiV1NodeList
        const NodeSelector = Kubernetes.IoK8sKubernetesPkgApiV1NodeSelector
        const NodeSelectorRequirement = Kubernetes.IoK8sKubernetesPkgApiV1NodeSelectorRequirement
        const NodeSelectorTerm = Kubernetes.IoK8sKubernetesPkgApiV1NodeSelectorTerm
        const NodeSpec = Kubernetes.IoK8sKubernetesPkgApiV1NodeSpec
        const NodeStatus = Kubernetes.IoK8sKubernetesPkgApiV1NodeStatus
        const NodeSystemInfo = Kubernetes.IoK8sKubernetesPkgApiV1NodeSystemInfo
        const ObjectFieldSelector = Kubernetes.IoK8sKubernetesPkgApiV1ObjectFieldSelector
        const ObjectReference = Kubernetes.IoK8sKubernetesPkgApiV1ObjectReference
        const PersistentVolume = Kubernetes.IoK8sKubernetesPkgApiV1PersistentVolume
        const PersistentVolumeClaim = Kubernetes.IoK8sKubernetesPkgApiV1PersistentVolumeClaim
        const PersistentVolumeClaimList = Kubernetes.IoK8sKubernetesPkgApiV1PersistentVolumeClaimList
        const PersistentVolumeClaimSpec = Kubernetes.IoK8sKubernetesPkgApiV1PersistentVolumeClaimSpec
        const PersistentVolumeClaimStatus = Kubernetes.IoK8sKubernetesPkgApiV1PersistentVolumeClaimStatus
        const PersistentVolumeClaimVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1PersistentVolumeClaimVolumeSource
        const PersistentVolumeList = Kubernetes.IoK8sKubernetesPkgApiV1PersistentVolumeList
        const PersistentVolumeSpec = Kubernetes.IoK8sKubernetesPkgApiV1PersistentVolumeSpec
        const PersistentVolumeStatus = Kubernetes.IoK8sKubernetesPkgApiV1PersistentVolumeStatus
        const PhotonPersistentDiskVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1PhotonPersistentDiskVolumeSource
        const Pod = Kubernetes.IoK8sKubernetesPkgApiV1Pod
        const PodAffinity = Kubernetes.IoK8sKubernetesPkgApiV1PodAffinity
        const PodAffinityTerm = Kubernetes.IoK8sKubernetesPkgApiV1PodAffinityTerm
        const PodAntiAffinity = Kubernetes.IoK8sKubernetesPkgApiV1PodAntiAffinity
        const PodCondition = Kubernetes.IoK8sKubernetesPkgApiV1PodCondition
        const PodList = Kubernetes.IoK8sKubernetesPkgApiV1PodList
        const PodSecurityContext = Kubernetes.IoK8sKubernetesPkgApiV1PodSecurityContext
        const PodSpec = Kubernetes.IoK8sKubernetesPkgApiV1PodSpec
        const PodStatus = Kubernetes.IoK8sKubernetesPkgApiV1PodStatus
        const PodTemplate = Kubernetes.IoK8sKubernetesPkgApiV1PodTemplate
        const PodTemplateList = Kubernetes.IoK8sKubernetesPkgApiV1PodTemplateList
        const PodTemplateSpec = Kubernetes.IoK8sKubernetesPkgApiV1PodTemplateSpec
        const PortworxVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1PortworxVolumeSource
        const PreferredSchedulingTerm = Kubernetes.IoK8sKubernetesPkgApiV1PreferredSchedulingTerm
        const Probe = Kubernetes.IoK8sKubernetesPkgApiV1Probe
        const ProjectedVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1ProjectedVolumeSource
        const QuobyteVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1QuobyteVolumeSource
        const RBDVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1RBDVolumeSource
        const ReplicationController = Kubernetes.IoK8sKubernetesPkgApiV1ReplicationController
        const ReplicationControllerCondition = Kubernetes.IoK8sKubernetesPkgApiV1ReplicationControllerCondition
        const ReplicationControllerList = Kubernetes.IoK8sKubernetesPkgApiV1ReplicationControllerList
        const ReplicationControllerSpec = Kubernetes.IoK8sKubernetesPkgApiV1ReplicationControllerSpec
        const ReplicationControllerStatus = Kubernetes.IoK8sKubernetesPkgApiV1ReplicationControllerStatus
        const ResourceFieldSelector = Kubernetes.IoK8sKubernetesPkgApiV1ResourceFieldSelector
        const ResourceQuota = Kubernetes.IoK8sKubernetesPkgApiV1ResourceQuota
        const ResourceQuotaList = Kubernetes.IoK8sKubernetesPkgApiV1ResourceQuotaList
        const ResourceQuotaSpec = Kubernetes.IoK8sKubernetesPkgApiV1ResourceQuotaSpec
        const ResourceQuotaStatus = Kubernetes.IoK8sKubernetesPkgApiV1ResourceQuotaStatus
        const ResourceRequirements = Kubernetes.IoK8sKubernetesPkgApiV1ResourceRequirements
        const SELinuxOptions = Kubernetes.IoK8sKubernetesPkgApiV1SELinuxOptions
        const ScaleIOVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1ScaleIOVolumeSource
        const Secret = Kubernetes.IoK8sKubernetesPkgApiV1Secret
        const SecretEnvSource = Kubernetes.IoK8sKubernetesPkgApiV1SecretEnvSource
        const SecretKeySelector = Kubernetes.IoK8sKubernetesPkgApiV1SecretKeySelector
        const SecretList = Kubernetes.IoK8sKubernetesPkgApiV1SecretList
        const SecretProjection = Kubernetes.IoK8sKubernetesPkgApiV1SecretProjection
        const SecretVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1SecretVolumeSource
        const SecurityContext = Kubernetes.IoK8sKubernetesPkgApiV1SecurityContext
        const Service = Kubernetes.IoK8sKubernetesPkgApiV1Service
        const ServiceAccount = Kubernetes.IoK8sKubernetesPkgApiV1ServiceAccount
        const ServiceAccountList = Kubernetes.IoK8sKubernetesPkgApiV1ServiceAccountList
        const ServiceList = Kubernetes.IoK8sKubernetesPkgApiV1ServiceList
        const ServicePort = Kubernetes.IoK8sKubernetesPkgApiV1ServicePort
        const ServiceSpec = Kubernetes.IoK8sKubernetesPkgApiV1ServiceSpec
        const ServiceStatus = Kubernetes.IoK8sKubernetesPkgApiV1ServiceStatus
        const TCPSocketAction = Kubernetes.IoK8sKubernetesPkgApiV1TCPSocketAction
        const Taint = Kubernetes.IoK8sKubernetesPkgApiV1Taint
        const Toleration = Kubernetes.IoK8sKubernetesPkgApiV1Toleration
        const Volume = Kubernetes.IoK8sKubernetesPkgApiV1Volume
        const VolumeMount = Kubernetes.IoK8sKubernetesPkgApiV1VolumeMount
        const VolumeProjection = Kubernetes.IoK8sKubernetesPkgApiV1VolumeProjection
        const VsphereVirtualDiskVolumeSource = Kubernetes.IoK8sKubernetesPkgApiV1VsphereVirtualDiskVolumeSource
        const WeightedPodAffinityTerm = Kubernetes.IoK8sKubernetesPkgApiV1WeightedPodAffinityTerm
    end # module CoreV1
end # module Typedefs
