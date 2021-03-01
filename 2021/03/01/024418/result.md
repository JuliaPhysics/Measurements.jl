# Benchmark result

* Pull request commit: [`253dfc80292e3a42587e71c5f68ed48c3eb73ccc`](https://github.com/JuliaPhysics/Measurements.jl/commit/253dfc80292e3a42587e71c5f68ed48c3eb73ccc)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/82> (Switch to FiniteDifferences for `@uncertain`)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 1 Mar 2021 - 02:42
    - Baseline: 1 Mar 2021 - 02:43
* Package commits:
    - Target: 16424b
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

| ID                                   | time ratio     | memory ratio   |
|--------------------------------------|----------------|----------------|
| `["base", "sin"]`                    |  1.10 (5%) :x: |     1.00 (1%)  |
| `["base", "sqrt"]`                   |  1.10 (5%) :x: |     1.00 (1%)  |
| `["quadgk", "sin"]`                  |  1.07 (5%) :x: |     1.00 (1%)  |
| `["uncertain", "atan"]`              | 31.46 (5%) :x: | 27.09 (1%) :x: |
| `["uncertain", "log"]`               | 31.26 (5%) :x: | 25.46 (1%) :x: |
| `["uncertain", "zeta"]`              |  9.64 (5%) :x: | 69.67 (1%) :x: |
| `["vector", "prod - all equal"]`     |  1.14 (5%) :x: |     1.00 (1%)  |
| `["vector", "sqrt"]`                 |  1.13 (5%) :x: |     1.00 (1%)  |
| `["vector", "sum - all different"]`  |  1.07 (5%) :x: |     1.00 (1%)  |

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
       #1  2294 MHz       2342 s          0 s        126 s       1173 s          0 s
       #2  2294 MHz        423 s          0 s        116 s       3157 s          0 s
       
  Memory: 6.791393280029297 GB (3724.765625 MB free)
  Uptime: 382.0 sec
  Load Avg:  1.02  0.93  0.48
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
       #1  2294 MHz       2497 s          0 s        133 s       1991 s          0 s
       #2  2294 MHz       1239 s          0 s        131 s       3308 s          0 s
       
  Memory: 6.791393280029297 GB (3759.828125 MB free)
  Uptime: 480.0 sec
  Load Avg:  1.0  0.95  0.53
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 1 Mar 2021 - 2:42
* Package commit: 16424b
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
| `["base", "create"]`                 |   7.900 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  34.839 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  22.691 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  22.690 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  35.044 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  15.099 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.300 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 446.561 ms (5%) | 12.158 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 104.130 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              |  15.700 μs (5%) |           |  19.05 KiB (1%) |         260 |
| `["uncertain", "log"]`               |  15.599 μs (5%) |           |  19.09 KiB (1%) |         261 |
| `["uncertain", "zeta"]`              |  10.599 μs (5%) |           |   3.27 KiB (1%) |          55 |
| `["vector", "gamma"]`                | 817.393 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.122 s (5%) | 12.427 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 245.998 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 574.822 ms (5%) | 25.359 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 148.556 ms (5%) | 20.075 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 299.697 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.145 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 255.698 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 410.932 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 108.199 μs (5%) |           | 156.45 KiB (1%) |           5 |

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
       #1  2294 MHz       2342 s          0 s        126 s       1173 s          0 s
       #2  2294 MHz        423 s          0 s        116 s       3157 s          0 s
       
  Memory: 6.791393280029297 GB (3724.765625 MB free)
  Uptime: 382.0 sec
  Load Avg:  1.02  0.93  0.48
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 1 Mar 2021 - 2:43
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
| `["base", "create"]`                 |   7.799 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  34.939 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  20.581 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  20.581 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  34.944 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  15.000 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.320 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 417.128 ms (5%) | 10.255 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 104.024 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 499.000 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 499.000 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.099 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 812.792 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.029 s (5%) |  8.278 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 244.398 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 564.550 ms (5%) | 15.044 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 130.252 ms (5%) | 11.958 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 311.797 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.112 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 225.698 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 385.121 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 104.599 μs (5%) |           | 156.45 KiB (1%) |           5 |

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
       #1  2294 MHz       2497 s          0 s        133 s       1991 s          0 s
       #2  2294 MHz       1239 s          0 s        131 s       3308 s          0 s
       
  Memory: 6.791393280029297 GB (3759.828125 MB free)
  Uptime: 480.0 sec
  Load Avg:  1.0  0.95  0.53
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
    CPU MHz:             2294.686
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

