# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""Represents a volume that is populated with the contents of a git repository. Git repo volumes do not support ownership management. Git repo volumes support SELinux relabeling.  DEPRECATED: GitRepo is deprecated. To provision a container with a git repo, mount an EmptyDir into an InitContainer that clones the repo using git, then mount the EmptyDir into the Pod&#39;s container.

    IoK8sApiCoreV1GitRepoVolumeSource(;
        directory=nothing,
        repository=nothing,
        revision=nothing,
    )

    - directory::String : Target directory name. Must not contain or start with &#39;..&#39;.  If &#39;.&#39; is supplied, the volume directory will be the git repository.  Otherwise, if specified, the volume will contain the git repository in the subdirectory with the given name.
    - repository::String : Repository URL
    - revision::String : Commit hash for the specified revision.
"""
mutable struct IoK8sApiCoreV1GitRepoVolumeSource <: SwaggerModel
    directory::Any # spec type: Union{ Nothing, String } # spec name: directory
    repository::Any # spec type: Union{ Nothing, String } # spec name: repository
    revision::Any # spec type: Union{ Nothing, String } # spec name: revision

    function IoK8sApiCoreV1GitRepoVolumeSource(;directory=nothing, repository=nothing, revision=nothing)
        o = new()
        validate_property(IoK8sApiCoreV1GitRepoVolumeSource, Symbol("directory"), directory)
        setfield!(o, Symbol("directory"), directory)
        validate_property(IoK8sApiCoreV1GitRepoVolumeSource, Symbol("repository"), repository)
        setfield!(o, Symbol("repository"), repository)
        validate_property(IoK8sApiCoreV1GitRepoVolumeSource, Symbol("revision"), revision)
        setfield!(o, Symbol("revision"), revision)
        o
    end
end # type IoK8sApiCoreV1GitRepoVolumeSource

const _property_map_IoK8sApiCoreV1GitRepoVolumeSource = Dict{Symbol,Symbol}(Symbol("directory")=>Symbol("directory"), Symbol("repository")=>Symbol("repository"), Symbol("revision")=>Symbol("revision"))
const _property_types_IoK8sApiCoreV1GitRepoVolumeSource = Dict{Symbol,String}(Symbol("directory")=>"String", Symbol("repository")=>"String", Symbol("revision")=>"String")
Base.propertynames(::Type{ IoK8sApiCoreV1GitRepoVolumeSource }) = collect(keys(_property_map_IoK8sApiCoreV1GitRepoVolumeSource))
Swagger.property_type(::Type{ IoK8sApiCoreV1GitRepoVolumeSource }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1GitRepoVolumeSource[name]))}
Swagger.field_name(::Type{ IoK8sApiCoreV1GitRepoVolumeSource }, property_name::Symbol) =  _property_map_IoK8sApiCoreV1GitRepoVolumeSource[property_name]

function check_required(o::IoK8sApiCoreV1GitRepoVolumeSource)
    (getproperty(o, Symbol("repository")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiCoreV1GitRepoVolumeSource }, name::Symbol, val)
end
