# Measurements

[![Build Status](https://travis-ci.org/giordano/Measurements.jl.svg?branch=master)](https://travis-ci.org/giordano/Measurements.jl) [![Appveyor Build Status on Windows](https://ci.appveyor.com/api/projects/status/u8mg5dlhyb1vjcpe?svg=true)](https://ci.appveyor.com/project/giordano/measurements-jl) [![Coverage Status](https://coveralls.io/repos/github/giordano/Measurements.jl/badge.svg?branch=master)](https://coveralls.io/github/giordano/Measurements.jl?branch=master) [![codecov.io](https://codecov.io/github/giordano/Measurements.jl/coverage.svg?branch=master)](https://codecov.io/github/giordano/Measurements.jl?branch=master) [![Measurements](http://pkg.julialang.org/badges/Measurements_0.4.svg)](http://pkg.julialang.org/?pkg=Measurements) [![Measurements](http://pkg.julialang.org/badges/Measurements_0.5.svg)](http://pkg.julialang.org/?pkg=Measurements)

Introduction
------------

This package allows you to define numbers with uncertainties and perform
calculations involving them easily getting the uncertainty of the result
according to
[linear error propagation theory](https://en.wikipedia.org/wiki/Propagation_of_uncertainty).

### Features List ###

* Support for most of mathematical operations available in Julia involving real
  and complex numbers with uncertainties.  All existing functions that accept
  `AbstractFloat` (and `Complex{AbstractFloat}`) arguments and internally use
  already supported functions can in turn perform calculations involving numbers
  with uncertainties without being redefined.  This greatly expands the power of
  `Measurements.jl` without effort for the users
* Support for correlation between variables, so `x-x == zero(x)`, `x*x == x^2`,
  `tan(x) == sin(x)/cos(x)`, etc...
* Support for
  [arbitrary precision](http://docs.julialang.org/en/stable/manual/integers-and-floating-point-numbers/#arbitrary-precision-arithmetic)
  numbers with uncertainties (though this may not be very useful for quantities
  that are intrinsically imprecise)
* Propagate uncertainty for any real function of one real argument (even
  functions based on
  [C/Fortran calls](http://docs.julialang.org/en/stable/manual/calling-c-and-fortran-code/)),
  using `@uncertain`
  [macro](http://docs.julialang.org/en/stable/manual/metaprogramming/)
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
type, whose parameter is the `AbstractFloat` subtype of the nominal value and
the uncertainty of the measurement.  `Measurement` type itself is subtype of
`AbstractFloat`, this users that want to hack into `Measurements.jl` should use
objects with type that is a subtype of `AbstractFloat`.

Most basic mathematical operations are instructed, by
[operator overloading](https://en.wikipedia.org/wiki/Operator_overloading), to
accept `Measurement` type and uncertainty is calculated exactly using analityc
expressions of function derivatives.  In addition, being `Measurement` a subtype
of `AbstractFloat`, `Measurement` objects can be used in any function taking
`AbstractFloat` arguments without redefining it, and calculation of uncertainty
will be exact.

In addition, it is possible to create a `Complex` measurement with
`complex(Measurement(a, b), Measurement(c, d))`.

### Correlation Between Variables ###

This package is able to handle correlation between variables, this means that
uncertainty is correctly propagated also for functions taking two or more
arguments that are correlated (one is derived from the other or both arguments
are derived from a set of common independent variables).  As a result, `x - x ==
zero(x)` and `x/x == one(x)`.  Instead, two measurements that come from truly
different measurements and share the same nominal value and uncertainty only by
chance are not treated as correlated.

### Propagate Uncertainty for Arbitrary Functions ###

The package provides a new `@uncertain` macro that further extends the power of
this package.  It allows you to propagate uncertainty in arbitrary real
functions, including those based on C/Fortran calls, that accept one real
argument.  The macro exploits `derivative` function from
[`Calculus`](https://github.com/johnmyleswhite/Calculus.jl) package in order to
perform numerical differentiation.

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

### Correlation Between Variables ###

Here you can see examples of how correlated variables are treated within the
package:

``` julia
x = 8.4 ± 0.7
x - x
# => 0.0 ± 0.0
x/x
# => 1.0 ± 0.0
x*x*x - x^3
# => 0.0 ± 0.0
sin(x)/cos(x) - tan(x)
# => -2.220446049250313e-16 ± 0.0 # They are equal within numerical accuracy
```

You will get similar results for a variable that is a function of an already
existing `Measurement` object:

``` julia
u = 2x
(x + x) - u
# => 0.0 ± 0.0
u/2x
# => 1.0 ± 0.0
u^3 - 8x^3
# => 0.0 ± 0.0
cos(x)^2 - (1 + cos(u))/2
# => 0.0 ± 0.0
```

Two uncorrelated measurements will give completely different outcomes:

``` julia
# Define a new measurement but with same nominal value and uncertainty as u, so
# v is not correlated with x
v = 16.8 ± 1.4
(x + x) - v
# => 0.0 ± 1.979898987322333
v/2x
# => 1.0 ± 0.11785113019775792
v^3 - 8x^3
# => 0.0 ± 1676.4200705455657
cos(x)^2 - (1 + cos(v))/2
# => 0.0 ± 0.8786465354843539
```

### `@uncertain` Macro ###

Macro `@uncertain` can be used to propagate uncertainty in an arbitrary real
function of a real argument, even in functions not natively supported by this
package.

``` julia
@uncertain zeta(2 ± 0.13)
# => 1.6449340668482273 ± 0.12188127308075564
```

The macro works with functions calling C/Fortran functions as well.  Consider
the following example:

``` julia
# Define a Julia function
f(x) = -x*x
# Define a C pointer to "f" function, just to show that "@uncertain" works
# with "ccall"
ptr = cfunction(f, Cdouble, (Cdouble,))
# Define a new function that uses a "ccall".  In the end, this involute g(x)
# function computes exp(-x^2)
g(x) = exp(ccall(ptr, Cdouble, (Cdouble,), x))
# Compare result of using "@uncertain" macro with directly calculating exp(-x^2)
x = 0.97 ± 0.023
@uncertain g(x)
# => 0.3902764284635212 ± 0.017414134237825774
exp(-x^2)
# => 0.3902764284635212 ± 0.017414134238042316
```

### Complex Measurements ###

Here are a few examples about uncertainty propagation of complex-valued
measurements.

``` julia
u = complex(32.7 ± 1.1, -3.1 ± 0.2)
v = complex(7.6 ± 0.9, 53.2 ± 3.4)
2u+v
# => (73.0 ± 2.3769728648009427) + (47.0 ± 3.4234485537247377)*im
sqrt(u*v)
# => (33.004702573592 ± 1.0831254428098636) + (25.997507418428984 ± 1.1082833691607152)*im
gamma(u/v)
# => (-0.25050193836584694 ± 0.011473098558745594) + (1.2079738483289788 ± 0.133606565257322)*im
```

You can also verify the
[Euler’s formula](https://en.wikipedia.org/wiki/Euler%27s_formula)

``` julia
exp(im*u)
# => (6.27781144696534 ± 23.454542573739754) + (21.291738410228678 ± 8.112997844397572)*im
cos(u) + sin(u)*im
# => (6.277811446965339 ± 23.454542573739754) + (21.291738410228678 ± 8.112997844397572)im
```

### `stdscore` Function ###

You can get the distance in number of standard deviations between a measurement
and its expected value (this can be with or without uncertainty) using
`stdscore`:

``` julia
stdscore(1.3 ± 0.12, 1)
# => 2.5000000000000004
stdscore(4.7 ± 0.58, 5 ± 0.01)
# => -0.5172413793103445 ± 0.017241379310344827
```

### `weightedmean` Function ###

Calculate the weighted and arithmetic means of your set of measurements with
`weightedmean` and `mean` respectively:

``` julia
weightedmean((3.1±0.32, 3.2±0.38, 3.5±0.61, 3.8±0.25))
# => 3.4665384454054498 ± 0.16812474090663868
mean((3.1±0.32, 3.2±0.38, 3.5±0.61, 3.8±0.25))
# => 3.4000000000000004 ± 0.2063673908348894
```

### Caveat about `±` Sign ###

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
* Other suggestions welcome `:-)`

License
-------

The `Measurements.jl` package is licensed under the MIT "Expat" License.  The
original author is Mosè Giordano.
