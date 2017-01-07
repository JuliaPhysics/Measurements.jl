### comparisons-tests.jl
#
# Copyright (C) 2016 Mosè Giordano.
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

import Base: ==, isless, <, <=, isnan, isfinite, isinf, isinteger

# Two measurements are equal if they have same value and same uncertainty.
# NB: Two measurements are egal (===) if they are exactly the same thing,
# i.e. if they share all the same fields, including the (hopefully) unique tag.
# If you need stricter equality use "===" instead of "==".
==(a::Measurement, b::Measurement) = (a.val==b.val && a.err==b.err)

# Comparison with Real: they are equal if the value of Measurement is equal to
# the number.  If you want to treat the Real like a measurement convert it with
# `Measurement'.
==(a::Measurement, b::Irrational) = a.val==float(b)
==(a::Measurement, b::Rational) = a.val==float(b)
==(a::Measurement, b::Real) = a.val==b
==(a::Irrational, b::Measurement) = float(a)==b.val
==(a::Rational, b::Measurement) = float(a)==b.val
==(a::Real, b::Measurement) = a==b.val

# Order relation is based on the value of measurements, uncertainties are ignored
<(a::Measurement, b::Measurement) = <(a.val, b.val)
<=(a::Measurement, b::Measurement) = <=(a.val, b.val)

isnan(a::Measurement) = isnan(a.val)
isfinite(a::Measurement) = isfinite(a.val)
isinf(a::Measurement) = isinf(a.val)
isinteger(a::Measurement) = isinteger(a.val)
