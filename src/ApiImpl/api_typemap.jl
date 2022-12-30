module Typedefs
    using ..Kubernetes
    module BatchV1beta1
        using ..Kubernetes
        const JobSpec = Kubernetes.IoK8sApiBatchV1JobSpec
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const PodSpec = Kubernetes.IoK8sApiCoreV1PodSpec
        const Affinity = Kubernetes.IoK8sApiCoreV1Affinity
        const CronJobList = Kubernetes.IoK8sApiBatchV1beta1CronJobList
        const JobTemplateSpec = Kubernetes.IoK8sApiBatchV1beta1JobTemplateSpec
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const PodDNSConfig = Kubernetes.IoK8sApiCoreV1PodDNSConfig
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const SELinuxOptions = Kubernetes.IoK8sApiCoreV1SELinuxOptions
        const CronJobStatus = Kubernetes.IoK8sApiBatchV1beta1CronJobStatus
        const LabelSelector = Kubernetes.IoK8sApimachineryPkgApisMetaV1LabelSelector
        const WindowsSecurityContextOptions = Kubernetes.IoK8sApiCoreV1WindowsSecurityContextOptions
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const PodAffinity = Kubernetes.IoK8sApiCoreV1PodAffinity
        const PodTemplateSpec = Kubernetes.IoK8sApiCoreV1PodTemplateSpec
        const PodSecurityContext = Kubernetes.IoK8sApiCoreV1PodSecurityContext
        const NodeSelector = Kubernetes.IoK8sApiCoreV1NodeSelector
        const CronJobSpec = Kubernetes.IoK8sApiBatchV1beta1CronJobSpec
        const NodeAffinity = Kubernetes.IoK8sApiCoreV1NodeAffinity
        const CronJob = Kubernetes.IoK8sApiBatchV1beta1CronJob
        const PodAntiAffinity = Kubernetes.IoK8sApiCoreV1PodAntiAffinity
    end
    module EventsV1beta1
        using ..Kubernetes
        const EventSeries = Kubernetes.IoK8sApiEventsV1beta1EventSeries
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const EventSource = Kubernetes.IoK8sApiCoreV1EventSource
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const ObjectReference = Kubernetes.IoK8sApiCoreV1ObjectReference
        const Event = Kubernetes.IoK8sApiEventsV1beta1Event
        const EventList = Kubernetes.IoK8sApiEventsV1beta1EventList
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
    end
    module CertificatesV1beta1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const CertificateSigningRequestList = Kubernetes.IoK8sApiCertificatesV1beta1CertificateSigningRequestList
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const CertificateSigningRequest = Kubernetes.IoK8sApiCertificatesV1beta1CertificateSigningRequest
        const CertificateSigningRequestSpec = Kubernetes.IoK8sApiCertificatesV1beta1CertificateSigningRequestSpec
        const CertificateSigningRequestStatus = Kubernetes.IoK8sApiCertificatesV1beta1CertificateSigningRequestStatus
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
    end
    module BatchV1
        using ..Kubernetes
        const JobSpec = Kubernetes.IoK8sApiBatchV1JobSpec
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const CronJob = Kubernetes.IoK8sApiBatchV1CronJob
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const Job = Kubernetes.IoK8sApiBatchV1Job
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const JobTemplateSpec = Kubernetes.IoK8sApiBatchV1JobTemplateSpec
        const PodSpec = Kubernetes.IoK8sApiCoreV1PodSpec
        const Affinity = Kubernetes.IoK8sApiCoreV1Affinity
        const JobStatus = Kubernetes.IoK8sApiBatchV1JobStatus
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const PodDNSConfig = Kubernetes.IoK8sApiCoreV1PodDNSConfig
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const SELinuxOptions = Kubernetes.IoK8sApiCoreV1SELinuxOptions
        const LabelSelector = Kubernetes.IoK8sApimachineryPkgApisMetaV1LabelSelector
        const WindowsSecurityContextOptions = Kubernetes.IoK8sApiCoreV1WindowsSecurityContextOptions
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const CronJobStatus = Kubernetes.IoK8sApiBatchV1CronJobStatus
        const PodAffinity = Kubernetes.IoK8sApiCoreV1PodAffinity
        const PodTemplateSpec = Kubernetes.IoK8sApiCoreV1PodTemplateSpec
        const PodSecurityContext = Kubernetes.IoK8sApiCoreV1PodSecurityContext
        const NodeSelector = Kubernetes.IoK8sApiCoreV1NodeSelector
        const JobList = Kubernetes.IoK8sApiBatchV1JobList
        const CronJobList = Kubernetes.IoK8sApiBatchV1CronJobList
        const NodeAffinity = Kubernetes.IoK8sApiCoreV1NodeAffinity
        const CronJobSpec = Kubernetes.IoK8sApiBatchV1CronJobSpec
        const PodAntiAffinity = Kubernetes.IoK8sApiCoreV1PodAntiAffinity
    end
    module SchedulingV1alpha1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const PriorityClassList = Kubernetes.IoK8sApiSchedulingV1alpha1PriorityClassList
        const PriorityClass = Kubernetes.IoK8sApiSchedulingV1alpha1PriorityClass
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
    end
    module AppsV1beta2
        using ..Kubernetes
        const StatefulSet = Kubernetes.IoK8sApiAppsV1beta2StatefulSet
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const ScaleStatus = Kubernetes.IoK8sApiAppsV1beta2ScaleStatus
        const RollingUpdateDaemonSet = Kubernetes.IoK8sApiAppsV1beta2RollingUpdateDaemonSet
        const ReplicaSetStatus = Kubernetes.IoK8sApiAppsV1beta2ReplicaSetStatus
        const PodSpec = Kubernetes.IoK8sApiCoreV1PodSpec
        const Affinity = Kubernetes.IoK8sApiCoreV1Affinity
        const ReplicaSet = Kubernetes.IoK8sApiAppsV1beta2ReplicaSet
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const ControllerRevisionList = Kubernetes.IoK8sApiAppsV1beta2ControllerRevisionList
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const SELinuxOptions = Kubernetes.IoK8sApiCoreV1SELinuxOptions
        const Deployment = Kubernetes.IoK8sApiAppsV1beta2Deployment
        const DaemonSetList = Kubernetes.IoK8sApiAppsV1beta2DaemonSetList
        const DaemonSet = Kubernetes.IoK8sApiAppsV1beta2DaemonSet
        const LabelSelector = Kubernetes.IoK8sApimachineryPkgApisMetaV1LabelSelector
        const WindowsSecurityContextOptions = Kubernetes.IoK8sApiCoreV1WindowsSecurityContextOptions
        const StatefulSetUpdateStrategy = Kubernetes.IoK8sApiAppsV1beta2StatefulSetUpdateStrategy
        const PodSecurityContext = Kubernetes.IoK8sApiCoreV1PodSecurityContext
        const NodeSelector = Kubernetes.IoK8sApiCoreV1NodeSelector
        const StatefulSetList = Kubernetes.IoK8sApiAppsV1beta2StatefulSetList
        const ReplicaSetSpec = Kubernetes.IoK8sApiAppsV1beta2ReplicaSetSpec
        const PodAntiAffinity = Kubernetes.IoK8sApiCoreV1PodAntiAffinity
        const RollingUpdateStatefulSetStrategy = Kubernetes.IoK8sApiAppsV1beta2RollingUpdateStatefulSetStrategy
        const DaemonSetSpec = Kubernetes.IoK8sApiAppsV1beta2DaemonSetSpec
        const DeploymentSpec = Kubernetes.IoK8sApiAppsV1beta2DeploymentSpec
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const DeploymentStrategy = Kubernetes.IoK8sApiAppsV1beta2DeploymentStrategy
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const RollingUpdateDeployment = Kubernetes.IoK8sApiAppsV1beta2RollingUpdateDeployment
        const StatefulSetSpec = Kubernetes.IoK8sApiAppsV1beta2StatefulSetSpec
        const DeploymentStatus = Kubernetes.IoK8sApiAppsV1beta2DeploymentStatus
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const DaemonSetStatus = Kubernetes.IoK8sApiAppsV1beta2DaemonSetStatus
        const ScaleSpec = Kubernetes.IoK8sApiAppsV1beta2ScaleSpec
        const PodDNSConfig = Kubernetes.IoK8sApiCoreV1PodDNSConfig
        const Scale = Kubernetes.IoK8sApiAppsV1beta2Scale
        const ControllerRevision = Kubernetes.IoK8sApiAppsV1beta2ControllerRevision
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const DeploymentList = Kubernetes.IoK8sApiAppsV1beta2DeploymentList
        const PodAffinity = Kubernetes.IoK8sApiCoreV1PodAffinity
        const StatefulSetStatus = Kubernetes.IoK8sApiAppsV1beta2StatefulSetStatus
        const PodTemplateSpec = Kubernetes.IoK8sApiCoreV1PodTemplateSpec
        const ReplicaSetList = Kubernetes.IoK8sApiAppsV1beta2ReplicaSetList
        const DaemonSetUpdateStrategy = Kubernetes.IoK8sApiAppsV1beta2DaemonSetUpdateStrategy
        const NodeAffinity = Kubernetes.IoK8sApiCoreV1NodeAffinity
    end
    module PolicyV1beta1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const SupplementalGroupsStrategyOptions = Kubernetes.IoK8sApiPolicyV1beta1SupplementalGroupsStrategyOptions
        const PodDisruptionBudgetList = Kubernetes.IoK8sApiPolicyV1beta1PodDisruptionBudgetList
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const PodDisruptionBudgetSpec = Kubernetes.IoK8sApiPolicyV1beta1PodDisruptionBudgetSpec
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const PodSecurityPolicySpec = Kubernetes.IoK8sApiPolicyV1beta1PodSecurityPolicySpec
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const SELinuxOptions = Kubernetes.IoK8sApiCoreV1SELinuxOptions
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const LabelSelector = Kubernetes.IoK8sApimachineryPkgApisMetaV1LabelSelector
        const PodDisruptionBudget = Kubernetes.IoK8sApiPolicyV1beta1PodDisruptionBudget
        const PodDisruptionBudgetStatus = Kubernetes.IoK8sApiPolicyV1beta1PodDisruptionBudgetStatus
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const RunAsGroupStrategyOptions = Kubernetes.IoK8sApiPolicyV1beta1RunAsGroupStrategyOptions
        const RuntimeClassStrategyOptions = Kubernetes.IoK8sApiPolicyV1beta1RuntimeClassStrategyOptions
        const PodSecurityPolicy = Kubernetes.IoK8sApiPolicyV1beta1PodSecurityPolicy
        const SELinuxStrategyOptions = Kubernetes.IoK8sApiPolicyV1beta1SELinuxStrategyOptions
        const RunAsUserStrategyOptions = Kubernetes.IoK8sApiPolicyV1beta1RunAsUserStrategyOptions
        const FSGroupStrategyOptions = Kubernetes.IoK8sApiPolicyV1beta1FSGroupStrategyOptions
        const PodSecurityPolicyList = Kubernetes.IoK8sApiPolicyV1beta1PodSecurityPolicyList
    end
    module RbacAuthorizationV1beta1
        using ..Kubernetes
        const ClusterRoleList = Kubernetes.IoK8sApiRbacV1beta1ClusterRoleList
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const ClusterRoleBinding = Kubernetes.IoK8sApiRbacV1beta1ClusterRoleBinding
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const RoleList = Kubernetes.IoK8sApiRbacV1beta1RoleList
        const AggregationRule = Kubernetes.IoK8sApiRbacV1beta1AggregationRule
        const RoleBinding = Kubernetes.IoK8sApiRbacV1beta1RoleBinding
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const RoleRef = Kubernetes.IoK8sApiRbacV1beta1RoleRef
        const ClusterRoleBindingList = Kubernetes.IoK8sApiRbacV1beta1ClusterRoleBindingList
        const Role = Kubernetes.IoK8sApiRbacV1beta1Role
        const ClusterRole = Kubernetes.IoK8sApiRbacV1beta1ClusterRole
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const RoleBindingList = Kubernetes.IoK8sApiRbacV1beta1RoleBindingList
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
    end
    module AuthorizationV1beta1
        using ..Kubernetes
        const SubjectAccessReview = Kubernetes.IoK8sApiAuthorizationV1beta1SubjectAccessReview
        const LocalSubjectAccessReview = Kubernetes.IoK8sApiAuthorizationV1beta1LocalSubjectAccessReview
        const SelfSubjectRulesReview = Kubernetes.IoK8sApiAuthorizationV1beta1SelfSubjectRulesReview
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const SelfSubjectRulesReviewSpec = Kubernetes.IoK8sApiAuthorizationV1beta1SelfSubjectRulesReviewSpec
        const SubjectAccessReviewSpec = Kubernetes.IoK8sApiAuthorizationV1beta1SubjectAccessReviewSpec
        const SelfSubjectAccessReview = Kubernetes.IoK8sApiAuthorizationV1beta1SelfSubjectAccessReview
        const SubjectAccessReviewStatus = Kubernetes.IoK8sApiAuthorizationV1beta1SubjectAccessReviewStatus
        const SelfSubjectAccessReviewSpec = Kubernetes.IoK8sApiAuthorizationV1beta1SelfSubjectAccessReviewSpec
        const NonResourceAttributes = Kubernetes.IoK8sApiAuthorizationV1beta1NonResourceAttributes
        const ResourceAttributes = Kubernetes.IoK8sApiAuthorizationV1beta1ResourceAttributes
        const SubjectRulesReviewStatus = Kubernetes.IoK8sApiAuthorizationV1beta1SubjectRulesReviewStatus
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
    end
    module SettingsV1alpha1
        using ..Kubernetes
        const PodPresetList = Kubernetes.IoK8sApiSettingsV1alpha1PodPresetList
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const PodPreset = Kubernetes.IoK8sApiSettingsV1alpha1PodPreset
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const PodPresetSpec = Kubernetes.IoK8sApiSettingsV1alpha1PodPresetSpec
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const LabelSelector = Kubernetes.IoK8sApimachineryPkgApisMetaV1LabelSelector
    end
    module Apis
        using ..Kubernetes
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
    end
    module ApiregistrationV1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const APIServiceSpec = Kubernetes.IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec
        const ServiceReference = Kubernetes.IoK8sKubeAggregatorPkgApisApiregistrationV1ServiceReference
        const APIServiceStatus = Kubernetes.IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceStatus
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const APIService = Kubernetes.IoK8sKubeAggregatorPkgApisApiregistrationV1APIService
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const APIServiceList = Kubernetes.IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceList
    end
    module MetricsV1beta1
        using ..Kubernetes
        const NodeMetrics = Kubernetes.IoK8sApiMetricsV1beta1NodeMetrics
        const PodMetrics = Kubernetes.IoK8sApiMetricsV1beta1PodMetrics
        const PodMetricsList = Kubernetes.IoK8sApiMetricsV1beta1PodMetricsList
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const NodeMetricsList = Kubernetes.IoK8sApiMetricsV1beta1NodeMetricsList
    end
    module RbacAuthorizationV1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const RoleBinding = Kubernetes.IoK8sApiRbacV1RoleBinding
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const RoleBindingList = Kubernetes.IoK8sApiRbacV1RoleBindingList
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const ClusterRole = Kubernetes.IoK8sApiRbacV1ClusterRole
        const RoleRef = Kubernetes.IoK8sApiRbacV1RoleRef
        const ClusterRoleList = Kubernetes.IoK8sApiRbacV1ClusterRoleList
        const ClusterRoleBinding = Kubernetes.IoK8sApiRbacV1ClusterRoleBinding
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const Role = Kubernetes.IoK8sApiRbacV1Role
        const RoleList = Kubernetes.IoK8sApiRbacV1RoleList
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const AggregationRule = Kubernetes.IoK8sApiRbacV1AggregationRule
        const ClusterRoleBindingList = Kubernetes.IoK8sApiRbacV1ClusterRoleBindingList
    end
    module AutoscalingV2beta2
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const HorizontalPodAutoscaler = Kubernetes.IoK8sApiAutoscalingV2beta2HorizontalPodAutoscaler
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const HorizontalPodAutoscalerSpec = Kubernetes.IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerSpec
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const HorizontalPodAutoscalerList = Kubernetes.IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerList
        const HorizontalPodAutoscalerStatus = Kubernetes.IoK8sApiAutoscalingV2beta2HorizontalPodAutoscalerStatus
        const CrossVersionObjectReference = Kubernetes.IoK8sApiAutoscalingV2beta2CrossVersionObjectReference
    end
    module AuthenticationV1beta1
        using ..Kubernetes
        const UserInfo = Kubernetes.IoK8sApiAuthenticationV1beta1UserInfo
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const TokenReview = Kubernetes.IoK8sApiAuthenticationV1beta1TokenReview
        const TokenReviewSpec = Kubernetes.IoK8sApiAuthenticationV1beta1TokenReviewSpec
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const TokenReviewStatus = Kubernetes.IoK8sApiAuthenticationV1beta1TokenReviewStatus
    end
    module AuthorizationV1
        using ..Kubernetes
        const SelfSubjectRulesReview = Kubernetes.IoK8sApiAuthorizationV1SelfSubjectRulesReview
        const SelfSubjectAccessReviewSpec = Kubernetes.IoK8sApiAuthorizationV1SelfSubjectAccessReviewSpec
        const SubjectAccessReviewStatus = Kubernetes.IoK8sApiAuthorizationV1SubjectAccessReviewStatus
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const SubjectRulesReviewStatus = Kubernetes.IoK8sApiAuthorizationV1SubjectRulesReviewStatus
        const SelfSubjectRulesReviewSpec = Kubernetes.IoK8sApiAuthorizationV1SelfSubjectRulesReviewSpec
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const LocalSubjectAccessReview = Kubernetes.IoK8sApiAuthorizationV1LocalSubjectAccessReview
        const NonResourceAttributes = Kubernetes.IoK8sApiAuthorizationV1NonResourceAttributes
        const SubjectAccessReviewSpec = Kubernetes.IoK8sApiAuthorizationV1SubjectAccessReviewSpec
        const ResourceAttributes = Kubernetes.IoK8sApiAuthorizationV1ResourceAttributes
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const SelfSubjectAccessReview = Kubernetes.IoK8sApiAuthorizationV1SelfSubjectAccessReview
        const SubjectAccessReview = Kubernetes.IoK8sApiAuthorizationV1SubjectAccessReview
    end
    module ApiextensionsV1beta1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const JSONSchemaProps = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const CustomResourceDefinitionNames = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionNames
        const ServiceReference = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1ServiceReference
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const CustomResourceDefinition = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinition
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const CustomResourceDefinitionList = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionList
        const CustomResourceConversion = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceConversion
        const WebhookClientConfig = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1WebhookClientConfig
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const CustomResourceDefinitionSpec = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionSpec
        const ExternalDocumentation = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1ExternalDocumentation
        const CustomResourceSubresourceScale = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceSubresourceScale
        const CustomResourceDefinitionStatus = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionStatus
        const CustomResourceValidation = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceValidation
        const CustomResourceSubresources = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceSubresources
    end
    module CoordinationV1beta1
        using ..Kubernetes
        const LeaseList = Kubernetes.IoK8sApiCoordinationV1beta1LeaseList
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const Lease = Kubernetes.IoK8sApiCoordinationV1beta1Lease
        const LeaseSpec = Kubernetes.IoK8sApiCoordinationV1beta1LeaseSpec
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
    end
    module CoordinationV1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const Lease = Kubernetes.IoK8sApiCoordinationV1Lease
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const LeaseSpec = Kubernetes.IoK8sApiCoordinationV1LeaseSpec
        const LeaseList = Kubernetes.IoK8sApiCoordinationV1LeaseList
    end
    module NodeV1alpha1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const Overhead = Kubernetes.IoK8sApiNodeV1alpha1Overhead
        const RuntimeClass = Kubernetes.IoK8sApiNodeV1alpha1RuntimeClass
        const RuntimeClassSpec = Kubernetes.IoK8sApiNodeV1alpha1RuntimeClassSpec
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const RuntimeClassList = Kubernetes.IoK8sApiNodeV1alpha1RuntimeClassList
        const Scheduling = Kubernetes.IoK8sApiNodeV1alpha1Scheduling
    end
    module StorageV1beta1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const CSINodeList = Kubernetes.IoK8sApiStorageV1beta1CSINodeList
        const CinderPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1CinderPersistentVolumeSource
        const CSIDriver = Kubernetes.IoK8sApiStorageV1beta1CSIDriver
        const ScaleIOPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1ScaleIOPersistentVolumeSource
        const StorageClassList = Kubernetes.IoK8sApiStorageV1beta1StorageClassList
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const StorageOSPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1StorageOSPersistentVolumeSource
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const VolumeAttachmentList = Kubernetes.IoK8sApiStorageV1beta1VolumeAttachmentList
        const CSINode = Kubernetes.IoK8sApiStorageV1beta1CSINode
        const VolumeError = Kubernetes.IoK8sApiStorageV1beta1VolumeError
        const VolumeAttachmentSpec = Kubernetes.IoK8sApiStorageV1beta1VolumeAttachmentSpec
        const VolumeAttachmentStatus = Kubernetes.IoK8sApiStorageV1beta1VolumeAttachmentStatus
        const AzureDiskVolumeSource = Kubernetes.IoK8sApiCoreV1AzureDiskVolumeSource
        const GCEPersistentDiskVolumeSource = Kubernetes.IoK8sApiCoreV1GCEPersistentDiskVolumeSource
        const FCVolumeSource = Kubernetes.IoK8sApiCoreV1FCVolumeSource
        const NodeSelector = Kubernetes.IoK8sApiCoreV1NodeSelector
        const NFSVolumeSource = Kubernetes.IoK8sApiCoreV1NFSVolumeSource
        const LocalVolumeSource = Kubernetes.IoK8sApiCoreV1LocalVolumeSource
        const CSIDriverList = Kubernetes.IoK8sApiStorageV1beta1CSIDriverList
        const ISCSIPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1ISCSIPersistentVolumeSource
        const FlockerVolumeSource = Kubernetes.IoK8sApiCoreV1FlockerVolumeSource
        const CephFSPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1CephFSPersistentVolumeSource
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const HostPathVolumeSource = Kubernetes.IoK8sApiCoreV1HostPathVolumeSource
        const PersistentVolumeSpec = Kubernetes.IoK8sApiCoreV1PersistentVolumeSpec
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const CSIDriverSpec = Kubernetes.IoK8sApiStorageV1beta1CSIDriverSpec
        const QuobyteVolumeSource = Kubernetes.IoK8sApiCoreV1QuobyteVolumeSource
        const ObjectReference = Kubernetes.IoK8sApiCoreV1ObjectReference
        const GlusterfsPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1GlusterfsPersistentVolumeSource
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const AWSElasticBlockStoreVolumeSource = Kubernetes.IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource
        const RBDPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1RBDPersistentVolumeSource
        const VolumeNodeAffinity = Kubernetes.IoK8sApiCoreV1VolumeNodeAffinity
        const VolumeAttachmentSource = Kubernetes.IoK8sApiStorageV1beta1VolumeAttachmentSource
        const PortworxVolumeSource = Kubernetes.IoK8sApiCoreV1PortworxVolumeSource
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const VsphereVirtualDiskVolumeSource = Kubernetes.IoK8sApiCoreV1VsphereVirtualDiskVolumeSource
        const FlexPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1FlexPersistentVolumeSource
        const VolumeAttachment = Kubernetes.IoK8sApiStorageV1beta1VolumeAttachment
        const CSINodeSpec = Kubernetes.IoK8sApiStorageV1beta1CSINodeSpec
        const AzureFilePersistentVolumeSource = Kubernetes.IoK8sApiCoreV1AzureFilePersistentVolumeSource
        const SecretReference = Kubernetes.IoK8sApiCoreV1SecretReference
        const StorageClass = Kubernetes.IoK8sApiStorageV1beta1StorageClass
        const PhotonPersistentDiskVolumeSource = Kubernetes.IoK8sApiCoreV1PhotonPersistentDiskVolumeSource
        const CSIPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1CSIPersistentVolumeSource
    end
    module AutoscalingV2beta1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const HorizontalPodAutoscalerList = Kubernetes.IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerList
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const HorizontalPodAutoscalerSpec = Kubernetes.IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerSpec
        const HorizontalPodAutoscaler = Kubernetes.IoK8sApiAutoscalingV2beta1HorizontalPodAutoscaler
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const HorizontalPodAutoscalerStatus = Kubernetes.IoK8sApiAutoscalingV2beta1HorizontalPodAutoscalerStatus
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const CrossVersionObjectReference = Kubernetes.IoK8sApiAutoscalingV2beta1CrossVersionObjectReference
    end
    module SchedulingV1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const PriorityClassList = Kubernetes.IoK8sApiSchedulingV1PriorityClassList
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const PriorityClass = Kubernetes.IoK8sApiSchedulingV1PriorityClass
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
    end
    module ApiregistrationV1beta1
        using ..Kubernetes
        const ServiceReference = Kubernetes.IoK8sKubeAggregatorPkgApisApiregistrationV1beta1ServiceReference
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const APIServiceList = Kubernetes.IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceList
        const APIServiceStatus = Kubernetes.IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceStatus
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const APIServiceSpec = Kubernetes.IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceSpec
        const APIService = Kubernetes.IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIService
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
    end
    module FlowcontrolApiserverV1alpha1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const FlowDistinguisherMethod = Kubernetes.IoK8sApiFlowcontrolV1alpha1FlowDistinguisherMethod
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const LimitResponse = Kubernetes.IoK8sApiFlowcontrolV1alpha1LimitResponse
        const PriorityLevelConfiguration = Kubernetes.IoK8sApiFlowcontrolV1alpha1PriorityLevelConfiguration
        const FlowSchema = Kubernetes.IoK8sApiFlowcontrolV1alpha1FlowSchema
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const LimitedPriorityLevelConfiguration = Kubernetes.IoK8sApiFlowcontrolV1alpha1LimitedPriorityLevelConfiguration
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const PriorityLevelConfigurationSpec = Kubernetes.IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationSpec
        const QueuingConfiguration = Kubernetes.IoK8sApiFlowcontrolV1alpha1QueuingConfiguration
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const PriorityLevelConfigurationReference = Kubernetes.IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationReference
        const FlowSchemaList = Kubernetes.IoK8sApiFlowcontrolV1alpha1FlowSchemaList
        const PriorityLevelConfigurationList = Kubernetes.IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationList
        const FlowSchemaStatus = Kubernetes.IoK8sApiFlowcontrolV1alpha1FlowSchemaStatus
        const FlowSchemaSpec = Kubernetes.IoK8sApiFlowcontrolV1alpha1FlowSchemaSpec
        const PriorityLevelConfigurationStatus = Kubernetes.IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationStatus
    end
    module AdmissionregistrationV1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const ValidatingWebhookConfiguration = Kubernetes.IoK8sApiAdmissionregistrationV1ValidatingWebhookConfiguration
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const MutatingWebhookConfiguration = Kubernetes.IoK8sApiAdmissionregistrationV1MutatingWebhookConfiguration
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const MutatingWebhookConfigurationList = Kubernetes.IoK8sApiAdmissionregistrationV1MutatingWebhookConfigurationList
        const ValidatingWebhookConfigurationList = Kubernetes.IoK8sApiAdmissionregistrationV1ValidatingWebhookConfigurationList
    end
    module CustomMetricsV1beta1
        using ..Kubernetes
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const MetricValueList = Kubernetes.IoK8sApiCustomMetricsV1beta1MetricValueList
    end
    module AutoscalingV1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const HorizontalPodAutoscaler = Kubernetes.IoK8sApiAutoscalingV1HorizontalPodAutoscaler
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const HorizontalPodAutoscalerSpec = Kubernetes.IoK8sApiAutoscalingV1HorizontalPodAutoscalerSpec
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const HorizontalPodAutoscalerStatus = Kubernetes.IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus
        const HorizontalPodAutoscalerList = Kubernetes.IoK8sApiAutoscalingV1HorizontalPodAutoscalerList
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const CrossVersionObjectReference = Kubernetes.IoK8sApiAutoscalingV1CrossVersionObjectReference
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
    end
    module ApiextensionsV1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const WebhookClientConfig = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookClientConfig
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const CustomResourceDefinitionSpec = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionSpec
        const CustomResourceConversion = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion
        const WebhookConversion = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookConversion
        const CustomResourceDefinition = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinition
        const CustomResourceDefinitionNames = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames
        const CustomResourceDefinitionList = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionList
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const ServiceReference = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1ServiceReference
        const CustomResourceDefinitionStatus = Kubernetes.IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus
    end
    module StorageV1alpha1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const VolumeAttachmentSource = Kubernetes.IoK8sApiStorageV1alpha1VolumeAttachmentSource
        const CinderPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1CinderPersistentVolumeSource
        const ScaleIOPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1ScaleIOPersistentVolumeSource
        const VolumeAttachmentSpec = Kubernetes.IoK8sApiStorageV1alpha1VolumeAttachmentSpec
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const StorageOSPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1StorageOSPersistentVolumeSource
        const VolumeAttachment = Kubernetes.IoK8sApiStorageV1alpha1VolumeAttachment
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const AzureDiskVolumeSource = Kubernetes.IoK8sApiCoreV1AzureDiskVolumeSource
        const GCEPersistentDiskVolumeSource = Kubernetes.IoK8sApiCoreV1GCEPersistentDiskVolumeSource
        const FCVolumeSource = Kubernetes.IoK8sApiCoreV1FCVolumeSource
        const VolumeAttachmentList = Kubernetes.IoK8sApiStorageV1alpha1VolumeAttachmentList
        const NodeSelector = Kubernetes.IoK8sApiCoreV1NodeSelector
        const NFSVolumeSource = Kubernetes.IoK8sApiCoreV1NFSVolumeSource
        const LocalVolumeSource = Kubernetes.IoK8sApiCoreV1LocalVolumeSource
        const VolumeError = Kubernetes.IoK8sApiStorageV1alpha1VolumeError
        const ISCSIPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1ISCSIPersistentVolumeSource
        const FlockerVolumeSource = Kubernetes.IoK8sApiCoreV1FlockerVolumeSource
        const CephFSPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1CephFSPersistentVolumeSource
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const HostPathVolumeSource = Kubernetes.IoK8sApiCoreV1HostPathVolumeSource
        const PersistentVolumeSpec = Kubernetes.IoK8sApiCoreV1PersistentVolumeSpec
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const QuobyteVolumeSource = Kubernetes.IoK8sApiCoreV1QuobyteVolumeSource
        const ObjectReference = Kubernetes.IoK8sApiCoreV1ObjectReference
        const GlusterfsPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1GlusterfsPersistentVolumeSource
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const AWSElasticBlockStoreVolumeSource = Kubernetes.IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource
        const RBDPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1RBDPersistentVolumeSource
        const VolumeNodeAffinity = Kubernetes.IoK8sApiCoreV1VolumeNodeAffinity
        const PortworxVolumeSource = Kubernetes.IoK8sApiCoreV1PortworxVolumeSource
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const VolumeAttachmentStatus = Kubernetes.IoK8sApiStorageV1alpha1VolumeAttachmentStatus
        const VsphereVirtualDiskVolumeSource = Kubernetes.IoK8sApiCoreV1VsphereVirtualDiskVolumeSource
        const FlexPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1FlexPersistentVolumeSource
        const AzureFilePersistentVolumeSource = Kubernetes.IoK8sApiCoreV1AzureFilePersistentVolumeSource
        const SecretReference = Kubernetes.IoK8sApiCoreV1SecretReference
        const PhotonPersistentDiskVolumeSource = Kubernetes.IoK8sApiCoreV1PhotonPersistentDiskVolumeSource
        const CSIPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1CSIPersistentVolumeSource
    end
    module AppsV1beta1
        using ..Kubernetes
        const Deployment = Kubernetes.IoK8sApiAppsV1beta1Deployment
        const ControllerRevisionList = Kubernetes.IoK8sApiAppsV1beta1ControllerRevisionList
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const DeploymentSpec = Kubernetes.IoK8sApiAppsV1beta1DeploymentSpec
        const ScaleSpec = Kubernetes.IoK8sApiAppsV1beta1ScaleSpec
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const StatefulSetList = Kubernetes.IoK8sApiAppsV1beta1StatefulSetList
        const PodSpec = Kubernetes.IoK8sApiCoreV1PodSpec
        const Affinity = Kubernetes.IoK8sApiCoreV1Affinity
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const DeploymentList = Kubernetes.IoK8sApiAppsV1beta1DeploymentList
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const PodDNSConfig = Kubernetes.IoK8sApiCoreV1PodDNSConfig
        const SELinuxOptions = Kubernetes.IoK8sApiCoreV1SELinuxOptions
        const StatefulSetUpdateStrategy = Kubernetes.IoK8sApiAppsV1beta1StatefulSetUpdateStrategy
        const LabelSelector = Kubernetes.IoK8sApimachineryPkgApisMetaV1LabelSelector
        const WindowsSecurityContextOptions = Kubernetes.IoK8sApiCoreV1WindowsSecurityContextOptions
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const Scale = Kubernetes.IoK8sApiAppsV1beta1Scale
        const StatefulSetSpec = Kubernetes.IoK8sApiAppsV1beta1StatefulSetSpec
        const ScaleStatus = Kubernetes.IoK8sApiAppsV1beta1ScaleStatus
        const RollingUpdateDeployment = Kubernetes.IoK8sApiAppsV1beta1RollingUpdateDeployment
        const PodTemplateSpec = Kubernetes.IoK8sApiCoreV1PodTemplateSpec
        const PodAffinity = Kubernetes.IoK8sApiCoreV1PodAffinity
        const ControllerRevision = Kubernetes.IoK8sApiAppsV1beta1ControllerRevision
        const StatefulSet = Kubernetes.IoK8sApiAppsV1beta1StatefulSet
        const PodSecurityContext = Kubernetes.IoK8sApiCoreV1PodSecurityContext
        const RollingUpdateStatefulSetStrategy = Kubernetes.IoK8sApiAppsV1beta1RollingUpdateStatefulSetStrategy
        const NodeSelector = Kubernetes.IoK8sApiCoreV1NodeSelector
        const DeploymentStrategy = Kubernetes.IoK8sApiAppsV1beta1DeploymentStrategy
        const RollbackConfig = Kubernetes.IoK8sApiAppsV1beta1RollbackConfig
        const NodeAffinity = Kubernetes.IoK8sApiCoreV1NodeAffinity
        const StatefulSetStatus = Kubernetes.IoK8sApiAppsV1beta1StatefulSetStatus
        const PodAntiAffinity = Kubernetes.IoK8sApiCoreV1PodAntiAffinity
        const DeploymentStatus = Kubernetes.IoK8sApiAppsV1beta1DeploymentStatus
    end
    module CoreV1
        using ..Kubernetes
        const CinderPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1CinderPersistentVolumeSource
        const NodeConfigSource = Kubernetes.IoK8sApiCoreV1NodeConfigSource
        const ScaleIOPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1ScaleIOPersistentVolumeSource
        const LimitRangeSpec = Kubernetes.IoK8sApiCoreV1LimitRangeSpec
        const PodSpec = Kubernetes.IoK8sApiCoreV1PodSpec
        const Affinity = Kubernetes.IoK8sApiCoreV1Affinity
        const PersistentVolumeClaimList = Kubernetes.IoK8sApiCoreV1PersistentVolumeClaimList
        const ServiceStatus = Kubernetes.IoK8sApiCoreV1ServiceStatus
        const Pod = Kubernetes.IoK8sApiCoreV1Pod
        const NodeSystemInfo = Kubernetes.IoK8sApiCoreV1NodeSystemInfo
        const ReplicationController = Kubernetes.IoK8sApiCoreV1ReplicationController
        const LoadBalancerStatus = Kubernetes.IoK8sApiCoreV1LoadBalancerStatus
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const SessionAffinityConfig = Kubernetes.IoK8sApiCoreV1SessionAffinityConfig
        const LabelSelector = Kubernetes.IoK8sApimachineryPkgApisMetaV1LabelSelector
        const Event = Kubernetes.IoK8sApiCoreV1Event
        const PodTemplate = Kubernetes.IoK8sApiCoreV1PodTemplate
        const NamespaceList = Kubernetes.IoK8sApiCoreV1NamespaceList
        const AzureDiskVolumeSource = Kubernetes.IoK8sApiCoreV1AzureDiskVolumeSource
        const FCVolumeSource = Kubernetes.IoK8sApiCoreV1FCVolumeSource
        const Eviction = Kubernetes.IoK8sApiPolicyV1beta1Eviction
        const DeleteOptions = Kubernetes.IoK8sApimachineryPkgApisMetaV1DeleteOptions
        const Binding = Kubernetes.IoK8sApiCoreV1Binding
        const Node = Kubernetes.IoK8sApiCoreV1Node
        const ConfigMap = Kubernetes.IoK8sApiCoreV1ConfigMap
        const Preconditions = Kubernetes.IoK8sApimachineryPkgApisMetaV1Preconditions
        const NamespaceStatus = Kubernetes.IoK8sApiCoreV1NamespaceStatus
        const PodAntiAffinity = Kubernetes.IoK8sApiCoreV1PodAntiAffinity
        const ISCSIPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1ISCSIPersistentVolumeSource
        const FlockerVolumeSource = Kubernetes.IoK8sApiCoreV1FlockerVolumeSource
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const NodeSpec = Kubernetes.IoK8sApiCoreV1NodeSpec
        const PersistentVolumeSpec = Kubernetes.IoK8sApiCoreV1PersistentVolumeSpec
        const TokenRequest = Kubernetes.IoK8sApiAuthenticationV1TokenRequest
        const PersistentVolumeClaimStatus = Kubernetes.IoK8sApiCoreV1PersistentVolumeClaimStatus
        const ResourceQuota = Kubernetes.IoK8sApiCoreV1ResourceQuota
        const ResourceRequirements = Kubernetes.IoK8sApiCoreV1ResourceRequirements
        const GlusterfsPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1GlusterfsPersistentVolumeSource
        const Namespace = Kubernetes.IoK8sApiCoreV1Namespace
        const ConfigMapNodeConfigSource = Kubernetes.IoK8sApiCoreV1ConfigMapNodeConfigSource
        const RBDPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1RBDPersistentVolumeSource
        const ServiceAccountList = Kubernetes.IoK8sApiCoreV1ServiceAccountList
        const ResourceQuotaList = Kubernetes.IoK8sApiCoreV1ResourceQuotaList
        const SecretList = Kubernetes.IoK8sApiCoreV1SecretList
        const Secret = Kubernetes.IoK8sApiCoreV1Secret
        const PodAffinity = Kubernetes.IoK8sApiCoreV1PodAffinity
        const LimitRangeList = Kubernetes.IoK8sApiCoreV1LimitRangeList
        const PodTemplateSpec = Kubernetes.IoK8sApiCoreV1PodTemplateSpec
        const ReplicationControllerSpec = Kubernetes.IoK8sApiCoreV1ReplicationControllerSpec
        const VsphereVirtualDiskVolumeSource = Kubernetes.IoK8sApiCoreV1VsphereVirtualDiskVolumeSource
        const FlexPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1FlexPersistentVolumeSource
        const PersistentVolume = Kubernetes.IoK8sApiCoreV1PersistentVolume
        const NodeDaemonEndpoints = Kubernetes.IoK8sApiCoreV1NodeDaemonEndpoints
        const TypedLocalObjectReference = Kubernetes.IoK8sApiCoreV1TypedLocalObjectReference
        const PersistentVolumeStatus = Kubernetes.IoK8sApiCoreV1PersistentVolumeStatus
        const NodeAffinity = Kubernetes.IoK8sApiCoreV1NodeAffinity
        const ServiceList = Kubernetes.IoK8sApiCoreV1ServiceList
        const CSIPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1CSIPersistentVolumeSource
        const ReplicationControllerList = Kubernetes.IoK8sApiCoreV1ReplicationControllerList
        const NodeList = Kubernetes.IoK8sApiCoreV1NodeList
        const ResourceQuotaSpec = Kubernetes.IoK8sApiCoreV1ResourceQuotaSpec
        const PersistentVolumeClaimSpec = Kubernetes.IoK8sApiCoreV1PersistentVolumeClaimSpec
        const BoundObjectReference = Kubernetes.IoK8sApiAuthenticationV1BoundObjectReference
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const ComponentStatusList = Kubernetes.IoK8sApiCoreV1ComponentStatusList
        const EventSeries = Kubernetes.IoK8sApiCoreV1EventSeries
        const PodStatus = Kubernetes.IoK8sApiCoreV1PodStatus
        const StorageOSPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1StorageOSPersistentVolumeSource
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const EndpointsList = Kubernetes.IoK8sApiCoreV1EndpointsList
        const PodList = Kubernetes.IoK8sApiCoreV1PodList
        const SELinuxOptions = Kubernetes.IoK8sApiCoreV1SELinuxOptions
        const ReplicationControllerStatus = Kubernetes.IoK8sApiCoreV1ReplicationControllerStatus
        const WindowsSecurityContextOptions = Kubernetes.IoK8sApiCoreV1WindowsSecurityContextOptions
        const GCEPersistentDiskVolumeSource = Kubernetes.IoK8sApiCoreV1GCEPersistentDiskVolumeSource
        const ConfigMapList = Kubernetes.IoK8sApiCoreV1ConfigMapList
        const EventSource = Kubernetes.IoK8sApiCoreV1EventSource
        const PodSecurityContext = Kubernetes.IoK8sApiCoreV1PodSecurityContext
        const TokenRequestStatus = Kubernetes.IoK8sApiAuthenticationV1TokenRequestStatus
        const ServiceSpec = Kubernetes.IoK8sApiCoreV1ServiceSpec
        const NFSVolumeSource = Kubernetes.IoK8sApiCoreV1NFSVolumeSource
        const DaemonEndpoint = Kubernetes.IoK8sApiCoreV1DaemonEndpoint
        const LocalVolumeSource = Kubernetes.IoK8sApiCoreV1LocalVolumeSource
        const NodeSelector = Kubernetes.IoK8sApiCoreV1NodeSelector
        const ResourceQuotaStatus = Kubernetes.IoK8sApiCoreV1ResourceQuotaStatus
        const ScaleSpec = Kubernetes.IoK8sApiAutoscalingV1ScaleSpec
        const ScaleStatus = Kubernetes.IoK8sApiAutoscalingV1ScaleStatus
        const ClientIPConfig = Kubernetes.IoK8sApiCoreV1ClientIPConfig
        const PersistentVolumeClaim = Kubernetes.IoK8sApiCoreV1PersistentVolumeClaim
        const CephFSPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1CephFSPersistentVolumeSource
        const HostPathVolumeSource = Kubernetes.IoK8sApiCoreV1HostPathVolumeSource
        const QuobyteVolumeSource = Kubernetes.IoK8sApiCoreV1QuobyteVolumeSource
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const ObjectReference = Kubernetes.IoK8sApiCoreV1ObjectReference
        const Endpoints = Kubernetes.IoK8sApiCoreV1Endpoints
        const NamespaceSpec = Kubernetes.IoK8sApiCoreV1NamespaceSpec
        const EventList = Kubernetes.IoK8sApiCoreV1EventList
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const PodDNSConfig = Kubernetes.IoK8sApiCoreV1PodDNSConfig
        const AWSElasticBlockStoreVolumeSource = Kubernetes.IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource
        const PersistentVolumeList = Kubernetes.IoK8sApiCoreV1PersistentVolumeList
        const LimitRange = Kubernetes.IoK8sApiCoreV1LimitRange
        const Scale = Kubernetes.IoK8sApiAutoscalingV1Scale
        const VolumeNodeAffinity = Kubernetes.IoK8sApiCoreV1VolumeNodeAffinity
        const NodeStatus = Kubernetes.IoK8sApiCoreV1NodeStatus
        const PortworxVolumeSource = Kubernetes.IoK8sApiCoreV1PortworxVolumeSource
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const ServiceAccount = Kubernetes.IoK8sApiCoreV1ServiceAccount
        const TokenRequestSpec = Kubernetes.IoK8sApiAuthenticationV1TokenRequestSpec
        const AzureFilePersistentVolumeSource = Kubernetes.IoK8sApiCoreV1AzureFilePersistentVolumeSource
        const SecretReference = Kubernetes.IoK8sApiCoreV1SecretReference
        const PodTemplateList = Kubernetes.IoK8sApiCoreV1PodTemplateList
        const ComponentStatus = Kubernetes.IoK8sApiCoreV1ComponentStatus
        const NodeConfigStatus = Kubernetes.IoK8sApiCoreV1NodeConfigStatus
        const Service = Kubernetes.IoK8sApiCoreV1Service
        const PhotonPersistentDiskVolumeSource = Kubernetes.IoK8sApiCoreV1PhotonPersistentDiskVolumeSource
        const ScopeSelector = Kubernetes.IoK8sApiCoreV1ScopeSelector
    end
    module AuthenticationV1
        using ..Kubernetes
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const TokenReviewStatus = Kubernetes.IoK8sApiAuthenticationV1TokenReviewStatus
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const TokenReview = Kubernetes.IoK8sApiAuthenticationV1TokenReview
        const TokenReviewSpec = Kubernetes.IoK8sApiAuthenticationV1TokenReviewSpec
        const UserInfo = Kubernetes.IoK8sApiAuthenticationV1UserInfo
    end
    module NetworkingV1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const NetworkPolicySpec = Kubernetes.IoK8sApiNetworkingV1NetworkPolicySpec
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const NetworkPolicy = Kubernetes.IoK8sApiNetworkingV1NetworkPolicy
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const NetworkPolicyList = Kubernetes.IoK8sApiNetworkingV1NetworkPolicyList
        const LabelSelector = Kubernetes.IoK8sApimachineryPkgApisMetaV1LabelSelector
    end
    module SchedulingV1beta1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const PriorityClassList = Kubernetes.IoK8sApiSchedulingV1beta1PriorityClassList
        const PriorityClass = Kubernetes.IoK8sApiSchedulingV1beta1PriorityClass
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
    end
    module BatchV2alpha1
        using ..Kubernetes
        const JobSpec = Kubernetes.IoK8sApiBatchV1JobSpec
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const PodSpec = Kubernetes.IoK8sApiCoreV1PodSpec
        const JobTemplateSpec = Kubernetes.IoK8sApiBatchV2alpha1JobTemplateSpec
        const Affinity = Kubernetes.IoK8sApiCoreV1Affinity
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const PodDNSConfig = Kubernetes.IoK8sApiCoreV1PodDNSConfig
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const CronJob = Kubernetes.IoK8sApiBatchV2alpha1CronJob
        const SELinuxOptions = Kubernetes.IoK8sApiCoreV1SELinuxOptions
        const CronJobList = Kubernetes.IoK8sApiBatchV2alpha1CronJobList
        const LabelSelector = Kubernetes.IoK8sApimachineryPkgApisMetaV1LabelSelector
        const WindowsSecurityContextOptions = Kubernetes.IoK8sApiCoreV1WindowsSecurityContextOptions
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const PodAffinity = Kubernetes.IoK8sApiCoreV1PodAffinity
        const PodTemplateSpec = Kubernetes.IoK8sApiCoreV1PodTemplateSpec
        const CronJobStatus = Kubernetes.IoK8sApiBatchV2alpha1CronJobStatus
        const PodSecurityContext = Kubernetes.IoK8sApiCoreV1PodSecurityContext
        const NodeSelector = Kubernetes.IoK8sApiCoreV1NodeSelector
        const NodeAffinity = Kubernetes.IoK8sApiCoreV1NodeAffinity
        const CronJobSpec = Kubernetes.IoK8sApiBatchV2alpha1CronJobSpec
        const PodAntiAffinity = Kubernetes.IoK8sApiCoreV1PodAntiAffinity
    end
    module NodeV1beta1
        using ..Kubernetes
        const RuntimeClassList = Kubernetes.IoK8sApiNodeV1beta1RuntimeClassList
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const Overhead = Kubernetes.IoK8sApiNodeV1beta1Overhead
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const Scheduling = Kubernetes.IoK8sApiNodeV1beta1Scheduling
        const RuntimeClass = Kubernetes.IoK8sApiNodeV1beta1RuntimeClass
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
    end
    module AppsV1
        using ..Kubernetes
        const ReplicaSetSpec = Kubernetes.IoK8sApiAppsV1ReplicaSetSpec
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const DaemonSetStatus = Kubernetes.IoK8sApiAppsV1DaemonSetStatus
        const ReplicaSet = Kubernetes.IoK8sApiAppsV1ReplicaSet
        const StatefulSet = Kubernetes.IoK8sApiAppsV1StatefulSet
        const ReplicaSetList = Kubernetes.IoK8sApiAppsV1ReplicaSetList
        const StatefulSetStatus = Kubernetes.IoK8sApiAppsV1StatefulSetStatus
        const RollingUpdateDeployment = Kubernetes.IoK8sApiAppsV1RollingUpdateDeployment
        const PodSpec = Kubernetes.IoK8sApiCoreV1PodSpec
        const DaemonSetUpdateStrategy = Kubernetes.IoK8sApiAppsV1DaemonSetUpdateStrategy
        const Affinity = Kubernetes.IoK8sApiCoreV1Affinity
        const DeploymentStrategy = Kubernetes.IoK8sApiAppsV1DeploymentStrategy
        const RollingUpdateDaemonSet = Kubernetes.IoK8sApiAppsV1RollingUpdateDaemonSet
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const SELinuxOptions = Kubernetes.IoK8sApiCoreV1SELinuxOptions
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const DaemonSet = Kubernetes.IoK8sApiAppsV1DaemonSet
        const ControllerRevision = Kubernetes.IoK8sApiAppsV1ControllerRevision
        const LabelSelector = Kubernetes.IoK8sApimachineryPkgApisMetaV1LabelSelector
        const WindowsSecurityContextOptions = Kubernetes.IoK8sApiCoreV1WindowsSecurityContextOptions
        const PodSecurityContext = Kubernetes.IoK8sApiCoreV1PodSecurityContext
        const NodeSelector = Kubernetes.IoK8sApiCoreV1NodeSelector
        const StatefulSetSpec = Kubernetes.IoK8sApiAppsV1StatefulSetSpec
        const Deployment = Kubernetes.IoK8sApiAppsV1Deployment
        const DeploymentStatus = Kubernetes.IoK8sApiAppsV1DeploymentStatus
        const ScaleSpec = Kubernetes.IoK8sApiAutoscalingV1ScaleSpec
        const ScaleStatus = Kubernetes.IoK8sApiAutoscalingV1ScaleStatus
        const PodAntiAffinity = Kubernetes.IoK8sApiCoreV1PodAntiAffinity
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const RollingUpdateStatefulSetStrategy = Kubernetes.IoK8sApiAppsV1RollingUpdateStatefulSetStrategy
        const DeploymentSpec = Kubernetes.IoK8sApiAppsV1DeploymentSpec
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const ControllerRevisionList = Kubernetes.IoK8sApiAppsV1ControllerRevisionList
        const ReplicaSetStatus = Kubernetes.IoK8sApiAppsV1ReplicaSetStatus
        const DeploymentList = Kubernetes.IoK8sApiAppsV1DeploymentList
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const PodDNSConfig = Kubernetes.IoK8sApiCoreV1PodDNSConfig
        const Scale = Kubernetes.IoK8sApiAutoscalingV1Scale
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const PodAffinity = Kubernetes.IoK8sApiCoreV1PodAffinity
        const StatefulSetList = Kubernetes.IoK8sApiAppsV1StatefulSetList
        const PodTemplateSpec = Kubernetes.IoK8sApiCoreV1PodTemplateSpec
        const DaemonSetList = Kubernetes.IoK8sApiAppsV1DaemonSetList
        const DaemonSetSpec = Kubernetes.IoK8sApiAppsV1DaemonSetSpec
        const NodeAffinity = Kubernetes.IoK8sApiCoreV1NodeAffinity
        const StatefulSetUpdateStrategy = Kubernetes.IoK8sApiAppsV1StatefulSetUpdateStrategy
    end
    module RbacAuthorizationV1alpha1
        using ..Kubernetes
        const ClusterRoleList = Kubernetes.IoK8sApiRbacV1alpha1ClusterRoleList
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const ClusterRoleBindingList = Kubernetes.IoK8sApiRbacV1alpha1ClusterRoleBindingList
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const ClusterRole = Kubernetes.IoK8sApiRbacV1alpha1ClusterRole
        const RoleBinding = Kubernetes.IoK8sApiRbacV1alpha1RoleBinding
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const RoleRef = Kubernetes.IoK8sApiRbacV1alpha1RoleRef
        const RoleBindingList = Kubernetes.IoK8sApiRbacV1alpha1RoleBindingList
        const Role = Kubernetes.IoK8sApiRbacV1alpha1Role
        const AggregationRule = Kubernetes.IoK8sApiRbacV1alpha1AggregationRule
        const ClusterRoleBinding = Kubernetes.IoK8sApiRbacV1alpha1ClusterRoleBinding
        const RoleList = Kubernetes.IoK8sApiRbacV1alpha1RoleList
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
    end
    module DiscoveryV1beta1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const EndpointSliceList = Kubernetes.IoK8sApiDiscoveryV1beta1EndpointSliceList
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const EndpointSlice = Kubernetes.IoK8sApiDiscoveryV1beta1EndpointSlice
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
    end
    module AuditregistrationV1alpha1
        using ..Kubernetes
        const AuditSinkSpec = Kubernetes.IoK8sApiAuditregistrationV1alpha1AuditSinkSpec
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const AuditSink = Kubernetes.IoK8sApiAuditregistrationV1alpha1AuditSink
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const Policy = Kubernetes.IoK8sApiAuditregistrationV1alpha1Policy
        const Webhook = Kubernetes.IoK8sApiAuditregistrationV1alpha1Webhook
        const WebhookThrottleConfig = Kubernetes.IoK8sApiAuditregistrationV1alpha1WebhookThrottleConfig
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const WebhookClientConfig = Kubernetes.IoK8sApiAuditregistrationV1alpha1WebhookClientConfig
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const ServiceReference = Kubernetes.IoK8sApiAuditregistrationV1alpha1ServiceReference
        const AuditSinkList = Kubernetes.IoK8sApiAuditregistrationV1alpha1AuditSinkList
    end
    module KarpenterShV1alpha5
        using ..Kubernetes
        const sh_karpenter_v1alpha5_Provisioner_spec_limits = Kubernetes.ShKarpenterV1alpha5ProvisionerSpecLimits
        const sh_karpenter_v1alpha5_Provisioner_status = Kubernetes.ShKarpenterV1alpha5ProvisionerStatus
        const sh_karpenter_v1alpha5_Provisioner_spec = Kubernetes.ShKarpenterV1alpha5ProvisionerSpec
        const sh_karpenter_v1alpha5_Provisioner_spec_kubeletConfiguration = Kubernetes.ShKarpenterV1alpha5ProvisionerSpecKubeletConfiguration
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const Status_v2 = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusV2
        const ProvisionerList = Kubernetes.ShKarpenterV1alpha5ProvisionerList
        const Provisioner = Kubernetes.ShKarpenterV1alpha5Provisioner
        const sh_karpenter_v1alpha5_Provisioner_spec_providerRef = Kubernetes.ShKarpenterV1alpha5ProvisionerSpecProviderRef
        const StatusDetails_v2 = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetailsV2
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const sh_karpenter_v1alpha5_Provisioner_spec_consolidation = Kubernetes.ShKarpenterV1alpha5ProvisionerSpecConsolidation
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
    end
    module NetworkingV1beta1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const IngressSpec = Kubernetes.IoK8sApiNetworkingV1beta1IngressSpec
        const IngressStatus = Kubernetes.IoK8sApiNetworkingV1beta1IngressStatus
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const IngressList = Kubernetes.IoK8sApiNetworkingV1beta1IngressList
        const Ingress = Kubernetes.IoK8sApiNetworkingV1beta1Ingress
        const LoadBalancerStatus = Kubernetes.IoK8sApiCoreV1LoadBalancerStatus
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const IngressBackend = Kubernetes.IoK8sApiNetworkingV1beta1IngressBackend
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
    end
    module AdmissionregistrationV1beta1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const ValidatingWebhookConfiguration = Kubernetes.IoK8sApiAdmissionregistrationV1beta1ValidatingWebhookConfiguration
        const MutatingWebhookConfigurationList = Kubernetes.IoK8sApiAdmissionregistrationV1beta1MutatingWebhookConfigurationList
        const MutatingWebhookConfiguration = Kubernetes.IoK8sApiAdmissionregistrationV1beta1MutatingWebhookConfiguration
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const ValidatingWebhookConfigurationList = Kubernetes.IoK8sApiAdmissionregistrationV1beta1ValidatingWebhookConfigurationList
    end
    module StorageV1
        using ..Kubernetes
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const CinderPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1CinderPersistentVolumeSource
        const ScaleIOPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1ScaleIOPersistentVolumeSource
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const StorageOSPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1StorageOSPersistentVolumeSource
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const AzureDiskVolumeSource = Kubernetes.IoK8sApiCoreV1AzureDiskVolumeSource
        const GCEPersistentDiskVolumeSource = Kubernetes.IoK8sApiCoreV1GCEPersistentDiskVolumeSource
        const VolumeAttachmentStatus = Kubernetes.IoK8sApiStorageV1VolumeAttachmentStatus
        const FCVolumeSource = Kubernetes.IoK8sApiCoreV1FCVolumeSource
        const NodeSelector = Kubernetes.IoK8sApiCoreV1NodeSelector
        const VolumeError = Kubernetes.IoK8sApiStorageV1VolumeError
        const NFSVolumeSource = Kubernetes.IoK8sApiCoreV1NFSVolumeSource
        const LocalVolumeSource = Kubernetes.IoK8sApiCoreV1LocalVolumeSource
        const VolumeAttachmentSource = Kubernetes.IoK8sApiStorageV1VolumeAttachmentSource
        const CSINodeSpec = Kubernetes.IoK8sApiStorageV1CSINodeSpec
        const StorageClassList = Kubernetes.IoK8sApiStorageV1StorageClassList
        const ISCSIPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1ISCSIPersistentVolumeSource
        const FlockerVolumeSource = Kubernetes.IoK8sApiCoreV1FlockerVolumeSource
        const CephFSPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1CephFSPersistentVolumeSource
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const HostPathVolumeSource = Kubernetes.IoK8sApiCoreV1HostPathVolumeSource
        const PersistentVolumeSpec = Kubernetes.IoK8sApiCoreV1PersistentVolumeSpec
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const QuobyteVolumeSource = Kubernetes.IoK8sApiCoreV1QuobyteVolumeSource
        const ObjectReference = Kubernetes.IoK8sApiCoreV1ObjectReference
        const GlusterfsPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1GlusterfsPersistentVolumeSource
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const AWSElasticBlockStoreVolumeSource = Kubernetes.IoK8sApiCoreV1AWSElasticBlockStoreVolumeSource
        const RBDPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1RBDPersistentVolumeSource
        const VolumeNodeAffinity = Kubernetes.IoK8sApiCoreV1VolumeNodeAffinity
        const PortworxVolumeSource = Kubernetes.IoK8sApiCoreV1PortworxVolumeSource
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const CSINode = Kubernetes.IoK8sApiStorageV1CSINode
        const VsphereVirtualDiskVolumeSource = Kubernetes.IoK8sApiCoreV1VsphereVirtualDiskVolumeSource
        const FlexPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1FlexPersistentVolumeSource
        const VolumeAttachmentList = Kubernetes.IoK8sApiStorageV1VolumeAttachmentList
        const AzureFilePersistentVolumeSource = Kubernetes.IoK8sApiCoreV1AzureFilePersistentVolumeSource
        const SecretReference = Kubernetes.IoK8sApiCoreV1SecretReference
        const StorageClass = Kubernetes.IoK8sApiStorageV1StorageClass
        const VolumeAttachment = Kubernetes.IoK8sApiStorageV1VolumeAttachment
        const PhotonPersistentDiskVolumeSource = Kubernetes.IoK8sApiCoreV1PhotonPersistentDiskVolumeSource
        const VolumeAttachmentSpec = Kubernetes.IoK8sApiStorageV1VolumeAttachmentSpec
        const CSIPersistentVolumeSource = Kubernetes.IoK8sApiCoreV1CSIPersistentVolumeSource
        const CSINodeList = Kubernetes.IoK8sApiStorageV1CSINodeList
    end
    module ExtensionsV1beta1
        using ..Kubernetes
        const PodSecurityPolicy = Kubernetes.IoK8sApiExtensionsV1beta1PodSecurityPolicy
        const WatchEvent = Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
        const IngressList = Kubernetes.IoK8sApiExtensionsV1beta1IngressList
        const ReplicaSetList = Kubernetes.IoK8sApiExtensionsV1beta1ReplicaSetList
        const IngressBackend = Kubernetes.IoK8sApiExtensionsV1beta1IngressBackend
        const PodSpec = Kubernetes.IoK8sApiCoreV1PodSpec
        const Affinity = Kubernetes.IoK8sApiCoreV1Affinity
        const ReplicaSetSpec = Kubernetes.IoK8sApiExtensionsV1beta1ReplicaSetSpec
        const IngressSpec = Kubernetes.IoK8sApiExtensionsV1beta1IngressSpec
        const ReplicaSet = Kubernetes.IoK8sApiExtensionsV1beta1ReplicaSet
        const LoadBalancerStatus = Kubernetes.IoK8sApiCoreV1LoadBalancerStatus
        const Status = Kubernetes.IoK8sApimachineryPkgApisMetaV1Status
        const DaemonSetSpec = Kubernetes.IoK8sApiExtensionsV1beta1DaemonSetSpec
        const ObjectMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ObjectMeta
        const Ingress = Kubernetes.IoK8sApiExtensionsV1beta1Ingress
        const SELinuxOptions = Kubernetes.IoK8sApiCoreV1SELinuxOptions
        const LabelSelector = Kubernetes.IoK8sApimachineryPkgApisMetaV1LabelSelector
        const WindowsSecurityContextOptions = Kubernetes.IoK8sApiCoreV1WindowsSecurityContextOptions
        const IngressStatus = Kubernetes.IoK8sApiExtensionsV1beta1IngressStatus
        const SupplementalGroupsStrategyOptions = Kubernetes.IoK8sApiExtensionsV1beta1SupplementalGroupsStrategyOptions
        const RollingUpdateDeployment = Kubernetes.IoK8sApiExtensionsV1beta1RollingUpdateDeployment
        const NetworkPolicyList = Kubernetes.IoK8sApiExtensionsV1beta1NetworkPolicyList
        const ScaleSpec = Kubernetes.IoK8sApiExtensionsV1beta1ScaleSpec
        const DaemonSetStatus = Kubernetes.IoK8sApiExtensionsV1beta1DaemonSetStatus
        const PodSecurityContext = Kubernetes.IoK8sApiCoreV1PodSecurityContext
        const NodeSelector = Kubernetes.IoK8sApiCoreV1NodeSelector
        const Deployment = Kubernetes.IoK8sApiExtensionsV1beta1Deployment
        const RuntimeClassStrategyOptions = Kubernetes.IoK8sApiExtensionsV1beta1RuntimeClassStrategyOptions
        const NetworkPolicySpec = Kubernetes.IoK8sApiExtensionsV1beta1NetworkPolicySpec
        const DaemonSet = Kubernetes.IoK8sApiExtensionsV1beta1DaemonSet
        const RunAsGroupStrategyOptions = Kubernetes.IoK8sApiExtensionsV1beta1RunAsGroupStrategyOptions
        const DeploymentStatus = Kubernetes.IoK8sApiExtensionsV1beta1DeploymentStatus
        const PodSecurityPolicySpec = Kubernetes.IoK8sApiExtensionsV1beta1PodSecurityPolicySpec
        const PodAntiAffinity = Kubernetes.IoK8sApiCoreV1PodAntiAffinity
        const ReplicaSetStatus = Kubernetes.IoK8sApiExtensionsV1beta1ReplicaSetStatus
        const RunAsUserStrategyOptions = Kubernetes.IoK8sApiExtensionsV1beta1RunAsUserStrategyOptions
        const NetworkPolicy = Kubernetes.IoK8sApiExtensionsV1beta1NetworkPolicy
        const DeploymentSpec = Kubernetes.IoK8sApiExtensionsV1beta1DeploymentSpec
        const StatusDetails = Kubernetes.IoK8sApimachineryPkgApisMetaV1StatusDetails
        const SELinuxStrategyOptions = Kubernetes.IoK8sApiExtensionsV1beta1SELinuxStrategyOptions
        const APIGroupList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIGroupList
        const DeploymentList = Kubernetes.IoK8sApiExtensionsV1beta1DeploymentList
        const ListMeta = Kubernetes.IoK8sApimachineryPkgApisMetaV1ListMeta
        const PodDNSConfig = Kubernetes.IoK8sApiCoreV1PodDNSConfig
        const RollingUpdateDaemonSet = Kubernetes.IoK8sApiExtensionsV1beta1RollingUpdateDaemonSet
        const DaemonSetList = Kubernetes.IoK8sApiExtensionsV1beta1DaemonSetList
        const DeploymentStrategy = Kubernetes.IoK8sApiExtensionsV1beta1DeploymentStrategy
        const APIResourceList = Kubernetes.IoK8sApimachineryPkgApisMetaV1APIResourceList
        const PodAffinity = Kubernetes.IoK8sApiCoreV1PodAffinity
        const PodTemplateSpec = Kubernetes.IoK8sApiCoreV1PodTemplateSpec
        const Scale = Kubernetes.IoK8sApiExtensionsV1beta1Scale
        const DaemonSetUpdateStrategy = Kubernetes.IoK8sApiExtensionsV1beta1DaemonSetUpdateStrategy
        const PodSecurityPolicyList = Kubernetes.IoK8sApiExtensionsV1beta1PodSecurityPolicyList
        const RollbackConfig = Kubernetes.IoK8sApiExtensionsV1beta1RollbackConfig
        const FSGroupStrategyOptions = Kubernetes.IoK8sApiExtensionsV1beta1FSGroupStrategyOptions
        const NodeAffinity = Kubernetes.IoK8sApiCoreV1NodeAffinity
        const ScaleStatus = Kubernetes.IoK8sApiExtensionsV1beta1ScaleStatus
    end
end
