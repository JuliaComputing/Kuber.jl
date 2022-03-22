if !isdefined(@__MODULE__, :IoK8sApimachineryPkgUtilIntstrIntOrString)
    const IoK8sApimachineryPkgUtilIntstrIntOrString = String
else
    @warn("Skipping redefinition of IoK8sApimachineryPkgUtilIntstrIntOrString to String")
end

if !hasmethod(convert, (Type{IoK8sApimachineryPkgUtilIntstrIntOrString}, T where {T<:Integer}))
    convert(::Type{IoK8sApimachineryPkgUtilIntstrIntOrString}, v::T) where {T<:Integer} = string(v)
end
