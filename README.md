# Measurements.jl

| **Documentation**                       | **Build Status**                    | **Code Coverage**               | **Quality** |
|:---------------------------------------:|:-----------------------------------:|:-------------------------------:|:-----------:|
| [![][docs-stable-img]][docs-stable-url] | [![Build Status][gha-img]][gha-url] | [![][coveral-img]][coveral-url] |[![Aqua QA][aqua-img]][aqua-url]|
| [![][docs-latest-img]][docs-latest-url] |                                     | [![][codecov-img]][codecov-url] |

## Introduction

### What Is This Package Useful For?

![image](docs/src/error_bars_2x.png)

*Image credit: "[xkcd: Error Bars](https://xkcd.com/2110/)" ([CC-BY-NC
2.5](https://creativecommons.org/licenses/by-nc/2.5/))*

Physical measures are typically reported with an error, a quantification of the
[uncertainty](https://en.wikipedia.org/wiki/Measurement_uncertainty) of the
accuracy of the measurement.  Whenever you perform mathematical operations
involving these quantities you have also to [propagate the
uncertainty](https://en.wikipedia.org/wiki/Propagation_of_uncertainty), so that
the resulting number will also have an attached error to quantify the confidence
about its accuracy.
[Measurements.jl](https://github.com/JuliaPhysics/Measurements.jl) relieves you
from the hassle of propagating uncertainties coming from physical measurements,
when performing mathematical operations involving them.  The [linear error
propagation
theory](https://en.wikipedia.org/wiki/Propagation_of_uncertainty#Linear_combinations)
is employed to propagate the errors.

This library is written in [Julia](http://julialang.org/), a modern high-level,
high-performance dynamic programming language designed for technical computing.

When used in the [Julia interactive
session](https://docs.julialang.org/en/v1/stdlib/REPL/), it can serve also as an
easy-to-use calculator.

### Features List

* Support for most mathematical operations available in Julia standard library
  and special functions
  from [`SpecialFunctions.jl`](https://github.com/JuliaMath/SpecialFunctions.jl)
  package, involving real and complex numbers.  All existing functions that
  accept `AbstractFloat` (and `Complex{AbstractFloat}` as well) arguments and
  internally use already supported functions can in turn perform calculations
  involving numbers with uncertainties without being redefined.  This greatly
  enhances the power of `Measurements.jl` without effort for the users
* Functional correlation between variables is correctly handled, so `x-x ≈
  zero(x)`, `x/x ≈ one(x)`, `tan(x) ≈ sin(x)/cos(x)`, `cis(x) ≈ exp(im*x)`,
  etc...
* Support for
  [arbitrary precision](https://docs.julialang.org/en/v1/manual/integers-and-floating-point-numbers/#Arbitrary-Precision-Arithmetic-1)
  (also called multiple precision) numbers with uncertainties.  This is useful
  for measurements with very low relative error
* Define arrays of measurements and perform calculations with them.  Some linear
  algebra functions work out-of-the-box
* Propagate uncertainty for any function of real arguments (including functions
  based on
  [C/Fortran calls](https://docs.julialang.org/en/v1/manual/calling-c-and-fortran-code/)),
  using `@uncertain`
  [macro](https://docs.julialang.org/en/v1/manual/metaprogramming/)
* Function to get the derivative and the gradient of an expression with respect
  to one or more independent measurements
* Functions to calculate
  [standard score](https://en.wikipedia.org/wiki/Standard_score) and
  [weighted mean](https://en.wikipedia.org/wiki/Weighted_arithmetic_mean)
* Parse strings to create measurement objects
* Easy way to attach the uncertainty to a number using the `±` sign as infix
  operator.  This syntactic sugar makes the code more readable and visually
  appealing
* Extensible in combination with external packages: you can propagate errors of
  measurements with their physical units, perform numerical integration
  with [`QuadGK.jl`](https://github.com/JuliaMath/QuadGK.jl), numerical and
  automatic differentiation, and much more.
* Integration with [`Plots.jl`](https://github.com/JuliaPlots/Plots.jl).

The method used to handle functional correlation is described in this paper:

* M. Giordano, 2016, "Uncertainty propagation with functionally correlated
  quantities", [arXiv:1610.08716](http://arxiv.org/abs/1610.08716)
  (Bibcode:
  [`2016arXiv161008716G`](http://adsabs.harvard.edu/abs/2016arXiv161008716G))

A current limitation of the package is that it is not yet possible to define
quantities related by a correlation matrix.

If you use use this package for your research, please cite it.

### Documentation

The complete manual of `Measurements.jl` is available at
https://juliaphysics.github.io/Measurements.jl/stable/.  There, people
interested in the details of the package, in order integrate the package in
their workflow, can find a technical appendix explaining how the package
internally works.

## Installation

The latest version of `Measurements.jl` is available for Julia v1.0 and later
releases, and can be installed with [Julia built-in package
manager](https://julialang.github.io/Pkg.jl/stable/).  In a Julia session, after
entering the package manager mode with `]`, run the command

```julia
pkg> update
pkg> add Measurements
```

Older versions of this package are also available for Julia 0.4-0.7.

## Usage

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

Here is a quick taster of the functionalities of the package:

``` julia
julia> using Measurements

julia> a = measurement(4.5, 0.1)
4.5 ± 0.1

julia> b = 3.8 ± 0.4
3.8 ± 0.4

julia> 2a + b
12.8 ± 0.4472135954999579

julia> x = 8.4 ± 0.7

julia> x - x
0.0 ± 0.0

julia> x/x
1.0 ± 0.0

julia> x*x*x - x^3
0.0 ± 0.0

julia> sin(x)/cos(x) - tan(x)
-2.220446049250313e-16 ± 0.0 # They are equal within numerical accuracy
```

For more details about the use of the package read the
[documentation](https://juliaphysics.github.io/Measurements.jl/stable/), in
particular the
[Usage](https://juliaphysics.github.io/Measurements.jl/stable/usage/) and
[Examples](https://juliaphysics.github.io/Measurements.jl/stable/examples/)
sections.

## License

The `Measurements.jl` package is licensed under the MIT "Expat" License.  The
original author is Mosè Giordano.

Please, cite the paper Giordano 2016 (http://arxiv.org/abs/1610.08716) if you
employ this package in your research work.  For your convenience, a BibTeX entry
is provided in the [`CITATION.bib`](CITATION.bib) file.


[docs-latest-img]: https://img.shields.io/badge/docs-latest-blue.svg
[docs-latest-url]: https://juliaphysics.github.io/Measurements.jl/dev/

[docs-stable-img]: https://img.shields.io/badge/docs-stable-blue.svg
[docs-stable-url]: https://juliaphysics.github.io/Measurements.jl/stable/

[gha-img]: https://github.com/JuliaPhysics/Measurements.jl/workflows/CI/badge.svg
[gha-url]: https://github.com/JuliaPhysics/Measurements.jl/actions?query=workflow%3ACI

[coveral-img]: https://coveralls.io/repos/github/JuliaPhysics/Measurements.jl/badge.svg?branch=master
[coveral-url]: https://coveralls.io/github/JuliaPhysics/Measurements.jl?branch=master

[codecov-img]: https://codecov.io/gh/JuliaPhysics/Measurements.jl/branch/master/graph/badge.svg
[codecov-url]: https://codecov.io/gh/JuliaPhysics/Measurements.jl

[aqua-img]: https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg
[aqua-url]: https://github.com/JuliaTesting/Aqua.jl
