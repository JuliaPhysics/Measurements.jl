Performance
===========

`Measurements.jl` strives to be as fast as possible. These are the benchmark
results obtained with the
[BenchmarkTools.jl](https://github.com/JuliaCI/BenchmarkTools.jl) suite on a
system equipped with an Intel(R) Core(TM) i7-4700MQ CPU running Julia
0.7.0-beta2.3 (commit 83ce9c7524).

```julia
julia> using Measurements, SpecialFunctions, BenchmarkTools

# Creation of a `Measurement` object
julia> @benchmark 4.7 ± 0.3
BenchmarkTools.Trial:
  memory estimate:  96 bytes
  allocs estimate:  2
  --------------
  minimum time:     15.157 ns (0.00% GC)
  median time:      19.981 ns (0.00% GC)
  mean time:        31.490 ns (33.15% GC)
  maximum time:     44.723 μs (99.94% GC)
  --------------
  samples:          10000
  evals/sample:     998

julia> a = 12.3 ± 4.5; b = 67.8 ± 9.0;

# Sum of two `Measurement` objects
julia> @benchmark $a + $b
BenchmarkTools.Trial:
  memory estimate:  176 bytes
  allocs estimate:  4
  --------------
  minimum time:     48.910 ns (0.00% GC)
  median time:      57.613 ns (0.00% GC)
  mean time:        77.633 ns (24.08% GC)
  maximum time:     45.375 μs (99.85% GC)
  --------------
  samples:          10000
  evals/sample:     989

# One-argument functions, where functional
# correlation is not a concern, are even faster
julia> @benchmark sqrt($b)
BenchmarkTools.Trial:
  memory estimate:  96 bytes
  allocs estimate:  2
  --------------
  minimum time:     25.744 ns (0.00% GC)
  median time:      26.796 ns (0.00% GC)
  mean time:        39.221 ns (27.00% GC)
  maximum time:     44.651 μs (99.90% GC)
  --------------
  samples:          10000
  evals/sample:     995

julia> @benchmark sin($a)
BenchmarkTools.Trial:
  memory estimate:  96 bytes
  allocs estimate:  2
  --------------
  minimum time:     35.896 ns (0.00% GC)
  median time:      36.736 ns (0.00% GC)
  mean time:        49.104 ns (21.34% GC)
  maximum time:     45.383 μs (99.90% GC)
  --------------
  samples:          10000
  evals/sample:     992

julia> @benchmark gamma($a)
BenchmarkTools.Trial:
  memory estimate:  96 bytes
  allocs estimate:  2
  --------------
  minimum time:     125.603 ns (0.00% GC)
  median time:      126.545 ns (0.00% GC)
  mean time:        142.055 ns (8.14% GC)
  maximum time:     50.462 μs (99.73% GC)
  --------------
  samples:          10000
  evals/sample:     886

# Vectorial functions take a linear time
julia> vector = [1 ± 0.1 for _ in 1:10000];

julia> @benchmark sqrt.($vector)
BenchmarkTools.Trial:
  memory estimate:  1015.70 KiB
  allocs estimate:  20002
  --------------
  minimum time:     228.509 μs (0.00% GC)
  median time:      253.523 μs (0.00% GC)
  mean time:        325.750 μs (20.98% GC)
  maximum time:     46.834 ms (99.38% GC)
  --------------
  samples:          10000
  evals/sample:     1

julia> @benchmark sin.($vector)
BenchmarkTools.Trial:
  memory estimate:  1015.70 KiB
  allocs estimate:  20002
  --------------
  minimum time:     331.305 μs (0.00% GC)
  median time:      345.292 μs (0.00% GC)
  mean time:        423.058 μs (17.37% GC)
  maximum time:     46.463 ms (99.21% GC)
  --------------
  samples:          10000
  evals/sample:     1

julia> @benchmark gamma.($vector)
BenchmarkTools.Trial:
  memory estimate:  1015.70 KiB
  allocs estimate:  20002
  --------------
  minimum time:     998.431 μs (0.00% GC)
  median time:      1.062 ms (0.00% GC)
  mean time:        1.139 ms (7.37% GC)
  maximum time:     48.341 ms (97.80% GC)
  --------------
  samples:          4381
  evals/sample:     1

julia> @benchmark cos.($vector) .^ 2 .+ sin.($vector) .^ 2
BenchmarkTools.Trial:
  memory estimate:  4.50 MiB
  allocs estimate:  100004
  --------------
  minimum time:     1.588 ms (0.00% GC)
  median time:      1.745 ms (0.00% GC)
  mean time:        2.184 ms (20.84% GC)
  maximum time:     50.107 ms (94.99% GC)
  --------------
  samples:          2283
  evals/sample:     1
```
