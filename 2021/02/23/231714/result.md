# Benchmark result

* Pull request commit: [`88f43b912fdb378bf07a176be3b11c21d795def9`](https://github.com/JuliaPhysics/Measurements.jl/commit/88f43b912fdb378bf07a176be3b11c21d795def9)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/92> (Add GitHub Actions workflows to run benchmarks on CI)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 23 Feb 2021 - 23:15
    - Baseline: 23 Feb 2021 - 23:16
* Package commits:
    - Target: b3ae96
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
| `["base", "multiplication"]` | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["base", "sqrt"]`           | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["quadgk", "int1"]`         | 0.89 (5%) :white_check_mark: |   1.00 (1%)  |
| `["uncertain", "log"]`       | 0.90 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sin"]`          |                1.09 (5%) :x: |   1.00 (1%)  |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       1403 s          0 s        105 s        515 s          0 s
       #2  2095 MHz        426 s          0 s        137 s       1438 s          0 s
       
  Memory: 6.791389465332031 GB (3864.3125 MB free)
  Uptime: 216.0 sec
  Load Avg:  1.14  0.82  0.36
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, skylake-avx512)
```

### Baseline
```
Julia Version 1.6.0-rc1
Commit a58bdd9010 (2021-02-06 15:49 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.5 LTS
  uname: Linux 5.4.0-1039-azure #41~18.04.1-Ubuntu SMP Mon Jan 18 14:00:01 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       2019 s          0 s        114 s        581 s          0 s
       #2  2095 MHz        495 s          0 s        140 s       2055 s          0 s
       
  Memory: 6.791389465332031 GB (3872.61328125 MB free)
  Uptime: 285.0 sec
  Load Avg:  1.04  0.86  0.41
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, skylake-avx512)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 23 Feb 2021 - 23:15
* Package commit: b3ae96
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

| ID                           | time            | GC time  | memory          | allocations |
|------------------------------|----------------:|---------:|----------------:|------------:|
| `["base", "create"]`         |   9.601 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "multiplication"]` |  43.435 ns (5%) |          |   96 bytes (1%) |           2 |
| `["base", "sin"]`            |  26.834 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`           |  26.433 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sum"]`            |  43.738 ns (5%) |          |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`          |  18.800 μs (5%) |          |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`         |   1.480 μs (5%) |          |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`          | 504.853 ms (5%) | 9.102 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`       | 154.898 ns (5%) |          |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`      | 739.010 ns (5%) |          |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`       | 660.008 ns (5%) |          |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`      |   1.680 μs (5%) |          |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`        |   1.069 ms (5%) |          | 781.33 KiB (1%) |       10002 |
| `["vector", "sin"]`          | 392.708 μs (5%) |          | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`    |   1.407 ms (5%) |          |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`         | 296.207 μs (5%) |          | 781.33 KiB (1%) |       10002 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       1403 s          0 s        105 s        515 s          0 s
       #2  2095 MHz        426 s          0 s        137 s       1438 s          0 s
       
  Memory: 6.791389465332031 GB (3864.3125 MB free)
  Uptime: 216.0 sec
  Load Avg:  1.14  0.82  0.36
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, skylake-avx512)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 23 Feb 2021 - 23:16
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

| ID                           | time            | GC time  | memory          | allocations |
|------------------------------|----------------:|---------:|----------------:|------------:|
| `["base", "create"]`         |   9.801 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "multiplication"]` |  46.873 ns (5%) |          |   96 bytes (1%) |           2 |
| `["base", "sin"]`            |  28.144 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`           |  28.042 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sum"]`            |  44.043 ns (5%) |          |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`          |  18.801 μs (5%) |          |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`         |   1.670 μs (5%) |          |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`          | 511.035 ms (5%) | 9.205 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`       | 154.908 ns (5%) |          |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`      | 722.050 ns (5%) |          |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`       | 736.848 ns (5%) |          |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`      |   1.680 μs (5%) |          |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`        |   1.062 ms (5%) |          | 781.33 KiB (1%) |       10002 |
| `["vector", "sin"]`          | 359.125 μs (5%) |          | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`    |   1.426 ms (5%) |          |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`         | 301.723 μs (5%) |          | 781.33 KiB (1%) |       10002 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       2019 s          0 s        114 s        581 s          0 s
       #2  2095 MHz        495 s          0 s        140 s       2055 s          0 s
       
  Memory: 6.791389465332031 GB (3872.61328125 MB free)
  Uptime: 285.0 sec
  Load Avg:  1.04  0.86  0.41
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, skylake-avx512)
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
    Model:               85
    Model name:          Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz
    Stepping:            4
    CPU MHz:             2095.181
    BogoMIPS:            4190.36
    Hypervisor vendor:   Microsoft
    Virtualization type: full
    L1d cache:           32K
    L1i cache:           32K
    L2 cache:            1024K
    L3 cache:            36608K
    NUMA node0 CPU(s):   0,1
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt avx512cd avx512bw avx512vl xsaveopt xsavec xsaves md_clear
    

| Cpu Property       | Value                                                   |
|:------------------ |:------------------------------------------------------- |
| Brand              | Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz           |
| Vendor             | :Intel                                                  |
| Architecture       | :Skylake                                                |
| Model              | Family: 0x06, Model: 0x55, Stepping: 0x04, Type: 0x00   |
| Cores              | 2 physical cores, 2 logical cores (on executing CPU)    |
|                    | No Hyperthreading detected                              |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (32, 1024, 36608) kbytes                    |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 46 bits physical                       |
| SIMD               | 512 bit = 64 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |

