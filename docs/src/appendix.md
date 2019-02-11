Appendix: Technical Details
===========================

This technical appendix explains the design of `Measurements.jl` package, how it
propagates the uncertainties when performing calculations, and how you can
contribute by providing new methods for mathematical operations.

The `Measurement` Type
----------------------

`Measurement` is a
[composite](https://docs.julialang.org/en/v1/manual/types/#Composite-Types-1)
[parametric](https://docs.julialang.org/en/v1/manual/types/#Parametric-Types-1)
type, whose parameter is the `AbstractFloat` subtype of the nominal value and
the uncertainty of the measurement. `Measurement` type itself is subtype of
`AbstractFloat`, thus `Measurement` objects can be used in any function taking
`AbstractFloat` arguments without redefining it, and calculation of uncertainty
will be exact.

In detail, this is the definition of the type:

```julia
struct Measurement{T<:AbstractFloat} <: AbstractFloat
    val::T
    err::T
    tag::UInt64
    der::Derivatives{T}
end
```

The fields represent:

- `val`: the nominal value of the measurement.
- `err`: the uncertainty, assumed to be standard deviation.
- `tag`: a unique identifier, it is used to identify a specific measurement in
  the list of derivatives. This is a thread-specific counter. The result of
  mathematical operation will have this field set to `0` because it is not
  relevant for non independent measurements.
- `der`: the list of derivates with respect to the independent variables from
  which this object comes. `Derivatives` is a lightweight dictionary type. The
  keys are the tuples `(val, err, tag)` of all independent variables from which
  the object has been derived, while the corresponding value is the partial
  derivative of the object with respect to that independent variable. An
  independent measurement has this dictionary empty.

As already explained in the [Usage](@ref) section, every time you use one of the
constructors

```julia
measurement(value, uncertainty)
value ± uncertainty
```

you define a *new independent* measurement. This happens because these
contructors generate a new unique `tag` field, that is used to distinguish
between really equal objects and measurements that only by chance share the same
nominal value and uncertainty. For these reasons,

```julia
julia> x = 24.3 ± 2.7
24.3 ± 2.7

julia> y = 24.3 ± 2.7
24.3 ± 2.7
```

will produce two independent measurements and they will be treated as such when
performing mathematical operations. In particular, you can also notice that they
are not [egal](https://docs.julialang.org/en/v1/base/base/#Core.:===)

```julia
julia> x === y
false
```

If you instead intend to make a variable really the same thing as an independent
measurement you have to use assignment:

```julia
julia> a = b = 24.3 ± 2.7
24.3 ± 2.7

julia> a === b
true
```

Thanks to how the Julia language is designed, support for complex measurements,
arbitrary precision calculations and array operations came with practically no
effort during the development of the package. As
[explained](https://github.com/JuliaPhysics/Measurements.jl/issues/1#issuecomment-220727553)
by Steven G. Johnson, since in Julia a lot of nonlinear functions are internally
implemented in terms of elementary operations on the real and imaginary parts it
was natural to make the type subtype of `Real` in order to easily work with
complex measurements. In particular, it was then chosen to select the
`AbstractFloat` type because some functions of complex arguments (like `sqrt`
and `log`) take `Complex{AbstractFloat}` arguments instead of generic
`Complex{Real}`, and any operation on a `Measurement{R}` object, with `R`
subtype of `Real` different from `AbstractFloat`, would turn it into
`Measurement{F}`, with `F` subtype of `AbstractFloat`, anyway.

Correlation
-----------

One must carefully take care of
[correlation](https://en.wikipedia.org/wiki/Correlation_and_dependence) between
two measurements when propagating the uncertainty for an operation. Actually,
the term "correlation" may refer to different kind of dependences between two or
more quantities, what we mean by this term in `Measurements.jl` is explained in
the [Usage](@ref) section of this manual.

Dealing with functional correlation between `Measurement` objects, when using
functions with [arity](https://en.wikipedia.org/wiki/Arity) larger than one, is
an important feature of this package. This is accomplished by keeping inside
each `Measurement` object the list of its derivatives with respect to the
independent variables from which the quantity comes.  This role is played by the
`der` field. This dictionary is useful in order to trace the contribution of
each measurement and propagate the uncertainty in the case of functions with
more than one argument.

The use of the list of derivatives has been inspired by Python package
[uncertainties](https://pythonhosted.org/uncertainties/), but the rest of the
implementation of `Measurements.jl` is completely independent from that of
`uncertainties` package.

Uncertainty Propagation
-----------------------

For a function ``G(a, b, c, \dots)`` of real arguments with uncertainties ``a =
\bar{a} \pm \sigma_{a}``, ``b = \bar{b} \pm \sigma_{b}``, and ``c = \bar{c} \pm
\sigma_{c}``, ..., the [linear error propagation
theory](https://en.wikipedia.org/wiki/Propagation_of_uncertainty) prescribes
that uncertainty is propagated as follows:

```math
\begin{aligned}
\sigma_G^2 = \left( \left.\frac{\partial G}{\partial a}\right\vert_{a
= \bar{a}} \sigma_a \right)^2 + \left( \left.\frac{\partial
G}{\partial b}\right\vert_{b = \bar{b}} \sigma_b \right)^2 + \left(
\left.\frac{\partial G}{\partial c}\right\vert_{c = \bar{c}} \sigma_c
\right)^2 + \cdots \\
+ 2 \left(\frac{\partial G}{\partial a}\right)_{a = \bar{a}}
\left(\frac{\partial G}{\partial b}\right)_{b = \bar{b}}
\sigma_{ab} + 2 \left(\frac{\partial G}{\partial a}\right)_{a =
\bar{a}} \left(\frac{\partial G}{\partial c}\right)_{c = \bar{c}}
\sigma_{ac} \\
+ 2 \left(\frac{\partial G}{\partial b}\right)_{b = \bar{b}}
\left(\frac{\partial G}{\partial c}\right)_{c = \bar{c}} \sigma_{bc} +
\dots
\end{aligned}
```

where the ``\sigma_{ab}`` factors are the
[covariances](https://en.wikipedia.org/wiki/Covariance) defined as

```math
\sigma_{ab} = \text{E}[(a - \text{E}[a])(b - \text{E}[b])]
```

``E[a]`` is the [expected value](https://en.wikipedia.org/wiki/Expected_value),
or mean, of ``a``.  If uncertainties of the quantities ``a``, ``b``, ``c``, ...,
are independent and normally distributed, the covariances are null and the above
formula for uncertainty propagation simplifies to

```math
\sigma_G^2 = \left( \left.\frac{\partial G}{\partial a}\right\vert_{a
= \bar{a}} \sigma_a \right)^2 + \left( \left.\frac{\partial
G}{\partial b}\right\vert_{b = \bar{b}} \sigma_b \right)^2 + \left(
\left.\frac{\partial G}{\partial c}\right\vert_{c = \bar{c}} \sigma_c
\right)^2 + \cdots
```

In general, calculating the covariances is not an easy task. The trick adopted
in `Measurements.jl` in order to deal with simple functional correlation is to
propagate the uncertainty always using really independent variables. Thus,
dealing with functional correlation boils down to finding the set of all the
independent measurements on which an expression depends. If this set is made up
of ``\{x, y, z, \dots\}``, it is possible to calculate the uncertainty of ``G(a,
b, c, \dots)`` with

```math
\sigma_G^2 = \left( \left.\frac{\partial G}{\partial x}\right\vert_{x
= \bar{x}} \sigma_x \right)^2 + \left( \left.\frac{\partial
G}{\partial y}\right\vert_{y = \bar{y}} \sigma_y \right)^2 + \left(
\left.\frac{\partial G}{\partial z}\right\vert_{z = \bar{z}} \sigma_z
\right)^2 + \cdots
```

where all covariances due to functional correlation are null. This explains the
purpose of keeping the list of derivatives with respect to independent variables
in `Measurement` objects: by looking at the `der` fields of ``a``, ``b``, ``c``,
..., it is possible to determine the set of independent variables. If other
types of correlation (not functional) between ``x``, ``y``, ``z``, ..., are
present, they should be treated by calculating the covariances as shown above.

For a function of only one argument, ``G = G(a)``, there is no problem of
correlation and the uncertainty propagation formula in the linear approximation
simply reads

```math
\sigma_G = \left\vert \frac{\partial G}{\partial a} \right\vert_{a =
\bar{a}} \sigma_a
```

even if ``a`` is not an independent variable and comes from operations on really
independent measurements.

For example, suppose you want to calculate the function ``G = G(a, b)`` of two
arguments, and ``a`` and ``b`` are functionally correlated, because they come
from some mathematical operations on really independent variables ``x``, ``y``,
``z``, say ``a = a(x, y)``, ``b = b(x, z)``. By using the [chain
rule](https://en.wikipedia.org/wiki/Chain_rule), the uncertainty on ``G(a, b)``
is calculated as follows:

```math
\sigma_G^2 = \left( \left(\frac{\partial G}{\partial a}\frac{\partial
a}{\partial x} + \frac{\partial G}{\partial b}\frac{\partial
b}{\partial x}\right)_{x = \bar{x}} \sigma_x \right)^2 + \left(
\left(\frac{\partial G}{\partial a}\frac{\partial a}{\partial
y}\right)_{y = \bar{y}} \sigma_y \right)^2 + \left(
\left(\frac{\partial G}{\partial b}\frac{\partial b}{\partial
z}\right)_{z = \bar{z}} \sigma_z \right)^2
```

What `Measurements.jl` really does is to calulate the derivatives like
``\partial a/\partial x`` and ``\partial G/\partial x = (\partial G/\partial
a)(\partial a/\partial x) + (\partial G/\partial b)(\partial b/\partial x)``,
and store them in the `der` field of ``a`` and ``G`` respectively in order to be
able to perform further operations involving these quantities.

This method is also described in the paper by Giordano, M.

Defining Methods for Mathematical Operations
--------------------------------------------

`Measurements.jl` defines new methods for mathematical operations in order to
make them accept `Measurement` arguments. The single most important thing to
know about how to define new methods in the package is the
`Measurements.result`. This function, not exported because it is intended to be
used only within the package, takes care of propagating the uncertainty as
described in the section above. It has two methods: one for functions with arity
equal to one, and the other for any other case. This is its syntax:

```julia
result(val::Real, der::Real, a::Measurement)
```

for functions of one argument, and

```julia
result(val, der, a)
```

for functions of two or more arguments.  The arguments are:

- `val`: the nominal result of the operation ``G(a, \dots)``;
- `der`: the partial derivative ``\partial G/\partial a`` of a function ``G =
  G(a)`` with respect to the argument ``a`` for one-argument functions or the
  tuple of partial derivatives with respect to each argument in other cases;
- `a`: the argument(s) of ``G``, in the same order as the corresponding
  derivatives in `der` argument.

In the case of functions with arity larger than one, `der` and `a` tuples must
have the same length.

For example, for a one-argument function like ``\cos`` we have

```julia
cos(a::Measurement) = result(cos(a.val), -sin(a.val), a)
```

Instead, the method for subtraction operation is defined as follows:

```julia
-(a::Measurement, b::Measurement) =
    result(a.val - b.val, (1, -1), (a, b))
```

Thus, in order to support `Measurement` argument(s) for a new mathematical
operation you have to calculate the result of the operation, the partial
derivatives of the functon with respect to all arguments and then pass this
information to `Measurements.result` function.
