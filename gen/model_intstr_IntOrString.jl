typealias IntstrIntOrString String

convert{T<:Integer}(::Type{IntstrIntOrString}, v::T) = string(v)
