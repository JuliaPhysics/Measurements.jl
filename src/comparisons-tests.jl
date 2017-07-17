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

# Two measurements are equal if they have same value and same uncertainty.
# NB: Two measurements are egal (===) if they are exactly the same thing,
# i.e. if they share all the same fields, including the (hopefully) unique tag.
# If you need stricter equality use "===" instead of "==".
Base.:(==)(a::Measurement, b::Measurement) = (a.val==b.val && a.err==b.err)

Base.:(==)(a::Measurement, b::Irrational) = false
Base.:(==)(a::Measurement, b::Rational) = (a.val==b && iszero(a.err))
Base.:(==)(a::Measurement, b::Real) = (a.val==b && iszero(a.err))
Base.:(==)(a::Irrational, b::Measurement) = false
Base.:(==)(a::Rational, b::Measurement) = (a==b.val && iszero(b.err))
Base.:(==)(a::Real, b::Measurement) = (a==b.val && iszero(b.err))

# Order relation is based on the value of measurements, uncertainties are ignored
for cmp in (:<, :<=)
    @eval begin
        Base.$cmp(a::Measurement, b::Measurement) = ($cmp)(a.val, b.val)
        Base.$cmp(a::Measurement, b::Rational) = ($cmp)(a.val, b)
        Base.$cmp(a::Measurement, b::Real) = ($cmp)(a.val, b)
        Base.$cmp(a::Rational, b::Measurement) = ($cmp)(a, b.val)
        Base.$cmp(a::Real, b::Measurement) = ($cmp)(a, b.val)
    end
end

for f in (:isnan, :isfinite, :isinf)
    @eval Base.$f(a::Measurement) = ($f)(a.val)
end
# "isinteger" should check the number is exactly an integer, without uncertainty.
Base.isinteger(a::Measurement) = isinteger(a.val) && iszero(a.err)
# "iszero" is supposed to check the number is the additive identity element, so we must
# check also the uncertainty is zero.
Base.iszero(a::Measurement) = iszero(a.val) && iszero(a.err)
