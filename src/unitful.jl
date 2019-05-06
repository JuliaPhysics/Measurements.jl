### math.jl
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

import .Unitful: AbstractQuantity, unit, ustrip
function Measurements.measurement(a::T, b::T) where {T<:AbstractQuantity}
    u = unit(a)
    return measurement(ustrip(u, a), ustrip(u, b)) * u
end
Measurements.measurement(a::AbstractQuantity{T1,D,U1},
                         b::AbstractQuantity{T2,D,U2}) where {T1,T2,D,U1,U2} =
                             measurement(promote(a, b)...)

function Measurements.value(x::AbstractQuantity{<:Measurement})
    u = unit(x)
    return value(ustrip(u, x)) * u
end

function Measurements.uncertainty(x::AbstractQuantity{<:Measurement})
    u = unit(x)
    return uncertainty(ustrip(u, x)) * u
end
