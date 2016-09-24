# Measurements.jl

| **Documentation**                       | [**Package Evaluator**][pkgeval-link] | **Build Status**                          | **Code Coverage**               |
|:---------------------------------------:|:-------------------------------------:|:-----------------------------------------:|:-------------------------------:|
| [![][docs-stable-img]][docs-stable-url] | [![][pkg-0.4-img]][pkg-0.4-url]       | [![Build Status][travis-img]][travis-url] | [![][coveral-img]][coveral-url] |
| [![][docs-latest-img]][docs-latest-url] | [![][pkg-0.5-img]][pkg-0.5-url]       | [![Build Status][appvey-img]][appvey-url] | [![][codecov-img]][codecov-url] |
|                                         | [![][pkg-0.6-img]][pkg-0.6-url]       |                                           |                                 |

Introduction
------------

`Measurements.jl` is a package that allows you to define numbers with
[uncertainties](https://en.wikipedia.org/wiki/Measurement_uncertainty), perform
calculations involving them, and easily get the uncertainty of the result
according to
[linear error propagation theory](https://en.wikipedia.org/wiki/Propagation_of_uncertainty).
This library is written in [Julia](http://julialang.org/), a modern high-level,
high-performance dynamic programming language designed for technical computing.

### Features List ###

* Support for most mathematical operations available in Julia standard library
  involving real and complex numbers.  All existing functions that accept
  `AbstractFloat` (and `Complex{AbstractFloat}`) arguments and internally use
  already supported functions can in turn perform calculations involving numbers
  with uncertainties without being redefined.  This greatly enhances the power
  of `Measurements.jl` without effort for the users
* Functional correlation between variables is correctly handled, so `x-x ≈
  zero(x)`, `x/x ≈ one(x)`, `tan(x) ≈ sin(x)/cos(x)`, `cis(x) ≈ exp(im*x)`,
  etc...
* Support for
  [arbitrary precision](http://docs.julialang.org/en/stable/manual/integers-and-floating-point-numbers/#arbitrary-precision-arithmetic)
  (also called multiple precision) numbers with uncertainties.  This is useful
  for measurements with very low relative error
* Define arrays of measurements and perform calculations with them
* Propagate uncertainty for any function of real arguments (including functions
  based on
  [C/Fortran calls](http://docs.julialang.org/en/stable/manual/calling-c-and-fortran-code/)),
  using `@uncertain`
  [macro](http://docs.julialang.org/en/stable/manual/metaprogramming/)
* Functions to get the derivative and the gradient of an expression with respect
  to one or more independent measurements
* Functions to calculate
  [standard score](https://en.wikipedia.org/wiki/Standard_score) and
  [weighted mean](https://en.wikipedia.org/wiki/Weighted_arithmetic_mean)
* Easy way to attach the uncertainty to a number using the `±` sign as infix
  operator
* Combined with external packages allows for error propagation of measurements
  with their physical units

Further features are expected to come in the future, see the section "How Can I
Help?" and the TODO list below.

### Documentation ###

The complete manual of `Measurements.jl` is available at
http://measurementsjl.readthedocs.io.  There, people interested in the details
of the package, in order integrate the package in their workflow, can can find a
technical appendix explaining how the package internally works.  You can also
download the PDF version of the manual from
https://media.readthedocs.org/pdf/measurementsjl/latest/measurementsjl.pdf.

Installation
------------

`Measurements.jl` is available for Julia 0.4 and later versions, and can be
installed with
[Julia built-in package manager](http://docs.julialang.org/en/stable/manual/packages/).
In a Julia session run the commands

```julia
julia> Pkg.update()
julia> Pkg.add("Measurements")
```

Usage
-----

After installing the package, you can start using it with

```julia
using Measurements
```

The module defines a new `Measurement` data type.  `Measurement` objects can be
created with the two following constructors:

``` julia
measurement(value, uncertainty)
value ± uncertainty
```

where

* `value` is the nominal value of the measurement
* `uncertainty` is its uncertainty, assumed to be a
  [standard deviation](https://en.wikipedia.org/wiki/Standard_deviation).

They are both subtype of `AbstractFloat`.  Some keyboard layouts provide an easy
way to type the `±` sign, if your does not, remember you can insert it in Julia
REPL with `\pm` followed by `TAB` key.  You can provide `value` and
`uncertainty` of any subtype of `Real` that can be converted to `AbstractFloat`.
Thus, `measurement(42, 33//12)` and `pi ± 0.1` are valid.

`measurement(value)` creates a `Measurement` object with zero uncertainty, like
mathematical constants.  See below for further examples.

Every time you use one of the constructors above, you define a *new independent*
measurement.  Instead, when you perform mathematical operations involving
`Measurement` objects you create a quantity that is not independent, but rather
depends on really independent measurements.

Most mathematical operations are instructed, by
[operator overloading](https://en.wikipedia.org/wiki/Operator_overloading), to
accept `Measurement` type, and uncertainty is calculated exactly using analityc
expressions of functions’ derivatives.

In addition, it is possible to create a `Complex` measurement with
`complex(measurement(a, b), measurement(c, d))`.

### Caveat about `±` Sign ###

The `±` infix operator is a convenient symbol to define quantities with
uncertainty, but can lead to unexpected results if used in elaborate expressions
involving many `±`s.  Use parantheses where appropriate to avoid confusion.  See
for example the following cases:

``` julia
7.5±1.2 + 3.9±0.9 # This is wrong!
# => 11.4 ± 1.2 ± 0.9 ± 0.0
(7.5±1.2) + (3.9±0.9) # This is correct
# => 11.4 ± 1.5
```

Examples
--------

``` julia
using Measurements
a = measurement(4.5, 0.1)
# => 4.5 ± 0.1
b = 3.8 ± 0.4
# => 3.8 ± 0.4
2a + b
# => 12.8 ± 0.4472135954999579
a - 1.2b
# => -0.05999999999999961 ± 0.49030602688525043
l = measurement(0.936, 1e-3);
T = 1.942 ± 4e-3;
P = 4pi^2*l/T^2
# => 9.797993213510699 ± 0.041697817535336676
c = measurement(4)
# => 4.0 ± 0.0
a*c
# => 18.0 ± 0.4
sind(94 ± 1.2)
# => 0.9975640502598242 ± 0.0014609761696991563
x = 5.48 ± 0.67;
y = 9.36 ± 1.02;
log(2x^2 - 3.4y)
# =>  3.3406260917568824 ± 0.5344198747546611
atan2(y, x)
# => 1.0411291003154137 ± 0.07141014208254456
```

### Correlation Between Variables ###

Here you can see examples of how functionally correlated variables are treated
within the package:

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

### `@uncertain` Macro ###

Macro `@uncertain` can be used to propagate uncertainty in arbitrary real- or
complex-valued functions of any number of real arguments, even in functions not
natively supported by this package.

``` julia
@uncertain zeta(2 ± 0.13)
# => 1.6449340668482273 ± 0.12188127308075564
@uncertain log(9.4 ± 1.3, 58.8 ± 3.7)
# => 1.8182372640255153 ± 0.11568300475873611
log(9.4 ± 1.3, 58.8 ± 3.7)
# => 1.8182372640255153 ± 0.11568300475593848
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

### Arrays of Measurements ###

You can create arrays of `Measurement` objects and perform mathematical
operations on them:

``` julia
A = [1.03 ± 0.14, 2.88 ± 0.35, 5.46 ± 0.97]
log(A)
# => 3-element Array{Measurements.Measurement{Float64},1}:
#     0.02955880224154443 ± 0.1359223300970874
#     1.0577902941478545 ± 0.12152777777777776
#     1.6974487897568138 ± 0.17765567765567764
cos(A).^2 + sin(A).^2
# 3-element Array{Measurements.Measurement{Float64},1}:
#     1.0 ± 0.0
#     1.0 ± 0.0
#     1.0 ± 0.0
B = measurement([174.9, 253.8, 626.1], [12.2, 19.4, 38.5])
# => 3-element Array{Measurements.Measurement{Float64},1}:
#     174.9 ± 12.2
#     253.8 ± 19.4
#     626.1 ± 38.5
sum(B)
# => 1054.8000000000002 ± 44.80457565918909
mean(B)
# => 351.6000000000001 ± 14.93485855306303
```

### Derivative and Gradient ###

The package provides two convenient functions, `Measurements.derivative` and
`Measurements.gradient`, that return the total derivative and the gradient of an
expression with respect to independent measurements.

``` julia
x = 98.1 ± 12.7
y = 105.4 ± 25.6
z = 78.3 ± 14.1
Measurements.derivative(2x - 4y, x)
# => 2.0
Measurements.derivative(2x - 4y, y)
# => -4.0
Measurements.gradient(log1p(x) + y^2 - cos(x/y), [x, y, z])
# => 3-element Array{Float64,1}:
#       0.0177005
#     210.793
#       0.0       # The expression does not depend on z
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

### Use with ``SIUnits.jl`` and ``Unitful.jl`` ###

Used together with third-party packages, ``Measurements.jl`` enables you to
perform calculations involving numbers with both uncertainty and physical unit.
For example, you can use [`SIUnits.jl`](https://github.com/Keno/SIUnits.jl) or
[`Unitful.jl`](https://github.com/ajkeller34/Unitful.jl).

``` julia
using Measurements, SIUnits, SIUnits.ShortUnits
hypot((3 ± 1)*m, (4 ± 2)*m) # Pythagorean theorem
# => 5.0 ± 1.7088007490635064 m
(50 ± 1)Ω * (13 ± 2.4)*1e-2*A # Ohm's Law
# => 6.5 ± 1.20702112657567 kg m²s⁻³A⁻¹
2pi*sqrt((5.4 ± 0.3)*m / ((9.81 ± 0.01)*m/s^2)) # Pendulum's  period
# => 4.661677707464357 ± 0.1295128435999655 s

using Measurements, Unitful
hypot((3 ± 1)*u"m", (4 ± 2)*u"m") # Pythagorean theorem
# => 5.0 ± 1.7088007490635064 m
(50 ± 1)*u"Ω" * (13 ± 2.4)*1e-2*u"A" # Ohm's Law
# => 6.5 ± 1.20702112657567 A Ω
2pi*sqrt((5.4 ± 0.3)*u"m" / ((9.81 ± 0.01)*u"m/s^2")) # Pendulum's period
# => 4.661677707464357 ± 0.12951284359996548 s
```

Development
-----------

The package is developed at https://github.com/giordano/Measurements.jl.  There
you can submit bug reports, make suggestions, and propose pull requests.

### How Can I Help? ###

Have a look at the TODO list below and the bug list at
https://github.com/giordano/Measurements.jl/issues, pick-up a task, write great
code to accomplish it and send a pull request.  In addition, you can instruct
more mathematical functions to accept `Measurement` type arguments.  Please,
read the
[technical appendix](http://measurementsjl.readthedocs.io/en/latest/appendix.html)
of the complete documentation in order to understand the design of this package.
Bug reports and wishlists are welcome as well.

### TODO ###

* Add pretty printing: optionally print only the relevant significant digits
  ([issue #5](https://github.com/giordano/Measurements.jl/issues/5))
* Other suggestions welcome `:-)`

### History ###

The ChangeLog of the package is available in
[NEWS.md](https://github.com/giordano/Measurements.jl/blob/master/NEWS.md) file
in top directory.  There have been some breaking changes from time to time,
beware of them when upgrading the package.

License
-------

The `Measurements.jl` package is licensed under the MIT "Expat" License.  The
original author is Mosè Giordano.



[docs-latest-img]: https://img.shields.io/badge/docs-latest-blue.svg
[docs-latest-url]: http://measurementsjl.readthedocs.io/en/latest/

[docs-stable-img]: https://img.shields.io/badge/docs-stable-blue.svg
[docs-stable-url]: http://measurementsjl.readthedocs.io/en/stable/

[pkgeval-link]: http://pkg.julialang.org/?pkg=Measurements

[pkg-0.4-img]: http://pkg.julialang.org/badges/Measurements_0.4.svg
[pkg-0.4-url]: http://pkg.julialang.org/detail/Measurements.html
[pkg-0.5-img]: http://pkg.julialang.org/badges/Measurements_0.5.svg
[pkg-0.5-url]: http://pkg.julialang.org/detail/Measurements.html
[pkg-0.6-img]: http://pkg.julialang.org/badges/Measurements_0.6.svg
[pkg-0.6-url]: http://pkg.julialang.org/detail/Measurements.html

[travis-img]: https://travis-ci.org/giordano/Measurements.jl.svg?branch=master
[travis-url]: https://travis-ci.org/giordano/Measurements.jl

[appvey-img]: https://ci.appveyor.com/api/projects/status/u8mg5dlhyb1vjcpe?svg=true
[appvey-url]: https://ci.appveyor.com/project/giordano/measurements-jl

[coveral-img]: https://coveralls.io/repos/github/giordano/Measurements.jl/badge.svg?branch=master
[coveral-url]: https://coveralls.io/github/giordano/Measurements.jl?branch=master

[codecov-img]: https://codecov.io/gh/giordano/Measurements.jl/branch/master/graph/badge.svg
[codecov-url]: https://codecov.io/gh/giordano/Measurements.jl
