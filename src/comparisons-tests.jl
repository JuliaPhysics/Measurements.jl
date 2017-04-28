### comparisons-tests.jl
#
# Copyright (C) 2016, 2017 Mosè Giordano.
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
# This file contains definition of comparison and test functions that support
# Measurement objects.
#
### Code:

import Base: ==, isless, <, <=, isnan, isfinite, isinf, isinteger, iszero

# Two measurements are equal if they have same value and same uncertainty.
# NB: Two measurements are egal (===) if they are exactly the same thing,
# i.e. if they share all the same fields, including the (hopefully) unique tag.
# If you need stricter equality use "===" instead of "==".
==(a::Measurement, b::Measurement) = (a.val==b.val && a.err==b.err)

# Comparison with Real: they are equal if the value of Measurement is equal to
# the number.  If you want to treat the Real like a measurement convert it with
# `Measurement'.  Note on Irrational: the value of a Measurement is always
# T<:AbstractFloat, so it can never be equal to an Irrational, we give a chance
# to the equality to be try by converting the Irrational to T.
=={T<:AbstractFloat}(a::Measurement{T}, b::Irrational) = a.val==T(b)
==(a::Measurement, b::Rational) = a.val==b
==(a::Measurement, b::Real) = a.val==b
=={T<:AbstractFloat}(a::Irrational, b::Measurement{T}) = T(a)==b.val
==(a::Rational, b::Measurement) = a==b.val
==(a::Real, b::Measurement) = a==b.val

# Order relation is based on the value of measurements, uncertainties are ignored
for cmp in (:<, :<=)
    @eval begin
        ($cmp)(a::Measurement, b::Measurement) = ($cmp)(a.val, b.val)
        ($cmp)(a::Measurement, b::Rational) = ($cmp)(a.val, b)
        ($cmp)(a::Measurement, b::Real) = ($cmp)(a.val, b)
        ($cmp)(a::Rational, b::Measurement) = ($cmp)(a, b.val)
        ($cmp)(a::Real, b::Measurement) = ($cmp)(a, b.val)
    end
end

for f in (:isnan, :isfinite, :isinf, :isinteger, :iszero)
    @eval ($f)(a::Measurement) = ($f)(a.val)
end
