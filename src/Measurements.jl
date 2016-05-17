# This file is a part of Measurements.jl.  License is MIT "Expat".
# Copyright (C) 2016 Mosè Giordano.

module Measurements

# Function(s) to handle new type
import Base: show
# Comparison operators
import Base: ==, isless
# Mathematical operations to be redefined
import Base: +, -, *, /, inv, ^, cos, sin, deg2rad, rad2deg, cosd, sind, exp,
             log, log10, log1p, hypot, sqrt, zero

export Measurement, Constant

# Useful constants
const logten = log(10)

# Define the new type
type Measurement
    value
    err
end
# Constructors
Constant(value) = Measurement(value, zero(value))
Measurement(value) = Constant(value)

# Type representation
function show(io::IO, measure::Measurement)
    print(io, measure.value, " ± ", measure.err)
end

##### Comparison Operators
==(a::Measurement, b::Measurement) = (a.value == b.value && a.err == b.err)

isless(a::Measurement, b::Measurement) = isless(a.value, b.value)

##### Mathematical Operations
# Addition: +
+(a::Measurement) = a
+(a::Measurement, b::Measurement) =
    Measurement(promote(a.value + b.value, hypot(a.err, b.err))...)
+(a, b::Measurement) = +(Constant(a), b)
+(a::Measurement, b) = +(a, Constant(b))

# Subtraction: -
-(a::Measurement) = Measurement(-a.value, a.err)
-(a::Measurement, b::Measurement) = a + (-b)
-(a, b::Measurement) = -(Constant(a), b)
-(a::Measurement, b) = -(a, Constant(b))

# Multiplication: *
function *(a::Measurement, b::Measurement)
    prod = a.value*b.value
    return Measurement(promote(prod, abs(prod)*hypot(a.err*inv(a.value),
                                                     b.err*inv(b.value)))...)
end
*(a, b::Measurement) = *(Constant(a), b)
*(a::Measurement, b) = *(a, Constant(b))

# Division: /
function /(a::Measurement, b::Measurement)
    div = a.value*inv(b.value)
    return Measurement(promote(div, abs(div)*(hypot(a.err*inv(a.value),
                                                    b.err*inv(b.value))))...)
end
/(a, b::Measurement) = /(Constant(a), b)
/(a::Measurement, b) = /(a, Constant(b))

# Inverse: inv
function inv(a::Measurement)
    inverse = inv(a.value)
    return Measurement(promote(inverse, inverse*inverse*a.err)...)
end

# Power: ^
function ^(a::Measurement, b::Measurement)
    if b.value == -1
        return inv(a)
    else
        pow = a.value^b.value
        return Measurement(promote(pow, hypot(pow*inv(a.value)*b.value*a.err,
                                              pow*log(a.value)*b.err))...)
    end
end
^{T<:Integer}(a::Measurement, b::T) = ^(a, Constant(b))
^{T<:Number}(a::Measurement,  b::T) = ^(a, Constant(b))
^{T<:Integer}(a::T, b::Measurement) = ^(Constant(a), b)
^{T<:Number}(a::T,  b::Measurement) = ^(Constant(a), b)
^(a::Irrational, b::Measurement) = Constant(float(a))^b
^(::Irrational{:e}, b::Measurement) = exp(b)

# deg2rad and rad2deg
rad2deg(z::Measurement) = z*(180.0/pi)
deg2rad(z::Measurement) = z*(pi/180.0)

# Cosine: cos
function cos(a::Measurement)
    return Measurement(promote(cos(a.value), abs(sin(a.value)*a.err))...)
end
cosd(a::Measurement) = cos(deg2rad(a))

# Sine: sin
function sin(a::Measurement)
    return Measurement(promote(sin(a.value),
                               abs(cos(a.value)*a.err))...)
end
sind(a::Measurement) = sin(deg2rad(a))

# Exponential: exp
function exp(a::Measurement)
    val = exp(a.value)
    return Measurement(promote(val, abs(val*a.err))...)
end

# Logarithm: log
function log(a::Measurement, b::Measurement)
    val = log(a.value, b.value)
    loga = log(a.value)
    logb = val*loga # This should avoid some calculations
    return Measurement(promote(val, hypot(a.err*val*inv(a.value*loga),
                                          b.err*inv(loga*b.value)))...)
end
log(a::Measurement) = # Special case
    Measurement(promote(log(a.value), a.err*inv(a.value))...)
log10(a::Measurement) = # Special case
    Measurement(promote(log10(a.value), a.err*inv(logten*a.value))...)
log1p(a::Measurement) = # Special case
    Measurement(promote(log1p(a.value), a.err*inv(a.value + one(a.value)))...)
log(::Irrational{:e}, a::Measurement) = log(a)
log(a, b::Measurement) = log(Constant(a), b)
log(a::Irrational, b::Measurement) = log(float(a), b)
log(a::Measurement, b) = log(a, Constant(b))


# Hypotenuse: hypot
function hypot(a::Measurement, b::Measurement)
    val = hypot(a.value, b.value)
    return Measurement(promote(val, abs(hypot(a.value*a.err,
                                              b.value*b.err)*inv(val)))...)
end
hypot(a, b::Measurement) = hypot(Constant(a), b)
hypot(a::Measurement, b) = hypot(a, Constant(b))

# Square root: sqrt
function sqrt(a::Measurement)
    val = sqrt(a.value)
    return Measurement(promote(val, 0.5*a.err*inv(val))...)
end

# Zero: zero
zero(a::Measurement) = Measurement(promote(zero(a.value), zero(a.err))...)

end # module
