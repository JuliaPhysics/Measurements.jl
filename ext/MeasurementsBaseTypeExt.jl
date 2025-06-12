module MeasurementsBaseTypeExt

using Measurements: Measurement
import BaseType: base_numeric_type

base_numeric_type(::Type{<:Measurement{T}}) where {T} = base_numeric_type(T)

end
