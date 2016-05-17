using Measurements
using Base.Test

test_approx_eq(a::Measurement, b::Measurement) =
    (@test_approx_eq(a.value, b.value) ; @test_approx_eq(a.err, b.err))

let
    local x, y
    x = Measurement(3, 0.1)
    y = Measurement(4, 0.2)
    ##### Comparisons
    @test Measurement(3, 0.2) != x != y != Measurement(4, 0.1)
    @test x == Measurement(3, 0.1)
    @test y == Measurement(4, 0.2)
    @test x < y
    ##### Mathematical Operations
    # Addition
    test_approx_eq(+x, x)
    test_approx_eq(x + y, Measurement(7, 0.22360679774997896))
    test_approx_eq(x + y, y + x) # Commutativity
    test_approx_eq(2 + x, Measurement(5, 0.1))
    test_approx_eq(x + 2, Measurement(5, 0.1))
    # Subtraction
    test_approx_eq(-x, Measurement(-3, 0.1))
    test_approx_eq(x - y, Measurement(-1, 0.22360679774997896))
    test_approx_eq(2 - x, Measurement(-1, 0.1))
    test_approx_eq(x - 2, Measurement(1, 0.1))
    # Multiplication
    test_approx_eq(x*y, Measurement(12, 0.7211102550927979))
    test_approx_eq(x*y, y*x) # Commutativity
    test_approx_eq(2x, Measurement(6, 0.2))
    test_approx_eq(x*3, Measurement(9, 0.3))
    # Division
    test_approx_eq(x/y, Measurement(0.75, 0.04506939094329987))
    test_approx_eq(x/10, Measurement(0.3, 0.01))
    test_approx_eq(1/y, Measurement(0.25, 0.0125))
    # Inverse
    test_approx_eq(inv(y), 1/y)
    # Power
    test_approx_eq(x^y, Measurement(81, 20.818061515800505))
    test_approx_eq(x^(-1), inv(x))
    test_approx_eq(x^2, Measurement(9, 0.6))
    test_approx_eq(y^2, y^2.0)
    test_approx_eq(2^x, Measurement(8, 0.5545177444479562))
    test_approx_eq(2^y, 2.0^y)
    test_approx_eq(pi^x, Measurement(31.006276680299816, 3.5493811564854525))
    test_approx_eq(e^y, exp(y))
    # Cosine
    test_approx_eq(cos(x), Measurement(-0.9899924966004454, 0.014112000805986721))
    test_approx_eq(cosd(x), Measurement(0.9986295347545738, 9.134347536190512e-5))
    # Sine
    test_approx_eq(sin(y), Measurement(-0.7568024953079282, 0.13072872417272238))
    test_approx_eq(sind(y), Measurement(0.0697564737441253, 0.0034821554353128255))
    # Exponential
    test_approx_eq(exp(x), Measurement(20.085536923187668, 2.008553692318767))
    # Logarithm
    test_approx_eq(log(y), Measurement(1.3862943611198906, 0.05))
    # Hypotenus
    test_approx_eq(hypot(x, y), Measurement(5, 0.17088007490635065))
    test_approx_eq(hypot(x, y), hypot(y, x))
    test_approx_eq(hypot(x, 4), Measurement(5, 0.06))
    test_approx_eq(hypot(3, y), Measurement(5, 0.16))
    # Zero
    test_approx_eq(zero(x), Measurement(0, 0))
    # Dummy call to show
    show(DevNull, x)
end
