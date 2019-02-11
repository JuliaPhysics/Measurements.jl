var documenterSearchIndex = {"docs": [

{
    "location": "#",
    "page": "Introduction",
    "title": "Introduction",
    "category": "page",
    "text": ""
},

{
    "location": "#Measurements.jl-1",
    "page": "Introduction",
    "title": "Measurements.jl",
    "category": "section",
    "text": ""
},

{
    "location": "#What-Is-This-Package-Useful-For?-1",
    "page": "Introduction",
    "title": "What Is This Package Useful For?",
    "category": "section",
    "text": "(Image: image)Image credit: \"xkcd\" (CC-BY-NC 2.5)Measurements.jl relieves you from the hassle of propagating uncertainties coming from physical measurements, when performing mathematical operations involving them.  The linear error propagation theory is employed to propagate the errors.This library is written in Julia, a modern high-level, high-performance dynamic programming language designed for technical computing.When used in the Julia interactive session, it can serve also as an easy-to-use calculator."
},

{
    "location": "#Features-List-1",
    "page": "Introduction",
    "title": "Features List",
    "category": "section",
    "text": "The main features of the package are:Support for most mathematical operations available in Julia standard library and special functions from SpecialFunctions.jl package, involving real and complex numbers. All existing functions that accept AbstractFloat (and Complex{AbstractFloat} as well) arguments and internally use already supported functions can in turn perform calculations involving numbers with uncertainties without being redefined. This greatly enhances the power of Measurements.jl without effort for the users\nFunctional correlation between variables is correctly handled, so x - x approx 0 pm 0, xx approx 1 pm 0, tan(x) approx sin(x)cos(x), mathrmcis(x) approx exp(ix), etc...\nSupport for arbitrary precision (also called multiple precision) numbers with uncertainties. This is useful for measurements with very low relative error\nDefine arrays of measurements and perform calculations with them.  Some linear algebra functions work out-of-the-box\nPropagate uncertainty for any function of real arguments (including functions based on C/Fortran calls), using @uncertain macro\nFunction to get the derivative and the gradient of an expression with respect to one or more independent measurements\nFunctions to calculate standard score and weighted mean\nParse strings to create measurement objects\nEasy way to attach the uncertainty to a number using the ± sign as infix operator. This syntactic sugar makes the code more readable and visually appealing\nCombined with external packages allows for error propagation of measurements with their physical units\nExtensible in combination with external packages: you can propagate errors of measurements with their physical units, perform numerical integration with QuadGK.jl, numerical and automatic differentiation, and much more.\nIntegration with Plots.jl."
},

{
    "location": "#Citation-and-license-1",
    "page": "Introduction",
    "title": "Citation and license",
    "category": "section",
    "text": "The method used to handle functional correlation is described in this paper:M. Giordano, 2016, \"Uncertainty propagation with functionally correlated quantities\", arXiv:1610.08716 (Bibcode: 2016arXiv161008716G)If you use use this package for your research, please cite it.Other features are expected to come in the future, see the How Can I Help? section.The Measurements.jl package is licensed under the MIT \"Expat\" License. The original author is Mosè Giordano."
},

{
    "location": "installation/#",
    "page": "Installation",
    "title": "Installation",
    "category": "page",
    "text": ""
},

{
    "location": "installation/#Installation-1",
    "page": "Installation",
    "title": "Installation",
    "category": "section",
    "text": "The latest version of Measurements.jl is available for Julia v1.0 and later releases, and can be installed with Julia built-in package manager.  In a Julia session run the commandspkg> update\npkg> add MeasurementsOlder versions of this package are also available for Julia 0.4-0.7."
},

{
    "location": "usage/#",
    "page": "Usage",
    "title": "Usage",
    "category": "page",
    "text": ""
},

{
    "location": "usage/#Measurements.measurement",
    "page": "Usage",
    "title": "Measurements.measurement",
    "category": "function",
    "text": "measurement(val::Real, [err::Real]) -> Measurement\nval ± err -> Measurement\n\nReturn a Measurement object with val as nominal value and err as uncertainty.  err defaults to 0 if omitted.\n\nThe binary operator ± is equivalent to measurement, so you can construct a Measurement object by explicitely writing 123 ± 4.\n\n\n\n\n\n"
},

{
    "location": "usage/#Measurements.measurement-Tuple{AbstractString}",
    "page": "Usage",
    "title": "Measurements.measurement",
    "category": "method",
    "text": "measurement(string) -> Measurement{Float64}\n\nParse the string and return a Measurement{Float64} object.\n\nExamples of valid strings and the resulting Measurement{Float64} are:\n\njulia> measurement(\"-123.4(56)\")\n-123.4 ± 5.6\n\njulia> measurement(\"+1234(56)e-1\")\n123.4 ± 5.6\n\njulia> measurement(\"12.34e-1 +- 0.56e1\")\n1.2 ± 5.6\n\njulia> measurement(\"(-1.234 ± 0.056)e2\")\n-123.4 ± 5.6\n\njulia> measurement(\"1234e-1 +/- 5.6e0\")\n123.4 ± 5.6\n\njulia> measurement(\"-1234e-1\")\n-123.4 ± 0.0\n\n\n\n\n\n"
},

{
    "location": "usage/#Usage-1",
    "page": "Usage",
    "title": "Usage",
    "category": "section",
    "text": "DocTestSetup = quote\n    using Measurements\nendAfter installing the package, you can start using it withusing MeasurementsThe module defines a new Measurement data type. Measurement objects can be created with the two following constructors:Measurements.measurementwhereval is the nominal value of the measurement\nerr is its uncertainty, assumed to be a standard deviation.They are both subtype of AbstractFloat. Some keyboard layouts provide an easy way to type the ± sign, if your does not, remember you can insert it in Julia REPL with \\pm followed by TAB key. You can provide val and err of any subtype of Real that can be converted to AbstractFloat. Thus, measurement(42, 33//12) and pi ± 0.1 are valid.measurement(value) creates a Measurement object with zero uncertainty, like mathematical constants. See below for further examples.note: Note\nEvery time you use one of the constructors above you define a new independent measurement. Instead, when you perform mathematical operations involving Measurement objects you create a quantity that is not independent, but rather depends on really independent measurements.Most mathematical operations are instructed, by operator overloading, to accept Measurement type, and uncertainty is calculated exactly using analityc expressions of functions\' derivatives.It is also possible to create a Complex measurement withcomplex(measurement(real_part_value, real_part_uncertainty),\n        measurement(imaginary_part_value, imaginary_part_uncertainty))In addition to making the code prettier, the fact that the ± sign can be used as infix operator to define new independent Measurement s makes the printed representation of these objects valid Julia syntax, so you can quickly copy the output of an operation in the Julia REPL to perform other calculations. Note however that the copied number will not be the same object as the original one, because it will be a new independent measurement, without memory of the correlations of the original object.This module extends many methods defined in Julia\'s mathematical standard library, and some methods from widespread third-party packages as well. This is the case for most special functions in SpecialFunctions.jl package, and the quadgk integration routine from QuadGK.jl package.Those interested in the technical details of the package, in order integrate the package in their workflow, can have a look at the technical appendix.Measurements.measurement(::AbstractString)measurement function has also a method that enables you to create a Measurement object from a string.warning: Caveat about the ± sign\nThe ± infix operator is a convenient symbol to define quantities with uncertainty, but can lead to unexpected results if used in elaborate expressions involving many ±s. Use parantheses where appropriate to avoid confusion. See for example the following cases:julia> 7.5±1.2 + 3.9±0.9 # This is wrong!\n11.4 ± 1.2 ± 0.9 ± 0.0\n\njulia> (7.5±1.2) + (3.9±0.9) # This is correct\n11.4 ± 1.5"
},

{
    "location": "usage/#Correlation-Between-Variables-1",
    "page": "Usage",
    "title": "Correlation Between Variables",
    "category": "section",
    "text": "The fact that two or more measurements are correlated means that there is some sort of relationship beetween them. In the context of measurements and error propagation theory, the term \"correlation\" is very broad and can indicate different things. Among others, there may be some dependence between uncertainties of different measurements with different values, or a dependence between the values of two measurements while their uncertainties are different.Here, for correlation we mean the most simple case of functional relationship: if x = barx pm sigma_x is an independent measurement, a quantity y = f(x) = bary pm sigma_y that is function of x is not like an independent measurement but is a quantity that depends on x, so we say that y is correlated with x. The package Measurements.jl is able to handle this type of correlation when propagating the uncertainty for operations and functions taking two or more arguments. As a result, x - x = 0 pm 0 and xx = 1 pm 0.  If this correlation was not accounted for, you would always get non-zero uncertainties even for these operations that have exact results. Two truly different measurements that only by chance share the same nominal value and uncertainty are not treated as correlated."
},

{
    "location": "usage/#Measurements.@uncertain",
    "page": "Usage",
    "title": "Measurements.@uncertain",
    "category": "macro",
    "text": "@uncertain f(value ± stddev, ...)\n\nA macro to calculate f(value) ± uncertainty, with uncertainty derived from stddev according to rules of linear error propagation theory.\n\nFunction f can accept any number of real arguments.\n\n\n\n\n\n"
},

{
    "location": "usage/#Propagate-Uncertainty-for-Arbitrary-Functions-1",
    "page": "Usage",
    "title": "Propagate Uncertainty for Arbitrary Functions",
    "category": "section",
    "text": "Measurements.@uncertainExisting functions implemented exclusively in Julia that accept AbstractFloat arguments will work out-of-the-box with Measurement objects as long as they internally use functions already supported by this package. However, there are functions that take arguments that are specific subtypes of AbstractFloat, or are implemented in such a way that does not play nicely with Measurement variables.The package provides the @uncertain macro that overcomes this limitation and further extends the power of Measurements.jl.This macro allows you to propagate uncertainty in arbitrary functions, including those based on C/Fortran calls, that accept any number of real arguments. The macro exploits derivative and gradient functions from Calculus package in order to perform numerical differentiation."
},

{
    "location": "usage/#Measurements.derivative",
    "page": "Usage",
    "title": "Measurements.derivative",
    "category": "function",
    "text": "derivative(x::Measurement, y::Measurement)\n\nReturn the value of the partial derivative of x with respect to the independent measurement y, calculated on the nominal value of y.  Return zero if x does not depend on y.\n\nUse Measurements.derivative.(x, array) to calculate the gradient of x with respect to an array of independent measurements.\n\n\n\n\n\n"
},

{
    "location": "usage/#Derivative-and-Gradient-1",
    "page": "Usage",
    "title": "Derivative and Gradient",
    "category": "section",
    "text": "Measurements.derivativeIn order to propagate the uncertainties, Measurements.jl keeps track of the partial derivative of an expression with respect to all independent measurements from which the expression comes. For this reason, the package provides a convenient function, Measurements.derivative, to get the partial derivative and the gradient of an expression with respect to independent measurements."
},

{
    "location": "usage/#Measurements.uncertainty_components",
    "page": "Usage",
    "title": "Measurements.uncertainty_components",
    "category": "function",
    "text": "Measurements.uncertainty_components(x::Measurement)\n\nReturn the components to the uncertainty of the dependent quantity x in the form of a Dict.\n\n\n\n\n\n"
},

{
    "location": "usage/#Uncertainty-Contribution-1",
    "page": "Usage",
    "title": "Uncertainty Contribution",
    "category": "section",
    "text": "Measurements.uncertainty_componentsYou may want to inspect which measurement contributes most to the total uncertainty of a derived quantity, in order to minimize it, if possible.  The function Measurements.uncertainty_components gives you a dictonary whose values are the components of the uncertainty of x."
},

{
    "location": "usage/#Measurements.stdscore",
    "page": "Usage",
    "title": "Measurements.stdscore",
    "category": "function",
    "text": "stdscore(measure::Measurement, expected_value::Real) -> standard_score\n\nGives the standard score between a measure, with uncertainty, and its expected value:\n\n(measure.val - expected_value)/measure.err\n\n\n\n\n\nstdscore(measure_1::Measurement, measure_2::Measurement) -> standard_score\n\nGives the standard score between two measurements (both with uncertainty) computed as the standard score between their difference and 0:\n\nstdscore(measure_1 - measure_2, 0)\n\n\n\n\n\n"
},

{
    "location": "usage/#Standard-Score-1",
    "page": "Usage",
    "title": "Standard Score",
    "category": "section",
    "text": "Measurements.stdscoreThe stdscore function is available to calculate the standard score between a measurement and its expected value (not a Measurement). When both arguments are Measurement objects, the standard score between their difference and zero is computed, in order to test their compatibility."
},

{
    "location": "usage/#Measurements.weightedmean",
    "page": "Usage",
    "title": "Measurements.weightedmean",
    "category": "function",
    "text": "weightedmean(iterable) -> measurement(weighted_mean, standard_deviation)\n\nReturn the weighted mean of measurements listed in iterable, using inverse-variance weighting.  NOTA BENE: correlation is not taken into account.\n\n\n\n\n\n"
},

{
    "location": "usage/#Weighted-Average-1",
    "page": "Usage",
    "title": "Weighted Average",
    "category": "section",
    "text": "Measurements.weightedmeanweightedmean function gives the weighted mean of a set of measurements using inverses of variances as weights. Use mean for the simple arithmetic mean."
},

{
    "location": "usage/#Measurements.value",
    "page": "Usage",
    "title": "Measurements.value",
    "category": "function",
    "text": "Measurements.value(x::Measurement)\nMeasurements.value(x::Complex{Measurement})\n\nReturn the nominal value of measurement x.\n\n\n\n\n\n"
},

{
    "location": "usage/#Measurements.uncertainty",
    "page": "Usage",
    "title": "Measurements.uncertainty",
    "category": "function",
    "text": "Measurements.uncertainty(x::Measurement)\nMeasurements.uncertainty(x::Complex{Measurement})\n\nReturn the uncertainty of measurement x.\n\n\n\n\n\n"
},

{
    "location": "usage/#Access-Nominal-Value-and-Uncertainty-1",
    "page": "Usage",
    "title": "Access Nominal Value and Uncertainty",
    "category": "section",
    "text": "Measurements.value\nMeasurements.uncertaintyAs explained in the technical appendix, the nominal value and the uncertainty of Measurement objects are stored in val and err fields respectively, but you do not need to use those field directly to access this information. Functions Measurements.value and Measurements.uncertainty allow you to get the nominal value and the uncertainty of x, be it a single measurement or an array of measurements. They are particularly useful in the case of complex measurements or arrays of measurements."
},

{
    "location": "usage/#Error-Propagation-of-Numbers-with-Units-1",
    "page": "Usage",
    "title": "Error Propagation of Numbers with Units",
    "category": "section",
    "text": "Measurements.jl does not know about units of measurements, but can be easily employed in combination with other Julia packages providing this feature. Thanks to the type system of Julia programming language this integration is seamless and comes for free, no specific work has been done by the developer of the present package nor by the developers of the above mentioned packages in order to support their interplay. They all work equally good with Measurements.jl, you can choose the library you prefer and use it. Note that only algebraic functions are allowed to operate with numbers with units of measurement, because transcendental functions operate on dimensionless quantities. In the Examples section you will find how this feature works with a couple of packages."
},

{
    "location": "usage/#Representation-of-Measurements-1",
    "page": "Usage",
    "title": "Representation of Measurements",
    "category": "section",
    "text": ""
},

{
    "location": "usage/#Measurements-in-the-REPL-1",
    "page": "Usage",
    "title": "Measurements in the REPL",
    "category": "section",
    "text": "When working in the Julia REPL, Measurement objects are shown truncated in order to present two significant digits for the uncertainty:julia> -84.32 ± 5.6\n-84.3 ± 5.6\n\njulia> 7.9 ± 18.6\n8.0 ± 19.0Note that truncation only affects the numbers shown in the REPL:julia> Measurements.value(7.9 ± 18.6)\n7.9\n\njulia> Measurements.uncertainty(7.9 ± 18.6)\n18.6"
},

{
    "location": "usage/#Printing-to-TeX-and-LaTeX-MIMEs-1",
    "page": "Usage",
    "title": "Printing to TeX and LaTeX MIMEs",
    "category": "section",
    "text": "You can print Measurement objects to TeX and LaTeX MIMES (\"text/x-tex\" and \"text/x-latex\"), the ± sign will be rendered with \\pm command:julia> repr(\"text/x-tex\", 5±1)\n\"5.0 \\\\pm 1.0\"\n\njulia> repr(\"text/x-latex\", pi ± 1e-3)\n\"3.1416 \\\\pm 0.001\""
},

{
    "location": "examples/#",
    "page": "Examples",
    "title": "Examples",
    "category": "page",
    "text": ""
},

{
    "location": "examples/#Examples-1",
    "page": "Examples",
    "title": "Examples",
    "category": "section",
    "text": "DocTestSetup = quote\n    using Measurements, SpecialFunctions, QuadGK\nendThese are some basic examples of use of the package:julia> using Measurements\n\njulia> a = measurement(4.5, 0.1)\n4.5 ± 0.1\n\njulia> b = 3.8 ± 0.4\n3.8 ± 0.4\n\njulia> 2a + b\n12.8 ± 0.45\n\njulia> a - 1.2b\n-0.06 ± 0.49\n\njulia> l = measurement(0.936, 1e-3);\n\njulia> T = 1.942 ± 4e-3;\n\njulia> g = 4pi^2*l/T^2\n9.798 ± 0.042\n\njulia> c = measurement(4)\n4.0 ± 0.0\n\njulia> a*c\n18.0 ± 0.4\n\njulia> sind(94 ± 1.2)\n0.9976 ± 0.0015\n\njulia> x = 5.48 ± 0.67;\n\njulia> y = 9.36 ± 1.02;\n\njulia> log(2x^2 - 3.4y)\n3.34 ± 0.53\n\njulia> atan(y, x)\n1.041 ± 0.071"
},

{
    "location": "examples/#Measurements-from-Strings-1",
    "page": "Examples",
    "title": "Measurements from Strings",
    "category": "section",
    "text": "You can construct Measurement{Float64} objects from strings. Within parentheses there is the uncertainty referred to the corresponding last digits.julia> measurement(\"-12.34(56)\")\n-12.34 ± 0.56\n\njulia> measurement(\"+1234(56)e-2\")\n12.34 ± 0.56\n\njulia> measurement(\"123.4e-1 +- 0.056e1\")\n12.34 ± 0.56\n\njulia> measurement(\"(-1.234 ± 0.056)e1\")\n-12.34 ± 0.56\n\njulia> measurement(\"1234e-2 +/- 0.56e0\")\n12.34 ± 0.56\n\njulia> measurement(\"-1234e-2\")\n-12.34 ± 0.0It is also possible to use parse(Measurement{T}, string) to parse the string as a Measurement{T}, with T<:AbstractFloat. This has been tested with standard numeric floating types (Float16, Float32, Float64, and BigFloat).julia> parse(Measurement{Float16}, \"19.5 ± 2.8\")\n19.5 ± 2.8\n\njulia> parse(Measurement{Float32}, \"-7.6 ± 0.4\")\n-7.6 ± 0.4\n\njulia> parse(Measurement{Float64}, \"4 ± 1.3\")\n4.0 ± 1.3\n\njulia> parse(Measurement{BigFloat}, \"+5.1 ± 3.3\")\n5.099999999999999999999999999999999999999999999999999999999999999999999999999986 ± 3.299999999999999999999999999999999999999999999999999999999999999999999999999993"
},

{
    "location": "examples/#Correlation-Between-Variables-1",
    "page": "Examples",
    "title": "Correlation Between Variables",
    "category": "section",
    "text": "Here you can see examples of how functionally correlated variables are treated within the package:julia> x = 8.4 ± 0.7\n8.4 ± 0.7\n\njulia> x - x\n0.0 ± 0.0\njulia> x/x\n1.0 ± 0.0\n\njulia> x*x*x - x^3\n0.0 ± 0.0\n\njulia> sin(x)/cos(x) - tan(x) # They are equal within numerical accuracy\n-2.220446049250313e-16 ± 0.0\n\njulia> y = -5.9 ± 0.2;\n\njulia> beta(x, y) - gamma(x)*gamma(y)/gamma(x + y)\n2.8e-14 ± 4.0e-14You will get similar results for a variable that is a function of an already existing Measurement object:julia> x = 8.4 ± 0.7;\n\njulia> u = 2x;\n\njulia> (x + x) - u\n0.0 ± 0.0\n\njulia> u/2x\n1.0 ± 0.0\n\njulia> u^3 - 8x^3\n0.0 ± 0.0\n\njulia> cos(x)^2 - (1 + cos(u))/2\n0.0 ± 0.0A variable that has the same nominal value and uncertainty as u above but is not functionally correlated with x will give different outcomes:julia> x = 8.4 ± 0.7;\n\njulia> v = 16.8 ± 1.4;\n\njulia> (x + x) - v\n0.0 ± 2.0\n\njulia> v / 2x\n1.0 ± 0.12\n\njulia> v^3 - 8x^3\n0.0 ± 1700.0\n\njulia> cos(x)^2 - (1 + cos(v))/2\n0.0 ± 0.88"
},

{
    "location": "examples/#@uncertain-Macro-1",
    "page": "Examples",
    "title": "@uncertain Macro",
    "category": "section",
    "text": "Macro @uncertain can be used to propagate uncertainty in arbitrary real or complex functions of real arguments, including functions not natively supported by this package.julia> @uncertain (x -> complex(zeta(x), exp(eta(x)^2)))(2 ± 0.13)\n(1.64 ± 0.12) + (1.967 ± 0.043)im\n\njulia> @uncertain log(9.4 ± 1.3, 58.8 ± 3.7)\n1.82 ± 0.12\n\njulia> log(9.4 ± 1.3, 58.8 ± 3.7) # Exact result\n1.82 ± 0.12\n\njulia> @uncertain atan(10, 13.5 ± 0.8)\n0.638 ± 0.028\n\njulia> atan(10, 13.5 ± 0.8) # Exact result\n0.638 ± 0.028You usually do not need to define a wrapping function before using it.  In the case where you have to define a function, like in the first line of previous examples, anonymous functions allow you to do it in a very concise way.The macro works with functions calling C/Fortran functions as well. For example, Cuba.jl package performs numerical integration by wrapping the C Cuba library. You can define a function to numerically compute with Cuba.jl the integral defining the error function and pass it to @uncertain macro. Compare the result with that of the erf function, natively supported in Measurements.jl packagejulia> using Cuba\n\njulia> cubaerf(x::Real) =\n           2x/sqrt(pi)*cuhre((t, f) -> f[1] = exp(-abs2(t[1]*x)))[1][1]\ncubaerf (generic function with 1 method)\n\njulia> @uncertain cubaerf(0.5 ± 0.01)\n0.5205 ± 0.0088\n\njulia> erf(0.5 ± 0.01) # Exact result\n0.5205 ± 0.0088Also here you can use an anonymous function instead of defining the cubaerf function, do it as an exercise. Remember that if you want to numerically integrate a function that returns a Measurement object you can use QuadGK.jl package, which is written purely in Julia and in addition allows you to set Measurement objects as endpoints, see below.tip: Tip\nNote that the argument of @uncertain macro must be a function call. Thus,julia> @uncertain zeta(13.4 ± 0.8) + eta(8.51 ± 0.67)will not work because here the outermost function is +, whose arguments are zeta(13.4 ± 0.8) and eta(8.51 ± 0.67), that however cannot be calculated. You can use the @uncertain macro on each function separately:julia> @uncertain(zeta(13.4 ± 0.8)) +  @uncertain(eta(8.51 ± 0.67))\n1.9974 ± 0.0012In addition, the function must be differentiable in all its arguments. For example, the polygamma function of order m, polygamma(m, x), is the m+1-th derivative of the logarithm of gamma function, and is not differentiable in the first argument, because the first argument must be an integer. You can easily work around this limitation by wrapping the function in a single-argument function:julia> @uncertain (x -> polygamma(0, x))(4.8 ± 0.2)\n1.461 ± 0.046\n\njulia> digamma(4.8 ± 0.2)   # Exact result\n1.461 ± 0.046"
},

{
    "location": "examples/#Complex-Measurements-1",
    "page": "Examples",
    "title": "Complex Measurements",
    "category": "section",
    "text": "Here are a few examples about uncertainty propagation of complex-valued measurements.julia> u = complex(32.7 ± 1.1, -3.1 ± 0.2);\n\njulia> v = complex(7.6 ± 0.9, 53.2 ± 3.4);\n\njulia> 2u + v\n(73.0 ± 2.4) + (47.0 ± 3.4)im\n\njulia> sqrt(u * v)\n(33.0 ± 1.1) + (26.0 ± 1.1)imYou can also verify the Euler\'s formulajulia> u = complex(32.7 ± 1.1, -3.1 ± 0.2);\n\njulia> cis(u)\n(6.0 ± 23.0) + (21.3 ± 8.1)im\n\njulia> cos(u) + sin(u)*im\n(6.0 ± 23.0) + (21.3 ± 8.1)im"
},

{
    "location": "examples/#Arbitrary-Precision-Calculations-1",
    "page": "Examples",
    "title": "Arbitrary Precision Calculations",
    "category": "section",
    "text": "If you performed an exceptionally good experiment that gave you extremely precise results (that is, with very low relative error), you may want to use arbitrary precision (or multiple precision) calculations, in order not to loose significance of the experimental results. Luckily, Julia natively supports this type of arithmetic and so Measurements.jl does. You only have to create Measurement objects with nominal value and uncertainty of type BigFloat.tip: Tip\nAs explained in the Julia documentation, it is better to use BigFloat(\"12.34\"), rather than BigFloat(12.34). See examples below.For example, you want to measure a quantity that is the product of two observables a and b, and the expected value of the product is 1200000007. You measure a = 300000001 pm (1times 10^-17) and b = 40000000100000001 pm (1times 10^-17) and want to compute the standard score of the product with stdscore. Using the ability of Measurements.jl to perform arbitrary precision calculations you discover thatjulia> a = BigFloat(\"3.00000001\") ± BigFloat(\"1e-17\");\n\njulia> b = BigFloat(\"4.0000000100000001\") ± BigFloat(\"1e-17\");\n\njulia> stdscore(a * b, BigFloat(\"12.00000007\"))\n7.999999997599999878080000420160000093695993825308195353920411656927305928530607the measurement significantly differs from the expected value and you make a great discovery. Instead, if you used double precision accuracy, you would have wrongly found that your measurement is consistent with the expected value:julia> stdscore((3.00000001 ± 1e-17)*(4.0000000100000001 ± 1e-17), 12.00000007)\n0.0and you would have missed an important prize due to the use of an incorrect arithmetic.Of course, you can perform any mathematical operation supported in Measurements.jl using arbitrary precision arithmetic:julia> a = BigFloat(\"3.00000001\") ± BigFloat(\"1e-17\");\n\njulia> b = BigFloat(\"4.0000000100000001\") ± BigFloat(\"1e-17\");\n\njulia> hypot(a, b)\n5.000000014000000080000000000000000000000000000000000000000000000000000000000013 ± 9.999999999999999999999999999999999999999999999999999999999999999999999999999967e-18\n\njulia> log(2a) ^ b\n1.030668110995484998100000000000000000000000000000000000000000000000000000000005e+01 ± 9.699999999999999999999999999999999999999999999999999999999999999999999999999966e-17"
},

{
    "location": "examples/#Operations-with-Arrays-and-Linear-Algebra-1",
    "page": "Examples",
    "title": "Operations with Arrays and Linear Algebra",
    "category": "section",
    "text": "You can create arrays of Measurement objects and perform mathematical operations on them in the most natural way possible:julia> A = [1.03 ± 0.14, 2.88 ± 0.35, 5.46 ± 0.97]\n3-element Array{Measurement{Float64},1}:\n 1.03 ± 0.14\n 2.88 ± 0.35\n 5.46 ± 0.97\n\njulia> B = [0.92 ± 0.11, 3.14 ± 0.42, 4.67 ± 0.58]\n3-element Array{Measurement{Float64},1}:\n 0.92 ± 0.11\n 3.14 ± 0.42\n 4.67 ± 0.58\n\njulia> exp.(sqrt.(B)) .- log.(A)\n3-element Array{Measurement{Float64},1}:\n 2.5799612193837493 ± 0.20215123893809778\n  4.824843081566397 ± 0.7076631767039828\n  6.982522998771526 ± 1.178287422979362\n\njulia> @. cos(A) ^ 2 + sin(A) ^ 2\n3-element Array{Measurement{Float64},1}:\n 1.0 ± 0.0\n 1.0 ± 0.0\n 1.0 ± 0.0If you originally have separate arrays of values and uncertainties, you can create an array of Measurement objects using measurement or ± with the dot syntax for vectorizing functions:julia> using Statistics\n\njulia> C = measurement.([174.9, 253.8, 626.3], [12.2, 19.4, 38.5])\n3-element Array{Measurement{Float64},1}:\n 174.9 ± 12.2\n 253.8 ± 19.4\n 626.3 ± 38.5\n\njulia> sum(C)\n1055.0 ± 45.0\n\njulia> D = [549.4, 672.3, 528.5] .± [7.4, 9.6, 5.2]\n3-element Array{Measurement{Float64},1}:\n 549.4 ± 7.4\n 672.3 ± 9.6\n 528.5 ± 5.2\n\njulia> mean(D)\n583.4 ± 4.4tip: Tip\nprod and sum (and mean, which relies on sum) functions work out-of-the-box with any iterable of Measurement objects, like arrays or tuples. However, these functions have faster methods (quadratic in the number of elements) when operating on an array of Measurement s than on a tuple (in this case the computational complexity is cubic in the number of elements), so you should use an array if performance is crucial for you, in particular for large collections of measurements.Some linear algebra functions work out-of-the-box, without defining specific methods for them. For example, you can solve linear systems, do matrix multiplication and dot product between vectors, find inverse, determinant, and trace of a matrix, do LU and QR factorization, etc.julia> using LinearAlgebra\n\njulia> A = [(14 ± 0.1) (23 ± 0.2); (-12 ± 0.3) (24 ± 0.4)]\n2×2 Array{Measurement{Float64},2}:\n  14.0±0.1  23.0±0.2\n -12.0±0.3  24.0±0.4\n\njulia> b = [(7 ± 0.5), (-13 ± 0.6)]\n2-element Array{Measurement{Float64},1}:\n   7.0 ± 0.5\n -13.0 ± 0.6\n\njulia> x = A \\ b\n2-element Array{Measurement{Float64},1}:\n   0.7630718954248366 ± 0.03135711295001047\n -0.16013071895424838 ± 0.017796338417650402\n\njulia> A * x ≈ b\ntrue\n\njulia> dot(x, b)\n7.42 ± 0.6\n\njulia> det(A)\n612.0 ± 9.5\n\njulia> tr(A)\n38.0 ± 0.41\n\njulia> A * inv(A) ≈ Matrix{eltype(A)}(I, size(A))\ntrue\n\njulia> lu(A)\nLinearAlgebra.LU{Measurement{Float64},Array{Measurement{Float64},2}}\nL factor:\n2×2 Array{Measurement{Float64},2}:\n       1.0±0.0        0.0±0.0\n -0.857143±0.0222861  1.0±0.0\nU factor:\n2×2 Array{Measurement{Float64},2}:\n 14.0±0.1     23.0±0.2\n  0.0±0.0  43.7143±0.672403\n\njulia> qr(A)\nLinearAlgebra.QR{Measurement{Float64},Array{Measurement{Float64},2}}\nQ factor:\n2×2 LinearAlgebra.QRPackedQ{Measurement{Float64},Array{Measurement{Float64},2}}:\n -0.759257±0.00836088  0.650791±0.00975436\n  0.650791±0.00975436  0.759257±0.00836088\nR factor:\n2×2 Array{Measurement{Float64},2}:\n -18.4391±0.209481  -1.84391±0.522154\n      0.0±0.0        33.1904±0.331267"
},

{
    "location": "examples/#Derivative,-Gradient-and-Uncertainty-Components-1",
    "page": "Examples",
    "title": "Derivative, Gradient and Uncertainty Components",
    "category": "section",
    "text": "In order to propagate the uncertainties, Measurements.jl keeps track of the partial derivative of an expression with respect to all independent measurements from which the expression comes. The package provides a convenient function, Measurements.derivative, that returns the partial derivative of an expression with respect to independent measurements. Its vectorized version can be used to compute the gradient of an expression with respect to multiple independent measurements.julia> x = 98.1 ± 12.7\n98.0 ± 13.0\n\njulia> y = 105.4 ± 25.6\n105.0 ± 26.0\n\njulia> z = 78.3 ± 14.1\n78.0 ± 14.0\n\njulia> Measurements.derivative(2x - 4y, x)\n2.0\n\njulia> Measurements.derivative(2x - 4y, y)\n-4.0\n\njulia> Measurements.derivative.(log1p(x) + y^2 - cos(x/y), [x, y, z])\n3-element Array{Float64,1}:\n   0.017700515090289737\n 210.7929173496422\n   0.0The last resul shows that the expression does not depend on z.tip: Tip\nThe vectorized version of Measurements.derivative is useful in order to discover which variable contributes most to the total uncertainty of a given expression, if you want to minimize it. This can be calculated as the Hadamard (element-wise) product between the gradient of the expression with respect to the set of variables and the vector of uncertainties of the same variables in the same order. For example:julia> w = y^(3//4)*log(y) + 3x - cos(y/x)\n447.0410543780643 ± 52.41813324207829\n\njulia> abs.(Measurements.derivative.(w, [x, y]) .* Measurements.uncertainty.([x, y]))\n2-element Array{Float64,1}:\n 37.9777\n 36.1297In this case, the x variable contributes most to the uncertainty of w. In addition, note that the Euclidean norm of the Hadamard product above is exactly the total uncertainty of the expression:julia> vecnorm(Measurements.derivative.(w, [x, y]) .* Measurements.uncertainty.([x, y]))\n52.41813324207829The Measurements.uncertainty_components function simplifies calculation of all uncertainty components of a derived quantity:julia> Measurements.uncertainty_components(w)\nDict{Tuple{Float64,Float64,Float64},Float64} with 2 entries:\n  (98.1, 12.7, 0.303638)  => 37.9777\n  (105.4, 25.6, 0.465695) => 36.1297\n\njulia> norm(collect(values(Measurements.uncertainty_components(w))))\n52.41813324207829"
},

{
    "location": "examples/#stdscore-Function-1",
    "page": "Examples",
    "title": "stdscore Function",
    "category": "section",
    "text": "You can get the distance in number of standard deviations between a measurement and its expected value (not a Measurement) using stdscore:julia> stdscore(1.3 ± 0.12, 1)\n2.5000000000000004You can use the same function also to test the consistency of two measurements by computing the standard score between their difference and zero. This is what stdscore does when both arguments are Measurement objects:julia> stdscore((4.7 ± 0.58) - (5 ± 0.01), 0)\n-0.5171645175253433\n\njulia> stdscore(4.7 ± 0.58, 5 ± 0.01)\n-0.5171645175253433"
},

{
    "location": "examples/#weightedmean-Function-1",
    "page": "Examples",
    "title": "weightedmean Function",
    "category": "section",
    "text": "Calculate the weighted and arithmetic means of your set of measurements with weightedmean and mean respectively:julia> weightedmean((3.1±0.32, 3.2±0.38, 3.5±0.61, 3.8±0.25))\n3.47 ± 0.17\n\njulia> using Statistics\n\njulia> mean((3.1±0.32, 3.2±0.38, 3.5±0.61, 3.8±0.25))\n3.4 ± 0.21"
},

{
    "location": "examples/#Measurements.value-and-Measurements.uncertainty-Functions-1",
    "page": "Examples",
    "title": "Measurements.value and Measurements.uncertainty Functions",
    "category": "section",
    "text": "Use Measurements.value and Measurements.uncertainty to get the values and uncertainties of measurements. They work with real and complex measurements, scalars or arrays:julia> Measurements.value(94.5 ± 1.6)\n94.5\n\njulia> Measurements.uncertainty(94.5 ± 1.6)\n1.6\n\njulia> Measurements.value.([complex(87.3 ± 2.9, 64.3 ± 3.0), complex(55.1 ± 2.8, -19.1 ± 4.6)])\n2-element Array{Complex{Float64},1}:\n 87.3 + 64.3im\n 55.1 - 19.1im\n\njulia> Measurements.uncertainty.([complex(87.3 ± 2.9, 64.3 ± 3.0), complex(55.1 ± 2.8, -19.1 ± 4.6)])\n2-element Array{Complex{Float64},1}:\n 2.9 + 3.0im\n 2.8 + 4.6im"
},

{
    "location": "examples/#Interplay-with-Third-Party-Packages-1",
    "page": "Examples",
    "title": "Interplay with Third-Party Packages",
    "category": "section",
    "text": "Measurements.jl works out-of-the-box with any function taking arguments no more specific than AbstractFloat. This makes this library particularly suitable for cooperating with well-designed third-party packages in order to perform complicated calculations always accurately taking care of uncertainties and their correlations, with no effort for the developers nor users.The following sections present a sample of packages that are known to work with Measurements.jl, but many others will interplay with this package as well as them."
},

{
    "location": "examples/#Numerical-Integration-with-QuadGK.jl-1",
    "page": "Examples",
    "title": "Numerical Integration with QuadGK.jl",
    "category": "section",
    "text": "The powerful integration routine quadgk from QuadGK.jl package is smart enough to support out-of-the-box integrand functions that return arbitrary types, including Measurement:julia> a = 4.71 ± 0.01;\n\njulia> quadgk(x -> exp(x / a), 1, 7)[1]\n14.995 ± 0.031Measurements.jl pushes the capabilities of quadgk further by supporting also Measurement objects as endpoints:julia> quadgk(cos, 1.19 ± 0.02, 8.37 ± 0.05)[1]\n-0.059 ± 0.026Compare this with the expected result:julia> sin(8.37 ± 0.05) - sin(1.19 ± 0.02)\n-0.059 ± 0.026Also with quadgk correlation is properly taken into account:julia> a = 6.42 ± 0.03\n6.42 ± 0.03\n\njulia> quadgk(sin, -a, a)\n(2.484178227707412e-17 ± 0.0, 0.0)If instead the two endpoints have, by chance, the same nominal value and uncertainty but are not correlated:julia> quadgk(sin, -6.42 ± 0.03, 6.42 ± 0.03)\n(2.484178227707412e-17 ± 0.005786464233000303, 0.0)"
},

{
    "location": "examples/#Numerical-and-Automatic-Differentiation-1",
    "page": "Examples",
    "title": "Numerical and Automatic Differentiation",
    "category": "section",
    "text": "With Calculus.jl package it is possible to perform numerical differentiation using finite differencing. You can pass in to the Calculus.derivative function both functions returning Measurement objects and a Measurement as the point in which to calculate the derivative.julia> using Measurements, Calculus\n\njulia> a = -45.7 ± 1.6\n-45.7 ± 1.6\n\njulia> b = 36.5 ± 6.0\n36.5 ± 6.0\n\njulia> Calculus.derivative(exp, a) ≈ exp(a)\ntrue\n\njulia> Calculus.derivative(cos, b) ≈ -sin(b)\ntrue\n\njulia> Calculus.derivative(t -> log(-t * b)^2, a) ≈ 2log(-a * b)/a\ntrueOther packages provide automatic differentiation methods. Here is an example with AutoGrad.jl, just one of the packages available:julia> using AutoGrad\n\njulia> grad(exp)(a) ≈ exp(a)\ntrue\n\njulia> grad(cos)(b) ≈ -sin(b)\ntrue\n\njulia> grad(t -> log(-t * b)^2)(a) ≈ 2log(-a * b)/a\ntrueHowever remember that you can always use Measurements.derivative to compute the value (without uncertainty) of the derivative of a Measurement object."
},

{
    "location": "examples/#Use-with-SIUnits.jl-and-Unitful.jl-1",
    "page": "Examples",
    "title": "Use with SIUnits.jl and Unitful.jl",
    "category": "section",
    "text": "You can use Measurements.jl in combination with a third-party package in order to perform calculations involving physical measurements, i.e. numbers with uncertainty and physical unit. The details depend on the specific package adopted. Such packages are, for instance, SIUnits.jl and Unitful.jl. You only have to use the Measurement object as the value of the SIQuantity object (for SIUnits.jl) or of the Quantity object (for Unitful.jl). Here are a few examples.julia> using Measurements, SIUnits, SIUnits.ShortUnits\n\njulia> hypot((3 ± 1)*m, (4 ± 2)*m) # Pythagorean theorem\n5.0 ± 1.7088007490635064 m\n\njulia> (50 ± 1)Ω * (13 ± 2.4)*1e-2*A # Ohm\'s Law\n6.5 ± 1.20702112657567 kg m²s⁻³A⁻¹\n\njulia> 2pi*sqrt((5.4 ± 0.3)*m / ((9.81 ± 0.01)*m/s^2)) # Pendulum\'s  period\n4.661677707464357 ± 0.1295128435999655 s\n\njulia> using Measurements, Unitful\n\njulia> hypot((3 ± 1)*u\"m\", (4 ± 2)*u\"m\") # Pythagorean theorem\n5.0 ± 1.7088007490635064 m\n\njulia> (50 ± 1)*u\"Ω\" * (13 ± 2.4)*1e-2*u\"A\" # Ohm\'s Law\n6.5 ± 1.20702112657567 A Ω\n\njulia> 2pi*sqrt((5.4 ± 0.3)*u\"m\" / ((9.81 ± 0.01)*u\"m/s^2\")) # Pendulum\'s period\n4.661677707464357 ± 0.12951284359996548 s"
},

{
    "location": "examples/#Integration-with-Plots.jl-1",
    "page": "Examples",
    "title": "Integration with Plots.jl",
    "category": "section",
    "text": "Measurements.jl provides plot recipes for the Julia graphic framework Plots.jl. Arguments to plot function that have Measurement type will be automatically represented with errorbars.julia> using Measurements, Plots\n\njulia> plot(sin, [x ± 0.1 for x in 1:0.2:10], size = (1200, 800))(Image: image)"
},

{
    "location": "performance/#",
    "page": "Performance",
    "title": "Performance",
    "category": "page",
    "text": ""
},

{
    "location": "performance/#Performance-1",
    "page": "Performance",
    "title": "Performance",
    "category": "section",
    "text": "Measurements.jl strives to be as fast as possible. These are the benchmark results obtained with the BenchmarkTools.jl suite on a system equipped with an Intel(R) Core(TM) i7-4700MQ CPU running Julia 0.7.0-beta2.3 (commit 83ce9c7524).julia> using Measurements, SpecialFunctions, BenchmarkTools\n\n# Creation of a `Measurement` object\njulia> @benchmark 4.7 ± 0.3\nBenchmarkTools.Trial:\n  memory estimate:  96 bytes\n  allocs estimate:  2\n  --------------\n  minimum time:     15.157 ns (0.00% GC)\n  median time:      19.981 ns (0.00% GC)\n  mean time:        31.490 ns (33.15% GC)\n  maximum time:     44.723 μs (99.94% GC)\n  --------------\n  samples:          10000\n  evals/sample:     998\n\njulia> a = 12.3 ± 4.5; b = 67.8 ± 9.0;\n\n# Sum of two `Measurement` objects\njulia> @benchmark $a + $b\nBenchmarkTools.Trial:\n  memory estimate:  176 bytes\n  allocs estimate:  4\n  --------------\n  minimum time:     48.910 ns (0.00% GC)\n  median time:      57.613 ns (0.00% GC)\n  mean time:        77.633 ns (24.08% GC)\n  maximum time:     45.375 μs (99.85% GC)\n  --------------\n  samples:          10000\n  evals/sample:     989\n\n# One-argument functions, where functional\n# correlation is not a concern, are even faster\njulia> @benchmark sqrt($b)\nBenchmarkTools.Trial:\n  memory estimate:  96 bytes\n  allocs estimate:  2\n  --------------\n  minimum time:     25.744 ns (0.00% GC)\n  median time:      26.796 ns (0.00% GC)\n  mean time:        39.221 ns (27.00% GC)\n  maximum time:     44.651 μs (99.90% GC)\n  --------------\n  samples:          10000\n  evals/sample:     995\n\njulia> @benchmark sin($a)\nBenchmarkTools.Trial:\n  memory estimate:  96 bytes\n  allocs estimate:  2\n  --------------\n  minimum time:     35.896 ns (0.00% GC)\n  median time:      36.736 ns (0.00% GC)\n  mean time:        49.104 ns (21.34% GC)\n  maximum time:     45.383 μs (99.90% GC)\n  --------------\n  samples:          10000\n  evals/sample:     992\n\njulia> @benchmark gamma($a)\nBenchmarkTools.Trial:\n  memory estimate:  96 bytes\n  allocs estimate:  2\n  --------------\n  minimum time:     125.603 ns (0.00% GC)\n  median time:      126.545 ns (0.00% GC)\n  mean time:        142.055 ns (8.14% GC)\n  maximum time:     50.462 μs (99.73% GC)\n  --------------\n  samples:          10000\n  evals/sample:     886\n\n# Vectorial functions take a linear time\njulia> vector = [1 ± 0.1 for _ in 1:10000];\n\njulia> @benchmark sqrt.($vector)\nBenchmarkTools.Trial:\n  memory estimate:  1015.70 KiB\n  allocs estimate:  20002\n  --------------\n  minimum time:     228.509 μs (0.00% GC)\n  median time:      253.523 μs (0.00% GC)\n  mean time:        325.750 μs (20.98% GC)\n  maximum time:     46.834 ms (99.38% GC)\n  --------------\n  samples:          10000\n  evals/sample:     1\n\njulia> @benchmark sin.($vector)\nBenchmarkTools.Trial:\n  memory estimate:  1015.70 KiB\n  allocs estimate:  20002\n  --------------\n  minimum time:     331.305 μs (0.00% GC)\n  median time:      345.292 μs (0.00% GC)\n  mean time:        423.058 μs (17.37% GC)\n  maximum time:     46.463 ms (99.21% GC)\n  --------------\n  samples:          10000\n  evals/sample:     1\n\njulia> @benchmark gamma.($vector)\nBenchmarkTools.Trial:\n  memory estimate:  1015.70 KiB\n  allocs estimate:  20002\n  --------------\n  minimum time:     998.431 μs (0.00% GC)\n  median time:      1.062 ms (0.00% GC)\n  mean time:        1.139 ms (7.37% GC)\n  maximum time:     48.341 ms (97.80% GC)\n  --------------\n  samples:          4381\n  evals/sample:     1\n\njulia> @benchmark cos.($vector) .^ 2 .+ sin.($vector) .^ 2\nBenchmarkTools.Trial:\n  memory estimate:  4.50 MiB\n  allocs estimate:  100004\n  --------------\n  minimum time:     1.588 ms (0.00% GC)\n  median time:      1.745 ms (0.00% GC)\n  mean time:        2.184 ms (20.84% GC)\n  maximum time:     50.107 ms (94.99% GC)\n  --------------\n  samples:          2283\n  evals/sample:     1"
},

{
    "location": "todo/#",
    "page": "Development",
    "title": "Development",
    "category": "page",
    "text": ""
},

{
    "location": "todo/#Development-1",
    "page": "Development",
    "title": "Development",
    "category": "section",
    "text": "The package is developed at https://github.com/JuliaPhysics/Measurements.jl. There you can submit bug reports, make suggestions, and propose pull requests."
},

{
    "location": "todo/#How-Can-I-Help?-1",
    "page": "Development",
    "title": "How Can I Help?",
    "category": "section",
    "text": "Have a look at the TODO list below and the bug list at https://github.com/JuliaPhysics/Measurements.jl/issues, pick-up a task, write great code to accomplish it and send a pull request. In addition, you can instruct more mathematical functions to accept Measurement type arguments. Please, read the technical appendix in order to understand the design of this package. Bug reports and wishlists are welcome as well."
},

{
    "location": "todo/#History-1",
    "page": "Development",
    "title": "History",
    "category": "section",
    "text": "The ChangeLog of the package is available in NEWS.md file in top directory. There have been some breaking changes from time to time, beware of them when upgrading the package."
},

{
    "location": "appendix/#",
    "page": "Appendix",
    "title": "Appendix",
    "category": "page",
    "text": ""
},

{
    "location": "appendix/#Appendix:-Technical-Details-1",
    "page": "Appendix",
    "title": "Appendix: Technical Details",
    "category": "section",
    "text": "This technical appendix explains the design of Measurements.jl package, how it propagates the uncertainties when performing calculations, and how you can contribute by providing new methods for mathematical operations."
},

{
    "location": "appendix/#The-Measurement-Type-1",
    "page": "Appendix",
    "title": "The Measurement Type",
    "category": "section",
    "text": "Measurement is a composite parametric type, whose parameter is the AbstractFloat subtype of the nominal value and the uncertainty of the measurement. Measurement type itself is subtype of AbstractFloat, thus Measurement objects can be used in any function taking AbstractFloat arguments without redefining it, and calculation of uncertainty will be exact.In detail, this is the definition of the type:struct Measurement{T<:AbstractFloat} <: AbstractFloat\n    val::T\n    err::T\n    tag::UInt64\n    der::Derivatives{T}\nendThe fields represent:val: the nominal value of the measurement.\nerr: the uncertainty, assumed to be standard deviation.\ntag: a unique identifier, it is used to identify a specific measurement in the list of derivatives. This is a thread-specific counter. The result of mathematical operation will have this field set to 0 because it is not relevant for non independent measurements.\nder: the list of derivates with respect to the independent variables from which this object comes. Derivatives is a lightweight dictionary type. The keys are the tuples (val, err, tag) of all independent variables from which the object has been derived, while the corresponding value is the partial derivative of the object with respect to that independent variable. An independent measurement has this dictionary empty.As already explained in the Usage section, every time you use one of the constructorsmeasurement(value, uncertainty)\nvalue ± uncertaintyyou define a new independent measurement. This happens because these contructors generate a new unique tag field, that is used to distinguish between really equal objects and measurements that only by chance share the same nominal value and uncertainty. For these reasons,julia> x = 24.3 ± 2.7\n24.3 ± 2.7\n\njulia> y = 24.3 ± 2.7\n24.3 ± 2.7will produce two independent measurements and they will be treated as such when performing mathematical operations. In particular, you can also notice that they are not egaljulia> x === y\nfalseIf you instead intend to make a variable really the same thing as an independent measurement you have to use assignment:julia> a = b = 24.3 ± 2.7\n24.3 ± 2.7\n\njulia> a === b\ntrueThanks to how the Julia language is designed, support for complex measurements, arbitrary precision calculations and array operations came with practically no effort during the development of the package. As explained by Steven G. Johnson, since in Julia a lot of nonlinear functions are internally implemented in terms of elementary operations on the real and imaginary parts it was natural to make the type subtype of Real in order to easily work with complex measurements. In particular, it was then chosen to select the AbstractFloat type because some functions of complex arguments (like sqrt and log) take Complex{AbstractFloat} arguments instead of generic Complex{Real}, and any operation on a Measurement{R} object, with R subtype of Real different from AbstractFloat, would turn it into Measurement{F}, with F subtype of AbstractFloat, anyway."
},

{
    "location": "appendix/#Correlation-1",
    "page": "Appendix",
    "title": "Correlation",
    "category": "section",
    "text": "One must carefully take care of correlation between two measurements when propagating the uncertainty for an operation. Actually, the term \"correlation\" may refer to different kind of dependences between two or more quantities, what we mean by this term in Measurements.jl is explained in the Usage section of this manual.Dealing with functional correlation between Measurement objects, when using functions with arity larger than one, is an important feature of this package. This is accomplished by keeping inside each Measurement object the list of its derivatives with respect to the independent variables from which the quantity comes.  This role is played by the der field. This dictionary is useful in order to trace the contribution of each measurement and propagate the uncertainty in the case of functions with more than one argument.The use of the list of derivatives has been inspired by Python package uncertainties, but the rest of the implementation of Measurements.jl is completely independent from that of uncertainties package."
},

{
    "location": "appendix/#Uncertainty-Propagation-1",
    "page": "Appendix",
    "title": "Uncertainty Propagation",
    "category": "section",
    "text": "For a function G(a b c dots) of real arguments with uncertainties a = bara pm sigma_a, b = barb pm sigma_b, and c = barc pm sigma_c, ..., the linear error propagation theory prescribes that uncertainty is propagated as follows:beginaligned\nsigma_G^2 = left( leftfracpartial Gpartial arightvert_a\n= bara sigma_a right)^2 + left( leftfracpartial\nGpartial brightvert_b = barb sigma_b right)^2 + left(\nleftfracpartial Gpartial crightvert_c = barc sigma_c\nright)^2 + cdots \n+ 2 left(fracpartial Gpartial aright)_a = bara\nleft(fracpartial Gpartial bright)_b = barb\nsigma_ab + 2 left(fracpartial Gpartial aright)_a =\nbara left(fracpartial Gpartial cright)_c = barc\nsigma_ac \n+ 2 left(fracpartial Gpartial bright)_b = barb\nleft(fracpartial Gpartial cright)_c = barc sigma_bc +\ndots\nendalignedwhere the sigma_ab factors are the covariances defined assigma_ab = textE(a - textEa)(b - textEb)Ea is the expected value, or mean, of a.  If uncertainties of the quantities a, b, c, ..., are independent and normally distributed, the covariances are null and the above formula for uncertainty propagation simplifies tosigma_G^2 = left( leftfracpartial Gpartial arightvert_a\n= bara sigma_a right)^2 + left( leftfracpartial\nGpartial brightvert_b = barb sigma_b right)^2 + left(\nleftfracpartial Gpartial crightvert_c = barc sigma_c\nright)^2 + cdotsIn general, calculating the covariances is not an easy task. The trick adopted in Measurements.jl in order to deal with simple functional correlation is to propagate the uncertainty always using really independent variables. Thus, dealing with functional correlation boils down to finding the set of all the independent measurements on which an expression depends. If this set is made up of x y z dots, it is possible to calculate the uncertainty of G(a b c dots) withsigma_G^2 = left( leftfracpartial Gpartial xrightvert_x\n= barx sigma_x right)^2 + left( leftfracpartial\nGpartial yrightvert_y = bary sigma_y right)^2 + left(\nleftfracpartial Gpartial zrightvert_z = barz sigma_z\nright)^2 + cdotswhere all covariances due to functional correlation are null. This explains the purpose of keeping the list of derivatives with respect to independent variables in Measurement objects: by looking at the der fields of a, b, c, ..., it is possible to determine the set of independent variables. If other types of correlation (not functional) between x, y, z, ..., are present, they should be treated by calculating the covariances as shown above.For a function of only one argument, G = G(a), there is no problem of correlation and the uncertainty propagation formula in the linear approximation simply readssigma_G = leftvert fracpartial Gpartial a rightvert_a =\nbara sigma_aeven if a is not an independent variable and comes from operations on really independent measurements.For example, suppose you want to calculate the function G = G(a b) of two arguments, and a and b are functionally correlated, because they come from some mathematical operations on really independent variables x, y, z, say a = a(x y), b = b(x z). By using the chain rule, the uncertainty on G(a b) is calculated as follows:sigma_G^2 = left( left(fracpartial Gpartial afracpartial\napartial x + fracpartial Gpartial bfracpartial\nbpartial xright)_x = barx sigma_x right)^2 + left(\nleft(fracpartial Gpartial afracpartial apartial\nyright)_y = bary sigma_y right)^2 + left(\nleft(fracpartial Gpartial bfracpartial bpartial\nzright)_z = barz sigma_z right)^2What Measurements.jl really does is to calulate the derivatives like partial apartial x and partial Gpartial x = (partial Gpartial a)(partial apartial x) + (partial Gpartial b)(partial bpartial x), and store them in the der field of a and G respectively in order to be able to perform further operations involving these quantities.This method is also described in the paper by Giordano, M."
},

{
    "location": "appendix/#Defining-Methods-for-Mathematical-Operations-1",
    "page": "Appendix",
    "title": "Defining Methods for Mathematical Operations",
    "category": "section",
    "text": "Measurements.jl defines new methods for mathematical operations in order to make them accept Measurement arguments. The single most important thing to know about how to define new methods in the package is the Measurements.result. This function, not exported because it is intended to be used only within the package, takes care of propagating the uncertainty as described in the section above. It has two methods: one for functions with arity equal to one, and the other for any other case. This is its syntax:result(val::Real, der::Real, a::Measurement)for functions of one argument, andresult(val, der, a)for functions of two or more arguments.  The arguments are:val: the nominal result of the operation G(a dots);\nder: the partial derivative partial Gpartial a of a function G = G(a) with respect to the argument a for one-argument functions or the tuple of partial derivatives with respect to each argument in other cases;\na: the argument(s) of G, in the same order as the corresponding derivatives in der argument.In the case of functions with arity larger than one, der and a tuples must have the same length.For example, for a one-argument function like cos we havecos(a::Measurement) = result(cos(a.val), -sin(a.val), a)Instead, the method for subtraction operation is defined as follows:-(a::Measurement, b::Measurement) =\n    result(a.val - b.val, (1, -1), (a, b))Thus, in order to support Measurement argument(s) for a new mathematical operation you have to calculate the result of the operation, the partial derivatives of the functon with respect to all arguments and then pass this information to Measurements.result function."
},

]}
