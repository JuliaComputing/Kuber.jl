# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.

struct NodeApi <: OpenAPI.APIClientImpl
    client::OpenAPI.Clients.Client
end

"""
The default API base path for APIs in `NodeApi`.
This can be used to construct the `OpenAPI.Clients.Client` instance.
"""
basepath(::Type{ NodeApi }) = "http://localhost"

const _returntypes_get_node_a_p_i_group_NodeApi = Dict{Regex,Type}(
    Regex("^" * replace("200", "x"=>".") * "\$") => IoK8sApimachineryPkgApisMetaV1APIGroup,
    Regex("^" * replace("401", "x"=>".") * "\$") => Nothing,
)

function _oacinternal_get_node_a_p_i_group(_api::NodeApi; _mediaType=nothing)
    _ctx = OpenAPI.Clients.Ctx(_api.client, "GET", _returntypes_get_node_a_p_i_group_NodeApi, "/apis/node.k8s.io/", ["BearerToken", ])
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf", ])
    OpenAPI.Clients.set_header_content_type(_ctx, (_mediaType === nothing) ? [] : [_mediaType])
    return _ctx
end

@doc raw"""get information of a group

Params:

Return: IoK8sApimachineryPkgApisMetaV1APIGroup, OpenAPI.Clients.ApiResponse
"""
function get_node_a_p_i_group(_api::NodeApi; _mediaType=nothing)
    _ctx = _oacinternal_get_node_a_p_i_group(_api; _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx)
end

function get_node_a_p_i_group(_api::NodeApi, response_stream::Channel; _mediaType=nothing)
    _ctx = _oacinternal_get_node_a_p_i_group(_api; _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx, response_stream)
end

export get_node_a_p_i_group
