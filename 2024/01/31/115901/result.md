# Benchmark result

* Pull request commit: [`77cba8dda940288b0a21006a5089aebc7c45347e`](https://github.com/JuliaPhysics/Measurements.jl/commit/77cba8dda940288b0a21006a5089aebc7c45347e)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/165> (Add compat bounds for more packages and update Aqua tests)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 31 Jan 2024 - 11:57
    - Baseline: 31 Jan 2024 - 11:58
* Package commits:
    - Target: 10d256
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
| `["base", "create"]`                 |                1.07 (5%) :x: |   1.00 (1%)  |
| `["vector", "prod - all different"]` | 0.89 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  |                1.17 (5%) :x: |   1.00 (1%)  |

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
  uname: Linux 6.2.0-1019-azure #19~22.04.1-Ubuntu SMP Wed Jan 10 22:57:03 UTC 2024 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1  3178 MHz        310 s          0 s         47 s       2651 s          0 s
       #2  2790 MHz        517 s          0 s         53 s       2436 s          0 s
       #3  3243 MHz        441 s          0 s         66 s       2491 s          0 s
       #4  3085 MHz        649 s          0 s         54 s       2295 s          0 s
  Memory: 15.60690689086914 GB (13793.96484375 MB free)
  Uptime: 303.05 sec
  Load Avg:  0.96  0.5  0.21
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
  uname: Linux 6.2.0-1019-azure #19~22.04.1-Ubuntu SMP Wed Jan 10 22:57:03 UTC 2024 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1  3242 MHz        543 s          0 s         52 s       3192 s          0 s
       #2  3219 MHz        827 s          0 s         65 s       2894 s          0 s
       #3  3221 MHz        631 s          0 s         71 s       3076 s          0 s
       #4  2445 MHz        692 s          0 s         62 s       3025 s          0 s
  Memory: 15.60690689086914 GB (13788.2734375 MB free)
  Uptime: 381.2 sec
  Load Avg:  1.05  0.64  0.28
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, znver3)
  Threads: 1 on 4 virtual cores
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 31 Jan 2024 - 11:57
* Package commit: 10d256
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
| `["base", "create"]`                 |   7.504 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  34.050 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  17.146 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  17.116 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  34.092 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  81.202 μs (5%) |            | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.079 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    2.040 s (5%) | 671.642 ms |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 124.942 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 533.047 ns (5%) |            |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 544.261 ns (5%) |            |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 532.884 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 813.585 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    2.200 s (5%) |   6.324 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 223.066 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 268.404 ms (5%) |   8.600 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     |  60.784 ms (5%) |   6.318 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 256.739 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.024 ms (5%) |            |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 207.657 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 230.854 ms (5%) |            | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      |  76.272 μs (5%) |            | 156.39 KiB (1%) |           5 |

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
  uname: Linux 6.2.0-1019-azure #19~22.04.1-Ubuntu SMP Wed Jan 10 22:57:03 UTC 2024 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1  3178 MHz        310 s          0 s         47 s       2651 s          0 s
       #2  2790 MHz        517 s          0 s         53 s       2436 s          0 s
       #3  3243 MHz        441 s          0 s         66 s       2491 s          0 s
       #4  3085 MHz        649 s          0 s         54 s       2295 s          0 s
  Memory: 15.60690689086914 GB (13793.96484375 MB free)
  Uptime: 303.05 sec
  Load Avg:  0.96  0.5  0.21
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, znver3)
  Threads: 1 on 4 virtual cores
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 31 Jan 2024 - 11:58
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
| `["base", "create"]`                 |   7.023 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  34.202 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  17.126 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  17.096 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  33.971 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  82.093 μs (5%) |            | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.082 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    2.002 s (5%) | 663.612 ms |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 125.402 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 525.032 ns (5%) |            |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 538.128 ns (5%) |            |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 528.195 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 808.536 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    2.197 s (5%) |   4.706 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 222.715 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 303.227 ms (5%) |   5.969 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     |  61.022 ms (5%) |   6.523 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 247.290 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.017 ms (5%) |            |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 198.209 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 197.826 ms (5%) |            | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      |  72.695 μs (5%) |            | 156.39 KiB (1%) |           5 |

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
  uname: Linux 6.2.0-1019-azure #19~22.04.1-Ubuntu SMP Wed Jan 10 22:57:03 UTC 2024 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1  3242 MHz        543 s          0 s         52 s       3192 s          0 s
       #2  3219 MHz        827 s          0 s         65 s       2894 s          0 s
       #3  3221 MHz        631 s          0 s         71 s       3076 s          0 s
       #4  2445 MHz        692 s          0 s         62 s       3025 s          0 s
  Memory: 15.60690689086914 GB (13788.2734375 MB free)
  Uptime: 381.2 sec
  Load Avg:  1.05  0.64  0.28
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
    BogoMIPS:                           4890.83
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

