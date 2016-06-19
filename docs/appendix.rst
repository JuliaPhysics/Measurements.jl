Appendix: Technical Details
---------------------------

This technical appendix explains the design of ``Measurements.jl`` package, how
it propagates the uncertainties when performing calculations, and how you can
contribute by providing new methods for mathematical operations.

The ``Measurement`` Type
~~~~~~~~~~~~~~~~~~~~~~~~

``Measurement`` is a `composite
<http://docs.julialang.org/en/stable/manual/types/#composite-types>`__
`parametric
<http://docs.julialang.org/en/stable/manual/types/#man-parametric-types>`__
type, whose parameter is the ``AbstractFloat`` subtype of the nominal value and
the uncertainty of the measurement.  ``Measurement`` type itself is subtype of
``AbstractFloat``, thus ``Measurement`` objects can be used in any function
taking ``AbstractFloat`` arguments without redefining it, and calculation of
uncertainty will be exact.

In detail, this is the definition of the type:

.. code-block:: julia

    immutable Measurement{T<:AbstractFloat} <: AbstractFloat
        val::T
        err::T
        tag::Float64
        der::Derivatives{Tuple{T, T, Float64}, T}
    end

The fields represent:

- ``val``: the nominal value of the measurement
- ``err``: the uncertainty, assumed to be standard deviation
- ``tag``: a unique identifier, it is used to identify a specific measurement in
  the list of derivatives.  This is automatically created with ``rand``.  The
  result of mathematical operation will have this field set to ``NaN`` because
  it is not relevant for non independent measurements.
- ``der``: the list of derivates with respect to the independent variables from
  which the expression comes.  ``Derivatives`` is a lightweight dictionary type.
  The keys are the tuples ``(val, err, tag)`` of all independent variables from
  which the object has been derived, while the corresponding value is the total
  derivative of the object with respect to that independent variable.

As already explained in the "Usage" section, every time you use one of the
constructors

.. code-block:: julia

    Measurement(value, uncertainty)
    value ± uncertainty

you define a *new independent* measurement.  This happens because these
contructors generate a new random and (hopefully) unique ``tag`` field, that is
used to distinguish between really equal objects and measurements that only by
chance share the same nominal value and uncertainty.  For these reasons,

.. code-block:: julia

    x = 24.3 ± 2.7
    y = 24.3 ± 2.7

will produce two independent measurements and they will be treated as such when
performing mathematical operations.  In particular, you can also notice that
they are not `egal <http://docs.julialang.org/en/stable/stdlib/base/#Base.is>`__

.. code-block:: julia

    x === y
    # => false

If you instead intend to make ``y`` really the same thing as ``x`` you have to
use assignment:

.. code-block:: julia

    x = y = 24.3 ± 2.7
    x === y
    # => true

Thanks to how the Julia language is designed, support for complex measurements
and arbitrary precision calculations came with practically no effort during the
development of the package.  As `explained
<https://github.com/giordano/Measurements.jl/issues/1#issuecomment-220727553>`__
by Steven G. Johnson, since in Julia a lot of nonlinear functions are internally
implemented in terms of elementary operations on the real and imaginary parts it
was natural to make the type subtype of ``Real``.  In particular, it was then
chosen to select the ``AbstractFloat`` type because some functions of complex
arguments (like ``sqrt`` and ``log``) take ``Complex{AbstractFloat}`` arguments
instead of generic ``Complex{Real}``, and any operation on a ``Measurement{R}``
object, with ``R`` subtype of ``Real`` different from ``AbstractFloat``, would
turn it into ``Measurement{F}``, with ``F`` subtype of ``AbstractFloat``,
anyway.

Correlation
~~~~~~~~~~~

Dealing with `correlation
<https://en.wikipedia.org/wiki/Correlation_and_dependence>`__ between two
``Measurement`` objects, when using functions with `arity
<https://en.wikipedia.org/wiki/Arity>`__ larger than one, is an important
feature of this package.  This is accomplished by keeping inside ``Measurement``
objects the list of its derivatives with respect to the independent variables
from which the quantity comes, that is updated every time a new mathematical
operation is performed.  This role is played by the ``der`` field.  This
dictionary is useful in order to trace the contribution of each measurement and
propagate the uncertainty in the case of functions with more than one argument.

The use of the list of derivatives has been inspired by Python package
`uncertainties <https://pythonhosted.org/uncertainties/>`__, but the rest of the
implementation of ``Measurements.jl`` is completely independent from that of
this package, even though it may happen to be similar.

Uncertainty Propagation
~~~~~~~~~~~~~~~~~~~~~~~

For a function :math:`G(a, b, c, \dots)` of real arguments with uncertainties
:math:`a = \bar{a} \pm \sigma_{a}`, :math:`b = \bar{b} \pm \sigma_{b}`, and
:math:`c = \bar{c} \pm \sigma_{c}`, ..., the `linear error propagation theory
<https://en.wikipedia.org/wiki/Propagation_of_uncertainty>`__ prescribes that
uncertainty is propagated as follows:

.. math:: \sigma_G^2 = \left( \left.\frac{\partial G}{\partial a}\right\vert_{a
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

where the :math:`\sigma_{ab}` factors are the `covariances
<https://en.wikipedia.org/wiki/Covariance>`__ defined as

.. math:: \sigma_{ab} = \text{E}[(a - \text{E}[a])(b - \text{E}[b])]

:math:`E[a]` is the `expected value
<https://en.wikipedia.org/wiki/Expected_value>`__, or mean, of :math:`a`. If
uncertainties of the quantities :math:`a`, :math:`b`, :math:`c`, ..., are
independent and normally distributed, the covariances are null and the above
formula for uncertainty propagation simplifies to

.. math:: \sigma_G^2 = \left( \left.\frac{\partial G}{\partial a}\right\vert_{a
	  = \bar{a}} \sigma_a \right)^2 + \left( \left.\frac{\partial
	  G}{\partial b}\right\vert_{b = \bar{b}} \sigma_b \right)^2 + \left(
	  \left.\frac{\partial G}{\partial c}\right\vert_{c = \bar{c}} \sigma_c
	  \right)^2 + \cdots

In general, calculating the covariances is not an easy task.  The trick adopted
in ``Measurements.jl`` is to propagate the uncertainty always using really
independent variables.  Thus, dealing with correlation boils down to finding the
set of all the independent measurements on which an expression depends.  If this
set is made up of :math:`\{x, y, z, \dots\}`, it is possible to calculate the
uncertainty of :math:`G(a, b, c, \dots) = g(x, y, z, \dots)` with

.. math:: \sigma_G^2 = \left( \left.\frac{\text{d} g}{\text{d} x}\right\vert_{x
	  = \bar{x}} \sigma_x \right)^2 + \left( \left.\frac{\text{d}
	  g}{\text{d} y}\right\vert_{y = \bar{y}} \sigma_y \right)^2 + \left(
	  \left.\frac{\text{d} g}{\text{d} z}\right\vert_{z = \bar{z}} \sigma_z
	  \right)^2 + \cdots

where :math:`\text{d} g/\text{d} x` is the total derivative of :math:`g` with
respect to :math:`x`, and all covariances are null.  This explains the purpose
of keeping the list of derivatives with respect to independent variables in
``Measurement`` objects: by looking at the ``der`` fields of :math:`a`,
:math:`b`, :math:`c`, ..., it is possible to determine the set of independent
variables.

For a function of only one argument, :math:`G = G(a)`, there is no problem of
correlation and the uncertainty propagation formula in the linear approximation
simply reads

.. math:: \sigma_G = \left\vert \frac{\partial G}{\partial a} \right\vert_{a =
	  \bar{a}} \sigma_a

even if :math:`a` is not an independent variable and comes from operations on
really independent measurements.

For example, suppose you want to calculate the function :math:`G = G(a, b)` of
two arguments, and :math:`a` and :math:`b` are correlated, because they come
from some mathematical operations on really independent variables :math:`x`,
:math:`y`, :math:`z`, say :math:`a = a(x, y)`, :math:`b = b(x, z)`.  The
uncertainty on :math:`G(a, b) = g(x, y, z)` is calculated as follows:

.. math:: \sigma_G^2 = \left( \left(\frac{\partial G}{\partial a}\frac{\partial
	  a}{\partial x} + \frac{\partial G}{\partial b}\frac{\partial
	  b}{\partial x}\right)_{x = \bar{x}} \sigma_x \right)^2 + \left(
	  \left(\frac{\partial G}{\partial a}\frac{\partial a}{\partial
	  y}\right)_{y = \bar{y}} \sigma_y \right)^2 + \left(
	  \left(\frac{\partial G}{\partial b}\frac{\partial b}{\partial
	  z}\right)_{z = \bar{z}} \sigma_z \right)^2

What ``Measurements.jl`` really does is to calulate the derivatives like
:math:`\text{d}a/\text{d}x = \partial a/\partial x` and :math:`\text{d}
g/\text{d} x = (\partial G/\partial a)(\partial a/\partial x) + (\partial
G/\partial b)(\partial b/\partial x)`, and store them in the ``der`` field of
:math:`a` and :math:`G` respectively in order to be able to perform further
operations involving these quantities.

Defining Methods for Mathematical Operations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

``Measurements.jl`` defines new methods for mathematical operations in order to
make them accept ``Measurement`` arguments.  The single most important thing to
know about how to define new methods in the package is the
``Measurements.result``.  This function, not exported because it is intended to
be used only within the package, takes care of propagating the uncertainty as
described in the section above.  It has two methods: one for functions with
arity equal to one, and the other for any other case.  This is its syntax:

.. code-block:: julia

    result(val::Real, der::Real, a::Measurement)

for functions of one argument, and

.. code-block:: julia

    result(val::Real, der::Tuple{Vararg{Real}},
           a::Tuple{Vararg{Measurement}})

for functions of two or more arguments.  The arguments are:

- ``val``: the nominal result of the operation :math:`G(a, \dots)`;
- ``der``: the partial derivative :math:`\partial G/\partial a` of a function
  :math:`G = G(a)` with respect to the argument :math:`a` for one-argument
  functions or the tuple of partial derivatives with respect to each argument in
  other cases;
- ``a``: the argument(s) of :math:`G`, in the same order as the corresponding
  derivatives in ``der`` argument.

In the case of functions with arity larger than one, ``der`` and ``a`` tuples
must have the same length.

For example, for a one-argument function like :math:`\cos` we have

.. code-block:: julia

    cos(a::Measurement) = result(cos(a.val), -sin(a.val), a)

Instead, the method for subtraction operation is defined as follows:

.. code-block:: julia

    -(a::Measurement, b::Measurement) =
        result(a.val - b.val, (1.0, -1.0), (a, b))

Thus, in order to support ``Measurement`` argument(s) for a new mathematical
operation you have to calculate the result of the operation, the partial
derivatives of the functon with respect to all arguments and then pass this
information to ``Measurements.result`` function.
