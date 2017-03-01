### Measurements.jl ---  Uncertainty propagation library
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
# This file is the entry point of the package: it defines the new `Measurement'
# type, some functions to handle it within Julia and the new functions provided
# by the package and exposed to users.
#
### Code:

__precompile__()

module Measurements

# This is used to calculate numerical derivatives in "@uncertain" macro.
using Calculus, SpecialFunctions

# Function to handle new type
import Base: alignment, show

# Functions provided by this package and exposed to users
export Measurement, measurement, ±

# Define the "Derivatives" type, used inside "Measurement" type.  This should be
# a lightweight and immutable dictionary.
include("derivatives-type.jl")

##### New Type: Measurement
# Definition.  The Measurement type is composed by the following fields:
#   * val: the nominal value of the measurement
#   * err: the uncertainty, assumed to be standard deviation
#   * tag: a (hopefully) unique identifier, it is used to identify a specific
#     measurement in the list of derivatives.  This is usually created with
#     `rand'.  NOTE: only independent measurements have a finite tag.  For
#     dependent quantities the tag is NaN.
#   * der: the list of derivates.  It is a lightweight dictionary, whose keys
#     are the tuples (nominal value, uncertainty, tag) of all independent
#     variables from which the object has been derived, the corresponding value
#     is the partial derivative of the object with respect to that independent
#     variable.  This dictionary is useful to trace the contribution of each
#     measurement and propagate the uncertainty in the case of functions with
#     more than one argument (in order to deal with correlation between
#     arguments).
struct Measurement{T<:AbstractFloat} <: AbstractFloat
    val::T
    err::T
    tag::Float64
    der::Derivatives{Tuple{T, T, Float64}, T}
end

# The constructor that users are going to use.  As a Julia convention, the
# lowercase version of a type constructor does something more than the
# constructor itself.

"""
    measurement(val::Real, [err::Real]) -> Measurement
    val ± err -> Measurement

Return a `Measurement` object with `val` as nominal value and `err` as
uncertainty.  `err` defaults to 0 if omitted.

The binary operator `±` is equivalent to `measurement`, so you can construct a
`Measurement` object by explicitely writing `123 ± 4`.
"""
function measurement(val::Real, err::Real=zero(float(val)))
    val, err, der = promote(float(val), float(err), one(float(val)))
    tag = rand()
    return Measurement(val, err, tag, Derivatives((val, err, tag)=>der))
end
const ± = measurement

# Type representation
show(io::IO, measure::Measurement) =
    print(io, measure.val, get(io, :compact, false) ? "±" : " ± ", measure.err)
for mime in (MIME"text/x-tex", MIME"text/x-latex")
    @eval show(io::IO, ::$mime, measure::Measurement) =
        print(io, measure.val, " \\pm ", measure.err)
end
# Representation of complex measurements.  Print something that is easy to
# understand and that can be meaningfully copy-pasted into the REPL, at least
# for standard numeric types.
function show{T<:Measurement}(io::IO, measure::Complex{T})
    r, i = reim(measure)
    compact = get(io, :compact, false)
    print(io, "(", r, ")")
    if signbit(i) && !isnan(i)
        i = -i
        print(io, compact ? "-" : " - ")
    else
        print(io, compact ? "+" : " + ")
    end
    print(io, "(", i, ")im")
end
# This is adapted from base/show.jl for Complex type.
function alignment(io::IO, measure::Measurement)
    m = match(r"^(.*[\±])(.*)$", sprint(0, show, measure, env=io))
    m === nothing ? (length(sprint(0, show, x, env=io)), 0) :
        (length(m.captures[1]), length(m.captures[2]))
end

include("conversions.jl")
include("comparisons-tests.jl")
include("utils.jl")
include("math.jl")
include("parsing.jl")

end # module
