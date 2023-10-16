module MeasurementsBaseTypeExt

if isdefined(Base, :get_extension)
    using Measurements: Measurement
    import BaseType: base_numeric_type
else
    using ..Measurements: Measurement
    import ..BaseType: base_numeric_type
end

base_numeric_type(::Type{<:Measurement{T}}) where {T} = base_numeric_type(T)

end
