const APIVersionMap = Dict(
    "settings.k8s.io/v1alpha1" => "SettingsV1alpha1Api",
    "networking.k8s.io/v1" => "NetworkingV1Api",
    "apiextensions.k8s.io/v1beta1" => "ApiextensionsV1beta1Api",
    "apps/v1beta2" => "AppsV1beta2Api",
    "scheduling.k8s.io/v1" => "SchedulingV1Api",
    "rbac.authorization.k8s.io/v1" => "RbacAuthorizationV1Api",
    "apiextensions.k8s.io/v1" => "ApiextensionsV1Api",
    "scheduling.k8s.io/v1beta1" => "SchedulingV1beta1Api",
    "batch/v2alpha1" => "BatchV2alpha1Api",
    "apps/v1beta1" => "AppsV1beta1Api",
    "discovery.k8s.io/v1beta1" => "DiscoveryV1beta1Api",
    "storage.k8s.io/v1beta1" => "StorageV1beta1Api",
    "authorization.k8s.io/v1beta1" => "AuthorizationV1beta1Api",
    "autoscaling/v1" => "AutoscalingV1Api",
    "coordination.k8s.io/v1beta1" => "CoordinationV1beta1Api",
    "v1" => "CoreV1Api",
    "autoscaling/v2beta2" => "AutoscalingV2beta2Api",
    "authentication.k8s.io/v1" => "AuthenticationV1Api",
    "apps/v1" => "AppsV1Api",
    "rbac.authorization.k8s.io/v1alpha1" => "RbacAuthorizationV1alpha1Api",
    "admissionregistration.k8s.io/v1beta1" => "AdmissionregistrationV1beta1Api",
    "apiregistration.k8s.io/v1beta1" => "ApiregistrationV1beta1Api",
    "events.k8s.io/v1beta1" => "EventsV1beta1Api",
    "auditregistration.k8s.io/v1alpha1" => "AuditregistrationV1alpha1Api",
    "karpenter.sh/v1alpha5" => "KarpenterShV1alpha5Api",
    "node.k8s.io/v1alpha1" => "NodeV1alpha1Api",
    "policy/v1beta1" => "PolicyV1beta1Api",
    "storage.k8s.io/v1alpha1" => "StorageV1alpha1Api",
    "storage.k8s.io/v1" => "StorageV1Api",
    "autoscaling/v2beta1" => "AutoscalingV2beta1Api",
    "metrics.k8s.io/v1beta1" => "MetricsV1beta1Api",
    "authentication.k8s.io/v1beta1" => "AuthenticationV1beta1Api",
    "rbac.authorization.k8s.io/v1beta1" => "RbacAuthorizationV1beta1Api",
    "admissionregistration.k8s.io/v1" => "AdmissionregistrationV1Api",
    "batch/v1" => "BatchV1Api",
    "scheduling.k8s.io/v1alpha1" => "SchedulingV1alpha1Api",
    "batch/v1beta1" => "BatchV1beta1Api",
    "flowcontrol.apiserver.k8s.io/v1alpha1" => "FlowcontrolApiserverV1alpha1Api",
    "authorization.k8s.io/v1" => "AuthorizationV1Api",
    "extensions/v1beta1" => "ExtensionsV1beta1Api",
    "apis" => "ApisApi",
    "coordination.k8s.io/v1" => "CoordinationV1Api",
    "apiregistration.k8s.io/v1" => "ApiregistrationV1Api",
    "certificates.k8s.io/v1beta1" => "CertificatesV1beta1Api",
    "node.k8s.io/v1beta1" => "NodeV1beta1Api",
    "custom.metrics.k8s.io/v1beta1" => "CustomMetricsV1beta1Api",
    "networking.k8s.io/v1beta1" => "NetworkingV1beta1Api",
)

# patch_namespaced_limit_range
patch_namespaced_limit_range(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.patch_core_v1_namespaced_limit_range(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# connect_patch_namespaced_pod_proxy_with_path
connect_patch_namespaced_pod_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_patch_namespaced_pod_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_namespaced_replication_controller
delete_namespaced_replication_controller(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_namespaced_replication_controller(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_namespaced_pod_disruption_budget_status
patch_namespaced_pod_disruption_budget_status(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...) = Kubernetes.patch_policy_v1beta1_namespaced_pod_disruption_budget_status(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...)

# connect_patch_namespaced_pod_proxy
connect_patch_namespaced_pod_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_patch_namespaced_pod_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_namespaced_stateful_set
watch_namespaced_stateful_set(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.watch_apps_v1_namespaced_stateful_set(_api::Kubernetes.AppsV1Api, args...; kwargs...)
watch_namespaced_stateful_set(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.watch_apps_v1beta1_namespaced_stateful_set(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
watch_namespaced_stateful_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.watch_apps_v1beta2_namespaced_stateful_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# delete_collection_priority_level_configuration
delete_collection_priority_level_configuration(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.delete_flowcontrol_apiserver_v1alpha1_collection_priority_level_configuration(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)

# replace_namespaced_event
replace_namespaced_event(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_namespaced_event(_api::Kubernetes.CoreV1Api, args...; kwargs...)
replace_namespaced_event(_api::Kubernetes.EventsV1beta1Api, args...; kwargs...) = Kubernetes.replace_events_v1beta1_namespaced_event(_api::Kubernetes.EventsV1beta1Api, args...; kwargs...)

# watch_a_p_i_service
watch_a_p_i_service(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...) = Kubernetes.watch_apiregistration_v1_a_p_i_service(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...)
watch_a_p_i_service(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...) = Kubernetes.watch_apiregistration_v1beta1_a_p_i_service(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...)

# list_persistent_volume
list_persistent_volume(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_persistent_volume(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_namespaced_lease
patch_namespaced_lease(_api::Kubernetes.CoordinationV1Api, args...; kwargs...) = Kubernetes.patch_coordination_v1_namespaced_lease(_api::Kubernetes.CoordinationV1Api, args...; kwargs...)
patch_namespaced_lease(_api::Kubernetes.CoordinationV1beta1Api, args...; kwargs...) = Kubernetes.patch_coordination_v1beta1_namespaced_lease(_api::Kubernetes.CoordinationV1beta1Api, args...; kwargs...)

# replace_c_s_i_node
replace_c_s_i_node(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.replace_storage_v1_c_s_i_node(_api::Kubernetes.StorageV1Api, args...; kwargs...)
replace_c_s_i_node(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.replace_storage_v1beta1_c_s_i_node(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# connect_head_node_proxy
connect_head_node_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_head_node_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_collection_namespaced_pod_template
delete_collection_namespaced_pod_template(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_collection_namespaced_pod_template(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_namespaced_pod_disruption_budget
patch_namespaced_pod_disruption_budget(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...) = Kubernetes.patch_policy_v1beta1_namespaced_pod_disruption_budget(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...)

# delete_collection_namespaced_replication_controller
delete_collection_namespaced_replication_controller(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_collection_namespaced_replication_controller(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_namespaced_event
watch_namespaced_event(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespaced_event(_api::Kubernetes.CoreV1Api, args...; kwargs...)
watch_namespaced_event(_api::Kubernetes.EventsV1beta1Api, args...; kwargs...) = Kubernetes.watch_events_v1beta1_namespaced_event(_api::Kubernetes.EventsV1beta1Api, args...; kwargs...)

# read_namespaced_role
read_namespaced_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.read_rbac_authorization_v1_namespaced_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
read_namespaced_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.read_rbac_authorization_v1alpha1_namespaced_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
read_namespaced_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.read_rbac_authorization_v1beta1_namespaced_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# read_namespaced_role_binding
read_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.read_rbac_authorization_v1_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
read_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.read_rbac_authorization_v1alpha1_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
read_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.read_rbac_authorization_v1beta1_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# replace_node_status
replace_node_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_node_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_namespaced_replica_set_list
watch_namespaced_replica_set_list(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.watch_apps_v1_namespaced_replica_set_list(_api::Kubernetes.AppsV1Api, args...; kwargs...)
watch_namespaced_replica_set_list(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.watch_apps_v1beta2_namespaced_replica_set_list(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
watch_namespaced_replica_set_list(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.watch_extensions_v1beta1_namespaced_replica_set_list(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# watch_namespaced_role_binding
watch_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
watch_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1alpha1_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
watch_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1beta1_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# delete_mutating_webhook_configuration
delete_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...) = Kubernetes.delete_admissionregistration_v1_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...)
delete_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...) = Kubernetes.delete_admissionregistration_v1beta1_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...)

# read_persistent_volume
read_persistent_volume(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_persistent_volume(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_collection_namespaced_service_account
delete_collection_namespaced_service_account(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_collection_namespaced_service_account(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_flow_schema_status
patch_flow_schema_status(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.patch_flowcontrol_apiserver_v1alpha1_flow_schema_status(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)

# watch_c_s_i_driver
watch_c_s_i_driver(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.watch_storage_v1beta1_c_s_i_driver(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# list_namespaced_config_map
list_namespaced_config_map(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_namespaced_config_map(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_namespaced_job
delete_namespaced_job(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.delete_batch_v1_namespaced_job(_api::Kubernetes.BatchV1Api, args...; kwargs...)

# list_lease_for_all_namespaces
list_lease_for_all_namespaces(_api::Kubernetes.CoordinationV1Api, args...; kwargs...) = Kubernetes.list_coordination_v1_lease_for_all_namespaces(_api::Kubernetes.CoordinationV1Api, args...; kwargs...)
list_lease_for_all_namespaces(_api::Kubernetes.CoordinationV1beta1Api, args...; kwargs...) = Kubernetes.list_coordination_v1beta1_lease_for_all_namespaces(_api::Kubernetes.CoordinationV1beta1Api, args...; kwargs...)

# read_namespaced_ingress_status
read_namespaced_ingress_status(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.read_extensions_v1beta1_namespaced_ingress_status(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
read_namespaced_ingress_status(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...) = Kubernetes.read_networking_v1beta1_namespaced_ingress_status(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...)

# read_priority_level_configuration_status
read_priority_level_configuration_status(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.read_flowcontrol_apiserver_v1alpha1_priority_level_configuration_status(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)

# delete_collection_a_p_i_service
delete_collection_a_p_i_service(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...) = Kubernetes.delete_apiregistration_v1_collection_a_p_i_service(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...)
delete_collection_a_p_i_service(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...) = Kubernetes.delete_apiregistration_v1beta1_collection_a_p_i_service(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...)

# watch_pod_preset_list_for_all_namespaces
watch_pod_preset_list_for_all_namespaces(_api::Kubernetes.SettingsV1alpha1Api, args...; kwargs...) = Kubernetes.watch_settings_v1alpha1_pod_preset_list_for_all_namespaces(_api::Kubernetes.SettingsV1alpha1Api, args...; kwargs...)

# create_namespaced_horizontal_pod_autoscaler
create_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...) = Kubernetes.create_autoscaling_v1_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...)
create_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...) = Kubernetes.create_autoscaling_v2beta1_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...)
create_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...) = Kubernetes.create_autoscaling_v2beta2_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...)

# connect_head_namespaced_pod_proxy_with_path
connect_head_namespaced_pod_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_head_namespaced_pod_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_pod_disruption_budget_for_all_namespaces
list_pod_disruption_budget_for_all_namespaces(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...) = Kubernetes.list_policy_v1beta1_pod_disruption_budget_for_all_namespaces(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...)

# list_namespaced_endpoints
list_namespaced_endpoints(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_namespaced_endpoints(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# connect_get_node_proxy_with_path
connect_get_node_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_get_node_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_limit_range_list_for_all_namespaces
watch_limit_range_list_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_limit_range_list_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_pod_metrics
list_pod_metrics(_api::Kubernetes.MetricsV1beta1Api, args...; kwargs...) = Kubernetes.list_metrics_v1beta1_pod_metrics(_api::Kubernetes.MetricsV1beta1Api, args...; kwargs...)

# watch_namespaced_endpoints_list
watch_namespaced_endpoints_list(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespaced_endpoints_list(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_endpoint_slice_list_for_all_namespaces
watch_endpoint_slice_list_for_all_namespaces(_api::Kubernetes.DiscoveryV1beta1Api, args...; kwargs...) = Kubernetes.watch_discovery_v1beta1_endpoint_slice_list_for_all_namespaces(_api::Kubernetes.DiscoveryV1beta1Api, args...; kwargs...)

# create_namespaced_limit_range
create_namespaced_limit_range(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.create_core_v1_namespaced_limit_range(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_limit_range_for_all_namespaces
list_limit_range_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_limit_range_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_certificate_signing_request
list_certificate_signing_request(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...) = Kubernetes.list_certificates_v1beta1_certificate_signing_request(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...)

# connect_head_node_proxy_with_path
connect_head_node_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_head_node_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_stateful_set_list_for_all_namespaces
watch_stateful_set_list_for_all_namespaces(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.watch_apps_v1_stateful_set_list_for_all_namespaces(_api::Kubernetes.AppsV1Api, args...; kwargs...)
watch_stateful_set_list_for_all_namespaces(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.watch_apps_v1beta1_stateful_set_list_for_all_namespaces(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
watch_stateful_set_list_for_all_namespaces(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.watch_apps_v1beta2_stateful_set_list_for_all_namespaces(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# replace_namespaced_network_policy
replace_namespaced_network_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.replace_extensions_v1beta1_namespaced_network_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
replace_namespaced_network_policy(_api::Kubernetes.NetworkingV1Api, args...; kwargs...) = Kubernetes.replace_networking_v1_namespaced_network_policy(_api::Kubernetes.NetworkingV1Api, args...; kwargs...)

# list_volume_attachment
list_volume_attachment(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.list_storage_v1_volume_attachment(_api::Kubernetes.StorageV1Api, args...; kwargs...)
list_volume_attachment(_api::Kubernetes.StorageV1alpha1Api, args...; kwargs...) = Kubernetes.list_storage_v1alpha1_volume_attachment(_api::Kubernetes.StorageV1alpha1Api, args...; kwargs...)
list_volume_attachment(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.list_storage_v1beta1_volume_attachment(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# replace_custom_resource_definition
replace_custom_resource_definition(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...) = Kubernetes.replace_apiextensions_v1_custom_resource_definition(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...)
replace_custom_resource_definition(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...) = Kubernetes.replace_apiextensions_v1beta1_custom_resource_definition(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...)

# watch_namespaced_replica_set
watch_namespaced_replica_set(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.watch_apps_v1_namespaced_replica_set(_api::Kubernetes.AppsV1Api, args...; kwargs...)
watch_namespaced_replica_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.watch_apps_v1beta2_namespaced_replica_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
watch_namespaced_replica_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.watch_extensions_v1beta1_namespaced_replica_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# list_namespaced_deployment
list_namespaced_deployment(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.list_apps_v1_namespaced_deployment(_api::Kubernetes.AppsV1Api, args...; kwargs...)
list_namespaced_deployment(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.list_apps_v1beta1_namespaced_deployment(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
list_namespaced_deployment(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.list_apps_v1beta2_namespaced_deployment(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
list_namespaced_deployment(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.list_extensions_v1beta1_namespaced_deployment(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# list_storage_class
list_storage_class(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.list_storage_v1_storage_class(_api::Kubernetes.StorageV1Api, args...; kwargs...)
list_storage_class(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.list_storage_v1beta1_storage_class(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# read_namespaced_horizontal_pod_autoscaler_status
read_namespaced_horizontal_pod_autoscaler_status(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...) = Kubernetes.read_autoscaling_v1_namespaced_horizontal_pod_autoscaler_status(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...)
read_namespaced_horizontal_pod_autoscaler_status(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...) = Kubernetes.read_autoscaling_v2beta1_namespaced_horizontal_pod_autoscaler_status(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...)
read_namespaced_horizontal_pod_autoscaler_status(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...) = Kubernetes.read_autoscaling_v2beta2_namespaced_horizontal_pod_autoscaler_status(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...)

# patch_flow_schema
patch_flow_schema(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.patch_flowcontrol_apiserver_v1alpha1_flow_schema(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)

# replace_volume_attachment_status
replace_volume_attachment_status(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.replace_storage_v1_volume_attachment_status(_api::Kubernetes.StorageV1Api, args...; kwargs...)

# read_validating_webhook_configuration
read_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...) = Kubernetes.read_admissionregistration_v1_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...)
read_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...) = Kubernetes.read_admissionregistration_v1beta1_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...)

# watch_namespaced_service_account
watch_namespaced_service_account(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespaced_service_account(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# create_priority_class
create_priority_class(_api::Kubernetes.SchedulingV1Api, args...; kwargs...) = Kubernetes.create_scheduling_v1_priority_class(_api::Kubernetes.SchedulingV1Api, args...; kwargs...)
create_priority_class(_api::Kubernetes.SchedulingV1alpha1Api, args...; kwargs...) = Kubernetes.create_scheduling_v1alpha1_priority_class(_api::Kubernetes.SchedulingV1alpha1Api, args...; kwargs...)
create_priority_class(_api::Kubernetes.SchedulingV1beta1Api, args...; kwargs...) = Kubernetes.create_scheduling_v1beta1_priority_class(_api::Kubernetes.SchedulingV1beta1Api, args...; kwargs...)

# patch_volume_attachment_status
patch_volume_attachment_status(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.patch_storage_v1_volume_attachment_status(_api::Kubernetes.StorageV1Api, args...; kwargs...)

# delete_collection_mutating_webhook_configuration
delete_collection_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...) = Kubernetes.delete_admissionregistration_v1_collection_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...)
delete_collection_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...) = Kubernetes.delete_admissionregistration_v1beta1_collection_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...)

# read_namespaced_resource_quota
read_namespaced_resource_quota(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_namespaced_resource_quota(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespaced_stateful_set_status
replace_namespaced_stateful_set_status(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.replace_apps_v1_namespaced_stateful_set_status(_api::Kubernetes.AppsV1Api, args...; kwargs...)
replace_namespaced_stateful_set_status(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.replace_apps_v1beta1_namespaced_stateful_set_status(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
replace_namespaced_stateful_set_status(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.replace_apps_v1beta2_namespaced_stateful_set_status(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# watch_event_list_for_all_namespaces
watch_event_list_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_event_list_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...)
watch_event_list_for_all_namespaces(_api::Kubernetes.EventsV1beta1Api, args...; kwargs...) = Kubernetes.watch_events_v1beta1_event_list_for_all_namespaces(_api::Kubernetes.EventsV1beta1Api, args...; kwargs...)

# patch_persistent_volume_status
patch_persistent_volume_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.patch_core_v1_persistent_volume_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespaced_pod_template
replace_namespaced_pod_template(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_namespaced_pod_template(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_namespaced_endpoint_slice_list
watch_namespaced_endpoint_slice_list(_api::Kubernetes.DiscoveryV1beta1Api, args...; kwargs...) = Kubernetes.watch_discovery_v1beta1_namespaced_endpoint_slice_list(_api::Kubernetes.DiscoveryV1beta1Api, args...; kwargs...)

# list_provisioner
list_provisioner(_api::Kubernetes.KarpenterShV1alpha5Api, args...; kwargs...) = Kubernetes.list_karpenter_sh_v1alpha5_provisioner(_api::Kubernetes.KarpenterShV1alpha5Api, args...; kwargs...)

# list_namespaced_pod_template
list_namespaced_pod_template(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_namespaced_pod_template(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespaced_horizontal_pod_autoscaler
replace_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...) = Kubernetes.replace_autoscaling_v1_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...)
replace_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...) = Kubernetes.replace_autoscaling_v2beta1_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...)
replace_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...) = Kubernetes.replace_autoscaling_v2beta2_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...)

# delete_namespaced_stateful_set
delete_namespaced_stateful_set(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.delete_apps_v1_namespaced_stateful_set(_api::Kubernetes.AppsV1Api, args...; kwargs...)
delete_namespaced_stateful_set(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.delete_apps_v1beta1_namespaced_stateful_set(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
delete_namespaced_stateful_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.delete_apps_v1beta2_namespaced_stateful_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# list_replica_set_for_all_namespaces
list_replica_set_for_all_namespaces(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.list_apps_v1_replica_set_for_all_namespaces(_api::Kubernetes.AppsV1Api, args...; kwargs...)
list_replica_set_for_all_namespaces(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.list_apps_v1beta2_replica_set_for_all_namespaces(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
list_replica_set_for_all_namespaces(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.list_extensions_v1beta1_replica_set_for_all_namespaces(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# create_pod_security_policy
create_pod_security_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.create_extensions_v1beta1_pod_security_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
create_pod_security_policy(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...) = Kubernetes.create_policy_v1beta1_pod_security_policy(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...)

# read_namespaced_endpoint_slice
read_namespaced_endpoint_slice(_api::Kubernetes.DiscoveryV1beta1Api, args...; kwargs...) = Kubernetes.read_discovery_v1beta1_namespaced_endpoint_slice(_api::Kubernetes.DiscoveryV1beta1Api, args...; kwargs...)

# delete_namespaced_service
delete_namespaced_service(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_namespaced_service(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_namespaced_replica_set
patch_namespaced_replica_set(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.patch_apps_v1_namespaced_replica_set(_api::Kubernetes.AppsV1Api, args...; kwargs...)
patch_namespaced_replica_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.patch_apps_v1beta2_namespaced_replica_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
patch_namespaced_replica_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.patch_extensions_v1beta1_namespaced_replica_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# replace_namespaced_stateful_set_scale
replace_namespaced_stateful_set_scale(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.replace_apps_v1_namespaced_stateful_set_scale(_api::Kubernetes.AppsV1Api, args...; kwargs...)
replace_namespaced_stateful_set_scale(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.replace_apps_v1beta1_namespaced_stateful_set_scale(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
replace_namespaced_stateful_set_scale(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.replace_apps_v1beta2_namespaced_stateful_set_scale(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# connect_get_namespaced_pod_proxy
connect_get_namespaced_pod_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_get_namespaced_pod_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# connect_get_namespaced_pod_proxy_with_path
connect_get_namespaced_pod_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_get_namespaced_pod_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_collection_provisioner
delete_collection_provisioner(_api::Kubernetes.KarpenterShV1alpha5Api, args...; kwargs...) = Kubernetes.delete_karpenter_sh_v1alpha5_collection_provisioner(_api::Kubernetes.KarpenterShV1alpha5Api, args...; kwargs...)

# patch_namespaced_role_binding
patch_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.patch_rbac_authorization_v1_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
patch_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.patch_rbac_authorization_v1alpha1_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
patch_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.patch_rbac_authorization_v1beta1_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# watch_custom_resource_definition_list
watch_custom_resource_definition_list(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...) = Kubernetes.watch_apiextensions_v1_custom_resource_definition_list(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...)
watch_custom_resource_definition_list(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...) = Kubernetes.watch_apiextensions_v1beta1_custom_resource_definition_list(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...)

# read_namespaced_replication_controller_scale
read_namespaced_replication_controller_scale(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_namespaced_replication_controller_scale(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_collection_namespaced_horizontal_pod_autoscaler
delete_collection_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...) = Kubernetes.delete_autoscaling_v1_collection_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...)
delete_collection_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...) = Kubernetes.delete_autoscaling_v2beta1_collection_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...)
delete_collection_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...) = Kubernetes.delete_autoscaling_v2beta2_collection_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...)

# watch_c_s_i_node_list
watch_c_s_i_node_list(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.watch_storage_v1_c_s_i_node_list(_api::Kubernetes.StorageV1Api, args...; kwargs...)
watch_c_s_i_node_list(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.watch_storage_v1beta1_c_s_i_node_list(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# create_namespace
create_namespace(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.create_core_v1_namespace(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_provisioner_status
replace_provisioner_status(_api::Kubernetes.KarpenterShV1alpha5Api, args...; kwargs...) = Kubernetes.replace_karpenter_sh_v1alpha5_provisioner_status(_api::Kubernetes.KarpenterShV1alpha5Api, args...; kwargs...)

# create_validating_webhook_configuration
create_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...) = Kubernetes.create_admissionregistration_v1_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...)
create_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...) = Kubernetes.create_admissionregistration_v1beta1_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...)

# connect_patch_node_proxy
connect_patch_node_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_patch_node_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespaced_pod_disruption_budget_status
replace_namespaced_pod_disruption_budget_status(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...) = Kubernetes.replace_policy_v1beta1_namespaced_pod_disruption_budget_status(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...)

# watch_deployment_list_for_all_namespaces
watch_deployment_list_for_all_namespaces(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.watch_apps_v1_deployment_list_for_all_namespaces(_api::Kubernetes.AppsV1Api, args...; kwargs...)
watch_deployment_list_for_all_namespaces(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.watch_apps_v1beta1_deployment_list_for_all_namespaces(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
watch_deployment_list_for_all_namespaces(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.watch_apps_v1beta2_deployment_list_for_all_namespaces(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
watch_deployment_list_for_all_namespaces(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.watch_extensions_v1beta1_deployment_list_for_all_namespaces(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# connect_delete_namespaced_service_proxy_with_path
connect_delete_namespaced_service_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_delete_namespaced_service_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# connect_get_node_proxy
connect_get_node_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_get_node_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# connect_get_namespaced_service_proxy_with_path
connect_get_namespaced_service_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_get_namespaced_service_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_a_p_i_service
delete_a_p_i_service(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...) = Kubernetes.delete_apiregistration_v1_a_p_i_service(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...)
delete_a_p_i_service(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...) = Kubernetes.delete_apiregistration_v1beta1_a_p_i_service(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...)

# watch_config_map_list_for_all_namespaces
watch_config_map_list_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_config_map_list_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_provisioner
replace_provisioner(_api::Kubernetes.KarpenterShV1alpha5Api, args...; kwargs...) = Kubernetes.replace_karpenter_sh_v1alpha5_provisioner(_api::Kubernetes.KarpenterShV1alpha5Api, args...; kwargs...)

# delete_collection_namespaced_role
delete_collection_namespaced_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.delete_rbac_authorization_v1_collection_namespaced_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
delete_collection_namespaced_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.delete_rbac_authorization_v1alpha1_collection_namespaced_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
delete_collection_namespaced_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.delete_rbac_authorization_v1beta1_collection_namespaced_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# watch_certificate_signing_request_list
watch_certificate_signing_request_list(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...) = Kubernetes.watch_certificates_v1beta1_certificate_signing_request_list(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...)

# list_role_binding_for_all_namespaces
list_role_binding_for_all_namespaces(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.list_rbac_authorization_v1_role_binding_for_all_namespaces(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
list_role_binding_for_all_namespaces(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.list_rbac_authorization_v1alpha1_role_binding_for_all_namespaces(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
list_role_binding_for_all_namespaces(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.list_rbac_authorization_v1beta1_role_binding_for_all_namespaces(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# watch_namespaced_secret_list
watch_namespaced_secret_list(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespaced_secret_list(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_namespaced_replication_controller_scale
patch_namespaced_replication_controller_scale(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.patch_core_v1_namespaced_replication_controller_scale(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# create_a_p_i_service
create_a_p_i_service(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...) = Kubernetes.create_apiregistration_v1_a_p_i_service(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...)
create_a_p_i_service(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...) = Kubernetes.create_apiregistration_v1beta1_a_p_i_service(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...)

# create_namespaced_persistent_volume_claim
create_namespaced_persistent_volume_claim(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.create_core_v1_namespaced_persistent_volume_claim(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_pod_for_all_namespaces
list_pod_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_pod_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# create_certificate_signing_request
create_certificate_signing_request(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...) = Kubernetes.create_certificates_v1beta1_certificate_signing_request(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...)

# replace_namespaced_replication_controller
replace_namespaced_replication_controller(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_namespaced_replication_controller(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_node_metrics
list_node_metrics(_api::Kubernetes.MetricsV1beta1Api, args...; kwargs...) = Kubernetes.list_metrics_v1beta1_node_metrics(_api::Kubernetes.MetricsV1beta1Api, args...; kwargs...)

# delete_collection_node
delete_collection_node(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_collection_node(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_namespaced_pod
patch_namespaced_pod(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.patch_core_v1_namespaced_pod(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# read_namespaced_replica_set
read_namespaced_replica_set(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.read_apps_v1_namespaced_replica_set(_api::Kubernetes.AppsV1Api, args...; kwargs...)
read_namespaced_replica_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.read_apps_v1beta2_namespaced_replica_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
read_namespaced_replica_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.read_extensions_v1beta1_namespaced_replica_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# delete_volume_attachment
delete_volume_attachment(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.delete_storage_v1_volume_attachment(_api::Kubernetes.StorageV1Api, args...; kwargs...)
delete_volume_attachment(_api::Kubernetes.StorageV1alpha1Api, args...; kwargs...) = Kubernetes.delete_storage_v1alpha1_volume_attachment(_api::Kubernetes.StorageV1alpha1Api, args...; kwargs...)
delete_volume_attachment(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.delete_storage_v1beta1_volume_attachment(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# watch_controller_revision_list_for_all_namespaces
watch_controller_revision_list_for_all_namespaces(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.watch_apps_v1_controller_revision_list_for_all_namespaces(_api::Kubernetes.AppsV1Api, args...; kwargs...)
watch_controller_revision_list_for_all_namespaces(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.watch_apps_v1beta1_controller_revision_list_for_all_namespaces(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
watch_controller_revision_list_for_all_namespaces(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.watch_apps_v1beta2_controller_revision_list_for_all_namespaces(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# watch_namespaced_endpoints
watch_namespaced_endpoints(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespaced_endpoints(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_custom_resource_definition_status
patch_custom_resource_definition_status(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...) = Kubernetes.patch_apiextensions_v1_custom_resource_definition_status(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...)
patch_custom_resource_definition_status(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...) = Kubernetes.patch_apiextensions_v1beta1_custom_resource_definition_status(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...)

# delete_namespaced_deployment
delete_namespaced_deployment(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.delete_apps_v1_namespaced_deployment(_api::Kubernetes.AppsV1Api, args...; kwargs...)
delete_namespaced_deployment(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.delete_apps_v1beta1_namespaced_deployment(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
delete_namespaced_deployment(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.delete_apps_v1beta2_namespaced_deployment(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
delete_namespaced_deployment(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.delete_extensions_v1beta1_namespaced_deployment(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# watch_namespaced_limit_range_list
watch_namespaced_limit_range_list(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespaced_limit_range_list(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_cluster_role_list
watch_cluster_role_list(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1_cluster_role_list(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
watch_cluster_role_list(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1alpha1_cluster_role_list(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
watch_cluster_role_list(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1beta1_cluster_role_list(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# delete_collection_namespaced_replica_set
delete_collection_namespaced_replica_set(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.delete_apps_v1_collection_namespaced_replica_set(_api::Kubernetes.AppsV1Api, args...; kwargs...)
delete_collection_namespaced_replica_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.delete_apps_v1beta2_collection_namespaced_replica_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
delete_collection_namespaced_replica_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.delete_extensions_v1beta1_collection_namespaced_replica_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# patch_namespaced_persistent_volume_claim_status
patch_namespaced_persistent_volume_claim_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.patch_core_v1_namespaced_persistent_volume_claim_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# create_namespaced_network_policy
create_namespaced_network_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.create_extensions_v1beta1_namespaced_network_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
create_namespaced_network_policy(_api::Kubernetes.NetworkingV1Api, args...; kwargs...) = Kubernetes.create_networking_v1_namespaced_network_policy(_api::Kubernetes.NetworkingV1Api, args...; kwargs...)

# read_namespace
read_namespace(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_namespace(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# read_custom_resource_definition_status
read_custom_resource_definition_status(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...) = Kubernetes.read_apiextensions_v1_custom_resource_definition_status(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...)
read_custom_resource_definition_status(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...) = Kubernetes.read_apiextensions_v1beta1_custom_resource_definition_status(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...)

# watch_priority_class
watch_priority_class(_api::Kubernetes.SchedulingV1Api, args...; kwargs...) = Kubernetes.watch_scheduling_v1_priority_class(_api::Kubernetes.SchedulingV1Api, args...; kwargs...)
watch_priority_class(_api::Kubernetes.SchedulingV1alpha1Api, args...; kwargs...) = Kubernetes.watch_scheduling_v1alpha1_priority_class(_api::Kubernetes.SchedulingV1alpha1Api, args...; kwargs...)
watch_priority_class(_api::Kubernetes.SchedulingV1beta1Api, args...; kwargs...) = Kubernetes.watch_scheduling_v1beta1_priority_class(_api::Kubernetes.SchedulingV1beta1Api, args...; kwargs...)

# delete_collection_namespaced_cron_job
delete_collection_namespaced_cron_job(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.delete_batch_v1_collection_namespaced_cron_job(_api::Kubernetes.BatchV1Api, args...; kwargs...)
delete_collection_namespaced_cron_job(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...) = Kubernetes.delete_batch_v1beta1_collection_namespaced_cron_job(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...)
delete_collection_namespaced_cron_job(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...) = Kubernetes.delete_batch_v2alpha1_collection_namespaced_cron_job(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...)

# read_namespaced_pod
read_namespaced_pod(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_namespaced_pod(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_validating_webhook_configuration_list
watch_validating_webhook_configuration_list(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...) = Kubernetes.watch_admissionregistration_v1_validating_webhook_configuration_list(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...)
watch_validating_webhook_configuration_list(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...) = Kubernetes.watch_admissionregistration_v1beta1_validating_webhook_configuration_list(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...)

# create_namespaced_local_subject_access_review
create_namespaced_local_subject_access_review(_api::Kubernetes.AuthorizationV1Api, args...; kwargs...) = Kubernetes.create_authorization_v1_namespaced_local_subject_access_review(_api::Kubernetes.AuthorizationV1Api, args...; kwargs...)
create_namespaced_local_subject_access_review(_api::Kubernetes.AuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.create_authorization_v1beta1_namespaced_local_subject_access_review(_api::Kubernetes.AuthorizationV1beta1Api, args...; kwargs...)

# list_job_for_all_namespaces
list_job_for_all_namespaces(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.list_batch_v1_job_for_all_namespaces(_api::Kubernetes.BatchV1Api, args...; kwargs...)

# watch_network_policy_list_for_all_namespaces
watch_network_policy_list_for_all_namespaces(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.watch_extensions_v1beta1_network_policy_list_for_all_namespaces(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
watch_network_policy_list_for_all_namespaces(_api::Kubernetes.NetworkingV1Api, args...; kwargs...) = Kubernetes.watch_networking_v1_network_policy_list_for_all_namespaces(_api::Kubernetes.NetworkingV1Api, args...; kwargs...)

# delete_cluster_role_binding
delete_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.delete_rbac_authorization_v1_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
delete_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.delete_rbac_authorization_v1alpha1_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
delete_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.delete_rbac_authorization_v1beta1_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# watch_namespaced_stateful_set_list
watch_namespaced_stateful_set_list(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.watch_apps_v1_namespaced_stateful_set_list(_api::Kubernetes.AppsV1Api, args...; kwargs...)
watch_namespaced_stateful_set_list(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.watch_apps_v1beta1_namespaced_stateful_set_list(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
watch_namespaced_stateful_set_list(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.watch_apps_v1beta2_namespaced_stateful_set_list(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# patch_namespaced_job_status
patch_namespaced_job_status(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.patch_batch_v1_namespaced_job_status(_api::Kubernetes.BatchV1Api, args...; kwargs...)

# patch_namespaced_service_account
patch_namespaced_service_account(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.patch_core_v1_namespaced_service_account(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_namespaced_role
watch_namespaced_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1_namespaced_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
watch_namespaced_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1alpha1_namespaced_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
watch_namespaced_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1beta1_namespaced_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# create_namespaced_service_account_token
create_namespaced_service_account_token(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.create_core_v1_namespaced_service_account_token(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_cluster_role
patch_cluster_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.patch_rbac_authorization_v1_cluster_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
patch_cluster_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.patch_rbac_authorization_v1alpha1_cluster_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
patch_cluster_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.patch_rbac_authorization_v1beta1_cluster_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# watch_namespaced_job_list
watch_namespaced_job_list(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.watch_batch_v1_namespaced_job_list(_api::Kubernetes.BatchV1Api, args...; kwargs...)

# watch_namespaced_service_account_list
watch_namespaced_service_account_list(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespaced_service_account_list(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_collection_namespaced_lease
delete_collection_namespaced_lease(_api::Kubernetes.CoordinationV1Api, args...; kwargs...) = Kubernetes.delete_coordination_v1_collection_namespaced_lease(_api::Kubernetes.CoordinationV1Api, args...; kwargs...)
delete_collection_namespaced_lease(_api::Kubernetes.CoordinationV1beta1Api, args...; kwargs...) = Kubernetes.delete_coordination_v1beta1_collection_namespaced_lease(_api::Kubernetes.CoordinationV1beta1Api, args...; kwargs...)

# create_namespaced_service
create_namespaced_service(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.create_core_v1_namespaced_service(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_node
replace_node(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_node(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_namespaced_daemon_set_list
watch_namespaced_daemon_set_list(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.watch_apps_v1_namespaced_daemon_set_list(_api::Kubernetes.AppsV1Api, args...; kwargs...)
watch_namespaced_daemon_set_list(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.watch_apps_v1beta2_namespaced_daemon_set_list(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
watch_namespaced_daemon_set_list(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.watch_extensions_v1beta1_namespaced_daemon_set_list(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# patch_cluster_role_binding
patch_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.patch_rbac_authorization_v1_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
patch_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.patch_rbac_authorization_v1alpha1_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
patch_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.patch_rbac_authorization_v1beta1_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# create_volume_attachment
create_volume_attachment(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.create_storage_v1_volume_attachment(_api::Kubernetes.StorageV1Api, args...; kwargs...)
create_volume_attachment(_api::Kubernetes.StorageV1alpha1Api, args...; kwargs...) = Kubernetes.create_storage_v1alpha1_volume_attachment(_api::Kubernetes.StorageV1alpha1Api, args...; kwargs...)
create_volume_attachment(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.create_storage_v1beta1_volume_attachment(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# patch_namespaced_endpoint_slice
patch_namespaced_endpoint_slice(_api::Kubernetes.DiscoveryV1beta1Api, args...; kwargs...) = Kubernetes.patch_discovery_v1beta1_namespaced_endpoint_slice(_api::Kubernetes.DiscoveryV1beta1Api, args...; kwargs...)

# patch_namespaced_config_map
patch_namespaced_config_map(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.patch_core_v1_namespaced_config_map(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespaced_cron_job_status
replace_namespaced_cron_job_status(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.replace_batch_v1_namespaced_cron_job_status(_api::Kubernetes.BatchV1Api, args...; kwargs...)
replace_namespaced_cron_job_status(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...) = Kubernetes.replace_batch_v1beta1_namespaced_cron_job_status(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...)
replace_namespaced_cron_job_status(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...) = Kubernetes.replace_batch_v2alpha1_namespaced_cron_job_status(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...)

# read_namespaced_deployment_scale
read_namespaced_deployment_scale(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.read_apps_v1_namespaced_deployment_scale(_api::Kubernetes.AppsV1Api, args...; kwargs...)
read_namespaced_deployment_scale(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.read_apps_v1beta1_namespaced_deployment_scale(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
read_namespaced_deployment_scale(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.read_apps_v1beta2_namespaced_deployment_scale(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
read_namespaced_deployment_scale(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.read_extensions_v1beta1_namespaced_deployment_scale(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# connect_get_namespaced_pod_portforward
connect_get_namespaced_pod_portforward(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_get_namespaced_pod_portforward(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# read_namespaced_pod_template
read_namespaced_pod_template(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_namespaced_pod_template(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# create_namespaced_endpoints
create_namespaced_endpoints(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.create_core_v1_namespaced_endpoints(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_cluster_role
delete_cluster_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.delete_rbac_authorization_v1_cluster_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
delete_cluster_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.delete_rbac_authorization_v1alpha1_cluster_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
delete_cluster_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.delete_rbac_authorization_v1beta1_cluster_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# list_cron_job_for_all_namespaces
list_cron_job_for_all_namespaces(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.list_batch_v1_cron_job_for_all_namespaces(_api::Kubernetes.BatchV1Api, args...; kwargs...)
list_cron_job_for_all_namespaces(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...) = Kubernetes.list_batch_v1beta1_cron_job_for_all_namespaces(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...)
list_cron_job_for_all_namespaces(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...) = Kubernetes.list_batch_v2alpha1_cron_job_for_all_namespaces(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...)

# replace_pod_security_policy
replace_pod_security_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.replace_extensions_v1beta1_pod_security_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
replace_pod_security_policy(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...) = Kubernetes.replace_policy_v1beta1_pod_security_policy(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...)

# delete_collection_certificate_signing_request
delete_collection_certificate_signing_request(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...) = Kubernetes.delete_certificates_v1beta1_collection_certificate_signing_request(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...)

# read_c_s_i_node
read_c_s_i_node(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.read_storage_v1_c_s_i_node(_api::Kubernetes.StorageV1Api, args...; kwargs...)
read_c_s_i_node(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.read_storage_v1beta1_c_s_i_node(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# patch_namespaced_pod_preset
patch_namespaced_pod_preset(_api::Kubernetes.SettingsV1alpha1Api, args...; kwargs...) = Kubernetes.patch_settings_v1alpha1_namespaced_pod_preset(_api::Kubernetes.SettingsV1alpha1Api, args...; kwargs...)

# replace_namespaced_daemon_set
replace_namespaced_daemon_set(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.replace_apps_v1_namespaced_daemon_set(_api::Kubernetes.AppsV1Api, args...; kwargs...)
replace_namespaced_daemon_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.replace_apps_v1beta2_namespaced_daemon_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
replace_namespaced_daemon_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.replace_extensions_v1beta1_namespaced_daemon_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# watch_namespaced_service
watch_namespaced_service(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespaced_service(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_validating_webhook_configuration
list_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...) = Kubernetes.list_admissionregistration_v1_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...)
list_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...) = Kubernetes.list_admissionregistration_v1beta1_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...)

# patch_namespaced_event
patch_namespaced_event(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.patch_core_v1_namespaced_event(_api::Kubernetes.CoreV1Api, args...; kwargs...)
patch_namespaced_event(_api::Kubernetes.EventsV1beta1Api, args...; kwargs...) = Kubernetes.patch_events_v1beta1_namespaced_event(_api::Kubernetes.EventsV1beta1Api, args...; kwargs...)

# replace_priority_level_configuration_status
replace_priority_level_configuration_status(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.replace_flowcontrol_apiserver_v1alpha1_priority_level_configuration_status(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)

# read_namespaced_replica_set_scale
read_namespaced_replica_set_scale(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.read_apps_v1_namespaced_replica_set_scale(_api::Kubernetes.AppsV1Api, args...; kwargs...)
read_namespaced_replica_set_scale(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.read_apps_v1beta2_namespaced_replica_set_scale(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
read_namespaced_replica_set_scale(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.read_extensions_v1beta1_namespaced_replica_set_scale(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# connect_put_node_proxy_with_path
connect_put_node_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_put_node_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_namespaced_daemon_set
delete_namespaced_daemon_set(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.delete_apps_v1_namespaced_daemon_set(_api::Kubernetes.AppsV1Api, args...; kwargs...)
delete_namespaced_daemon_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.delete_apps_v1beta2_namespaced_daemon_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
delete_namespaced_daemon_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.delete_extensions_v1beta1_namespaced_daemon_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# watch_horizontal_pod_autoscaler_list_for_all_namespaces
watch_horizontal_pod_autoscaler_list_for_all_namespaces(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...) = Kubernetes.watch_autoscaling_v1_horizontal_pod_autoscaler_list_for_all_namespaces(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...)
watch_horizontal_pod_autoscaler_list_for_all_namespaces(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...) = Kubernetes.watch_autoscaling_v2beta1_horizontal_pod_autoscaler_list_for_all_namespaces(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...)
watch_horizontal_pod_autoscaler_list_for_all_namespaces(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...) = Kubernetes.watch_autoscaling_v2beta2_horizontal_pod_autoscaler_list_for_all_namespaces(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...)

# list_namespaced_replication_controller
list_namespaced_replication_controller(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_namespaced_replication_controller(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# read_node_status
read_node_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_node_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_namespaced_pod_status
patch_namespaced_pod_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.patch_core_v1_namespaced_pod_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# read_namespaced_service
read_namespaced_service(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_namespaced_service(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespaced_limit_range
replace_namespaced_limit_range(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_namespaced_limit_range(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespaced_pod_preset
replace_namespaced_pod_preset(_api::Kubernetes.SettingsV1alpha1Api, args...; kwargs...) = Kubernetes.replace_settings_v1alpha1_namespaced_pod_preset(_api::Kubernetes.SettingsV1alpha1Api, args...; kwargs...)

# read_a_p_i_service_status
read_a_p_i_service_status(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...) = Kubernetes.read_apiregistration_v1_a_p_i_service_status(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...)
read_a_p_i_service_status(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...) = Kubernetes.read_apiregistration_v1beta1_a_p_i_service_status(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...)

# list_namespaced_secret
list_namespaced_secret(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_namespaced_secret(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# create_namespaced_event
create_namespaced_event(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.create_core_v1_namespaced_event(_api::Kubernetes.CoreV1Api, args...; kwargs...)
create_namespaced_event(_api::Kubernetes.EventsV1beta1Api, args...; kwargs...) = Kubernetes.create_events_v1beta1_namespaced_event(_api::Kubernetes.EventsV1beta1Api, args...; kwargs...)

# delete_namespaced_endpoints
delete_namespaced_endpoints(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_namespaced_endpoints(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_pod_security_policy
delete_pod_security_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.delete_extensions_v1beta1_pod_security_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
delete_pod_security_policy(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...) = Kubernetes.delete_policy_v1beta1_pod_security_policy(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...)

# read_namespaced_deployment
read_namespaced_deployment(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.read_apps_v1_namespaced_deployment(_api::Kubernetes.AppsV1Api, args...; kwargs...)
read_namespaced_deployment(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.read_apps_v1beta1_namespaced_deployment(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
read_namespaced_deployment(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.read_apps_v1beta2_namespaced_deployment(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
read_namespaced_deployment(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.read_extensions_v1beta1_namespaced_deployment(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# replace_namespaced_replication_controller_status
replace_namespaced_replication_controller_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_namespaced_replication_controller_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# create_custom_resource_definition
create_custom_resource_definition(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...) = Kubernetes.create_apiextensions_v1_custom_resource_definition(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...)
create_custom_resource_definition(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...) = Kubernetes.create_apiextensions_v1beta1_custom_resource_definition(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...)

# delete_collection_namespaced_network_policy
delete_collection_namespaced_network_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.delete_extensions_v1beta1_collection_namespaced_network_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
delete_collection_namespaced_network_policy(_api::Kubernetes.NetworkingV1Api, args...; kwargs...) = Kubernetes.delete_networking_v1_collection_namespaced_network_policy(_api::Kubernetes.NetworkingV1Api, args...; kwargs...)

# read_runtime_class
read_runtime_class(_api::Kubernetes.NodeV1alpha1Api, args...; kwargs...) = Kubernetes.read_node_v1alpha1_runtime_class(_api::Kubernetes.NodeV1alpha1Api, args...; kwargs...)
read_runtime_class(_api::Kubernetes.NodeV1beta1Api, args...; kwargs...) = Kubernetes.read_node_v1beta1_runtime_class(_api::Kubernetes.NodeV1beta1Api, args...; kwargs...)

# patch_namespaced_secret
patch_namespaced_secret(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.patch_core_v1_namespaced_secret(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_replication_controller_list_for_all_namespaces
watch_replication_controller_list_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_replication_controller_list_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_network_policy_for_all_namespaces
list_network_policy_for_all_namespaces(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.list_extensions_v1beta1_network_policy_for_all_namespaces(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
list_network_policy_for_all_namespaces(_api::Kubernetes.NetworkingV1Api, args...; kwargs...) = Kubernetes.list_networking_v1_network_policy_for_all_namespaces(_api::Kubernetes.NetworkingV1Api, args...; kwargs...)

# read_persistent_volume_status
read_persistent_volume_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_persistent_volume_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# connect_delete_namespaced_pod_proxy
connect_delete_namespaced_pod_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_delete_namespaced_pod_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# connect_post_namespaced_service_proxy_with_path
connect_post_namespaced_service_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_post_namespaced_service_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# connect_options_node_proxy_with_path
connect_options_node_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_options_node_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_namespaced_pod_template
watch_namespaced_pod_template(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespaced_pod_template(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# create_namespaced_replication_controller
create_namespaced_replication_controller(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.create_core_v1_namespaced_replication_controller(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_secret_list_for_all_namespaces
watch_secret_list_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_secret_list_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# read_namespaced_stateful_set_scale
read_namespaced_stateful_set_scale(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.read_apps_v1_namespaced_stateful_set_scale(_api::Kubernetes.AppsV1Api, args...; kwargs...)
read_namespaced_stateful_set_scale(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.read_apps_v1beta1_namespaced_stateful_set_scale(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
read_namespaced_stateful_set_scale(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.read_apps_v1beta2_namespaced_stateful_set_scale(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# create_namespaced_daemon_set
create_namespaced_daemon_set(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.create_apps_v1_namespaced_daemon_set(_api::Kubernetes.AppsV1Api, args...; kwargs...)
create_namespaced_daemon_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.create_apps_v1beta2_namespaced_daemon_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
create_namespaced_daemon_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.create_extensions_v1beta1_namespaced_daemon_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# delete_namespaced_controller_revision
delete_namespaced_controller_revision(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.delete_apps_v1_namespaced_controller_revision(_api::Kubernetes.AppsV1Api, args...; kwargs...)
delete_namespaced_controller_revision(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.delete_apps_v1beta1_namespaced_controller_revision(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
delete_namespaced_controller_revision(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.delete_apps_v1beta2_namespaced_controller_revision(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# connect_head_namespaced_pod_proxy
connect_head_namespaced_pod_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_head_namespaced_pod_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_collection_namespaced_pod
delete_collection_namespaced_pod(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_collection_namespaced_pod(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_flow_schema
delete_flow_schema(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.delete_flowcontrol_apiserver_v1alpha1_flow_schema(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)

# connect_post_namespaced_pod_proxy_with_path
connect_post_namespaced_pod_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_post_namespaced_pod_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# connect_delete_namespaced_pod_proxy_with_path
connect_delete_namespaced_pod_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_delete_namespaced_pod_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_horizontal_pod_autoscaler_for_all_namespaces
list_horizontal_pod_autoscaler_for_all_namespaces(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...) = Kubernetes.list_autoscaling_v1_horizontal_pod_autoscaler_for_all_namespaces(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...)
list_horizontal_pod_autoscaler_for_all_namespaces(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...) = Kubernetes.list_autoscaling_v2beta1_horizontal_pod_autoscaler_for_all_namespaces(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...)
list_horizontal_pod_autoscaler_for_all_namespaces(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...) = Kubernetes.list_autoscaling_v2beta2_horizontal_pod_autoscaler_for_all_namespaces(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...)

# connect_post_node_proxy_with_path
connect_post_node_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_post_node_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_namespaced_job
list_namespaced_job(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.list_batch_v1_namespaced_job(_api::Kubernetes.BatchV1Api, args...; kwargs...)

# read_namespaced_controller_revision
read_namespaced_controller_revision(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.read_apps_v1_namespaced_controller_revision(_api::Kubernetes.AppsV1Api, args...; kwargs...)
read_namespaced_controller_revision(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.read_apps_v1beta1_namespaced_controller_revision(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
read_namespaced_controller_revision(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.read_apps_v1beta2_namespaced_controller_revision(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# get_a_p_i_versions
get_a_p_i_versions(_api::Kubernetes.ApisApi, args...; kwargs...) = Kubernetes.get_a_p_i_versions(_api::Kubernetes.ApisApi, args...; kwargs...)

# read_namespaced_event
read_namespaced_event(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_namespaced_event(_api::Kubernetes.CoreV1Api, args...; kwargs...)
read_namespaced_event(_api::Kubernetes.EventsV1beta1Api, args...; kwargs...) = Kubernetes.read_events_v1beta1_namespaced_event(_api::Kubernetes.EventsV1beta1Api, args...; kwargs...)

# list_ingress_for_all_namespaces
list_ingress_for_all_namespaces(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.list_extensions_v1beta1_ingress_for_all_namespaces(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
list_ingress_for_all_namespaces(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...) = Kubernetes.list_networking_v1beta1_ingress_for_all_namespaces(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...)

# watch_namespaced_lease_list
watch_namespaced_lease_list(_api::Kubernetes.CoordinationV1Api, args...; kwargs...) = Kubernetes.watch_coordination_v1_namespaced_lease_list(_api::Kubernetes.CoordinationV1Api, args...; kwargs...)
watch_namespaced_lease_list(_api::Kubernetes.CoordinationV1beta1Api, args...; kwargs...) = Kubernetes.watch_coordination_v1beta1_namespaced_lease_list(_api::Kubernetes.CoordinationV1beta1Api, args...; kwargs...)

# patch_certificate_signing_request_status
patch_certificate_signing_request_status(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...) = Kubernetes.patch_certificates_v1beta1_certificate_signing_request_status(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...)

# watch_namespaced_pod_list
watch_namespaced_pod_list(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespaced_pod_list(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# connect_options_namespaced_service_proxy_with_path
connect_options_namespaced_service_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_options_namespaced_service_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# create_namespaced_endpoint_slice
create_namespaced_endpoint_slice(_api::Kubernetes.DiscoveryV1beta1Api, args...; kwargs...) = Kubernetes.create_discovery_v1beta1_namespaced_endpoint_slice(_api::Kubernetes.DiscoveryV1beta1Api, args...; kwargs...)

# delete_priority_class
delete_priority_class(_api::Kubernetes.SchedulingV1Api, args...; kwargs...) = Kubernetes.delete_scheduling_v1_priority_class(_api::Kubernetes.SchedulingV1Api, args...; kwargs...)
delete_priority_class(_api::Kubernetes.SchedulingV1alpha1Api, args...; kwargs...) = Kubernetes.delete_scheduling_v1alpha1_priority_class(_api::Kubernetes.SchedulingV1alpha1Api, args...; kwargs...)
delete_priority_class(_api::Kubernetes.SchedulingV1beta1Api, args...; kwargs...) = Kubernetes.delete_scheduling_v1beta1_priority_class(_api::Kubernetes.SchedulingV1beta1Api, args...; kwargs...)

# list_mutating_webhook_configuration
list_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...) = Kubernetes.list_admissionregistration_v1_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...)
list_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...) = Kubernetes.list_admissionregistration_v1beta1_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...)

# delete_collection_namespaced_controller_revision
delete_collection_namespaced_controller_revision(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.delete_apps_v1_collection_namespaced_controller_revision(_api::Kubernetes.AppsV1Api, args...; kwargs...)
delete_collection_namespaced_controller_revision(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.delete_apps_v1beta1_collection_namespaced_controller_revision(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
delete_collection_namespaced_controller_revision(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.delete_apps_v1beta2_collection_namespaced_controller_revision(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# patch_custom_resource_definition
patch_custom_resource_definition(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...) = Kubernetes.patch_apiextensions_v1_custom_resource_definition(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...)
patch_custom_resource_definition(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...) = Kubernetes.patch_apiextensions_v1beta1_custom_resource_definition(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...)

# connect_options_namespaced_pod_proxy
connect_options_namespaced_pod_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_options_namespaced_pod_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_namespaced_pod_disruption_budget_list
watch_namespaced_pod_disruption_budget_list(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...) = Kubernetes.watch_policy_v1beta1_namespaced_pod_disruption_budget_list(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...)

# patch_audit_sink
patch_audit_sink(_api::Kubernetes.AuditregistrationV1alpha1Api, args...; kwargs...) = Kubernetes.patch_auditregistration_v1alpha1_audit_sink(_api::Kubernetes.AuditregistrationV1alpha1Api, args...; kwargs...)

# replace_persistent_volume_status
replace_persistent_volume_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_persistent_volume_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_namespaced_controller_revision
watch_namespaced_controller_revision(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.watch_apps_v1_namespaced_controller_revision(_api::Kubernetes.AppsV1Api, args...; kwargs...)
watch_namespaced_controller_revision(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.watch_apps_v1beta1_namespaced_controller_revision(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
watch_namespaced_controller_revision(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.watch_apps_v1beta2_namespaced_controller_revision(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# connect_options_namespaced_service_proxy
connect_options_namespaced_service_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_options_namespaced_service_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespaced_deployment_status
replace_namespaced_deployment_status(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.replace_apps_v1_namespaced_deployment_status(_api::Kubernetes.AppsV1Api, args...; kwargs...)
replace_namespaced_deployment_status(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.replace_apps_v1beta1_namespaced_deployment_status(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
replace_namespaced_deployment_status(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.replace_apps_v1beta2_namespaced_deployment_status(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
replace_namespaced_deployment_status(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.replace_extensions_v1beta1_namespaced_deployment_status(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# create_namespaced_pod_template
create_namespaced_pod_template(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.create_core_v1_namespaced_pod_template(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_collection_pod_security_policy
delete_collection_pod_security_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.delete_extensions_v1beta1_collection_pod_security_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
delete_collection_pod_security_policy(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...) = Kubernetes.delete_policy_v1beta1_collection_pod_security_policy(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...)

# list_persistent_volume_claim_for_all_namespaces
list_persistent_volume_claim_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_persistent_volume_claim_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_flow_schema_list
watch_flow_schema_list(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.watch_flowcontrol_apiserver_v1alpha1_flow_schema_list(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)

# list_namespaced_role_binding
list_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.list_rbac_authorization_v1_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
list_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.list_rbac_authorization_v1alpha1_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
list_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.list_rbac_authorization_v1beta1_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# watch_storage_class
watch_storage_class(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.watch_storage_v1_storage_class(_api::Kubernetes.StorageV1Api, args...; kwargs...)
watch_storage_class(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.watch_storage_v1beta1_storage_class(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# watch_namespaced_event_list
watch_namespaced_event_list(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespaced_event_list(_api::Kubernetes.CoreV1Api, args...; kwargs...)
watch_namespaced_event_list(_api::Kubernetes.EventsV1beta1Api, args...; kwargs...) = Kubernetes.watch_events_v1beta1_namespaced_event_list(_api::Kubernetes.EventsV1beta1Api, args...; kwargs...)

# watch_persistent_volume
watch_persistent_volume(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_persistent_volume(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# read_namespaced_replication_controller_status
read_namespaced_replication_controller_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_namespaced_replication_controller_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_certificate_signing_request
delete_certificate_signing_request(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...) = Kubernetes.delete_certificates_v1beta1_certificate_signing_request(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...)

# patch_a_p_i_service_status
patch_a_p_i_service_status(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...) = Kubernetes.patch_apiregistration_v1_a_p_i_service_status(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...)
patch_a_p_i_service_status(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...) = Kubernetes.patch_apiregistration_v1beta1_a_p_i_service_status(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...)

# connect_delete_node_proxy_with_path
connect_delete_node_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_delete_node_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespace_status
replace_namespace_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_namespace_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# read_namespaced_cron_job
read_namespaced_cron_job(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.read_batch_v1_namespaced_cron_job(_api::Kubernetes.BatchV1Api, args...; kwargs...)
read_namespaced_cron_job(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...) = Kubernetes.read_batch_v1beta1_namespaced_cron_job(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...)
read_namespaced_cron_job(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...) = Kubernetes.read_batch_v2alpha1_namespaced_cron_job(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...)

# replace_namespaced_pod
replace_namespaced_pod(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_namespaced_pod(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# connect_post_namespaced_pod_attach
connect_post_namespaced_pod_attach(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_post_namespaced_pod_attach(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_collection_cluster_role_binding
delete_collection_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.delete_rbac_authorization_v1_collection_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
delete_collection_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.delete_rbac_authorization_v1alpha1_collection_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
delete_collection_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.delete_rbac_authorization_v1beta1_collection_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# watch_c_s_i_node
watch_c_s_i_node(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.watch_storage_v1_c_s_i_node(_api::Kubernetes.StorageV1Api, args...; kwargs...)
watch_c_s_i_node(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.watch_storage_v1beta1_c_s_i_node(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# create_namespaced_controller_revision
create_namespaced_controller_revision(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.create_apps_v1_namespaced_controller_revision(_api::Kubernetes.AppsV1Api, args...; kwargs...)
create_namespaced_controller_revision(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.create_apps_v1beta1_namespaced_controller_revision(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
create_namespaced_controller_revision(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.create_apps_v1beta2_namespaced_controller_revision(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# watch_namespaced_controller_revision_list
watch_namespaced_controller_revision_list(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.watch_apps_v1_namespaced_controller_revision_list(_api::Kubernetes.AppsV1Api, args...; kwargs...)
watch_namespaced_controller_revision_list(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.watch_apps_v1beta1_namespaced_controller_revision_list(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
watch_namespaced_controller_revision_list(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.watch_apps_v1beta2_namespaced_controller_revision_list(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# list_namespace
list_namespace(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_namespace(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_namespaced_pod_disruption_budget
list_namespaced_pod_disruption_budget(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...) = Kubernetes.list_policy_v1beta1_namespaced_pod_disruption_budget(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...)

# delete_collection_storage_class
delete_collection_storage_class(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.delete_storage_v1_collection_storage_class(_api::Kubernetes.StorageV1Api, args...; kwargs...)
delete_collection_storage_class(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.delete_storage_v1beta1_collection_storage_class(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# delete_c_s_i_driver
delete_c_s_i_driver(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.delete_storage_v1beta1_c_s_i_driver(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# watch_namespaced_limit_range
watch_namespaced_limit_range(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespaced_limit_range(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# connect_options_namespaced_pod_proxy_with_path
connect_options_namespaced_pod_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_options_namespaced_pod_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_collection_cluster_role
delete_collection_cluster_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.delete_rbac_authorization_v1_collection_cluster_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
delete_collection_cluster_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.delete_rbac_authorization_v1alpha1_collection_cluster_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
delete_collection_cluster_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.delete_rbac_authorization_v1beta1_collection_cluster_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# replace_namespaced_stateful_set
replace_namespaced_stateful_set(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.replace_apps_v1_namespaced_stateful_set(_api::Kubernetes.AppsV1Api, args...; kwargs...)
replace_namespaced_stateful_set(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.replace_apps_v1beta1_namespaced_stateful_set(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
replace_namespaced_stateful_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.replace_apps_v1beta2_namespaced_stateful_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# replace_namespaced_pod_status
replace_namespaced_pod_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_namespaced_pod_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_custom_resource_definition_status
replace_custom_resource_definition_status(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...) = Kubernetes.replace_apiextensions_v1_custom_resource_definition_status(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...)
replace_custom_resource_definition_status(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...) = Kubernetes.replace_apiextensions_v1beta1_custom_resource_definition_status(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...)

# watch_namespaced_daemon_set
watch_namespaced_daemon_set(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.watch_apps_v1_namespaced_daemon_set(_api::Kubernetes.AppsV1Api, args...; kwargs...)
watch_namespaced_daemon_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.watch_apps_v1beta2_namespaced_daemon_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
watch_namespaced_daemon_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.watch_extensions_v1beta1_namespaced_daemon_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# connect_post_namespaced_service_proxy
connect_post_namespaced_service_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_post_namespaced_service_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_namespaced_replica_set_status
patch_namespaced_replica_set_status(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.patch_apps_v1_namespaced_replica_set_status(_api::Kubernetes.AppsV1Api, args...; kwargs...)
patch_namespaced_replica_set_status(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.patch_apps_v1beta2_namespaced_replica_set_status(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
patch_namespaced_replica_set_status(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.patch_extensions_v1beta1_namespaced_replica_set_status(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# patch_namespaced_pod_template
patch_namespaced_pod_template(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.patch_core_v1_namespaced_pod_template(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_a_p_i_service_status
replace_a_p_i_service_status(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...) = Kubernetes.replace_apiregistration_v1_a_p_i_service_status(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...)
replace_a_p_i_service_status(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...) = Kubernetes.replace_apiregistration_v1beta1_a_p_i_service_status(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...)

# list_pod_security_policy
list_pod_security_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.list_extensions_v1beta1_pod_security_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
list_pod_security_policy(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...) = Kubernetes.list_policy_v1beta1_pod_security_policy(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...)

# create_namespaced_lease
create_namespaced_lease(_api::Kubernetes.CoordinationV1Api, args...; kwargs...) = Kubernetes.create_coordination_v1_namespaced_lease(_api::Kubernetes.CoordinationV1Api, args...; kwargs...)
create_namespaced_lease(_api::Kubernetes.CoordinationV1beta1Api, args...; kwargs...) = Kubernetes.create_coordination_v1beta1_namespaced_lease(_api::Kubernetes.CoordinationV1beta1Api, args...; kwargs...)

# patch_namespaced_stateful_set_status
patch_namespaced_stateful_set_status(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.patch_apps_v1_namespaced_stateful_set_status(_api::Kubernetes.AppsV1Api, args...; kwargs...)
patch_namespaced_stateful_set_status(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.patch_apps_v1beta1_namespaced_stateful_set_status(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
patch_namespaced_stateful_set_status(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.patch_apps_v1beta2_namespaced_stateful_set_status(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# read_namespaced_pod_status
read_namespaced_pod_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_namespaced_pod_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_namespaced_network_policy
watch_namespaced_network_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.watch_extensions_v1beta1_namespaced_network_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
watch_namespaced_network_policy(_api::Kubernetes.NetworkingV1Api, args...; kwargs...) = Kubernetes.watch_networking_v1_namespaced_network_policy(_api::Kubernetes.NetworkingV1Api, args...; kwargs...)

# read_namespaced_daemon_set
read_namespaced_daemon_set(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.read_apps_v1_namespaced_daemon_set(_api::Kubernetes.AppsV1Api, args...; kwargs...)
read_namespaced_daemon_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.read_apps_v1beta2_namespaced_daemon_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
read_namespaced_daemon_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.read_extensions_v1beta1_namespaced_daemon_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# get_a_p_i_resources
get_a_p_i_resources(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...) = Kubernetes.get_admissionregistration_v1_a_p_i_resources(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...) = Kubernetes.get_admissionregistration_v1beta1_a_p_i_resources(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...) = Kubernetes.get_apiextensions_v1_a_p_i_resources(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...) = Kubernetes.get_apiextensions_v1beta1_a_p_i_resources(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...) = Kubernetes.get_apiregistration_v1_a_p_i_resources(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...) = Kubernetes.get_apiregistration_v1beta1_a_p_i_resources(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.get_apps_v1_a_p_i_resources(_api::Kubernetes.AppsV1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.get_apps_v1beta1_a_p_i_resources(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.get_apps_v1beta2_a_p_i_resources(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.AuditregistrationV1alpha1Api, args...; kwargs...) = Kubernetes.get_auditregistration_v1alpha1_a_p_i_resources(_api::Kubernetes.AuditregistrationV1alpha1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.AuthenticationV1Api, args...; kwargs...) = Kubernetes.get_authentication_v1_a_p_i_resources(_api::Kubernetes.AuthenticationV1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.AuthenticationV1beta1Api, args...; kwargs...) = Kubernetes.get_authentication_v1beta1_a_p_i_resources(_api::Kubernetes.AuthenticationV1beta1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.AuthorizationV1Api, args...; kwargs...) = Kubernetes.get_authorization_v1_a_p_i_resources(_api::Kubernetes.AuthorizationV1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.AuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.get_authorization_v1beta1_a_p_i_resources(_api::Kubernetes.AuthorizationV1beta1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...) = Kubernetes.get_autoscaling_v1_a_p_i_resources(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...) = Kubernetes.get_autoscaling_v2beta1_a_p_i_resources(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...) = Kubernetes.get_autoscaling_v2beta2_a_p_i_resources(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.get_batch_v1_a_p_i_resources(_api::Kubernetes.BatchV1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...) = Kubernetes.get_batch_v1beta1_a_p_i_resources(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...) = Kubernetes.get_batch_v2alpha1_a_p_i_resources(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...) = Kubernetes.get_certificates_v1beta1_a_p_i_resources(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.CoordinationV1Api, args...; kwargs...) = Kubernetes.get_coordination_v1_a_p_i_resources(_api::Kubernetes.CoordinationV1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.CoordinationV1beta1Api, args...; kwargs...) = Kubernetes.get_coordination_v1beta1_a_p_i_resources(_api::Kubernetes.CoordinationV1beta1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.get_core_v1_a_p_i_resources(_api::Kubernetes.CoreV1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.DiscoveryV1beta1Api, args...; kwargs...) = Kubernetes.get_discovery_v1beta1_a_p_i_resources(_api::Kubernetes.DiscoveryV1beta1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.EventsV1beta1Api, args...; kwargs...) = Kubernetes.get_events_v1beta1_a_p_i_resources(_api::Kubernetes.EventsV1beta1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.get_extensions_v1beta1_a_p_i_resources(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.get_flowcontrol_apiserver_v1alpha1_a_p_i_resources(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.NetworkingV1Api, args...; kwargs...) = Kubernetes.get_networking_v1_a_p_i_resources(_api::Kubernetes.NetworkingV1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...) = Kubernetes.get_networking_v1beta1_a_p_i_resources(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.NodeV1alpha1Api, args...; kwargs...) = Kubernetes.get_node_v1alpha1_a_p_i_resources(_api::Kubernetes.NodeV1alpha1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.NodeV1beta1Api, args...; kwargs...) = Kubernetes.get_node_v1beta1_a_p_i_resources(_api::Kubernetes.NodeV1beta1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...) = Kubernetes.get_policy_v1beta1_a_p_i_resources(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.get_rbac_authorization_v1_a_p_i_resources(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.get_rbac_authorization_v1alpha1_a_p_i_resources(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.get_rbac_authorization_v1beta1_a_p_i_resources(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.SchedulingV1Api, args...; kwargs...) = Kubernetes.get_scheduling_v1_a_p_i_resources(_api::Kubernetes.SchedulingV1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.SchedulingV1alpha1Api, args...; kwargs...) = Kubernetes.get_scheduling_v1alpha1_a_p_i_resources(_api::Kubernetes.SchedulingV1alpha1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.SchedulingV1beta1Api, args...; kwargs...) = Kubernetes.get_scheduling_v1beta1_a_p_i_resources(_api::Kubernetes.SchedulingV1beta1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.SettingsV1alpha1Api, args...; kwargs...) = Kubernetes.get_settings_v1alpha1_a_p_i_resources(_api::Kubernetes.SettingsV1alpha1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.get_storage_v1_a_p_i_resources(_api::Kubernetes.StorageV1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.StorageV1alpha1Api, args...; kwargs...) = Kubernetes.get_storage_v1alpha1_a_p_i_resources(_api::Kubernetes.StorageV1alpha1Api, args...; kwargs...)
get_a_p_i_resources(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.get_storage_v1beta1_a_p_i_resources(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# patch_namespaced_job
patch_namespaced_job(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.patch_batch_v1_namespaced_job(_api::Kubernetes.BatchV1Api, args...; kwargs...)

# read_namespaced_config_map
read_namespaced_config_map(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_namespaced_config_map(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# read_namespaced_cron_job_status
read_namespaced_cron_job_status(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.read_batch_v1_namespaced_cron_job_status(_api::Kubernetes.BatchV1Api, args...; kwargs...)
read_namespaced_cron_job_status(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...) = Kubernetes.read_batch_v1beta1_namespaced_cron_job_status(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...)
read_namespaced_cron_job_status(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...) = Kubernetes.read_batch_v2alpha1_namespaced_cron_job_status(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...)

# patch_node_status
patch_node_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.patch_core_v1_node_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# create_namespaced_config_map
create_namespaced_config_map(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.create_core_v1_namespaced_config_map(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_namespaced_service_account
list_namespaced_service_account(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_namespaced_service_account(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespaced_replica_set_status
replace_namespaced_replica_set_status(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.replace_apps_v1_namespaced_replica_set_status(_api::Kubernetes.AppsV1Api, args...; kwargs...)
replace_namespaced_replica_set_status(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.replace_apps_v1beta2_namespaced_replica_set_status(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
replace_namespaced_replica_set_status(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.replace_extensions_v1beta1_namespaced_replica_set_status(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# delete_collection_namespaced_endpoint_slice
delete_collection_namespaced_endpoint_slice(_api::Kubernetes.DiscoveryV1beta1Api, args...; kwargs...) = Kubernetes.delete_discovery_v1beta1_collection_namespaced_endpoint_slice(_api::Kubernetes.DiscoveryV1beta1Api, args...; kwargs...)

# create_persistent_volume
create_persistent_volume(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.create_core_v1_persistent_volume(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespaced_job_status
replace_namespaced_job_status(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.replace_batch_v1_namespaced_job_status(_api::Kubernetes.BatchV1Api, args...; kwargs...)

# read_namespaced_pod_metrics
read_namespaced_pod_metrics(_api::Kubernetes.MetricsV1beta1Api, args...; kwargs...) = Kubernetes.read_metrics_v1beta1_namespaced_pod_metrics(_api::Kubernetes.MetricsV1beta1Api, args...; kwargs...)

# read_cluster_role
read_cluster_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.read_rbac_authorization_v1_cluster_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
read_cluster_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.read_rbac_authorization_v1alpha1_cluster_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
read_cluster_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.read_rbac_authorization_v1beta1_cluster_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# patch_runtime_class
patch_runtime_class(_api::Kubernetes.NodeV1alpha1Api, args...; kwargs...) = Kubernetes.patch_node_v1alpha1_runtime_class(_api::Kubernetes.NodeV1alpha1Api, args...; kwargs...)
patch_runtime_class(_api::Kubernetes.NodeV1beta1Api, args...; kwargs...) = Kubernetes.patch_node_v1beta1_runtime_class(_api::Kubernetes.NodeV1beta1Api, args...; kwargs...)

# replace_namespaced_secret
replace_namespaced_secret(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_namespaced_secret(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_collection_namespaced_secret
delete_collection_namespaced_secret(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_collection_namespaced_secret(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_stateful_set_for_all_namespaces
list_stateful_set_for_all_namespaces(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.list_apps_v1_stateful_set_for_all_namespaces(_api::Kubernetes.AppsV1Api, args...; kwargs...)
list_stateful_set_for_all_namespaces(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.list_apps_v1beta1_stateful_set_for_all_namespaces(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
list_stateful_set_for_all_namespaces(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.list_apps_v1beta2_stateful_set_for_all_namespaces(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# patch_namespaced_cron_job_status
patch_namespaced_cron_job_status(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.patch_batch_v1_namespaced_cron_job_status(_api::Kubernetes.BatchV1Api, args...; kwargs...)
patch_namespaced_cron_job_status(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...) = Kubernetes.patch_batch_v1beta1_namespaced_cron_job_status(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...)
patch_namespaced_cron_job_status(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...) = Kubernetes.patch_batch_v2alpha1_namespaced_cron_job_status(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...)

# replace_cluster_role_binding
replace_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.replace_rbac_authorization_v1_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
replace_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.replace_rbac_authorization_v1alpha1_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
replace_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.replace_rbac_authorization_v1beta1_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# watch_namespaced_pod_preset
watch_namespaced_pod_preset(_api::Kubernetes.SettingsV1alpha1Api, args...; kwargs...) = Kubernetes.watch_settings_v1alpha1_namespaced_pod_preset(_api::Kubernetes.SettingsV1alpha1Api, args...; kwargs...)

# watch_namespaced_lease
watch_namespaced_lease(_api::Kubernetes.CoordinationV1Api, args...; kwargs...) = Kubernetes.watch_coordination_v1_namespaced_lease(_api::Kubernetes.CoordinationV1Api, args...; kwargs...)
watch_namespaced_lease(_api::Kubernetes.CoordinationV1beta1Api, args...; kwargs...) = Kubernetes.watch_coordination_v1beta1_namespaced_lease(_api::Kubernetes.CoordinationV1beta1Api, args...; kwargs...)

# replace_namespaced_controller_revision
replace_namespaced_controller_revision(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.replace_apps_v1_namespaced_controller_revision(_api::Kubernetes.AppsV1Api, args...; kwargs...)
replace_namespaced_controller_revision(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.replace_apps_v1beta1_namespaced_controller_revision(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
replace_namespaced_controller_revision(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.replace_apps_v1beta2_namespaced_controller_revision(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# patch_namespaced_resource_quota_status
patch_namespaced_resource_quota_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.patch_core_v1_namespaced_resource_quota_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_endpoints_list_for_all_namespaces
watch_endpoints_list_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_endpoints_list_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# connect_patch_namespaced_service_proxy
connect_patch_namespaced_service_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_patch_namespaced_service_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# read_namespaced_service_account
read_namespaced_service_account(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_namespaced_service_account(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_namespaced_ingress
watch_namespaced_ingress(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.watch_extensions_v1beta1_namespaced_ingress(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
watch_namespaced_ingress(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...) = Kubernetes.watch_networking_v1beta1_namespaced_ingress(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...)

# watch_c_s_i_driver_list
watch_c_s_i_driver_list(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.watch_storage_v1beta1_c_s_i_driver_list(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# read_component_status
read_component_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_component_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespaced_deployment
replace_namespaced_deployment(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.replace_apps_v1_namespaced_deployment(_api::Kubernetes.AppsV1Api, args...; kwargs...)
replace_namespaced_deployment(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.replace_apps_v1beta1_namespaced_deployment(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
replace_namespaced_deployment(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.replace_apps_v1beta2_namespaced_deployment(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
replace_namespaced_deployment(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.replace_extensions_v1beta1_namespaced_deployment(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# watch_namespaced_service_list
watch_namespaced_service_list(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespaced_service_list(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespaced_resource_quota_status
replace_namespaced_resource_quota_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_namespaced_resource_quota_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespaced_config_map
replace_namespaced_config_map(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_namespaced_config_map(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_volume_attachment_list
watch_volume_attachment_list(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.watch_storage_v1_volume_attachment_list(_api::Kubernetes.StorageV1Api, args...; kwargs...)
watch_volume_attachment_list(_api::Kubernetes.StorageV1alpha1Api, args...; kwargs...) = Kubernetes.watch_storage_v1alpha1_volume_attachment_list(_api::Kubernetes.StorageV1alpha1Api, args...; kwargs...)
watch_volume_attachment_list(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.watch_storage_v1beta1_volume_attachment_list(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# read_namespaced_secret
read_namespaced_secret(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_namespaced_secret(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# read_node
read_node(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_node(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# create_token_review
create_token_review(_api::Kubernetes.AuthenticationV1Api, args...; kwargs...) = Kubernetes.create_authentication_v1_token_review(_api::Kubernetes.AuthenticationV1Api, args...; kwargs...)
create_token_review(_api::Kubernetes.AuthenticationV1beta1Api, args...; kwargs...) = Kubernetes.create_authentication_v1beta1_token_review(_api::Kubernetes.AuthenticationV1beta1Api, args...; kwargs...)

# watch_validating_webhook_configuration
watch_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...) = Kubernetes.watch_admissionregistration_v1_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...)
watch_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...) = Kubernetes.watch_admissionregistration_v1beta1_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...)

# create_namespaced_ingress
create_namespaced_ingress(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.create_extensions_v1beta1_namespaced_ingress(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
create_namespaced_ingress(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...) = Kubernetes.create_networking_v1beta1_namespaced_ingress(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...)

# patch_namespaced_ingress_status
patch_namespaced_ingress_status(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.patch_extensions_v1beta1_namespaced_ingress_status(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
patch_namespaced_ingress_status(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...) = Kubernetes.patch_networking_v1beta1_namespaced_ingress_status(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...)

# watch_priority_level_configuration
watch_priority_level_configuration(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.watch_flowcontrol_apiserver_v1alpha1_priority_level_configuration(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)

# read_cluster_role_binding
read_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.read_rbac_authorization_v1_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
read_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.read_rbac_authorization_v1alpha1_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
read_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.read_rbac_authorization_v1beta1_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# replace_cluster_role
replace_cluster_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.replace_rbac_authorization_v1_cluster_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
replace_cluster_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.replace_rbac_authorization_v1alpha1_cluster_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
replace_cluster_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.replace_rbac_authorization_v1beta1_cluster_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# delete_namespaced_secret
delete_namespaced_secret(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_namespaced_secret(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_provisioner
patch_provisioner(_api::Kubernetes.KarpenterShV1alpha5Api, args...; kwargs...) = Kubernetes.patch_karpenter_sh_v1alpha5_provisioner(_api::Kubernetes.KarpenterShV1alpha5Api, args...; kwargs...)

# delete_collection_priority_class
delete_collection_priority_class(_api::Kubernetes.SchedulingV1Api, args...; kwargs...) = Kubernetes.delete_scheduling_v1_collection_priority_class(_api::Kubernetes.SchedulingV1Api, args...; kwargs...)
delete_collection_priority_class(_api::Kubernetes.SchedulingV1alpha1Api, args...; kwargs...) = Kubernetes.delete_scheduling_v1alpha1_collection_priority_class(_api::Kubernetes.SchedulingV1alpha1Api, args...; kwargs...)
delete_collection_priority_class(_api::Kubernetes.SchedulingV1beta1Api, args...; kwargs...) = Kubernetes.delete_scheduling_v1beta1_collection_priority_class(_api::Kubernetes.SchedulingV1beta1Api, args...; kwargs...)

# create_cluster_role
create_cluster_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.create_rbac_authorization_v1_cluster_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
create_cluster_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.create_rbac_authorization_v1alpha1_cluster_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
create_cluster_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.create_rbac_authorization_v1beta1_cluster_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# watch_role_binding_list_for_all_namespaces
watch_role_binding_list_for_all_namespaces(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1_role_binding_list_for_all_namespaces(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
watch_role_binding_list_for_all_namespaces(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1alpha1_role_binding_list_for_all_namespaces(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
watch_role_binding_list_for_all_namespaces(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1beta1_role_binding_list_for_all_namespaces(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# delete_collection_namespaced_pod_preset
delete_collection_namespaced_pod_preset(_api::Kubernetes.SettingsV1alpha1Api, args...; kwargs...) = Kubernetes.delete_settings_v1alpha1_collection_namespaced_pod_preset(_api::Kubernetes.SettingsV1alpha1Api, args...; kwargs...)

# read_namespaced_replication_controller
read_namespaced_replication_controller(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_namespaced_replication_controller(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_priority_level_configuration
list_priority_level_configuration(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.list_flowcontrol_apiserver_v1alpha1_priority_level_configuration(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)

# delete_namespaced_event
delete_namespaced_event(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_namespaced_event(_api::Kubernetes.CoreV1Api, args...; kwargs...)
delete_namespaced_event(_api::Kubernetes.EventsV1beta1Api, args...; kwargs...) = Kubernetes.delete_events_v1beta1_namespaced_event(_api::Kubernetes.EventsV1beta1Api, args...; kwargs...)

# delete_collection_namespaced_endpoints
delete_collection_namespaced_endpoints(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_collection_namespaced_endpoints(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_namespaced_cron_job
delete_namespaced_cron_job(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.delete_batch_v1_namespaced_cron_job(_api::Kubernetes.BatchV1Api, args...; kwargs...)
delete_namespaced_cron_job(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...) = Kubernetes.delete_batch_v1beta1_namespaced_cron_job(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...)
delete_namespaced_cron_job(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...) = Kubernetes.delete_batch_v2alpha1_namespaced_cron_job(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...)

# list_namespaced_lease
list_namespaced_lease(_api::Kubernetes.CoordinationV1Api, args...; kwargs...) = Kubernetes.list_coordination_v1_namespaced_lease(_api::Kubernetes.CoordinationV1Api, args...; kwargs...)
list_namespaced_lease(_api::Kubernetes.CoordinationV1beta1Api, args...; kwargs...) = Kubernetes.list_coordination_v1beta1_namespaced_lease(_api::Kubernetes.CoordinationV1beta1Api, args...; kwargs...)

# watch_runtime_class_list
watch_runtime_class_list(_api::Kubernetes.NodeV1alpha1Api, args...; kwargs...) = Kubernetes.watch_node_v1alpha1_runtime_class_list(_api::Kubernetes.NodeV1alpha1Api, args...; kwargs...)
watch_runtime_class_list(_api::Kubernetes.NodeV1beta1Api, args...; kwargs...) = Kubernetes.watch_node_v1beta1_runtime_class_list(_api::Kubernetes.NodeV1beta1Api, args...; kwargs...)

# replace_namespaced_role
replace_namespaced_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.replace_rbac_authorization_v1_namespaced_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
replace_namespaced_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.replace_rbac_authorization_v1alpha1_namespaced_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
replace_namespaced_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.replace_rbac_authorization_v1beta1_namespaced_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# watch_replica_set_list_for_all_namespaces
watch_replica_set_list_for_all_namespaces(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.watch_apps_v1_replica_set_list_for_all_namespaces(_api::Kubernetes.AppsV1Api, args...; kwargs...)
watch_replica_set_list_for_all_namespaces(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.watch_apps_v1beta2_replica_set_list_for_all_namespaces(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
watch_replica_set_list_for_all_namespaces(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.watch_extensions_v1beta1_replica_set_list_for_all_namespaces(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# patch_storage_class
patch_storage_class(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.patch_storage_v1_storage_class(_api::Kubernetes.StorageV1Api, args...; kwargs...)
patch_storage_class(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.patch_storage_v1beta1_storage_class(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# watch_pod_disruption_budget_list_for_all_namespaces
watch_pod_disruption_budget_list_for_all_namespaces(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...) = Kubernetes.watch_policy_v1beta1_pod_disruption_budget_list_for_all_namespaces(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...)

# delete_namespaced_role
delete_namespaced_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.delete_rbac_authorization_v1_namespaced_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
delete_namespaced_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.delete_rbac_authorization_v1alpha1_namespaced_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
delete_namespaced_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.delete_rbac_authorization_v1beta1_namespaced_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# patch_namespaced_horizontal_pod_autoscaler
patch_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...) = Kubernetes.patch_autoscaling_v1_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...)
patch_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...) = Kubernetes.patch_autoscaling_v2beta1_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...)
patch_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...) = Kubernetes.patch_autoscaling_v2beta2_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...)

# watch_namespace
watch_namespace(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespace(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_cluster_role_binding
watch_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
watch_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1alpha1_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
watch_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1beta1_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# delete_namespaced_replica_set
delete_namespaced_replica_set(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.delete_apps_v1_namespaced_replica_set(_api::Kubernetes.AppsV1Api, args...; kwargs...)
delete_namespaced_replica_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.delete_apps_v1beta2_namespaced_replica_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
delete_namespaced_replica_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.delete_extensions_v1beta1_namespaced_replica_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# list_replication_controller_for_all_namespaces
list_replication_controller_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_replication_controller_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# read_provisioner
read_provisioner(_api::Kubernetes.KarpenterShV1alpha5Api, args...; kwargs...) = Kubernetes.read_karpenter_sh_v1alpha5_provisioner(_api::Kubernetes.KarpenterShV1alpha5Api, args...; kwargs...)

# delete_collection_flow_schema
delete_collection_flow_schema(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.delete_flowcontrol_apiserver_v1alpha1_collection_flow_schema(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)

# connect_put_namespaced_pod_proxy
connect_put_namespaced_pod_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_put_namespaced_pod_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# connect_post_namespaced_pod_exec
connect_post_namespaced_pod_exec(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_post_namespaced_pod_exec(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_namespaced_config_map
watch_namespaced_config_map(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespaced_config_map(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_namespaced_network_policy
patch_namespaced_network_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.patch_extensions_v1beta1_namespaced_network_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
patch_namespaced_network_policy(_api::Kubernetes.NetworkingV1Api, args...; kwargs...) = Kubernetes.patch_networking_v1_namespaced_network_policy(_api::Kubernetes.NetworkingV1Api, args...; kwargs...)

# read_flow_schema
read_flow_schema(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.read_flowcontrol_apiserver_v1alpha1_flow_schema(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)

# list_deployment_for_all_namespaces
list_deployment_for_all_namespaces(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.list_apps_v1_deployment_for_all_namespaces(_api::Kubernetes.AppsV1Api, args...; kwargs...)
list_deployment_for_all_namespaces(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.list_apps_v1beta1_deployment_for_all_namespaces(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
list_deployment_for_all_namespaces(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.list_apps_v1beta2_deployment_for_all_namespaces(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
list_deployment_for_all_namespaces(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.list_extensions_v1beta1_deployment_for_all_namespaces(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# connect_put_namespaced_service_proxy
connect_put_namespaced_service_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_put_namespaced_service_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespaced_ingress_status
replace_namespaced_ingress_status(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.replace_extensions_v1beta1_namespaced_ingress_status(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
replace_namespaced_ingress_status(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...) = Kubernetes.replace_networking_v1beta1_namespaced_ingress_status(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...)

# delete_collection_custom_resource_definition
delete_collection_custom_resource_definition(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...) = Kubernetes.delete_apiextensions_v1_collection_custom_resource_definition(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...)
delete_collection_custom_resource_definition(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...) = Kubernetes.delete_apiextensions_v1beta1_collection_custom_resource_definition(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...)

# list_namespaced_replica_set
list_namespaced_replica_set(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.list_apps_v1_namespaced_replica_set(_api::Kubernetes.AppsV1Api, args...; kwargs...)
list_namespaced_replica_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.list_apps_v1beta2_namespaced_replica_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
list_namespaced_replica_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.list_extensions_v1beta1_namespaced_replica_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# list_daemon_set_for_all_namespaces
list_daemon_set_for_all_namespaces(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.list_apps_v1_daemon_set_for_all_namespaces(_api::Kubernetes.AppsV1Api, args...; kwargs...)
list_daemon_set_for_all_namespaces(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.list_apps_v1beta2_daemon_set_for_all_namespaces(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
list_daemon_set_for_all_namespaces(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.list_extensions_v1beta1_daemon_set_for_all_namespaces(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# watch_cluster_role
watch_cluster_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1_cluster_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
watch_cluster_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1alpha1_cluster_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
watch_cluster_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1beta1_cluster_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# patch_volume_attachment
patch_volume_attachment(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.patch_storage_v1_volume_attachment(_api::Kubernetes.StorageV1Api, args...; kwargs...)
patch_volume_attachment(_api::Kubernetes.StorageV1alpha1Api, args...; kwargs...) = Kubernetes.patch_storage_v1alpha1_volume_attachment(_api::Kubernetes.StorageV1alpha1Api, args...; kwargs...)
patch_volume_attachment(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.patch_storage_v1beta1_volume_attachment(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# delete_audit_sink
delete_audit_sink(_api::Kubernetes.AuditregistrationV1alpha1Api, args...; kwargs...) = Kubernetes.delete_auditregistration_v1alpha1_audit_sink(_api::Kubernetes.AuditregistrationV1alpha1Api, args...; kwargs...)

# read_namespaced_persistent_volume_claim_status
read_namespaced_persistent_volume_claim_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_namespaced_persistent_volume_claim_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_mutating_webhook_configuration_list
watch_mutating_webhook_configuration_list(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...) = Kubernetes.watch_admissionregistration_v1_mutating_webhook_configuration_list(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...)
watch_mutating_webhook_configuration_list(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...) = Kubernetes.watch_admissionregistration_v1beta1_mutating_webhook_configuration_list(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...)

# create_provisioner
create_provisioner(_api::Kubernetes.KarpenterShV1alpha5Api, args...; kwargs...) = Kubernetes.create_karpenter_sh_v1alpha5_provisioner(_api::Kubernetes.KarpenterShV1alpha5Api, args...; kwargs...)

# read_namespaced_horizontal_pod_autoscaler
read_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...) = Kubernetes.read_autoscaling_v1_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...)
read_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...) = Kubernetes.read_autoscaling_v2beta1_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...)
read_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...) = Kubernetes.read_autoscaling_v2beta2_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...)

# connect_head_namespaced_service_proxy_with_path
connect_head_namespaced_service_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_head_namespaced_service_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_namespaced_controller_revision
patch_namespaced_controller_revision(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.patch_apps_v1_namespaced_controller_revision(_api::Kubernetes.AppsV1Api, args...; kwargs...)
patch_namespaced_controller_revision(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.patch_apps_v1beta1_namespaced_controller_revision(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
patch_namespaced_controller_revision(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.patch_apps_v1beta2_namespaced_controller_revision(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# create_namespaced_secret
create_namespaced_secret(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.create_core_v1_namespaced_secret(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespaced_pod_disruption_budget
replace_namespaced_pod_disruption_budget(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...) = Kubernetes.replace_policy_v1beta1_namespaced_pod_disruption_budget(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...)

# list_namespaced_horizontal_pod_autoscaler
list_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...) = Kubernetes.list_autoscaling_v1_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...)
list_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...) = Kubernetes.list_autoscaling_v2beta1_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...)
list_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...) = Kubernetes.list_autoscaling_v2beta2_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...)

# create_namespaced_role
create_namespaced_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.create_rbac_authorization_v1_namespaced_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
create_namespaced_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.create_rbac_authorization_v1alpha1_namespaced_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
create_namespaced_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.create_rbac_authorization_v1beta1_namespaced_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# patch_mutating_webhook_configuration
patch_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...) = Kubernetes.patch_admissionregistration_v1_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...)
patch_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...) = Kubernetes.patch_admissionregistration_v1beta1_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...)

# create_namespaced_pod_disruption_budget
create_namespaced_pod_disruption_budget(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...) = Kubernetes.create_policy_v1beta1_namespaced_pod_disruption_budget(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...)

# read_namespaced_job
read_namespaced_job(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.read_batch_v1_namespaced_job(_api::Kubernetes.BatchV1Api, args...; kwargs...)

# create_namespaced_resource_quota
create_namespaced_resource_quota(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.create_core_v1_namespaced_resource_quota(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_priority_class_list
watch_priority_class_list(_api::Kubernetes.SchedulingV1Api, args...; kwargs...) = Kubernetes.watch_scheduling_v1_priority_class_list(_api::Kubernetes.SchedulingV1Api, args...; kwargs...)
watch_priority_class_list(_api::Kubernetes.SchedulingV1alpha1Api, args...; kwargs...) = Kubernetes.watch_scheduling_v1alpha1_priority_class_list(_api::Kubernetes.SchedulingV1alpha1Api, args...; kwargs...)
watch_priority_class_list(_api::Kubernetes.SchedulingV1beta1Api, args...; kwargs...) = Kubernetes.watch_scheduling_v1beta1_priority_class_list(_api::Kubernetes.SchedulingV1beta1Api, args...; kwargs...)

# create_self_subject_rules_review
create_self_subject_rules_review(_api::Kubernetes.AuthorizationV1Api, args...; kwargs...) = Kubernetes.create_authorization_v1_self_subject_rules_review(_api::Kubernetes.AuthorizationV1Api, args...; kwargs...)
create_self_subject_rules_review(_api::Kubernetes.AuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.create_authorization_v1beta1_self_subject_rules_review(_api::Kubernetes.AuthorizationV1beta1Api, args...; kwargs...)

# replace_certificate_signing_request
replace_certificate_signing_request(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...) = Kubernetes.replace_certificates_v1beta1_certificate_signing_request(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...)

# watch_ingress_list_for_all_namespaces
watch_ingress_list_for_all_namespaces(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.watch_extensions_v1beta1_ingress_list_for_all_namespaces(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
watch_ingress_list_for_all_namespaces(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...) = Kubernetes.watch_networking_v1beta1_ingress_list_for_all_namespaces(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...)

# read_namespaced_pod_preset
read_namespaced_pod_preset(_api::Kubernetes.SettingsV1alpha1Api, args...; kwargs...) = Kubernetes.read_settings_v1alpha1_namespaced_pod_preset(_api::Kubernetes.SettingsV1alpha1Api, args...; kwargs...)

# create_c_s_i_node
create_c_s_i_node(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.create_storage_v1_c_s_i_node(_api::Kubernetes.StorageV1Api, args...; kwargs...)
create_c_s_i_node(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.create_storage_v1beta1_c_s_i_node(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# delete_priority_level_configuration
delete_priority_level_configuration(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.delete_flowcontrol_apiserver_v1alpha1_priority_level_configuration(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)

# delete_collection_namespaced_limit_range
delete_collection_namespaced_limit_range(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_collection_namespaced_limit_range(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespaced_replication_controller_dummy_scale
replace_namespaced_replication_controller_dummy_scale(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.replace_extensions_v1beta1_namespaced_replication_controller_dummy_scale(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# watch_namespaced_network_policy_list
watch_namespaced_network_policy_list(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.watch_extensions_v1beta1_namespaced_network_policy_list(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
watch_namespaced_network_policy_list(_api::Kubernetes.NetworkingV1Api, args...; kwargs...) = Kubernetes.watch_networking_v1_namespaced_network_policy_list(_api::Kubernetes.NetworkingV1Api, args...; kwargs...)

# list_audit_sink
list_audit_sink(_api::Kubernetes.AuditregistrationV1alpha1Api, args...; kwargs...) = Kubernetes.list_auditregistration_v1alpha1_audit_sink(_api::Kubernetes.AuditregistrationV1alpha1Api, args...; kwargs...)

# create_runtime_class
create_runtime_class(_api::Kubernetes.NodeV1alpha1Api, args...; kwargs...) = Kubernetes.create_node_v1alpha1_runtime_class(_api::Kubernetes.NodeV1alpha1Api, args...; kwargs...)
create_runtime_class(_api::Kubernetes.NodeV1beta1Api, args...; kwargs...) = Kubernetes.create_node_v1beta1_runtime_class(_api::Kubernetes.NodeV1beta1Api, args...; kwargs...)

# watch_namespaced_pod_preset_list
watch_namespaced_pod_preset_list(_api::Kubernetes.SettingsV1alpha1Api, args...; kwargs...) = Kubernetes.watch_settings_v1alpha1_namespaced_pod_preset_list(_api::Kubernetes.SettingsV1alpha1Api, args...; kwargs...)

# delete_collection_namespaced_deployment
delete_collection_namespaced_deployment(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.delete_apps_v1_collection_namespaced_deployment(_api::Kubernetes.AppsV1Api, args...; kwargs...)
delete_collection_namespaced_deployment(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.delete_apps_v1beta1_collection_namespaced_deployment(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
delete_collection_namespaced_deployment(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.delete_apps_v1beta2_collection_namespaced_deployment(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
delete_collection_namespaced_deployment(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.delete_extensions_v1beta1_collection_namespaced_deployment(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# read_certificate_signing_request
read_certificate_signing_request(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...) = Kubernetes.read_certificates_v1beta1_certificate_signing_request(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...)

# list_priority_class
list_priority_class(_api::Kubernetes.SchedulingV1Api, args...; kwargs...) = Kubernetes.list_scheduling_v1_priority_class(_api::Kubernetes.SchedulingV1Api, args...; kwargs...)
list_priority_class(_api::Kubernetes.SchedulingV1alpha1Api, args...; kwargs...) = Kubernetes.list_scheduling_v1alpha1_priority_class(_api::Kubernetes.SchedulingV1alpha1Api, args...; kwargs...)
list_priority_class(_api::Kubernetes.SchedulingV1beta1Api, args...; kwargs...) = Kubernetes.list_scheduling_v1beta1_priority_class(_api::Kubernetes.SchedulingV1beta1Api, args...; kwargs...)

# watch_audit_sink
watch_audit_sink(_api::Kubernetes.AuditregistrationV1alpha1Api, args...; kwargs...) = Kubernetes.watch_auditregistration_v1alpha1_audit_sink(_api::Kubernetes.AuditregistrationV1alpha1Api, args...; kwargs...)

# patch_namespaced_persistent_volume_claim
patch_namespaced_persistent_volume_claim(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.patch_core_v1_namespaced_persistent_volume_claim(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_namespace_status
patch_namespace_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.patch_core_v1_namespace_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_persistent_volume
patch_persistent_volume(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.patch_core_v1_persistent_volume(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_collection_persistent_volume
delete_collection_persistent_volume(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_collection_persistent_volume(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_endpoint_slice_for_all_namespaces
list_endpoint_slice_for_all_namespaces(_api::Kubernetes.DiscoveryV1beta1Api, args...; kwargs...) = Kubernetes.list_discovery_v1beta1_endpoint_slice_for_all_namespaces(_api::Kubernetes.DiscoveryV1beta1Api, args...; kwargs...)

# watch_namespace_list
watch_namespace_list(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespace_list(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_namespaced_ingress_list
watch_namespaced_ingress_list(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.watch_extensions_v1beta1_namespaced_ingress_list(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
watch_namespaced_ingress_list(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...) = Kubernetes.watch_networking_v1beta1_namespaced_ingress_list(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...)

# read_namespaced_job_status
read_namespaced_job_status(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.read_batch_v1_namespaced_job_status(_api::Kubernetes.BatchV1Api, args...; kwargs...)

# delete_runtime_class
delete_runtime_class(_api::Kubernetes.NodeV1alpha1Api, args...; kwargs...) = Kubernetes.delete_node_v1alpha1_runtime_class(_api::Kubernetes.NodeV1alpha1Api, args...; kwargs...)
delete_runtime_class(_api::Kubernetes.NodeV1beta1Api, args...; kwargs...) = Kubernetes.delete_node_v1beta1_runtime_class(_api::Kubernetes.NodeV1beta1Api, args...; kwargs...)

# replace_namespaced_ingress
replace_namespaced_ingress(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.replace_extensions_v1beta1_namespaced_ingress(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
replace_namespaced_ingress(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...) = Kubernetes.replace_networking_v1beta1_namespaced_ingress(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...)

# connect_patch_node_proxy_with_path
connect_patch_node_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_patch_node_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_namespaced_service_account
delete_namespaced_service_account(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_namespaced_service_account(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_cluster_role_binding
list_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.list_rbac_authorization_v1_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
list_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.list_rbac_authorization_v1alpha1_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
list_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.list_rbac_authorization_v1beta1_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# read_namespaced_persistent_volume_claim
read_namespaced_persistent_volume_claim(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_namespaced_persistent_volume_claim(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_namespaced_service
list_namespaced_service(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_namespaced_service(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_namespaced_secret
watch_namespaced_secret(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespaced_secret(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# create_namespaced_cron_job
create_namespaced_cron_job(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.create_batch_v1_namespaced_cron_job(_api::Kubernetes.BatchV1Api, args...; kwargs...)
create_namespaced_cron_job(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...) = Kubernetes.create_batch_v1beta1_namespaced_cron_job(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...)
create_namespaced_cron_job(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...) = Kubernetes.create_batch_v2alpha1_namespaced_cron_job(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...)

# read_flow_schema_status
read_flow_schema_status(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.read_flowcontrol_apiserver_v1alpha1_flow_schema_status(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)

# read_namespaced_daemon_set_status
read_namespaced_daemon_set_status(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.read_apps_v1_namespaced_daemon_set_status(_api::Kubernetes.AppsV1Api, args...; kwargs...)
read_namespaced_daemon_set_status(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.read_apps_v1beta2_namespaced_daemon_set_status(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
read_namespaced_daemon_set_status(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.read_extensions_v1beta1_namespaced_daemon_set_status(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# replace_flow_schema
replace_flow_schema(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.replace_flowcontrol_apiserver_v1alpha1_flow_schema(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)

# read_namespaced_pod_disruption_budget_status
read_namespaced_pod_disruption_budget_status(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...) = Kubernetes.read_policy_v1beta1_namespaced_pod_disruption_budget_status(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...)

# replace_namespaced_persistent_volume_claim_status
replace_namespaced_persistent_volume_claim_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_namespaced_persistent_volume_claim_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_resource_quota_for_all_namespaces
list_resource_quota_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_resource_quota_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_validating_webhook_configuration
delete_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...) = Kubernetes.delete_admissionregistration_v1_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...)
delete_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...) = Kubernetes.delete_admissionregistration_v1beta1_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...)

# read_namespaced_stateful_set
read_namespaced_stateful_set(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.read_apps_v1_namespaced_stateful_set(_api::Kubernetes.AppsV1Api, args...; kwargs...)
read_namespaced_stateful_set(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.read_apps_v1beta1_namespaced_stateful_set(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
read_namespaced_stateful_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.read_apps_v1beta2_namespaced_stateful_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# connect_post_namespaced_pod_proxy
connect_post_namespaced_pod_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_post_namespaced_pod_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_pod_list_for_all_namespaces
watch_pod_list_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_pod_list_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_namespaced_cron_job
watch_namespaced_cron_job(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.watch_batch_v1_namespaced_cron_job(_api::Kubernetes.BatchV1Api, args...; kwargs...)
watch_namespaced_cron_job(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...) = Kubernetes.watch_batch_v1beta1_namespaced_cron_job(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...)
watch_namespaced_cron_job(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...) = Kubernetes.watch_batch_v2alpha1_namespaced_cron_job(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...)

# replace_namespaced_replica_set
replace_namespaced_replica_set(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.replace_apps_v1_namespaced_replica_set(_api::Kubernetes.AppsV1Api, args...; kwargs...)
replace_namespaced_replica_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.replace_apps_v1beta2_namespaced_replica_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
replace_namespaced_replica_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.replace_extensions_v1beta1_namespaced_replica_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# read_namespaced_pod_log
read_namespaced_pod_log(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_namespaced_pod_log(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_namespaced_stateful_set
patch_namespaced_stateful_set(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.patch_apps_v1_namespaced_stateful_set(_api::Kubernetes.AppsV1Api, args...; kwargs...)
patch_namespaced_stateful_set(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.patch_apps_v1beta1_namespaced_stateful_set(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
patch_namespaced_stateful_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.patch_apps_v1beta2_namespaced_stateful_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# connect_get_namespaced_pod_attach
connect_get_namespaced_pod_attach(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_get_namespaced_pod_attach(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespaced_resource_quota
replace_namespaced_resource_quota(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_namespaced_resource_quota(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_namespaced_job
watch_namespaced_job(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.watch_batch_v1_namespaced_job(_api::Kubernetes.BatchV1Api, args...; kwargs...)

# create_namespaced_pod
create_namespaced_pod(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.create_core_v1_namespaced_pod(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# read_priority_class
read_priority_class(_api::Kubernetes.SchedulingV1Api, args...; kwargs...) = Kubernetes.read_scheduling_v1_priority_class(_api::Kubernetes.SchedulingV1Api, args...; kwargs...)
read_priority_class(_api::Kubernetes.SchedulingV1alpha1Api, args...; kwargs...) = Kubernetes.read_scheduling_v1alpha1_priority_class(_api::Kubernetes.SchedulingV1alpha1Api, args...; kwargs...)
read_priority_class(_api::Kubernetes.SchedulingV1beta1Api, args...; kwargs...) = Kubernetes.read_scheduling_v1beta1_priority_class(_api::Kubernetes.SchedulingV1beta1Api, args...; kwargs...)

# create_namespaced_stateful_set
create_namespaced_stateful_set(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.create_apps_v1_namespaced_stateful_set(_api::Kubernetes.AppsV1Api, args...; kwargs...)
create_namespaced_stateful_set(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.create_apps_v1beta1_namespaced_stateful_set(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
create_namespaced_stateful_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.create_apps_v1beta2_namespaced_stateful_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# watch_flow_schema
watch_flow_schema(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.watch_flowcontrol_apiserver_v1alpha1_flow_schema(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)

# create_namespaced_role_binding
create_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.create_rbac_authorization_v1_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
create_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.create_rbac_authorization_v1alpha1_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
create_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.create_rbac_authorization_v1beta1_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# list_pod_preset_for_all_namespaces
list_pod_preset_for_all_namespaces(_api::Kubernetes.SettingsV1alpha1Api, args...; kwargs...) = Kubernetes.list_settings_v1alpha1_pod_preset_for_all_namespaces(_api::Kubernetes.SettingsV1alpha1Api, args...; kwargs...)

# watch_volume_attachment
watch_volume_attachment(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.watch_storage_v1_volume_attachment(_api::Kubernetes.StorageV1Api, args...; kwargs...)
watch_volume_attachment(_api::Kubernetes.StorageV1alpha1Api, args...; kwargs...) = Kubernetes.watch_storage_v1alpha1_volume_attachment(_api::Kubernetes.StorageV1alpha1Api, args...; kwargs...)
watch_volume_attachment(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.watch_storage_v1beta1_volume_attachment(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# delete_namespaced_role_binding
delete_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.delete_rbac_authorization_v1_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
delete_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.delete_rbac_authorization_v1alpha1_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
delete_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.delete_rbac_authorization_v1beta1_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# watch_daemon_set_list_for_all_namespaces
watch_daemon_set_list_for_all_namespaces(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.watch_apps_v1_daemon_set_list_for_all_namespaces(_api::Kubernetes.AppsV1Api, args...; kwargs...)
watch_daemon_set_list_for_all_namespaces(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.watch_apps_v1beta2_daemon_set_list_for_all_namespaces(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
watch_daemon_set_list_for_all_namespaces(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.watch_extensions_v1beta1_daemon_set_list_for_all_namespaces(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# watch_audit_sink_list
watch_audit_sink_list(_api::Kubernetes.AuditregistrationV1alpha1Api, args...; kwargs...) = Kubernetes.watch_auditregistration_v1alpha1_audit_sink_list(_api::Kubernetes.AuditregistrationV1alpha1Api, args...; kwargs...)

# connect_post_node_proxy
connect_post_node_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_post_node_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# create_node
create_node(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.create_core_v1_node(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# read_custom_resource_definition
read_custom_resource_definition(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...) = Kubernetes.read_apiextensions_v1_custom_resource_definition(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...)
read_custom_resource_definition(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...) = Kubernetes.read_apiextensions_v1beta1_custom_resource_definition(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...)

# delete_collection_namespaced_role_binding
delete_collection_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.delete_rbac_authorization_v1_collection_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
delete_collection_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.delete_rbac_authorization_v1alpha1_collection_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
delete_collection_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.delete_rbac_authorization_v1beta1_collection_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# connect_get_namespaced_pod_exec
connect_get_namespaced_pod_exec(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_get_namespaced_pod_exec(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_collection_namespaced_resource_quota
delete_collection_namespaced_resource_quota(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_collection_namespaced_resource_quota(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# connect_delete_namespaced_service_proxy
connect_delete_namespaced_service_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_delete_namespaced_service_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_cluster_role_binding_list
watch_cluster_role_binding_list(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1_cluster_role_binding_list(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
watch_cluster_role_binding_list(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1alpha1_cluster_role_binding_list(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
watch_cluster_role_binding_list(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1beta1_cluster_role_binding_list(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# watch_role_list_for_all_namespaces
watch_role_list_for_all_namespaces(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1_role_list_for_all_namespaces(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
watch_role_list_for_all_namespaces(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1alpha1_role_list_for_all_namespaces(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
watch_role_list_for_all_namespaces(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1beta1_role_list_for_all_namespaces(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# replace_certificate_signing_request_status
replace_certificate_signing_request_status(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...) = Kubernetes.replace_certificates_v1beta1_certificate_signing_request_status(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...)

# delete_namespaced_limit_range
delete_namespaced_limit_range(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_namespaced_limit_range(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_collection_namespaced_job
delete_collection_namespaced_job(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.delete_batch_v1_collection_namespaced_job(_api::Kubernetes.BatchV1Api, args...; kwargs...)

# watch_job_list_for_all_namespaces
watch_job_list_for_all_namespaces(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.watch_batch_v1_job_list_for_all_namespaces(_api::Kubernetes.BatchV1Api, args...; kwargs...)

# delete_collection_namespaced_daemon_set
delete_collection_namespaced_daemon_set(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.delete_apps_v1_collection_namespaced_daemon_set(_api::Kubernetes.AppsV1Api, args...; kwargs...)
delete_collection_namespaced_daemon_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.delete_apps_v1beta2_collection_namespaced_daemon_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
delete_collection_namespaced_daemon_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.delete_extensions_v1beta1_collection_namespaced_daemon_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# watch_namespaced_resource_quota
watch_namespaced_resource_quota(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespaced_resource_quota(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# create_namespaced_pod_binding
create_namespaced_pod_binding(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.create_core_v1_namespaced_pod_binding(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_namespaced_config_map_list
watch_namespaced_config_map_list(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespaced_config_map_list(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_secret_for_all_namespaces
list_secret_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_secret_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_custom_resource_definition
delete_custom_resource_definition(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...) = Kubernetes.delete_apiextensions_v1_custom_resource_definition(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...)
delete_custom_resource_definition(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...) = Kubernetes.delete_apiextensions_v1beta1_custom_resource_definition(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...)

# watch_namespaced_cron_job_list
watch_namespaced_cron_job_list(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.watch_batch_v1_namespaced_cron_job_list(_api::Kubernetes.BatchV1Api, args...; kwargs...)
watch_namespaced_cron_job_list(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...) = Kubernetes.watch_batch_v1beta1_namespaced_cron_job_list(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...)
watch_namespaced_cron_job_list(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...) = Kubernetes.watch_batch_v2alpha1_namespaced_cron_job_list(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...)

# read_namespaced_service_status
read_namespaced_service_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_namespaced_service_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# read_namespaced_ingress
read_namespaced_ingress(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.read_extensions_v1beta1_namespaced_ingress(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
read_namespaced_ingress(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...) = Kubernetes.read_networking_v1beta1_namespaced_ingress(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...)

# read_namespaced_stateful_set_status
read_namespaced_stateful_set_status(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.read_apps_v1_namespaced_stateful_set_status(_api::Kubernetes.AppsV1Api, args...; kwargs...)
read_namespaced_stateful_set_status(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.read_apps_v1beta1_namespaced_stateful_set_status(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
read_namespaced_stateful_set_status(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.read_apps_v1beta2_namespaced_stateful_set_status(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# create_namespaced_deployment_rollback
create_namespaced_deployment_rollback(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.create_apps_v1beta1_namespaced_deployment_rollback(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
create_namespaced_deployment_rollback(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.create_extensions_v1beta1_namespaced_deployment_rollback(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# delete_collection_volume_attachment
delete_collection_volume_attachment(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.delete_storage_v1_collection_volume_attachment(_api::Kubernetes.StorageV1Api, args...; kwargs...)
delete_collection_volume_attachment(_api::Kubernetes.StorageV1alpha1Api, args...; kwargs...) = Kubernetes.delete_storage_v1alpha1_collection_volume_attachment(_api::Kubernetes.StorageV1alpha1Api, args...; kwargs...)
delete_collection_volume_attachment(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.delete_storage_v1beta1_collection_volume_attachment(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# list_a_p_i_service
list_a_p_i_service(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...) = Kubernetes.list_apiregistration_v1_a_p_i_service(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...)
list_a_p_i_service(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...) = Kubernetes.list_apiregistration_v1beta1_a_p_i_service(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...)

# patch_namespaced_stateful_set_scale
patch_namespaced_stateful_set_scale(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.patch_apps_v1_namespaced_stateful_set_scale(_api::Kubernetes.AppsV1Api, args...; kwargs...)
patch_namespaced_stateful_set_scale(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.patch_apps_v1beta1_namespaced_stateful_set_scale(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
patch_namespaced_stateful_set_scale(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.patch_apps_v1beta2_namespaced_stateful_set_scale(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# patch_a_p_i_service
patch_a_p_i_service(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...) = Kubernetes.patch_apiregistration_v1_a_p_i_service(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...)
patch_a_p_i_service(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...) = Kubernetes.patch_apiregistration_v1beta1_a_p_i_service(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...)

# read_namespaced_deployment_status
read_namespaced_deployment_status(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.read_apps_v1_namespaced_deployment_status(_api::Kubernetes.AppsV1Api, args...; kwargs...)
read_namespaced_deployment_status(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.read_apps_v1beta1_namespaced_deployment_status(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
read_namespaced_deployment_status(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.read_apps_v1beta2_namespaced_deployment_status(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
read_namespaced_deployment_status(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.read_extensions_v1beta1_namespaced_deployment_status(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# replace_validating_webhook_configuration
replace_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...) = Kubernetes.replace_admissionregistration_v1_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...)
replace_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...) = Kubernetes.replace_admissionregistration_v1beta1_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...)

# replace_audit_sink
replace_audit_sink(_api::Kubernetes.AuditregistrationV1alpha1Api, args...; kwargs...) = Kubernetes.replace_auditregistration_v1alpha1_audit_sink(_api::Kubernetes.AuditregistrationV1alpha1Api, args...; kwargs...)

# delete_namespace
delete_namespace(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_namespace(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_namespaced_replica_set_scale
patch_namespaced_replica_set_scale(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.patch_apps_v1_namespaced_replica_set_scale(_api::Kubernetes.AppsV1Api, args...; kwargs...)
patch_namespaced_replica_set_scale(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.patch_apps_v1beta2_namespaced_replica_set_scale(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
patch_namespaced_replica_set_scale(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.patch_extensions_v1beta1_namespaced_replica_set_scale(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# replace_namespaced_lease
replace_namespaced_lease(_api::Kubernetes.CoordinationV1Api, args...; kwargs...) = Kubernetes.replace_coordination_v1_namespaced_lease(_api::Kubernetes.CoordinationV1Api, args...; kwargs...)
replace_namespaced_lease(_api::Kubernetes.CoordinationV1beta1Api, args...; kwargs...) = Kubernetes.replace_coordination_v1beta1_namespaced_lease(_api::Kubernetes.CoordinationV1beta1Api, args...; kwargs...)

# patch_namespaced_cron_job
patch_namespaced_cron_job(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.patch_batch_v1_namespaced_cron_job(_api::Kubernetes.BatchV1Api, args...; kwargs...)
patch_namespaced_cron_job(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...) = Kubernetes.patch_batch_v1beta1_namespaced_cron_job(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...)
patch_namespaced_cron_job(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...) = Kubernetes.patch_batch_v2alpha1_namespaced_cron_job(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...)

# list_namespaced_event
list_namespaced_event(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_namespaced_event(_api::Kubernetes.CoreV1Api, args...; kwargs...)
list_namespaced_event(_api::Kubernetes.EventsV1beta1Api, args...; kwargs...) = Kubernetes.list_events_v1beta1_namespaced_event(_api::Kubernetes.EventsV1beta1Api, args...; kwargs...)

# list_namespaced_pod
list_namespaced_pod(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_namespaced_pod(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# read_namespaced_resource_quota_status
read_namespaced_resource_quota_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_namespaced_resource_quota_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_namespaced_config_map
delete_namespaced_config_map(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_namespaced_config_map(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_namespaced_pod_template_list
watch_namespaced_pod_template_list(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespaced_pod_template_list(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# create_namespaced_deployment
create_namespaced_deployment(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.create_apps_v1_namespaced_deployment(_api::Kubernetes.AppsV1Api, args...; kwargs...)
create_namespaced_deployment(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.create_apps_v1beta1_namespaced_deployment(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
create_namespaced_deployment(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.create_apps_v1beta2_namespaced_deployment(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
create_namespaced_deployment(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.create_extensions_v1beta1_namespaced_deployment(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# read_namespaced_replication_controller_dummy_scale
read_namespaced_replication_controller_dummy_scale(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.read_extensions_v1beta1_namespaced_replication_controller_dummy_scale(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# read_namespaced_replica_set_status
read_namespaced_replica_set_status(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.read_apps_v1_namespaced_replica_set_status(_api::Kubernetes.AppsV1Api, args...; kwargs...)
read_namespaced_replica_set_status(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.read_apps_v1beta2_namespaced_replica_set_status(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
read_namespaced_replica_set_status(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.read_extensions_v1beta1_namespaced_replica_set_status(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# delete_node
delete_node(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_node(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_collection_validating_webhook_configuration
delete_collection_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...) = Kubernetes.delete_admissionregistration_v1_collection_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...)
delete_collection_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...) = Kubernetes.delete_admissionregistration_v1beta1_collection_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...)

# watch_resource_quota_list_for_all_namespaces
watch_resource_quota_list_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_resource_quota_list_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_node_list
watch_node_list(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_node_list(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_pod_security_policy
patch_pod_security_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.patch_extensions_v1beta1_pod_security_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
patch_pod_security_policy(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...) = Kubernetes.patch_policy_v1beta1_pod_security_policy(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...)

# replace_namespaced_role_binding
replace_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.replace_rbac_authorization_v1_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
replace_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.replace_rbac_authorization_v1alpha1_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
replace_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.replace_rbac_authorization_v1beta1_namespaced_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# list_namespaced_stateful_set
list_namespaced_stateful_set(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.list_apps_v1_namespaced_stateful_set(_api::Kubernetes.AppsV1Api, args...; kwargs...)
list_namespaced_stateful_set(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.list_apps_v1beta1_namespaced_stateful_set(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
list_namespaced_stateful_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.list_apps_v1beta2_namespaced_stateful_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# watch_namespaced_horizontal_pod_autoscaler
watch_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...) = Kubernetes.watch_autoscaling_v1_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...)
watch_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...) = Kubernetes.watch_autoscaling_v2beta1_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...)
watch_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...) = Kubernetes.watch_autoscaling_v2beta2_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...)

# list_service_account_for_all_namespaces
list_service_account_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_service_account_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_storage_class
replace_storage_class(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.replace_storage_v1_storage_class(_api::Kubernetes.StorageV1Api, args...; kwargs...)
replace_storage_class(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.replace_storage_v1beta1_storage_class(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# delete_namespaced_persistent_volume_claim
delete_namespaced_persistent_volume_claim(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_namespaced_persistent_volume_claim(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_namespaced_resource_quota
delete_namespaced_resource_quota(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_namespaced_resource_quota(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_config_map_for_all_namespaces
list_config_map_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_config_map_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_namespaced_deployment_scale
patch_namespaced_deployment_scale(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.patch_apps_v1_namespaced_deployment_scale(_api::Kubernetes.AppsV1Api, args...; kwargs...)
patch_namespaced_deployment_scale(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.patch_apps_v1beta1_namespaced_deployment_scale(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
patch_namespaced_deployment_scale(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.patch_apps_v1beta2_namespaced_deployment_scale(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
patch_namespaced_deployment_scale(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.patch_extensions_v1beta1_namespaced_deployment_scale(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# replace_namespaced_service
replace_namespaced_service(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_namespaced_service(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_namespaced_persistent_volume_claim_list
watch_namespaced_persistent_volume_claim_list(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespaced_persistent_volume_claim_list(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# read_priority_level_configuration
read_priority_level_configuration(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.read_flowcontrol_apiserver_v1alpha1_priority_level_configuration(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)

# connect_put_namespaced_service_proxy_with_path
connect_put_namespaced_service_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_put_namespaced_service_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_storage_class_list
watch_storage_class_list(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.watch_storage_v1_storage_class_list(_api::Kubernetes.StorageV1Api, args...; kwargs...)
watch_storage_class_list(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.watch_storage_v1beta1_storage_class_list(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# list_controller_revision_for_all_namespaces
list_controller_revision_for_all_namespaces(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.list_apps_v1_controller_revision_for_all_namespaces(_api::Kubernetes.AppsV1Api, args...; kwargs...)
list_controller_revision_for_all_namespaces(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.list_apps_v1beta1_controller_revision_for_all_namespaces(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
list_controller_revision_for_all_namespaces(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.list_apps_v1beta2_controller_revision_for_all_namespaces(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# list_flow_schema
list_flow_schema(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.list_flowcontrol_apiserver_v1alpha1_flow_schema(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)

# create_cluster_role_binding
create_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.create_rbac_authorization_v1_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
create_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.create_rbac_authorization_v1alpha1_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
create_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.create_rbac_authorization_v1beta1_cluster_role_binding(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# watch_namespaced_deployment_list
watch_namespaced_deployment_list(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.watch_apps_v1_namespaced_deployment_list(_api::Kubernetes.AppsV1Api, args...; kwargs...)
watch_namespaced_deployment_list(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.watch_apps_v1beta1_namespaced_deployment_list(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
watch_namespaced_deployment_list(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.watch_apps_v1beta2_namespaced_deployment_list(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
watch_namespaced_deployment_list(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.watch_extensions_v1beta1_namespaced_deployment_list(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# replace_namespaced_service_status
replace_namespaced_service_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_namespaced_service_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_validating_webhook_configuration
patch_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...) = Kubernetes.patch_admissionregistration_v1_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...)
patch_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...) = Kubernetes.patch_admissionregistration_v1beta1_validating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...)

# patch_namespaced_endpoints
patch_namespaced_endpoints(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.patch_core_v1_namespaced_endpoints(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_namespaced_pod_disruption_budget
watch_namespaced_pod_disruption_budget(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...) = Kubernetes.watch_policy_v1beta1_namespaced_pod_disruption_budget(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...)

# watch_service_list_for_all_namespaces
watch_service_list_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_service_list_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_namespaced_ingress
delete_namespaced_ingress(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.delete_extensions_v1beta1_namespaced_ingress(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
delete_namespaced_ingress(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...) = Kubernetes.delete_networking_v1beta1_namespaced_ingress(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...)

# replace_priority_level_configuration
replace_priority_level_configuration(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.replace_flowcontrol_apiserver_v1alpha1_priority_level_configuration(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)

# watch_node
watch_node(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_node(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# connect_get_namespaced_service_proxy
connect_get_namespaced_service_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_get_namespaced_service_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespace_finalize
replace_namespace_finalize(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_namespace_finalize(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_namespaced_daemon_set
list_namespaced_daemon_set(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.list_apps_v1_namespaced_daemon_set(_api::Kubernetes.AppsV1Api, args...; kwargs...)
list_namespaced_daemon_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.list_apps_v1beta2_namespaced_daemon_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
list_namespaced_daemon_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.list_extensions_v1beta1_namespaced_daemon_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# patch_namespace
patch_namespace(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.patch_core_v1_namespace(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# create_namespaced_job
create_namespaced_job(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.create_batch_v1_namespaced_job(_api::Kubernetes.BatchV1Api, args...; kwargs...)

# replace_flow_schema_status
replace_flow_schema_status(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.replace_flowcontrol_apiserver_v1alpha1_flow_schema_status(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)

# delete_namespaced_horizontal_pod_autoscaler
delete_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...) = Kubernetes.delete_autoscaling_v1_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...)
delete_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...) = Kubernetes.delete_autoscaling_v2beta1_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...)
delete_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...) = Kubernetes.delete_autoscaling_v2beta2_namespaced_horizontal_pod_autoscaler(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...)

# delete_collection_namespaced_stateful_set
delete_collection_namespaced_stateful_set(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.delete_apps_v1_collection_namespaced_stateful_set(_api::Kubernetes.AppsV1Api, args...; kwargs...)
delete_collection_namespaced_stateful_set(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.delete_apps_v1beta1_collection_namespaced_stateful_set(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
delete_collection_namespaced_stateful_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.delete_apps_v1beta2_collection_namespaced_stateful_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# watch_lease_list_for_all_namespaces
watch_lease_list_for_all_namespaces(_api::Kubernetes.CoordinationV1Api, args...; kwargs...) = Kubernetes.watch_coordination_v1_lease_list_for_all_namespaces(_api::Kubernetes.CoordinationV1Api, args...; kwargs...)
watch_lease_list_for_all_namespaces(_api::Kubernetes.CoordinationV1beta1Api, args...; kwargs...) = Kubernetes.watch_coordination_v1beta1_lease_list_for_all_namespaces(_api::Kubernetes.CoordinationV1beta1Api, args...; kwargs...)

# delete_namespaced_lease
delete_namespaced_lease(_api::Kubernetes.CoordinationV1Api, args...; kwargs...) = Kubernetes.delete_coordination_v1_namespaced_lease(_api::Kubernetes.CoordinationV1Api, args...; kwargs...)
delete_namespaced_lease(_api::Kubernetes.CoordinationV1beta1Api, args...; kwargs...) = Kubernetes.delete_coordination_v1beta1_namespaced_lease(_api::Kubernetes.CoordinationV1beta1Api, args...; kwargs...)

# delete_collection_namespaced_config_map
delete_collection_namespaced_config_map(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_collection_namespaced_config_map(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespaced_endpoints
replace_namespaced_endpoints(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_namespaced_endpoints(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_namespaced_endpoint_slice
delete_namespaced_endpoint_slice(_api::Kubernetes.DiscoveryV1beta1Api, args...; kwargs...) = Kubernetes.delete_discovery_v1beta1_namespaced_endpoint_slice(_api::Kubernetes.DiscoveryV1beta1Api, args...; kwargs...)

# watch_mutating_webhook_configuration
watch_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...) = Kubernetes.watch_admissionregistration_v1_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...)
watch_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...) = Kubernetes.watch_admissionregistration_v1beta1_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...)

# list_namespaced_ingress
list_namespaced_ingress(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.list_extensions_v1beta1_namespaced_ingress(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
list_namespaced_ingress(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...) = Kubernetes.list_networking_v1beta1_namespaced_ingress(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...)

# read_namespaced_network_policy
read_namespaced_network_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.read_extensions_v1beta1_namespaced_network_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
read_namespaced_network_policy(_api::Kubernetes.NetworkingV1Api, args...; kwargs...) = Kubernetes.read_networking_v1_namespaced_network_policy(_api::Kubernetes.NetworkingV1Api, args...; kwargs...)

# patch_namespaced_deployment
patch_namespaced_deployment(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.patch_apps_v1_namespaced_deployment(_api::Kubernetes.AppsV1Api, args...; kwargs...)
patch_namespaced_deployment(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.patch_apps_v1beta1_namespaced_deployment(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
patch_namespaced_deployment(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.patch_apps_v1beta2_namespaced_deployment(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
patch_namespaced_deployment(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.patch_extensions_v1beta1_namespaced_deployment(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# delete_namespaced_pod_template
delete_namespaced_pod_template(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_namespaced_pod_template(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_pod_security_policy_list
watch_pod_security_policy_list(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.watch_extensions_v1beta1_pod_security_policy_list(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
watch_pod_security_policy_list(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...) = Kubernetes.watch_policy_v1beta1_pod_security_policy_list(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...)

# patch_namespaced_replication_controller
patch_namespaced_replication_controller(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.patch_core_v1_namespaced_replication_controller(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_runtime_class
replace_runtime_class(_api::Kubernetes.NodeV1alpha1Api, args...; kwargs...) = Kubernetes.replace_node_v1alpha1_runtime_class(_api::Kubernetes.NodeV1alpha1Api, args...; kwargs...)
replace_runtime_class(_api::Kubernetes.NodeV1beta1Api, args...; kwargs...) = Kubernetes.replace_node_v1beta1_runtime_class(_api::Kubernetes.NodeV1beta1Api, args...; kwargs...)

# create_storage_class
create_storage_class(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.create_storage_v1_storage_class(_api::Kubernetes.StorageV1Api, args...; kwargs...)
create_storage_class(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.create_storage_v1beta1_storage_class(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# replace_c_s_i_driver
replace_c_s_i_driver(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.replace_storage_v1beta1_c_s_i_driver(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# replace_mutating_webhook_configuration
replace_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...) = Kubernetes.replace_admissionregistration_v1_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...)
replace_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...) = Kubernetes.replace_admissionregistration_v1beta1_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...)

# watch_namespaced_deployment
watch_namespaced_deployment(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.watch_apps_v1_namespaced_deployment(_api::Kubernetes.AppsV1Api, args...; kwargs...)
watch_namespaced_deployment(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.watch_apps_v1beta1_namespaced_deployment(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
watch_namespaced_deployment(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.watch_apps_v1beta2_namespaced_deployment(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
watch_namespaced_deployment(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.watch_extensions_v1beta1_namespaced_deployment(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# patch_node
patch_node(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.patch_core_v1_node(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespaced_deployment_scale
replace_namespaced_deployment_scale(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.replace_apps_v1_namespaced_deployment_scale(_api::Kubernetes.AppsV1Api, args...; kwargs...)
replace_namespaced_deployment_scale(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.replace_apps_v1beta1_namespaced_deployment_scale(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
replace_namespaced_deployment_scale(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.replace_apps_v1beta2_namespaced_deployment_scale(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
replace_namespaced_deployment_scale(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.replace_extensions_v1beta1_namespaced_deployment_scale(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# replace_namespaced_cron_job
replace_namespaced_cron_job(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.replace_batch_v1_namespaced_cron_job(_api::Kubernetes.BatchV1Api, args...; kwargs...)
replace_namespaced_cron_job(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...) = Kubernetes.replace_batch_v1beta1_namespaced_cron_job(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...)
replace_namespaced_cron_job(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...) = Kubernetes.replace_batch_v2alpha1_namespaced_cron_job(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...)

# list_c_s_i_driver
list_c_s_i_driver(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.list_storage_v1beta1_c_s_i_driver(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# connect_post_namespaced_pod_portforward
connect_post_namespaced_pod_portforward(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_post_namespaced_pod_portforward(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_provisioner
delete_provisioner(_api::Kubernetes.KarpenterShV1alpha5Api, args...; kwargs...) = Kubernetes.delete_karpenter_sh_v1alpha5_provisioner(_api::Kubernetes.KarpenterShV1alpha5Api, args...; kwargs...)

# list_namespaced_cron_job
list_namespaced_cron_job(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.list_batch_v1_namespaced_cron_job(_api::Kubernetes.BatchV1Api, args...; kwargs...)
list_namespaced_cron_job(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...) = Kubernetes.list_batch_v1beta1_namespaced_cron_job(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...)
list_namespaced_cron_job(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...) = Kubernetes.list_batch_v2alpha1_namespaced_cron_job(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...)

# list_namespaced_metric_value
list_namespaced_metric_value(_api::Kubernetes.CustomMetricsV1beta1Api, args...; kwargs...) = Kubernetes.list_custom_metrics_v1beta1_namespaced_metric_value(_api::Kubernetes.CustomMetricsV1beta1Api, args...; kwargs...)

# watch_namespaced_role_list
watch_namespaced_role_list(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1_namespaced_role_list(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
watch_namespaced_role_list(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1alpha1_namespaced_role_list(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
watch_namespaced_role_list(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1beta1_namespaced_role_list(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# read_storage_class
read_storage_class(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.read_storage_v1_storage_class(_api::Kubernetes.StorageV1Api, args...; kwargs...)
read_storage_class(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.read_storage_v1beta1_storage_class(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# watch_custom_resource_definition
watch_custom_resource_definition(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...) = Kubernetes.watch_apiextensions_v1_custom_resource_definition(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...)
watch_custom_resource_definition(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...) = Kubernetes.watch_apiextensions_v1beta1_custom_resource_definition(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...)

# list_namespaced_pod_preset
list_namespaced_pod_preset(_api::Kubernetes.SettingsV1alpha1Api, args...; kwargs...) = Kubernetes.list_settings_v1alpha1_namespaced_pod_preset(_api::Kubernetes.SettingsV1alpha1Api, args...; kwargs...)

# create_self_subject_access_review
create_self_subject_access_review(_api::Kubernetes.AuthorizationV1Api, args...; kwargs...) = Kubernetes.create_authorization_v1_self_subject_access_review(_api::Kubernetes.AuthorizationV1Api, args...; kwargs...)
create_self_subject_access_review(_api::Kubernetes.AuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.create_authorization_v1beta1_self_subject_access_review(_api::Kubernetes.AuthorizationV1beta1Api, args...; kwargs...)

# delete_storage_class
delete_storage_class(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.delete_storage_v1_storage_class(_api::Kubernetes.StorageV1Api, args...; kwargs...)
delete_storage_class(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.delete_storage_v1beta1_storage_class(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# create_audit_sink
create_audit_sink(_api::Kubernetes.AuditregistrationV1alpha1Api, args...; kwargs...) = Kubernetes.create_auditregistration_v1alpha1_audit_sink(_api::Kubernetes.AuditregistrationV1alpha1Api, args...; kwargs...)

# watch_namespaced_persistent_volume_claim
watch_namespaced_persistent_volume_claim(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespaced_persistent_volume_claim(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_custom_resource_definition
list_custom_resource_definition(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...) = Kubernetes.list_apiextensions_v1_custom_resource_definition(_api::Kubernetes.ApiextensionsV1Api, args...; kwargs...)
list_custom_resource_definition(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...) = Kubernetes.list_apiextensions_v1beta1_custom_resource_definition(_api::Kubernetes.ApiextensionsV1beta1Api, args...; kwargs...)

# replace_persistent_volume
replace_persistent_volume(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_persistent_volume(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# connect_patch_namespaced_service_proxy_with_path
connect_patch_namespaced_service_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_patch_namespaced_service_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# connect_put_node_proxy
connect_put_node_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_put_node_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_service_for_all_namespaces
list_service_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_service_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# read_pod_security_policy
read_pod_security_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.read_extensions_v1beta1_pod_security_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
read_pod_security_policy(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...) = Kubernetes.read_policy_v1beta1_pod_security_policy(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...)

# delete_persistent_volume
delete_persistent_volume(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_persistent_volume(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_c_s_i_node
patch_c_s_i_node(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.patch_storage_v1_c_s_i_node(_api::Kubernetes.StorageV1Api, args...; kwargs...)
patch_c_s_i_node(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.patch_storage_v1beta1_c_s_i_node(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# create_namespaced_pod_eviction
create_namespaced_pod_eviction(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.create_core_v1_namespaced_pod_eviction(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_collection_namespaced_persistent_volume_claim
delete_collection_namespaced_persistent_volume_claim(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_collection_namespaced_persistent_volume_claim(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_namespaced_service_status
patch_namespaced_service_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.patch_core_v1_namespaced_service_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# connect_head_namespaced_service_proxy
connect_head_namespaced_service_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_head_namespaced_service_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_namespaced_pod_preset
delete_namespaced_pod_preset(_api::Kubernetes.SettingsV1alpha1Api, args...; kwargs...) = Kubernetes.delete_settings_v1alpha1_namespaced_pod_preset(_api::Kubernetes.SettingsV1alpha1Api, args...; kwargs...)

# patch_namespaced_role
patch_namespaced_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.patch_rbac_authorization_v1_namespaced_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
patch_namespaced_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.patch_rbac_authorization_v1alpha1_namespaced_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
patch_namespaced_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.patch_rbac_authorization_v1beta1_namespaced_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# patch_namespaced_daemon_set
patch_namespaced_daemon_set(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.patch_apps_v1_namespaced_daemon_set(_api::Kubernetes.AppsV1Api, args...; kwargs...)
patch_namespaced_daemon_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.patch_apps_v1beta2_namespaced_daemon_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
patch_namespaced_daemon_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.patch_extensions_v1beta1_namespaced_daemon_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# list_role_for_all_namespaces
list_role_for_all_namespaces(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.list_rbac_authorization_v1_role_for_all_namespaces(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
list_role_for_all_namespaces(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.list_rbac_authorization_v1alpha1_role_for_all_namespaces(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
list_role_for_all_namespaces(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.list_rbac_authorization_v1beta1_role_for_all_namespaces(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# list_event_for_all_namespaces
list_event_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_event_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...)
list_event_for_all_namespaces(_api::Kubernetes.EventsV1beta1Api, args...; kwargs...) = Kubernetes.list_events_v1beta1_event_for_all_namespaces(_api::Kubernetes.EventsV1beta1Api, args...; kwargs...)

# delete_collection_namespaced_event
delete_collection_namespaced_event(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_collection_namespaced_event(_api::Kubernetes.CoreV1Api, args...; kwargs...)
delete_collection_namespaced_event(_api::Kubernetes.EventsV1beta1Api, args...; kwargs...) = Kubernetes.delete_events_v1beta1_collection_namespaced_event(_api::Kubernetes.EventsV1beta1Api, args...; kwargs...)

# list_namespaced_limit_range
list_namespaced_limit_range(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_namespaced_limit_range(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_namespaced_network_policy
delete_namespaced_network_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.delete_extensions_v1beta1_namespaced_network_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
delete_namespaced_network_policy(_api::Kubernetes.NetworkingV1Api, args...; kwargs...) = Kubernetes.delete_networking_v1_namespaced_network_policy(_api::Kubernetes.NetworkingV1Api, args...; kwargs...)

# create_flow_schema
create_flow_schema(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.create_flowcontrol_apiserver_v1alpha1_flow_schema(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)

# list_cluster_role
list_cluster_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.list_rbac_authorization_v1_cluster_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
list_cluster_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.list_rbac_authorization_v1alpha1_cluster_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
list_cluster_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.list_rbac_authorization_v1beta1_cluster_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# list_endpoints_for_all_namespaces
list_endpoints_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_endpoints_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_priority_class
replace_priority_class(_api::Kubernetes.SchedulingV1Api, args...; kwargs...) = Kubernetes.replace_scheduling_v1_priority_class(_api::Kubernetes.SchedulingV1Api, args...; kwargs...)
replace_priority_class(_api::Kubernetes.SchedulingV1alpha1Api, args...; kwargs...) = Kubernetes.replace_scheduling_v1alpha1_priority_class(_api::Kubernetes.SchedulingV1alpha1Api, args...; kwargs...)
replace_priority_class(_api::Kubernetes.SchedulingV1beta1Api, args...; kwargs...) = Kubernetes.replace_scheduling_v1beta1_priority_class(_api::Kubernetes.SchedulingV1beta1Api, args...; kwargs...)

# list_metric_value
list_metric_value(_api::Kubernetes.CustomMetricsV1beta1Api, args...; kwargs...) = Kubernetes.list_custom_metrics_v1beta1_metric_value(_api::Kubernetes.CustomMetricsV1beta1Api, args...; kwargs...)

# patch_certificate_signing_request
patch_certificate_signing_request(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...) = Kubernetes.patch_certificates_v1beta1_certificate_signing_request(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...)

# read_certificate_signing_request_status
read_certificate_signing_request_status(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...) = Kubernetes.read_certificates_v1beta1_certificate_signing_request_status(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...)

# read_namespace_status
read_namespace_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_namespace_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_namespaced_endpoint_slice
list_namespaced_endpoint_slice(_api::Kubernetes.DiscoveryV1beta1Api, args...; kwargs...) = Kubernetes.list_discovery_v1beta1_namespaced_endpoint_slice(_api::Kubernetes.DiscoveryV1beta1Api, args...; kwargs...)

# read_mutating_webhook_configuration
read_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...) = Kubernetes.read_admissionregistration_v1_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...)
read_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...) = Kubernetes.read_admissionregistration_v1beta1_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...)

# delete_collection_c_s_i_node
delete_collection_c_s_i_node(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.delete_storage_v1_collection_c_s_i_node(_api::Kubernetes.StorageV1Api, args...; kwargs...)
delete_collection_c_s_i_node(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.delete_storage_v1beta1_collection_c_s_i_node(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# watch_runtime_class
watch_runtime_class(_api::Kubernetes.NodeV1alpha1Api, args...; kwargs...) = Kubernetes.watch_node_v1alpha1_runtime_class(_api::Kubernetes.NodeV1alpha1Api, args...; kwargs...)
watch_runtime_class(_api::Kubernetes.NodeV1beta1Api, args...; kwargs...) = Kubernetes.watch_node_v1beta1_runtime_class(_api::Kubernetes.NodeV1beta1Api, args...; kwargs...)

# list_component_status
list_component_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_component_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespaced_persistent_volume_claim
replace_namespaced_persistent_volume_claim(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_namespaced_persistent_volume_claim(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_priority_level_configuration_status
patch_priority_level_configuration_status(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.patch_flowcontrol_apiserver_v1alpha1_priority_level_configuration_status(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)

# list_c_s_i_node
list_c_s_i_node(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.list_storage_v1_c_s_i_node(_api::Kubernetes.StorageV1Api, args...; kwargs...)
list_c_s_i_node(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.list_storage_v1beta1_c_s_i_node(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# delete_collection_namespaced_ingress
delete_collection_namespaced_ingress(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.delete_extensions_v1beta1_collection_namespaced_ingress(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
delete_collection_namespaced_ingress(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...) = Kubernetes.delete_networking_v1beta1_collection_namespaced_ingress(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...)

# read_node_metrics
read_node_metrics(_api::Kubernetes.MetricsV1beta1Api, args...; kwargs...) = Kubernetes.read_metrics_v1beta1_node_metrics(_api::Kubernetes.MetricsV1beta1Api, args...; kwargs...)

# read_audit_sink
read_audit_sink(_api::Kubernetes.AuditregistrationV1alpha1Api, args...; kwargs...) = Kubernetes.read_auditregistration_v1alpha1_audit_sink(_api::Kubernetes.AuditregistrationV1alpha1Api, args...; kwargs...)

# create_mutating_webhook_configuration
create_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...) = Kubernetes.create_admissionregistration_v1_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1Api, args...; kwargs...)
create_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...) = Kubernetes.create_admissionregistration_v1beta1_mutating_webhook_configuration(_api::Kubernetes.AdmissionregistrationV1beta1Api, args...; kwargs...)

# read_a_p_i_service
read_a_p_i_service(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...) = Kubernetes.read_apiregistration_v1_a_p_i_service(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...)
read_a_p_i_service(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...) = Kubernetes.read_apiregistration_v1beta1_a_p_i_service(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...)

# list_node
list_node(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_node(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_namespaced_replication_controller_dummy_scale
patch_namespaced_replication_controller_dummy_scale(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.patch_extensions_v1beta1_namespaced_replication_controller_dummy_scale(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# watch_priority_level_configuration_list
watch_priority_level_configuration_list(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.watch_flowcontrol_apiserver_v1alpha1_priority_level_configuration_list(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)

# list_pod_template_for_all_namespaces
list_pod_template_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_pod_template_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_namespaced_resource_quota_list
watch_namespaced_resource_quota_list(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespaced_resource_quota_list(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# create_namespaced_replica_set
create_namespaced_replica_set(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.create_apps_v1_namespaced_replica_set(_api::Kubernetes.AppsV1Api, args...; kwargs...)
create_namespaced_replica_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.create_apps_v1beta2_namespaced_replica_set(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
create_namespaced_replica_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.create_extensions_v1beta1_namespaced_replica_set(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# patch_namespaced_ingress
patch_namespaced_ingress(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.patch_extensions_v1beta1_namespaced_ingress(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
patch_namespaced_ingress(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...) = Kubernetes.patch_networking_v1beta1_namespaced_ingress(_api::Kubernetes.NetworkingV1beta1Api, args...; kwargs...)

# patch_namespaced_horizontal_pod_autoscaler_status
patch_namespaced_horizontal_pod_autoscaler_status(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...) = Kubernetes.patch_autoscaling_v1_namespaced_horizontal_pod_autoscaler_status(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...)
patch_namespaced_horizontal_pod_autoscaler_status(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...) = Kubernetes.patch_autoscaling_v2beta1_namespaced_horizontal_pod_autoscaler_status(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...)
patch_namespaced_horizontal_pod_autoscaler_status(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...) = Kubernetes.patch_autoscaling_v2beta2_namespaced_horizontal_pod_autoscaler_status(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...)

# list_namespaced_resource_quota
list_namespaced_resource_quota(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_namespaced_resource_quota(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_provisioner_status
patch_provisioner_status(_api::Kubernetes.KarpenterShV1alpha5Api, args...; kwargs...) = Kubernetes.patch_karpenter_sh_v1alpha5_provisioner_status(_api::Kubernetes.KarpenterShV1alpha5Api, args...; kwargs...)

# create_subject_access_review
create_subject_access_review(_api::Kubernetes.AuthorizationV1Api, args...; kwargs...) = Kubernetes.create_authorization_v1_subject_access_review(_api::Kubernetes.AuthorizationV1Api, args...; kwargs...)
create_subject_access_review(_api::Kubernetes.AuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.create_authorization_v1beta1_subject_access_review(_api::Kubernetes.AuthorizationV1beta1Api, args...; kwargs...)

# patch_namespaced_deployment_status
patch_namespaced_deployment_status(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.patch_apps_v1_namespaced_deployment_status(_api::Kubernetes.AppsV1Api, args...; kwargs...)
patch_namespaced_deployment_status(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.patch_apps_v1beta1_namespaced_deployment_status(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
patch_namespaced_deployment_status(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.patch_apps_v1beta2_namespaced_deployment_status(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
patch_namespaced_deployment_status(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.patch_extensions_v1beta1_namespaced_deployment_status(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# create_namespaced_service_account
create_namespaced_service_account(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.create_core_v1_namespaced_service_account(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# list_runtime_class
list_runtime_class(_api::Kubernetes.NodeV1alpha1Api, args...; kwargs...) = Kubernetes.list_node_v1alpha1_runtime_class(_api::Kubernetes.NodeV1alpha1Api, args...; kwargs...)
list_runtime_class(_api::Kubernetes.NodeV1beta1Api, args...; kwargs...) = Kubernetes.list_node_v1beta1_runtime_class(_api::Kubernetes.NodeV1beta1Api, args...; kwargs...)

# replace_volume_attachment
replace_volume_attachment(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.replace_storage_v1_volume_attachment(_api::Kubernetes.StorageV1Api, args...; kwargs...)
replace_volume_attachment(_api::Kubernetes.StorageV1alpha1Api, args...; kwargs...) = Kubernetes.replace_storage_v1alpha1_volume_attachment(_api::Kubernetes.StorageV1alpha1Api, args...; kwargs...)
replace_volume_attachment(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.replace_storage_v1beta1_volume_attachment(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# read_namespaced_limit_range
read_namespaced_limit_range(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_namespaced_limit_range(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespace
replace_namespace(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_namespace(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespaced_replication_controller_scale
replace_namespaced_replication_controller_scale(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_namespaced_replication_controller_scale(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_a_p_i_service_list
watch_a_p_i_service_list(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...) = Kubernetes.watch_apiregistration_v1_a_p_i_service_list(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...)
watch_a_p_i_service_list(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...) = Kubernetes.watch_apiregistration_v1beta1_a_p_i_service_list(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...)

# replace_namespaced_endpoint_slice
replace_namespaced_endpoint_slice(_api::Kubernetes.DiscoveryV1beta1Api, args...; kwargs...) = Kubernetes.replace_discovery_v1beta1_namespaced_endpoint_slice(_api::Kubernetes.DiscoveryV1beta1Api, args...; kwargs...)

# watch_namespaced_endpoint_slice
watch_namespaced_endpoint_slice(_api::Kubernetes.DiscoveryV1beta1Api, args...; kwargs...) = Kubernetes.watch_discovery_v1beta1_namespaced_endpoint_slice(_api::Kubernetes.DiscoveryV1beta1Api, args...; kwargs...)

# create_priority_level_configuration
create_priority_level_configuration(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.create_flowcontrol_apiserver_v1alpha1_priority_level_configuration(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)

# read_provisioner_status
read_provisioner_status(_api::Kubernetes.KarpenterShV1alpha5Api, args...; kwargs...) = Kubernetes.read_karpenter_sh_v1alpha5_provisioner_status(_api::Kubernetes.KarpenterShV1alpha5Api, args...; kwargs...)

# patch_priority_class
patch_priority_class(_api::Kubernetes.SchedulingV1Api, args...; kwargs...) = Kubernetes.patch_scheduling_v1_priority_class(_api::Kubernetes.SchedulingV1Api, args...; kwargs...)
patch_priority_class(_api::Kubernetes.SchedulingV1alpha1Api, args...; kwargs...) = Kubernetes.patch_scheduling_v1alpha1_priority_class(_api::Kubernetes.SchedulingV1alpha1Api, args...; kwargs...)
patch_priority_class(_api::Kubernetes.SchedulingV1beta1Api, args...; kwargs...) = Kubernetes.patch_scheduling_v1beta1_priority_class(_api::Kubernetes.SchedulingV1beta1Api, args...; kwargs...)

# connect_options_node_proxy
connect_options_node_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_options_node_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespaced_daemon_set_status
replace_namespaced_daemon_set_status(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.replace_apps_v1_namespaced_daemon_set_status(_api::Kubernetes.AppsV1Api, args...; kwargs...)
replace_namespaced_daemon_set_status(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.replace_apps_v1beta2_namespaced_daemon_set_status(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
replace_namespaced_daemon_set_status(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.replace_extensions_v1beta1_namespaced_daemon_set_status(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# read_namespaced_endpoints
read_namespaced_endpoints(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.read_core_v1_namespaced_endpoints(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# create_namespaced_pod_preset
create_namespaced_pod_preset(_api::Kubernetes.SettingsV1alpha1Api, args...; kwargs...) = Kubernetes.create_settings_v1alpha1_namespaced_pod_preset(_api::Kubernetes.SettingsV1alpha1Api, args...; kwargs...)

# patch_priority_level_configuration
patch_priority_level_configuration(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...) = Kubernetes.patch_flowcontrol_apiserver_v1alpha1_priority_level_configuration(_api::Kubernetes.FlowcontrolApiserverV1alpha1Api, args...; kwargs...)

# watch_pod_template_list_for_all_namespaces
watch_pod_template_list_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_pod_template_list_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_certificate_signing_request
watch_certificate_signing_request(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...) = Kubernetes.watch_certificates_v1beta1_certificate_signing_request(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...)

# replace_namespaced_replica_set_scale
replace_namespaced_replica_set_scale(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.replace_apps_v1_namespaced_replica_set_scale(_api::Kubernetes.AppsV1Api, args...; kwargs...)
replace_namespaced_replica_set_scale(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.replace_apps_v1beta2_namespaced_replica_set_scale(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
replace_namespaced_replica_set_scale(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.replace_extensions_v1beta1_namespaced_replica_set_scale(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# create_namespaced_binding
create_namespaced_binding(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.create_core_v1_namespaced_binding(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_collection_audit_sink
delete_collection_audit_sink(_api::Kubernetes.AuditregistrationV1alpha1Api, args...; kwargs...) = Kubernetes.delete_auditregistration_v1alpha1_collection_audit_sink(_api::Kubernetes.AuditregistrationV1alpha1Api, args...; kwargs...)

# delete_namespaced_pod_disruption_budget
delete_namespaced_pod_disruption_budget(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...) = Kubernetes.delete_policy_v1beta1_namespaced_pod_disruption_budget(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...)

# read_volume_attachment_status
read_volume_attachment_status(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.read_storage_v1_volume_attachment_status(_api::Kubernetes.StorageV1Api, args...; kwargs...)

# connect_delete_node_proxy
connect_delete_node_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_delete_node_proxy(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_namespaced_role_binding_list
watch_namespaced_role_binding_list(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1_namespaced_role_binding_list(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
watch_namespaced_role_binding_list(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1alpha1_namespaced_role_binding_list(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
watch_namespaced_role_binding_list(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.watch_rbac_authorization_v1beta1_namespaced_role_binding_list(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# list_namespaced_role
list_namespaced_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...) = Kubernetes.list_rbac_authorization_v1_namespaced_role(_api::Kubernetes.RbacAuthorizationV1Api, args...; kwargs...)
list_namespaced_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...) = Kubernetes.list_rbac_authorization_v1alpha1_namespaced_role(_api::Kubernetes.RbacAuthorizationV1alpha1Api, args...; kwargs...)
list_namespaced_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...) = Kubernetes.list_rbac_authorization_v1beta1_namespaced_role(_api::Kubernetes.RbacAuthorizationV1beta1Api, args...; kwargs...)

# delete_collection_c_s_i_driver
delete_collection_c_s_i_driver(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.delete_storage_v1beta1_collection_c_s_i_driver(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# patch_c_s_i_driver
patch_c_s_i_driver(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.patch_storage_v1beta1_c_s_i_driver(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# read_c_s_i_driver
read_c_s_i_driver(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.read_storage_v1beta1_c_s_i_driver(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# patch_namespaced_service
patch_namespaced_service(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.patch_core_v1_namespaced_service(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_a_p_i_service
replace_a_p_i_service(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...) = Kubernetes.replace_apiregistration_v1_a_p_i_service(_api::Kubernetes.ApiregistrationV1Api, args...; kwargs...)
replace_a_p_i_service(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...) = Kubernetes.replace_apiregistration_v1beta1_a_p_i_service(_api::Kubernetes.ApiregistrationV1beta1Api, args...; kwargs...)

# patch_namespaced_replication_controller_status
patch_namespaced_replication_controller_status(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.patch_core_v1_namespaced_replication_controller_status(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespaced_horizontal_pod_autoscaler_status
replace_namespaced_horizontal_pod_autoscaler_status(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...) = Kubernetes.replace_autoscaling_v1_namespaced_horizontal_pod_autoscaler_status(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...)
replace_namespaced_horizontal_pod_autoscaler_status(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...) = Kubernetes.replace_autoscaling_v2beta1_namespaced_horizontal_pod_autoscaler_status(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...)
replace_namespaced_horizontal_pod_autoscaler_status(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...) = Kubernetes.replace_autoscaling_v2beta2_namespaced_horizontal_pod_autoscaler_status(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...)

# replace_namespaced_job
replace_namespaced_job(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.replace_batch_v1_namespaced_job(_api::Kubernetes.BatchV1Api, args...; kwargs...)

# watch_namespaced_pod
watch_namespaced_pod(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespaced_pod(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_persistent_volume_list
watch_persistent_volume_list(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_persistent_volume_list(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_service_account_list_for_all_namespaces
watch_service_account_list_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_service_account_list_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_certificate_signing_request_approval
replace_certificate_signing_request_approval(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...) = Kubernetes.replace_certificates_v1beta1_certificate_signing_request_approval(_api::Kubernetes.CertificatesV1beta1Api, args...; kwargs...)

# watch_pod_security_policy
watch_pod_security_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.watch_extensions_v1beta1_pod_security_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
watch_pod_security_policy(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...) = Kubernetes.watch_policy_v1beta1_pod_security_policy(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...)

# delete_collection_runtime_class
delete_collection_runtime_class(_api::Kubernetes.NodeV1alpha1Api, args...; kwargs...) = Kubernetes.delete_node_v1alpha1_collection_runtime_class(_api::Kubernetes.NodeV1alpha1Api, args...; kwargs...)
delete_collection_runtime_class(_api::Kubernetes.NodeV1beta1Api, args...; kwargs...) = Kubernetes.delete_node_v1beta1_collection_runtime_class(_api::Kubernetes.NodeV1beta1Api, args...; kwargs...)

# read_namespaced_pod_disruption_budget
read_namespaced_pod_disruption_budget(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...) = Kubernetes.read_policy_v1beta1_namespaced_pod_disruption_budget(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...)

# watch_namespaced_replication_controller_list
watch_namespaced_replication_controller_list(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespaced_replication_controller_list(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_namespaced_horizontal_pod_autoscaler_list
watch_namespaced_horizontal_pod_autoscaler_list(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...) = Kubernetes.watch_autoscaling_v1_namespaced_horizontal_pod_autoscaler_list(_api::Kubernetes.AutoscalingV1Api, args...; kwargs...)
watch_namespaced_horizontal_pod_autoscaler_list(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...) = Kubernetes.watch_autoscaling_v2beta1_namespaced_horizontal_pod_autoscaler_list(_api::Kubernetes.AutoscalingV2beta1Api, args...; kwargs...)
watch_namespaced_horizontal_pod_autoscaler_list(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...) = Kubernetes.watch_autoscaling_v2beta2_namespaced_horizontal_pod_autoscaler_list(_api::Kubernetes.AutoscalingV2beta2Api, args...; kwargs...)

# delete_namespaced_pod
delete_namespaced_pod(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.delete_core_v1_namespaced_pod(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_namespaced_replication_controller
watch_namespaced_replication_controller(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_namespaced_replication_controller(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_namespaced_resource_quota
patch_namespaced_resource_quota(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.patch_core_v1_namespaced_resource_quota(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# patch_namespaced_daemon_set_status
patch_namespaced_daemon_set_status(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.patch_apps_v1_namespaced_daemon_set_status(_api::Kubernetes.AppsV1Api, args...; kwargs...)
patch_namespaced_daemon_set_status(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.patch_apps_v1beta2_namespaced_daemon_set_status(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)
patch_namespaced_daemon_set_status(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.patch_extensions_v1beta1_namespaced_daemon_set_status(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)

# list_namespaced_network_policy
list_namespaced_network_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...) = Kubernetes.list_extensions_v1beta1_namespaced_network_policy(_api::Kubernetes.ExtensionsV1beta1Api, args...; kwargs...)
list_namespaced_network_policy(_api::Kubernetes.NetworkingV1Api, args...; kwargs...) = Kubernetes.list_networking_v1_namespaced_network_policy(_api::Kubernetes.NetworkingV1Api, args...; kwargs...)

# watch_persistent_volume_claim_list_for_all_namespaces
watch_persistent_volume_claim_list_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.watch_core_v1_persistent_volume_claim_list_for_all_namespaces(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# delete_c_s_i_node
delete_c_s_i_node(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.delete_storage_v1_c_s_i_node(_api::Kubernetes.StorageV1Api, args...; kwargs...)
delete_c_s_i_node(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.delete_storage_v1beta1_c_s_i_node(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# list_namespaced_persistent_volume_claim
list_namespaced_persistent_volume_claim(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.list_core_v1_namespaced_persistent_volume_claim(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# create_c_s_i_driver
create_c_s_i_driver(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.create_storage_v1beta1_c_s_i_driver(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)

# list_namespaced_controller_revision
list_namespaced_controller_revision(_api::Kubernetes.AppsV1Api, args...; kwargs...) = Kubernetes.list_apps_v1_namespaced_controller_revision(_api::Kubernetes.AppsV1Api, args...; kwargs...)
list_namespaced_controller_revision(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...) = Kubernetes.list_apps_v1beta1_namespaced_controller_revision(_api::Kubernetes.AppsV1beta1Api, args...; kwargs...)
list_namespaced_controller_revision(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...) = Kubernetes.list_apps_v1beta2_namespaced_controller_revision(_api::Kubernetes.AppsV1beta2Api, args...; kwargs...)

# connect_put_namespaced_pod_proxy_with_path
connect_put_namespaced_pod_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.connect_core_v1_put_namespaced_pod_proxy_with_path(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# replace_namespaced_service_account
replace_namespaced_service_account(_api::Kubernetes.CoreV1Api, args...; kwargs...) = Kubernetes.replace_core_v1_namespaced_service_account(_api::Kubernetes.CoreV1Api, args...; kwargs...)

# watch_cron_job_list_for_all_namespaces
watch_cron_job_list_for_all_namespaces(_api::Kubernetes.BatchV1Api, args...; kwargs...) = Kubernetes.watch_batch_v1_cron_job_list_for_all_namespaces(_api::Kubernetes.BatchV1Api, args...; kwargs...)
watch_cron_job_list_for_all_namespaces(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...) = Kubernetes.watch_batch_v1beta1_cron_job_list_for_all_namespaces(_api::Kubernetes.BatchV1beta1Api, args...; kwargs...)
watch_cron_job_list_for_all_namespaces(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...) = Kubernetes.watch_batch_v2alpha1_cron_job_list_for_all_namespaces(_api::Kubernetes.BatchV2alpha1Api, args...; kwargs...)

# delete_collection_namespaced_pod_disruption_budget
delete_collection_namespaced_pod_disruption_budget(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...) = Kubernetes.delete_policy_v1beta1_collection_namespaced_pod_disruption_budget(_api::Kubernetes.PolicyV1beta1Api, args...; kwargs...)

# read_namespaced_lease
read_namespaced_lease(_api::Kubernetes.CoordinationV1Api, args...; kwargs...) = Kubernetes.read_coordination_v1_namespaced_lease(_api::Kubernetes.CoordinationV1Api, args...; kwargs...)
read_namespaced_lease(_api::Kubernetes.CoordinationV1beta1Api, args...; kwargs...) = Kubernetes.read_coordination_v1beta1_namespaced_lease(_api::Kubernetes.CoordinationV1beta1Api, args...; kwargs...)

# read_volume_attachment
read_volume_attachment(_api::Kubernetes.StorageV1Api, args...; kwargs...) = Kubernetes.read_storage_v1_volume_attachment(_api::Kubernetes.StorageV1Api, args...; kwargs...)
read_volume_attachment(_api::Kubernetes.StorageV1alpha1Api, args...; kwargs...) = Kubernetes.read_storage_v1alpha1_volume_attachment(_api::Kubernetes.StorageV1alpha1Api, args...; kwargs...)
read_volume_attachment(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...) = Kubernetes.read_storage_v1beta1_volume_attachment(_api::Kubernetes.StorageV1beta1Api, args...; kwargs...)
