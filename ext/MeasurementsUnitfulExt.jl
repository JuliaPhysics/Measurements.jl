### unitful.jl
#
# Copyright (C) 2019 Mosè Giordano.
#
# Maintainer: Mosè Giordano <mose AT gnu DOT org>
# Keywords: uncertainty, error propagation, physics
#
# This file is a part of Measurements.jl.
#
# License is MIT "Expat".
#
### Commentary:
#
# This file integration with Unitful.jl.
#
### Code:

module MeasurementsUnitfulExt

if isdefined(Base, :get_extension)
    using Measurements
    using Measurements: value, uncertainty
    import Unitful: AbstractQuantity, unit, ustrip
else
    using ..Measurements
    using ..Measurements: value, uncertainty
    import ..Unitful: AbstractQuantity, unit, ustrip
end


function Measurements.measurement(a::T, b::T) where {T<:AbstractQuantity}
    u = unit(a)
    return measurement(ustrip(u, a), ustrip(u, b)) * u
end
Measurements.measurement(a::AbstractQuantity{T1,D,U1},
                         b::AbstractQuantity{T2,D,U2}) where {T1,T2,D,U1,U2} =
                             measurement(promote(a, b)...)

function Measurements.value(x::AbstractQuantity)
    u = unit(x)
    return value(ustrip(u, x)) * u
end

function Measurements.uncertainty(x::AbstractQuantity)
    u = unit(x)
    return uncertainty(ustrip(u, x)) * u
end

function Measurements.stdscore(a::AbstractQuantity{Measurement{T1},D,U1}, b::AbstractQuantity{T2,D,U2}) where {T1<:AbstractFloat,T2<:Real,D,U1,U2}
    u = unit(a)
    return stdscore(ustrip(u, a), ustrip(u, b)) # unitless quantity.
end

function Measurements.uncertainty_components(a::AbstractQuantity{Measurement{T},D,U}) where {T<:AbstractFloat,D,U}
    u = unit(a)
    return Measurements.uncertainty_components(ustrip(u, a))
    # We've lost units :(
end

end
