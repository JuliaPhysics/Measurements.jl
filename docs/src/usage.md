Usage
=====

```@meta
DocTestSetup = quote
    using Measurements
end
```

After installing the package, you can start using it with

```julia
using Measurements
```

The module defines a new `Measurement` data type. `Measurement` objects
can be created with the two following constructors:

```@docs
Measurements.measurement
```

where

- `val` is the nominal value of the measurement
- `err` is its uncertainty, assumed to be a [standard
  deviation](https://en.wikipedia.org/wiki/Standard_deviation).

They are both subtype of `AbstractFloat`. Some keyboard layouts provide an easy
way to type the `±` sign, if your does not, remember you can insert it in Julia
REPL with `\pm` followed by `TAB` key. You can provide `val` and `err` of any
subtype of `Real` that can be converted to `AbstractFloat`. Thus,
`measurement(42, 33//12)` and `pi ± 0.1` are valid.

`measurement(value)` creates a `Measurement` object with zero uncertainty, like
mathematical constants. See below for further examples.

!!! note

    Every time you use one of the constructors above you define a *new
    independent* measurement. Instead, when you perform mathematical
    operations involving `Measurement` objects you create a quantity that is
    not independent, but rather depends on really independent measurements.

Most mathematical operations are instructed, by [operator
overloading](https://en.wikipedia.org/wiki/Operator_overloading), to accept
`Measurement` type, and uncertainty is calculated exactly using analityc
expressions of functions' derivatives.

It is also possible to create a `Complex` measurement with

```julia
complex(measurement(real_part_value, real_part_uncertainty),
        measurement(imaginary_part_value, imaginary_part_uncertainty))
```

In addition to making the code prettier, the fact that the `±` sign can be used
as infix operator to define new independent `Measurement` s makes the printed
representation of these objects valid Julia syntax, so you can quickly copy the
output of an operation in the Julia REPL to perform other calculations. Note
however that the copied number will not be the *same* object as the original
one, because it will be a *new independent* measurement, without memory of the
correlations of the original object.

This module extends many methods defined in Julia's mathematical standard
library, and some methods from widespread third-party packages as well. This is
the case for most special functions in
[SpecialFunctions.jl](https://github.com/JuliaMath/SpecialFunctions.jl) package,
and the `quadgk` integration routine from
[QuadGK.jl](https://github.com/JuliaMath/QuadGK.jl) package.

Those interested in the technical details of the package, in order integrate the
package in their workflow, can have a look at the [technical
appendix](#Appendix:-Technical-Details-1).

```@docs
Measurements.measurement(::AbstractString)
```

`measurement` function has also a method that enables you to create a
`Measurement` object from a string.

!!! warning "Caveat about the ± sign"
    The `±` infix operator is a convenient symbol to define quantities with
    uncertainty, but can lead to unexpected results if used in elaborate
    expressions involving many `±`s. Use parantheses where appropriate to
    avoid confusion. See for example the following cases:

    ```jldoctest
    julia> 7.5±1.2 + 3.9±0.9 # This is wrong!
    11.4 ± 1.2 ± 0.9 ± 0.0

    julia> (7.5±1.2) + (3.9±0.9) # This is correct
    11.4 ± 1.5
    ```

Correlation Between Variables
-----------------------------

The fact that two or more measurements are correlated means that there is some
sort of relationship beetween them. In the context of measurements and error
propagation theory, the term
"[correlation](https://en.wikipedia.org/wiki/Correlation_and_dependence)" is
very broad and can indicate different things. Among others, there may be some
dependence between uncertainties of different measurements with different
values, or a dependence between the values of two measurements while their
uncertainties are different.

Here, for correlation we mean the most simple case of functional relationship:
if ``x = \bar{x} \pm \sigma_x`` is an independent measurement, a quantity ``y =
f(x) = \bar{y} \pm \sigma_y`` that is function of ``x`` is not like an
independent measurement but is a quantity that depends on ``x``, so we say that
``y`` is correlated with ``x``. The package `Measurements.jl` is able to handle
this type of correlation when propagating the uncertainty for operations and
functions taking two or more arguments. As a result, ``x - x = 0 \pm 0`` and
``x/x = 1 \pm 0``.  If this correlation was not accounted for, you would always
get non-zero uncertainties even for these operations that have exact
results. Two truly different measurements that only by chance share the same
nominal value and uncertainty are not treated as correlated.

Propagate Uncertainty for Arbitrary Functions
---------------------------------------------

```@docs
Measurements.@uncertain
```

Existing functions implemented exclusively in Julia that accept `AbstractFloat`
arguments will work out-of-the-box with `Measurement` objects as long as they
internally use functions already supported by this package. However, there are
functions that take arguments that are specific subtypes of `AbstractFloat`, or
are implemented in such a way that does not play nicely with `Measurement`
variables.

The package provides the `@uncertain` macro that overcomes this limitation and
further extends the power of `Measurements.jl`.

This macro allows you to propagate uncertainty in arbitrary functions, including
those based on [C/Fortran
calls](https://docs.julialang.org/en/v1/manual/calling-c-and-fortran-code/),
that accept any number of real arguments. The macro exploits `derivative` and
`gradient` functions from
[Calculus](https://github.com/JuliaMath/Calculus.jl) package in order to
perform numerical differentiation.

Derivative and Gradient
-----------------------

```@docs
Measurements.derivative
```

In order to propagate the uncertainties, `Measurements.jl` keeps track of the
partial derivative of an expression with respect to all independent measurements
from which the expression comes. For this reason, the package provides a
convenient function, `Measurements.derivative`, to get the partial derivative
and the gradient of an expression with respect to independent measurements.

Uncertainty Contribution
------------------------

```@docs
Measurements.uncertainty_components
```

You may want to inspect which measurement contributes most to the total
uncertainty of a derived quantity, in order to minimize it, if possible.  The
function `Measurements.uncertainty_components` gives you a dictonary whose
values are the components of the uncertainty of `x`.

Standard Score
--------------

```@docs
Measurements.stdscore
```

The `stdscore` function is available to calculate the [standard
score](https://en.wikipedia.org/wiki/Standard_score) between a measurement and
its expected value (not a `Measurement`). When both arguments are `Measurement`
objects, the standard score between their difference and zero is computed, in
order to test their compatibility.

Weighted Average
----------------

```@docs
Measurements.weightedmean
```

`weightedmean` function gives the [weighted
mean](https://en.wikipedia.org/wiki/Weighted_arithmetic_mean) of a set of
measurements using [inverses of variances as
weights](https://en.wikipedia.org/wiki/Inverse-variance_weighting). Use `mean`
for the simple arithmetic mean.

Access Nominal Value and Uncertainty
------------------------------------

```@docs
Measurements.value
Measurements.uncertainty
```

As explained in the technical appendix, the nominal value and the uncertainty of
`Measurement` objects are stored in `val` and `err` fields respectively, but you
do not need to use those field directly to access this information. Functions
`Measurements.value` and `Measurements.uncertainty` allow you to get the nominal
value and the uncertainty of `x`, be it a single measurement or an array of
measurements. They are particularly useful in the case of complex measurements
or arrays of measurements.

Error Propagation of Numbers with Units
---------------------------------------

`Measurements.jl` does not know about [units of
measurements](https://en.wikipedia.org/wiki/Units_of_measurement), but can be
easily employed in combination with other Julia packages providing this
feature. Thanks to the [type
system](https://docs.julialang.org/en/v1/manual/types/) of Julia programming
language this integration is seamless and comes for free, no specific work has
been done by the developer of the present package nor by the developers of the
above mentioned packages in order to support their interplay. They all work
equally good with `Measurements.jl`, you can choose the library you prefer and
use it. Note that only [algebraic
functions](https://en.wikipedia.org/wiki/Algebraic_operation) are allowed to
operate with numbers with units of measurement, because [transcendental
functions](https://en.wikipedia.org/wiki/Transcendental_function) operate on
[dimensionless
quantities](https://en.wikipedia.org/wiki/Dimensionless_quantity). In the
Examples section you will find how this feature works with a couple of packages.

Representation of `Measurement`s
--------------------------------

### `Measurement`s in the REPL

When working in the [Julia
REPL](https://docs.julialang.org/en/v1/stdlib/REPL/), `Measurement` objects
are shown truncated in order to present two significant digits for the
uncertainty:

```jldoctest
julia> -84.32 ± 5.6
-84.3 ± 5.6

julia> 7.9 ± 18.6
8.0 ± 19.0
```

Note that truncation only affects the numbers shown in the REPL:

```jldoctest
julia> Measurements.value(7.9 ± 18.6)
7.9

julia> Measurements.uncertainty(7.9 ± 18.6)
18.6
```

### Printing to TeX and LaTeX MIMEs

You can print `Measurement` objects to TeX and LaTeX MIMES (`"text/x-tex"` and
`"text/x-latex"`), the `±` sign will be rendered with `\pm` command:

```jldoctest
julia> repr("text/x-tex", 5±1)
"5.0 \\pm 1.0"

julia> repr("text/x-latex", pi ± 1e-3)
"3.1416 \\pm 0.001"
```
