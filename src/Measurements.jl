# This file is a part of Measurements.jl.  License is MIT "Expat".
# Copyright (C) 2016 Mosè Giordano.

module Measurements

# Function(s) to handle new type
import Base: show
# Comparison operators
import Base: ==, isless
# Mathematical operations to be redefined
import Base: +, -, *, /, inv, ^, exp2, cos, sin, deg2rad, rad2deg, cosd, sind,
             exp, expm1, log, log10, log1p, hypot, sqrt, cbrt, zero

export Measurement, Constant

# Useful constants
const logten = log(10)
const logtwo = log(2)

# Define the new type
type Measurement
    val
    err
end
# Constructors
Constant(value) = Measurement(value, zero(value))
Measurement(value) = Constant(value)

# Type representation
function show(io::IO, measure::Measurement)
    print(io, measure.val, " ± ", measure.err)
end

##### Comparison Operators
# Rationale: if "a" and "b" are two different measures they are different, even
# if they have the same value and uncertainty.  With this position we have:
#   x = Measurement(5, 1)
#   y = Measurement(5, 1)
#   x == x
#   x != y
# Instead, if you assign the value of "x" to another variable "z", they're the
# same measure, so they are really equal:
#   z = x
#   z == x
==(a::Measurement, b::Measurement) = ===(a, b)

isless(a::Measurement, b::Measurement) = isless(a.val, b.val)

##### Mathematical Operations
# Addition: +
+(a::Measurement) = a
+(a::Measurement, b::Measurement) =
    Measurement(promote(a.val + b.val, hypot(a.err, b.err))...)
+(a, b::Measurement) = +(Constant(a), b)
+(a::Measurement, b) = +(a, Constant(b))

# Subtraction: -
-(a::Measurement) = Measurement(-a.val, a.err)
-(a::Measurement, b::Measurement) = a + (-b)
-(a, b::Measurement) = -(Constant(a), b)
-(a::Measurement, b) = -(a, Constant(b))

# Multiplication: *
function *(a::Measurement, b::Measurement)
    prod = a.val*b.val
    return Measurement(promote(prod, abs(prod)*hypot(a.err*inv(a.val),
                                                     b.err*inv(b.val)))...)
end
*(a, b::Measurement) = *(Constant(a), b)
*(a::Measurement, b) = *(a, Constant(b))

# Division: /
function /(a::Measurement, b::Measurement)
    div = a.val*inv(b.val)
    return Measurement(promote(div, abs(div)*(hypot(a.err*inv(a.val),
                                                    b.err*inv(b.val))))...)
end
/(a, b::Measurement) = /(Constant(a), b)
/(a::Measurement, b) = /(a, Constant(b))

# Inverse: inv
function inv(a::Measurement)
    inverse = inv(a.val)
    return Measurement(promote(inverse, inverse*inverse*a.err)...)
end

# Power: ^
function ^(a::Measurement, b::Measurement)
    if b.val == -1
        return inv(a)
    else
        pow = a.val^b.val
        return Measurement(promote(pow, hypot(pow*inv(a.val)*b.val*a.err,
                                              pow*log(a.val)*b.err))...)
    end
end
^{T<:Integer}(a::Measurement, b::T) = ^(a, Constant(b))
^{T<:Number}(a::Measurement,  b::T) = ^(a, Constant(b))
^{T<:Integer}(a::T, b::Measurement) = ^(Constant(a), b)
^{T<:Number}(a::T,  b::Measurement) = ^(Constant(a), b)
^(a::Irrational, b::Measurement) = Constant(float(a))^b
^(::Irrational{:e}, b::Measurement) = exp(b)

function exp2(a::Measurement)
    pow = exp2(a.val)
    return Measurement(promote(pow, abs(pow*logtwo*a.err))...)
end

# deg2rad and rad2deg
rad2deg(z::Measurement) = z*(180.0/pi)
deg2rad(z::Measurement) = z*(pi/180.0)

# Cosine: cos
function cos(a::Measurement)
    return Measurement(promote(cos(a.val), abs(sin(a.val)*a.err))...)
end
cosd(a::Measurement) = cos(deg2rad(a))

# Sine: sin
function sin(a::Measurement)
    return Measurement(promote(sin(a.val),
                               abs(cos(a.val)*a.err))...)
end
sind(a::Measurement) = sin(deg2rad(a))

# Exponentials: exp, expm1
function exp(a::Measurement)
    val = exp(a.val)
    return Measurement(promote(val, abs(val*a.err))...)
end

expm1(a::Measurement) =
    Measurement(promote(expm1(a.val), abs(exp(a.val)*a.err))...)

# Logarithm: log
function log(a::Measurement, b::Measurement)
    val = log(a.val, b.val)
    loga = log(a.val)
    logb = val*loga # This should avoid some calculations
    return Measurement(promote(val, hypot(a.err*val*inv(a.val*loga),
                                          b.err*inv(loga*b.val)))...)
end
log(a::Measurement) = # Special case
    Measurement(promote(log(a.val), a.err*inv(a.val))...)
log10(a::Measurement) = # Special case
    Measurement(promote(log10(a.val), a.err*inv(logten*a.val))...)
log1p(a::Measurement) = # Special case
    Measurement(promote(log1p(a.val), a.err*inv(a.val + one(a.val)))...)
log(::Irrational{:e}, a::Measurement) = log(a)
log(a, b::Measurement) = log(Constant(a), b)
log(a::Irrational, b::Measurement) = log(float(a), b)
log(a::Measurement, b) = log(a, Constant(b))

# Hypotenuse: hypot
function hypot(a::Measurement, b::Measurement)
    val = hypot(a.val, b.val)
    return Measurement(promote(val, abs(hypot(a.val*a.err,
                                              b.val*b.err)*inv(val)))...)
end
hypot(a, b::Measurement) = hypot(Constant(a), b)
hypot(a::Measurement, b) = hypot(a, Constant(b))

# Square root: sqrt
function sqrt(a::Measurement)
    val = sqrt(a.val)
    return Measurement(promote(val, 0.5*a.err*inv(val))...)
end

# Cube root: cbrt
function cbrt(a::Measurement)
    val = cbrt(a.val)
    return Measurement(promote(val, a.err*val*inv(3.0*a.val))...)
end

# Zero: zero
zero(a::Measurement) = Measurement(promote(zero(a.val), zero(a.err))...)

end # module
