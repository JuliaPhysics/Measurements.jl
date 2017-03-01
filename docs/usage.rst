Usage
-----

After installing the package, you can start using it with

.. code-block:: julia

    using Measurements

The module defines a new ``Measurement`` data type. ``Measurement`` objects can
be created with the two following constructors:

.. function:: measurement(value, uncertainty)
.. function:: value ± uncertainty

where

- ``value`` is the nominal value of the measurement
- ``uncertainty`` is its uncertainty, assumed to be a `standard deviation
  <https://en.wikipedia.org/wiki/Standard_deviation>`__.

They are both subtype of ``AbstractFloat``.  Some keyboard layouts provide an
easy way to type the ``±`` sign, if your does not, remember you can insert it in
Julia REPL with ``\pm`` followed by ``TAB`` key.  You can provide ``value`` and
``uncertainty`` of any subtype of ``Real`` that can be converted to
``AbstractFloat``.  Thus, ``measurement(42, 33//12)`` and ``pi ± 0.1`` are
valid.

``measurement(value)`` creates a ``Measurement`` object with zero uncertainty,
like mathematical constants. See below for further examples.

.. Note::

   Every time you use one of the constructors above you define a *new
   independent* measurement.  Instead, when you perform mathematical operations
   involving ``Measurement`` objects you create a quantity that is not
   independent, but rather depends on really independent measurements.

Most mathematical operations are instructed, by `operator overloading
<https://en.wikipedia.org/wiki/Operator_overloading>`__, to accept
``Measurement`` type, and uncertainty is calculated exactly using analityc
expressions of functions’ derivatives.

In addition, it is possible to create a ``Complex`` measurement with
``complex(measurement(a, b), measurement(c, d))``.

This module extends many methods defined in Julia’s mathematical standard
library, and some methods from widespread third-party packages as well.  This is
the case for most special functions in `SpecialFunctions.jl
<https://github.com/JuliaMath/SpecialFunctions.jl>`__ package, and the
``quadgk`` integration routine from `QuadGK.jl
<https://github.com/JuliaMath/QuadGK.jl>`__ package.

Those interested in the technical details of the package, in order integrate the
package in their workflow, can have a look at the technical appendix.

.. function:: measurement(string)

``measurement`` function has also a method that enables you to create a
``Measurement`` object from a string.  See the `Examples`_ section for details.

.. Caution::

   The ``±`` infix operator is a convenient symbol to define quantities with
   uncertainty, but can lead to unexpected results if used in elaborate
   expressions involving many ``±``\ s. Use parantheses where appropriate to
   avoid confusion. See for example the following cases:

   .. code-block:: julia

       7.5±1.2 + 3.9±0.9 # This is wrong!
       # => 11.4 ± 1.2 ± 0.9 ± 0.0
       (7.5±1.2) + (3.9±0.9) # This is correct
       # => 11.4 ± 1.5

Correlation Between Variables
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The fact that two or more measurements are correlated means that there is some
sort of relationship beetween them.  In the context of measurements and error
propagation theory, the term "`correlation
<https://en.wikipedia.org/wiki/Correlation_and_dependence>`__" is very broad and
can indicate different things.  Among others, there may be some dependence
between uncertainties of different measurements with different values, or a
dependence between the values of two measurements while their uncertainties are
different.

Here, for correlation we mean the most simple case of functional relationship:
if :math:`x = \bar{x} \pm \sigma_x` is an independent measurement, a quantity
:math:`y = f(x) = \bar{y} \pm \sigma_y` that is function of :math:`x` is not
like an independent measurement but is a quantity that depends on :math:`x`, so
we say that :math:`y` is correlated with :math:`x`.  The package
``Measurements.jl`` is able to handle this type of correlation when propagating
the uncertainty for operations and functions taking two or more arguments.  As a
result, :math:`x - x = 0 \pm 0` and :math:`x/x = 1 \pm 0`.  If this correlation
was not accounted for, you would always get non-zero uncertainties even for
these operations that have exact results.  Two truly different measurements that
only by chance share the same nominal value and uncertainty are not treated as
correlated.

Propagate Uncertainty for Arbitrary Functions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. function:: @uncertain f(x, ...)

Existing functions implemented exclusively in Julia that accept
``AbstractFloat`` arguments will work out-of-the-box with ``Measurement``
objects as long as they internally use functions already supported by this
package.  However, there are functions that take arguments that are specific
subtypes of ``AbstractFloat``, or are implemented in such a way that does not
play nicely with ``Measurement`` variables.

The package provides the ``@uncertain`` macro that overcomes this limitation and
further extends the power of ``Measurements.jl``.

This macro allows you to propagate uncertainty in arbitrary functions, including
those based on `C/Fortran calls
<http://docs.julialang.org/en/stable/manual/calling-c-and-fortran-code/>`__,
that accept any number of real arguments.  The macro exploits ``derivative`` and
``gradient`` functions from `Calculus
<https://github.com/johnmyleswhite/Calculus.jl>`__ package in order to perform
numerical differentiation.

Derivative and Gradient
~~~~~~~~~~~~~~~~~~~~~~~

.. function:: Measurements.derivative(y::Measurement, x::Measurement)

In order to propagate the uncertainties, ``Measurements.jl`` keeps track of the
partial derivative of an expression with respect to all independent measurements
from which the expression comes.  For this reason, the package provides a
convenient function, ``Measurements.derivative``, to get the partial derivative
and the gradient of an expression with respect to independent measurements.

Uncertainty Contribution
~~~~~~~~~~~~~~~~~~~~~~~~

.. function:: Measurements.uncertainty_components(x::Measurement)

You may want to inspect which measurement contributes most to the total
uncertainty of a derived quantity, in order to minimize it, if possible.  The
function ``Measurements.uncertainty_components`` gives you a dictonary whose
values are the components of the uncertainty of ``x``.

Standard Score
~~~~~~~~~~~~~~

.. function:: stdscore(measure::Measurement, expected_value) -> standard_score
.. function:: stdscore(measure_1::Measurement, measure_2::Measurement) -> standard_score

The ``stdscore`` function is available to calculate the `standard score
<https://en.wikipedia.org/wiki/Standard_score>`__ between a measurement and its
expected value (not a ``Measurement``).  When both arguments are ``Measurement``
objects, the standard score between their difference and zero is computed, in
order to test their compatibility.

Weighted Average
~~~~~~~~~~~~~~~~

.. function:: weightedmean(iterable) -> weighted_mean

``weightedmean`` function gives the `weighted mean
<https://en.wikipedia.org/wiki/Weighted_arithmetic_mean>`__ of a set of
measurements using `inverses of variances as weights
<https://en.wikipedia.org/wiki/Inverse-variance_weighting>`__.  Use ``mean`` for
the simple arithmetic mean.

Access Nominal Value and Uncertainty
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. function:: Measurements.value(x)
.. function:: Measurements.uncertainty(x)

As explained in the technical appendix, the nominal value and the uncertainty of
``Measurement`` objects are stored in ``val`` and ``err`` fields respectively,
but you do not need to use those field directly to access this information.
Functions ``Measurements.value`` and ``Measurements.uncertainty`` allow you to
get the nominal value and the uncertainty of ``x``, be it a single measurement
or an array of measurements.  They are particularly useful in the case of
complex measurements or arrays of measurements.

Error Propagation of Numbers with Units
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

``Measurements.jl`` does not know about `units of measurements
<https://en.wikipedia.org/wiki/Units_of_measurement>`__, but can be easily
employed in combination with other Julia packages providing this feature.
Thanks to the `type system
<http://docs.julialang.org/en/stable/manual/types/>`__ of Julia programming
language this integration is seamless and comes for free, no specific work has
been done by the developer of the present package nor by the developers of the
above mentioned packages in order to support their interplay.  They all work
equally good with ``Measurements.jl``, you can choose the library you prefer and
use it.  Note that only `algebraic functions
<https://en.wikipedia.org/wiki/Algebraic_operation>`__ are allowed to operate
with numbers with units of measurement, because `transcendental functions
<https://en.wikipedia.org/wiki/Transcendental_function>`__ operate on
`dimensionless quantities
<https://en.wikipedia.org/wiki/Dimensionless_quantity>`__.  In the Examples
section you will find how this feature works with a couple of packages.

Printing to TeX and LaTeX MIMEs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can print ``Measurement`` objects to TeX and LaTeX MIMES (``"text/x-tex"``
and ``"text/x-latex"``), the ``±`` sign will be rendered with ``\pm`` command:

.. code-block:: julia

   julia> display("text/x-tex", 5±1)
   5.0 \pm 1.0

   julia> display("text/x-latex", pi ± 1e-3)
   3.141592653589793 \pm 0.001
