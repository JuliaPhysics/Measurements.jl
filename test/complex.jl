imu = 6 ± 0.4

u = complex(5 ± 0.3, imu)
v = complex(imu, 8 ± 0.9)

# Addition and subtraction
test_approx_eq(2u - u - 3v + 2v + pi, u - v + pi)

# Multiplication and power
test_approx_eq(v*v*u + u*u*v, u^2*v + v^2*u)

# Division
test_approx_eq(v/v + u/u, complex(2 ± 0))

# Inverse
test_approx_eq(inv(v) + inv(u), (v + u)/(v*u))

# Cosine
for a in (u, v); test_approx_eq(cos(acos(a)), a); end
for a in (u, v); test_approx_eq(cosh(acosh(a)), a); end

# Sine
for a in (u, v); test_approx_eq(sin(asin(a)), a); end
for a in (u, v); test_approx_eq(sinh(asinh(a)), a); end

# Tangent
for a in (v, u); test_approx_eq_eps(tan(a), sin(a)/cos(a), 3e-16); end
for a in (u, v); test_approx_eq(tan(atan(a)), a); end
for a in (u, v); test_approx_eq_eps(tanh(a), sinh(a)/cosh(a), 3e-16); end
for a in (u, v); test_approx_eq(tanh(atanh(a)), a); end

# Exponential
for a in (u, v); test_approx_eq(exp(a), e^a); end
for a in (u, v); test_approx_eq(expm1(a), exp(a) - 1); end
for a in (u, v); test_approx_eq(exp10(a), 10^a); end

# Logarithm
for a in (u, v); test_approx_eq(exp(log(a)), a); end
for a in (u, v); test_approx_eq(log(e, a), log(a)); end
for a in (u, v); test_approx_eq(log(10, a), log10(a)); end
for a in (u, v); test_approx_eq(log1p(a), log(1 + a)); end

# Square root
for a in (u, v); test_approx_eq(sqrt(a), a^0.5); end
for a in (u, v); test_approx_eq(sqrt(a)*sqrt(a), a); end

# Absolute value
for a in (u, v); test_approx_eq(abs(a), sqrt(abs2(a))); end

# TODO: Define a method for lgamma with complex argument.
# # Factorial and gamma
# for a in (u, v); test_approx_eq(gamma(a), factorial(a - 1)); end
# for a in (u, v); test_approx_eq(gamma(a + 1), factorial(a)); end
# for a in (u, v); test_approx_eq(lgamma(a), log(gamma(a))); end
