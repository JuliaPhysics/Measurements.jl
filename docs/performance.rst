Performance
-----------

``Measurements.jl`` strives to be as fast as possible.  These are the benchmark
results obtained with the `BenchmarkTools.jl
<https://github.com/JuliaCI/BenchmarkTools.jl>`__ suite on a system equipped
with an Intel(R) Core(TM) i7-4700MQ CPU running Julia 0.6.0-pre.beta.314 (commit
7cd0324e03).

.. code-block:: julia

   julia> using Measurements, BenchmarkTools

   # Creation of a `Measurement` object
   julia> @benchmark 4.7 ± 0.3
   BenchmarkTools.Trial:
     memory estimate:  96 bytes
     allocs estimate:  2
     --------------
     minimum time:     18.760 ns (0.00% GC)
     median time:      22.548 ns (0.00% GC)
     mean time:        29.324 ns (16.03% GC)
     maximum time:     1.353 μs (93.61% GC)
     --------------
     samples:          10000
     evals/sample:     997

   julia> a = 12.3 ± 4.5; b = 67.8 ± 9.0;

   # Sum of two `Measurement` objects
   julia> @benchmark $a + $b
   BenchmarkTools.Trial:
     memory estimate:  176 bytes
     allocs estimate:  4
     --------------
     minimum time:     76.605 ns (0.00% GC)
     median time:      83.412 ns (0.00% GC)
     mean time:        102.682 ns (13.96% GC)
     maximum time:     2.339 μs (92.91% GC)
     --------------
     samples:          10000
     evals/sample:     970

   # One-argument functions, where functional
   # correlation is not a concern, are even faster
   julia> @benchmark sqrt($b)
   BenchmarkTools.Trial:
     memory estimate:  96 bytes
     allocs estimate:  2
     --------------
     minimum time:     31.226 ns (0.00% GC)
     median time:      33.805 ns (0.00% GC)
     mean time:        41.899 ns (13.09% GC)
     maximum time:     1.656 μs (91.62% GC)
     --------------
     samples:          10000
     evals/sample:     994

   julia> @benchmark sin($a)
   BenchmarkTools.Trial:
     memory estimate:  96 bytes
     allocs estimate:  2
     --------------
     minimum time:     56.797 ns (0.00% GC)
     median time:      58.526 ns (0.00% GC)
     mean time:        67.799 ns (8.59% GC)
     maximum time:     1.860 μs (93.77% GC)
     --------------
     samples:          10000
     evals/sample:     984

   julia> @benchmark gamma($a)
   BenchmarkTools.Trial:
     memory estimate:  96 bytes
     allocs estimate:  2
     --------------
     minimum time:     136.277 ns (0.00% GC)
     median time:      140.353 ns (0.00% GC)
     mean time:        151.901 ns (4.11% GC)
     maximum time:     2.164 μs (90.13% GC)
     --------------
     samples:          10000
     evals/sample:     867

   # Vectorial functions take a linear time
   julia> vector = [1 ± 0.1 for _ in 1:10000];

   julia> @benchmark sqrt.($vector)
   BenchmarkTools.Trial:
     memory estimate:  1015.70 KiB
     allocs estimate:  20002
     --------------
     minimum time:     330.481 μs (0.00% GC)
     median time:      352.413 μs (0.00% GC)
     mean time:        457.011 μs (20.01% GC)
     maximum time:     2.970 ms (85.16% GC)
     --------------
     samples:          10000
     evals/sample:     1

   julia> @benchmark sin.($vector)
   BenchmarkTools.Trial:
     memory estimate:  1015.70 KiB
     allocs estimate:  20002
     --------------
     minimum time:     535.720 μs (0.00% GC)
     median time:      556.428 μs (0.00% GC)
     mean time:        669.928 μs (14.53% GC)
     maximum time:     3.263 ms (80.73% GC)
     --------------
     samples:          7440
     evals/sample:     1

   julia> @benchmark gamma.($vector)
   BenchmarkTools.Trial:
     memory estimate:  1015.70 KiB
     allocs estimate:  20002
     --------------
     minimum time:     1.097 ms (0.00% GC)
     median time:      1.145 ms (0.00% GC)
     mean time:        1.270 ms (8.19% GC)
     maximum time:     4.137 ms (67.33% GC)
     --------------
     samples:          3928
     evals/sample:     1

   julia> @benchmark cos.($vector) .^ 2 .+ sin.($vector) .^ 2
   BenchmarkTools.Trial:
     memory estimate:  4.50 MiB
     allocs estimate:  100002
     --------------
     minimum time:     2.484 ms (0.00% GC)
     median time:      2.641 ms (0.00% GC)
     mean time:        3.272 ms (19.46% GC)
     maximum time:     7.793 ms (55.38% GC)
     --------------
     samples:          1526
     evals/sample:     1
