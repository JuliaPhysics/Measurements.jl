Examples
--------

These are the some basic examples of use of the package:

.. code-block:: julia

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

Correlation Between Variables
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Here you can see examples of how correlated variables are treated within the
package:

.. code-block:: julia

    x = 8.4 ± 0.7
    x - x
    # => 0.0 ± 0.0
    x/x
    # => 1.0 ± 0.0
    x*x*x - x^3
    # => 0.0 ± 0.0
    sin(x)/cos(x) - tan(x)
    # => -2.220446049250313e-16 ± 0.0 # They are equal within numerical accuracy

You will get similar results for a variable that is a function of an already
existing ``Measurement`` object:

.. code-block:: julia

    u = 2x
    (x + x) - u
    # => 0.0 ± 0.0
    u/2x
    # => 1.0 ± 0.0
    u^3 - 8x^3
    # => 0.0 ± 0.0
    cos(x)^2 - (1 + cos(u))/2
    # => 0.0 ± 0.0

A variable that has the same nominal value and uncertainty as ``u`` above but is
not correlated with ``x`` will give different outcomes:

.. code-block:: julia

    # Define a new measurement but with same nominal value
    # and uncertainty as u, so v is not correlated with x
    v = 16.8 ± 1.4
    (x + x) - v
    # => 0.0 ± 1.979898987322333
    v/2x
    # => 1.0 ± 0.11785113019775792
    v^3 - 8x^3
    # => 0.0 ± 1676.4200705455657
    cos(x)^2 - (1 + cos(v))/2
    # => 0.0 ± 0.8786465354843539

``@uncertain`` Macro
~~~~~~~~~~~~~~~~~~~~

Macro ``@uncertain`` can be used to propagate uncertainty in arbitrary real
functions of one or two real arguments, even in functions not natively supported
by this package.

.. code-block:: julia

    @uncertain zeta(2 ± 0.13)
    # => 1.6449340668482273 ± 0.12188127308075564
    @uncertain log(9.4 ± 1.3, 58.8 ± 3.7)
    # => 1.8182372640255153 ± 0.11568300475873611
    log(9.4 ± 1.3, 58.8 ± 3.7)
    # => 1.8182372640255153 ± 0.11568300475593848

The type of all the arguments provided must be ``Measurement``. If one of the
arguments is actually an exact number (so without uncertainty), convert it to
``Measurement`` type:

.. code-block:: julia

    atan2(10, 13.5 ± 0.8)
    # => 0.6375487981386927 ± 0.028343666961913202
    @uncertain atan2(10 ± 0, 13.5 ± 0.8)
    # => 0.6375487981386927 ± 0.028343666962347438

The function must be differentiable in all its arguments.  For example, the
scaled first derivative of the Airy Ai function :math:`\text{airyx}(1, z) =
\exp((2/3) x \sqrt{x})\text{Ai}'(x)` is not differentiable in the first
argument, not even the trick of passing an exact measurement would work because
the first argument must be an integer.  You can easily work around this
limtation by wrapping the function in a single-argument function

.. code-block:: julia

    @uncertain (x-> airyx(1, x))(4.8 ± 0.2)
    # => -0.42300740589773583 ± 0.004083414330362105

The `anonymous function
<http://docs.julialang.org/en/stable/manual/functions/#anonymous-functions>`__
allows you to avoid defining a brand-new wrapping function before using it.

The macro works with functions calling C/Fortran functions as well.  For
example, `Cuba.jl <https://github.com/giordano/Cuba.jl>`__ package performs
numerical integration by wrapping the C `Cuba <http://www.feynarts.de/cuba/>`__
library.  You can define a function to numerically compute with ``Cuba.jl`` the
integral defining the `error function
<https://en.wikipedia.org/wiki/Error_function>`__ and pass it to ``@uncertain``
macro

.. code-block:: julia

    using Cuba
    cubaerf(x::Real) =
        2x/sqrt(pi)*Cuhre((t, f) -> f[1] = exp(-abs2(t[1]*x)), 1, 1)[1][1]
    @uncertain cubaerf(0.5 ± 0.01)
    # => 0.5204998778130466 ± 0.008787825789336267

(also here you can use an anonymous function, do it as an exercise).  Compare
the result with that of the ``erf`` function, natively supported in
``Measurements.jl`` package:

.. code-block:: julia

    erf(0.5 ± 0.01)
    # => 0.5204998778130465 ± 0.008787825789354449

Complex Measurements
~~~~~~~~~~~~~~~~~~~~

Here are a few examples about uncertainty propagation of complex-valued
measurements.

.. code-block:: julia

    u = complex(32.7 ± 1.1, -3.1 ± 0.2)
    v = complex(7.6 ± 0.9, 53.2 ± 3.4)
    2u+v
    # => (73.0 ± 2.3769728648009427) + (47.0 ± 3.4234485537247377)*im
    sqrt(u*v)
    # => (33.004702573592 ± 1.0831254428098636) + (25.997507418428984 ± 1.1082833691607152)*im
    gamma(u/v)
    # => (-0.25050193836584694 ± 0.011473098558745594) + (1.2079738483289788 ± 0.133606565257322)*im

You can also verify the `Euler’s formula
<https://en.wikipedia.org/wiki/Euler%27s_formula>`__

.. code-block:: julia

    cis(u)
    # => (6.27781144696534 ± 23.454542573739754) + (21.291738410228678 ± 8.112997844397572)*im
    cos(u) + sin(u)*im
    # => (6.277811446965339 ± 23.454542573739754) + (21.291738410228678 ± 8.112997844397572)im

Arbitrary Precision Calculations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`Arbitrary precision calculations
<http://docs.julialang.org/en/stable/manual/integers-and-floating-point-numbers/#arbitrary-precision-arithmetic>`__
involving quantities that are intrinsically imprecise may not be very useful,
but Julia natively supports this type of arithmetic and so ``Measurements.jl``
does.  You only have to create ``Measurement`` objects with nominal value and/or
uncertainty of type ``BigFloat`` (or ``BigInt`` as well, actually):

.. code-block:: julia

    a = BigInt(3) ± 0.01
    b = 4 ± 0.03
    hypot(a, b)
    # => 5.000000000000000000000000000000000000000000000000000000000000000000000000000000 ± 2.473863375370596246756154793364399326509001412701084709723336101627452857843757e-02
    log(2a)^b
    # => 1.030668097314957384421465902631648727333270687596715387736946157489404400228445e+01 ± 1.959580475953079233643030915452927748488408893913287402297342303952280925878254e-01

Arrays of Measurements
~~~~~~~~~~~~~~~~~~~~~~

You can create arrays of ``Measurement`` objects and perform mathematical
operations on them:

.. code-block:: julia

    A = [1.03 ± 0.14, 2.88 ± 0.35, 5.46 ± 0.97]
    B = [0.92 ± 0.11, 3.14 ± 0.42, 4.67 ± 0.58]
    exp(sqrt(B)) - log(A)
    # => 3-element Array{Measurements.Measurement{Float64},1}:
    #     2.5799612193837493 ± 0.20215123893809778
    #     4.824843081566397 ± 0.7076631767039828
    #     6.982522998771525 ± 1.178287422979362
    cos(A).^2 + sin(A).^2
    # 3-element Array{Measurements.Measurement{Float64},1}:
    #     1.0 ± 0.0
    #     1.0 ± 0.0
    #     1.0 ± 0.0
    sum(A)
    # => 9.370000000000001 ± 1.0406728592598156
    mean(B - A)
    # => -0.21333333333333326 ± 0.42267665603337445

Derivative and Gradient
~~~~~~~~~~~~~~~~~~~~~~~

In order to propagate the uncertainties, ``Measurements.jl`` keeps track of the
total derivative of an expression with respect to all independent measurements
from which the expression comes. The package provides two convenient functions,
``Measurements.derivative`` and ``Measurements.gradient``, that return the total
derivative and the gradient of an expression with respect to independent
measurements.

.. code-block:: julia

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

``stdscore`` Function
~~~~~~~~~~~~~~~~~~~~~

You can get the distance in number of standard deviations between a measurement
and its expected value (this can be with or without uncertainty) using
``stdscore``:

.. code-block:: julia

    stdscore(1.3 ± 0.12, 1)
    # => 2.5000000000000004
    stdscore(4.7 ± 0.58, 5 ± 0.01)
    # => -0.5172413793103445 ± 0.017241379310344827

``weightedmean`` Function
~~~~~~~~~~~~~~~~~~~~~~~~~

Calculate the weighted and arithmetic means of your set of measurements with
``weightedmean`` and ``mean`` respectively:

.. code-block:: julia

    weightedmean((3.1±0.32, 3.2±0.38, 3.5±0.61, 3.8±0.25))
    # => 3.4665384454054498 ± 0.16812474090663868
    mean((3.1±0.32, 3.2±0.38, 3.5±0.61, 3.8±0.25))
    # => 3.4000000000000004 ± 0.2063673908348894
