# Benchmark result

* Pull request commit: [`0aa61e59e4a4eefe092c39493b620652b63ef635`](https://github.com/JuliaPhysics/Measurements.jl/commit/0aa61e59e4a4eefe092c39493b620652b63ef635)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/82> (Switch to FiniteDifferences for `@uncertain`)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 15 Mar 2021 - 01:36
    - Baseline: 15 Mar 2021 - 01:38
* Package commits:
    - Target: 0ba250
    - Baseline: 287f57
* Julia commits:
    - Target: 4b6b9f
    - Baseline: 4b6b9f
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

| ID                                   | time ratio                   | memory ratio   |
|--------------------------------------|------------------------------|----------------|
| `["base", "create"]`                 |                1.07 (5%) :x: |     1.00 (1%)  |
| `["uncertain", "atan"]`              |               25.72 (5%) :x: | 27.09 (1%) :x: |
| `["uncertain", "log"]`               |               22.50 (5%) :x: | 25.46 (1%) :x: |
| `["uncertain", "zeta"]`              |                8.77 (5%) :x: | 69.67 (1%) :x: |
| `["vector", "prod - all different"]` | 0.94 (5%) :white_check_mark: |     1.00 (1%)  |
| `["vector", "sum - all different"]`  |                1.25 (5%) :x: |     1.00 (1%)  |
| `["vector", "sum - all equal"]`      |                1.09 (5%) :x: |     1.00 (1%)  |

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
Julia Version 1.6.0-rc2
Commit 4b6b9fe4d7 (2021-03-11 07:05 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1040-azure #42-Ubuntu SMP Fri Feb 5 15:39:06 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz        588 s          2 s        116 s       2273 s          0 s
       #2  2095 MHz       2536 s          1 s        143 s        316 s          0 s
       
  Memory: 6.7913818359375 GB (3326.7578125 MB free)
  Uptime: 313.0 sec
  Load Avg:  1.1  0.96  0.47
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, skylake-avx512)
```

### Baseline
```
Julia Version 1.6.0-rc2
Commit 4b6b9fe4d7 (2021-03-11 07:05 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1040-azure #42-Ubuntu SMP Fri Feb 5 15:39:06 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       1550 s          2 s        132 s       2339 s          0 s
       #2  2095 MHz       2610 s          1 s        148 s       1277 s          0 s
       
  Memory: 6.7913818359375 GB (3418.66015625 MB free)
  Uptime: 418.0 sec
  Load Avg:  1.01  0.98  0.53
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, skylake-avx512)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 15 Mar 2021 - 1:36
* Package commit: 0ba250
* Julia commit: 4b6b9f
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
| `["base", "create"]`                 |   9.701 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  44.751 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  26.132 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  26.232 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  44.245 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  19.201 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.660 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 503.663 ms (5%) | 11.148 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 147.805 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              |  18.001 μs (5%) |           |  19.05 KiB (1%) |         260 |
| `["uncertain", "log"]`               |  18.002 μs (5%) |           |  19.09 KiB (1%) |         261 |
| `["uncertain", "zeta"]`              |  14.901 μs (5%) |           |   3.27 KiB (1%) |          55 |
| `["vector", "gamma"]`                |   1.075 ms (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.942 s (5%) | 11.421 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 308.121 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 573.404 ms (5%) | 17.175 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 109.579 ms (5%) | 13.895 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 363.025 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.411 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 291.720 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 513.264 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 131.509 μs (5%) |           | 156.45 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.6.0-rc2
Commit 4b6b9fe4d7 (2021-03-11 07:05 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1040-azure #42-Ubuntu SMP Fri Feb 5 15:39:06 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz        588 s          2 s        116 s       2273 s          0 s
       #2  2095 MHz       2536 s          1 s        143 s        316 s          0 s
       
  Memory: 6.7913818359375 GB (3326.7578125 MB free)
  Uptime: 313.0 sec
  Load Avg:  1.1  0.96  0.47
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, skylake-avx512)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 15 Mar 2021 - 1:38
* Package commit: 287f57
* Julia commit: 4b6b9f
* Julia command flags: None
* Environment variables: None

## Results
Below is a table of this job's results, obtained by running the benchmarks.
The values listed in the `ID` column have the structure `[parent_group, child_group, ..., key]`, and can be used to
index into the BaseBenchmarks suite to retrieve the corresponding benchmarks.
The percentages accompanying time and memory values in the below table are noise tolerances. The "true"
time/memory value for a given benchmark is expected to fall within this percentage of the reported value.
An empty cell means that the value was zero.

| ID                                   | time            | GC time  | memory          | allocations |
|--------------------------------------|----------------:|---------:|----------------:|------------:|
| `["base", "create"]`                 |   9.100 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  43.437 ns (5%) |          |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  26.031 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  25.932 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  43.235 ns (5%) |          |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  18.701 μs (5%) |          |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.660 μs (5%) |          |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 497.490 ms (5%) | 9.020 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 147.566 ns (5%) |          |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 700.000 ns (5%) |          |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 800.000 ns (5%) |          |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.700 μs (5%) |          |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                |   1.075 ms (5%) |          | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.914 s (5%) | 7.979 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 310.322 μs (5%) |          | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 609.524 ms (5%) | 9.022 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 105.027 ms (5%) | 8.022 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 375.626 μs (5%) |          | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.393 ms (5%) |          |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 295.820 μs (5%) |          | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 409.388 ms (5%) |          | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 120.408 μs (5%) |          | 156.45 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.6.0-rc2
Commit 4b6b9fe4d7 (2021-03-11 07:05 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1040-azure #42-Ubuntu SMP Fri Feb 5 15:39:06 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       1550 s          2 s        132 s       2339 s          0 s
       #2  2095 MHz       2610 s          1 s        148 s       1277 s          0 s
       
  Memory: 6.7913818359375 GB (3418.66015625 MB free)
  Uptime: 418.0 sec
  Load Avg:  1.01  0.98  0.53
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

    Architecture:                    x86_64
    CPU op-mode(s):                  32-bit, 64-bit
    Byte Order:                      Little Endian
    Address sizes:                   46 bits physical, 48 bits virtual
    CPU(s):                          2
    On-line CPU(s) list:             0,1
    Thread(s) per core:              1
    Core(s) per socket:              2
    Socket(s):                       1
    NUMA node(s):                    1
    Vendor ID:                       GenuineIntel
    CPU family:                      6
    Model:                           85
    Model name:                      Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz
    Stepping:                        4
    CPU MHz:                         2095.193
    BogoMIPS:                        4190.38
    Hypervisor vendor:               Microsoft
    Virtualization type:             full
    L1d cache:                       64 KiB
    L1i cache:                       64 KiB
    L2 cache:                        2 MiB
    L3 cache:                        35.8 MiB
    NUMA node0 CPU(s):               0,1
    Vulnerability Itlb multihit:     KVM: Vulnerable
    Vulnerability L1tf:              Mitigation; PTE Inversion
    Vulnerability Mds:               Mitigation; Clear CPU buffers; SMT Host state unknown
    Vulnerability Meltdown:          Mitigation; PTI
    Vulnerability Spec store bypass: Vulnerable
    Vulnerability Spectre v1:        Mitigation; usercopy/swapgs barriers and __user pointer sanitization
    Vulnerability Spectre v2:        Mitigation; Full generic retpoline, STIBP disabled, RSB filling
    Vulnerability Srbds:             Not affected
    Vulnerability Tsx async abort:   Mitigation; Clear CPU buffers; SMT Host state unknown
    Flags:                           fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt avx512cd avx512bw avx512vl xsaveopt xsavec xsaves md_clear
    

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

