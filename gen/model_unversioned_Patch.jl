# This file was added by the generator script for Kubernetes OpenApi generator.
# This is here to address https://github.com/swagger-api/swagger-codegen/issues/2856

type UnversionedPatch
    function UnversionedPatch(;dummy=nothing)
        o = new()
        o
    end
end # type UnversionedPatch

const _name_map_UnversionedPatch = Dict{String,Symbol}()
Swagger.name_map(::Type{ UnversionedPatch }) = _name_map_UnversionedPatch

function check_required(o::UnversionedPatch)
    true
end

function set_field!(o::UnversionedPatch, name::Symbol, val)
end

convert(::Type{ UnversionedPatch }, json::Dict{String,Any}) = Swagger.from_json(UnversionedPatch, json)
