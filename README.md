# Measurements

[![Build Status](https://travis-ci.org/giordano/Measurements.jl.svg?branch=master)](https://travis-ci.org/giordano/Measurements.jl) [![Appveyor Build Status on Windows](https://ci.appveyor.com/api/projects/status/u8mg5dlhyb1vjcpe?svg=true)](https://ci.appveyor.com/project/giordano/measurements-jl) [![Coverage Status](https://coveralls.io/repos/github/giordano/Measurements.jl/badge.svg?branch=master)](https://coveralls.io/github/giordano/Measurements.jl?branch=master) [![codecov.io](https://codecov.io/github/giordano/Measurements.jl/coverage.svg?branch=master)](https://codecov.io/github/giordano/Measurements.jl?branch=master) [![Measurements](http://pkg.julialang.org/badges/Measurements_0.4.svg)](http://pkg.julialang.org/?pkg=Measurements) [![Measurements](http://pkg.julialang.org/badges/Measurements_0.5.svg)](http://pkg.julialang.org/?pkg=Measurements)

Introduction
------------

This package allows you to perform calculations involving numbers with
uncertainties and easily get the uncertainty according to
[linear error propagation theory](https://en.wikipedia.org/wiki/Propagation_of_uncertainty).

### Features List ###

* Support for most of basic mathematical operations available in Julia involving
  real numbers with uncertainties.  All existing functions that accept
  `AbstractFloat` arguments and internally use already supported Julia functions
  can in turn perform calculations involving numbers with uncertainties without
  being redefined.  This greatly expands the power of `Measurements.jl` with no
  to little overhead for the users
* Support for
  [arbitrary precision](http://docs.julialang.org/en/stable/manual/integers-and-floating-point-numbers/#arbitrary-precision-arithmetic)
  numbers with uncertainties (though it may not be very useful for quantities
  that are intrinsically imprecise)
* Limited support for complex numbers with uncertainties
* Functions to calculate
  [standard score](https://en.wikipedia.org/wiki/Standard_score) and
  [weighted mean](https://en.wikipedia.org/wiki/Weighted_arithmetic_mean)
* Easy way to attach the uncertainty to a number using `±` sign

Further features are expected to come in the future, see the section "How Can I
Help?" and the TODO list below.

Installation
------------

`Measurements.jl` is available for Julia 0.4 and later versions, and can be
installed with
[Julia built-in package manager](http://docs.julialang.org/en/stable/manual/packages/).
In a Julia session run the command

```julia
julia> Pkg.add("Measurements")
```

You may need to update your package list with `Pkg.update()` in order to get the
latest version of `Measurements.jl`.

Usage
-----

After installing the package, you can start using it with

```julia
using Measurements
```

The module defines a new `Measurement` data type.  `Measurement` objects can be
defined with either one of the two following constructors:

``` julia
Measurement(value, uncertainty)
value ± uncertainty
```

where `value` and `uncertainty` are both subtype of `AbstractFloat`.  Some
keyboard layouts provide an easy way to type the `±` sign, if your does not,
remember you can insert it in Julia REPL with `\pm` followed by `TAB` key.  You
can provide `value` and `uncertainty` of any subtype of `Real` that can be
converted to `AbstractFloat`.  Thus, `Measurement(42, 33//12)` is a valid
syntax.

`Measurement(value)` creates a `Measurement` object that doesn’t have
uncertainty, like mathematical constants.  See below for further examples.

For those interested in the technical details of the package, `Measurement` is a
[composite](http://docs.julialang.org/en/stable/manual/types/#composite-types)
[parametric](http://docs.julialang.org/en/stable/manual/types/#man-parametric-types)
type, whose definition is:

``` julia
immutable Measurement{T<:AbstractFloat} <: AbstractFloat
    val::T # The value
    err::T # The uncertainty, assumed to be standard deviation
end
```

Users that want to hack into `Measurements.jl` should use objects with type that
is a subtype of `AbstractFloat`.

Many basic mathematical operations are instructed to accept `Measurement` type
and uncertainty is calculated exactly using analityc expressions of function
derivatives.  In addition, being `Measurement` a subtype of `AbstractFloat`,
`Measurement` objects can be used in any function taking `AbstractFloat`
arguments without redefining it, and calculation of uncertainty will be exact.

**NOTE 1:** This package currently doesn’t take into account correlation between
operands when calculating uncertainties (see TODO list below), so operations
like `x+x`,`x*x`, `sin(x)/cos(x)` will have inaccurate uncertainties.  Use
expressions not involving correlated variables when possible (e.g., `2x` in
place of `x+x`, `x^2` for `x*x`, and `tan(x)` instead of `sin(x)/cos(x)`).

**NOTE 2:** Currently this package fully supports real-only measurements.  It is
possible to create a `Complex` measurement with `complex(Measurement(a, b),
Measurement(c, d))` and error propagation should work for some basic operations
like arithmentic operations, but no active work has been done to further support
complex quantities with attached uncertainty.

**NOTE 3:** Loading the module with `using Measurements` in Julia 0.4 will emit
a harmless warning, you can ignore it.  The warning goes away in Julia 0.5.

### Standard Score ###

The `stdscore` function is available to calculate the
[standard score](https://en.wikipedia.org/wiki/Standard_score) between a
measurement and its expected value.

### Weighted Average ###

`weightedmean` function gives the
[weighted mean](https://en.wikipedia.org/wiki/Weighted_arithmetic_mean) of a set
of measurements using
[inverses of variance as weights](https://en.wikipedia.org/wiki/Inverse-variance_weighting).
Use `mean` for the simple arithmetic mean.

Examples
--------

``` julia
using Measurements
a = Measurement(4.5, 0.1)
# => 4.5 ± 0.1
b = 3.8 ± 0.4
# => 3.8 ± 0.4
2a + b
# => 12.8 ± 0.4472135954999579
a - 1.2b
# => -0.05999999999999961 ± 0.49030602688525043
l = Measurement(0.936, 1e-3);
T = Measurement(1.942, 4e-3);
P = 4pi^2*l/T^2
# => 9.797993213510699 ± 0.041697817535336676
c = Measurement(4)
# => 4.0 ± 0.0
a*c
# => 18.0 ± 0.4
sind(Measurement(94, 1.2))
# => 0.9975640502598242 ± 0.0014609761696991563
x = 5.48 ± 0.67
# => 5.48 ± 0.67
y = Measurement(9.36, 1.02)
# => 9.36 ± 1.02
log(2x^2 - 3.4y)
# =>  3.3406260917568824 ± 0.5344198747546611
atan2(y, x)
# => 1.0411291003154137 ± 0.07141014208254456
```

You can get the distance in number of standard deviations between a measurement
and its expected value (this can be with or without uncertainty) using
`stdscore`:

``` julia
stdscore(1.3 ± 0.12, 1)
# => 2.5000000000000004
stdscore(4.7 ± 0.58, 5 ± 0.01)
# => -0.5172413793103445 ± 0.017241379310344827
```

Calculate the weighted and arithmetic means of your set of measurements with
`weightedmean` and `mean` respectively:

``` julia
weightedmean((3.1±0.32, 3.2±0.38, 3.5±0.61, 3.8±0.25))
# => 3.4665384454054498 ± 0.16812474090663868
mean((3.1±0.32, 3.2±0.38, 3.5±0.61, 3.8±0.25))
# => 3.4000000000000004 ± 0.2063673908348894
```

The `±` sign is a convenient symbol to define quantity with uncertainty, but can
lead to unexpected results if used in elaborate expressions involving many `±`
signs.  Use parantheses where appropriate to avoid confusion, for example see
the following cases:

``` julia
7.5±1.2 + 3.9±0.9 # This is wrong!
# => 11.4 ± 1.2 ± 0.9 ± 0.0
(7.5±1.2) + (3.9±0.9) # This is correct
# => 11.4 ± 1.5
```

How Can I Help?
---------------

Have a look at the TODO list below and the bug list at
https://github.com/giordano/Measurements.jl/issues, feel free to implement those
features and send a pull request.  In addition, you can instruct more
mathematical functions to accept `Measurement` type arguments.  Bug reports and
wishlists are welcome as well.

TODO
----

* Add pretty printing: optionally print only the relevant significant digits
  ([issue #5](https://github.com/giordano/Measurements.jl/issues/5))
* Add support for correlation, so that `x-x == zero(x)`, `x*x == x^2`, `tan(x)
  == sin(x)/cos(x)`,
  etc... ([issue #3](https://github.com/giordano/Measurements.jl/issues/3))
* Extend to generic functions, also those not taking `Measurement` type
  arguments.  This should be possible with a macro like `@macroname function(4.3
  ± 0.4)`.  This calculates the value of `function(4.3)` and the approximated
  uncertainty using numerical derivatives or so, and finally construct the
  `Measurement` object `function(4.3) ± uncertainty`
  ([issue #4](https://github.com/giordano/Measurements.jl/issues/4))
* Support error propagation for complex measurements
* Other suggestions welcome `:-)`

License
-------

The `Measurements.jl` package is licensed under the MIT "Expat" License.  The
original author is Mosè Giordano.
