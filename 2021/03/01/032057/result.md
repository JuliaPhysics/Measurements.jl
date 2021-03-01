# Benchmark result

* Pull request commit: [`e3a1ad4b0a64bb1181344b3aa193c9eebe64a914`](https://github.com/JuliaPhysics/Measurements.jl/commit/e3a1ad4b0a64bb1181344b3aa193c9eebe64a914)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/94> (Improve printing of value when smaller than error)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 1 Mar 2021 - 03:18
    - Baseline: 1 Mar 2021 - 03:20
* Package commits:
    - Target: e66427
    - Baseline: 8475ef
* Julia commits:
    - Target: a58bdd
    - Baseline: a58bdd
* Julia command flags:
    - Target: None
    - Baseline: None
* Environment variables:
    - Target: None
    - Baseline: None

## Results
A ratio greater than `1.0` denotes a possible regression (marked with :x:), while a ratio less
than `1.0` denotes a possible improvement (marked with :white_check_mark:). Only significant results - results
that indicate possible regressions or improvements - are shown below (thus, an empty table means that all
benchmark results remained invariant between builds).

| ID                                   | time ratio    | memory ratio |
|--------------------------------------|---------------|--------------|
| `["base", "create"]`                 | 1.18 (5%) :x: |   1.00 (1%)  |
| `["base", "multiplication"]`         | 1.12 (5%) :x: |   1.00 (1%)  |
| `["base", "sin"]`                    | 1.14 (5%) :x: |   1.00 (1%)  |
| `["base", "sqrt"]`                   | 1.07 (5%) :x: |   1.00 (1%)  |
| `["base", "sum"]`                    | 1.10 (5%) :x: |   1.00 (1%)  |
| `["quadgk", "cos"]`                  | 1.15 (5%) :x: |   1.00 (1%)  |
| `["quadgk", "int1"]`                 | 1.13 (5%) :x: |   1.00 (1%)  |
| `["quadgk", "sin"]`                  | 1.08 (5%) :x: |   1.00 (1%)  |
| `["specfun", "gamma"]`               | 1.15 (5%) :x: |   1.00 (1%)  |
| `["uncertain", "zeta"]`              | 1.09 (5%) :x: |   1.00 (1%)  |
| `["vector", "mean - all different"]` | 1.09 (5%) :x: |   1.00 (1%)  |
| `["vector", "prod - all equal"]`     | 1.06 (5%) :x: |   1.00 (1%)  |
| `["vector", "sin²+cos²"]`            | 1.06 (5%) :x: |   1.00 (1%)  |
| `["vector", "sqrt"]`                 | 1.09 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all equal"]`      | 1.09 (5%) :x: |   1.00 (1%)  |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo

### Target
```
Julia Version 1.6.0-rc1
Commit a58bdd9010 (2021-02-06 15:49 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.5 LTS
  uname: Linux 5.4.0-1039-azure #41~18.04.1-Ubuntu SMP Mon Jan 18 14:00:01 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       2223 s          0 s        121 s        494 s          0 s
       #2  2294 MHz        417 s          0 s        125 s       2244 s          0 s
       
  Memory: 6.791393280029297 GB (3850.2265625 MB free)
  Uptime: 296.0 sec
  Load Avg:  1.09  0.97  0.48
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

### Baseline
```
Julia Version 1.6.0-rc1
Commit a58bdd9010 (2021-02-06 15:49 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.5 LTS
  uname: Linux 5.4.0-1039-azure #41~18.04.1-Ubuntu SMP Mon Jan 18 14:00:01 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       3125 s          0 s        138 s        626 s          0 s
       #2  2294 MHz        556 s          0 s        130 s       3151 s          0 s
       
  Memory: 6.791393280029297 GB (3871.44140625 MB free)
  Uptime: 401.0 sec
  Load Avg:  1.01  0.98  0.54
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 1 Mar 2021 - 3:18
* Package commit: e66427
* Julia commit: a58bdd
* Julia command flags: None
* Environment variables: None

## Results
Below is a table of this job's results, obtained by running the benchmarks.
The values listed in the `ID` column have the structure `[parent_group, child_group, ..., key]`, and can be used to
index into the BaseBenchmarks suite to retrieve the corresponding benchmarks.
The percentages accompanying time and memory values in the below table are noise tolerances. The "true"
time/memory value for a given benchmark is expected to fall within this percentage of the reported value.
An empty cell means that the value was zero.

| ID                                   | time            | GC time   | memory          | allocations |
|--------------------------------------|----------------:|----------:|----------------:|------------:|
| `["base", "create"]`                 |   9.710 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  41.877 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  24.824 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  23.317 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  40.566 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  17.900 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.570 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 502.260 ms (5%) | 10.925 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 126.168 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 583.978 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 578.142 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.270 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 886.807 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.519 s (5%) | 10.147 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 248.202 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 597.737 ms (5%) | 20.050 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 151.818 ms (5%) | 17.521 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 325.502 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.236 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 258.802 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 408.973 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 121.901 μs (5%) |           | 156.45 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.6.0-rc1
Commit a58bdd9010 (2021-02-06 15:49 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.5 LTS
  uname: Linux 5.4.0-1039-azure #41~18.04.1-Ubuntu SMP Mon Jan 18 14:00:01 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       2223 s          0 s        121 s        494 s          0 s
       #2  2294 MHz        417 s          0 s        125 s       2244 s          0 s
       
  Memory: 6.791393280029297 GB (3850.2265625 MB free)
  Uptime: 296.0 sec
  Load Avg:  1.09  0.97  0.48
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 1 Mar 2021 - 3:20
* Package commit: 8475ef
* Julia commit: a58bdd
* Julia command flags: None
* Environment variables: None

## Results
Below is a table of this job's results, obtained by running the benchmarks.
The values listed in the `ID` column have the structure `[parent_group, child_group, ..., key]`, and can be used to
index into the BaseBenchmarks suite to retrieve the corresponding benchmarks.
The percentages accompanying time and memory values in the below table are noise tolerances. The "true"
time/memory value for a given benchmark is expected to fall within this percentage of the reported value.
An empty cell means that the value was zero.

| ID                                   | time            | GC time   | memory          | allocations |
|--------------------------------------|----------------:|----------:|----------------:|------------:|
| `["base", "create"]`                 |   8.208 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  37.235 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  21.809 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  21.809 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  36.831 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  15.599 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.390 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 466.083 ms (5%) | 10.637 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 110.098 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 569.061 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 577.596 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.160 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 860.800 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.223 s (5%) | 15.966 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 245.700 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 580.651 ms (5%) | 17.542 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 143.044 ms (5%) | 14.608 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 316.500 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.171 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 238.100 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 404.478 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 111.600 μs (5%) |           | 156.45 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.6.0-rc1
Commit a58bdd9010 (2021-02-06 15:49 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.5 LTS
  uname: Linux 5.4.0-1039-azure #41~18.04.1-Ubuntu SMP Mon Jan 18 14:00:01 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       3125 s          0 s        138 s        626 s          0 s
       #2  2294 MHz        556 s          0 s        130 s       3151 s          0 s
       
  Memory: 6.791393280029297 GB (3871.44140625 MB free)
  Uptime: 401.0 sec
  Load Avg:  1.01  0.98  0.54
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

---
# Runtime information
| Runtime Info | |
|:--|:--|
| BLAS #threads | 2 |
| `BLAS.vendor()` | `openblas64` |
| `Sys.CPU_THREADS` | 2 |

`lscpu` output:

    Architecture:        x86_64
    CPU op-mode(s):      32-bit, 64-bit
    Byte Order:          Little Endian
    CPU(s):              2
    On-line CPU(s) list: 0,1
    Thread(s) per core:  1
    Core(s) per socket:  2
    Socket(s):           1
    NUMA node(s):        1
    Vendor ID:           GenuineIntel
    CPU family:          6
    Model:               79
    Model name:          Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz
    Stepping:            1
    CPU MHz:             2294.688
    BogoMIPS:            4589.37
    Hypervisor vendor:   Microsoft
    Virtualization type: full
    L1d cache:           32K
    L1i cache:           32K
    L2 cache:            256K
    L3 cache:            51200K
    NUMA node0 CPU(s):   0,1
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm rdseed adx smap xsaveopt md_clear
    

| Cpu Property       | Value                                                   |
|:------------------ |:------------------------------------------------------- |
| Brand              | Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz               |
| Vendor             | :Intel                                                  |
| Architecture       | :Broadwell                                              |
| Model              | Family: 0x06, Model: 0x4f, Stepping: 0x01, Type: 0x00   |
| Cores              | 2 physical cores, 2 logical cores (on executing CPU)    |
|                    | No Hyperthreading detected                              |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (32, 256, 51200) kbytes                     |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 46 bits physical                       |
| SIMD               | 256 bit = 32 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |

