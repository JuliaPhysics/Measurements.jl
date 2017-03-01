Performance
-----------

``Measurements.jl`` strives to be as fast as possible.  These are the benchmark
results obtained with the `BenchmarkTools.jl
<https://github.com/JuliaCI/BenchmarkTools.jl>`__ suite on a system equipped
with an Intel(R) Core(TM) i7-4700MQ CPU.

.. code-block:: julia

   julia> using BenchmarkTools

   # Creation of a `Measurement` object
   julia> @benchmark 4.7 ± 0.3
   BenchmarkTools.Trial:
     memory estimate:  144 bytes
     allocs estimate:  3
     --------------
     minimum time:     29.683 ns (0.00% GC)
     median time:      35.740 ns (0.00% GC)
     mean time:        57.519 ns (32.17% GC)
     maximum time:     3.325 μs (96.81% GC)
     --------------
     samples:          10000
     evals/sample:     996
     time tolerance:   5.00%
     memory tolerance: 1.00%

   julia> a = 12.3 ± 4.5; b = 67.8 ± 9.0;

   # Sum of two `Measurement` objects
   julia> @benchmark $a + $b
   BenchmarkTools.Trial:
     memory estimate:  352 bytes
     allocs estimate:  9
     --------------
     minimum time:     122.596 ns (0.00% GC)
     median time:      141.071 ns (0.00% GC)
     mean time:        218.027 ns (33.15% GC)
     maximum time:     6.378 μs (96.10% GC)
     --------------
     samples:          10000
     evals/sample:     916
     time tolerance:   5.00%
     memory tolerance: 1.00%

   # One-argument functions, where functional
   # correlation is not a concern, are even faster
   julia> @benchmark sqrt($b)
   BenchmarkTools.Trial:
     memory estimate:  96 bytes
     allocs estimate:  2
     --------------
     minimum time:     40.742 ns (0.00% GC)
     median time:      43.448 ns (0.00% GC)
     mean time:        60.819 ns (22.36% GC)
     maximum time:     3.559 μs (96.73% GC)
     --------------
     samples:          10000
     evals/sample:     990
     time tolerance:   5.00%
     memory tolerance: 1.00%

   julia> @benchmark sin($a)
   BenchmarkTools.Trial:
     memory estimate:  96 bytes
     allocs estimate:  2
     --------------
     minimum time:     66.120 ns (0.00% GC)
     median time:      70.562 ns (0.00% GC)
     mean time:        86.508 ns (15.23% GC)
     maximum time:     4.165 μs (95.53% GC)
     --------------
     samples:          10000
     evals/sample:     979
     time tolerance:   5.00%
     memory tolerance: 1.00%

   julia> @benchmark gamma($a)
   BenchmarkTools.Trial:
     memory estimate:  96 bytes
     allocs estimate:  2
     --------------
     minimum time:     158.325 ns (0.00% GC)
     median time:      161.586 ns (0.00% GC)
     mean time:        179.843 ns (7.82% GC)
     maximum time:     4.416 μs (94.57% GC)
     --------------
     samples:          10000
     evals/sample:     839
     time tolerance:   5.00%
     memory tolerance: 1.00%

   # Vectorial functions take an almost linear time
   julia> vector = [rand() ± 0.1rand() for _ in 1:10000];

   julia> @benchmark sqrt.($vector)
   BenchmarkTools.Trial:
     memory estimate:  2.37 MiB
     allocs estimate:  50002
     --------------
     minimum time:     910.006 μs (0.00% GC)
     median time:      1.006 ms (0.00% GC)
     mean time:        1.558 ms (28.96% GC)
     maximum time:     7.266 ms (73.62% GC)
     --------------
     samples:          3175
     evals/sample:     1
     time tolerance:   5.00%
     memory tolerance: 1.00%

   julia> @benchmark sin.($vector)
   BenchmarkTools.Trial:
     memory estimate:  2.37 MiB
     allocs estimate:  50002
     --------------
     minimum time:     1.059 ms (0.00% GC)
     median time:      1.117 ms (0.00% GC)
     mean time:        1.674 ms (27.24% GC)
     maximum time:     7.702 ms (78.61% GC)
     --------------
     samples:          2960
     evals/sample:     1
     time tolerance:   5.00%
     memory tolerance: 1.00%

   julia> @benchmark gamma.($vector)
   BenchmarkTools.Trial:
     memory estimate:  2.37 MiB
     allocs estimate:  50002
     --------------
     minimum time:     1.724 ms (0.00% GC)
     median time:      1.803 ms (0.00% GC)
     mean time:        2.342 ms (19.51% GC)
     maximum time:     8.647 ms (62.75% GC)
     --------------
     samples:          2117
     evals/sample:     1
     time tolerance:   5.00%
     memory tolerance: 1.00%
