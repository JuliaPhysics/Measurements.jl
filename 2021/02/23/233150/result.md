# Benchmark result

* Pull request commit: [`d5df8868c5895175c919ee29ac9c33bdbb26a51b`](https://github.com/JuliaPhysics/Measurements.jl/commit/d5df8868c5895175c919ee29ac9c33bdbb26a51b)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/92> (Add GitHub Actions workflows to run benchmarks on CI)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 23 Feb 2021 - 23:29
    - Baseline: 23 Feb 2021 - 23:31
* Package commits:
    - Target: 06800e
    - Baseline: ea4d04
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

| ID                           | time ratio                   | memory ratio |
|------------------------------|------------------------------|--------------|
| `["base", "create"]`         |                1.08 (5%) :x: |   1.00 (1%)  |
| `["base", "multiplication"]` |                1.10 (5%) :x: |   1.00 (1%)  |
| `["base", "sqrt"]`           |                1.06 (5%) :x: |   1.00 (1%)  |
| `["base", "sum"]`            |                1.06 (5%) :x: |   1.00 (1%)  |
| `["quadgk", "cos"]`          |                1.06 (5%) :x: |   1.00 (1%)  |
| `["quadgk", "int1"]`         |                1.05 (5%) :x: |   1.00 (1%)  |
| `["uncertain", "atan"]`      | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["uncertain", "log"]`       | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["uncertain", "zeta"]`      | 0.90 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "gamma"]`        |                1.06 (5%) :x: |   1.00 (1%)  |
| `["vector", "sin²+cos²"]`    |                1.05 (5%) :x: |   1.00 (1%)  |
| `["vector", "sqrt"]`         |                1.13 (5%) :x: |   1.00 (1%)  |

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
       #1  2294 MHz        520 s          0 s        120 s       1514 s          0 s
       #2  2294 MHz       1510 s          0 s        136 s        545 s          0 s
       
  Memory: 6.791389465332031 GB (3829.734375 MB free)
  Uptime: 232.0 sec
  Load Avg:  1.18  0.84  0.37
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
       #1  2294 MHz        813 s          0 s        126 s       1991 s          0 s
       #2  2294 MHz       1986 s          0 s        145 s        838 s          0 s
       
  Memory: 6.791389465332031 GB (3811.98046875 MB free)
  Uptime: 310.0 sec
  Load Avg:  1.05  0.88  0.42
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 23 Feb 2021 - 23:29
* Package commit: 06800e
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

| ID                           | time            | GC time   | memory          | allocations |
|------------------------------|----------------:|----------:|----------------:|------------:|
| `["base", "create"]`         |  10.811 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]` |  48.283 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`            |  31.558 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`           |  28.012 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`            |  48.133 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`          |  20.200 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`         |   1.780 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`          | 535.158 ms (5%) | 11.367 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`       | 129.668 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`      | 669.000 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`       | 661.224 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`      |   1.370 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`        |   1.160 ms (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin"]`          | 425.101 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`    |   1.438 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`         | 327.601 μs (5%) |           | 781.33 KiB (1%) |       10002 |

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
       #1  2294 MHz        520 s          0 s        120 s       1514 s          0 s
       #2  2294 MHz       1510 s          0 s        136 s        545 s          0 s
       
  Memory: 6.791389465332031 GB (3829.734375 MB free)
  Uptime: 232.0 sec
  Load Avg:  1.18  0.84  0.37
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 23 Feb 2021 - 23:31
* Package commit: ea4d04
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

| ID                           | time            | GC time   | memory          | allocations |
|------------------------------|----------------:|----------:|----------------:|------------:|
| `["base", "create"]`         |  10.010 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]` |  43.939 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`            |  30.352 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`           |  26.406 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`            |  45.610 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`          |  19.000 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`         |   1.690 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`          | 535.572 ms (5%) | 10.315 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`       | 129.440 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`      | 715.823 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`       | 716.364 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`      |   1.530 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`        |   1.097 ms (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin"]`          | 412.403 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`    |   1.367 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`         | 290.802 μs (5%) |           | 781.33 KiB (1%) |       10002 |

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
       #1  2294 MHz        813 s          0 s        126 s       1991 s          0 s
       #2  2294 MHz       1986 s          0 s        145 s        838 s          0 s
       
  Memory: 6.791389465332031 GB (3811.98046875 MB free)
  Uptime: 310.0 sec
  Load Avg:  1.05  0.88  0.42
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
    CPU MHz:             2294.685
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

