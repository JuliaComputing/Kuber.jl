# watchNamespacedEvent
watchNamespacedEvent(_api::CoreV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedEvent(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedEvent

# createNamespacedPersistentVolumeClaim
createNamespacedPersistentVolumeClaim(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedPersistentVolumeClaim(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedPersistentVolumeClaim

# proxyDELETENamespacedServiceWithPath
proxyDELETENamespacedServiceWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1DELETENamespacedServiceWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyDELETENamespacedServiceWithPath

# connectHeadNodeProxy
connectHeadNodeProxy(_api::CoreV1Api, name::String; path=nothing, _mediaType=nothing) = connectCoreV1HeadNodeProxy(_api, name; path=path, _mediaType=_mediaType)
export connectHeadNodeProxy

# connectPostNamespacedServiceProxy
connectPostNamespacedServiceProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1PostNamespacedServiceProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectPostNamespacedServiceProxy

# patchNamespacedRoleBinding
patchNamespacedRoleBinding(_api::RbacAuthorizationV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchRbacAuthorizationV1NamespacedRoleBinding(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
patchNamespacedRoleBinding(_api::RbacAuthorizationV1alpha1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchRbacAuthorizationV1alpha1NamespacedRoleBinding(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
patchNamespacedRoleBinding(_api::RbacAuthorizationV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchRbacAuthorizationV1beta1NamespacedRoleBinding(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedRoleBinding

# listJobForAllNamespaces
listJobForAllNamespaces(_api::BatchV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listBatchV1JobForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listJobForAllNamespaces

# proxyGETNamespacedService
proxyGETNamespacedService(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1GETNamespacedService(_api, name, namespace; _mediaType=_mediaType)
export proxyGETNamespacedService

# replaceNamespacedCronJobStatus
replaceNamespacedCronJobStatus(_api::BatchV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceBatchV1beta1NamespacedCronJobStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
replaceNamespacedCronJobStatus(_api::BatchV2alpha1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceBatchV2alpha1NamespacedCronJobStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedCronJobStatus

# deleteNamespacedReplicationController
deleteNamespacedReplicationController(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1NamespacedReplicationController(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedReplicationController

# createNamespacedSecret
createNamespacedSecret(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedSecret(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedSecret

# deleteCollectionNamespacedDaemonSet
deleteCollectionNamespacedDaemonSet(_api::AppsV1beta2Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteAppsV1beta2CollectionNamespacedDaemonSet(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
deleteCollectionNamespacedDaemonSet(_api::ExtensionsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteExtensionsV1beta1CollectionNamespacedDaemonSet(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedDaemonSet

# createNamespacedEndpoints
createNamespacedEndpoints(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedEndpoints(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedEndpoints

# proxyHEADNamespacedPod
proxyHEADNamespacedPod(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1HEADNamespacedPod(_api, name, namespace; _mediaType=_mediaType)
export proxyHEADNamespacedPod

# deleteNamespacedRole
deleteNamespacedRole(_api::RbacAuthorizationV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1NamespacedRole(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
deleteNamespacedRole(_api::RbacAuthorizationV1alpha1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1alpha1NamespacedRole(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
deleteNamespacedRole(_api::RbacAuthorizationV1beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1beta1NamespacedRole(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedRole

# deleteNamespacedSecret
deleteNamespacedSecret(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1NamespacedSecret(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedSecret

# connectHeadNamespacedPodProxyWithPath
connectHeadNamespacedPodProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1HeadNamespacedPodProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectHeadNamespacedPodProxyWithPath

# readNamespacedPersistentVolumeClaim
readNamespacedPersistentVolumeClaim(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1NamespacedPersistentVolumeClaim(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedPersistentVolumeClaim

# deleteClusterRole
deleteClusterRole(_api::RbacAuthorizationV1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1ClusterRole(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
deleteClusterRole(_api::RbacAuthorizationV1alpha1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1alpha1ClusterRole(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
deleteClusterRole(_api::RbacAuthorizationV1beta1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1beta1ClusterRole(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteClusterRole

# watchNamespacedStatefulSetList
watchNamespacedStatefulSetList(_api::AppsV1beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta1NamespacedStatefulSetList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedStatefulSetList(_api::AppsV1beta2Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2NamespacedStatefulSetList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedStatefulSetList

# createNamespacedIngress
createNamespacedIngress(_api::ExtensionsV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createExtensionsV1beta1NamespacedIngress(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedIngress

# proxyHEADNamespacedPodWithPath
proxyHEADNamespacedPodWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1HEADNamespacedPodWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyHEADNamespacedPodWithPath

# deletePodSecurityPolicy
deletePodSecurityPolicy(_api::ExtensionsV1beta1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteExtensionsV1beta1PodSecurityPolicy(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deletePodSecurityPolicy

# patchNamespacedEvent
patchNamespacedEvent(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedEvent(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedEvent

# listCustomResourceDefinition
listCustomResourceDefinition(_api::ApiextensionsV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listApiextensionsV1beta1CustomResourceDefinition(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listCustomResourceDefinition

# readNamespacedStatefulSetScale
readNamespacedStatefulSetScale(_api::AppsV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAppsV1beta1NamespacedStatefulSetScale(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
readNamespacedStatefulSetScale(_api::AppsV1beta2Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAppsV1beta2NamespacedStatefulSetScale(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedStatefulSetScale

# connectDeleteNodeProxyWithPath
connectDeleteNodeProxyWithPath(_api::CoreV1Api, name::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1DeleteNodeProxyWithPath(_api, name, path; path2=path2, _mediaType=_mediaType)
export connectDeleteNodeProxyWithPath

# patchPodSecurityPolicy
patchPodSecurityPolicy(_api::ExtensionsV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1PodSecurityPolicy(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchPodSecurityPolicy

# createNamespace
createNamespace(_api::CoreV1Api, body; pretty=nothing, _mediaType=nothing) = createCoreV1Namespace(_api, body; pretty=pretty, _mediaType=_mediaType)
export createNamespace

# deleteCollectionNamespacedPersistentVolumeClaim
deleteCollectionNamespacedPersistentVolumeClaim(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionNamespacedPersistentVolumeClaim(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedPersistentVolumeClaim

# patchAPIService
patchAPIService(_api::ApiregistrationV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchApiregistrationV1beta1APIService(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchAPIService

# deleteCollectionNamespacedStatefulSet
deleteCollectionNamespacedStatefulSet(_api::AppsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteAppsV1beta1CollectionNamespacedStatefulSet(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
deleteCollectionNamespacedStatefulSet(_api::AppsV1beta2Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteAppsV1beta2CollectionNamespacedStatefulSet(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedStatefulSet

# deleteNamespacedDaemonSet
deleteNamespacedDaemonSet(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteAppsV1beta2NamespacedDaemonSet(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
deleteNamespacedDaemonSet(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteExtensionsV1beta1NamespacedDaemonSet(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedDaemonSet

# watchExternalAdmissionHookConfiguration
watchExternalAdmissionHookConfiguration(_api::AdmissionregistrationV1alpha1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAdmissionregistrationV1alpha1ExternalAdmissionHookConfiguration(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchExternalAdmissionHookConfiguration

# deleteNamespacedRoleBinding
deleteNamespacedRoleBinding(_api::RbacAuthorizationV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1NamespacedRoleBinding(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
deleteNamespacedRoleBinding(_api::RbacAuthorizationV1alpha1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1alpha1NamespacedRoleBinding(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
deleteNamespacedRoleBinding(_api::RbacAuthorizationV1beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1beta1NamespacedRoleBinding(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedRoleBinding

# patchClusterRole
patchClusterRole(_api::RbacAuthorizationV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchRbacAuthorizationV1ClusterRole(_api, name, body; pretty=pretty, _mediaType=_mediaType)
patchClusterRole(_api::RbacAuthorizationV1alpha1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchRbacAuthorizationV1alpha1ClusterRole(_api, name, body; pretty=pretty, _mediaType=_mediaType)
patchClusterRole(_api::RbacAuthorizationV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchRbacAuthorizationV1beta1ClusterRole(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchClusterRole

# deleteStorageClass
deleteStorageClass(_api::StorageV1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteStorageV1StorageClass(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
deleteStorageClass(_api::StorageV1beta1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteStorageV1beta1StorageClass(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteStorageClass

# watchHorizontalPodAutoscalerListForAllNamespaces
watchHorizontalPodAutoscalerListForAllNamespaces(_api::AutoscalingV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAutoscalingV1HorizontalPodAutoscalerListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchHorizontalPodAutoscalerListForAllNamespaces(_api::AutoscalingV2beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAutoscalingV2beta1HorizontalPodAutoscalerListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchHorizontalPodAutoscalerListForAllNamespaces

# patchNamespacedPod
patchNamespacedPod(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedPod(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedPod

# watchInitializerConfiguration
watchInitializerConfiguration(_api::AdmissionregistrationV1alpha1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAdmissionregistrationV1alpha1InitializerConfiguration(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchInitializerConfiguration

# connectPatchNamespacedPodProxy
connectPatchNamespacedPodProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1PatchNamespacedPodProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectPatchNamespacedPodProxy

# createNamespacedCronJob
createNamespacedCronJob(_api::BatchV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createBatchV1beta1NamespacedCronJob(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
createNamespacedCronJob(_api::BatchV2alpha1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createBatchV2alpha1NamespacedCronJob(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedCronJob

# patchStorageClass
patchStorageClass(_api::StorageV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchStorageV1StorageClass(_api, name, body; pretty=pretty, _mediaType=_mediaType)
patchStorageClass(_api::StorageV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchStorageV1beta1StorageClass(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchStorageClass

# connectPutNodeProxy
connectPutNodeProxy(_api::CoreV1Api, name::String; path=nothing, _mediaType=nothing) = connectCoreV1PutNodeProxy(_api, name; path=path, _mediaType=_mediaType)
export connectPutNodeProxy

# watchCronJobListForAllNamespaces
watchCronJobListForAllNamespaces(_api::BatchV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchBatchV1beta1CronJobListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchCronJobListForAllNamespaces(_api::BatchV2alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchBatchV2alpha1CronJobListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchCronJobListForAllNamespaces

# connectDeleteNamespacedServiceProxy
connectDeleteNamespacedServiceProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1DeleteNamespacedServiceProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectDeleteNamespacedServiceProxy

# deleteCollectionStorageClass
deleteCollectionStorageClass(_api::StorageV1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteStorageV1CollectionStorageClass(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
deleteCollectionStorageClass(_api::StorageV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteStorageV1beta1CollectionStorageClass(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionStorageClass

# connectPatchNamespacedServiceProxy
connectPatchNamespacedServiceProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1PatchNamespacedServiceProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectPatchNamespacedServiceProxy

# replaceNamespacedSecret
replaceNamespacedSecret(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedSecret(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedSecret

# deleteNamespacedResourceQuota
deleteNamespacedResourceQuota(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1NamespacedResourceQuota(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedResourceQuota

# patchNamespacedServiceAccount
patchNamespacedServiceAccount(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedServiceAccount(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedServiceAccount

# deleteCollectionNamespacedConfigMap
deleteCollectionNamespacedConfigMap(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionNamespacedConfigMap(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedConfigMap

# deleteNamespacedService
deleteNamespacedService(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = deleteCoreV1NamespacedService(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export deleteNamespacedService

# replaceNamespacedHorizontalPodAutoscaler
replaceNamespacedHorizontalPodAutoscaler(_api::AutoscalingV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAutoscalingV1NamespacedHorizontalPodAutoscaler(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
replaceNamespacedHorizontalPodAutoscaler(_api::AutoscalingV2beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAutoscalingV2beta1NamespacedHorizontalPodAutoscaler(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedHorizontalPodAutoscaler

# readNamespacedReplicaSetStatus
readNamespacedReplicaSetStatus(_api::AppsV1beta2Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAppsV1beta2NamespacedReplicaSetStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
readNamespacedReplicaSetStatus(_api::ExtensionsV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readExtensionsV1beta1NamespacedReplicaSetStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedReplicaSetStatus

# deleteNamespacedCronJob
deleteNamespacedCronJob(_api::BatchV1beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteBatchV1beta1NamespacedCronJob(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
deleteNamespacedCronJob(_api::BatchV2alpha1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteBatchV2alpha1NamespacedCronJob(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedCronJob

# readNamespacedDaemonSetStatus
readNamespacedDaemonSetStatus(_api::AppsV1beta2Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAppsV1beta2NamespacedDaemonSetStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
readNamespacedDaemonSetStatus(_api::ExtensionsV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readExtensionsV1beta1NamespacedDaemonSetStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedDaemonSetStatus

# connectPutNamespacedServiceProxy
connectPutNamespacedServiceProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1PutNamespacedServiceProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectPutNamespacedServiceProxy

# listClusterRoleBinding
listClusterRoleBinding(_api::RbacAuthorizationV1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1ClusterRoleBinding(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listClusterRoleBinding(_api::RbacAuthorizationV1alpha1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1alpha1ClusterRoleBinding(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listClusterRoleBinding(_api::RbacAuthorizationV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1beta1ClusterRoleBinding(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listClusterRoleBinding

# replaceNamespacedStatefulSetStatus
replaceNamespacedStatefulSetStatus(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta1NamespacedStatefulSetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
replaceNamespacedStatefulSetStatus(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta2NamespacedStatefulSetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedStatefulSetStatus

# deleteCollectionNamespacedLimitRange
deleteCollectionNamespacedLimitRange(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionNamespacedLimitRange(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedLimitRange

# readNamespacedResourceQuotaStatus
readNamespacedResourceQuotaStatus(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readCoreV1NamespacedResourceQuotaStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedResourceQuotaStatus

# proxyPATCHNode
proxyPATCHNode(_api::CoreV1Api, name::String; _mediaType=nothing) = proxyCoreV1PATCHNode(_api, name; _mediaType=_mediaType)
export proxyPATCHNode

# patchNamespacedConfigMap
patchNamespacedConfigMap(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedConfigMap(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedConfigMap

# proxyDELETENode
proxyDELETENode(_api::CoreV1Api, name::String; _mediaType=nothing) = proxyCoreV1DELETENode(_api, name; _mediaType=_mediaType)
export proxyDELETENode

# replaceNamespacedEndpoints
replaceNamespacedEndpoints(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedEndpoints(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedEndpoints

# replaceNamespacedStatefulSetScale
replaceNamespacedStatefulSetScale(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta1NamespacedStatefulSetScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
replaceNamespacedStatefulSetScale(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta2NamespacedStatefulSetScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedStatefulSetScale

# createNamespacedPodEviction
createNamespacedPodEviction(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedPodEviction(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedPodEviction

# connectGetNamespacedPodPortforward
connectGetNamespacedPodPortforward(_api::CoreV1Api, name::String, namespace::String; ports=nothing, _mediaType=nothing) = connectCoreV1GetNamespacedPodPortforward(_api, name, namespace; ports=ports, _mediaType=_mediaType)
export connectGetNamespacedPodPortforward

# createNamespacedBinding
createNamespacedBinding(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedBinding(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedBinding

# listResourceQuotaForAllNamespaces
listResourceQuotaForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1ResourceQuotaForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listResourceQuotaForAllNamespaces

# deleteCollectionClusterRoleBinding
deleteCollectionClusterRoleBinding(_api::RbacAuthorizationV1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1CollectionClusterRoleBinding(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
deleteCollectionClusterRoleBinding(_api::RbacAuthorizationV1alpha1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1alpha1CollectionClusterRoleBinding(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
deleteCollectionClusterRoleBinding(_api::RbacAuthorizationV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1beta1CollectionClusterRoleBinding(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionClusterRoleBinding

# deleteCollectionNamespacedServiceAccount
deleteCollectionNamespacedServiceAccount(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionNamespacedServiceAccount(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedServiceAccount

# createClusterRoleBinding
createClusterRoleBinding(_api::RbacAuthorizationV1Api, body; pretty=nothing, _mediaType=nothing) = createRbacAuthorizationV1ClusterRoleBinding(_api, body; pretty=pretty, _mediaType=_mediaType)
createClusterRoleBinding(_api::RbacAuthorizationV1alpha1Api, body; pretty=nothing, _mediaType=nothing) = createRbacAuthorizationV1alpha1ClusterRoleBinding(_api, body; pretty=pretty, _mediaType=_mediaType)
createClusterRoleBinding(_api::RbacAuthorizationV1beta1Api, body; pretty=nothing, _mediaType=nothing) = createRbacAuthorizationV1beta1ClusterRoleBinding(_api, body; pretty=pretty, _mediaType=_mediaType)
export createClusterRoleBinding

# listLimitRangeForAllNamespaces
listLimitRangeForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1LimitRangeForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listLimitRangeForAllNamespaces

# listPersistentVolumeClaimForAllNamespaces
listPersistentVolumeClaimForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1PersistentVolumeClaimForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listPersistentVolumeClaimForAllNamespaces

# deleteNamespacedLimitRange
deleteNamespacedLimitRange(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1NamespacedLimitRange(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedLimitRange

# patchNamespacedDeployment
patchNamespacedDeployment(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta1NamespacedDeployment(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
patchNamespacedDeployment(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta2NamespacedDeployment(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
patchNamespacedDeployment(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1NamespacedDeployment(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedDeployment

# connectGetNamespacedPodProxyWithPath
connectGetNamespacedPodProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1GetNamespacedPodProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectGetNamespacedPodProxyWithPath

# watchNamespacedStatefulSet
watchNamespacedStatefulSet(_api::AppsV1beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta1NamespacedStatefulSet(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedStatefulSet(_api::AppsV1beta2Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2NamespacedStatefulSet(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedStatefulSet

# patchNamespacedControllerRevision
patchNamespacedControllerRevision(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta1NamespacedControllerRevision(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
patchNamespacedControllerRevision(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta2NamespacedControllerRevision(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedControllerRevision

# watchNamespacedCronJob
watchNamespacedCronJob(_api::BatchV1beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchBatchV1beta1NamespacedCronJob(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedCronJob(_api::BatchV2alpha1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchBatchV2alpha1NamespacedCronJob(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedCronJob

# patchNamespacedPodDisruptionBudgetStatus
patchNamespacedPodDisruptionBudgetStatus(_api::PolicyV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchPolicyV1beta1NamespacedPodDisruptionBudgetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedPodDisruptionBudgetStatus

# patchClusterRoleBinding
patchClusterRoleBinding(_api::RbacAuthorizationV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchRbacAuthorizationV1ClusterRoleBinding(_api, name, body; pretty=pretty, _mediaType=_mediaType)
patchClusterRoleBinding(_api::RbacAuthorizationV1alpha1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchRbacAuthorizationV1alpha1ClusterRoleBinding(_api, name, body; pretty=pretty, _mediaType=_mediaType)
patchClusterRoleBinding(_api::RbacAuthorizationV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchRbacAuthorizationV1beta1ClusterRoleBinding(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchClusterRoleBinding

# readNamespacedHorizontalPodAutoscaler
readNamespacedHorizontalPodAutoscaler(_api::AutoscalingV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readAutoscalingV1NamespacedHorizontalPodAutoscaler(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
readNamespacedHorizontalPodAutoscaler(_api::AutoscalingV2beta1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readAutoscalingV2beta1NamespacedHorizontalPodAutoscaler(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedHorizontalPodAutoscaler

# readClusterRole
readClusterRole(_api::RbacAuthorizationV1Api, name::String; pretty=nothing, _mediaType=nothing) = readRbacAuthorizationV1ClusterRole(_api, name; pretty=pretty, _mediaType=_mediaType)
readClusterRole(_api::RbacAuthorizationV1alpha1Api, name::String; pretty=nothing, _mediaType=nothing) = readRbacAuthorizationV1alpha1ClusterRole(_api, name; pretty=pretty, _mediaType=_mediaType)
readClusterRole(_api::RbacAuthorizationV1beta1Api, name::String; pretty=nothing, _mediaType=nothing) = readRbacAuthorizationV1beta1ClusterRole(_api, name; pretty=pretty, _mediaType=_mediaType)
export readClusterRole

# watchAPIService
watchAPIService(_api::ApiregistrationV1beta1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchApiregistrationV1beta1APIService(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchAPIService

# watchServiceAccountListForAllNamespaces
watchServiceAccountListForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1ServiceAccountListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchServiceAccountListForAllNamespaces

# readNamespacedReplicaSet
readNamespacedReplicaSet(_api::AppsV1beta2Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readAppsV1beta2NamespacedReplicaSet(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
readNamespacedReplicaSet(_api::ExtensionsV1beta1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readExtensionsV1beta1NamespacedReplicaSet(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedReplicaSet

# readNamespacedControllerRevision
readNamespacedControllerRevision(_api::AppsV1beta1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readAppsV1beta1NamespacedControllerRevision(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
readNamespacedControllerRevision(_api::AppsV1beta2Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readAppsV1beta2NamespacedControllerRevision(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedControllerRevision

# watchDaemonSetListForAllNamespaces
watchDaemonSetListForAllNamespaces(_api::AppsV1beta2Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2DaemonSetListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchDaemonSetListForAllNamespaces(_api::ExtensionsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1DaemonSetListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchDaemonSetListForAllNamespaces

# watchDeploymentListForAllNamespaces
watchDeploymentListForAllNamespaces(_api::AppsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta1DeploymentListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchDeploymentListForAllNamespaces(_api::AppsV1beta2Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2DeploymentListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchDeploymentListForAllNamespaces(_api::ExtensionsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1DeploymentListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchDeploymentListForAllNamespaces

# watchNamespacedRoleList
watchNamespacedRoleList(_api::RbacAuthorizationV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1NamespacedRoleList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedRoleList(_api::RbacAuthorizationV1alpha1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1alpha1NamespacedRoleList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedRoleList(_api::RbacAuthorizationV1beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1beta1NamespacedRoleList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedRoleList

# watchCustomResourceDefinitionList
watchCustomResourceDefinitionList(_api::ApiextensionsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchApiextensionsV1beta1CustomResourceDefinitionList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchCustomResourceDefinitionList

# watchNamespacedDaemonSetList
watchNamespacedDaemonSetList(_api::AppsV1beta2Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2NamespacedDaemonSetList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedDaemonSetList(_api::ExtensionsV1beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1NamespacedDaemonSetList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedDaemonSetList

# readNamespacedDeploymentStatus
readNamespacedDeploymentStatus(_api::AppsV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAppsV1beta1NamespacedDeploymentStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
readNamespacedDeploymentStatus(_api::AppsV1beta2Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAppsV1beta2NamespacedDeploymentStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
readNamespacedDeploymentStatus(_api::ExtensionsV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readExtensionsV1beta1NamespacedDeploymentStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedDeploymentStatus

# readNamespacedDeployment
readNamespacedDeployment(_api::AppsV1beta1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readAppsV1beta1NamespacedDeployment(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
readNamespacedDeployment(_api::AppsV1beta2Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readAppsV1beta2NamespacedDeployment(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
readNamespacedDeployment(_api::ExtensionsV1beta1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readExtensionsV1beta1NamespacedDeployment(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedDeployment

# deleteNamespacedServiceAccount
deleteNamespacedServiceAccount(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1NamespacedServiceAccount(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedServiceAccount

# connectPostNamespacedPodProxyWithPath
connectPostNamespacedPodProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1PostNamespacedPodProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectPostNamespacedPodProxyWithPath

# readNamespacedDaemonSet
readNamespacedDaemonSet(_api::AppsV1beta2Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readAppsV1beta2NamespacedDaemonSet(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
readNamespacedDaemonSet(_api::ExtensionsV1beta1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readExtensionsV1beta1NamespacedDaemonSet(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedDaemonSet

# listNamespacedEndpoints
listNamespacedEndpoints(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1NamespacedEndpoints(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedEndpoints

# patchNamespacedReplicationControllerDummyScale
patchNamespacedReplicationControllerDummyScale(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1NamespacedReplicationControllerDummyScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedReplicationControllerDummyScale

# replaceAPIServiceStatus
replaceAPIServiceStatus(_api::ApiregistrationV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceApiregistrationV1beta1APIServiceStatus(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceAPIServiceStatus

# patchNamespacedDaemonSet
patchNamespacedDaemonSet(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta2NamespacedDaemonSet(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
patchNamespacedDaemonSet(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1NamespacedDaemonSet(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedDaemonSet

# connectHeadNodeProxyWithPath
connectHeadNodeProxyWithPath(_api::CoreV1Api, name::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1HeadNodeProxyWithPath(_api, name, path; path2=path2, _mediaType=_mediaType)
export connectHeadNodeProxyWithPath

# replaceNamespacedDaemonSet
replaceNamespacedDaemonSet(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta2NamespacedDaemonSet(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
replaceNamespacedDaemonSet(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1NamespacedDaemonSet(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedDaemonSet

# watchNamespacedReplicationControllerList
watchNamespacedReplicationControllerList(_api::CoreV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedReplicationControllerList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedReplicationControllerList

# createNamespacedDaemonSet
createNamespacedDaemonSet(_api::AppsV1beta2Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAppsV1beta2NamespacedDaemonSet(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
createNamespacedDaemonSet(_api::ExtensionsV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createExtensionsV1beta1NamespacedDaemonSet(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedDaemonSet

# patchNamespacedPodDisruptionBudget
patchNamespacedPodDisruptionBudget(_api::PolicyV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchPolicyV1beta1NamespacedPodDisruptionBudget(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedPodDisruptionBudget

# deletePriorityClass
deletePriorityClass(_api::SchedulingV1alpha1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteSchedulingV1alpha1PriorityClass(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deletePriorityClass

# replaceNamespacedLimitRange
replaceNamespacedLimitRange(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedLimitRange(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedLimitRange

# listEndpointsForAllNamespaces
listEndpointsForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1EndpointsForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listEndpointsForAllNamespaces

# listNode
listNode(_api::CoreV1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1Node(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNode

# connectPostNamespacedPodProxy
connectPostNamespacedPodProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1PostNamespacedPodProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectPostNamespacedPodProxy

# createPersistentVolume
createPersistentVolume(_api::CoreV1Api, body; pretty=nothing, _mediaType=nothing) = createCoreV1PersistentVolume(_api, body; pretty=pretty, _mediaType=_mediaType)
export createPersistentVolume

# replaceCertificateSigningRequestApproval
replaceCertificateSigningRequestApproval(_api::CertificatesV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceCertificatesV1beta1CertificateSigningRequestApproval(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceCertificateSigningRequestApproval

# createClusterRole
createClusterRole(_api::RbacAuthorizationV1Api, body; pretty=nothing, _mediaType=nothing) = createRbacAuthorizationV1ClusterRole(_api, body; pretty=pretty, _mediaType=_mediaType)
createClusterRole(_api::RbacAuthorizationV1alpha1Api, body; pretty=nothing, _mediaType=nothing) = createRbacAuthorizationV1alpha1ClusterRole(_api, body; pretty=pretty, _mediaType=_mediaType)
createClusterRole(_api::RbacAuthorizationV1beta1Api, body; pretty=nothing, _mediaType=nothing) = createRbacAuthorizationV1beta1ClusterRole(_api, body; pretty=pretty, _mediaType=_mediaType)
export createClusterRole

# deleteCollectionNamespacedRole
deleteCollectionNamespacedRole(_api::RbacAuthorizationV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1CollectionNamespacedRole(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
deleteCollectionNamespacedRole(_api::RbacAuthorizationV1alpha1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1alpha1CollectionNamespacedRole(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
deleteCollectionNamespacedRole(_api::RbacAuthorizationV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1beta1CollectionNamespacedRole(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedRole

# patchNamespacedPersistentVolumeClaimStatus
patchNamespacedPersistentVolumeClaimStatus(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedPersistentVolumeClaimStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedPersistentVolumeClaimStatus

# connectOptionsNodeProxy
connectOptionsNodeProxy(_api::CoreV1Api, name::String; path=nothing, _mediaType=nothing) = connectCoreV1OptionsNodeProxy(_api, name; path=path, _mediaType=_mediaType)
export connectOptionsNodeProxy

# watchNamespacedResourceQuotaList
watchNamespacedResourceQuotaList(_api::CoreV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedResourceQuotaList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedResourceQuotaList

# connectPostNamespacedPodExec
connectPostNamespacedPodExec(_api::CoreV1Api, name::String, namespace::String; command=nothing, container=nothing, stderr=nothing, stdin=nothing, stdout=nothing, tty=nothing, _mediaType=nothing) = connectCoreV1PostNamespacedPodExec(_api, name, namespace; command=command, container=container, stderr=stderr, stdin=stdin, stdout=stdout, tty=tty, _mediaType=_mediaType)
export connectPostNamespacedPodExec

# proxyDELETENodeWithPath
proxyDELETENodeWithPath(_api::CoreV1Api, name::String, path::String; _mediaType=nothing) = proxyCoreV1DELETENodeWithPath(_api, name, path; _mediaType=_mediaType)
export proxyDELETENodeWithPath

# readNode
readNode(_api::CoreV1Api, name::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1Node(_api, name; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNode

# readNamespacedReplicationControllerDummyScale
readNamespacedReplicationControllerDummyScale(_api::ExtensionsV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readExtensionsV1beta1NamespacedReplicationControllerDummyScale(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedReplicationControllerDummyScale

# watchNetworkPolicyListForAllNamespaces
watchNetworkPolicyListForAllNamespaces(_api::ExtensionsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1NetworkPolicyListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNetworkPolicyListForAllNamespaces(_api::NetworkingV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchNetworkingV1NetworkPolicyListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNetworkPolicyListForAllNamespaces

# deleteCollectionClusterRole
deleteCollectionClusterRole(_api::RbacAuthorizationV1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1CollectionClusterRole(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
deleteCollectionClusterRole(_api::RbacAuthorizationV1alpha1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1alpha1CollectionClusterRole(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
deleteCollectionClusterRole(_api::RbacAuthorizationV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1beta1CollectionClusterRole(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionClusterRole

# connectOptionsNamespacedServiceProxyWithPath
connectOptionsNamespacedServiceProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1OptionsNamespacedServiceProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectOptionsNamespacedServiceProxyWithPath

# patchNamespacedPodPreset
patchNamespacedPodPreset(_api::SettingsV1alpha1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchSettingsV1alpha1NamespacedPodPreset(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedPodPreset

# replaceClusterRole
replaceClusterRole(_api::RbacAuthorizationV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceRbacAuthorizationV1ClusterRole(_api, name, body; pretty=pretty, _mediaType=_mediaType)
replaceClusterRole(_api::RbacAuthorizationV1alpha1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceRbacAuthorizationV1alpha1ClusterRole(_api, name, body; pretty=pretty, _mediaType=_mediaType)
replaceClusterRole(_api::RbacAuthorizationV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceRbacAuthorizationV1beta1ClusterRole(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceClusterRole

# watchExternalAdmissionHookConfigurationList
watchExternalAdmissionHookConfigurationList(_api::AdmissionregistrationV1alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAdmissionregistrationV1alpha1ExternalAdmissionHookConfigurationList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchExternalAdmissionHookConfigurationList

# listNamespacedDeployment
listNamespacedDeployment(_api::AppsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta1NamespacedDeployment(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listNamespacedDeployment(_api::AppsV1beta2Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta2NamespacedDeployment(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listNamespacedDeployment(_api::ExtensionsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listExtensionsV1beta1NamespacedDeployment(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedDeployment

# patchNamespacedCronJob
patchNamespacedCronJob(_api::BatchV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchBatchV1beta1NamespacedCronJob(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
patchNamespacedCronJob(_api::BatchV2alpha1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchBatchV2alpha1NamespacedCronJob(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedCronJob

# createNamespacedRoleBinding
createNamespacedRoleBinding(_api::RbacAuthorizationV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createRbacAuthorizationV1NamespacedRoleBinding(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
createNamespacedRoleBinding(_api::RbacAuthorizationV1alpha1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createRbacAuthorizationV1alpha1NamespacedRoleBinding(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
createNamespacedRoleBinding(_api::RbacAuthorizationV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createRbacAuthorizationV1beta1NamespacedRoleBinding(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedRoleBinding

# watchNamespacedSecretList
watchNamespacedSecretList(_api::CoreV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedSecretList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedSecretList

# patchExternalAdmissionHookConfiguration
patchExternalAdmissionHookConfiguration(_api::AdmissionregistrationV1alpha1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchAdmissionregistrationV1alpha1ExternalAdmissionHookConfiguration(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchExternalAdmissionHookConfiguration

# listExternalAdmissionHookConfiguration
listExternalAdmissionHookConfiguration(_api::AdmissionregistrationV1alpha1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAdmissionregistrationV1alpha1ExternalAdmissionHookConfiguration(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listExternalAdmissionHookConfiguration

# listNamespacedEvent
listNamespacedEvent(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1NamespacedEvent(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedEvent

# deleteCollectionNamespacedEvent
deleteCollectionNamespacedEvent(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionNamespacedEvent(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedEvent

# replaceNode
replaceNode(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1Node(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceNode

# getAPIResources
getAPIResources(_api::AdmissionregistrationV1alpha1Api; _mediaType=nothing) = getAdmissionregistrationV1alpha1APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::ApiextensionsV1beta1Api; _mediaType=nothing) = getApiextensionsV1beta1APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::ApiregistrationV1beta1Api; _mediaType=nothing) = getApiregistrationV1beta1APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::AppsV1beta1Api; _mediaType=nothing) = getAppsV1beta1APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::AppsV1beta2Api; _mediaType=nothing) = getAppsV1beta2APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::AuthenticationV1Api; _mediaType=nothing) = getAuthenticationV1APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::AuthenticationV1beta1Api; _mediaType=nothing) = getAuthenticationV1beta1APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::AuthorizationV1Api; _mediaType=nothing) = getAuthorizationV1APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::AuthorizationV1beta1Api; _mediaType=nothing) = getAuthorizationV1beta1APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::AutoscalingV1Api; _mediaType=nothing) = getAutoscalingV1APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::AutoscalingV2beta1Api; _mediaType=nothing) = getAutoscalingV2beta1APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::BatchV1Api; _mediaType=nothing) = getBatchV1APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::BatchV1beta1Api; _mediaType=nothing) = getBatchV1beta1APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::BatchV2alpha1Api; _mediaType=nothing) = getBatchV2alpha1APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::CertificatesV1beta1Api; _mediaType=nothing) = getCertificatesV1beta1APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::CoreV1Api; _mediaType=nothing) = getCoreV1APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::ExtensionsV1beta1Api; _mediaType=nothing) = getExtensionsV1beta1APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::NetworkingV1Api; _mediaType=nothing) = getNetworkingV1APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::PolicyV1beta1Api; _mediaType=nothing) = getPolicyV1beta1APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::RbacAuthorizationV1Api; _mediaType=nothing) = getRbacAuthorizationV1APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::RbacAuthorizationV1alpha1Api; _mediaType=nothing) = getRbacAuthorizationV1alpha1APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::RbacAuthorizationV1beta1Api; _mediaType=nothing) = getRbacAuthorizationV1beta1APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::SchedulingV1alpha1Api; _mediaType=nothing) = getSchedulingV1alpha1APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::SettingsV1alpha1Api; _mediaType=nothing) = getSettingsV1alpha1APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::StorageV1Api; _mediaType=nothing) = getStorageV1APIResources(_api; _mediaType=_mediaType)
getAPIResources(_api::StorageV1beta1Api; _mediaType=nothing) = getStorageV1beta1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

# listNamespacedPod
listNamespacedPod(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1NamespacedPod(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedPod

# watchNamespacedControllerRevisionList
watchNamespacedControllerRevisionList(_api::AppsV1beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta1NamespacedControllerRevisionList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedControllerRevisionList(_api::AppsV1beta2Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2NamespacedControllerRevisionList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedControllerRevisionList

# connectOptionsNodeProxyWithPath
connectOptionsNodeProxyWithPath(_api::CoreV1Api, name::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1OptionsNodeProxyWithPath(_api, name, path; path2=path2, _mediaType=_mediaType)
export connectOptionsNodeProxyWithPath

# watchPodTemplateListForAllNamespaces
watchPodTemplateListForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1PodTemplateListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchPodTemplateListForAllNamespaces

# readNamespacedRoleBinding
readNamespacedRoleBinding(_api::RbacAuthorizationV1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readRbacAuthorizationV1NamespacedRoleBinding(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
readNamespacedRoleBinding(_api::RbacAuthorizationV1alpha1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readRbacAuthorizationV1alpha1NamespacedRoleBinding(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
readNamespacedRoleBinding(_api::RbacAuthorizationV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readRbacAuthorizationV1beta1NamespacedRoleBinding(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedRoleBinding

# replaceNamespaceStatus
replaceNamespaceStatus(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespaceStatus(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespaceStatus

# createNamespacedNetworkPolicy
createNamespacedNetworkPolicy(_api::ExtensionsV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createExtensionsV1beta1NamespacedNetworkPolicy(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
createNamespacedNetworkPolicy(_api::NetworkingV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createNetworkingV1NamespacedNetworkPolicy(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedNetworkPolicy

# listNamespacedSecret
listNamespacedSecret(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1NamespacedSecret(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedSecret

# listPodTemplateForAllNamespaces
listPodTemplateForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1PodTemplateForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listPodTemplateForAllNamespaces

# replaceNamespacedIngressStatus
replaceNamespacedIngressStatus(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1NamespacedIngressStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedIngressStatus

# listInitializerConfiguration
listInitializerConfiguration(_api::AdmissionregistrationV1alpha1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAdmissionregistrationV1alpha1InitializerConfiguration(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listInitializerConfiguration

# connectOptionsNamespacedPodProxy
connectOptionsNamespacedPodProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1OptionsNamespacedPodProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectOptionsNamespacedPodProxy

# replaceNamespacedPodTemplate
replaceNamespacedPodTemplate(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedPodTemplate(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedPodTemplate

# watchPodSecurityPolicy
watchPodSecurityPolicy(_api::ExtensionsV1beta1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1PodSecurityPolicy(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchPodSecurityPolicy

# createPodSecurityPolicy
createPodSecurityPolicy(_api::ExtensionsV1beta1Api, body; pretty=nothing, _mediaType=nothing) = createExtensionsV1beta1PodSecurityPolicy(_api, body; pretty=pretty, _mediaType=_mediaType)
export createPodSecurityPolicy

# createCustomResourceDefinition
createCustomResourceDefinition(_api::ApiextensionsV1beta1Api, body; pretty=nothing, _mediaType=nothing) = createApiextensionsV1beta1CustomResourceDefinition(_api, body; pretty=pretty, _mediaType=_mediaType)
export createCustomResourceDefinition

# connectPatchNamespacedServiceProxyWithPath
connectPatchNamespacedServiceProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1PatchNamespacedServiceProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectPatchNamespacedServiceProxyWithPath

# createPriorityClass
createPriorityClass(_api::SchedulingV1alpha1Api, body; pretty=nothing, _mediaType=nothing) = createSchedulingV1alpha1PriorityClass(_api, body; pretty=pretty, _mediaType=_mediaType)
export createPriorityClass

# watchNamespacedServiceAccount
watchNamespacedServiceAccount(_api::CoreV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedServiceAccount(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedServiceAccount

# patchNamespacedReplicaSetStatus
patchNamespacedReplicaSetStatus(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta2NamespacedReplicaSetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
patchNamespacedReplicaSetStatus(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1NamespacedReplicaSetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedReplicaSetStatus

# replaceNamespacedPersistentVolumeClaimStatus
replaceNamespacedPersistentVolumeClaimStatus(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedPersistentVolumeClaimStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedPersistentVolumeClaimStatus

# readExternalAdmissionHookConfiguration
readExternalAdmissionHookConfiguration(_api::AdmissionregistrationV1alpha1Api, name::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readAdmissionregistrationV1alpha1ExternalAdmissionHookConfiguration(_api, name; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readExternalAdmissionHookConfiguration

# connectPostNodeProxy
connectPostNodeProxy(_api::CoreV1Api, name::String; path=nothing, _mediaType=nothing) = connectCoreV1PostNodeProxy(_api, name; path=path, _mediaType=_mediaType)
export connectPostNodeProxy

# readNamespacedIngressStatus
readNamespacedIngressStatus(_api::ExtensionsV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readExtensionsV1beta1NamespacedIngressStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedIngressStatus

# replacePodSecurityPolicy
replacePodSecurityPolicy(_api::ExtensionsV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1PodSecurityPolicy(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replacePodSecurityPolicy

# replaceNamespacedDeployment
replaceNamespacedDeployment(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta1NamespacedDeployment(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
replaceNamespacedDeployment(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta2NamespacedDeployment(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
replaceNamespacedDeployment(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1NamespacedDeployment(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedDeployment

# watchNamespacedDaemonSet
watchNamespacedDaemonSet(_api::AppsV1beta2Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2NamespacedDaemonSet(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedDaemonSet(_api::ExtensionsV1beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1NamespacedDaemonSet(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedDaemonSet

# patchNamespacedReplicaSet
patchNamespacedReplicaSet(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta2NamespacedReplicaSet(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
patchNamespacedReplicaSet(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1NamespacedReplicaSet(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedReplicaSet

# readComponentStatus
readComponentStatus(_api::CoreV1Api, name::String; pretty=nothing, _mediaType=nothing) = readCoreV1ComponentStatus(_api, name; pretty=pretty, _mediaType=_mediaType)
export readComponentStatus

# replaceNamespacedConfigMap
replaceNamespacedConfigMap(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedConfigMap(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedConfigMap

# proxyGETNamespacedServiceWithPath
proxyGETNamespacedServiceWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1GETNamespacedServiceWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyGETNamespacedServiceWithPath

# watchPersistentVolumeList
watchPersistentVolumeList(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1PersistentVolumeList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchPersistentVolumeList

# readNamespacedResourceQuota
readNamespacedResourceQuota(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1NamespacedResourceQuota(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedResourceQuota

# watchNamespacedPodTemplateList
watchNamespacedPodTemplateList(_api::CoreV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedPodTemplateList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedPodTemplateList

# readNamespacedPodTemplate
readNamespacedPodTemplate(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1NamespacedPodTemplate(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedPodTemplate

# replacePersistentVolumeStatus
replacePersistentVolumeStatus(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1PersistentVolumeStatus(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replacePersistentVolumeStatus

# patchCertificateSigningRequest
patchCertificateSigningRequest(_api::CertificatesV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchCertificatesV1beta1CertificateSigningRequest(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchCertificateSigningRequest

# replaceStorageClass
replaceStorageClass(_api::StorageV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceStorageV1StorageClass(_api, name, body; pretty=pretty, _mediaType=_mediaType)
replaceStorageClass(_api::StorageV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceStorageV1beta1StorageClass(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceStorageClass

# listComponentStatus
listComponentStatus(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1ComponentStatus(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listComponentStatus

# replaceExternalAdmissionHookConfiguration
replaceExternalAdmissionHookConfiguration(_api::AdmissionregistrationV1alpha1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceAdmissionregistrationV1alpha1ExternalAdmissionHookConfiguration(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceExternalAdmissionHookConfiguration

# connectOptionsNamespacedServiceProxy
connectOptionsNamespacedServiceProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1OptionsNamespacedServiceProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectOptionsNamespacedServiceProxy

# deleteNamespacedEndpoints
deleteNamespacedEndpoints(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1NamespacedEndpoints(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedEndpoints

# listNamespacedJob
listNamespacedJob(_api::BatchV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listBatchV1NamespacedJob(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedJob

# createNamespacedService
createNamespacedService(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedService(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedService

# listHorizontalPodAutoscalerForAllNamespaces
listHorizontalPodAutoscalerForAllNamespaces(_api::AutoscalingV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAutoscalingV1HorizontalPodAutoscalerForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listHorizontalPodAutoscalerForAllNamespaces(_api::AutoscalingV2beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAutoscalingV2beta1HorizontalPodAutoscalerForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listHorizontalPodAutoscalerForAllNamespaces

# proxyGETNodeWithPath
proxyGETNodeWithPath(_api::CoreV1Api, name::String, path::String; _mediaType=nothing) = proxyCoreV1GETNodeWithPath(_api, name, path; _mediaType=_mediaType)
export proxyGETNodeWithPath

# readNamespacedService
readNamespacedService(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1NamespacedService(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedService

# listNamespace
listNamespace(_api::CoreV1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1Namespace(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespace

# deleteCollectionNamespacedPod
deleteCollectionNamespacedPod(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionNamespacedPod(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedPod

# createNamespacedHorizontalPodAutoscaler
createNamespacedHorizontalPodAutoscaler(_api::AutoscalingV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAutoscalingV1NamespacedHorizontalPodAutoscaler(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
createNamespacedHorizontalPodAutoscaler(_api::AutoscalingV2beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAutoscalingV2beta1NamespacedHorizontalPodAutoscaler(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedHorizontalPodAutoscaler

# proxyHEADNamespacedService
proxyHEADNamespacedService(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1HEADNamespacedService(_api, name, namespace; _mediaType=_mediaType)
export proxyHEADNamespacedService

# replaceNamespacedPod
replaceNamespacedPod(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedPod(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedPod

# watchPersistentVolumeClaimListForAllNamespaces
watchPersistentVolumeClaimListForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1PersistentVolumeClaimListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchPersistentVolumeClaimListForAllNamespaces

# watchNamespacedControllerRevision
watchNamespacedControllerRevision(_api::AppsV1beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta1NamespacedControllerRevision(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedControllerRevision(_api::AppsV1beta2Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2NamespacedControllerRevision(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedControllerRevision

# readNamespacedPodPreset
readNamespacedPodPreset(_api::SettingsV1alpha1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readSettingsV1alpha1NamespacedPodPreset(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedPodPreset

# listDaemonSetForAllNamespaces
listDaemonSetForAllNamespaces(_api::AppsV1beta2Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta2DaemonSetForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listDaemonSetForAllNamespaces(_api::ExtensionsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listExtensionsV1beta1DaemonSetForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listDaemonSetForAllNamespaces

# listControllerRevisionForAllNamespaces
listControllerRevisionForAllNamespaces(_api::AppsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta1ControllerRevisionForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listControllerRevisionForAllNamespaces(_api::AppsV1beta2Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta2ControllerRevisionForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listControllerRevisionForAllNamespaces

# createSubjectAccessReview
createSubjectAccessReview(_api::AuthorizationV1Api, body; pretty=nothing, _mediaType=nothing) = createAuthorizationV1SubjectAccessReview(_api, body; pretty=pretty, _mediaType=_mediaType)
createSubjectAccessReview(_api::AuthorizationV1beta1Api, body; pretty=nothing, _mediaType=nothing) = createAuthorizationV1beta1SubjectAccessReview(_api, body; pretty=pretty, _mediaType=_mediaType)
export createSubjectAccessReview

# patchNamespacedHorizontalPodAutoscalerStatus
patchNamespacedHorizontalPodAutoscalerStatus(_api::AutoscalingV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAutoscalingV1NamespacedHorizontalPodAutoscalerStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
patchNamespacedHorizontalPodAutoscalerStatus(_api::AutoscalingV2beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAutoscalingV2beta1NamespacedHorizontalPodAutoscalerStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedHorizontalPodAutoscalerStatus

# replaceNamespacedReplicationController
replaceNamespacedReplicationController(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedReplicationController(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedReplicationController

# connectPutNamespacedPodProxy
connectPutNamespacedPodProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1PutNamespacedPodProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectPutNamespacedPodProxy

# deleteCollectionNamespacedHorizontalPodAutoscaler
deleteCollectionNamespacedHorizontalPodAutoscaler(_api::AutoscalingV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteAutoscalingV1CollectionNamespacedHorizontalPodAutoscaler(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
deleteCollectionNamespacedHorizontalPodAutoscaler(_api::AutoscalingV2beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteAutoscalingV2beta1CollectionNamespacedHorizontalPodAutoscaler(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedHorizontalPodAutoscaler

# watchReplicaSetListForAllNamespaces
watchReplicaSetListForAllNamespaces(_api::AppsV1beta2Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2ReplicaSetListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchReplicaSetListForAllNamespaces(_api::ExtensionsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1ReplicaSetListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchReplicaSetListForAllNamespaces

# watchConfigMapListForAllNamespaces
watchConfigMapListForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1ConfigMapListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchConfigMapListForAllNamespaces

# proxyPUTNamespacedServiceWithPath
proxyPUTNamespacedServiceWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1PUTNamespacedServiceWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyPUTNamespacedServiceWithPath

# replaceNamespacedPodStatus
replaceNamespacedPodStatus(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedPodStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedPodStatus

# listPersistentVolume
listPersistentVolume(_api::CoreV1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1PersistentVolume(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listPersistentVolume

# patchNamespacedResourceQuotaStatus
patchNamespacedResourceQuotaStatus(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedResourceQuotaStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedResourceQuotaStatus

# watchNamespacedDeployment
watchNamespacedDeployment(_api::AppsV1beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta1NamespacedDeployment(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedDeployment(_api::AppsV1beta2Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2NamespacedDeployment(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedDeployment(_api::ExtensionsV1beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1NamespacedDeployment(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedDeployment

# patchPersistentVolume
patchPersistentVolume(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1PersistentVolume(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchPersistentVolume

# createNamespacedPodBinding
createNamespacedPodBinding(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedPodBinding(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedPodBinding

# readNamespacedPodLog
readNamespacedPodLog(_api::CoreV1Api, name::String, namespace::String; container=nothing, follow=nothing, limitBytes=nothing, pretty=nothing, previous=nothing, sinceSeconds=nothing, tailLines=nothing, timestamps=nothing, _mediaType=nothing) = readCoreV1NamespacedPodLog(_api, name, namespace; container=container, follow=follow, limitBytes=limitBytes, pretty=pretty, previous=previous, sinceSeconds=sinceSeconds, tailLines=tailLines, timestamps=timestamps, _mediaType=_mediaType)
export readNamespacedPodLog

# createNamespacedPodTemplate
createNamespacedPodTemplate(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedPodTemplate(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedPodTemplate

# deleteCollectionNamespacedJob
deleteCollectionNamespacedJob(_api::BatchV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteBatchV1CollectionNamespacedJob(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedJob

# readNamespacedIngress
readNamespacedIngress(_api::ExtensionsV1beta1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readExtensionsV1beta1NamespacedIngress(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedIngress

# readNamespacedRole
readNamespacedRole(_api::RbacAuthorizationV1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readRbacAuthorizationV1NamespacedRole(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
readNamespacedRole(_api::RbacAuthorizationV1alpha1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readRbacAuthorizationV1alpha1NamespacedRole(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
readNamespacedRole(_api::RbacAuthorizationV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readRbacAuthorizationV1beta1NamespacedRole(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedRole

# watchClusterRoleList
watchClusterRoleList(_api::RbacAuthorizationV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1ClusterRoleList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchClusterRoleList(_api::RbacAuthorizationV1alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1alpha1ClusterRoleList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchClusterRoleList(_api::RbacAuthorizationV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1beta1ClusterRoleList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchClusterRoleList

# replaceNamespacedPodPreset
replaceNamespacedPodPreset(_api::SettingsV1alpha1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceSettingsV1alpha1NamespacedPodPreset(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedPodPreset

# deleteNamespacedReplicaSet
deleteNamespacedReplicaSet(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteAppsV1beta2NamespacedReplicaSet(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
deleteNamespacedReplicaSet(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteExtensionsV1beta1NamespacedReplicaSet(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedReplicaSet

# deleteNamespacedEvent
deleteNamespacedEvent(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1NamespacedEvent(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedEvent

# readNamespacedReplicationController
readNamespacedReplicationController(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1NamespacedReplicationController(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedReplicationController

# readNamespacedStatefulSet
readNamespacedStatefulSet(_api::AppsV1beta1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readAppsV1beta1NamespacedStatefulSet(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
readNamespacedStatefulSet(_api::AppsV1beta2Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readAppsV1beta2NamespacedStatefulSet(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedStatefulSet

# replaceAPIService
replaceAPIService(_api::ApiregistrationV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceApiregistrationV1beta1APIService(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceAPIService

# proxyPUTNamespacedPodWithPath
proxyPUTNamespacedPodWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1PUTNamespacedPodWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyPUTNamespacedPodWithPath

# deleteNamespacedIngress
deleteNamespacedIngress(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteExtensionsV1beta1NamespacedIngress(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedIngress

# replaceNamespacedServiceStatus
replaceNamespacedServiceStatus(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedServiceStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedServiceStatus

# replaceNamespacedReplicaSet
replaceNamespacedReplicaSet(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta2NamespacedReplicaSet(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
replaceNamespacedReplicaSet(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1NamespacedReplicaSet(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedReplicaSet

# readNamespaceStatus
readNamespaceStatus(_api::CoreV1Api, name::String; pretty=nothing, _mediaType=nothing) = readCoreV1NamespaceStatus(_api, name; pretty=pretty, _mediaType=_mediaType)
export readNamespaceStatus

# deleteCollectionNamespacedControllerRevision
deleteCollectionNamespacedControllerRevision(_api::AppsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteAppsV1beta1CollectionNamespacedControllerRevision(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
deleteCollectionNamespacedControllerRevision(_api::AppsV1beta2Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteAppsV1beta2CollectionNamespacedControllerRevision(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedControllerRevision

# listNamespacedReplicaSet
listNamespacedReplicaSet(_api::AppsV1beta2Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta2NamespacedReplicaSet(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listNamespacedReplicaSet(_api::ExtensionsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listExtensionsV1beta1NamespacedReplicaSet(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedReplicaSet

# proxyPUTNodeWithPath
proxyPUTNodeWithPath(_api::CoreV1Api, name::String, path::String; _mediaType=nothing) = proxyCoreV1PUTNodeWithPath(_api, name, path; _mediaType=_mediaType)
export proxyPUTNodeWithPath

# watchInitializerConfigurationList
watchInitializerConfigurationList(_api::AdmissionregistrationV1alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAdmissionregistrationV1alpha1InitializerConfigurationList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchInitializerConfigurationList

# watchResourceQuotaListForAllNamespaces
watchResourceQuotaListForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1ResourceQuotaListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchResourceQuotaListForAllNamespaces

# watchNamespacedIngress
watchNamespacedIngress(_api::ExtensionsV1beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1NamespacedIngress(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedIngress

# deleteCollectionAPIService
deleteCollectionAPIService(_api::ApiregistrationV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteApiregistrationV1beta1CollectionAPIService(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionAPIService

# patchNamespacedHorizontalPodAutoscaler
patchNamespacedHorizontalPodAutoscaler(_api::AutoscalingV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAutoscalingV1NamespacedHorizontalPodAutoscaler(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
patchNamespacedHorizontalPodAutoscaler(_api::AutoscalingV2beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAutoscalingV2beta1NamespacedHorizontalPodAutoscaler(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedHorizontalPodAutoscaler

# watchNamespacedServiceAccountList
watchNamespacedServiceAccountList(_api::CoreV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedServiceAccountList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedServiceAccountList

# watchCustomResourceDefinition
watchCustomResourceDefinition(_api::ApiextensionsV1beta1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchApiextensionsV1beta1CustomResourceDefinition(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchCustomResourceDefinition

# patchInitializerConfiguration
patchInitializerConfiguration(_api::AdmissionregistrationV1alpha1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchAdmissionregistrationV1alpha1InitializerConfiguration(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchInitializerConfiguration

# listCronJobForAllNamespaces
listCronJobForAllNamespaces(_api::BatchV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listBatchV1beta1CronJobForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listCronJobForAllNamespaces(_api::BatchV2alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listBatchV2alpha1CronJobForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listCronJobForAllNamespaces

# createCertificateSigningRequest
createCertificateSigningRequest(_api::CertificatesV1beta1Api, body; pretty=nothing, _mediaType=nothing) = createCertificatesV1beta1CertificateSigningRequest(_api, body; pretty=pretty, _mediaType=_mediaType)
export createCertificateSigningRequest

# deleteCollectionNode
deleteCollectionNode(_api::CoreV1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionNode(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNode

# listConfigMapForAllNamespaces
listConfigMapForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1ConfigMapForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listConfigMapForAllNamespaces

# replaceNamespacedPodDisruptionBudgetStatus
replaceNamespacedPodDisruptionBudgetStatus(_api::PolicyV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replacePolicyV1beta1NamespacedPodDisruptionBudgetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedPodDisruptionBudgetStatus

# watchNamespacedRole
watchNamespacedRole(_api::RbacAuthorizationV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1NamespacedRole(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedRole(_api::RbacAuthorizationV1alpha1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1alpha1NamespacedRole(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedRole(_api::RbacAuthorizationV1beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1beta1NamespacedRole(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedRole

# proxyDELETENamespacedService
proxyDELETENamespacedService(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1DELETENamespacedService(_api, name, namespace; _mediaType=_mediaType)
export proxyDELETENamespacedService

# readCustomResourceDefinition
readCustomResourceDefinition(_api::ApiextensionsV1beta1Api, name::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readApiextensionsV1beta1CustomResourceDefinition(_api, name; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readCustomResourceDefinition

# replacePersistentVolume
replacePersistentVolume(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1PersistentVolume(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replacePersistentVolume

# deleteClusterRoleBinding
deleteClusterRoleBinding(_api::RbacAuthorizationV1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1ClusterRoleBinding(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
deleteClusterRoleBinding(_api::RbacAuthorizationV1alpha1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1alpha1ClusterRoleBinding(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
deleteClusterRoleBinding(_api::RbacAuthorizationV1beta1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1beta1ClusterRoleBinding(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteClusterRoleBinding

# patchNamespacedJobStatus
patchNamespacedJobStatus(_api::BatchV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchBatchV1NamespacedJobStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedJobStatus

# deleteCollectionNamespacedResourceQuota
deleteCollectionNamespacedResourceQuota(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionNamespacedResourceQuota(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedResourceQuota

# watchNamespacedEventList
watchNamespacedEventList(_api::CoreV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedEventList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedEventList

# replaceNamespacedReplicaSetScale
replaceNamespacedReplicaSetScale(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta2NamespacedReplicaSetScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
replaceNamespacedReplicaSetScale(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1NamespacedReplicaSetScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedReplicaSetScale

# listPodDisruptionBudgetForAllNamespaces
listPodDisruptionBudgetForAllNamespaces(_api::PolicyV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listPolicyV1beta1PodDisruptionBudgetForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listPodDisruptionBudgetForAllNamespaces

# readNamespacedLimitRange
readNamespacedLimitRange(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1NamespacedLimitRange(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedLimitRange

# watchNamespacedLimitRange
watchNamespacedLimitRange(_api::CoreV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedLimitRange(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedLimitRange

# patchNamespace
patchNamespace(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1Namespace(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespace

# deleteCollectionInitializerConfiguration
deleteCollectionInitializerConfiguration(_api::AdmissionregistrationV1alpha1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteAdmissionregistrationV1alpha1CollectionInitializerConfiguration(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionInitializerConfiguration

# createNamespacedControllerRevision
createNamespacedControllerRevision(_api::AppsV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAppsV1beta1NamespacedControllerRevision(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
createNamespacedControllerRevision(_api::AppsV1beta2Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAppsV1beta2NamespacedControllerRevision(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedControllerRevision

# patchNamespaceStatus
patchNamespaceStatus(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespaceStatus(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespaceStatus

# watchEventListForAllNamespaces
watchEventListForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1EventListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchEventListForAllNamespaces

# listNamespacedHorizontalPodAutoscaler
listNamespacedHorizontalPodAutoscaler(_api::AutoscalingV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAutoscalingV1NamespacedHorizontalPodAutoscaler(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listNamespacedHorizontalPodAutoscaler(_api::AutoscalingV2beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAutoscalingV2beta1NamespacedHorizontalPodAutoscaler(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedHorizontalPodAutoscaler

# createNamespacedRole
createNamespacedRole(_api::RbacAuthorizationV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createRbacAuthorizationV1NamespacedRole(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
createNamespacedRole(_api::RbacAuthorizationV1alpha1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createRbacAuthorizationV1alpha1NamespacedRole(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
createNamespacedRole(_api::RbacAuthorizationV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createRbacAuthorizationV1beta1NamespacedRole(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedRole

# readNamespacedReplicationControllerStatus
readNamespacedReplicationControllerStatus(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readCoreV1NamespacedReplicationControllerStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedReplicationControllerStatus

# replaceNamespacedJobStatus
replaceNamespacedJobStatus(_api::BatchV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceBatchV1NamespacedJobStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedJobStatus

# watchNamespacedJobList
watchNamespacedJobList(_api::BatchV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchBatchV1NamespacedJobList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedJobList

# watchIngressListForAllNamespaces
watchIngressListForAllNamespaces(_api::ExtensionsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1IngressListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchIngressListForAllNamespaces

# replaceNamespacedDaemonSetStatus
replaceNamespacedDaemonSetStatus(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta2NamespacedDaemonSetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
replaceNamespacedDaemonSetStatus(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1NamespacedDaemonSetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedDaemonSetStatus

# createSelfSubjectAccessReview
createSelfSubjectAccessReview(_api::AuthorizationV1Api, body; pretty=nothing, _mediaType=nothing) = createAuthorizationV1SelfSubjectAccessReview(_api, body; pretty=pretty, _mediaType=_mediaType)
createSelfSubjectAccessReview(_api::AuthorizationV1beta1Api, body; pretty=nothing, _mediaType=nothing) = createAuthorizationV1beta1SelfSubjectAccessReview(_api, body; pretty=pretty, _mediaType=_mediaType)
export createSelfSubjectAccessReview

# listNamespacedCronJob
listNamespacedCronJob(_api::BatchV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listBatchV1beta1NamespacedCronJob(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listNamespacedCronJob(_api::BatchV2alpha1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listBatchV2alpha1NamespacedCronJob(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedCronJob

# patchNamespacedLimitRange
patchNamespacedLimitRange(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedLimitRange(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedLimitRange

# deleteNamespacedNetworkPolicy
deleteNamespacedNetworkPolicy(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteExtensionsV1beta1NamespacedNetworkPolicy(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
deleteNamespacedNetworkPolicy(_api::NetworkingV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteNetworkingV1NamespacedNetworkPolicy(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedNetworkPolicy

# replaceNamespacedDeploymentScale
replaceNamespacedDeploymentScale(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta1NamespacedDeploymentScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
replaceNamespacedDeploymentScale(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta2NamespacedDeploymentScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
replaceNamespacedDeploymentScale(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1NamespacedDeploymentScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedDeploymentScale

# deleteAPIService
deleteAPIService(_api::ApiregistrationV1beta1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteApiregistrationV1beta1APIService(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteAPIService

# createNamespacedDeploymentRollback
createNamespacedDeploymentRollback(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAppsV1beta1NamespacedDeploymentRollback(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
createNamespacedDeploymentRollback(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = createExtensionsV1beta1NamespacedDeploymentRollback(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedDeploymentRollback

# listNamespacedControllerRevision
listNamespacedControllerRevision(_api::AppsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta1NamespacedControllerRevision(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listNamespacedControllerRevision(_api::AppsV1beta2Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta2NamespacedControllerRevision(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedControllerRevision

# proxyOPTIONSNamespacedService
proxyOPTIONSNamespacedService(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1OPTIONSNamespacedService(_api, name, namespace; _mediaType=_mediaType)
export proxyOPTIONSNamespacedService

# patchNamespacedIngressStatus
patchNamespacedIngressStatus(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1NamespacedIngressStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedIngressStatus

# connectGetNodeProxy
connectGetNodeProxy(_api::CoreV1Api, name::String; path=nothing, _mediaType=nothing) = connectCoreV1GetNodeProxy(_api, name; path=path, _mediaType=_mediaType)
export connectGetNodeProxy

# deleteCollectionNamespacedPodPreset
deleteCollectionNamespacedPodPreset(_api::SettingsV1alpha1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteSettingsV1alpha1CollectionNamespacedPodPreset(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedPodPreset

# patchNamespacedDeploymentScale
patchNamespacedDeploymentScale(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta1NamespacedDeploymentScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
patchNamespacedDeploymentScale(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta2NamespacedDeploymentScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
patchNamespacedDeploymentScale(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1NamespacedDeploymentScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedDeploymentScale

# deleteCollectionNamespacedSecret
deleteCollectionNamespacedSecret(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionNamespacedSecret(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedSecret

# readNamespacedConfigMap
readNamespacedConfigMap(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1NamespacedConfigMap(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedConfigMap

# replaceCertificateSigningRequestStatus
replaceCertificateSigningRequestStatus(_api::CertificatesV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceCertificatesV1beta1CertificateSigningRequestStatus(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceCertificateSigningRequestStatus

# deleteCollectionNamespacedCronJob
deleteCollectionNamespacedCronJob(_api::BatchV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteBatchV1beta1CollectionNamespacedCronJob(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
deleteCollectionNamespacedCronJob(_api::BatchV2alpha1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteBatchV2alpha1CollectionNamespacedCronJob(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedCronJob

# listNamespacedServiceAccount
listNamespacedServiceAccount(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1NamespacedServiceAccount(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedServiceAccount

# proxyPUTNode
proxyPUTNode(_api::CoreV1Api, name::String; _mediaType=nothing) = proxyCoreV1PUTNode(_api, name; _mediaType=_mediaType)
export proxyPUTNode

# createExternalAdmissionHookConfiguration
createExternalAdmissionHookConfiguration(_api::AdmissionregistrationV1alpha1Api, body; pretty=nothing, _mediaType=nothing) = createAdmissionregistrationV1alpha1ExternalAdmissionHookConfiguration(_api, body; pretty=pretty, _mediaType=_mediaType)
export createExternalAdmissionHookConfiguration

# watchNamespaceList
watchNamespaceList(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespaceList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespaceList

# watchPodSecurityPolicyList
watchPodSecurityPolicyList(_api::ExtensionsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1PodSecurityPolicyList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchPodSecurityPolicyList

# listNamespacedDaemonSet
listNamespacedDaemonSet(_api::AppsV1beta2Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta2NamespacedDaemonSet(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listNamespacedDaemonSet(_api::ExtensionsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listExtensionsV1beta1NamespacedDaemonSet(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedDaemonSet

# patchNamespacedReplicaSetScale
patchNamespacedReplicaSetScale(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta2NamespacedReplicaSetScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
patchNamespacedReplicaSetScale(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1NamespacedReplicaSetScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedReplicaSetScale

# createAPIService
createAPIService(_api::ApiregistrationV1beta1Api, body; pretty=nothing, _mediaType=nothing) = createApiregistrationV1beta1APIService(_api, body; pretty=pretty, _mediaType=_mediaType)
export createAPIService

# replaceNamespacedDeploymentStatus
replaceNamespacedDeploymentStatus(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta1NamespacedDeploymentStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
replaceNamespacedDeploymentStatus(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta2NamespacedDeploymentStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
replaceNamespacedDeploymentStatus(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1NamespacedDeploymentStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedDeploymentStatus

# proxyPUTNamespacedService
proxyPUTNamespacedService(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1PUTNamespacedService(_api, name, namespace; _mediaType=_mediaType)
export proxyPUTNamespacedService

# watchPriorityClass
watchPriorityClass(_api::SchedulingV1alpha1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchSchedulingV1alpha1PriorityClass(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchPriorityClass

# patchNamespacedStatefulSet
patchNamespacedStatefulSet(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta1NamespacedStatefulSet(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
patchNamespacedStatefulSet(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta2NamespacedStatefulSet(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedStatefulSet

# readNamespacedHorizontalPodAutoscalerStatus
readNamespacedHorizontalPodAutoscalerStatus(_api::AutoscalingV1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAutoscalingV1NamespacedHorizontalPodAutoscalerStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
readNamespacedHorizontalPodAutoscalerStatus(_api::AutoscalingV2beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAutoscalingV2beta1NamespacedHorizontalPodAutoscalerStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedHorizontalPodAutoscalerStatus

# watchNamespacedRoleBindingList
watchNamespacedRoleBindingList(_api::RbacAuthorizationV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1NamespacedRoleBindingList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedRoleBindingList(_api::RbacAuthorizationV1alpha1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1alpha1NamespacedRoleBindingList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedRoleBindingList(_api::RbacAuthorizationV1beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1beta1NamespacedRoleBindingList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedRoleBindingList

# watchPodPresetListForAllNamespaces
watchPodPresetListForAllNamespaces(_api::SettingsV1alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchSettingsV1alpha1PodPresetListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchPodPresetListForAllNamespaces

# listPriorityClass
listPriorityClass(_api::SchedulingV1alpha1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listSchedulingV1alpha1PriorityClass(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listPriorityClass

# proxyOPTIONSNodeWithPath
proxyOPTIONSNodeWithPath(_api::CoreV1Api, name::String, path::String; _mediaType=nothing) = proxyCoreV1OPTIONSNodeWithPath(_api, name, path; _mediaType=_mediaType)
export proxyOPTIONSNodeWithPath

# replaceCertificateSigningRequest
replaceCertificateSigningRequest(_api::CertificatesV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceCertificatesV1beta1CertificateSigningRequest(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceCertificateSigningRequest

# watchNamespacedPodDisruptionBudgetList
watchNamespacedPodDisruptionBudgetList(_api::PolicyV1beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchPolicyV1beta1NamespacedPodDisruptionBudgetList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedPodDisruptionBudgetList

# readNamespacedServiceAccount
readNamespacedServiceAccount(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1NamespacedServiceAccount(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedServiceAccount

# listPodSecurityPolicy
listPodSecurityPolicy(_api::ExtensionsV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listExtensionsV1beta1PodSecurityPolicy(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listPodSecurityPolicy

# proxyOPTIONSNode
proxyOPTIONSNode(_api::CoreV1Api, name::String; _mediaType=nothing) = proxyCoreV1OPTIONSNode(_api, name; _mediaType=_mediaType)
export proxyOPTIONSNode

# createNamespacedLocalSubjectAccessReview
createNamespacedLocalSubjectAccessReview(_api::AuthorizationV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAuthorizationV1NamespacedLocalSubjectAccessReview(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
createNamespacedLocalSubjectAccessReview(_api::AuthorizationV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAuthorizationV1beta1NamespacedLocalSubjectAccessReview(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedLocalSubjectAccessReview

# proxyOPTIONSNamespacedPod
proxyOPTIONSNamespacedPod(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1OPTIONSNamespacedPod(_api, name, namespace; _mediaType=_mediaType)
export proxyOPTIONSNamespacedPod

# readNodeStatus
readNodeStatus(_api::CoreV1Api, name::String; pretty=nothing, _mediaType=nothing) = readCoreV1NodeStatus(_api, name; pretty=pretty, _mediaType=_mediaType)
export readNodeStatus

# replaceCustomResourceDefinition
replaceCustomResourceDefinition(_api::ApiextensionsV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceApiextensionsV1beta1CustomResourceDefinition(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceCustomResourceDefinition

# connectGetNamespacedPodProxy
connectGetNamespacedPodProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1GetNamespacedPodProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectGetNamespacedPodProxy

# proxyPUTNamespacedPod
proxyPUTNamespacedPod(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1PUTNamespacedPod(_api, name, namespace; _mediaType=_mediaType)
export proxyPUTNamespacedPod

# watchNamespacedConfigMap
watchNamespacedConfigMap(_api::CoreV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedConfigMap(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedConfigMap

# listNamespacedRoleBinding
listNamespacedRoleBinding(_api::RbacAuthorizationV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1NamespacedRoleBinding(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listNamespacedRoleBinding(_api::RbacAuthorizationV1alpha1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1alpha1NamespacedRoleBinding(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listNamespacedRoleBinding(_api::RbacAuthorizationV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1beta1NamespacedRoleBinding(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedRoleBinding

# patchNamespacedStatefulSetScale
patchNamespacedStatefulSetScale(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta1NamespacedStatefulSetScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
patchNamespacedStatefulSetScale(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta2NamespacedStatefulSetScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedStatefulSetScale

# readNamespacedSecret
readNamespacedSecret(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1NamespacedSecret(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedSecret

# connectPatchNodeProxy
connectPatchNodeProxy(_api::CoreV1Api, name::String; path=nothing, _mediaType=nothing) = connectCoreV1PatchNodeProxy(_api, name; path=path, _mediaType=_mediaType)
export connectPatchNodeProxy

# proxyPATCHNamespacedService
proxyPATCHNamespacedService(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1PATCHNamespacedService(_api, name, namespace; _mediaType=_mediaType)
export proxyPATCHNamespacedService

# listRoleForAllNamespaces
listRoleForAllNamespaces(_api::RbacAuthorizationV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1RoleForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listRoleForAllNamespaces(_api::RbacAuthorizationV1alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1alpha1RoleForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listRoleForAllNamespaces(_api::RbacAuthorizationV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1beta1RoleForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listRoleForAllNamespaces

# readPriorityClass
readPriorityClass(_api::SchedulingV1alpha1Api, name::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readSchedulingV1alpha1PriorityClass(_api, name; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readPriorityClass

# patchNamespacedPodStatus
patchNamespacedPodStatus(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedPodStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedPodStatus

# createTokenReview
createTokenReview(_api::AuthenticationV1Api, body; pretty=nothing, _mediaType=nothing) = createAuthenticationV1TokenReview(_api, body; pretty=pretty, _mediaType=_mediaType)
createTokenReview(_api::AuthenticationV1beta1Api, body; pretty=nothing, _mediaType=nothing) = createAuthenticationV1beta1TokenReview(_api, body; pretty=pretty, _mediaType=_mediaType)
export createTokenReview

# watchNamespacedCronJobList
watchNamespacedCronJobList(_api::BatchV1beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchBatchV1beta1NamespacedCronJobList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedCronJobList(_api::BatchV2alpha1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchBatchV2alpha1NamespacedCronJobList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedCronJobList

# proxyHEADNodeWithPath
proxyHEADNodeWithPath(_api::CoreV1Api, name::String, path::String; _mediaType=nothing) = proxyCoreV1HEADNodeWithPath(_api, name, path; _mediaType=_mediaType)
export proxyHEADNodeWithPath

# watchNamespacedEndpoints
watchNamespacedEndpoints(_api::CoreV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedEndpoints(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedEndpoints

# watchNamespacedHorizontalPodAutoscalerList
watchNamespacedHorizontalPodAutoscalerList(_api::AutoscalingV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAutoscalingV1NamespacedHorizontalPodAutoscalerList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedHorizontalPodAutoscalerList(_api::AutoscalingV2beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAutoscalingV2beta1NamespacedHorizontalPodAutoscalerList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedHorizontalPodAutoscalerList

# createNamespacedLimitRange
createNamespacedLimitRange(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedLimitRange(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedLimitRange

# patchNamespacedReplicationControllerStatus
patchNamespacedReplicationControllerStatus(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedReplicationControllerStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedReplicationControllerStatus

# watchCertificateSigningRequest
watchCertificateSigningRequest(_api::CertificatesV1beta1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCertificatesV1beta1CertificateSigningRequest(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchCertificateSigningRequest

# watchNamespacedPod
watchNamespacedPod(_api::CoreV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedPod(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedPod

# createNamespacedStatefulSet
createNamespacedStatefulSet(_api::AppsV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAppsV1beta1NamespacedStatefulSet(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
createNamespacedStatefulSet(_api::AppsV1beta2Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAppsV1beta2NamespacedStatefulSet(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedStatefulSet

# connectHeadNamespacedServiceProxy
connectHeadNamespacedServiceProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1HeadNamespacedServiceProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectHeadNamespacedServiceProxy

# listNamespacedService
listNamespacedService(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1NamespacedService(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedService

# watchReplicationControllerListForAllNamespaces
watchReplicationControllerListForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1ReplicationControllerListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchReplicationControllerListForAllNamespaces

# connectGetNamespacedPodExec
connectGetNamespacedPodExec(_api::CoreV1Api, name::String, namespace::String; command=nothing, container=nothing, stderr=nothing, stdin=nothing, stdout=nothing, tty=nothing, _mediaType=nothing) = connectCoreV1GetNamespacedPodExec(_api, name, namespace; command=command, container=container, stderr=stderr, stdin=stdin, stdout=stdout, tty=tty, _mediaType=_mediaType)
export connectGetNamespacedPodExec

# readClusterRoleBinding
readClusterRoleBinding(_api::RbacAuthorizationV1Api, name::String; pretty=nothing, _mediaType=nothing) = readRbacAuthorizationV1ClusterRoleBinding(_api, name; pretty=pretty, _mediaType=_mediaType)
readClusterRoleBinding(_api::RbacAuthorizationV1alpha1Api, name::String; pretty=nothing, _mediaType=nothing) = readRbacAuthorizationV1alpha1ClusterRoleBinding(_api, name; pretty=pretty, _mediaType=_mediaType)
readClusterRoleBinding(_api::RbacAuthorizationV1beta1Api, name::String; pretty=nothing, _mediaType=nothing) = readRbacAuthorizationV1beta1ClusterRoleBinding(_api, name; pretty=pretty, _mediaType=_mediaType)
export readClusterRoleBinding

# watchPodListForAllNamespaces
watchPodListForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1PodListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchPodListForAllNamespaces

# watchClusterRole
watchClusterRole(_api::RbacAuthorizationV1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1ClusterRole(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchClusterRole(_api::RbacAuthorizationV1alpha1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1alpha1ClusterRole(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchClusterRole(_api::RbacAuthorizationV1beta1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1beta1ClusterRole(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchClusterRole

# listReplicationControllerForAllNamespaces
listReplicationControllerForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1ReplicationControllerForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listReplicationControllerForAllNamespaces

# replaceNamespacedStatefulSet
replaceNamespacedStatefulSet(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta1NamespacedStatefulSet(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
replaceNamespacedStatefulSet(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta2NamespacedStatefulSet(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedStatefulSet

# proxyHEADNode
proxyHEADNode(_api::CoreV1Api, name::String; _mediaType=nothing) = proxyCoreV1HEADNode(_api, name; _mediaType=_mediaType)
export proxyHEADNode

# watchNamespacedPodDisruptionBudget
watchNamespacedPodDisruptionBudget(_api::PolicyV1beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchPolicyV1beta1NamespacedPodDisruptionBudget(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedPodDisruptionBudget

# replaceCustomResourceDefinitionStatus
replaceCustomResourceDefinitionStatus(_api::ApiextensionsV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceApiextensionsV1beta1CustomResourceDefinitionStatus(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceCustomResourceDefinitionStatus

# readNamespacedReplicaSetScale
readNamespacedReplicaSetScale(_api::AppsV1beta2Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAppsV1beta2NamespacedReplicaSetScale(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
readNamespacedReplicaSetScale(_api::ExtensionsV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readExtensionsV1beta1NamespacedReplicaSetScale(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedReplicaSetScale

# getAPIVersions
getAPIVersions(_api::CoreApi; _mediaType=nothing) = getCoreAPIVersions(_api; _mediaType=_mediaType)
export getAPIVersions

# replaceNamespacedReplicaSetStatus
replaceNamespacedReplicaSetStatus(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta2NamespacedReplicaSetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
replaceNamespacedReplicaSetStatus(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1NamespacedReplicaSetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedReplicaSetStatus

# deleteCollectionNamespacedReplicationController
deleteCollectionNamespacedReplicationController(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionNamespacedReplicationController(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedReplicationController

# proxyPATCHNamespacedPod
proxyPATCHNamespacedPod(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1PATCHNamespacedPod(_api, name, namespace; _mediaType=_mediaType)
export proxyPATCHNamespacedPod

# readNamespacedServiceStatus
readNamespacedServiceStatus(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readCoreV1NamespacedServiceStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedServiceStatus

# replaceNamespacedRoleBinding
replaceNamespacedRoleBinding(_api::RbacAuthorizationV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceRbacAuthorizationV1NamespacedRoleBinding(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
replaceNamespacedRoleBinding(_api::RbacAuthorizationV1alpha1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceRbacAuthorizationV1alpha1NamespacedRoleBinding(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
replaceNamespacedRoleBinding(_api::RbacAuthorizationV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceRbacAuthorizationV1beta1NamespacedRoleBinding(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedRoleBinding

# listNamespacedLimitRange
listNamespacedLimitRange(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1NamespacedLimitRange(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedLimitRange

# readCertificateSigningRequest
readCertificateSigningRequest(_api::CertificatesV1beta1Api, name::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCertificatesV1beta1CertificateSigningRequest(_api, name; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readCertificateSigningRequest

# deleteCollectionNamespacedEndpoints
deleteCollectionNamespacedEndpoints(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionNamespacedEndpoints(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedEndpoints

# patchNamespacedStatefulSetStatus
patchNamespacedStatefulSetStatus(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta1NamespacedStatefulSetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
patchNamespacedStatefulSetStatus(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta2NamespacedStatefulSetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedStatefulSetStatus

# createNamespacedReplicationController
createNamespacedReplicationController(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedReplicationController(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedReplicationController

# deleteExternalAdmissionHookConfiguration
deleteExternalAdmissionHookConfiguration(_api::AdmissionregistrationV1alpha1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteAdmissionregistrationV1alpha1ExternalAdmissionHookConfiguration(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteExternalAdmissionHookConfiguration

# createNamespacedPod
createNamespacedPod(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedPod(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedPod

# listNamespacedResourceQuota
listNamespacedResourceQuota(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1NamespacedResourceQuota(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedResourceQuota

# watchNamespacedJob
watchNamespacedJob(_api::BatchV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchBatchV1NamespacedJob(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedJob

# readNamespacedEvent
readNamespacedEvent(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1NamespacedEvent(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedEvent

# proxyGETNamespacedPod
proxyGETNamespacedPod(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1GETNamespacedPod(_api, name, namespace; _mediaType=_mediaType)
export proxyGETNamespacedPod

# patchNamespacedServiceStatus
patchNamespacedServiceStatus(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedServiceStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedServiceStatus

# connectPostNamespacedServiceProxyWithPath
connectPostNamespacedServiceProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1PostNamespacedServiceProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectPostNamespacedServiceProxyWithPath

# listClusterRole
listClusterRole(_api::RbacAuthorizationV1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1ClusterRole(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listClusterRole(_api::RbacAuthorizationV1alpha1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1alpha1ClusterRole(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listClusterRole(_api::RbacAuthorizationV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1beta1ClusterRole(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listClusterRole

# listEventForAllNamespaces
listEventForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1EventForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listEventForAllNamespaces

# deleteCollectionCustomResourceDefinition
deleteCollectionCustomResourceDefinition(_api::ApiextensionsV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteApiextensionsV1beta1CollectionCustomResourceDefinition(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionCustomResourceDefinition

# readInitializerConfiguration
readInitializerConfiguration(_api::AdmissionregistrationV1alpha1Api, name::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readAdmissionregistrationV1alpha1InitializerConfiguration(_api, name; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readInitializerConfiguration

# listAPIService
listAPIService(_api::ApiregistrationV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listApiregistrationV1beta1APIService(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listAPIService

# deleteNamespacedPod
deleteNamespacedPod(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1NamespacedPod(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedPod

# watchLimitRangeListForAllNamespaces
watchLimitRangeListForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1LimitRangeListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchLimitRangeListForAllNamespaces

# readNamespacedPodDisruptionBudgetStatus
readNamespacedPodDisruptionBudgetStatus(_api::PolicyV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readPolicyV1beta1NamespacedPodDisruptionBudgetStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedPodDisruptionBudgetStatus

# watchPodDisruptionBudgetListForAllNamespaces
watchPodDisruptionBudgetListForAllNamespaces(_api::PolicyV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchPolicyV1beta1PodDisruptionBudgetListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchPodDisruptionBudgetListForAllNamespaces

# watchJobListForAllNamespaces
watchJobListForAllNamespaces(_api::BatchV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchBatchV1JobListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchJobListForAllNamespaces

# deleteCertificateSigningRequest
deleteCertificateSigningRequest(_api::CertificatesV1beta1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCertificatesV1beta1CertificateSigningRequest(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteCertificateSigningRequest

# proxyPATCHNamespacedServiceWithPath
proxyPATCHNamespacedServiceWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1PATCHNamespacedServiceWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyPATCHNamespacedServiceWithPath

# patchNamespacedJob
patchNamespacedJob(_api::BatchV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchBatchV1NamespacedJob(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedJob

# watchNamespacedLimitRangeList
watchNamespacedLimitRangeList(_api::CoreV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedLimitRangeList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedLimitRangeList

# watchClusterRoleBindingList
watchClusterRoleBindingList(_api::RbacAuthorizationV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1ClusterRoleBindingList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchClusterRoleBindingList(_api::RbacAuthorizationV1alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1alpha1ClusterRoleBindingList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchClusterRoleBindingList(_api::RbacAuthorizationV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1beta1ClusterRoleBindingList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchClusterRoleBindingList

# readNamespacedPodDisruptionBudget
readNamespacedPodDisruptionBudget(_api::PolicyV1beta1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readPolicyV1beta1NamespacedPodDisruptionBudget(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedPodDisruptionBudget

# readStorageClass
readStorageClass(_api::StorageV1Api, name::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readStorageV1StorageClass(_api, name; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
readStorageClass(_api::StorageV1beta1Api, name::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readStorageV1beta1StorageClass(_api, name; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readStorageClass

# readNamespacedCronJob
readNamespacedCronJob(_api::BatchV1beta1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readBatchV1beta1NamespacedCronJob(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
readNamespacedCronJob(_api::BatchV2alpha1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readBatchV2alpha1NamespacedCronJob(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedCronJob

# connectGetNamespacedPodAttach
connectGetNamespacedPodAttach(_api::CoreV1Api, name::String, namespace::String; container=nothing, stderr=nothing, stdin=nothing, stdout=nothing, tty=nothing, _mediaType=nothing) = connectCoreV1GetNamespacedPodAttach(_api, name, namespace; container=container, stderr=stderr, stdin=stdin, stdout=stdout, tty=tty, _mediaType=_mediaType)
export connectGetNamespacedPodAttach

# connectPatchNamespacedPodProxyWithPath
connectPatchNamespacedPodProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1PatchNamespacedPodProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectPatchNamespacedPodProxyWithPath

# proxyPOSTNamespacedService
proxyPOSTNamespacedService(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1POSTNamespacedService(_api, name, namespace; _mediaType=_mediaType)
export proxyPOSTNamespacedService

# replaceNamespaceFinalize
replaceNamespaceFinalize(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespaceFinalize(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespaceFinalize

# connectDeleteNamespacedServiceProxyWithPath
connectDeleteNamespacedServiceProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1DeleteNamespacedServiceProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectDeleteNamespacedServiceProxyWithPath

# readNamespacedReplicationControllerScale
readNamespacedReplicationControllerScale(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readCoreV1NamespacedReplicationControllerScale(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedReplicationControllerScale

# createNamespacedPodPreset
createNamespacedPodPreset(_api::SettingsV1alpha1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createSettingsV1alpha1NamespacedPodPreset(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedPodPreset

# patchPriorityClass
patchPriorityClass(_api::SchedulingV1alpha1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchSchedulingV1alpha1PriorityClass(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchPriorityClass

# watchRoleBindingListForAllNamespaces
watchRoleBindingListForAllNamespaces(_api::RbacAuthorizationV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1RoleBindingListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchRoleBindingListForAllNamespaces(_api::RbacAuthorizationV1alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1alpha1RoleBindingListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchRoleBindingListForAllNamespaces(_api::RbacAuthorizationV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1beta1RoleBindingListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchRoleBindingListForAllNamespaces

# deleteNamespacedConfigMap
deleteNamespacedConfigMap(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1NamespacedConfigMap(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedConfigMap

# createNode
createNode(_api::CoreV1Api, body; pretty=nothing, _mediaType=nothing) = createCoreV1Node(_api, body; pretty=pretty, _mediaType=_mediaType)
export createNode

# listNetworkPolicyForAllNamespaces
listNetworkPolicyForAllNamespaces(_api::ExtensionsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listExtensionsV1beta1NetworkPolicyForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listNetworkPolicyForAllNamespaces(_api::NetworkingV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listNetworkingV1NetworkPolicyForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNetworkPolicyForAllNamespaces

# replaceNamespacedIngress
replaceNamespacedIngress(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1NamespacedIngress(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedIngress

# watchNamespacedDeploymentList
watchNamespacedDeploymentList(_api::AppsV1beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta1NamespacedDeploymentList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedDeploymentList(_api::AppsV1beta2Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2NamespacedDeploymentList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedDeploymentList(_api::ExtensionsV1beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1NamespacedDeploymentList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedDeploymentList

# patchNamespacedPodTemplate
patchNamespacedPodTemplate(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedPodTemplate(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedPodTemplate

# createNamespacedReplicaSet
createNamespacedReplicaSet(_api::AppsV1beta2Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAppsV1beta2NamespacedReplicaSet(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
createNamespacedReplicaSet(_api::ExtensionsV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createExtensionsV1beta1NamespacedReplicaSet(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedReplicaSet

# connectDeleteNamespacedPodProxyWithPath
connectDeleteNamespacedPodProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1DeleteNamespacedPodProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectDeleteNamespacedPodProxyWithPath

# replaceNamespacedResourceQuota
replaceNamespacedResourceQuota(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedResourceQuota(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedResourceQuota

# watchNodeList
watchNodeList(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NodeList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNodeList

# watchNamespacedServiceList
watchNamespacedServiceList(_api::CoreV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedServiceList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedServiceList

# replaceNamespace
replaceNamespace(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1Namespace(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespace

# patchPersistentVolumeStatus
patchPersistentVolumeStatus(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1PersistentVolumeStatus(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchPersistentVolumeStatus

# deleteNamespacedPersistentVolumeClaim
deleteNamespacedPersistentVolumeClaim(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1NamespacedPersistentVolumeClaim(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedPersistentVolumeClaim

# deleteNamespacedStatefulSet
deleteNamespacedStatefulSet(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteAppsV1beta1NamespacedStatefulSet(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
deleteNamespacedStatefulSet(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteAppsV1beta2NamespacedStatefulSet(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedStatefulSet

# replaceClusterRoleBinding
replaceClusterRoleBinding(_api::RbacAuthorizationV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceRbacAuthorizationV1ClusterRoleBinding(_api, name, body; pretty=pretty, _mediaType=_mediaType)
replaceClusterRoleBinding(_api::RbacAuthorizationV1alpha1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceRbacAuthorizationV1alpha1ClusterRoleBinding(_api, name, body; pretty=pretty, _mediaType=_mediaType)
replaceClusterRoleBinding(_api::RbacAuthorizationV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceRbacAuthorizationV1beta1ClusterRoleBinding(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceClusterRoleBinding

# watchNamespacedHorizontalPodAutoscaler
watchNamespacedHorizontalPodAutoscaler(_api::AutoscalingV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAutoscalingV1NamespacedHorizontalPodAutoscaler(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedHorizontalPodAutoscaler(_api::AutoscalingV2beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAutoscalingV2beta1NamespacedHorizontalPodAutoscaler(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedHorizontalPodAutoscaler

# connectGetNamespacedServiceProxyWithPath
connectGetNamespacedServiceProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1GetNamespacedServiceProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectGetNamespacedServiceProxyWithPath

# patchNamespacedReplicationControllerScale
patchNamespacedReplicationControllerScale(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedReplicationControllerScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedReplicationControllerScale

# replaceNamespacedJob
replaceNamespacedJob(_api::BatchV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceBatchV1NamespacedJob(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedJob

# deleteNode
deleteNode(_api::CoreV1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1Node(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNode

# proxyPOSTNamespacedPod
proxyPOSTNamespacedPod(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1POSTNamespacedPod(_api, name, namespace; _mediaType=_mediaType)
export proxyPOSTNamespacedPod

# patchNamespacedCronJobStatus
patchNamespacedCronJobStatus(_api::BatchV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchBatchV1beta1NamespacedCronJobStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
patchNamespacedCronJobStatus(_api::BatchV2alpha1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchBatchV2alpha1NamespacedCronJobStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedCronJobStatus

# listIngressForAllNamespaces
listIngressForAllNamespaces(_api::ExtensionsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listExtensionsV1beta1IngressForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listIngressForAllNamespaces

# deleteNamespacedHorizontalPodAutoscaler
deleteNamespacedHorizontalPodAutoscaler(_api::AutoscalingV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteAutoscalingV1NamespacedHorizontalPodAutoscaler(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
deleteNamespacedHorizontalPodAutoscaler(_api::AutoscalingV2beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteAutoscalingV2beta1NamespacedHorizontalPodAutoscaler(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedHorizontalPodAutoscaler

# deleteCollectionNamespacedRoleBinding
deleteCollectionNamespacedRoleBinding(_api::RbacAuthorizationV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1CollectionNamespacedRoleBinding(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
deleteCollectionNamespacedRoleBinding(_api::RbacAuthorizationV1alpha1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1alpha1CollectionNamespacedRoleBinding(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
deleteCollectionNamespacedRoleBinding(_api::RbacAuthorizationV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1beta1CollectionNamespacedRoleBinding(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedRoleBinding

# patchNamespacedDaemonSetStatus
patchNamespacedDaemonSetStatus(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta2NamespacedDaemonSetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
patchNamespacedDaemonSetStatus(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1NamespacedDaemonSetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedDaemonSetStatus

# deleteCollectionPodSecurityPolicy
deleteCollectionPodSecurityPolicy(_api::ExtensionsV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteExtensionsV1beta1CollectionPodSecurityPolicy(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionPodSecurityPolicy

# readNamespace
readNamespace(_api::CoreV1Api, name::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1Namespace(_api, name; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespace

# deleteCollectionPersistentVolume
deleteCollectionPersistentVolume(_api::CoreV1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionPersistentVolume(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionPersistentVolume

# proxyHEADNamespacedServiceWithPath
proxyHEADNamespacedServiceWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1HEADNamespacedServiceWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyHEADNamespacedServiceWithPath

# watchNamespacedPodTemplate
watchNamespacedPodTemplate(_api::CoreV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedPodTemplate(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedPodTemplate

# createNamespacedEvent
createNamespacedEvent(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedEvent(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedEvent

# replaceNodeStatus
replaceNodeStatus(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NodeStatus(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceNodeStatus

# patchNamespacedNetworkPolicy
patchNamespacedNetworkPolicy(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1NamespacedNetworkPolicy(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
patchNamespacedNetworkPolicy(_api::NetworkingV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchNetworkingV1NamespacedNetworkPolicy(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedNetworkPolicy

# watchStorageClassList
watchStorageClassList(_api::StorageV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchStorageV1StorageClassList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchStorageClassList(_api::StorageV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchStorageV1beta1StorageClassList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchStorageClassList

# proxyOPTIONSNamespacedPodWithPath
proxyOPTIONSNamespacedPodWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1OPTIONSNamespacedPodWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyOPTIONSNamespacedPodWithPath

# createNamespacedResourceQuota
createNamespacedResourceQuota(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedResourceQuota(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedResourceQuota

# readNamespacedCronJobStatus
readNamespacedCronJobStatus(_api::BatchV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readBatchV1beta1NamespacedCronJobStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
readNamespacedCronJobStatus(_api::BatchV2alpha1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readBatchV2alpha1NamespacedCronJobStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedCronJobStatus

# connectPutNamespacedServiceProxyWithPath
connectPutNamespacedServiceProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1PutNamespacedServiceProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectPutNamespacedServiceProxyWithPath

# readAPIService
readAPIService(_api::ApiregistrationV1beta1Api, name::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readApiregistrationV1beta1APIService(_api, name; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readAPIService

# readPersistentVolume
readPersistentVolume(_api::CoreV1Api, name::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1PersistentVolume(_api, name; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readPersistentVolume

# listNamespacedPodDisruptionBudget
listNamespacedPodDisruptionBudget(_api::PolicyV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listPolicyV1beta1NamespacedPodDisruptionBudget(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedPodDisruptionBudget

# deleteNamespacedPodTemplate
deleteNamespacedPodTemplate(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1NamespacedPodTemplate(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedPodTemplate

# getCode
getCode(_api::VersionApi; _mediaType=nothing) = getCodeVersion(_api; _mediaType=_mediaType)
export getCode

# listNamespacedPodPreset
listNamespacedPodPreset(_api::SettingsV1alpha1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listSettingsV1alpha1NamespacedPodPreset(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedPodPreset

# deleteNamespacedDeployment
deleteNamespacedDeployment(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteAppsV1beta1NamespacedDeployment(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
deleteNamespacedDeployment(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteAppsV1beta2NamespacedDeployment(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
deleteNamespacedDeployment(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteExtensionsV1beta1NamespacedDeployment(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedDeployment

# proxyPOSTNode
proxyPOSTNode(_api::CoreV1Api, name::String; _mediaType=nothing) = proxyCoreV1POSTNode(_api, name; _mediaType=_mediaType)
export proxyPOSTNode

# createNamespacedJob
createNamespacedJob(_api::BatchV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createBatchV1NamespacedJob(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedJob

# replaceNamespacedReplicationControllerDummyScale
replaceNamespacedReplicationControllerDummyScale(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1NamespacedReplicationControllerDummyScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedReplicationControllerDummyScale

# connectDeleteNamespacedPodProxy
connectDeleteNamespacedPodProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1DeleteNamespacedPodProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectDeleteNamespacedPodProxy

# connectPostNamespacedPodPortforward
connectPostNamespacedPodPortforward(_api::CoreV1Api, name::String, namespace::String; ports=nothing, _mediaType=nothing) = connectCoreV1PostNamespacedPodPortforward(_api, name, namespace; ports=ports, _mediaType=_mediaType)
export connectPostNamespacedPodPortforward

# watchNamespacedReplicaSetList
watchNamespacedReplicaSetList(_api::AppsV1beta2Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2NamespacedReplicaSetList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedReplicaSetList(_api::ExtensionsV1beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1NamespacedReplicaSetList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedReplicaSetList

# connectPostNodeProxyWithPath
connectPostNodeProxyWithPath(_api::CoreV1Api, name::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1PostNodeProxyWithPath(_api, name, path; path2=path2, _mediaType=_mediaType)
export connectPostNodeProxyWithPath

# proxyPOSTNamespacedPodWithPath
proxyPOSTNamespacedPodWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1POSTNamespacedPodWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyPOSTNamespacedPodWithPath

# listNamespacedIngress
listNamespacedIngress(_api::ExtensionsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listExtensionsV1beta1NamespacedIngress(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedIngress

# readNamespacedEndpoints
readNamespacedEndpoints(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1NamespacedEndpoints(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedEndpoints

# watchNamespacedRoleBinding
watchNamespacedRoleBinding(_api::RbacAuthorizationV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1NamespacedRoleBinding(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedRoleBinding(_api::RbacAuthorizationV1alpha1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1alpha1NamespacedRoleBinding(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedRoleBinding(_api::RbacAuthorizationV1beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1beta1NamespacedRoleBinding(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedRoleBinding

# deletePersistentVolume
deletePersistentVolume(_api::CoreV1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1PersistentVolume(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deletePersistentVolume

# replaceNamespacedReplicationControllerStatus
replaceNamespacedReplicationControllerStatus(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedReplicationControllerStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedReplicationControllerStatus

# createNamespacedConfigMap
createNamespacedConfigMap(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedConfigMap(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedConfigMap

# replaceNamespacedResourceQuotaStatus
replaceNamespacedResourceQuotaStatus(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedResourceQuotaStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedResourceQuotaStatus

# listPodPresetForAllNamespaces
listPodPresetForAllNamespaces(_api::SettingsV1alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listSettingsV1alpha1PodPresetForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listPodPresetForAllNamespaces

# replaceNamespacedPersistentVolumeClaim
replaceNamespacedPersistentVolumeClaim(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedPersistentVolumeClaim(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedPersistentVolumeClaim

# listNamespacedPodTemplate
listNamespacedPodTemplate(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1NamespacedPodTemplate(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedPodTemplate

# watchNamespacedReplicationController
watchNamespacedReplicationController(_api::CoreV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedReplicationController(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedReplicationController

# deleteCollectionNamespacedPodDisruptionBudget
deleteCollectionNamespacedPodDisruptionBudget(_api::PolicyV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deletePolicyV1beta1CollectionNamespacedPodDisruptionBudget(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedPodDisruptionBudget

# patchNamespacedDeploymentStatus
patchNamespacedDeploymentStatus(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta1NamespacedDeploymentStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
patchNamespacedDeploymentStatus(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta2NamespacedDeploymentStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
patchNamespacedDeploymentStatus(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1NamespacedDeploymentStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedDeploymentStatus

# replaceNamespacedCronJob
replaceNamespacedCronJob(_api::BatchV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceBatchV1beta1NamespacedCronJob(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
replaceNamespacedCronJob(_api::BatchV2alpha1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceBatchV2alpha1NamespacedCronJob(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedCronJob

# patchNodeStatus
patchNodeStatus(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NodeStatus(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchNodeStatus

# deleteNamespacedControllerRevision
deleteNamespacedControllerRevision(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteAppsV1beta1NamespacedControllerRevision(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
deleteNamespacedControllerRevision(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteAppsV1beta2NamespacedControllerRevision(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedControllerRevision

# connectGetNamespacedServiceProxy
connectGetNamespacedServiceProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1GetNamespacedServiceProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectGetNamespacedServiceProxy

# listStorageClass
listStorageClass(_api::StorageV1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listStorageV1StorageClass(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listStorageClass(_api::StorageV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listStorageV1beta1StorageClass(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listStorageClass

# readNamespacedStatefulSetStatus
readNamespacedStatefulSetStatus(_api::AppsV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAppsV1beta1NamespacedStatefulSetStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
readNamespacedStatefulSetStatus(_api::AppsV1beta2Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAppsV1beta2NamespacedStatefulSetStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedStatefulSetStatus

# readNamespacedPod
readNamespacedPod(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1NamespacedPod(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedPod

# replaceNamespacedEvent
replaceNamespacedEvent(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedEvent(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedEvent

# readNamespacedJob
readNamespacedJob(_api::BatchV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readBatchV1NamespacedJob(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedJob

# watchStatefulSetListForAllNamespaces
watchStatefulSetListForAllNamespaces(_api::AppsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta1StatefulSetListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchStatefulSetListForAllNamespaces(_api::AppsV1beta2Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2StatefulSetListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchStatefulSetListForAllNamespaces

# connectGetNodeProxyWithPath
connectGetNodeProxyWithPath(_api::CoreV1Api, name::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1GetNodeProxyWithPath(_api, name, path; path2=path2, _mediaType=_mediaType)
export connectGetNodeProxyWithPath

# listNamespacedPersistentVolumeClaim
listNamespacedPersistentVolumeClaim(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1NamespacedPersistentVolumeClaim(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedPersistentVolumeClaim

# createNamespacedDeployment
createNamespacedDeployment(_api::AppsV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAppsV1beta1NamespacedDeployment(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
createNamespacedDeployment(_api::AppsV1beta2Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAppsV1beta2NamespacedDeployment(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
createNamespacedDeployment(_api::ExtensionsV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createExtensionsV1beta1NamespacedDeployment(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedDeployment

# watchRoleListForAllNamespaces
watchRoleListForAllNamespaces(_api::RbacAuthorizationV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1RoleListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchRoleListForAllNamespaces(_api::RbacAuthorizationV1alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1alpha1RoleListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchRoleListForAllNamespaces(_api::RbacAuthorizationV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1beta1RoleListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchRoleListForAllNamespaces

# listSecretForAllNamespaces
listSecretForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1SecretForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listSecretForAllNamespaces

# watchNamespacedSecret
watchNamespacedSecret(_api::CoreV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedSecret(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedSecret

# watchNamespacedIngressList
watchNamespacedIngressList(_api::ExtensionsV1beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1NamespacedIngressList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedIngressList

# readPersistentVolumeStatus
readPersistentVolumeStatus(_api::CoreV1Api, name::String; pretty=nothing, _mediaType=nothing) = readCoreV1PersistentVolumeStatus(_api, name; pretty=pretty, _mediaType=_mediaType)
export readPersistentVolumeStatus

# replaceNamespacedNetworkPolicy
replaceNamespacedNetworkPolicy(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1NamespacedNetworkPolicy(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
replaceNamespacedNetworkPolicy(_api::NetworkingV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceNetworkingV1NamespacedNetworkPolicy(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedNetworkPolicy

# deleteCollectionPriorityClass
deleteCollectionPriorityClass(_api::SchedulingV1alpha1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteSchedulingV1alpha1CollectionPriorityClass(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionPriorityClass

# proxyDELETENamespacedPod
proxyDELETENamespacedPod(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1DELETENamespacedPod(_api, name, namespace; _mediaType=_mediaType)
export proxyDELETENamespacedPod

# connectPostNamespacedPodAttach
connectPostNamespacedPodAttach(_api::CoreV1Api, name::String, namespace::String; container=nothing, stderr=nothing, stdin=nothing, stdout=nothing, tty=nothing, _mediaType=nothing) = connectCoreV1PostNamespacedPodAttach(_api, name, namespace; container=container, stderr=stderr, stdin=stdin, stdout=stdout, tty=tty, _mediaType=_mediaType)
export connectPostNamespacedPodAttach

# readNamespacedJobStatus
readNamespacedJobStatus(_api::BatchV1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readBatchV1NamespacedJobStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedJobStatus

# patchNode
patchNode(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1Node(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchNode

# replaceNamespacedControllerRevision
replaceNamespacedControllerRevision(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta1NamespacedControllerRevision(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
replaceNamespacedControllerRevision(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta2NamespacedControllerRevision(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedControllerRevision

# watchNode
watchNode(_api::CoreV1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1Node(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNode

# watchClusterRoleBinding
watchClusterRoleBinding(_api::RbacAuthorizationV1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1ClusterRoleBinding(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchClusterRoleBinding(_api::RbacAuthorizationV1alpha1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1alpha1ClusterRoleBinding(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchClusterRoleBinding(_api::RbacAuthorizationV1beta1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1beta1ClusterRoleBinding(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchClusterRoleBinding

# createStorageClass
createStorageClass(_api::StorageV1Api, body; pretty=nothing, _mediaType=nothing) = createStorageV1StorageClass(_api, body; pretty=pretty, _mediaType=_mediaType)
createStorageClass(_api::StorageV1beta1Api, body; pretty=nothing, _mediaType=nothing) = createStorageV1beta1StorageClass(_api, body; pretty=pretty, _mediaType=_mediaType)
export createStorageClass

# listNamespacedStatefulSet
listNamespacedStatefulSet(_api::AppsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta1NamespacedStatefulSet(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listNamespacedStatefulSet(_api::AppsV1beta2Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta2NamespacedStatefulSet(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedStatefulSet

# patchNamespacedResourceQuota
patchNamespacedResourceQuota(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedResourceQuota(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedResourceQuota

# deleteCollectionNamespacedDeployment
deleteCollectionNamespacedDeployment(_api::AppsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteAppsV1beta1CollectionNamespacedDeployment(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
deleteCollectionNamespacedDeployment(_api::AppsV1beta2Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteAppsV1beta2CollectionNamespacedDeployment(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
deleteCollectionNamespacedDeployment(_api::ExtensionsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteExtensionsV1beta1CollectionNamespacedDeployment(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedDeployment

# deleteNamespacedJob
deleteNamespacedJob(_api::BatchV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteBatchV1NamespacedJob(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedJob

# proxyGETNamespacedPodWithPath
proxyGETNamespacedPodWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1GETNamespacedPodWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyGETNamespacedPodWithPath

# patchNamespacedPersistentVolumeClaim
patchNamespacedPersistentVolumeClaim(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedPersistentVolumeClaim(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedPersistentVolumeClaim

# readNamespacedPersistentVolumeClaimStatus
readNamespacedPersistentVolumeClaimStatus(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readCoreV1NamespacedPersistentVolumeClaimStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedPersistentVolumeClaimStatus

# watchAPIServiceList
watchAPIServiceList(_api::ApiregistrationV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchApiregistrationV1beta1APIServiceList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchAPIServiceList

# watchNamespacedPodPresetList
watchNamespacedPodPresetList(_api::SettingsV1alpha1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchSettingsV1alpha1NamespacedPodPresetList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedPodPresetList

# watchNamespacedReplicaSet
watchNamespacedReplicaSet(_api::AppsV1beta2Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2NamespacedReplicaSet(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedReplicaSet(_api::ExtensionsV1beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1NamespacedReplicaSet(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedReplicaSet

# listPodForAllNamespaces
listPodForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1PodForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listPodForAllNamespaces

# proxyGETNode
proxyGETNode(_api::CoreV1Api, name::String; _mediaType=nothing) = proxyCoreV1GETNode(_api, name; _mediaType=_mediaType)
export proxyGETNode

# replaceNamespacedReplicationControllerScale
replaceNamespacedReplicationControllerScale(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedReplicationControllerScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedReplicationControllerScale

# listNamespacedConfigMap
listNamespacedConfigMap(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1NamespacedConfigMap(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedConfigMap

# replaceNamespacedPodDisruptionBudget
replaceNamespacedPodDisruptionBudget(_api::PolicyV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replacePolicyV1beta1NamespacedPodDisruptionBudget(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedPodDisruptionBudget

# deleteNamespacedPodPreset
deleteNamespacedPodPreset(_api::SettingsV1alpha1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteSettingsV1alpha1NamespacedPodPreset(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedPodPreset

# deleteCollectionExternalAdmissionHookConfiguration
deleteCollectionExternalAdmissionHookConfiguration(_api::AdmissionregistrationV1alpha1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteAdmissionregistrationV1alpha1CollectionExternalAdmissionHookConfiguration(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionExternalAdmissionHookConfiguration

# watchNamespacedNetworkPolicyList
watchNamespacedNetworkPolicyList(_api::ExtensionsV1beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1NamespacedNetworkPolicyList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedNetworkPolicyList(_api::NetworkingV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchNetworkingV1NamespacedNetworkPolicyList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedNetworkPolicyList

# watchNamespacedPersistentVolumeClaim
watchNamespacedPersistentVolumeClaim(_api::CoreV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedPersistentVolumeClaim(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedPersistentVolumeClaim

# replaceNamespacedHorizontalPodAutoscalerStatus
replaceNamespacedHorizontalPodAutoscalerStatus(_api::AutoscalingV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAutoscalingV1NamespacedHorizontalPodAutoscalerStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
replaceNamespacedHorizontalPodAutoscalerStatus(_api::AutoscalingV2beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAutoscalingV2beta1NamespacedHorizontalPodAutoscalerStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedHorizontalPodAutoscalerStatus

# deleteCollectionNamespacedNetworkPolicy
deleteCollectionNamespacedNetworkPolicy(_api::ExtensionsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteExtensionsV1beta1CollectionNamespacedNetworkPolicy(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
deleteCollectionNamespacedNetworkPolicy(_api::NetworkingV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteNetworkingV1CollectionNamespacedNetworkPolicy(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedNetworkPolicy

# readNamespacedNetworkPolicy
readNamespacedNetworkPolicy(_api::ExtensionsV1beta1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readExtensionsV1beta1NamespacedNetworkPolicy(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
readNamespacedNetworkPolicy(_api::NetworkingV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readNetworkingV1NamespacedNetworkPolicy(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedNetworkPolicy

# patchNamespacedSecret
patchNamespacedSecret(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedSecret(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedSecret

# replaceNamespacedServiceAccount
replaceNamespacedServiceAccount(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedServiceAccount(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedServiceAccount

# watchNamespacedNetworkPolicy
watchNamespacedNetworkPolicy(_api::ExtensionsV1beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1NamespacedNetworkPolicy(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchNamespacedNetworkPolicy(_api::NetworkingV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchNetworkingV1NamespacedNetworkPolicy(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedNetworkPolicy

# deleteCollectionNamespacedPodTemplate
deleteCollectionNamespacedPodTemplate(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionNamespacedPodTemplate(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedPodTemplate

# deleteNamespacedPodDisruptionBudget
deleteNamespacedPodDisruptionBudget(_api::PolicyV1beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deletePolicyV1beta1NamespacedPodDisruptionBudget(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedPodDisruptionBudget

# patchNamespacedService
patchNamespacedService(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedService(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedService

# proxyPOSTNodeWithPath
proxyPOSTNodeWithPath(_api::CoreV1Api, name::String, path::String; _mediaType=nothing) = proxyCoreV1POSTNodeWithPath(_api, name, path; _mediaType=_mediaType)
export proxyPOSTNodeWithPath

# replaceInitializerConfiguration
replaceInitializerConfiguration(_api::AdmissionregistrationV1alpha1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceAdmissionregistrationV1alpha1InitializerConfiguration(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceInitializerConfiguration

# replaceNamespacedService
replaceNamespacedService(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedService(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedService

# createInitializerConfiguration
createInitializerConfiguration(_api::AdmissionregistrationV1alpha1Api, body; pretty=nothing, _mediaType=nothing) = createAdmissionregistrationV1alpha1InitializerConfiguration(_api, body; pretty=pretty, _mediaType=_mediaType)
export createInitializerConfiguration

# watchControllerRevisionListForAllNamespaces
watchControllerRevisionListForAllNamespaces(_api::AppsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta1ControllerRevisionListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchControllerRevisionListForAllNamespaces(_api::AppsV1beta2Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2ControllerRevisionListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchControllerRevisionListForAllNamespaces

# proxyDELETENamespacedPodWithPath
proxyDELETENamespacedPodWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1DELETENamespacedPodWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyDELETENamespacedPodWithPath

# deleteCollectionCertificateSigningRequest
deleteCollectionCertificateSigningRequest(_api::CertificatesV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCertificatesV1beta1CollectionCertificateSigningRequest(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionCertificateSigningRequest

# watchNamespace
watchNamespace(_api::CoreV1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1Namespace(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespace

# watchNamespacedResourceQuota
watchNamespacedResourceQuota(_api::CoreV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedResourceQuota(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedResourceQuota

# watchPriorityClassList
watchPriorityClassList(_api::SchedulingV1alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchSchedulingV1alpha1PriorityClassList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchPriorityClassList

# watchNamespacedEndpointsList
watchNamespacedEndpointsList(_api::CoreV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedEndpointsList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedEndpointsList

# proxyOPTIONSNamespacedServiceWithPath
proxyOPTIONSNamespacedServiceWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1OPTIONSNamespacedServiceWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyOPTIONSNamespacedServiceWithPath

# readPodSecurityPolicy
readPodSecurityPolicy(_api::ExtensionsV1beta1Api, name::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readExtensionsV1beta1PodSecurityPolicy(_api, name; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readPodSecurityPolicy

# replaceNamespacedRole
replaceNamespacedRole(_api::RbacAuthorizationV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceRbacAuthorizationV1NamespacedRole(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
replaceNamespacedRole(_api::RbacAuthorizationV1alpha1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceRbacAuthorizationV1alpha1NamespacedRole(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
replaceNamespacedRole(_api::RbacAuthorizationV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceRbacAuthorizationV1beta1NamespacedRole(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedRole

# patchNamespacedReplicationController
patchNamespacedReplicationController(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedReplicationController(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedReplicationController

# deleteCustomResourceDefinition
deleteCustomResourceDefinition(_api::ApiextensionsV1beta1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteApiextensionsV1beta1CustomResourceDefinition(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteCustomResourceDefinition

# createSelfSubjectRulesReview
createSelfSubjectRulesReview(_api::AuthorizationV1Api, body; pretty=nothing, _mediaType=nothing) = createAuthorizationV1SelfSubjectRulesReview(_api, body; pretty=pretty, _mediaType=_mediaType)
createSelfSubjectRulesReview(_api::AuthorizationV1beta1Api, body; pretty=nothing, _mediaType=nothing) = createAuthorizationV1beta1SelfSubjectRulesReview(_api, body; pretty=pretty, _mediaType=_mediaType)
export createSelfSubjectRulesReview

# watchNamespacedConfigMapList
watchNamespacedConfigMapList(_api::CoreV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedConfigMapList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedConfigMapList

# patchNamespacedIngress
patchNamespacedIngress(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1NamespacedIngress(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedIngress

# createNamespacedServiceAccount
createNamespacedServiceAccount(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedServiceAccount(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedServiceAccount

# watchNamespacedPersistentVolumeClaimList
watchNamespacedPersistentVolumeClaimList(_api::CoreV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedPersistentVolumeClaimList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedPersistentVolumeClaimList

# watchNamespacedPodList
watchNamespacedPodList(_api::CoreV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedPodList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedPodList

# listServiceAccountForAllNamespaces
listServiceAccountForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1ServiceAccountForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listServiceAccountForAllNamespaces

# connectPutNamespacedPodProxyWithPath
connectPutNamespacedPodProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1PutNamespacedPodProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectPutNamespacedPodProxyWithPath

# listDeploymentForAllNamespaces
listDeploymentForAllNamespaces(_api::AppsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta1DeploymentForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listDeploymentForAllNamespaces(_api::AppsV1beta2Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta2DeploymentForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listDeploymentForAllNamespaces(_api::ExtensionsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listExtensionsV1beta1DeploymentForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listDeploymentForAllNamespaces

# deleteInitializerConfiguration
deleteInitializerConfiguration(_api::AdmissionregistrationV1alpha1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteAdmissionregistrationV1alpha1InitializerConfiguration(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteInitializerConfiguration

# patchNamespacedRole
patchNamespacedRole(_api::RbacAuthorizationV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchRbacAuthorizationV1NamespacedRole(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
patchNamespacedRole(_api::RbacAuthorizationV1alpha1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchRbacAuthorizationV1alpha1NamespacedRole(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
patchNamespacedRole(_api::RbacAuthorizationV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchRbacAuthorizationV1beta1NamespacedRole(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedRole

# connectPatchNodeProxyWithPath
connectPatchNodeProxyWithPath(_api::CoreV1Api, name::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1PatchNodeProxyWithPath(_api, name, path; path2=path2, _mediaType=_mediaType)
export connectPatchNodeProxyWithPath

# patchCustomResourceDefinition
patchCustomResourceDefinition(_api::ApiextensionsV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchApiextensionsV1beta1CustomResourceDefinition(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchCustomResourceDefinition

# watchPersistentVolume
watchPersistentVolume(_api::CoreV1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1PersistentVolume(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchPersistentVolume

# watchStorageClass
watchStorageClass(_api::StorageV1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchStorageV1StorageClass(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
watchStorageClass(_api::StorageV1beta1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchStorageV1beta1StorageClass(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchStorageClass

# watchEndpointsListForAllNamespaces
watchEndpointsListForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1EndpointsListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchEndpointsListForAllNamespaces

# deleteNamespace
deleteNamespace(_api::CoreV1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1Namespace(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespace

# watchNamespacedPodPreset
watchNamespacedPodPreset(_api::SettingsV1alpha1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchSettingsV1alpha1NamespacedPodPreset(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedPodPreset

# listCertificateSigningRequest
listCertificateSigningRequest(_api::CertificatesV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCertificatesV1beta1CertificateSigningRequest(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listCertificateSigningRequest

# connectHeadNamespacedServiceProxyWithPath
connectHeadNamespacedServiceProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1HeadNamespacedServiceProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectHeadNamespacedServiceProxyWithPath

# listRoleBindingForAllNamespaces
listRoleBindingForAllNamespaces(_api::RbacAuthorizationV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1RoleBindingForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listRoleBindingForAllNamespaces(_api::RbacAuthorizationV1alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1alpha1RoleBindingForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listRoleBindingForAllNamespaces(_api::RbacAuthorizationV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1beta1RoleBindingForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listRoleBindingForAllNamespaces

# listNamespacedRole
listNamespacedRole(_api::RbacAuthorizationV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1NamespacedRole(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listNamespacedRole(_api::RbacAuthorizationV1alpha1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1alpha1NamespacedRole(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listNamespacedRole(_api::RbacAuthorizationV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1beta1NamespacedRole(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedRole

# readNamespacedDeploymentScale
readNamespacedDeploymentScale(_api::AppsV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAppsV1beta1NamespacedDeploymentScale(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
readNamespacedDeploymentScale(_api::AppsV1beta2Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAppsV1beta2NamespacedDeploymentScale(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
readNamespacedDeploymentScale(_api::ExtensionsV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readExtensionsV1beta1NamespacedDeploymentScale(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedDeploymentScale

# watchServiceListForAllNamespaces
watchServiceListForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1ServiceListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchServiceListForAllNamespaces

# deleteCollectionNamespacedReplicaSet
deleteCollectionNamespacedReplicaSet(_api::AppsV1beta2Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteAppsV1beta2CollectionNamespacedReplicaSet(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
deleteCollectionNamespacedReplicaSet(_api::ExtensionsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteExtensionsV1beta1CollectionNamespacedReplicaSet(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedReplicaSet

# patchNamespacedEndpoints
patchNamespacedEndpoints(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedEndpoints(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedEndpoints

# connectPutNodeProxyWithPath
connectPutNodeProxyWithPath(_api::CoreV1Api, name::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1PutNodeProxyWithPath(_api, name, path; path2=path2, _mediaType=_mediaType)
export connectPutNodeProxyWithPath

# proxyPATCHNamespacedPodWithPath
proxyPATCHNamespacedPodWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1PATCHNamespacedPodWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyPATCHNamespacedPodWithPath

# proxyPATCHNodeWithPath
proxyPATCHNodeWithPath(_api::CoreV1Api, name::String, path::String; _mediaType=nothing) = proxyCoreV1PATCHNodeWithPath(_api, name, path; _mediaType=_mediaType)
export proxyPATCHNodeWithPath

# watchNamespacedService
watchNamespacedService(_api::CoreV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedService(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedService

# createNamespacedPodDisruptionBudget
createNamespacedPodDisruptionBudget(_api::PolicyV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createPolicyV1beta1NamespacedPodDisruptionBudget(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedPodDisruptionBudget

# watchCertificateSigningRequestList
watchCertificateSigningRequestList(_api::CertificatesV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCertificatesV1beta1CertificateSigningRequestList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchCertificateSigningRequestList

# replacePriorityClass
replacePriorityClass(_api::SchedulingV1alpha1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceSchedulingV1alpha1PriorityClass(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replacePriorityClass

# connectOptionsNamespacedPodProxyWithPath
connectOptionsNamespacedPodProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1OptionsNamespacedPodProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectOptionsNamespacedPodProxyWithPath

# listNamespacedReplicationController
listNamespacedReplicationController(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1NamespacedReplicationController(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedReplicationController

# connectDeleteNodeProxy
connectDeleteNodeProxy(_api::CoreV1Api, name::String; path=nothing, _mediaType=nothing) = connectCoreV1DeleteNodeProxy(_api, name; path=path, _mediaType=_mediaType)
export connectDeleteNodeProxy

# listStatefulSetForAllNamespaces
listStatefulSetForAllNamespaces(_api::AppsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta1StatefulSetForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listStatefulSetForAllNamespaces(_api::AppsV1beta2Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta2StatefulSetForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listStatefulSetForAllNamespaces

# getAPIGroup
getAPIGroup(_api::AdmissionregistrationApi; _mediaType=nothing) = getAdmissionregistrationAPIGroup(_api; _mediaType=_mediaType)
getAPIGroup(_api::ApiextensionsApi; _mediaType=nothing) = getApiextensionsAPIGroup(_api; _mediaType=_mediaType)
getAPIGroup(_api::ApiregistrationApi; _mediaType=nothing) = getApiregistrationAPIGroup(_api; _mediaType=_mediaType)
getAPIGroup(_api::AppsApi; _mediaType=nothing) = getAppsAPIGroup(_api; _mediaType=_mediaType)
getAPIGroup(_api::AuthenticationApi; _mediaType=nothing) = getAuthenticationAPIGroup(_api; _mediaType=_mediaType)
getAPIGroup(_api::AuthorizationApi; _mediaType=nothing) = getAuthorizationAPIGroup(_api; _mediaType=_mediaType)
getAPIGroup(_api::AutoscalingApi; _mediaType=nothing) = getAutoscalingAPIGroup(_api; _mediaType=_mediaType)
getAPIGroup(_api::BatchApi; _mediaType=nothing) = getBatchAPIGroup(_api; _mediaType=_mediaType)
getAPIGroup(_api::CertificatesApi; _mediaType=nothing) = getCertificatesAPIGroup(_api; _mediaType=_mediaType)
getAPIGroup(_api::ExtensionsApi; _mediaType=nothing) = getExtensionsAPIGroup(_api; _mediaType=_mediaType)
getAPIGroup(_api::NetworkingApi; _mediaType=nothing) = getNetworkingAPIGroup(_api; _mediaType=_mediaType)
getAPIGroup(_api::PolicyApi; _mediaType=nothing) = getPolicyAPIGroup(_api; _mediaType=_mediaType)
getAPIGroup(_api::RbacAuthorizationApi; _mediaType=nothing) = getRbacAuthorizationAPIGroup(_api; _mediaType=_mediaType)
getAPIGroup(_api::SchedulingApi; _mediaType=nothing) = getSchedulingAPIGroup(_api; _mediaType=_mediaType)
getAPIGroup(_api::SettingsApi; _mediaType=nothing) = getSettingsAPIGroup(_api; _mediaType=_mediaType)
getAPIGroup(_api::StorageApi; _mediaType=nothing) = getStorageAPIGroup(_api; _mediaType=_mediaType)
export getAPIGroup

# readNamespacedPodStatus
readNamespacedPodStatus(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readCoreV1NamespacedPodStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedPodStatus

# listServiceForAllNamespaces
listServiceForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1ServiceForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listServiceForAllNamespaces

# watchSecretListForAllNamespaces
watchSecretListForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1SecretListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchSecretListForAllNamespaces

# listReplicaSetForAllNamespaces
listReplicaSetForAllNamespaces(_api::AppsV1beta2Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta2ReplicaSetForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listReplicaSetForAllNamespaces(_api::ExtensionsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listExtensionsV1beta1ReplicaSetForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listReplicaSetForAllNamespaces

# listNamespacedNetworkPolicy
listNamespacedNetworkPolicy(_api::ExtensionsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listExtensionsV1beta1NamespacedNetworkPolicy(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
listNamespacedNetworkPolicy(_api::NetworkingV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listNetworkingV1NamespacedNetworkPolicy(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedNetworkPolicy

# connectHeadNamespacedPodProxy
connectHeadNamespacedPodProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1HeadNamespacedPodProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectHeadNamespacedPodProxy

# deleteCollectionNamespacedIngress
deleteCollectionNamespacedIngress(_api::ExtensionsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteExtensionsV1beta1CollectionNamespacedIngress(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedIngress

# proxyPOSTNamespacedServiceWithPath
proxyPOSTNamespacedServiceWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1POSTNamespacedServiceWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyPOSTNamespacedServiceWithPath

