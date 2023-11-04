# Benchmark result

* Pull request commit: [`745c20095411bb6ced9d291143d7e99c9dccd701`](https://github.com/JuliaPhysics/Measurements.jl/commit/745c20095411bb6ced9d291143d7e99c9dccd701)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/163> (Temporary remove compat bound with `Printf`)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 4 Nov 2023 - 22:32
    - Baseline: 4 Nov 2023 - 22:33
* Package commits:
    - Target: 6b303a
    - Baseline: 79d4b9
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

| ID                                   | time ratio    | memory ratio |
|--------------------------------------|---------------|--------------|
| `["vector", "prod - all different"]` | 1.11 (5%) :x: |   1.00 (1%)  |

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
  uname: Linux 6.2.0-1015-azure #15~22.04.1-Ubuntu SMP Fri Oct  6 13:20:44 UTC 2023 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1  2445 MHz       1013 s          0 s         66 s       1437 s          0 s
       #2  2590 MHz        579 s          0 s         65 s       1887 s          0 s
       #3  2445 MHz        332 s          1 s         85 s       2108 s          0 s
       #4  3240 MHz        380 s          1 s         74 s       2070 s          0 s
  Memory: 15.606914520263672 GB (13785.0859375 MB free)
  Uptime: 254.88 sec
  Load Avg:  1.02  0.64  0.28
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
  uname: Linux 6.2.0-1015-azure #15~22.04.1-Ubuntu SMP Fri Oct  6 13:20:44 UTC 2023 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1  3242 MHz       1432 s          0 s         75 s       1765 s          0 s
       #2  2445 MHz        618 s          0 s         72 s       2597 s          0 s
       #3  3222 MHz        514 s          1 s         90 s       2679 s          0 s
       #4  2706 MHz        490 s          1 s         83 s       2707 s          0 s
  Memory: 15.606914520263672 GB (13803.6796875 MB free)
  Uptime: 330.6 sec
  Load Avg:  1.0  0.72  0.33
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, znver3)
  Threads: 1 on 4 virtual cores
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 4 Nov 2023 - 22:32
* Package commit: 6b303a
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
| `["base", "create"]`                 |   7.350 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  34.142 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  17.075 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  17.046 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  33.900 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  80.149 μs (5%) |            | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.104 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    1.983 s (5%) | 646.515 ms |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 125.335 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 534.042 ns (5%) |            |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 533.000 ns (5%) |            |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 532.894 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 810.037 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    2.192 s (5%) |   5.938 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 222.153 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 288.826 ms (5%) |   4.749 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     |  56.515 ms (5%) |   5.567 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 251.859 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.010 ms (5%) |            |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 203.639 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 206.030 ms (5%) |            | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      |  72.525 μs (5%) |            | 156.39 KiB (1%) |           5 |

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
  uname: Linux 6.2.0-1015-azure #15~22.04.1-Ubuntu SMP Fri Oct  6 13:20:44 UTC 2023 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1  2445 MHz       1013 s          0 s         66 s       1437 s          0 s
       #2  2590 MHz        579 s          0 s         65 s       1887 s          0 s
       #3  2445 MHz        332 s          1 s         85 s       2108 s          0 s
       #4  3240 MHz        380 s          1 s         74 s       2070 s          0 s
  Memory: 15.606914520263672 GB (13785.0859375 MB free)
  Uptime: 254.88 sec
  Load Avg:  1.02  0.64  0.28
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, znver3)
  Threads: 1 on 4 virtual cores
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 4 Nov 2023 - 22:33
* Package commit: 79d4b9
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
| `["base", "create"]`                 |   7.291 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  33.709 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  17.115 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  17.086 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  34.112 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  84.316 μs (5%) |            | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.090 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    1.965 s (5%) | 637.901 ms |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 125.568 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 527.247 ns (5%) |            |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 540.847 ns (5%) |            |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 529.503 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 808.854 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    2.205 s (5%) |   4.347 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 222.434 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 260.136 ms (5%) |   5.156 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     |  54.509 ms (5%) |   4.439 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 247.390 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.011 ms (5%) |            |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 205.653 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 202.658 ms (5%) |            | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      |  71.944 μs (5%) |            | 156.39 KiB (1%) |           5 |

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
  uname: Linux 6.2.0-1015-azure #15~22.04.1-Ubuntu SMP Fri Oct  6 13:20:44 UTC 2023 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1  3242 MHz       1432 s          0 s         75 s       1765 s          0 s
       #2  2445 MHz        618 s          0 s         72 s       2597 s          0 s
       #3  3222 MHz        514 s          1 s         90 s       2679 s          0 s
       #4  2706 MHz        490 s          1 s         83 s       2707 s          0 s
  Memory: 15.606914520263672 GB (13803.6796875 MB free)
  Uptime: 330.6 sec
  Load Avg:  1.0  0.72  0.33
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

