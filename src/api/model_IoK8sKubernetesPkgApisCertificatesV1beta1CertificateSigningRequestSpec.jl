# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApisCertificatesV1beta1CertificateSigningRequestSpec <: SwaggerModel

    function IoK8sKubernetesPkgApisCertificatesV1beta1CertificateSigningRequestSpec(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApisCertificatesV1beta1CertificateSigningRequestSpec

const _property_map_IoK8sKubernetesPkgApisCertificatesV1beta1CertificateSigningRequestSpec = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApisCertificatesV1beta1CertificateSigningRequestSpec = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApisCertificatesV1beta1CertificateSigningRequestSpec }) = collect(keys(_property_map_IoK8sKubernetesPkgApisCertificatesV1beta1CertificateSigningRequestSpec))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApisCertificatesV1beta1CertificateSigningRequestSpec }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApisCertificatesV1beta1CertificateSigningRequestSpec[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApisCertificatesV1beta1CertificateSigningRequestSpec }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApisCertificatesV1beta1CertificateSigningRequestSpec[property_name]

function check_required(o::IoK8sKubernetesPkgApisCertificatesV1beta1CertificateSigningRequestSpec)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApisCertificatesV1beta1CertificateSigningRequestSpec }, name::Symbol, val)
end