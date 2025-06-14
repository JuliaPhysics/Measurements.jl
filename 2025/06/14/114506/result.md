# Benchmark result

* Pull request commit: [`ea8049161161bd34c64fa9d21a0376fb02212e0a`](https://github.com/JuliaPhysics/Measurements.jl/commit/ea8049161161bd34c64fa9d21a0376fb02212e0a)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/183> (Release v2.13.0)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 14 Jun 2025 - 11:43
    - Baseline: 14 Jun 2025 - 11:44
* Package commits:
    - Target: 02b4e9
    - Baseline: b34c4f
* Julia commits:
    - Target: d63ade
    - Baseline: d63ade
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
| `["quadgk", "sin"]`                  | 1.13 (5%) :x: |   1.00 (1%)  |
| `["vector", "prod - all equal"]`     | 1.06 (5%) :x: |   1.00 (1%)  |
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
Julia Version 1.11.3
Commit d63adeda50d (2025-01-21 19:42 UTC)
Build Info:
  Official https://julialang.org/ release
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 24.04.2 LTS
  uname: Linux 6.11.0-1015-azure #15~24.04.1-Ubuntu SMP Thu May  1 02:52:08 UTC 2025 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        573 s          0 s         78 s       3040 s          0 s
       #2     0 MHz       1014 s          0 s         99 s       2550 s          0 s
       #3     0 MHz        772 s          0 s         88 s       2790 s          0 s
       #4     0 MHz        565 s          0 s         87 s       3031 s          0 s
  Memory: 15.620769500732422 GB (11683.78125 MB free)
  Uptime: 375.74 sec
  Load Avg:  1.04  0.73  0.32
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver3)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

### Baseline
```
Julia Version 1.11.3
Commit d63adeda50d (2025-01-21 19:42 UTC)
Build Info:
  Official https://julialang.org/ release
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 24.04.2 LTS
  uname: Linux 6.11.0-1015-azure #15~24.04.1-Ubuntu SMP Thu May  1 02:52:08 UTC 2025 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        796 s          0 s         83 s       3604 s          0 s
       #2     0 MHz       1041 s          0 s        104 s       3310 s          0 s
       #3     0 MHz       1192 s          0 s        106 s       3146 s          0 s
       #4     0 MHz        668 s          0 s         94 s       3713 s          0 s
  Memory: 15.620769500732422 GB (11665.57421875 MB free)
  Uptime: 455.13 sec
  Load Avg:  1.01  0.79  0.38
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver3)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 14 Jun 2025 - 11:43
* Package commit: 02b4e9
* Julia commit: d63ade
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
| `["base", "create"]`                 |   9.006 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  31.598 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  18.600 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  18.600 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  31.185 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  87.273 μs (5%) |            | 271.19 KiB (1%) |        5643 |
| `["quadgk", "int1"]`                 |   1.138 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    1.859 s (5%) | 196.743 ms |   2.82 GiB (1%) |    59960357 |
| `["specfun", "gamma"]`               | 114.659 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 562.093 ns (5%) |            |  624 bytes (1%) |          23 |
| `["uncertain", "log"]`               | 555.137 ns (5%) |            |  672 bytes (1%) |          24 |
| `["uncertain", "zeta"]`              | 453.081 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 836.684 μs (5%) |            | 781.31 KiB (1%) |       10003 |
| `["vector", "mean - all different"]` |    2.246 s (5%) |   7.597 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 211.596 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 281.285 ms (5%) |  15.759 ms | 764.16 MiB (1%) |       40006 |
| `["vector", "prod - all equal"]`     |  50.901 ms (5%) |  10.653 ms | 763.70 MiB (1%) |       30007 |
| `["vector", "sin"]`                  | 258.724 μs (5%) |            | 781.31 KiB (1%) |       10003 |
| `["vector", "sin²+cos²"]`            |   1.061 ms (5%) |            |   2.14 MiB (1%) |       40003 |
| `["vector", "sqrt"]`                 | 230.971 μs (5%) |            | 781.31 KiB (1%) |       10003 |
| `["vector", "sum - all different"]`  | 226.522 ms (5%) |            | 625.09 KiB (1%) |       10005 |
| `["vector", "sum - all equal"]`      |  55.284 μs (5%) |            | 156.39 KiB (1%) |           6 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.11.3
Commit d63adeda50d (2025-01-21 19:42 UTC)
Build Info:
  Official https://julialang.org/ release
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 24.04.2 LTS
  uname: Linux 6.11.0-1015-azure #15~24.04.1-Ubuntu SMP Thu May  1 02:52:08 UTC 2025 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        573 s          0 s         78 s       3040 s          0 s
       #2     0 MHz       1014 s          0 s         99 s       2550 s          0 s
       #3     0 MHz        772 s          0 s         88 s       2790 s          0 s
       #4     0 MHz        565 s          0 s         87 s       3031 s          0 s
  Memory: 15.620769500732422 GB (11683.78125 MB free)
  Uptime: 375.74 sec
  Load Avg:  1.04  0.73  0.32
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver3)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 14 Jun 2025 - 11:44
* Package commit: b34c4f
* Julia commit: d63ade
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
| `["base", "create"]`                 |   9.056 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  31.215 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  18.611 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  18.630 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  30.792 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  87.123 μs (5%) |            | 271.19 KiB (1%) |        5643 |
| `["quadgk", "int1"]`                 |   1.145 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    1.639 s (5%) | 174.415 ms |   2.82 GiB (1%) |    59960357 |
| `["specfun", "gamma"]`               | 113.981 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 547.231 ns (5%) |            |  624 bytes (1%) |          23 |
| `["uncertain", "log"]`               | 558.967 ns (5%) |            |  672 bytes (1%) |          24 |
| `["uncertain", "zeta"]`              | 454.198 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 833.328 μs (5%) |            | 781.31 KiB (1%) |       10003 |
| `["vector", "mean - all different"]` |    2.217 s (5%) |   5.124 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 206.766 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 276.885 ms (5%) |  14.050 ms | 764.16 MiB (1%) |       40006 |
| `["vector", "prod - all equal"]`     |  48.035 ms (5%) |   9.360 ms | 763.70 MiB (1%) |       30007 |
| `["vector", "sin"]`                  | 256.299 μs (5%) |            | 781.31 KiB (1%) |       10003 |
| `["vector", "sin²+cos²"]`            |   1.028 ms (5%) |            |   2.14 MiB (1%) |       40003 |
| `["vector", "sqrt"]`                 | 230.181 μs (5%) |            | 781.31 KiB (1%) |       10003 |
| `["vector", "sum - all different"]`  | 230.680 ms (5%) |            | 625.09 KiB (1%) |       10005 |
| `["vector", "sum - all equal"]`      |  50.865 μs (5%) |            | 156.39 KiB (1%) |           6 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.11.3
Commit d63adeda50d (2025-01-21 19:42 UTC)
Build Info:
  Official https://julialang.org/ release
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 24.04.2 LTS
  uname: Linux 6.11.0-1015-azure #15~24.04.1-Ubuntu SMP Thu May  1 02:52:08 UTC 2025 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        796 s          0 s         83 s       3604 s          0 s
       #2     0 MHz       1041 s          0 s        104 s       3310 s          0 s
       #3     0 MHz       1192 s          0 s        106 s       3146 s          0 s
       #4     0 MHz        668 s          0 s         94 s       3713 s          0 s
  Memory: 15.620769500732422 GB (11665.57421875 MB free)
  Uptime: 455.13 sec
  Load Avg:  1.01  0.79  0.38
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver3)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

---
# Runtime information
| Runtime Info | |
|:--|:--|
| BLAS #threads | 2 |
| `BLAS.vendor()` | `lbt` |
| `Sys.CPU_THREADS` | 4 |

`lscpu` output:

    Architecture:                         x86_64
    CPU op-mode(s):                       32-bit, 64-bit
    Address sizes:                        48 bits physical, 48 bits virtual
    Byte Order:                           Little Endian
    CPU(s):                               4
    On-line CPU(s) list:                  0-3
    Vendor ID:                            AuthenticAMD
    Model name:                           AMD EPYC 7763 64-Core Processor
    CPU family:                           25
    Model:                                1
    Thread(s) per core:                   2
    Core(s) per socket:                   2
    Socket(s):                            1
    Stepping:                             1
    BogoMIPS:                             4890.86
    Flags:                                fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl tsc_reliable nonstop_tsc cpuid extd_apicid aperfmperf tsc_known_freq pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm cmp_legacy svm cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw topoext vmmcall fsgsbase bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 xsaves user_shstk clzero xsaveerptr rdpru arat npt nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold v_vmsave_vmload umip vaes vpclmulqdq rdpid fsrm
    Virtualization:                       AMD-V
    Hypervisor vendor:                    Microsoft
    Virtualization type:                  full
    L1d cache:                            64 KiB (2 instances)
    L1i cache:                            64 KiB (2 instances)
    L2 cache:                             1 MiB (2 instances)
    L3 cache:                             32 MiB (1 instance)
    NUMA node(s):                         1
    NUMA node0 CPU(s):                    0-3
    Vulnerability Gather data sampling:   Not affected
    Vulnerability Itlb multihit:          Not affected
    Vulnerability L1tf:                   Not affected
    Vulnerability Mds:                    Not affected
    Vulnerability Meltdown:               Not affected
    Vulnerability Mmio stale data:        Not affected
    Vulnerability Reg file data sampling: Not affected
    Vulnerability Retbleed:               Not affected
    Vulnerability Spec rstack overflow:   Vulnerable: Safe RET, no microcode
    Vulnerability Spec store bypass:      Vulnerable
    Vulnerability Spectre v1:             Mitigation; usercopy/swapgs barriers and __user pointer sanitization
    Vulnerability Spectre v2:             Mitigation; Retpolines; STIBP disabled; RSB filling; PBRSB-eIBRS Not affected; BHI Not affected
    Vulnerability Srbds:                  Not affected
    Vulnerability Tsx async abort:        Not affected
    

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

