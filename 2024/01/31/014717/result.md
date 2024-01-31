# Benchmark result

* Pull request commit: [`410d2e8298ed111b3476cab02c82c1a216de1260`](https://github.com/JuliaPhysics/Measurements.jl/commit/410d2e8298ed111b3476cab02c82c1a216de1260)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/165> (Add compat bound for `Printf`)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 31 Jan 2024 - 01:45
    - Baseline: 31 Jan 2024 - 01:46
* Package commits:
    - Target: 437273
    - Baseline: b23a96
* Julia commits:
    - Target: 17cfb8
    - Baseline: 17cfb8
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

| ID                                   | time ratio                   | memory ratio |
|--------------------------------------|------------------------------|--------------|
| `["base", "create"]`                 | 0.95 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "prod - all equal"]`     | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |

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
Julia Version 1.8.5
Commit 17cfb8e65ea (2023-01-08 06:45 UTC)
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 22.04.3 LTS
  uname: Linux 6.2.0-1018-azure #18~22.04.1-Ubuntu SMP Tue Nov 21 19:25:02 UTC 2023 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1  3274 MHz        607 s          0 s         61 s       1680 s          0 s
       #2  3242 MHz        845 s          0 s         67 s       1441 s          0 s
       #3  2445 MHz        484 s          0 s         74 s       1786 s          0 s
       #4  2445 MHz        411 s          0 s         73 s       1861 s          0 s
  Memory: 15.60690689086914 GB (13753.3046875 MB free)
  Uptime: 237.08 sec
  Load Avg:  1.0  0.57  0.24
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, znver3)
  Threads: 1 on 4 virtual cores
```

### Baseline
```
Julia Version 1.8.5
Commit 17cfb8e65ea (2023-01-08 06:45 UTC)
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 22.04.3 LTS
  uname: Linux 6.2.0-1018-azure #18~22.04.1-Ubuntu SMP Tue Nov 21 19:25:02 UTC 2023 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1  2445 MHz        897 s          0 s         72 s       2165 s          0 s
       #2  3242 MHz       1022 s          0 s         74 s       2044 s          0 s
       #3  2495 MHz        603 s          0 s         80 s       2448 s          0 s
       #4  3218 MHz        603 s          0 s         77 s       2453 s          0 s
  Memory: 15.60690689086914 GB (13785.08203125 MB free)
  Uptime: 315.96 sec
  Load Avg:  1.0  0.68  0.31
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, znver3)
  Threads: 1 on 4 virtual cores
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 31 Jan 2024 - 1:45
* Package commit: 437273
* Julia commit: 17cfb8
* Julia command flags: None
* Environment variables: None

## Results
Below is a table of this job's results, obtained by running the benchmarks.
The values listed in the `ID` column have the structure `[parent_group, child_group, ..., key]`, and can be used to
index into the BaseBenchmarks suite to retrieve the corresponding benchmarks.
The percentages accompanying time and memory values in the below table are noise tolerances. The "true"
time/memory value for a given benchmark is expected to fall within this percentage of the reported value.
An empty cell means that the value was zero.

| ID                                   | time            | GC time    | memory          | allocations |
|--------------------------------------|----------------:|-----------:|----------------:|------------:|
| `["base", "create"]`                 |   7.023 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  34.153 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  17.116 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  17.096 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  33.901 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  81.012 μs (5%) |            | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.084 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    2.080 s (5%) | 683.744 ms |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 125.368 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 532.309 ns (5%) |            |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 546.763 ns (5%) |            |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 533.737 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 814.607 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    2.183 s (5%) |   5.855 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 223.118 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 296.058 ms (5%) |   8.449 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     |  60.374 ms (5%) |   6.016 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 256.040 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.039 ms (5%) |            |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 207.148 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 217.877 ms (5%) |            | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      |  73.197 μs (5%) |            | 156.39 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.8.5
Commit 17cfb8e65ea (2023-01-08 06:45 UTC)
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 22.04.3 LTS
  uname: Linux 6.2.0-1018-azure #18~22.04.1-Ubuntu SMP Tue Nov 21 19:25:02 UTC 2023 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1  3274 MHz        607 s          0 s         61 s       1680 s          0 s
       #2  3242 MHz        845 s          0 s         67 s       1441 s          0 s
       #3  2445 MHz        484 s          0 s         74 s       1786 s          0 s
       #4  2445 MHz        411 s          0 s         73 s       1861 s          0 s
  Memory: 15.60690689086914 GB (13753.3046875 MB free)
  Uptime: 237.08 sec
  Load Avg:  1.0  0.57  0.24
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, znver3)
  Threads: 1 on 4 virtual cores
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 31 Jan 2024 - 1:46
* Package commit: b23a96
* Julia commit: 17cfb8
* Julia command flags: None
* Environment variables: None

## Results
Below is a table of this job's results, obtained by running the benchmarks.
The values listed in the `ID` column have the structure `[parent_group, child_group, ..., key]`, and can be used to
index into the BaseBenchmarks suite to retrieve the corresponding benchmarks.
The percentages accompanying time and memory values in the below table are noise tolerances. The "true"
time/memory value for a given benchmark is expected to fall within this percentage of the reported value.
An empty cell means that the value was zero.

| ID                                   | time            | GC time    | memory          | allocations |
|--------------------------------------|----------------:|-----------:|----------------:|------------:|
| `["base", "create"]`                 |   7.414 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  34.455 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  17.116 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  17.106 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  34.021 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  81.252 μs (5%) |            | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.095 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    1.995 s (5%) | 663.479 ms |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 125.379 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 526.953 ns (5%) |            |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 541.911 ns (5%) |            |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 529.258 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 817.464 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    2.195 s (5%) |   4.766 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 224.441 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 305.676 ms (5%) |   7.052 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     |  65.571 ms (5%) |   7.395 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 250.941 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.030 ms (5%) |            |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 198.652 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 211.977 ms (5%) |            | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      |  73.187 μs (5%) |            | 156.39 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.8.5
Commit 17cfb8e65ea (2023-01-08 06:45 UTC)
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 22.04.3 LTS
  uname: Linux 6.2.0-1018-azure #18~22.04.1-Ubuntu SMP Tue Nov 21 19:25:02 UTC 2023 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1  2445 MHz        897 s          0 s         72 s       2165 s          0 s
       #2  3242 MHz       1022 s          0 s         74 s       2044 s          0 s
       #3  2495 MHz        603 s          0 s         80 s       2448 s          0 s
       #4  3218 MHz        603 s          0 s         77 s       2453 s          0 s
  Memory: 15.60690689086914 GB (13785.08203125 MB free)
  Uptime: 315.96 sec
  Load Avg:  1.0  0.68  0.31
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, znver3)
  Threads: 1 on 4 virtual cores
```

---
# Runtime information
| Runtime Info | |
|:--|:--|
| BLAS #threads | 2 |
| `BLAS.vendor()` | `openblas64` |
| `Sys.CPU_THREADS` | 4 |

`lscpu` output:

    Architecture:                       x86_64
    CPU op-mode(s):                     32-bit, 64-bit
    Address sizes:                      48 bits physical, 48 bits virtual
    Byte Order:                         Little Endian
    CPU(s):                             4
    On-line CPU(s) list:                0-3
    Vendor ID:                          AuthenticAMD
    Model name:                         AMD EPYC 7763 64-Core Processor
    CPU family:                         25
    Model:                              1
    Thread(s) per core:                 2
    Core(s) per socket:                 2
    Socket(s):                          1
    Stepping:                           1
    BogoMIPS:                           4890.85
    Flags:                              fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl tsc_reliable nonstop_tsc cpuid extd_apicid aperfmperf pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm cmp_legacy svm cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw topoext invpcid_single vmmcall fsgsbase bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 xsaves clzero xsaveerptr rdpru arat npt nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold v_vmsave_vmload umip vaes vpclmulqdq rdpid fsrm
    Virtualization:                     AMD-V
    Hypervisor vendor:                  Microsoft
    Virtualization type:                full
    L1d cache:                          64 KiB (2 instances)
    L1i cache:                          64 KiB (2 instances)
    L2 cache:                           1 MiB (2 instances)
    L3 cache:                           32 MiB (1 instance)
    NUMA node(s):                       1
    NUMA node0 CPU(s):                  0-3
    Vulnerability Gather data sampling: Not affected
    Vulnerability Itlb multihit:        Not affected
    Vulnerability L1tf:                 Not affected
    Vulnerability Mds:                  Not affected
    Vulnerability Meltdown:             Not affected
    Vulnerability Mmio stale data:      Not affected
    Vulnerability Retbleed:             Not affected
    Vulnerability Spec rstack overflow: Mitigation; safe RET, no microcode
    Vulnerability Spec store bypass:    Vulnerable
    Vulnerability Spectre v1:           Mitigation; usercopy/swapgs barriers and __user pointer sanitization
    Vulnerability Spectre v2:           Mitigation; Retpolines, STIBP disabled, RSB filling, PBRSB-eIBRS Not affected
    Vulnerability Srbds:                Not affected
    Vulnerability Tsx async abort:      Not affected
    

| Cpu Property       | Value                                                      |
|:------------------ |:---------------------------------------------------------- |
| Brand              | AMD EPYC 7763 64-Core Processor                            |
| Vendor             | :AMD                                                       |
| Architecture       | :Unknown                                                   |
| Model              | Family: 0xaf, Model: 0x01, Stepping: 0x01, Type: 0x00      |
| Cores              | 16 physical cores, 16 logical cores (on executing CPU)     |
|                    | No Hyperthreading hardware capability detected             |
| Clock Frequencies  | Not supported by CPU                                       |
| Data Cache         | Level 1:3 : (32, 512, 32768) kbytes                        |
|                    | 64 byte cache line size                                    |
| Address Size       | 48 bits virtual, 48 bits physical                          |
| SIMD               | 256 bit = 32 byte max. SIMD vector size                    |
| Time Stamp Counter | TSC is accessible via `rdtsc`                              |
|                    | TSC runs at constant rate (invariant from clock frequency) |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported    |
| Hypervisor         | Yes, Microsoft                                             |

