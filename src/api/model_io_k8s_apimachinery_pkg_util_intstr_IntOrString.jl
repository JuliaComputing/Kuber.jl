const IoK8sApimachineryPkgUtilIntstrIntOrString = String

convert(::Type{IoK8sApimachineryPkgUtilIntstrIntOrString}, v::T) where {T<:Integer} = string(v)
