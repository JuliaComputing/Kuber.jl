getAPIGroup(_api::AdmissionregistrationApi; _mediaType=nothing) = getAdmissionregistrationAPIGroup(_api; _mediaType=_mediaType)
export getAPIGroup

createExternalAdmissionHookConfiguration(_api::AdmissionregistrationV1alpha1Api, body; pretty=nothing, _mediaType=nothing) = createAdmissionregistrationV1alpha1ExternalAdmissionHookConfiguration(_api, body; pretty=pretty, _mediaType=_mediaType)
export createExternalAdmissionHookConfiguration

createInitializerConfiguration(_api::AdmissionregistrationV1alpha1Api, body; pretty=nothing, _mediaType=nothing) = createAdmissionregistrationV1alpha1InitializerConfiguration(_api, body; pretty=pretty, _mediaType=_mediaType)
export createInitializerConfiguration

deleteCollectionExternalAdmissionHookConfiguration(_api::AdmissionregistrationV1alpha1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteAdmissionregistrationV1alpha1CollectionExternalAdmissionHookConfiguration(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionExternalAdmissionHookConfiguration

deleteCollectionInitializerConfiguration(_api::AdmissionregistrationV1alpha1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteAdmissionregistrationV1alpha1CollectionInitializerConfiguration(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionInitializerConfiguration

deleteExternalAdmissionHookConfiguration(_api::AdmissionregistrationV1alpha1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteAdmissionregistrationV1alpha1ExternalAdmissionHookConfiguration(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteExternalAdmissionHookConfiguration

deleteInitializerConfiguration(_api::AdmissionregistrationV1alpha1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteAdmissionregistrationV1alpha1InitializerConfiguration(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteInitializerConfiguration

getAPIResources(_api::AdmissionregistrationV1alpha1Api; _mediaType=nothing) = getAdmissionregistrationV1alpha1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

listExternalAdmissionHookConfiguration(_api::AdmissionregistrationV1alpha1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAdmissionregistrationV1alpha1ExternalAdmissionHookConfiguration(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listExternalAdmissionHookConfiguration

listInitializerConfiguration(_api::AdmissionregistrationV1alpha1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAdmissionregistrationV1alpha1InitializerConfiguration(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listInitializerConfiguration

patchExternalAdmissionHookConfiguration(_api::AdmissionregistrationV1alpha1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchAdmissionregistrationV1alpha1ExternalAdmissionHookConfiguration(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchExternalAdmissionHookConfiguration

patchInitializerConfiguration(_api::AdmissionregistrationV1alpha1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchAdmissionregistrationV1alpha1InitializerConfiguration(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchInitializerConfiguration

readExternalAdmissionHookConfiguration(_api::AdmissionregistrationV1alpha1Api, name::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readAdmissionregistrationV1alpha1ExternalAdmissionHookConfiguration(_api, name; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readExternalAdmissionHookConfiguration

readInitializerConfiguration(_api::AdmissionregistrationV1alpha1Api, name::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readAdmissionregistrationV1alpha1InitializerConfiguration(_api, name; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readInitializerConfiguration

replaceExternalAdmissionHookConfiguration(_api::AdmissionregistrationV1alpha1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceAdmissionregistrationV1alpha1ExternalAdmissionHookConfiguration(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceExternalAdmissionHookConfiguration

replaceInitializerConfiguration(_api::AdmissionregistrationV1alpha1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceAdmissionregistrationV1alpha1InitializerConfiguration(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceInitializerConfiguration

watchExternalAdmissionHookConfiguration(_api::AdmissionregistrationV1alpha1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAdmissionregistrationV1alpha1ExternalAdmissionHookConfiguration(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchExternalAdmissionHookConfiguration

watchExternalAdmissionHookConfigurationList(_api::AdmissionregistrationV1alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAdmissionregistrationV1alpha1ExternalAdmissionHookConfigurationList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchExternalAdmissionHookConfigurationList

watchInitializerConfiguration(_api::AdmissionregistrationV1alpha1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAdmissionregistrationV1alpha1InitializerConfiguration(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchInitializerConfiguration

watchInitializerConfigurationList(_api::AdmissionregistrationV1alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAdmissionregistrationV1alpha1InitializerConfigurationList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchInitializerConfigurationList

getAPIGroup(_api::ApiextensionsApi; _mediaType=nothing) = getApiextensionsAPIGroup(_api; _mediaType=_mediaType)
export getAPIGroup

createCustomResourceDefinition(_api::ApiextensionsV1beta1Api, body; pretty=nothing, _mediaType=nothing) = createApiextensionsV1beta1CustomResourceDefinition(_api, body; pretty=pretty, _mediaType=_mediaType)
export createCustomResourceDefinition

deleteCollectionCustomResourceDefinition(_api::ApiextensionsV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteApiextensionsV1beta1CollectionCustomResourceDefinition(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionCustomResourceDefinition

deleteCustomResourceDefinition(_api::ApiextensionsV1beta1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteApiextensionsV1beta1CustomResourceDefinition(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteCustomResourceDefinition

getAPIResources(_api::ApiextensionsV1beta1Api; _mediaType=nothing) = getApiextensionsV1beta1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

listCustomResourceDefinition(_api::ApiextensionsV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listApiextensionsV1beta1CustomResourceDefinition(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listCustomResourceDefinition

patchCustomResourceDefinition(_api::ApiextensionsV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchApiextensionsV1beta1CustomResourceDefinition(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchCustomResourceDefinition

readCustomResourceDefinition(_api::ApiextensionsV1beta1Api, name::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readApiextensionsV1beta1CustomResourceDefinition(_api, name; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readCustomResourceDefinition

replaceCustomResourceDefinition(_api::ApiextensionsV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceApiextensionsV1beta1CustomResourceDefinition(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceCustomResourceDefinition

replaceCustomResourceDefinitionStatus(_api::ApiextensionsV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceApiextensionsV1beta1CustomResourceDefinitionStatus(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceCustomResourceDefinitionStatus

watchCustomResourceDefinition(_api::ApiextensionsV1beta1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchApiextensionsV1beta1CustomResourceDefinition(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchCustomResourceDefinition

watchCustomResourceDefinitionList(_api::ApiextensionsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchApiextensionsV1beta1CustomResourceDefinitionList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchCustomResourceDefinitionList

getAPIGroup(_api::ApiregistrationApi; _mediaType=nothing) = getApiregistrationAPIGroup(_api; _mediaType=_mediaType)
export getAPIGroup

createAPIService(_api::ApiregistrationV1beta1Api, body; pretty=nothing, _mediaType=nothing) = createApiregistrationV1beta1APIService(_api, body; pretty=pretty, _mediaType=_mediaType)
export createAPIService

deleteAPIService(_api::ApiregistrationV1beta1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteApiregistrationV1beta1APIService(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteAPIService

deleteCollectionAPIService(_api::ApiregistrationV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteApiregistrationV1beta1CollectionAPIService(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionAPIService

getAPIResources(_api::ApiregistrationV1beta1Api; _mediaType=nothing) = getApiregistrationV1beta1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

listAPIService(_api::ApiregistrationV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listApiregistrationV1beta1APIService(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listAPIService

patchAPIService(_api::ApiregistrationV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchApiregistrationV1beta1APIService(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchAPIService

readAPIService(_api::ApiregistrationV1beta1Api, name::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readApiregistrationV1beta1APIService(_api, name; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readAPIService

replaceAPIService(_api::ApiregistrationV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceApiregistrationV1beta1APIService(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceAPIService

replaceAPIServiceStatus(_api::ApiregistrationV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceApiregistrationV1beta1APIServiceStatus(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceAPIServiceStatus

watchAPIService(_api::ApiregistrationV1beta1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchApiregistrationV1beta1APIService(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchAPIService

watchAPIServiceList(_api::ApiregistrationV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchApiregistrationV1beta1APIServiceList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchAPIServiceList

getAPIGroup(_api::AppsApi; _mediaType=nothing) = getAppsAPIGroup(_api; _mediaType=_mediaType)
export getAPIGroup

createNamespacedControllerRevision(_api::AppsV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAppsV1beta1NamespacedControllerRevision(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedControllerRevision

createNamespacedDeployment(_api::AppsV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAppsV1beta1NamespacedDeployment(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedDeployment

createNamespacedDeploymentRollback(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAppsV1beta1NamespacedDeploymentRollback(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedDeploymentRollback

createNamespacedStatefulSet(_api::AppsV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAppsV1beta1NamespacedStatefulSet(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedStatefulSet

deleteCollectionNamespacedControllerRevision(_api::AppsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteAppsV1beta1CollectionNamespacedControllerRevision(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedControllerRevision

deleteCollectionNamespacedDeployment(_api::AppsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteAppsV1beta1CollectionNamespacedDeployment(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedDeployment

deleteCollectionNamespacedStatefulSet(_api::AppsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteAppsV1beta1CollectionNamespacedStatefulSet(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedStatefulSet

deleteNamespacedControllerRevision(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteAppsV1beta1NamespacedControllerRevision(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedControllerRevision

deleteNamespacedDeployment(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteAppsV1beta1NamespacedDeployment(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedDeployment

deleteNamespacedStatefulSet(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteAppsV1beta1NamespacedStatefulSet(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedStatefulSet

getAPIResources(_api::AppsV1beta1Api; _mediaType=nothing) = getAppsV1beta1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

listControllerRevisionForAllNamespaces(_api::AppsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta1ControllerRevisionForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listControllerRevisionForAllNamespaces

listDeploymentForAllNamespaces(_api::AppsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta1DeploymentForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listDeploymentForAllNamespaces

listNamespacedControllerRevision(_api::AppsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta1NamespacedControllerRevision(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedControllerRevision

listNamespacedDeployment(_api::AppsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta1NamespacedDeployment(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedDeployment

listNamespacedStatefulSet(_api::AppsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta1NamespacedStatefulSet(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedStatefulSet

listStatefulSetForAllNamespaces(_api::AppsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta1StatefulSetForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listStatefulSetForAllNamespaces

patchNamespacedControllerRevision(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta1NamespacedControllerRevision(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedControllerRevision

patchNamespacedDeployment(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta1NamespacedDeployment(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedDeployment

patchNamespacedDeploymentScale(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta1NamespacedDeploymentScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedDeploymentScale

patchNamespacedDeploymentStatus(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta1NamespacedDeploymentStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedDeploymentStatus

patchNamespacedStatefulSet(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta1NamespacedStatefulSet(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedStatefulSet

patchNamespacedStatefulSetScale(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta1NamespacedStatefulSetScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedStatefulSetScale

patchNamespacedStatefulSetStatus(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta1NamespacedStatefulSetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedStatefulSetStatus

readNamespacedControllerRevision(_api::AppsV1beta1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readAppsV1beta1NamespacedControllerRevision(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedControllerRevision

readNamespacedDeployment(_api::AppsV1beta1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readAppsV1beta1NamespacedDeployment(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedDeployment

readNamespacedDeploymentScale(_api::AppsV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAppsV1beta1NamespacedDeploymentScale(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedDeploymentScale

readNamespacedDeploymentStatus(_api::AppsV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAppsV1beta1NamespacedDeploymentStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedDeploymentStatus

readNamespacedStatefulSet(_api::AppsV1beta1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readAppsV1beta1NamespacedStatefulSet(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedStatefulSet

readNamespacedStatefulSetScale(_api::AppsV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAppsV1beta1NamespacedStatefulSetScale(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedStatefulSetScale

readNamespacedStatefulSetStatus(_api::AppsV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAppsV1beta1NamespacedStatefulSetStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedStatefulSetStatus

replaceNamespacedControllerRevision(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta1NamespacedControllerRevision(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedControllerRevision

replaceNamespacedDeployment(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta1NamespacedDeployment(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedDeployment

replaceNamespacedDeploymentScale(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta1NamespacedDeploymentScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedDeploymentScale

replaceNamespacedDeploymentStatus(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta1NamespacedDeploymentStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedDeploymentStatus

replaceNamespacedStatefulSet(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta1NamespacedStatefulSet(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedStatefulSet

replaceNamespacedStatefulSetScale(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta1NamespacedStatefulSetScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedStatefulSetScale

replaceNamespacedStatefulSetStatus(_api::AppsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta1NamespacedStatefulSetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedStatefulSetStatus

watchControllerRevisionListForAllNamespaces(_api::AppsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta1ControllerRevisionListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchControllerRevisionListForAllNamespaces

watchDeploymentListForAllNamespaces(_api::AppsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta1DeploymentListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchDeploymentListForAllNamespaces

watchNamespacedControllerRevision(_api::AppsV1beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta1NamespacedControllerRevision(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedControllerRevision

watchNamespacedControllerRevisionList(_api::AppsV1beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta1NamespacedControllerRevisionList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedControllerRevisionList

watchNamespacedDeployment(_api::AppsV1beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta1NamespacedDeployment(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedDeployment

watchNamespacedDeploymentList(_api::AppsV1beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta1NamespacedDeploymentList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedDeploymentList

watchNamespacedStatefulSet(_api::AppsV1beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta1NamespacedStatefulSet(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedStatefulSet

watchNamespacedStatefulSetList(_api::AppsV1beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta1NamespacedStatefulSetList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedStatefulSetList

watchStatefulSetListForAllNamespaces(_api::AppsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta1StatefulSetListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchStatefulSetListForAllNamespaces

createNamespacedControllerRevision(_api::AppsV1beta2Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAppsV1beta2NamespacedControllerRevision(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedControllerRevision

createNamespacedDaemonSet(_api::AppsV1beta2Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAppsV1beta2NamespacedDaemonSet(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedDaemonSet

createNamespacedDeployment(_api::AppsV1beta2Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAppsV1beta2NamespacedDeployment(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedDeployment

createNamespacedReplicaSet(_api::AppsV1beta2Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAppsV1beta2NamespacedReplicaSet(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedReplicaSet

createNamespacedStatefulSet(_api::AppsV1beta2Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAppsV1beta2NamespacedStatefulSet(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedStatefulSet

deleteCollectionNamespacedControllerRevision(_api::AppsV1beta2Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteAppsV1beta2CollectionNamespacedControllerRevision(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedControllerRevision

deleteCollectionNamespacedDaemonSet(_api::AppsV1beta2Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteAppsV1beta2CollectionNamespacedDaemonSet(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedDaemonSet

deleteCollectionNamespacedDeployment(_api::AppsV1beta2Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteAppsV1beta2CollectionNamespacedDeployment(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedDeployment

deleteCollectionNamespacedReplicaSet(_api::AppsV1beta2Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteAppsV1beta2CollectionNamespacedReplicaSet(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedReplicaSet

deleteCollectionNamespacedStatefulSet(_api::AppsV1beta2Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteAppsV1beta2CollectionNamespacedStatefulSet(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedStatefulSet

deleteNamespacedControllerRevision(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteAppsV1beta2NamespacedControllerRevision(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedControllerRevision

deleteNamespacedDaemonSet(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteAppsV1beta2NamespacedDaemonSet(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedDaemonSet

deleteNamespacedDeployment(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteAppsV1beta2NamespacedDeployment(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedDeployment

deleteNamespacedReplicaSet(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteAppsV1beta2NamespacedReplicaSet(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedReplicaSet

deleteNamespacedStatefulSet(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteAppsV1beta2NamespacedStatefulSet(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedStatefulSet

getAPIResources(_api::AppsV1beta2Api; _mediaType=nothing) = getAppsV1beta2APIResources(_api; _mediaType=_mediaType)
export getAPIResources

listControllerRevisionForAllNamespaces(_api::AppsV1beta2Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta2ControllerRevisionForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listControllerRevisionForAllNamespaces

listDaemonSetForAllNamespaces(_api::AppsV1beta2Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta2DaemonSetForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listDaemonSetForAllNamespaces

listDeploymentForAllNamespaces(_api::AppsV1beta2Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta2DeploymentForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listDeploymentForAllNamespaces

listNamespacedControllerRevision(_api::AppsV1beta2Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta2NamespacedControllerRevision(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedControllerRevision

listNamespacedDaemonSet(_api::AppsV1beta2Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta2NamespacedDaemonSet(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedDaemonSet

listNamespacedDeployment(_api::AppsV1beta2Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta2NamespacedDeployment(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedDeployment

listNamespacedReplicaSet(_api::AppsV1beta2Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta2NamespacedReplicaSet(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedReplicaSet

listNamespacedStatefulSet(_api::AppsV1beta2Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta2NamespacedStatefulSet(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedStatefulSet

listReplicaSetForAllNamespaces(_api::AppsV1beta2Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta2ReplicaSetForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listReplicaSetForAllNamespaces

listStatefulSetForAllNamespaces(_api::AppsV1beta2Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAppsV1beta2StatefulSetForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listStatefulSetForAllNamespaces

patchNamespacedControllerRevision(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta2NamespacedControllerRevision(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedControllerRevision

patchNamespacedDaemonSet(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta2NamespacedDaemonSet(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedDaemonSet

patchNamespacedDaemonSetStatus(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta2NamespacedDaemonSetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedDaemonSetStatus

patchNamespacedDeployment(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta2NamespacedDeployment(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedDeployment

patchNamespacedDeploymentScale(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta2NamespacedDeploymentScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedDeploymentScale

patchNamespacedDeploymentStatus(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta2NamespacedDeploymentStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedDeploymentStatus

patchNamespacedReplicaSet(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta2NamespacedReplicaSet(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedReplicaSet

patchNamespacedReplicaSetScale(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta2NamespacedReplicaSetScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedReplicaSetScale

patchNamespacedReplicaSetStatus(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta2NamespacedReplicaSetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedReplicaSetStatus

patchNamespacedStatefulSet(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta2NamespacedStatefulSet(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedStatefulSet

patchNamespacedStatefulSetScale(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta2NamespacedStatefulSetScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedStatefulSetScale

patchNamespacedStatefulSetStatus(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAppsV1beta2NamespacedStatefulSetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedStatefulSetStatus

readNamespacedControllerRevision(_api::AppsV1beta2Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readAppsV1beta2NamespacedControllerRevision(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedControllerRevision

readNamespacedDaemonSet(_api::AppsV1beta2Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readAppsV1beta2NamespacedDaemonSet(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedDaemonSet

readNamespacedDaemonSetStatus(_api::AppsV1beta2Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAppsV1beta2NamespacedDaemonSetStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedDaemonSetStatus

readNamespacedDeployment(_api::AppsV1beta2Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readAppsV1beta2NamespacedDeployment(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedDeployment

readNamespacedDeploymentScale(_api::AppsV1beta2Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAppsV1beta2NamespacedDeploymentScale(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedDeploymentScale

readNamespacedDeploymentStatus(_api::AppsV1beta2Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAppsV1beta2NamespacedDeploymentStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedDeploymentStatus

readNamespacedReplicaSet(_api::AppsV1beta2Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readAppsV1beta2NamespacedReplicaSet(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedReplicaSet

readNamespacedReplicaSetScale(_api::AppsV1beta2Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAppsV1beta2NamespacedReplicaSetScale(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedReplicaSetScale

readNamespacedReplicaSetStatus(_api::AppsV1beta2Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAppsV1beta2NamespacedReplicaSetStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedReplicaSetStatus

readNamespacedStatefulSet(_api::AppsV1beta2Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readAppsV1beta2NamespacedStatefulSet(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedStatefulSet

readNamespacedStatefulSetScale(_api::AppsV1beta2Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAppsV1beta2NamespacedStatefulSetScale(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedStatefulSetScale

readNamespacedStatefulSetStatus(_api::AppsV1beta2Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAppsV1beta2NamespacedStatefulSetStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedStatefulSetStatus

replaceNamespacedControllerRevision(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta2NamespacedControllerRevision(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedControllerRevision

replaceNamespacedDaemonSet(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta2NamespacedDaemonSet(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedDaemonSet

replaceNamespacedDaemonSetStatus(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta2NamespacedDaemonSetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedDaemonSetStatus

replaceNamespacedDeployment(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta2NamespacedDeployment(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedDeployment

replaceNamespacedDeploymentScale(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta2NamespacedDeploymentScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedDeploymentScale

replaceNamespacedDeploymentStatus(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta2NamespacedDeploymentStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedDeploymentStatus

replaceNamespacedReplicaSet(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta2NamespacedReplicaSet(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedReplicaSet

replaceNamespacedReplicaSetScale(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta2NamespacedReplicaSetScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedReplicaSetScale

replaceNamespacedReplicaSetStatus(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta2NamespacedReplicaSetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedReplicaSetStatus

replaceNamespacedStatefulSet(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta2NamespacedStatefulSet(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedStatefulSet

replaceNamespacedStatefulSetScale(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta2NamespacedStatefulSetScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedStatefulSetScale

replaceNamespacedStatefulSetStatus(_api::AppsV1beta2Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAppsV1beta2NamespacedStatefulSetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedStatefulSetStatus

watchControllerRevisionListForAllNamespaces(_api::AppsV1beta2Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2ControllerRevisionListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchControllerRevisionListForAllNamespaces

watchDaemonSetListForAllNamespaces(_api::AppsV1beta2Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2DaemonSetListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchDaemonSetListForAllNamespaces

watchDeploymentListForAllNamespaces(_api::AppsV1beta2Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2DeploymentListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchDeploymentListForAllNamespaces

watchNamespacedControllerRevision(_api::AppsV1beta2Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2NamespacedControllerRevision(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedControllerRevision

watchNamespacedControllerRevisionList(_api::AppsV1beta2Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2NamespacedControllerRevisionList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedControllerRevisionList

watchNamespacedDaemonSet(_api::AppsV1beta2Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2NamespacedDaemonSet(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedDaemonSet

watchNamespacedDaemonSetList(_api::AppsV1beta2Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2NamespacedDaemonSetList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedDaemonSetList

watchNamespacedDeployment(_api::AppsV1beta2Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2NamespacedDeployment(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedDeployment

watchNamespacedDeploymentList(_api::AppsV1beta2Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2NamespacedDeploymentList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedDeploymentList

watchNamespacedReplicaSet(_api::AppsV1beta2Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2NamespacedReplicaSet(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedReplicaSet

watchNamespacedReplicaSetList(_api::AppsV1beta2Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2NamespacedReplicaSetList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedReplicaSetList

watchNamespacedStatefulSet(_api::AppsV1beta2Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2NamespacedStatefulSet(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedStatefulSet

watchNamespacedStatefulSetList(_api::AppsV1beta2Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2NamespacedStatefulSetList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedStatefulSetList

watchReplicaSetListForAllNamespaces(_api::AppsV1beta2Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2ReplicaSetListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchReplicaSetListForAllNamespaces

watchStatefulSetListForAllNamespaces(_api::AppsV1beta2Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAppsV1beta2StatefulSetListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchStatefulSetListForAllNamespaces

getAPIGroup(_api::AuthenticationApi; _mediaType=nothing) = getAuthenticationAPIGroup(_api; _mediaType=_mediaType)
export getAPIGroup

createTokenReview(_api::AuthenticationV1Api, body; pretty=nothing, _mediaType=nothing) = createAuthenticationV1TokenReview(_api, body; pretty=pretty, _mediaType=_mediaType)
export createTokenReview

getAPIResources(_api::AuthenticationV1Api; _mediaType=nothing) = getAuthenticationV1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

createTokenReview(_api::AuthenticationV1beta1Api, body; pretty=nothing, _mediaType=nothing) = createAuthenticationV1beta1TokenReview(_api, body; pretty=pretty, _mediaType=_mediaType)
export createTokenReview

getAPIResources(_api::AuthenticationV1beta1Api; _mediaType=nothing) = getAuthenticationV1beta1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

getAPIGroup(_api::AuthorizationApi; _mediaType=nothing) = getAuthorizationAPIGroup(_api; _mediaType=_mediaType)
export getAPIGroup

createNamespacedLocalSubjectAccessReview(_api::AuthorizationV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAuthorizationV1NamespacedLocalSubjectAccessReview(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedLocalSubjectAccessReview

createSelfSubjectAccessReview(_api::AuthorizationV1Api, body; pretty=nothing, _mediaType=nothing) = createAuthorizationV1SelfSubjectAccessReview(_api, body; pretty=pretty, _mediaType=_mediaType)
export createSelfSubjectAccessReview

createSelfSubjectRulesReview(_api::AuthorizationV1Api, body; pretty=nothing, _mediaType=nothing) = createAuthorizationV1SelfSubjectRulesReview(_api, body; pretty=pretty, _mediaType=_mediaType)
export createSelfSubjectRulesReview

createSubjectAccessReview(_api::AuthorizationV1Api, body; pretty=nothing, _mediaType=nothing) = createAuthorizationV1SubjectAccessReview(_api, body; pretty=pretty, _mediaType=_mediaType)
export createSubjectAccessReview

getAPIResources(_api::AuthorizationV1Api; _mediaType=nothing) = getAuthorizationV1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

createNamespacedLocalSubjectAccessReview(_api::AuthorizationV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAuthorizationV1beta1NamespacedLocalSubjectAccessReview(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedLocalSubjectAccessReview

createSelfSubjectAccessReview(_api::AuthorizationV1beta1Api, body; pretty=nothing, _mediaType=nothing) = createAuthorizationV1beta1SelfSubjectAccessReview(_api, body; pretty=pretty, _mediaType=_mediaType)
export createSelfSubjectAccessReview

createSelfSubjectRulesReview(_api::AuthorizationV1beta1Api, body; pretty=nothing, _mediaType=nothing) = createAuthorizationV1beta1SelfSubjectRulesReview(_api, body; pretty=pretty, _mediaType=_mediaType)
export createSelfSubjectRulesReview

createSubjectAccessReview(_api::AuthorizationV1beta1Api, body; pretty=nothing, _mediaType=nothing) = createAuthorizationV1beta1SubjectAccessReview(_api, body; pretty=pretty, _mediaType=_mediaType)
export createSubjectAccessReview

getAPIResources(_api::AuthorizationV1beta1Api; _mediaType=nothing) = getAuthorizationV1beta1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

getAPIGroup(_api::AutoscalingApi; _mediaType=nothing) = getAutoscalingAPIGroup(_api; _mediaType=_mediaType)
export getAPIGroup

createNamespacedHorizontalPodAutoscaler(_api::AutoscalingV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAutoscalingV1NamespacedHorizontalPodAutoscaler(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedHorizontalPodAutoscaler

deleteCollectionNamespacedHorizontalPodAutoscaler(_api::AutoscalingV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteAutoscalingV1CollectionNamespacedHorizontalPodAutoscaler(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedHorizontalPodAutoscaler

deleteNamespacedHorizontalPodAutoscaler(_api::AutoscalingV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteAutoscalingV1NamespacedHorizontalPodAutoscaler(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedHorizontalPodAutoscaler

getAPIResources(_api::AutoscalingV1Api; _mediaType=nothing) = getAutoscalingV1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

listHorizontalPodAutoscalerForAllNamespaces(_api::AutoscalingV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAutoscalingV1HorizontalPodAutoscalerForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listHorizontalPodAutoscalerForAllNamespaces

listNamespacedHorizontalPodAutoscaler(_api::AutoscalingV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAutoscalingV1NamespacedHorizontalPodAutoscaler(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedHorizontalPodAutoscaler

patchNamespacedHorizontalPodAutoscaler(_api::AutoscalingV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAutoscalingV1NamespacedHorizontalPodAutoscaler(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedHorizontalPodAutoscaler

patchNamespacedHorizontalPodAutoscalerStatus(_api::AutoscalingV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAutoscalingV1NamespacedHorizontalPodAutoscalerStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedHorizontalPodAutoscalerStatus

readNamespacedHorizontalPodAutoscaler(_api::AutoscalingV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readAutoscalingV1NamespacedHorizontalPodAutoscaler(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedHorizontalPodAutoscaler

readNamespacedHorizontalPodAutoscalerStatus(_api::AutoscalingV1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAutoscalingV1NamespacedHorizontalPodAutoscalerStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedHorizontalPodAutoscalerStatus

replaceNamespacedHorizontalPodAutoscaler(_api::AutoscalingV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAutoscalingV1NamespacedHorizontalPodAutoscaler(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedHorizontalPodAutoscaler

replaceNamespacedHorizontalPodAutoscalerStatus(_api::AutoscalingV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAutoscalingV1NamespacedHorizontalPodAutoscalerStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedHorizontalPodAutoscalerStatus

watchHorizontalPodAutoscalerListForAllNamespaces(_api::AutoscalingV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAutoscalingV1HorizontalPodAutoscalerListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchHorizontalPodAutoscalerListForAllNamespaces

watchNamespacedHorizontalPodAutoscaler(_api::AutoscalingV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAutoscalingV1NamespacedHorizontalPodAutoscaler(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedHorizontalPodAutoscaler

watchNamespacedHorizontalPodAutoscalerList(_api::AutoscalingV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAutoscalingV1NamespacedHorizontalPodAutoscalerList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedHorizontalPodAutoscalerList

createNamespacedHorizontalPodAutoscaler(_api::AutoscalingV2beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createAutoscalingV2beta1NamespacedHorizontalPodAutoscaler(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedHorizontalPodAutoscaler

deleteCollectionNamespacedHorizontalPodAutoscaler(_api::AutoscalingV2beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteAutoscalingV2beta1CollectionNamespacedHorizontalPodAutoscaler(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedHorizontalPodAutoscaler

deleteNamespacedHorizontalPodAutoscaler(_api::AutoscalingV2beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteAutoscalingV2beta1NamespacedHorizontalPodAutoscaler(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedHorizontalPodAutoscaler

getAPIResources(_api::AutoscalingV2beta1Api; _mediaType=nothing) = getAutoscalingV2beta1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

listHorizontalPodAutoscalerForAllNamespaces(_api::AutoscalingV2beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAutoscalingV2beta1HorizontalPodAutoscalerForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listHorizontalPodAutoscalerForAllNamespaces

listNamespacedHorizontalPodAutoscaler(_api::AutoscalingV2beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listAutoscalingV2beta1NamespacedHorizontalPodAutoscaler(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedHorizontalPodAutoscaler

patchNamespacedHorizontalPodAutoscaler(_api::AutoscalingV2beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAutoscalingV2beta1NamespacedHorizontalPodAutoscaler(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedHorizontalPodAutoscaler

patchNamespacedHorizontalPodAutoscalerStatus(_api::AutoscalingV2beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchAutoscalingV2beta1NamespacedHorizontalPodAutoscalerStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedHorizontalPodAutoscalerStatus

readNamespacedHorizontalPodAutoscaler(_api::AutoscalingV2beta1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readAutoscalingV2beta1NamespacedHorizontalPodAutoscaler(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedHorizontalPodAutoscaler

readNamespacedHorizontalPodAutoscalerStatus(_api::AutoscalingV2beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readAutoscalingV2beta1NamespacedHorizontalPodAutoscalerStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedHorizontalPodAutoscalerStatus

replaceNamespacedHorizontalPodAutoscaler(_api::AutoscalingV2beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAutoscalingV2beta1NamespacedHorizontalPodAutoscaler(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedHorizontalPodAutoscaler

replaceNamespacedHorizontalPodAutoscalerStatus(_api::AutoscalingV2beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceAutoscalingV2beta1NamespacedHorizontalPodAutoscalerStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedHorizontalPodAutoscalerStatus

watchHorizontalPodAutoscalerListForAllNamespaces(_api::AutoscalingV2beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAutoscalingV2beta1HorizontalPodAutoscalerListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchHorizontalPodAutoscalerListForAllNamespaces

watchNamespacedHorizontalPodAutoscaler(_api::AutoscalingV2beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAutoscalingV2beta1NamespacedHorizontalPodAutoscaler(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedHorizontalPodAutoscaler

watchNamespacedHorizontalPodAutoscalerList(_api::AutoscalingV2beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchAutoscalingV2beta1NamespacedHorizontalPodAutoscalerList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedHorizontalPodAutoscalerList

getAPIGroup(_api::BatchApi; _mediaType=nothing) = getBatchAPIGroup(_api; _mediaType=_mediaType)
export getAPIGroup

createNamespacedJob(_api::BatchV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createBatchV1NamespacedJob(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedJob

deleteCollectionNamespacedJob(_api::BatchV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteBatchV1CollectionNamespacedJob(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedJob

deleteNamespacedJob(_api::BatchV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteBatchV1NamespacedJob(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedJob

getAPIResources(_api::BatchV1Api; _mediaType=nothing) = getBatchV1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

listJobForAllNamespaces(_api::BatchV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listBatchV1JobForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listJobForAllNamespaces

listNamespacedJob(_api::BatchV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listBatchV1NamespacedJob(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedJob

patchNamespacedJob(_api::BatchV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchBatchV1NamespacedJob(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedJob

patchNamespacedJobStatus(_api::BatchV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchBatchV1NamespacedJobStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedJobStatus

readNamespacedJob(_api::BatchV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readBatchV1NamespacedJob(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedJob

readNamespacedJobStatus(_api::BatchV1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readBatchV1NamespacedJobStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedJobStatus

replaceNamespacedJob(_api::BatchV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceBatchV1NamespacedJob(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedJob

replaceNamespacedJobStatus(_api::BatchV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceBatchV1NamespacedJobStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedJobStatus

watchJobListForAllNamespaces(_api::BatchV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchBatchV1JobListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchJobListForAllNamespaces

watchNamespacedJob(_api::BatchV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchBatchV1NamespacedJob(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedJob

watchNamespacedJobList(_api::BatchV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchBatchV1NamespacedJobList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedJobList

createNamespacedCronJob(_api::BatchV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createBatchV1beta1NamespacedCronJob(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedCronJob

deleteCollectionNamespacedCronJob(_api::BatchV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteBatchV1beta1CollectionNamespacedCronJob(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedCronJob

deleteNamespacedCronJob(_api::BatchV1beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteBatchV1beta1NamespacedCronJob(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedCronJob

getAPIResources(_api::BatchV1beta1Api; _mediaType=nothing) = getBatchV1beta1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

listCronJobForAllNamespaces(_api::BatchV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listBatchV1beta1CronJobForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listCronJobForAllNamespaces

listNamespacedCronJob(_api::BatchV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listBatchV1beta1NamespacedCronJob(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedCronJob

patchNamespacedCronJob(_api::BatchV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchBatchV1beta1NamespacedCronJob(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedCronJob

patchNamespacedCronJobStatus(_api::BatchV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchBatchV1beta1NamespacedCronJobStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedCronJobStatus

readNamespacedCronJob(_api::BatchV1beta1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readBatchV1beta1NamespacedCronJob(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedCronJob

readNamespacedCronJobStatus(_api::BatchV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readBatchV1beta1NamespacedCronJobStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedCronJobStatus

replaceNamespacedCronJob(_api::BatchV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceBatchV1beta1NamespacedCronJob(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedCronJob

replaceNamespacedCronJobStatus(_api::BatchV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceBatchV1beta1NamespacedCronJobStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedCronJobStatus

watchCronJobListForAllNamespaces(_api::BatchV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchBatchV1beta1CronJobListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchCronJobListForAllNamespaces

watchNamespacedCronJob(_api::BatchV1beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchBatchV1beta1NamespacedCronJob(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedCronJob

watchNamespacedCronJobList(_api::BatchV1beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchBatchV1beta1NamespacedCronJobList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedCronJobList

createNamespacedCronJob(_api::BatchV2alpha1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createBatchV2alpha1NamespacedCronJob(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedCronJob

deleteCollectionNamespacedCronJob(_api::BatchV2alpha1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteBatchV2alpha1CollectionNamespacedCronJob(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedCronJob

deleteNamespacedCronJob(_api::BatchV2alpha1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteBatchV2alpha1NamespacedCronJob(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedCronJob

getAPIResources(_api::BatchV2alpha1Api; _mediaType=nothing) = getBatchV2alpha1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

listCronJobForAllNamespaces(_api::BatchV2alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listBatchV2alpha1CronJobForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listCronJobForAllNamespaces

listNamespacedCronJob(_api::BatchV2alpha1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listBatchV2alpha1NamespacedCronJob(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedCronJob

patchNamespacedCronJob(_api::BatchV2alpha1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchBatchV2alpha1NamespacedCronJob(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedCronJob

patchNamespacedCronJobStatus(_api::BatchV2alpha1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchBatchV2alpha1NamespacedCronJobStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedCronJobStatus

readNamespacedCronJob(_api::BatchV2alpha1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readBatchV2alpha1NamespacedCronJob(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedCronJob

readNamespacedCronJobStatus(_api::BatchV2alpha1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readBatchV2alpha1NamespacedCronJobStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedCronJobStatus

replaceNamespacedCronJob(_api::BatchV2alpha1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceBatchV2alpha1NamespacedCronJob(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedCronJob

replaceNamespacedCronJobStatus(_api::BatchV2alpha1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceBatchV2alpha1NamespacedCronJobStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedCronJobStatus

watchCronJobListForAllNamespaces(_api::BatchV2alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchBatchV2alpha1CronJobListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchCronJobListForAllNamespaces

watchNamespacedCronJob(_api::BatchV2alpha1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchBatchV2alpha1NamespacedCronJob(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedCronJob

watchNamespacedCronJobList(_api::BatchV2alpha1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchBatchV2alpha1NamespacedCronJobList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedCronJobList

getAPIGroup(_api::CertificatesApi; _mediaType=nothing) = getCertificatesAPIGroup(_api; _mediaType=_mediaType)
export getAPIGroup

createCertificateSigningRequest(_api::CertificatesV1beta1Api, body; pretty=nothing, _mediaType=nothing) = createCertificatesV1beta1CertificateSigningRequest(_api, body; pretty=pretty, _mediaType=_mediaType)
export createCertificateSigningRequest

deleteCertificateSigningRequest(_api::CertificatesV1beta1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCertificatesV1beta1CertificateSigningRequest(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteCertificateSigningRequest

deleteCollectionCertificateSigningRequest(_api::CertificatesV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCertificatesV1beta1CollectionCertificateSigningRequest(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionCertificateSigningRequest

getAPIResources(_api::CertificatesV1beta1Api; _mediaType=nothing) = getCertificatesV1beta1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

listCertificateSigningRequest(_api::CertificatesV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCertificatesV1beta1CertificateSigningRequest(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listCertificateSigningRequest

patchCertificateSigningRequest(_api::CertificatesV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchCertificatesV1beta1CertificateSigningRequest(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchCertificateSigningRequest

readCertificateSigningRequest(_api::CertificatesV1beta1Api, name::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCertificatesV1beta1CertificateSigningRequest(_api, name; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readCertificateSigningRequest

replaceCertificateSigningRequest(_api::CertificatesV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceCertificatesV1beta1CertificateSigningRequest(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceCertificateSigningRequest

replaceCertificateSigningRequestApproval(_api::CertificatesV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceCertificatesV1beta1CertificateSigningRequestApproval(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceCertificateSigningRequestApproval

replaceCertificateSigningRequestStatus(_api::CertificatesV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceCertificatesV1beta1CertificateSigningRequestStatus(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceCertificateSigningRequestStatus

watchCertificateSigningRequest(_api::CertificatesV1beta1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCertificatesV1beta1CertificateSigningRequest(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchCertificateSigningRequest

watchCertificateSigningRequestList(_api::CertificatesV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCertificatesV1beta1CertificateSigningRequestList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchCertificateSigningRequestList

getAPIVersions(_api::CoreApi; _mediaType=nothing) = getCoreAPIVersions(_api; _mediaType=_mediaType)
export getAPIVersions

connectDeleteNamespacedPodProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1DeleteNamespacedPodProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectDeleteNamespacedPodProxy

connectDeleteNamespacedPodProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1DeleteNamespacedPodProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectDeleteNamespacedPodProxyWithPath

connectDeleteNamespacedServiceProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1DeleteNamespacedServiceProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectDeleteNamespacedServiceProxy

connectDeleteNamespacedServiceProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1DeleteNamespacedServiceProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectDeleteNamespacedServiceProxyWithPath

connectDeleteNodeProxy(_api::CoreV1Api, name::String; path=nothing, _mediaType=nothing) = connectCoreV1DeleteNodeProxy(_api, name; path=path, _mediaType=_mediaType)
export connectDeleteNodeProxy

connectDeleteNodeProxyWithPath(_api::CoreV1Api, name::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1DeleteNodeProxyWithPath(_api, name, path; path2=path2, _mediaType=_mediaType)
export connectDeleteNodeProxyWithPath

connectGetNamespacedPodAttach(_api::CoreV1Api, name::String, namespace::String; container=nothing, stderr=nothing, stdin=nothing, stdout=nothing, tty=nothing, _mediaType=nothing) = connectCoreV1GetNamespacedPodAttach(_api, name, namespace; container=container, stderr=stderr, stdin=stdin, stdout=stdout, tty=tty, _mediaType=_mediaType)
export connectGetNamespacedPodAttach

connectGetNamespacedPodExec(_api::CoreV1Api, name::String, namespace::String; command=nothing, container=nothing, stderr=nothing, stdin=nothing, stdout=nothing, tty=nothing, _mediaType=nothing) = connectCoreV1GetNamespacedPodExec(_api, name, namespace; command=command, container=container, stderr=stderr, stdin=stdin, stdout=stdout, tty=tty, _mediaType=_mediaType)
export connectGetNamespacedPodExec

connectGetNamespacedPodPortforward(_api::CoreV1Api, name::String, namespace::String; ports=nothing, _mediaType=nothing) = connectCoreV1GetNamespacedPodPortforward(_api, name, namespace; ports=ports, _mediaType=_mediaType)
export connectGetNamespacedPodPortforward

connectGetNamespacedPodProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1GetNamespacedPodProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectGetNamespacedPodProxy

connectGetNamespacedPodProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1GetNamespacedPodProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectGetNamespacedPodProxyWithPath

connectGetNamespacedServiceProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1GetNamespacedServiceProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectGetNamespacedServiceProxy

connectGetNamespacedServiceProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1GetNamespacedServiceProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectGetNamespacedServiceProxyWithPath

connectGetNodeProxy(_api::CoreV1Api, name::String; path=nothing, _mediaType=nothing) = connectCoreV1GetNodeProxy(_api, name; path=path, _mediaType=_mediaType)
export connectGetNodeProxy

connectGetNodeProxyWithPath(_api::CoreV1Api, name::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1GetNodeProxyWithPath(_api, name, path; path2=path2, _mediaType=_mediaType)
export connectGetNodeProxyWithPath

connectHeadNamespacedPodProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1HeadNamespacedPodProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectHeadNamespacedPodProxy

connectHeadNamespacedPodProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1HeadNamespacedPodProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectHeadNamespacedPodProxyWithPath

connectHeadNamespacedServiceProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1HeadNamespacedServiceProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectHeadNamespacedServiceProxy

connectHeadNamespacedServiceProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1HeadNamespacedServiceProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectHeadNamespacedServiceProxyWithPath

connectHeadNodeProxy(_api::CoreV1Api, name::String; path=nothing, _mediaType=nothing) = connectCoreV1HeadNodeProxy(_api, name; path=path, _mediaType=_mediaType)
export connectHeadNodeProxy

connectHeadNodeProxyWithPath(_api::CoreV1Api, name::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1HeadNodeProxyWithPath(_api, name, path; path2=path2, _mediaType=_mediaType)
export connectHeadNodeProxyWithPath

connectOptionsNamespacedPodProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1OptionsNamespacedPodProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectOptionsNamespacedPodProxy

connectOptionsNamespacedPodProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1OptionsNamespacedPodProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectOptionsNamespacedPodProxyWithPath

connectOptionsNamespacedServiceProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1OptionsNamespacedServiceProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectOptionsNamespacedServiceProxy

connectOptionsNamespacedServiceProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1OptionsNamespacedServiceProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectOptionsNamespacedServiceProxyWithPath

connectOptionsNodeProxy(_api::CoreV1Api, name::String; path=nothing, _mediaType=nothing) = connectCoreV1OptionsNodeProxy(_api, name; path=path, _mediaType=_mediaType)
export connectOptionsNodeProxy

connectOptionsNodeProxyWithPath(_api::CoreV1Api, name::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1OptionsNodeProxyWithPath(_api, name, path; path2=path2, _mediaType=_mediaType)
export connectOptionsNodeProxyWithPath

connectPatchNamespacedPodProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1PatchNamespacedPodProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectPatchNamespacedPodProxy

connectPatchNamespacedPodProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1PatchNamespacedPodProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectPatchNamespacedPodProxyWithPath

connectPatchNamespacedServiceProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1PatchNamespacedServiceProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectPatchNamespacedServiceProxy

connectPatchNamespacedServiceProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1PatchNamespacedServiceProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectPatchNamespacedServiceProxyWithPath

connectPatchNodeProxy(_api::CoreV1Api, name::String; path=nothing, _mediaType=nothing) = connectCoreV1PatchNodeProxy(_api, name; path=path, _mediaType=_mediaType)
export connectPatchNodeProxy

connectPatchNodeProxyWithPath(_api::CoreV1Api, name::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1PatchNodeProxyWithPath(_api, name, path; path2=path2, _mediaType=_mediaType)
export connectPatchNodeProxyWithPath

connectPostNamespacedPodAttach(_api::CoreV1Api, name::String, namespace::String; container=nothing, stderr=nothing, stdin=nothing, stdout=nothing, tty=nothing, _mediaType=nothing) = connectCoreV1PostNamespacedPodAttach(_api, name, namespace; container=container, stderr=stderr, stdin=stdin, stdout=stdout, tty=tty, _mediaType=_mediaType)
export connectPostNamespacedPodAttach

connectPostNamespacedPodExec(_api::CoreV1Api, name::String, namespace::String; command=nothing, container=nothing, stderr=nothing, stdin=nothing, stdout=nothing, tty=nothing, _mediaType=nothing) = connectCoreV1PostNamespacedPodExec(_api, name, namespace; command=command, container=container, stderr=stderr, stdin=stdin, stdout=stdout, tty=tty, _mediaType=_mediaType)
export connectPostNamespacedPodExec

connectPostNamespacedPodPortforward(_api::CoreV1Api, name::String, namespace::String; ports=nothing, _mediaType=nothing) = connectCoreV1PostNamespacedPodPortforward(_api, name, namespace; ports=ports, _mediaType=_mediaType)
export connectPostNamespacedPodPortforward

connectPostNamespacedPodProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1PostNamespacedPodProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectPostNamespacedPodProxy

connectPostNamespacedPodProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1PostNamespacedPodProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectPostNamespacedPodProxyWithPath

connectPostNamespacedServiceProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1PostNamespacedServiceProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectPostNamespacedServiceProxy

connectPostNamespacedServiceProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1PostNamespacedServiceProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectPostNamespacedServiceProxyWithPath

connectPostNodeProxy(_api::CoreV1Api, name::String; path=nothing, _mediaType=nothing) = connectCoreV1PostNodeProxy(_api, name; path=path, _mediaType=_mediaType)
export connectPostNodeProxy

connectPostNodeProxyWithPath(_api::CoreV1Api, name::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1PostNodeProxyWithPath(_api, name, path; path2=path2, _mediaType=_mediaType)
export connectPostNodeProxyWithPath

connectPutNamespacedPodProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1PutNamespacedPodProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectPutNamespacedPodProxy

connectPutNamespacedPodProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1PutNamespacedPodProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectPutNamespacedPodProxyWithPath

connectPutNamespacedServiceProxy(_api::CoreV1Api, name::String, namespace::String; path=nothing, _mediaType=nothing) = connectCoreV1PutNamespacedServiceProxy(_api, name, namespace; path=path, _mediaType=_mediaType)
export connectPutNamespacedServiceProxy

connectPutNamespacedServiceProxyWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1PutNamespacedServiceProxyWithPath(_api, name, namespace, path; path2=path2, _mediaType=_mediaType)
export connectPutNamespacedServiceProxyWithPath

connectPutNodeProxy(_api::CoreV1Api, name::String; path=nothing, _mediaType=nothing) = connectCoreV1PutNodeProxy(_api, name; path=path, _mediaType=_mediaType)
export connectPutNodeProxy

connectPutNodeProxyWithPath(_api::CoreV1Api, name::String, path::String; path2=nothing, _mediaType=nothing) = connectCoreV1PutNodeProxyWithPath(_api, name, path; path2=path2, _mediaType=_mediaType)
export connectPutNodeProxyWithPath

createNamespace(_api::CoreV1Api, body; pretty=nothing, _mediaType=nothing) = createCoreV1Namespace(_api, body; pretty=pretty, _mediaType=_mediaType)
export createNamespace

createNamespacedBinding(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedBinding(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedBinding

createNamespacedConfigMap(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedConfigMap(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedConfigMap

createNamespacedEndpoints(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedEndpoints(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedEndpoints

createNamespacedEvent(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedEvent(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedEvent

createNamespacedLimitRange(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedLimitRange(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedLimitRange

createNamespacedPersistentVolumeClaim(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedPersistentVolumeClaim(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedPersistentVolumeClaim

createNamespacedPod(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedPod(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedPod

createNamespacedPodBinding(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedPodBinding(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedPodBinding

createNamespacedPodEviction(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedPodEviction(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedPodEviction

createNamespacedPodTemplate(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedPodTemplate(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedPodTemplate

createNamespacedReplicationController(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedReplicationController(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedReplicationController

createNamespacedResourceQuota(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedResourceQuota(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedResourceQuota

createNamespacedSecret(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedSecret(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedSecret

createNamespacedService(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedService(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedService

createNamespacedServiceAccount(_api::CoreV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createCoreV1NamespacedServiceAccount(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedServiceAccount

createNode(_api::CoreV1Api, body; pretty=nothing, _mediaType=nothing) = createCoreV1Node(_api, body; pretty=pretty, _mediaType=_mediaType)
export createNode

createPersistentVolume(_api::CoreV1Api, body; pretty=nothing, _mediaType=nothing) = createCoreV1PersistentVolume(_api, body; pretty=pretty, _mediaType=_mediaType)
export createPersistentVolume

deleteCollectionNamespacedConfigMap(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionNamespacedConfigMap(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedConfigMap

deleteCollectionNamespacedEndpoints(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionNamespacedEndpoints(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedEndpoints

deleteCollectionNamespacedEvent(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionNamespacedEvent(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedEvent

deleteCollectionNamespacedLimitRange(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionNamespacedLimitRange(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedLimitRange

deleteCollectionNamespacedPersistentVolumeClaim(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionNamespacedPersistentVolumeClaim(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedPersistentVolumeClaim

deleteCollectionNamespacedPod(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionNamespacedPod(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedPod

deleteCollectionNamespacedPodTemplate(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionNamespacedPodTemplate(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedPodTemplate

deleteCollectionNamespacedReplicationController(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionNamespacedReplicationController(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedReplicationController

deleteCollectionNamespacedResourceQuota(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionNamespacedResourceQuota(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedResourceQuota

deleteCollectionNamespacedSecret(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionNamespacedSecret(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedSecret

deleteCollectionNamespacedServiceAccount(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionNamespacedServiceAccount(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedServiceAccount

deleteCollectionNode(_api::CoreV1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionNode(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNode

deleteCollectionPersistentVolume(_api::CoreV1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteCoreV1CollectionPersistentVolume(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionPersistentVolume

deleteNamespace(_api::CoreV1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1Namespace(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespace

deleteNamespacedConfigMap(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1NamespacedConfigMap(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedConfigMap

deleteNamespacedEndpoints(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1NamespacedEndpoints(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedEndpoints

deleteNamespacedEvent(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1NamespacedEvent(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedEvent

deleteNamespacedLimitRange(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1NamespacedLimitRange(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedLimitRange

deleteNamespacedPersistentVolumeClaim(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1NamespacedPersistentVolumeClaim(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedPersistentVolumeClaim

deleteNamespacedPod(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1NamespacedPod(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedPod

deleteNamespacedPodTemplate(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1NamespacedPodTemplate(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedPodTemplate

deleteNamespacedReplicationController(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1NamespacedReplicationController(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedReplicationController

deleteNamespacedResourceQuota(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1NamespacedResourceQuota(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedResourceQuota

deleteNamespacedSecret(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1NamespacedSecret(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedSecret

deleteNamespacedService(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = deleteCoreV1NamespacedService(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export deleteNamespacedService

deleteNamespacedServiceAccount(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1NamespacedServiceAccount(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedServiceAccount

deleteNode(_api::CoreV1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1Node(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNode

deletePersistentVolume(_api::CoreV1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteCoreV1PersistentVolume(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deletePersistentVolume

getAPIResources(_api::CoreV1Api; _mediaType=nothing) = getCoreV1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

listComponentStatus(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1ComponentStatus(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listComponentStatus

listConfigMapForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1ConfigMapForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listConfigMapForAllNamespaces

listEndpointsForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1EndpointsForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listEndpointsForAllNamespaces

listEventForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1EventForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listEventForAllNamespaces

listLimitRangeForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1LimitRangeForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listLimitRangeForAllNamespaces

listNamespace(_api::CoreV1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1Namespace(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespace

listNamespacedConfigMap(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1NamespacedConfigMap(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedConfigMap

listNamespacedEndpoints(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1NamespacedEndpoints(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedEndpoints

listNamespacedEvent(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1NamespacedEvent(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedEvent

listNamespacedLimitRange(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1NamespacedLimitRange(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedLimitRange

listNamespacedPersistentVolumeClaim(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1NamespacedPersistentVolumeClaim(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedPersistentVolumeClaim

listNamespacedPod(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1NamespacedPod(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedPod

listNamespacedPodTemplate(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1NamespacedPodTemplate(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedPodTemplate

listNamespacedReplicationController(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1NamespacedReplicationController(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedReplicationController

listNamespacedResourceQuota(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1NamespacedResourceQuota(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedResourceQuota

listNamespacedSecret(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1NamespacedSecret(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedSecret

listNamespacedService(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1NamespacedService(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedService

listNamespacedServiceAccount(_api::CoreV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1NamespacedServiceAccount(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedServiceAccount

listNode(_api::CoreV1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1Node(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNode

listPersistentVolume(_api::CoreV1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1PersistentVolume(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listPersistentVolume

listPersistentVolumeClaimForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1PersistentVolumeClaimForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listPersistentVolumeClaimForAllNamespaces

listPodForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1PodForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listPodForAllNamespaces

listPodTemplateForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1PodTemplateForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listPodTemplateForAllNamespaces

listReplicationControllerForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1ReplicationControllerForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listReplicationControllerForAllNamespaces

listResourceQuotaForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1ResourceQuotaForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listResourceQuotaForAllNamespaces

listSecretForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1SecretForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listSecretForAllNamespaces

listServiceAccountForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1ServiceAccountForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listServiceAccountForAllNamespaces

listServiceForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listCoreV1ServiceForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listServiceForAllNamespaces

patchNamespace(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1Namespace(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespace

patchNamespaceStatus(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespaceStatus(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespaceStatus

patchNamespacedConfigMap(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedConfigMap(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedConfigMap

patchNamespacedEndpoints(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedEndpoints(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedEndpoints

patchNamespacedEvent(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedEvent(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedEvent

patchNamespacedLimitRange(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedLimitRange(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedLimitRange

patchNamespacedPersistentVolumeClaim(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedPersistentVolumeClaim(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedPersistentVolumeClaim

patchNamespacedPersistentVolumeClaimStatus(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedPersistentVolumeClaimStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedPersistentVolumeClaimStatus

patchNamespacedPod(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedPod(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedPod

patchNamespacedPodStatus(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedPodStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedPodStatus

patchNamespacedPodTemplate(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedPodTemplate(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedPodTemplate

patchNamespacedReplicationController(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedReplicationController(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedReplicationController

patchNamespacedReplicationControllerScale(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedReplicationControllerScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedReplicationControllerScale

patchNamespacedReplicationControllerStatus(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedReplicationControllerStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedReplicationControllerStatus

patchNamespacedResourceQuota(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedResourceQuota(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedResourceQuota

patchNamespacedResourceQuotaStatus(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedResourceQuotaStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedResourceQuotaStatus

patchNamespacedSecret(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedSecret(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedSecret

patchNamespacedService(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedService(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedService

patchNamespacedServiceAccount(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedServiceAccount(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedServiceAccount

patchNamespacedServiceStatus(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NamespacedServiceStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedServiceStatus

patchNode(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1Node(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchNode

patchNodeStatus(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1NodeStatus(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchNodeStatus

patchPersistentVolume(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1PersistentVolume(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchPersistentVolume

patchPersistentVolumeStatus(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchCoreV1PersistentVolumeStatus(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchPersistentVolumeStatus

proxyDELETENamespacedPod(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1DELETENamespacedPod(_api, name, namespace; _mediaType=_mediaType)
export proxyDELETENamespacedPod

proxyDELETENamespacedPodWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1DELETENamespacedPodWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyDELETENamespacedPodWithPath

proxyDELETENamespacedService(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1DELETENamespacedService(_api, name, namespace; _mediaType=_mediaType)
export proxyDELETENamespacedService

proxyDELETENamespacedServiceWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1DELETENamespacedServiceWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyDELETENamespacedServiceWithPath

proxyDELETENode(_api::CoreV1Api, name::String; _mediaType=nothing) = proxyCoreV1DELETENode(_api, name; _mediaType=_mediaType)
export proxyDELETENode

proxyDELETENodeWithPath(_api::CoreV1Api, name::String, path::String; _mediaType=nothing) = proxyCoreV1DELETENodeWithPath(_api, name, path; _mediaType=_mediaType)
export proxyDELETENodeWithPath

proxyGETNamespacedPod(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1GETNamespacedPod(_api, name, namespace; _mediaType=_mediaType)
export proxyGETNamespacedPod

proxyGETNamespacedPodWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1GETNamespacedPodWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyGETNamespacedPodWithPath

proxyGETNamespacedService(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1GETNamespacedService(_api, name, namespace; _mediaType=_mediaType)
export proxyGETNamespacedService

proxyGETNamespacedServiceWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1GETNamespacedServiceWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyGETNamespacedServiceWithPath

proxyGETNode(_api::CoreV1Api, name::String; _mediaType=nothing) = proxyCoreV1GETNode(_api, name; _mediaType=_mediaType)
export proxyGETNode

proxyGETNodeWithPath(_api::CoreV1Api, name::String, path::String; _mediaType=nothing) = proxyCoreV1GETNodeWithPath(_api, name, path; _mediaType=_mediaType)
export proxyGETNodeWithPath

proxyHEADNamespacedPod(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1HEADNamespacedPod(_api, name, namespace; _mediaType=_mediaType)
export proxyHEADNamespacedPod

proxyHEADNamespacedPodWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1HEADNamespacedPodWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyHEADNamespacedPodWithPath

proxyHEADNamespacedService(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1HEADNamespacedService(_api, name, namespace; _mediaType=_mediaType)
export proxyHEADNamespacedService

proxyHEADNamespacedServiceWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1HEADNamespacedServiceWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyHEADNamespacedServiceWithPath

proxyHEADNode(_api::CoreV1Api, name::String; _mediaType=nothing) = proxyCoreV1HEADNode(_api, name; _mediaType=_mediaType)
export proxyHEADNode

proxyHEADNodeWithPath(_api::CoreV1Api, name::String, path::String; _mediaType=nothing) = proxyCoreV1HEADNodeWithPath(_api, name, path; _mediaType=_mediaType)
export proxyHEADNodeWithPath

proxyOPTIONSNamespacedPod(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1OPTIONSNamespacedPod(_api, name, namespace; _mediaType=_mediaType)
export proxyOPTIONSNamespacedPod

proxyOPTIONSNamespacedPodWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1OPTIONSNamespacedPodWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyOPTIONSNamespacedPodWithPath

proxyOPTIONSNamespacedService(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1OPTIONSNamespacedService(_api, name, namespace; _mediaType=_mediaType)
export proxyOPTIONSNamespacedService

proxyOPTIONSNamespacedServiceWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1OPTIONSNamespacedServiceWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyOPTIONSNamespacedServiceWithPath

proxyOPTIONSNode(_api::CoreV1Api, name::String; _mediaType=nothing) = proxyCoreV1OPTIONSNode(_api, name; _mediaType=_mediaType)
export proxyOPTIONSNode

proxyOPTIONSNodeWithPath(_api::CoreV1Api, name::String, path::String; _mediaType=nothing) = proxyCoreV1OPTIONSNodeWithPath(_api, name, path; _mediaType=_mediaType)
export proxyOPTIONSNodeWithPath

proxyPATCHNamespacedPod(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1PATCHNamespacedPod(_api, name, namespace; _mediaType=_mediaType)
export proxyPATCHNamespacedPod

proxyPATCHNamespacedPodWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1PATCHNamespacedPodWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyPATCHNamespacedPodWithPath

proxyPATCHNamespacedService(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1PATCHNamespacedService(_api, name, namespace; _mediaType=_mediaType)
export proxyPATCHNamespacedService

proxyPATCHNamespacedServiceWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1PATCHNamespacedServiceWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyPATCHNamespacedServiceWithPath

proxyPATCHNode(_api::CoreV1Api, name::String; _mediaType=nothing) = proxyCoreV1PATCHNode(_api, name; _mediaType=_mediaType)
export proxyPATCHNode

proxyPATCHNodeWithPath(_api::CoreV1Api, name::String, path::String; _mediaType=nothing) = proxyCoreV1PATCHNodeWithPath(_api, name, path; _mediaType=_mediaType)
export proxyPATCHNodeWithPath

proxyPOSTNamespacedPod(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1POSTNamespacedPod(_api, name, namespace; _mediaType=_mediaType)
export proxyPOSTNamespacedPod

proxyPOSTNamespacedPodWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1POSTNamespacedPodWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyPOSTNamespacedPodWithPath

proxyPOSTNamespacedService(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1POSTNamespacedService(_api, name, namespace; _mediaType=_mediaType)
export proxyPOSTNamespacedService

proxyPOSTNamespacedServiceWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1POSTNamespacedServiceWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyPOSTNamespacedServiceWithPath

proxyPOSTNode(_api::CoreV1Api, name::String; _mediaType=nothing) = proxyCoreV1POSTNode(_api, name; _mediaType=_mediaType)
export proxyPOSTNode

proxyPOSTNodeWithPath(_api::CoreV1Api, name::String, path::String; _mediaType=nothing) = proxyCoreV1POSTNodeWithPath(_api, name, path; _mediaType=_mediaType)
export proxyPOSTNodeWithPath

proxyPUTNamespacedPod(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1PUTNamespacedPod(_api, name, namespace; _mediaType=_mediaType)
export proxyPUTNamespacedPod

proxyPUTNamespacedPodWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1PUTNamespacedPodWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyPUTNamespacedPodWithPath

proxyPUTNamespacedService(_api::CoreV1Api, name::String, namespace::String; _mediaType=nothing) = proxyCoreV1PUTNamespacedService(_api, name, namespace; _mediaType=_mediaType)
export proxyPUTNamespacedService

proxyPUTNamespacedServiceWithPath(_api::CoreV1Api, name::String, namespace::String, path::String; _mediaType=nothing) = proxyCoreV1PUTNamespacedServiceWithPath(_api, name, namespace, path; _mediaType=_mediaType)
export proxyPUTNamespacedServiceWithPath

proxyPUTNode(_api::CoreV1Api, name::String; _mediaType=nothing) = proxyCoreV1PUTNode(_api, name; _mediaType=_mediaType)
export proxyPUTNode

proxyPUTNodeWithPath(_api::CoreV1Api, name::String, path::String; _mediaType=nothing) = proxyCoreV1PUTNodeWithPath(_api, name, path; _mediaType=_mediaType)
export proxyPUTNodeWithPath

readComponentStatus(_api::CoreV1Api, name::String; pretty=nothing, _mediaType=nothing) = readCoreV1ComponentStatus(_api, name; pretty=pretty, _mediaType=_mediaType)
export readComponentStatus

readNamespace(_api::CoreV1Api, name::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1Namespace(_api, name; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespace

readNamespaceStatus(_api::CoreV1Api, name::String; pretty=nothing, _mediaType=nothing) = readCoreV1NamespaceStatus(_api, name; pretty=pretty, _mediaType=_mediaType)
export readNamespaceStatus

readNamespacedConfigMap(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1NamespacedConfigMap(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedConfigMap

readNamespacedEndpoints(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1NamespacedEndpoints(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedEndpoints

readNamespacedEvent(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1NamespacedEvent(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedEvent

readNamespacedLimitRange(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1NamespacedLimitRange(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedLimitRange

readNamespacedPersistentVolumeClaim(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1NamespacedPersistentVolumeClaim(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedPersistentVolumeClaim

readNamespacedPersistentVolumeClaimStatus(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readCoreV1NamespacedPersistentVolumeClaimStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedPersistentVolumeClaimStatus

readNamespacedPod(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1NamespacedPod(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedPod

readNamespacedPodLog(_api::CoreV1Api, name::String, namespace::String; container=nothing, follow=nothing, limitBytes=nothing, pretty=nothing, previous=nothing, sinceSeconds=nothing, tailLines=nothing, timestamps=nothing, _mediaType=nothing) = readCoreV1NamespacedPodLog(_api, name, namespace; container=container, follow=follow, limitBytes=limitBytes, pretty=pretty, previous=previous, sinceSeconds=sinceSeconds, tailLines=tailLines, timestamps=timestamps, _mediaType=_mediaType)
export readNamespacedPodLog

readNamespacedPodStatus(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readCoreV1NamespacedPodStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedPodStatus

readNamespacedPodTemplate(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1NamespacedPodTemplate(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedPodTemplate

readNamespacedReplicationController(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1NamespacedReplicationController(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedReplicationController

readNamespacedReplicationControllerScale(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readCoreV1NamespacedReplicationControllerScale(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedReplicationControllerScale

readNamespacedReplicationControllerStatus(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readCoreV1NamespacedReplicationControllerStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedReplicationControllerStatus

readNamespacedResourceQuota(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1NamespacedResourceQuota(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedResourceQuota

readNamespacedResourceQuotaStatus(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readCoreV1NamespacedResourceQuotaStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedResourceQuotaStatus

readNamespacedSecret(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1NamespacedSecret(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedSecret

readNamespacedService(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1NamespacedService(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedService

readNamespacedServiceAccount(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1NamespacedServiceAccount(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedServiceAccount

readNamespacedServiceStatus(_api::CoreV1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readCoreV1NamespacedServiceStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedServiceStatus

readNode(_api::CoreV1Api, name::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1Node(_api, name; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNode

readNodeStatus(_api::CoreV1Api, name::String; pretty=nothing, _mediaType=nothing) = readCoreV1NodeStatus(_api, name; pretty=pretty, _mediaType=_mediaType)
export readNodeStatus

readPersistentVolume(_api::CoreV1Api, name::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readCoreV1PersistentVolume(_api, name; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readPersistentVolume

readPersistentVolumeStatus(_api::CoreV1Api, name::String; pretty=nothing, _mediaType=nothing) = readCoreV1PersistentVolumeStatus(_api, name; pretty=pretty, _mediaType=_mediaType)
export readPersistentVolumeStatus

replaceNamespace(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1Namespace(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespace

replaceNamespaceFinalize(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespaceFinalize(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespaceFinalize

replaceNamespaceStatus(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespaceStatus(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespaceStatus

replaceNamespacedConfigMap(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedConfigMap(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedConfigMap

replaceNamespacedEndpoints(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedEndpoints(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedEndpoints

replaceNamespacedEvent(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedEvent(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedEvent

replaceNamespacedLimitRange(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedLimitRange(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedLimitRange

replaceNamespacedPersistentVolumeClaim(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedPersistentVolumeClaim(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedPersistentVolumeClaim

replaceNamespacedPersistentVolumeClaimStatus(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedPersistentVolumeClaimStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedPersistentVolumeClaimStatus

replaceNamespacedPod(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedPod(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedPod

replaceNamespacedPodStatus(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedPodStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedPodStatus

replaceNamespacedPodTemplate(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedPodTemplate(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedPodTemplate

replaceNamespacedReplicationController(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedReplicationController(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedReplicationController

replaceNamespacedReplicationControllerScale(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedReplicationControllerScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedReplicationControllerScale

replaceNamespacedReplicationControllerStatus(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedReplicationControllerStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedReplicationControllerStatus

replaceNamespacedResourceQuota(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedResourceQuota(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedResourceQuota

replaceNamespacedResourceQuotaStatus(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedResourceQuotaStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedResourceQuotaStatus

replaceNamespacedSecret(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedSecret(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedSecret

replaceNamespacedService(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedService(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedService

replaceNamespacedServiceAccount(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedServiceAccount(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedServiceAccount

replaceNamespacedServiceStatus(_api::CoreV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NamespacedServiceStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedServiceStatus

replaceNode(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1Node(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceNode

replaceNodeStatus(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1NodeStatus(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceNodeStatus

replacePersistentVolume(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1PersistentVolume(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replacePersistentVolume

replacePersistentVolumeStatus(_api::CoreV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceCoreV1PersistentVolumeStatus(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replacePersistentVolumeStatus

watchConfigMapListForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1ConfigMapListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchConfigMapListForAllNamespaces

watchEndpointsListForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1EndpointsListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchEndpointsListForAllNamespaces

watchEventListForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1EventListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchEventListForAllNamespaces

watchLimitRangeListForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1LimitRangeListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchLimitRangeListForAllNamespaces

watchNamespace(_api::CoreV1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1Namespace(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespace

watchNamespaceList(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespaceList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespaceList

watchNamespacedConfigMap(_api::CoreV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedConfigMap(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedConfigMap

watchNamespacedConfigMapList(_api::CoreV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedConfigMapList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedConfigMapList

watchNamespacedEndpoints(_api::CoreV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedEndpoints(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedEndpoints

watchNamespacedEndpointsList(_api::CoreV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedEndpointsList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedEndpointsList

watchNamespacedEvent(_api::CoreV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedEvent(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedEvent

watchNamespacedEventList(_api::CoreV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedEventList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedEventList

watchNamespacedLimitRange(_api::CoreV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedLimitRange(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedLimitRange

watchNamespacedLimitRangeList(_api::CoreV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedLimitRangeList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedLimitRangeList

watchNamespacedPersistentVolumeClaim(_api::CoreV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedPersistentVolumeClaim(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedPersistentVolumeClaim

watchNamespacedPersistentVolumeClaimList(_api::CoreV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedPersistentVolumeClaimList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedPersistentVolumeClaimList

watchNamespacedPod(_api::CoreV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedPod(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedPod

watchNamespacedPodList(_api::CoreV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedPodList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedPodList

watchNamespacedPodTemplate(_api::CoreV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedPodTemplate(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedPodTemplate

watchNamespacedPodTemplateList(_api::CoreV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedPodTemplateList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedPodTemplateList

watchNamespacedReplicationController(_api::CoreV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedReplicationController(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedReplicationController

watchNamespacedReplicationControllerList(_api::CoreV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedReplicationControllerList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedReplicationControllerList

watchNamespacedResourceQuota(_api::CoreV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedResourceQuota(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedResourceQuota

watchNamespacedResourceQuotaList(_api::CoreV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedResourceQuotaList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedResourceQuotaList

watchNamespacedSecret(_api::CoreV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedSecret(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedSecret

watchNamespacedSecretList(_api::CoreV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedSecretList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedSecretList

watchNamespacedService(_api::CoreV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedService(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedService

watchNamespacedServiceAccount(_api::CoreV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedServiceAccount(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedServiceAccount

watchNamespacedServiceAccountList(_api::CoreV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedServiceAccountList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedServiceAccountList

watchNamespacedServiceList(_api::CoreV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NamespacedServiceList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedServiceList

watchNode(_api::CoreV1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1Node(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNode

watchNodeList(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1NodeList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNodeList

watchPersistentVolume(_api::CoreV1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1PersistentVolume(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchPersistentVolume

watchPersistentVolumeClaimListForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1PersistentVolumeClaimListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchPersistentVolumeClaimListForAllNamespaces

watchPersistentVolumeList(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1PersistentVolumeList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchPersistentVolumeList

watchPodListForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1PodListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchPodListForAllNamespaces

watchPodTemplateListForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1PodTemplateListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchPodTemplateListForAllNamespaces

watchReplicationControllerListForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1ReplicationControllerListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchReplicationControllerListForAllNamespaces

watchResourceQuotaListForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1ResourceQuotaListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchResourceQuotaListForAllNamespaces

watchSecretListForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1SecretListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchSecretListForAllNamespaces

watchServiceAccountListForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1ServiceAccountListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchServiceAccountListForAllNamespaces

watchServiceListForAllNamespaces(_api::CoreV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchCoreV1ServiceListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchServiceListForAllNamespaces

getAPIGroup(_api::ExtensionsApi; _mediaType=nothing) = getExtensionsAPIGroup(_api; _mediaType=_mediaType)
export getAPIGroup

createNamespacedDaemonSet(_api::ExtensionsV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createExtensionsV1beta1NamespacedDaemonSet(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedDaemonSet

createNamespacedDeployment(_api::ExtensionsV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createExtensionsV1beta1NamespacedDeployment(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedDeployment

createNamespacedDeploymentRollback(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = createExtensionsV1beta1NamespacedDeploymentRollback(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedDeploymentRollback

createNamespacedIngress(_api::ExtensionsV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createExtensionsV1beta1NamespacedIngress(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedIngress

createNamespacedNetworkPolicy(_api::ExtensionsV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createExtensionsV1beta1NamespacedNetworkPolicy(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedNetworkPolicy

createNamespacedReplicaSet(_api::ExtensionsV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createExtensionsV1beta1NamespacedReplicaSet(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedReplicaSet

createPodSecurityPolicy(_api::ExtensionsV1beta1Api, body; pretty=nothing, _mediaType=nothing) = createExtensionsV1beta1PodSecurityPolicy(_api, body; pretty=pretty, _mediaType=_mediaType)
export createPodSecurityPolicy

deleteCollectionNamespacedDaemonSet(_api::ExtensionsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteExtensionsV1beta1CollectionNamespacedDaemonSet(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedDaemonSet

deleteCollectionNamespacedDeployment(_api::ExtensionsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteExtensionsV1beta1CollectionNamespacedDeployment(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedDeployment

deleteCollectionNamespacedIngress(_api::ExtensionsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteExtensionsV1beta1CollectionNamespacedIngress(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedIngress

deleteCollectionNamespacedNetworkPolicy(_api::ExtensionsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteExtensionsV1beta1CollectionNamespacedNetworkPolicy(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedNetworkPolicy

deleteCollectionNamespacedReplicaSet(_api::ExtensionsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteExtensionsV1beta1CollectionNamespacedReplicaSet(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedReplicaSet

deleteCollectionPodSecurityPolicy(_api::ExtensionsV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteExtensionsV1beta1CollectionPodSecurityPolicy(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionPodSecurityPolicy

deleteNamespacedDaemonSet(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteExtensionsV1beta1NamespacedDaemonSet(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedDaemonSet

deleteNamespacedDeployment(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteExtensionsV1beta1NamespacedDeployment(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedDeployment

deleteNamespacedIngress(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteExtensionsV1beta1NamespacedIngress(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedIngress

deleteNamespacedNetworkPolicy(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteExtensionsV1beta1NamespacedNetworkPolicy(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedNetworkPolicy

deleteNamespacedReplicaSet(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteExtensionsV1beta1NamespacedReplicaSet(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedReplicaSet

deletePodSecurityPolicy(_api::ExtensionsV1beta1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteExtensionsV1beta1PodSecurityPolicy(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deletePodSecurityPolicy

getAPIResources(_api::ExtensionsV1beta1Api; _mediaType=nothing) = getExtensionsV1beta1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

listDaemonSetForAllNamespaces(_api::ExtensionsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listExtensionsV1beta1DaemonSetForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listDaemonSetForAllNamespaces

listDeploymentForAllNamespaces(_api::ExtensionsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listExtensionsV1beta1DeploymentForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listDeploymentForAllNamespaces

listIngressForAllNamespaces(_api::ExtensionsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listExtensionsV1beta1IngressForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listIngressForAllNamespaces

listNamespacedDaemonSet(_api::ExtensionsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listExtensionsV1beta1NamespacedDaemonSet(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedDaemonSet

listNamespacedDeployment(_api::ExtensionsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listExtensionsV1beta1NamespacedDeployment(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedDeployment

listNamespacedIngress(_api::ExtensionsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listExtensionsV1beta1NamespacedIngress(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedIngress

listNamespacedNetworkPolicy(_api::ExtensionsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listExtensionsV1beta1NamespacedNetworkPolicy(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedNetworkPolicy

listNamespacedReplicaSet(_api::ExtensionsV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listExtensionsV1beta1NamespacedReplicaSet(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedReplicaSet

listNetworkPolicyForAllNamespaces(_api::ExtensionsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listExtensionsV1beta1NetworkPolicyForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNetworkPolicyForAllNamespaces

listPodSecurityPolicy(_api::ExtensionsV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listExtensionsV1beta1PodSecurityPolicy(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listPodSecurityPolicy

listReplicaSetForAllNamespaces(_api::ExtensionsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listExtensionsV1beta1ReplicaSetForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listReplicaSetForAllNamespaces

patchNamespacedDaemonSet(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1NamespacedDaemonSet(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedDaemonSet

patchNamespacedDaemonSetStatus(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1NamespacedDaemonSetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedDaemonSetStatus

patchNamespacedDeployment(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1NamespacedDeployment(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedDeployment

patchNamespacedDeploymentScale(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1NamespacedDeploymentScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedDeploymentScale

patchNamespacedDeploymentStatus(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1NamespacedDeploymentStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedDeploymentStatus

patchNamespacedIngress(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1NamespacedIngress(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedIngress

patchNamespacedIngressStatus(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1NamespacedIngressStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedIngressStatus

patchNamespacedNetworkPolicy(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1NamespacedNetworkPolicy(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedNetworkPolicy

patchNamespacedReplicaSet(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1NamespacedReplicaSet(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedReplicaSet

patchNamespacedReplicaSetScale(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1NamespacedReplicaSetScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedReplicaSetScale

patchNamespacedReplicaSetStatus(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1NamespacedReplicaSetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedReplicaSetStatus

patchNamespacedReplicationControllerDummyScale(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1NamespacedReplicationControllerDummyScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedReplicationControllerDummyScale

patchPodSecurityPolicy(_api::ExtensionsV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchExtensionsV1beta1PodSecurityPolicy(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchPodSecurityPolicy

readNamespacedDaemonSet(_api::ExtensionsV1beta1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readExtensionsV1beta1NamespacedDaemonSet(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedDaemonSet

readNamespacedDaemonSetStatus(_api::ExtensionsV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readExtensionsV1beta1NamespacedDaemonSetStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedDaemonSetStatus

readNamespacedDeployment(_api::ExtensionsV1beta1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readExtensionsV1beta1NamespacedDeployment(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedDeployment

readNamespacedDeploymentScale(_api::ExtensionsV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readExtensionsV1beta1NamespacedDeploymentScale(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedDeploymentScale

readNamespacedDeploymentStatus(_api::ExtensionsV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readExtensionsV1beta1NamespacedDeploymentStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedDeploymentStatus

readNamespacedIngress(_api::ExtensionsV1beta1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readExtensionsV1beta1NamespacedIngress(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedIngress

readNamespacedIngressStatus(_api::ExtensionsV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readExtensionsV1beta1NamespacedIngressStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedIngressStatus

readNamespacedNetworkPolicy(_api::ExtensionsV1beta1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readExtensionsV1beta1NamespacedNetworkPolicy(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedNetworkPolicy

readNamespacedReplicaSet(_api::ExtensionsV1beta1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readExtensionsV1beta1NamespacedReplicaSet(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedReplicaSet

readNamespacedReplicaSetScale(_api::ExtensionsV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readExtensionsV1beta1NamespacedReplicaSetScale(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedReplicaSetScale

readNamespacedReplicaSetStatus(_api::ExtensionsV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readExtensionsV1beta1NamespacedReplicaSetStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedReplicaSetStatus

readNamespacedReplicationControllerDummyScale(_api::ExtensionsV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readExtensionsV1beta1NamespacedReplicationControllerDummyScale(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedReplicationControllerDummyScale

readPodSecurityPolicy(_api::ExtensionsV1beta1Api, name::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readExtensionsV1beta1PodSecurityPolicy(_api, name; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readPodSecurityPolicy

replaceNamespacedDaemonSet(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1NamespacedDaemonSet(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedDaemonSet

replaceNamespacedDaemonSetStatus(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1NamespacedDaemonSetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedDaemonSetStatus

replaceNamespacedDeployment(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1NamespacedDeployment(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedDeployment

replaceNamespacedDeploymentScale(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1NamespacedDeploymentScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedDeploymentScale

replaceNamespacedDeploymentStatus(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1NamespacedDeploymentStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedDeploymentStatus

replaceNamespacedIngress(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1NamespacedIngress(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedIngress

replaceNamespacedIngressStatus(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1NamespacedIngressStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedIngressStatus

replaceNamespacedNetworkPolicy(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1NamespacedNetworkPolicy(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedNetworkPolicy

replaceNamespacedReplicaSet(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1NamespacedReplicaSet(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedReplicaSet

replaceNamespacedReplicaSetScale(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1NamespacedReplicaSetScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedReplicaSetScale

replaceNamespacedReplicaSetStatus(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1NamespacedReplicaSetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedReplicaSetStatus

replaceNamespacedReplicationControllerDummyScale(_api::ExtensionsV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1NamespacedReplicationControllerDummyScale(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedReplicationControllerDummyScale

replacePodSecurityPolicy(_api::ExtensionsV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceExtensionsV1beta1PodSecurityPolicy(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replacePodSecurityPolicy

watchDaemonSetListForAllNamespaces(_api::ExtensionsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1DaemonSetListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchDaemonSetListForAllNamespaces

watchDeploymentListForAllNamespaces(_api::ExtensionsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1DeploymentListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchDeploymentListForAllNamespaces

watchIngressListForAllNamespaces(_api::ExtensionsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1IngressListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchIngressListForAllNamespaces

watchNamespacedDaemonSet(_api::ExtensionsV1beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1NamespacedDaemonSet(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedDaemonSet

watchNamespacedDaemonSetList(_api::ExtensionsV1beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1NamespacedDaemonSetList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedDaemonSetList

watchNamespacedDeployment(_api::ExtensionsV1beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1NamespacedDeployment(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedDeployment

watchNamespacedDeploymentList(_api::ExtensionsV1beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1NamespacedDeploymentList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedDeploymentList

watchNamespacedIngress(_api::ExtensionsV1beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1NamespacedIngress(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedIngress

watchNamespacedIngressList(_api::ExtensionsV1beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1NamespacedIngressList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedIngressList

watchNamespacedNetworkPolicy(_api::ExtensionsV1beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1NamespacedNetworkPolicy(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedNetworkPolicy

watchNamespacedNetworkPolicyList(_api::ExtensionsV1beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1NamespacedNetworkPolicyList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedNetworkPolicyList

watchNamespacedReplicaSet(_api::ExtensionsV1beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1NamespacedReplicaSet(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedReplicaSet

watchNamespacedReplicaSetList(_api::ExtensionsV1beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1NamespacedReplicaSetList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedReplicaSetList

watchNetworkPolicyListForAllNamespaces(_api::ExtensionsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1NetworkPolicyListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNetworkPolicyListForAllNamespaces

watchPodSecurityPolicy(_api::ExtensionsV1beta1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1PodSecurityPolicy(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchPodSecurityPolicy

watchPodSecurityPolicyList(_api::ExtensionsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1PodSecurityPolicyList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchPodSecurityPolicyList

watchReplicaSetListForAllNamespaces(_api::ExtensionsV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchExtensionsV1beta1ReplicaSetListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchReplicaSetListForAllNamespaces

getAPIGroup(_api::NetworkingApi; _mediaType=nothing) = getNetworkingAPIGroup(_api; _mediaType=_mediaType)
export getAPIGroup

createNamespacedNetworkPolicy(_api::NetworkingV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createNetworkingV1NamespacedNetworkPolicy(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedNetworkPolicy

deleteCollectionNamespacedNetworkPolicy(_api::NetworkingV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteNetworkingV1CollectionNamespacedNetworkPolicy(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedNetworkPolicy

deleteNamespacedNetworkPolicy(_api::NetworkingV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteNetworkingV1NamespacedNetworkPolicy(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedNetworkPolicy

getAPIResources(_api::NetworkingV1Api; _mediaType=nothing) = getNetworkingV1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

listNamespacedNetworkPolicy(_api::NetworkingV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listNetworkingV1NamespacedNetworkPolicy(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedNetworkPolicy

listNetworkPolicyForAllNamespaces(_api::NetworkingV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listNetworkingV1NetworkPolicyForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNetworkPolicyForAllNamespaces

patchNamespacedNetworkPolicy(_api::NetworkingV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchNetworkingV1NamespacedNetworkPolicy(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedNetworkPolicy

readNamespacedNetworkPolicy(_api::NetworkingV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readNetworkingV1NamespacedNetworkPolicy(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedNetworkPolicy

replaceNamespacedNetworkPolicy(_api::NetworkingV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceNetworkingV1NamespacedNetworkPolicy(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedNetworkPolicy

watchNamespacedNetworkPolicy(_api::NetworkingV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchNetworkingV1NamespacedNetworkPolicy(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedNetworkPolicy

watchNamespacedNetworkPolicyList(_api::NetworkingV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchNetworkingV1NamespacedNetworkPolicyList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedNetworkPolicyList

watchNetworkPolicyListForAllNamespaces(_api::NetworkingV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchNetworkingV1NetworkPolicyListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNetworkPolicyListForAllNamespaces

getAPIGroup(_api::PolicyApi; _mediaType=nothing) = getPolicyAPIGroup(_api; _mediaType=_mediaType)
export getAPIGroup

createNamespacedPodDisruptionBudget(_api::PolicyV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createPolicyV1beta1NamespacedPodDisruptionBudget(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedPodDisruptionBudget

deleteCollectionNamespacedPodDisruptionBudget(_api::PolicyV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deletePolicyV1beta1CollectionNamespacedPodDisruptionBudget(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedPodDisruptionBudget

deleteNamespacedPodDisruptionBudget(_api::PolicyV1beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deletePolicyV1beta1NamespacedPodDisruptionBudget(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedPodDisruptionBudget

getAPIResources(_api::PolicyV1beta1Api; _mediaType=nothing) = getPolicyV1beta1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

listNamespacedPodDisruptionBudget(_api::PolicyV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listPolicyV1beta1NamespacedPodDisruptionBudget(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedPodDisruptionBudget

listPodDisruptionBudgetForAllNamespaces(_api::PolicyV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listPolicyV1beta1PodDisruptionBudgetForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listPodDisruptionBudgetForAllNamespaces

patchNamespacedPodDisruptionBudget(_api::PolicyV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchPolicyV1beta1NamespacedPodDisruptionBudget(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedPodDisruptionBudget

patchNamespacedPodDisruptionBudgetStatus(_api::PolicyV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchPolicyV1beta1NamespacedPodDisruptionBudgetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedPodDisruptionBudgetStatus

readNamespacedPodDisruptionBudget(_api::PolicyV1beta1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readPolicyV1beta1NamespacedPodDisruptionBudget(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedPodDisruptionBudget

readNamespacedPodDisruptionBudgetStatus(_api::PolicyV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readPolicyV1beta1NamespacedPodDisruptionBudgetStatus(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedPodDisruptionBudgetStatus

replaceNamespacedPodDisruptionBudget(_api::PolicyV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replacePolicyV1beta1NamespacedPodDisruptionBudget(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedPodDisruptionBudget

replaceNamespacedPodDisruptionBudgetStatus(_api::PolicyV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replacePolicyV1beta1NamespacedPodDisruptionBudgetStatus(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedPodDisruptionBudgetStatus

watchNamespacedPodDisruptionBudget(_api::PolicyV1beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchPolicyV1beta1NamespacedPodDisruptionBudget(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedPodDisruptionBudget

watchNamespacedPodDisruptionBudgetList(_api::PolicyV1beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchPolicyV1beta1NamespacedPodDisruptionBudgetList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedPodDisruptionBudgetList

watchPodDisruptionBudgetListForAllNamespaces(_api::PolicyV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchPolicyV1beta1PodDisruptionBudgetListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchPodDisruptionBudgetListForAllNamespaces

getAPIGroup(_api::RbacAuthorizationApi; _mediaType=nothing) = getRbacAuthorizationAPIGroup(_api; _mediaType=_mediaType)
export getAPIGroup

createClusterRole(_api::RbacAuthorizationV1alpha1Api, body; pretty=nothing, _mediaType=nothing) = createRbacAuthorizationV1alpha1ClusterRole(_api, body; pretty=pretty, _mediaType=_mediaType)
export createClusterRole

createClusterRoleBinding(_api::RbacAuthorizationV1alpha1Api, body; pretty=nothing, _mediaType=nothing) = createRbacAuthorizationV1alpha1ClusterRoleBinding(_api, body; pretty=pretty, _mediaType=_mediaType)
export createClusterRoleBinding

createNamespacedRole(_api::RbacAuthorizationV1alpha1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createRbacAuthorizationV1alpha1NamespacedRole(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedRole

createNamespacedRoleBinding(_api::RbacAuthorizationV1alpha1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createRbacAuthorizationV1alpha1NamespacedRoleBinding(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedRoleBinding

deleteClusterRole(_api::RbacAuthorizationV1alpha1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1alpha1ClusterRole(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteClusterRole

deleteClusterRoleBinding(_api::RbacAuthorizationV1alpha1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1alpha1ClusterRoleBinding(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteClusterRoleBinding

deleteCollectionClusterRole(_api::RbacAuthorizationV1alpha1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1alpha1CollectionClusterRole(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionClusterRole

deleteCollectionClusterRoleBinding(_api::RbacAuthorizationV1alpha1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1alpha1CollectionClusterRoleBinding(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionClusterRoleBinding

deleteCollectionNamespacedRole(_api::RbacAuthorizationV1alpha1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1alpha1CollectionNamespacedRole(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedRole

deleteCollectionNamespacedRoleBinding(_api::RbacAuthorizationV1alpha1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1alpha1CollectionNamespacedRoleBinding(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedRoleBinding

deleteNamespacedRole(_api::RbacAuthorizationV1alpha1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1alpha1NamespacedRole(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedRole

deleteNamespacedRoleBinding(_api::RbacAuthorizationV1alpha1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1alpha1NamespacedRoleBinding(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedRoleBinding

getAPIResources(_api::RbacAuthorizationV1alpha1Api; _mediaType=nothing) = getRbacAuthorizationV1alpha1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

listClusterRole(_api::RbacAuthorizationV1alpha1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1alpha1ClusterRole(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listClusterRole

listClusterRoleBinding(_api::RbacAuthorizationV1alpha1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1alpha1ClusterRoleBinding(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listClusterRoleBinding

listNamespacedRole(_api::RbacAuthorizationV1alpha1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1alpha1NamespacedRole(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedRole

listNamespacedRoleBinding(_api::RbacAuthorizationV1alpha1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1alpha1NamespacedRoleBinding(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedRoleBinding

listRoleBindingForAllNamespaces(_api::RbacAuthorizationV1alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1alpha1RoleBindingForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listRoleBindingForAllNamespaces

listRoleForAllNamespaces(_api::RbacAuthorizationV1alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1alpha1RoleForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listRoleForAllNamespaces

patchClusterRole(_api::RbacAuthorizationV1alpha1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchRbacAuthorizationV1alpha1ClusterRole(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchClusterRole

patchClusterRoleBinding(_api::RbacAuthorizationV1alpha1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchRbacAuthorizationV1alpha1ClusterRoleBinding(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchClusterRoleBinding

patchNamespacedRole(_api::RbacAuthorizationV1alpha1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchRbacAuthorizationV1alpha1NamespacedRole(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedRole

patchNamespacedRoleBinding(_api::RbacAuthorizationV1alpha1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchRbacAuthorizationV1alpha1NamespacedRoleBinding(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedRoleBinding

readClusterRole(_api::RbacAuthorizationV1alpha1Api, name::String; pretty=nothing, _mediaType=nothing) = readRbacAuthorizationV1alpha1ClusterRole(_api, name; pretty=pretty, _mediaType=_mediaType)
export readClusterRole

readClusterRoleBinding(_api::RbacAuthorizationV1alpha1Api, name::String; pretty=nothing, _mediaType=nothing) = readRbacAuthorizationV1alpha1ClusterRoleBinding(_api, name; pretty=pretty, _mediaType=_mediaType)
export readClusterRoleBinding

readNamespacedRole(_api::RbacAuthorizationV1alpha1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readRbacAuthorizationV1alpha1NamespacedRole(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedRole

readNamespacedRoleBinding(_api::RbacAuthorizationV1alpha1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readRbacAuthorizationV1alpha1NamespacedRoleBinding(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedRoleBinding

replaceClusterRole(_api::RbacAuthorizationV1alpha1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceRbacAuthorizationV1alpha1ClusterRole(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceClusterRole

replaceClusterRoleBinding(_api::RbacAuthorizationV1alpha1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceRbacAuthorizationV1alpha1ClusterRoleBinding(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceClusterRoleBinding

replaceNamespacedRole(_api::RbacAuthorizationV1alpha1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceRbacAuthorizationV1alpha1NamespacedRole(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedRole

replaceNamespacedRoleBinding(_api::RbacAuthorizationV1alpha1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceRbacAuthorizationV1alpha1NamespacedRoleBinding(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedRoleBinding

watchClusterRole(_api::RbacAuthorizationV1alpha1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1alpha1ClusterRole(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchClusterRole

watchClusterRoleBinding(_api::RbacAuthorizationV1alpha1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1alpha1ClusterRoleBinding(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchClusterRoleBinding

watchClusterRoleBindingList(_api::RbacAuthorizationV1alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1alpha1ClusterRoleBindingList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchClusterRoleBindingList

watchClusterRoleList(_api::RbacAuthorizationV1alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1alpha1ClusterRoleList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchClusterRoleList

watchNamespacedRole(_api::RbacAuthorizationV1alpha1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1alpha1NamespacedRole(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedRole

watchNamespacedRoleBinding(_api::RbacAuthorizationV1alpha1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1alpha1NamespacedRoleBinding(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedRoleBinding

watchNamespacedRoleBindingList(_api::RbacAuthorizationV1alpha1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1alpha1NamespacedRoleBindingList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedRoleBindingList

watchNamespacedRoleList(_api::RbacAuthorizationV1alpha1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1alpha1NamespacedRoleList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedRoleList

watchRoleBindingListForAllNamespaces(_api::RbacAuthorizationV1alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1alpha1RoleBindingListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchRoleBindingListForAllNamespaces

watchRoleListForAllNamespaces(_api::RbacAuthorizationV1alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1alpha1RoleListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchRoleListForAllNamespaces

createClusterRole(_api::RbacAuthorizationV1Api, body; pretty=nothing, _mediaType=nothing) = createRbacAuthorizationV1ClusterRole(_api, body; pretty=pretty, _mediaType=_mediaType)
export createClusterRole

createClusterRoleBinding(_api::RbacAuthorizationV1Api, body; pretty=nothing, _mediaType=nothing) = createRbacAuthorizationV1ClusterRoleBinding(_api, body; pretty=pretty, _mediaType=_mediaType)
export createClusterRoleBinding

createNamespacedRole(_api::RbacAuthorizationV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createRbacAuthorizationV1NamespacedRole(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedRole

createNamespacedRoleBinding(_api::RbacAuthorizationV1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createRbacAuthorizationV1NamespacedRoleBinding(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedRoleBinding

deleteClusterRole(_api::RbacAuthorizationV1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1ClusterRole(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteClusterRole

deleteClusterRoleBinding(_api::RbacAuthorizationV1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1ClusterRoleBinding(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteClusterRoleBinding

deleteCollectionClusterRole(_api::RbacAuthorizationV1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1CollectionClusterRole(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionClusterRole

deleteCollectionClusterRoleBinding(_api::RbacAuthorizationV1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1CollectionClusterRoleBinding(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionClusterRoleBinding

deleteCollectionNamespacedRole(_api::RbacAuthorizationV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1CollectionNamespacedRole(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedRole

deleteCollectionNamespacedRoleBinding(_api::RbacAuthorizationV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1CollectionNamespacedRoleBinding(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedRoleBinding

deleteNamespacedRole(_api::RbacAuthorizationV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1NamespacedRole(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedRole

deleteNamespacedRoleBinding(_api::RbacAuthorizationV1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1NamespacedRoleBinding(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedRoleBinding

getAPIResources(_api::RbacAuthorizationV1Api; _mediaType=nothing) = getRbacAuthorizationV1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

listClusterRole(_api::RbacAuthorizationV1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1ClusterRole(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listClusterRole

listClusterRoleBinding(_api::RbacAuthorizationV1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1ClusterRoleBinding(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listClusterRoleBinding

listNamespacedRole(_api::RbacAuthorizationV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1NamespacedRole(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedRole

listNamespacedRoleBinding(_api::RbacAuthorizationV1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1NamespacedRoleBinding(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedRoleBinding

listRoleBindingForAllNamespaces(_api::RbacAuthorizationV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1RoleBindingForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listRoleBindingForAllNamespaces

listRoleForAllNamespaces(_api::RbacAuthorizationV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1RoleForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listRoleForAllNamespaces

patchClusterRole(_api::RbacAuthorizationV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchRbacAuthorizationV1ClusterRole(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchClusterRole

patchClusterRoleBinding(_api::RbacAuthorizationV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchRbacAuthorizationV1ClusterRoleBinding(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchClusterRoleBinding

patchNamespacedRole(_api::RbacAuthorizationV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchRbacAuthorizationV1NamespacedRole(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedRole

patchNamespacedRoleBinding(_api::RbacAuthorizationV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchRbacAuthorizationV1NamespacedRoleBinding(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedRoleBinding

readClusterRole(_api::RbacAuthorizationV1Api, name::String; pretty=nothing, _mediaType=nothing) = readRbacAuthorizationV1ClusterRole(_api, name; pretty=pretty, _mediaType=_mediaType)
export readClusterRole

readClusterRoleBinding(_api::RbacAuthorizationV1Api, name::String; pretty=nothing, _mediaType=nothing) = readRbacAuthorizationV1ClusterRoleBinding(_api, name; pretty=pretty, _mediaType=_mediaType)
export readClusterRoleBinding

readNamespacedRole(_api::RbacAuthorizationV1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readRbacAuthorizationV1NamespacedRole(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedRole

readNamespacedRoleBinding(_api::RbacAuthorizationV1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readRbacAuthorizationV1NamespacedRoleBinding(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedRoleBinding

replaceClusterRole(_api::RbacAuthorizationV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceRbacAuthorizationV1ClusterRole(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceClusterRole

replaceClusterRoleBinding(_api::RbacAuthorizationV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceRbacAuthorizationV1ClusterRoleBinding(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceClusterRoleBinding

replaceNamespacedRole(_api::RbacAuthorizationV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceRbacAuthorizationV1NamespacedRole(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedRole

replaceNamespacedRoleBinding(_api::RbacAuthorizationV1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceRbacAuthorizationV1NamespacedRoleBinding(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedRoleBinding

watchClusterRole(_api::RbacAuthorizationV1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1ClusterRole(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchClusterRole

watchClusterRoleBinding(_api::RbacAuthorizationV1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1ClusterRoleBinding(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchClusterRoleBinding

watchClusterRoleBindingList(_api::RbacAuthorizationV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1ClusterRoleBindingList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchClusterRoleBindingList

watchClusterRoleList(_api::RbacAuthorizationV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1ClusterRoleList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchClusterRoleList

watchNamespacedRole(_api::RbacAuthorizationV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1NamespacedRole(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedRole

watchNamespacedRoleBinding(_api::RbacAuthorizationV1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1NamespacedRoleBinding(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedRoleBinding

watchNamespacedRoleBindingList(_api::RbacAuthorizationV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1NamespacedRoleBindingList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedRoleBindingList

watchNamespacedRoleList(_api::RbacAuthorizationV1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1NamespacedRoleList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedRoleList

watchRoleBindingListForAllNamespaces(_api::RbacAuthorizationV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1RoleBindingListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchRoleBindingListForAllNamespaces

watchRoleListForAllNamespaces(_api::RbacAuthorizationV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1RoleListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchRoleListForAllNamespaces

createClusterRole(_api::RbacAuthorizationV1beta1Api, body; pretty=nothing, _mediaType=nothing) = createRbacAuthorizationV1beta1ClusterRole(_api, body; pretty=pretty, _mediaType=_mediaType)
export createClusterRole

createClusterRoleBinding(_api::RbacAuthorizationV1beta1Api, body; pretty=nothing, _mediaType=nothing) = createRbacAuthorizationV1beta1ClusterRoleBinding(_api, body; pretty=pretty, _mediaType=_mediaType)
export createClusterRoleBinding

createNamespacedRole(_api::RbacAuthorizationV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createRbacAuthorizationV1beta1NamespacedRole(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedRole

createNamespacedRoleBinding(_api::RbacAuthorizationV1beta1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createRbacAuthorizationV1beta1NamespacedRoleBinding(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedRoleBinding

deleteClusterRole(_api::RbacAuthorizationV1beta1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1beta1ClusterRole(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteClusterRole

deleteClusterRoleBinding(_api::RbacAuthorizationV1beta1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1beta1ClusterRoleBinding(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteClusterRoleBinding

deleteCollectionClusterRole(_api::RbacAuthorizationV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1beta1CollectionClusterRole(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionClusterRole

deleteCollectionClusterRoleBinding(_api::RbacAuthorizationV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1beta1CollectionClusterRoleBinding(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionClusterRoleBinding

deleteCollectionNamespacedRole(_api::RbacAuthorizationV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1beta1CollectionNamespacedRole(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedRole

deleteCollectionNamespacedRoleBinding(_api::RbacAuthorizationV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1beta1CollectionNamespacedRoleBinding(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedRoleBinding

deleteNamespacedRole(_api::RbacAuthorizationV1beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1beta1NamespacedRole(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedRole

deleteNamespacedRoleBinding(_api::RbacAuthorizationV1beta1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteRbacAuthorizationV1beta1NamespacedRoleBinding(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedRoleBinding

getAPIResources(_api::RbacAuthorizationV1beta1Api; _mediaType=nothing) = getRbacAuthorizationV1beta1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

listClusterRole(_api::RbacAuthorizationV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1beta1ClusterRole(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listClusterRole

listClusterRoleBinding(_api::RbacAuthorizationV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1beta1ClusterRoleBinding(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listClusterRoleBinding

listNamespacedRole(_api::RbacAuthorizationV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1beta1NamespacedRole(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedRole

listNamespacedRoleBinding(_api::RbacAuthorizationV1beta1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1beta1NamespacedRoleBinding(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedRoleBinding

listRoleBindingForAllNamespaces(_api::RbacAuthorizationV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1beta1RoleBindingForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listRoleBindingForAllNamespaces

listRoleForAllNamespaces(_api::RbacAuthorizationV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listRbacAuthorizationV1beta1RoleForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listRoleForAllNamespaces

patchClusterRole(_api::RbacAuthorizationV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchRbacAuthorizationV1beta1ClusterRole(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchClusterRole

patchClusterRoleBinding(_api::RbacAuthorizationV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchRbacAuthorizationV1beta1ClusterRoleBinding(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchClusterRoleBinding

patchNamespacedRole(_api::RbacAuthorizationV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchRbacAuthorizationV1beta1NamespacedRole(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedRole

patchNamespacedRoleBinding(_api::RbacAuthorizationV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchRbacAuthorizationV1beta1NamespacedRoleBinding(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedRoleBinding

readClusterRole(_api::RbacAuthorizationV1beta1Api, name::String; pretty=nothing, _mediaType=nothing) = readRbacAuthorizationV1beta1ClusterRole(_api, name; pretty=pretty, _mediaType=_mediaType)
export readClusterRole

readClusterRoleBinding(_api::RbacAuthorizationV1beta1Api, name::String; pretty=nothing, _mediaType=nothing) = readRbacAuthorizationV1beta1ClusterRoleBinding(_api, name; pretty=pretty, _mediaType=_mediaType)
export readClusterRoleBinding

readNamespacedRole(_api::RbacAuthorizationV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readRbacAuthorizationV1beta1NamespacedRole(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedRole

readNamespacedRoleBinding(_api::RbacAuthorizationV1beta1Api, name::String, namespace::String; pretty=nothing, _mediaType=nothing) = readRbacAuthorizationV1beta1NamespacedRoleBinding(_api, name, namespace; pretty=pretty, _mediaType=_mediaType)
export readNamespacedRoleBinding

replaceClusterRole(_api::RbacAuthorizationV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceRbacAuthorizationV1beta1ClusterRole(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceClusterRole

replaceClusterRoleBinding(_api::RbacAuthorizationV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceRbacAuthorizationV1beta1ClusterRoleBinding(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceClusterRoleBinding

replaceNamespacedRole(_api::RbacAuthorizationV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceRbacAuthorizationV1beta1NamespacedRole(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedRole

replaceNamespacedRoleBinding(_api::RbacAuthorizationV1beta1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceRbacAuthorizationV1beta1NamespacedRoleBinding(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedRoleBinding

watchClusterRole(_api::RbacAuthorizationV1beta1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1beta1ClusterRole(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchClusterRole

watchClusterRoleBinding(_api::RbacAuthorizationV1beta1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1beta1ClusterRoleBinding(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchClusterRoleBinding

watchClusterRoleBindingList(_api::RbacAuthorizationV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1beta1ClusterRoleBindingList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchClusterRoleBindingList

watchClusterRoleList(_api::RbacAuthorizationV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1beta1ClusterRoleList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchClusterRoleList

watchNamespacedRole(_api::RbacAuthorizationV1beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1beta1NamespacedRole(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedRole

watchNamespacedRoleBinding(_api::RbacAuthorizationV1beta1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1beta1NamespacedRoleBinding(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedRoleBinding

watchNamespacedRoleBindingList(_api::RbacAuthorizationV1beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1beta1NamespacedRoleBindingList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedRoleBindingList

watchNamespacedRoleList(_api::RbacAuthorizationV1beta1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1beta1NamespacedRoleList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedRoleList

watchRoleBindingListForAllNamespaces(_api::RbacAuthorizationV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1beta1RoleBindingListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchRoleBindingListForAllNamespaces

watchRoleListForAllNamespaces(_api::RbacAuthorizationV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchRbacAuthorizationV1beta1RoleListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchRoleListForAllNamespaces

getAPIGroup(_api::SchedulingApi; _mediaType=nothing) = getSchedulingAPIGroup(_api; _mediaType=_mediaType)
export getAPIGroup

createPriorityClass(_api::SchedulingV1alpha1Api, body; pretty=nothing, _mediaType=nothing) = createSchedulingV1alpha1PriorityClass(_api, body; pretty=pretty, _mediaType=_mediaType)
export createPriorityClass

deleteCollectionPriorityClass(_api::SchedulingV1alpha1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteSchedulingV1alpha1CollectionPriorityClass(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionPriorityClass

deletePriorityClass(_api::SchedulingV1alpha1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteSchedulingV1alpha1PriorityClass(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deletePriorityClass

getAPIResources(_api::SchedulingV1alpha1Api; _mediaType=nothing) = getSchedulingV1alpha1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

listPriorityClass(_api::SchedulingV1alpha1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listSchedulingV1alpha1PriorityClass(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listPriorityClass

patchPriorityClass(_api::SchedulingV1alpha1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchSchedulingV1alpha1PriorityClass(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchPriorityClass

readPriorityClass(_api::SchedulingV1alpha1Api, name::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readSchedulingV1alpha1PriorityClass(_api, name; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readPriorityClass

replacePriorityClass(_api::SchedulingV1alpha1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceSchedulingV1alpha1PriorityClass(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replacePriorityClass

watchPriorityClass(_api::SchedulingV1alpha1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchSchedulingV1alpha1PriorityClass(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchPriorityClass

watchPriorityClassList(_api::SchedulingV1alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchSchedulingV1alpha1PriorityClassList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchPriorityClassList

getAPIGroup(_api::SettingsApi; _mediaType=nothing) = getSettingsAPIGroup(_api; _mediaType=_mediaType)
export getAPIGroup

createNamespacedPodPreset(_api::SettingsV1alpha1Api, namespace::String, body; pretty=nothing, _mediaType=nothing) = createSettingsV1alpha1NamespacedPodPreset(_api, namespace, body; pretty=pretty, _mediaType=_mediaType)
export createNamespacedPodPreset

deleteCollectionNamespacedPodPreset(_api::SettingsV1alpha1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteSettingsV1alpha1CollectionNamespacedPodPreset(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionNamespacedPodPreset

deleteNamespacedPodPreset(_api::SettingsV1alpha1Api, name::String, namespace::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteSettingsV1alpha1NamespacedPodPreset(_api, name, namespace, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteNamespacedPodPreset

getAPIResources(_api::SettingsV1alpha1Api; _mediaType=nothing) = getSettingsV1alpha1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

listNamespacedPodPreset(_api::SettingsV1alpha1Api, namespace::String; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listSettingsV1alpha1NamespacedPodPreset(_api, namespace; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listNamespacedPodPreset

listPodPresetForAllNamespaces(_api::SettingsV1alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listSettingsV1alpha1PodPresetForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listPodPresetForAllNamespaces

patchNamespacedPodPreset(_api::SettingsV1alpha1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = patchSettingsV1alpha1NamespacedPodPreset(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export patchNamespacedPodPreset

readNamespacedPodPreset(_api::SettingsV1alpha1Api, name::String, namespace::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readSettingsV1alpha1NamespacedPodPreset(_api, name, namespace; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readNamespacedPodPreset

replaceNamespacedPodPreset(_api::SettingsV1alpha1Api, name::String, namespace::String, body; pretty=nothing, _mediaType=nothing) = replaceSettingsV1alpha1NamespacedPodPreset(_api, name, namespace, body; pretty=pretty, _mediaType=_mediaType)
export replaceNamespacedPodPreset

watchNamespacedPodPreset(_api::SettingsV1alpha1Api, name::String, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchSettingsV1alpha1NamespacedPodPreset(_api, name, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedPodPreset

watchNamespacedPodPresetList(_api::SettingsV1alpha1Api, namespace::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchSettingsV1alpha1NamespacedPodPresetList(_api, namespace; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchNamespacedPodPresetList

watchPodPresetListForAllNamespaces(_api::SettingsV1alpha1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchSettingsV1alpha1PodPresetListForAllNamespaces(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchPodPresetListForAllNamespaces

getAPIGroup(_api::StorageApi; _mediaType=nothing) = getStorageAPIGroup(_api; _mediaType=_mediaType)
export getAPIGroup

createStorageClass(_api::StorageV1Api, body; pretty=nothing, _mediaType=nothing) = createStorageV1StorageClass(_api, body; pretty=pretty, _mediaType=_mediaType)
export createStorageClass

deleteCollectionStorageClass(_api::StorageV1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteStorageV1CollectionStorageClass(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionStorageClass

deleteStorageClass(_api::StorageV1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteStorageV1StorageClass(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteStorageClass

getAPIResources(_api::StorageV1Api; _mediaType=nothing) = getStorageV1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

listStorageClass(_api::StorageV1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listStorageV1StorageClass(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listStorageClass

patchStorageClass(_api::StorageV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchStorageV1StorageClass(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchStorageClass

readStorageClass(_api::StorageV1Api, name::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readStorageV1StorageClass(_api, name; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readStorageClass

replaceStorageClass(_api::StorageV1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceStorageV1StorageClass(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceStorageClass

watchStorageClass(_api::StorageV1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchStorageV1StorageClass(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchStorageClass

watchStorageClassList(_api::StorageV1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchStorageV1StorageClassList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchStorageClassList

createStorageClass(_api::StorageV1beta1Api, body; pretty=nothing, _mediaType=nothing) = createStorageV1beta1StorageClass(_api, body; pretty=pretty, _mediaType=_mediaType)
export createStorageClass

deleteCollectionStorageClass(_api::StorageV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = deleteStorageV1beta1CollectionStorageClass(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export deleteCollectionStorageClass

deleteStorageClass(_api::StorageV1beta1Api, name::String, body; pretty=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing) = deleteStorageV1beta1StorageClass(_api, name, body; pretty=pretty, gracePeriodSeconds=gracePeriodSeconds, orphanDependents=orphanDependents, propagationPolicy=propagationPolicy, _mediaType=_mediaType)
export deleteStorageClass

getAPIResources(_api::StorageV1beta1Api; _mediaType=nothing) = getStorageV1beta1APIResources(_api; _mediaType=_mediaType)
export getAPIResources

listStorageClass(_api::StorageV1beta1Api; pretty=nothing, _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = listStorageV1beta1StorageClass(_api; pretty=pretty, _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export listStorageClass

patchStorageClass(_api::StorageV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = patchStorageV1beta1StorageClass(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export patchStorageClass

readStorageClass(_api::StorageV1beta1Api, name::String; pretty=nothing, exact=nothing, _export=nothing, _mediaType=nothing) = readStorageV1beta1StorageClass(_api, name; pretty=pretty, exact=exact, _export=_export, _mediaType=_mediaType)
export readStorageClass

replaceStorageClass(_api::StorageV1beta1Api, name::String, body; pretty=nothing, _mediaType=nothing) = replaceStorageV1beta1StorageClass(_api, name, body; pretty=pretty, _mediaType=_mediaType)
export replaceStorageClass

watchStorageClass(_api::StorageV1beta1Api, name::String; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchStorageV1beta1StorageClass(_api, name; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchStorageClass

watchStorageClassList(_api::StorageV1beta1Api; _continue=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing) = watchStorageV1beta1StorageClassList(_api; _continue=_continue, fieldSelector=fieldSelector, includeUninitialized=includeUninitialized, labelSelector=labelSelector, limit=limit, pretty=pretty, resourceVersion=resourceVersion, timeoutSeconds=timeoutSeconds, watch=watch, _mediaType=_mediaType)
export watchStorageClassList

getCode(_api::VersionApi; _mediaType=nothing) = getCodeVersion(_api; _mediaType=_mediaType)
export getCode

