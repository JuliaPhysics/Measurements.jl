Examples
--------

These are some basic examples of use of the package:

.. code-block:: julia

   julia> using Measurements

   julia> a = measurement(4.5, 0.1)
   4.5 ± 0.1

   julia> b = 3.8 ± 0.4
   3.8 ± 0.4

   julia> 2a + b
   12.8 ± 0.4472135954999579

   julia> a - 1.2b
   -0.05999999999999961 ± 0.49030602688525043

   julia> l = measurement(0.936, 1e-3);

   julia> T = 1.942 ± 4e-3;

   julia> g = 4pi^2*l/T^2
   9.797993213510699 ± 0.041697817535336676

   julia> c = measurement(4)
   4.0 ± 0.0

   julia> a*c
   18.0 ± 0.4

   julia> sind(94 ± 1.2)
   0.9975640502598242 ± 0.0014609761696991563

   julia> x = 5.48 ± 0.67;

   julia> y = 9.36 ± 1.02;

   julia> log(2x^2 - 3.4y)
   3.3406260917568824 ± 0.5344198747546611

   julia> atan2(y, x)
   1.0411291003154137 ± 0.07141014208254456

Measurements from Strings
~~~~~~~~~~~~~~~~~~~~~~~~~

You can construct ``Measurement`` objects from strings.  Within parentheses
there is the uncertainty referred to the corresponding last digits.

.. code-block:: julia

   julia> measurement("-12.34(56)")
   -12.34 ± 0.56

   julia> measurement("+1234(56)e-2")
   12.34 ± 0.56

   julia> measurement("123.4e-1 +- 0.056e1")
   12.34 ± 0.56

   julia> measurement("(-1.234 ± 0.056)e1")
   -12.34 ± 0.56

   julia> measurement("1234e-2 +/- 0.56e0")
   12.34 ± 0.56

   julia> measurement("-1234e-2")
   -12.34 ± 0.0

Correlation Between Variables
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Here you can see examples of how functionally correlated variables are treated
within the package:

.. code-block:: julia

   julia> x = 8.4 ± 0.7
   8.4 ± 0.7

   julia> x - x
   0.0 ± 0.0
   julia> x/x
   1.0 ± 0.0

   julia> x*x*x - x^3
   0.0 ± 0.0

   julia> sin(x)/cos(x) - tan(x)
   -2.220446049250313e-16 ± 0.0
   # They are equal within numerical accuracy

   julia> y = -5.9 ± 0.2

   julia> beta(x, y) - gamma(x)*gamma(y)/gamma(x + y)
   0.0 ± 3.979039320256561e-14

You will get similar results for a variable that is a function of an already
existing ``Measurement`` object:

.. code-block:: julia

   julia> u = 2x

   julia> (x + x) - u
   0.0 ± 0.0

   julia> u/2x
   1.0 ± 0.0

   julia> u^3 - 8x^3
   0.0 ± 0.0

   julia> cos(x)^2 - (1 + cos(u))/2
   0.0 ± 0.0

A variable that has the same nominal value and uncertainty as ``u`` above but is
not functionally correlated with ``x`` will give different outcomes:

.. code-block:: julia

   # Define a new measurement but with same nominal value
   # and uncertainty as u, so v is not correlated with x
   julia> v = 16.8 ± 1.4

   julia> (x + x) - v
   0.0 ± 1.979898987322333

   julia> v / 2x
   1.0 ± 0.11785113019775792
   julia> v^3 - 8x^3
   0.0 ± 1676.4200705455657

   julia> cos(x)^2 - (1 + cos(v))/2
   0.0 ± 0.8786465354843539

``@uncertain`` Macro
~~~~~~~~~~~~~~~~~~~~

Macro ``@uncertain`` can be used to propagate uncertainty in arbitrary real or
complex functions of real arguments, including functions not natively supported
by this package.

.. code-block:: julia

   julia> @uncertain (x -> complex(zeta(x), exp(eta(x)^2)))(2 ± 0.13)
   (1.6449340668482273 ± 0.12188127308075564) + (1.9668868646839253 ± 0.042613944993428333)im

   julia> @uncertain log(9.4 ± 1.3, 58.8 ± 3.7)
   1.8182372640255153 ± 0.11568300475873611

   julia> log(9.4 ± 1.3, 58.8 ± 3.7)
   1.8182372640255153 ± 0.11568300475593848

You usually do not need to define a wrapping function before using it.  In the
case where you have to define a function, like in the first line of previous
examples, `anonymous functions
<http://docs.julialang.org/en/stable/manual/functions/#anonymous-functions>`__
allow you to do it in a very concise way.

The macro works with functions calling C/Fortran functions as well.  For
example, `Cuba.jl <https://github.com/giordano/Cuba.jl>`__ package performs
numerical integration by wrapping the C `Cuba <http://www.feynarts.de/cuba/>`__
library.  You can define a function to numerically compute with ``Cuba.jl`` the
integral defining the `error function
<https://en.wikipedia.org/wiki/Error_function>`__ and pass it to ``@uncertain``
macro.  Compare the result with that of the ``erf`` function, natively supported
in ``Measurements.jl`` package

.. code-block:: julia

    julia> using Cuba

    julia> cubaerf(x::Real) =
               2x/sqrt(pi)*cuhre((t, f) -> f[1] = exp(-abs2(t[1]*x)))[1][1]
    cubaerf (generic function with 1 method)

    julia> @uncertain cubaerf(0.5 ± 0.01)
    0.5204998778130466 ± 0.008787825789336267

    julia> erf(0.5 ± 0.01)
    0.5204998778130465 ± 0.008787825789354449

Also here you can use an anonymous function instead of defining the ``cubaerf``
function, do it as an exercise.  Remember that if you want to numerically
integrate a function that returns a ``Measurement`` object you can use
``QuadGK.jl`` package, which is written purely in Julia and in addition allows
you to set ``Measurement`` objects as endpoints, see below.

.. Tip::

   Note that the argument of ``@uncertain`` macro must be a function call whose
   arguments are ``Measurement`` objects.  Thus,

   .. code-block:: julia

      julia> @uncertain zeta(13.4 ± 0.8) + eta(8.51 ± 0.67)

   will not work because here the outermost function is ``+``, whose arguments
   are ``zeta(13.4 ± 0.8)`` and ``eta(8.51 ± 0.67)``, that however cannot be
   calculated.  You can use the ``@uncertain`` macro on each function
   separately:

   .. code-block:: julia

      julia> @uncertain(zeta(13.4 ± 0.8)) +  @uncertain(eta(8.51 ± 0.67))
      1.9974303172187315 ± 0.0012169293212062773

   The type of *all* the arguments provided must be ``Measurement``.  If one of
   the arguments is actually an exact number (so without uncertainty), promote
   it to ``Measurement`` type:

   .. code-block:: julia

      julia> atan2(10, 13.5 ± 0.8)
      0.6375487981386927 ± 0.028343666961913202

      julia> @uncertain atan2(10 ± 0, 13.5 ± 0.8)
      0.6375487981386927 ± 0.028343666962347438

   In addition, the function must be differentiable in all its arguments.  For
   example, the polygamma function of order :math:`m`, ``polygamma(m, x)``, is
   the :math:`m+1`-th derivative of the logarithm of gamma function, and is not
   differentiable in the first argument.  Not even the trick of passing an exact
   measurement would work, because the first argument must be an integer.  You
   can easily work around this limitation by wrapping the function in a
   single-argument function:

   .. code-block:: julia

      julia> @uncertain (x -> polygamma(0, x))(4.8 ± 0.2)
      1.4608477407291167 ± 0.046305812845734776

      julia> digamma(4.8 ± 0.2)   # Exact result
      1.4608477407291167 ± 0.04630581284451362

Complex Measurements
~~~~~~~~~~~~~~~~~~~~

Here are a few examples about uncertainty propagation of complex-valued
measurements.

.. code-block:: julia

   julia> u = complex(32.7 ± 1.1, -3.1 ± 0.2)

   julia> v = complex(7.6 ± 0.9, 53.2 ± 3.4)

   julia> 2u + v
   (73.0 ± 2.3769728648009427) + (47.0 ± 3.4234485537247377)im

   julia> sqrt(u * v)
   (33.004702573592 ± 1.0831254428098636) + (25.997507418428984 ± 1.1082833691607152)im

You can also verify the `Euler’s formula
<https://en.wikipedia.org/wiki/Euler%27s_formula>`__

.. code-block:: julia

   julia> cis(u)
   (6.27781144696534 ± 23.454542573739754) + (21.291738410228678 ± 8.112997844397572)im

   julia> cos(u) + sin(u)*im
   (6.277811446965339 ± 23.454542573739754) + (21.291738410228678 ± 8.112997844397572)im

Arbitrary Precision Calculations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you performed an exceptionally good experiment that gave you extremely
precise results (that is, with very low relative error), you may want to use
`arbitrary precision
<http://docs.julialang.org/en/stable/manual/integers-and-floating-point-numbers/#arbitrary-precision-arithmetic>`__
(or multiple precision) calculations, in order not to loose significance of the
experimental results.  Luckily, Julia natively supports this type of arithmetic
and so ``Measurements.jl`` does.  You only have to create ``Measurement``
objects with nominal value and uncertainty of type ``BigFloat``.

.. Tip::

   As explained in the `Julia documentation
   <http://docs.julialang.org/en/stable/stdlib/numbers/#Base.BigFloat>`__, it is
   better to use the ``big`` string literal to initialize an arbitrary precision
   floating point constant, instead of the ``BigFloat`` and ``big`` functions.
   See examples below.

For example, you want to measure a quantity that is the product of two
observables :math:`a` and :math:`b`, and the expected value of the product is
:math:`12.00000007`.  You measure :math:`a = 3.00000001 \pm (1\times 10^{-17})`
and :math:`b = 4.0000000100000001 \pm (1\times 10^{-17})` and want to compute
the standard score of the product with :func:`stdscore`.  Using the ability of
``Measurements.jl`` to perform arbitrary precision calculations you discover
that

.. code-block:: julia

   julia> a = big"3.00000001" ± big"1e-17"

   julia> b = big"4.0000000100000001" ± big"1e-17"

   julia> stdscore(a * b, big"12.00000007")
   7.999999997599999878080000420160000093695993825308195353920411656927305928530607

the measurement significantly differs from the expected value and you make a
great discovery.  Instead, if you used double precision accuracy, you would have
wrongly found that your measurement is consistent with the expected value:

.. code-block:: julia

   julia> stdscore((3.00000001 ± 1e-17)*(4.0000000100000001 ± 1e-17), 12.00000007)
   0.0

and you would have missed an important prize due to the use of an incorrect
arithmetic.

Of course, you can perform any mathematical operation supported in
``Measurements.jl`` using arbitrary precision arithmetic:

.. code-block:: julia

   julia> hypot(a, b)
   5.000000014000000080399999974880000423919999216953595312794907845334503498479533 ± 1.000000000000000000000000000000000000000000000000000000000000000000000000000009e-17

   julia> log(2a) ^ b
   1.030668110995484998145373137400169442058573718746529435800255440973153647087416e+01 ± 9.744450581349822034766870718391736028419817951565653507621645979913795265663606e-17

Operations with Arrays and Linear Algebra
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can create arrays of ``Measurement`` objects and perform mathematical
operations on them in the most natural way possible:

.. code-block:: julia

   julia> A = [1.03 ± 0.14, 2.88 ± 0.35, 5.46 ± 0.97]
   3-element Array{Measurements.Measurement{Float64},1}:
    1.03±0.14
    2.88±0.35
    5.46±0.97

   julia> B = [0.92 ± 0.11, 3.14 ± 0.42, 4.67 ± 0.58]
   3-element Array{Measurements.Measurement{Float64},1}:
    0.92±0.11
    3.14±0.42
    4.67±0.58

   julia> exp.(sqrt.(B)) .- log.(A)
   3-element Array{Measurements.Measurement{Float64},1}:
     2.57996±0.202151
     4.82484±0.707663
     6.98252±1.17829

   julia> @. cos(A) ^ 2 + sin(A) ^ 2
   3-element Array{Measurements.Measurement{Float64},1}:
       1.0±0.0
       1.0±0.0
       1.0±0.0

If you originally have separate arrays of values and uncertainties, you can
create an array of ``Measurement`` objects using ``measurement`` or ``±`` with
the `dot syntax
<http://docs.julialang.org/en/stable/manual/functions/#man-dot-vectorizing>`__
for vectorizing functions:

.. code-block:: julia

   julia> C = measurement.([174.9, 253.8, 626.3], [12.2, 19.4, 38.5])
   3-element Array{Measurements.Measurement{Float64},1}:
    174.9±12.2
    253.8±19.4
    626.3±38.5

   julia> sum(C)
   1055.0 ± 44.80457565918909

   julia> D = [549.4, 672.3, 528.5] .± [7.4, 9.6, 5.2]
   3-element Array{Measurements.Measurement{Float64},1}:
    549.4±7.4
    672.3±9.6
    528.5±5.2

   julia> mean(D)
   583.4 ± 4.396463225012679

.. Tip::

   ``prod`` and ``sum`` (and ``mean``, which relies on ``sum``) functions work
   out-of-the-box with any iterable of ``Measurement`` objects, like arrays or
   tuples.  However, these functions have faster methods (quadratic in the
   number of elements) when operating on an array of ``Measurement`` s than on a
   tuple (in this case the computational complexity is cubic in the number of
   elements), so you should use an array if performance is crucial for you, in
   particular for large collections of measurements.

Some `linear algebra <http://docs.julialang.org/en/stable/stdlib/linalg/>`__
functions work out-of-the-box, without defining specific methods for them.  For
example, you can solve linear systems, do matrix multiplication and dot product
between vectors, find inverse, determinant, and trace of a matrix, do LU and QR
factorization, etc.

.. code-block:: julia

   julia> A = [(14 ± 0.1) (23 ± 0.2); (-12 ± 0.3) (24 ± 0.4)]
   2×2 Array{Measurements.Measurement{Float64},2}:
     14.0±0.1  23.0±0.2
    -12.0±0.3  24.0±0.4

   julia> b = [(7 ± 0.5), (-13 ± 0.6)]
   2-element Array{Measurements.Measurement{Float64},1}:
      7.0±0.5
    -13.0±0.6

   # Solve the linear system Ax = b
   julia> x = A \ b
   2-element Array{Measurements.Measurement{Float64},1}:
     0.763072±0.0313571
    -0.160131±0.0177963

   # Verify this is the correct solution of the system
   julia> A * x ≈ b
   true

   julia> dot(x, b)
   7.423202614379084 ± 0.5981875954418516

   julia> det(A)
   611.9999999999999 ± 9.51262319236918

   julia> trace(A)
   38.0 ± 0.4123105625617661

   julia> A * inv(A) ≈ eye(A)
   true

   julia> lufact(A)
   Base.LinAlg.LU{Measurements.Measurement{Float64},Array{Measurements.Measurement{Float64},2}} with factors L and U:
   Measurements.Measurement{Float64}[1.0±0.0 0.0±0.0; -0.857143±0.0222861 1.0±0.0]
   Measurements.Measurement{Float64}[14.0±0.1 23.0±0.2; 0.0±0.0 43.7143±0.672403]

   julia> qrfact(A)
   Base.LinAlg.QR{Measurements.Measurement{Float64},Array{Measurements.Measurement{Float64},2}}(Measurements.Measurement{Float64}[-18.4391±0.209481 -1.84391±0.522154; -0.369924±0.00730266 33.1904±0.331267],Measurements.Measurement{Float64}[1.75926±0.00836088,0.0±0.0])

Derivative, Gradient and Uncertainty Components
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In order to propagate the uncertainties, ``Measurements.jl`` keeps track of the
partial derivative of an expression with respect to all independent measurements
from which the expression comes.  The package provides a convenient function,
:func:`Measurements.derivative`, that returns the partial derivative of an
expression with respect to independent measurements.  Its vectorized version can
be used to compute the gradient of an expression with respect to multiple
independent measurements.

.. code-block:: julia

   julia> x = 98.1 ± 12.7
   98.1 ± 12.7

   julia> y = 105.4 ± 25.6
   105.4 ± 25.6

   julia> z = 78.3 ± 14.1
   78.3 ± 14.1

   julia> Measurements.derivative(2x - 4y, x)
   2.0

   julia> Measurements.derivative(2x - 4y, y)
   -4.0

   julia> Measurements.derivative.(log1p(x) + y^2 - cos(x/y), [x, y, z])
   3-element Array{Float64,1}:
      0.0177005
    210.793
      0.0       # The expression does not depend on z

.. Tip::

   The vectorized version of :func:`Measurements.derivative` is useful in order
   to discover which variable contributes most to the total uncertainty of a
   given expression, if you want to minimize it.  This can be calculated as the
   `Hadamard (element-wise) product
   <https://en.wikipedia.org/wiki/Hadamard_product_%28matrices%29>`__ between
   the gradient of the expression with respect to the set of variables and the
   vector of uncertainties of the same variables in the same order.  For
   example:

   .. code-block:: julia

      julia> w = y^(3//4)*log(y) + 3x - cos(y/x)
      447.0410543780643 ± 52.41813324207829

      julia> abs.(Measurements.derivative.(w, [x, y]) .* Measurements.uncertainty.([x, y]))
      2-element Array{Float64,1}:
       37.9777
       36.1297

   In this case, the ``x`` variable contributes most to the uncertainty of
   ``w``.  In addition, note that the `Euclidean norm
   <https://en.wikipedia.org/wiki/Euclidean_norm>`__ of the Hadamard product
   above is exactly the total uncertainty of the expression:

   .. code-block:: julia

      julia> vecnorm(Measurements.derivative.(w, [x, y]) .* Measurements.uncertainty.([x, y]))
      52.41813324207829

   The :func:`Measurements.uncertainty_components` function simplifies
   calculation of all uncertainty components of a derived quantity:

   .. code-block:: julia

      julia> Measurements.uncertainty_components(w)
      Dict{Tuple{Float64,Float64,Float64},Float64} with 2 entries:
        (98.1, 12.7, 0.303638)  => 37.9777
        (105.4, 25.6, 0.465695) => 36.1297

      julia> vecnorm(collect(values(Measurements.uncertainty_components(w))))
      52.41813324207829

``stdscore`` Function
~~~~~~~~~~~~~~~~~~~~~

You can get the distance in number of standard deviations between a measurement
and its expected value (not a ``Measurement``) using :func:`stdscore`:

.. code-block:: julia

    julia> stdscore(1.3 ± 0.12, 1)
    2.5000000000000004

You can use the same function also to test the consistency of two measurements
by computing the standard score between their difference and zero.  This is what
:func:`stdscore` does when both arguments are ``Measurement`` objects:

.. code-block:: julia

   julia> stdscore((4.7 ± 0.58) - (5 ± 0.01), 0)
   -0.5171645175253433

   julia> stdscore(4.7 ± 0.58, 5 ± 0.01)
   -0.5171645175253433

``weightedmean`` Function
~~~~~~~~~~~~~~~~~~~~~~~~~

Calculate the weighted and arithmetic means of your set of measurements with
:func:`weightedmean` and ``mean`` respectively:

.. code-block:: julia

    julia> weightedmean((3.1±0.32, 3.2±0.38, 3.5±0.61, 3.8±0.25))
    3.4665384454054498 ± 0.16812474090663868

    julia> mean((3.1±0.32, 3.2±0.38, 3.5±0.61, 3.8±0.25))
    3.4000000000000004 ± 0.2063673908348894

``Measurements.value`` and ``Measurements.uncertainty`` Functions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use :func:`Measurements.value` and :func:`Measurements.uncertainty` to get the
values and uncertainties of measurements.  They work with real and complex
measurements, scalars or arrays:

.. code-block:: julia

   julia> Measurements.value(94.5 ± 1.6)
   94.5

   julia> Measurements.uncertainty(94.5 ± 1.6)
   1.6

   julia> Measurements.value.([complex(87.3 ± 2.9, 64.3 ± 3.0), complex(55.1 ± 2.8, -19.1 ± 4.6)])
   2-element Array{Complex{Float64},1}:
    87.3+64.3im
    55.1-19.1im

   julia> Measurements.uncertainty.([complex(87.3 ± 2.9, 64.3 ± 3.0), complex(55.1 ± 2.8, -19.1 ± 4.6)])
   2-element Array{Complex{Float64},1}:
    2.9+3.0im
    2.8+4.6im

Integration with ``QuadGK.jl``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The powerful integration routine ``quadgk`` from ``QuadGK.jl`` package is smart
enough to support out-of-the-box integrand functions that return arbitrary
types, including ``Measurement``:

.. code-block:: julia

   julia> QuadGK.quadgk(x -> exp(x / (4.73 ± 0.01)), 1, 7)
   (14.933307243306032 ± 0.009999988180463411, 0.0 ± 0.010017961523508253)

``Measurements.jl`` pushes the capabilities of ``quadgk`` further by supporting
also ``Measurement`` objects as endpoints:

.. code-block:: julia

   julia> QuadGK.quadgk(cos, 1.19 ± 0.02, 8.37 ± 0.05)
   (-0.05857827689796702 ± 0.02576650561689427, 2.547162480937004e-11)

Compare this with the expected result:

.. code-block:: julia

   julia> sin(8.37 ± 0.05) - sin(1.19 ± 0.02)
   -0.058578276897966686 ± 0.02576650561689427

Also with ``quadgk`` correlation is properly taken into account:

.. code-block:: julia

   julia> a = 6.42 ± 0.03
   6.42 ± 0.03

   julia> QuadGK.quadgk(sin, -a, a)
   (2.484178227707412e-17 ± 0.0, 0.0)

If instead the two endpoints have, by chance, the same nominal value and
uncertainty but are not correlated:

.. code-block:: julia

   julia> QuadGK.quadgk(sin, -6.42 ± 0.03, 6.42 ± 0.03)
   (2.484178227707412e-17 ± 0.005786464233000303, 0.0)

Use with ``SIUnits.jl`` and ``Unitful.jl``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can use ``Measurements.jl`` in combination with a third-party package in
order to perform calculations involving physical measurements, i.e.  numbers
with uncertainty and physical unit.  The details depend on the specific package
adopted.  Such packages are, for instance, `SIUnits.jl
<https://github.com/Keno/SIUnits.jl>`__ and `Unitful.jl
<https://github.com/ajkeller34/Unitful.jl>`__.  You only have to use the
``Measurement`` object as the value of the ``SIQuantity`` object (for
``SIUnits.jl``) or of the ``Quantity`` object (for ``Unitful.jl``).  Here are a
few examples.

.. code-block:: julia

   julia> using Measurements, SIUnits, SIUnits.ShortUnits

   julia> hypot((3 ± 1)*m, (4 ± 2)*m) # Pythagorean theorem
   5.0 ± 1.7088007490635064 m

   julia> (50 ± 1)Ω * (13 ± 2.4)*1e-2*A # Ohm's Law
   6.5 ± 1.20702112657567 kg m²s⁻³A⁻¹

   julia> 2pi*sqrt((5.4 ± 0.3)*m / ((9.81 ± 0.01)*m/s^2)) # Pendulum's  period
   4.661677707464357 ± 0.1295128435999655 s


   julia> using Measurements, Unitful

   julia> hypot((3 ± 1)*u"m", (4 ± 2)*u"m") # Pythagorean theorem
   5.0 ± 1.7088007490635064 m

   julia> (50 ± 1)*u"Ω" * (13 ± 2.4)*1e-2*u"A" # Ohm's Law
   6.5 ± 1.20702112657567 A Ω

   julia> 2pi*sqrt((5.4 ± 0.3)*u"m" / ((9.81 ± 0.01)*u"m/s^2")) # Pendulum's period
   4.661677707464357 ± 0.12951284359996548 s
