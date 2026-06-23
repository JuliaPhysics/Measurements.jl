# Benchmark result

* Pull request commit: [`f611041d4114ee10e9224a76a204194e8d6ebb03`](https://github.com/JuliaPhysics/Measurements.jl/commit/f611041d4114ee10e9224a76a204194e8d6ebb03)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/206> (Add Supposition.jl-based tests)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 23 Jun 2026 - 23:45
    - Baseline: 23 Jun 2026 - 23:46
* Package commits:
    - Target: 6916d1a
    - Baseline: 00b5191
* Julia commits:
    - Target: f2b3dbd
    - Baseline: f2b3dbd
* Julia command flags:
    - Target: None
    - Baseline: None
* Environment variables:
    - Target: None
    - Baseline: None

## Results
A ratio greater than `1.0` denotes a possible regression (marked with :x:), while a ratio less
than `1.0` denotes a possible improvement (marked with :white_check_mark:). Brackets display [tolerances](https://juliaci.github.io/BenchmarkTools.jl/stable/manual/#Benchmark-Parameters) for the benchmark estimates. Only significant results - results
that indicate possible regressions or improvements - are shown below (thus, an empty table means that all
benchmark results remained invariant between builds).

| ID                                   | time ratio                   | memory ratio |
|--------------------------------------|------------------------------|--------------|
| `["vector", "prod - all different"]` |                1.13 (5%) :x: |   1.00 (1%)  |
| `["vector", "prod - all equal"]`     |                2.08 (5%) :x: |   1.00 (1%)  |
| `["vector", "sqrt"]`                 |                1.05 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sum - all equal"]`      | 0.91 (5%) :white_check_mark: |   1.00 (1%)  |

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
Julia Version 1.11.7
Commit f2b3dbda30a (2025-09-08 12:10 UTC)
Build Info:
  Official https://julialang.org/ release
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 24.04.4 LTS
  uname: Linux 6.17.0-1018-azure #18~24.04.1-Ubuntu SMP Thu May 28 16:39:11 UTC 2026 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        306 s          0 s         46 s       1003 s          0 s
       #2     0 MHz        394 s          0 s         44 s        919 s          0 s
       #3     0 MHz        461 s          0 s         46 s        846 s          0 s
       #4     0 MHz        102 s          0 s         36 s       1204 s          0 s
  Memory: 15.61898422241211 GB (11121.17578125 MB free)
  Uptime: 139.4 sec
  Load Avg:  0.92  0.38  0.14
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver3)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

### Baseline
```
Julia Version 1.11.7
Commit f2b3dbda30a (2025-09-08 12:10 UTC)
Build Info:
  Official https://julialang.org/ release
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 24.04.4 LTS
  uname: Linux 6.17.0-1018-azure #18~24.04.1-Ubuntu SMP Thu May 28 16:39:11 UTC 2026 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        508 s          0 s         56 s       1605 s          0 s
       #2     0 MHz        731 s          0 s         54 s       1384 s          0 s
       #3     0 MHz        690 s          0 s         53 s       1424 s          0 s
       #4     0 MHz        127 s          0 s         37 s       1990 s          0 s
  Memory: 15.61898422241211 GB (11806.31640625 MB free)
  Uptime: 220.89 sec
  Load Avg:  0.98  0.54  0.22
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver3)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 23 Jun 2026 - 23:45
* Package commit: 6916d1a
* Julia commit: f2b3dbd
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
| `["base", "multiplication"]`         |  31.375 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  18.622 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  18.611 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  32.039 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  87.944 μs (5%) |            | 271.20 KiB (1%) |        5643 |
| `["quadgk", "int1"]`                 |   1.136 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    1.734 s (5%) | 284.942 ms |   2.82 GiB (1%) |    59960357 |
| `["specfun", "gamma"]`               | 109.005 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 546.328 ns (5%) |            |  624 bytes (1%) |          23 |
| `["uncertain", "log"]`               | 573.021 ns (5%) |            |  672 bytes (1%) |          24 |
| `["uncertain", "zeta"]`              | 455.330 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 781.131 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "mean - all different"]` |    2.250 s (5%) |  10.357 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 212.424 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 299.332 ms (5%) |  14.520 ms | 764.24 MiB (1%) |       40006 |
| `["vector", "prod - all equal"]`     |  96.718 ms (5%) |  13.537 ms | 763.78 MiB (1%) |       30007 |
| `["vector", "sin"]`                  | 259.993 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "sin²+cos²"]`            |   1.058 ms (5%) |            |   2.14 MiB (1%) |       40003 |
| `["vector", "sqrt"]`                 | 243.974 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "sum - all different"]`  | 205.535 ms (5%) |            | 625.11 KiB (1%) |       10005 |
| `["vector", "sum - all equal"]`      |  51.085 μs (5%) |            | 156.41 KiB (1%) |           6 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.11.7
Commit f2b3dbda30a (2025-09-08 12:10 UTC)
Build Info:
  Official https://julialang.org/ release
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 24.04.4 LTS
  uname: Linux 6.17.0-1018-azure #18~24.04.1-Ubuntu SMP Thu May 28 16:39:11 UTC 2026 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        306 s          0 s         46 s       1003 s          0 s
       #2     0 MHz        394 s          0 s         44 s        919 s          0 s
       #3     0 MHz        461 s          0 s         46 s        846 s          0 s
       #4     0 MHz        102 s          0 s         36 s       1204 s          0 s
  Memory: 15.61898422241211 GB (11121.17578125 MB free)
  Uptime: 139.4 sec
  Load Avg:  0.92  0.38  0.14
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver3)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 23 Jun 2026 - 23:46
* Package commit: 00b5191
* Julia commit: f2b3dbd
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
| `["base", "create"]`                 |   9.045 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  31.627 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  18.602 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  18.590 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  31.284 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  88.154 μs (5%) |            | 271.20 KiB (1%) |        5643 |
| `["quadgk", "int1"]`                 |   1.144 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    1.733 s (5%) | 294.281 ms |   2.82 GiB (1%) |    59960357 |
| `["specfun", "gamma"]`               | 109.112 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 541.578 ns (5%) |            |  624 bytes (1%) |          23 |
| `["uncertain", "log"]`               | 550.175 ns (5%) |            |  672 bytes (1%) |          24 |
| `["uncertain", "zeta"]`              | 456.415 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 769.731 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "mean - all different"]` |    2.258 s (5%) |   8.500 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 210.131 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 265.096 ms (5%) |  12.616 ms | 764.24 MiB (1%) |       40006 |
| `["vector", "prod - all equal"]`     |  46.464 ms (5%) |   8.135 ms | 763.78 MiB (1%) |       30007 |
| `["vector", "sin"]`                  | 259.792 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "sin²+cos²"]`            |   1.056 ms (5%) |            |   2.14 MiB (1%) |       40003 |
| `["vector", "sqrt"]`                 | 231.991 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "sum - all different"]`  | 218.261 ms (5%) |            | 625.11 KiB (1%) |       10005 |
| `["vector", "sum - all equal"]`      |  56.314 μs (5%) |            | 156.41 KiB (1%) |           6 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.11.7
Commit f2b3dbda30a (2025-09-08 12:10 UTC)
Build Info:
  Official https://julialang.org/ release
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 24.04.4 LTS
  uname: Linux 6.17.0-1018-azure #18~24.04.1-Ubuntu SMP Thu May 28 16:39:11 UTC 2026 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        508 s          0 s         56 s       1605 s          0 s
       #2     0 MHz        731 s          0 s         54 s       1384 s          0 s
       #3     0 MHz        690 s          0 s         53 s       1424 s          0 s
       #4     0 MHz        127 s          0 s         37 s       1990 s          0 s
  Memory: 15.61898422241211 GB (11806.31640625 MB free)
  Uptime: 220.89 sec
  Load Avg:  0.98  0.54  0.22
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

    Architecture:                            x86_64
    CPU op-mode(s):                          32-bit, 64-bit
    Address sizes:                           48 bits physical, 48 bits virtual
    Byte Order:                              Little Endian
    CPU(s):                                  4
    On-line CPU(s) list:                     0-3
    Vendor ID:                               AuthenticAMD
    Model name:                              AMD EPYC 7763 64-Core Processor
    CPU family:                              25
    Model:                                   1
    Thread(s) per core:                      2
    Core(s) per socket:                      2
    Socket(s):                               1
    Stepping:                                1
    BogoMIPS:                                4890.86
    Flags:                                   fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl tsc_reliable nonstop_tsc cpuid extd_apicid aperfmperf tsc_known_freq pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm cmp_legacy svm cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw topoext vmmcall fsgsbase bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 xsaves user_shstk clzero xsaveerptr rdpru arat npt nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold v_vmsave_vmload umip vaes vpclmulqdq rdpid fsrm
    Virtualization:                          AMD-V
    Hypervisor vendor:                       Microsoft
    Virtualization type:                     full
    L1d cache:                               64 KiB (2 instances)
    L1i cache:                               64 KiB (2 instances)
    L2 cache:                                1 MiB (2 instances)
    L3 cache:                                32 MiB (1 instance)
    NUMA node(s):                            1
    NUMA node0 CPU(s):                       0-3
    Vulnerability Gather data sampling:      Not affected
    Vulnerability Ghostwrite:                Not affected
    Vulnerability Indirect target selection: Not affected
    Vulnerability Itlb multihit:             Not affected
    Vulnerability L1tf:                      Not affected
    Vulnerability Mds:                       Not affected
    Vulnerability Meltdown:                  Not affected
    Vulnerability Mmio stale data:           Not affected
    Vulnerability Old microcode:             Not affected
    Vulnerability Reg file data sampling:    Not affected
    Vulnerability Retbleed:                  Not affected
    Vulnerability Spec rstack overflow:      Vulnerable: Safe RET, no microcode
    Vulnerability Spec store bypass:         Vulnerable
    Vulnerability Spectre v1:                Mitigation; usercopy/swapgs barriers and __user pointer sanitization
    Vulnerability Spectre v2:                Mitigation; Retpolines; STIBP disabled; RSB filling; PBRSB-eIBRS Not affected; BHI Not affected
    Vulnerability Srbds:                     Not affected
    Vulnerability Tsa:                       Vulnerable: No microcode
    Vulnerability Tsx async abort:           Not affected
    Vulnerability Vmscape:                   Not affected
    

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

