# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.

struct ApisApi <: OpenAPI.APIClientImpl
    client::OpenAPI.Clients.Client
end

"""
The default API base path for APIs in `ApisApi`.
This can be used to construct the `OpenAPI.Clients.Client` instance.
"""
basepath(::Type{ ApisApi }) = "http://localhost"

const _returntypes_get_a_p_i_versions_ApisApi = Dict{Regex,Type}(
    Regex("^" * replace("200", "x"=>".") * "\$") => IoK8sApimachineryPkgApisMetaV1APIGroupList,
    Regex("^" * replace("401", "x"=>".") * "\$") => Nothing,
)

function _oacinternal_get_a_p_i_versions(_api::ApisApi; _mediaType=nothing)
    _ctx = OpenAPI.Clients.Ctx(_api.client, "GET", _returntypes_get_a_p_i_versions_ApisApi, "/apis/", ["BearerToken", ])
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf", ])
    OpenAPI.Clients.set_header_content_type(_ctx, (_mediaType === nothing) ? [] : [_mediaType])
    return _ctx
end

@doc raw"""get available API versions

Params:

Return: IoK8sApimachineryPkgApisMetaV1APIGroupList, OpenAPI.Clients.ApiResponse
"""
function get_a_p_i_versions(_api::ApisApi; _mediaType=nothing)
    _ctx = _oacinternal_get_a_p_i_versions(_api; _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx)
end

function get_a_p_i_versions(_api::ApisApi, response_stream::Channel; _mediaType=nothing)
    _ctx = _oacinternal_get_a_p_i_versions(_api; _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx, response_stream)
end

export get_a_p_i_versions
