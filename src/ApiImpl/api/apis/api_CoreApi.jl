# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.

struct CoreApi <: OpenAPI.APIClientImpl
    client::OpenAPI.Clients.Client
end

"""
The default API base path for APIs in `CoreApi`.
This can be used to construct the `OpenAPI.Clients.Client` instance.
"""
basepath(::Type{ CoreApi }) = "http://localhost"

const _returntypes_get_core_a_p_i_versions_CoreApi = Dict{Regex,Type}(
    Regex("^" * replace("200", "x"=>".") * "\$") => IoK8sApimachineryPkgApisMetaV1APIVersions,
    Regex("^" * replace("401", "x"=>".") * "\$") => Nothing,
)

function _oacinternal_get_core_a_p_i_versions(_api::CoreApi; _mediaType=nothing)
    _ctx = OpenAPI.Clients.Ctx(_api.client, "GET", _returntypes_get_core_a_p_i_versions_CoreApi, "/api/", ["BearerToken", ])
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf", ])
    OpenAPI.Clients.set_header_content_type(_ctx, (_mediaType === nothing) ? [] : [_mediaType])
    return _ctx
end

@doc raw"""get available API versions

Params:

Return: IoK8sApimachineryPkgApisMetaV1APIVersions, OpenAPI.Clients.ApiResponse
"""
function get_core_a_p_i_versions(_api::CoreApi; _mediaType=nothing)
    _ctx = _oacinternal_get_core_a_p_i_versions(_api; _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx)
end

function get_core_a_p_i_versions(_api::CoreApi, response_stream::Channel; _mediaType=nothing)
    _ctx = _oacinternal_get_core_a_p_i_versions(_api; _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx, response_stream)
end

export get_core_a_p_i_versions