# Benchmark result

* Pull request commit: [`d11fe8f490972c21ae61ce70fe2ee218b4429013`](https://github.com/JuliaPhysics/Measurements.jl/commit/d11fe8f490972c21ae61ce70fe2ee218b4429013)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/200> (Bump julia-actions/cache from 2 to 3)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 9 Mar 2026 - 10:09
    - Baseline: 9 Mar 2026 - 10:10
* Package commits:
    - Target: 5689647
    - Baseline: 496425c
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
| `["quadgk", "sin"]`                  |                1.06 (5%) :x: |   1.00 (1%)  |
| `["vector", "prod - all different"]` |                1.12 (5%) :x: |   1.00 (1%)  |
| `["vector", "prod - all equal"]`     |                1.06 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  | 0.91 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sum - all equal"]`      | 0.95 (5%) :white_check_mark: |   1.00 (1%)  |

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
      Ubuntu 24.04.3 LTS
  uname: Linux 6.14.0-1017-azure #17~24.04.1-Ubuntu SMP Mon Dec  1 20:10:50 UTC 2025 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        345 s          0 s         54 s        999 s          0 s
       #2     0 MHz        467 s          0 s         54 s        883 s          0 s
       #3     0 MHz        336 s          0 s         46 s       1020 s          0 s
       #4     0 MHz         99 s          0 s         46 s       1246 s          0 s
  Memory: 15.619735717773438 GB (11856.48046875 MB free)
  Uptime: 142.93 sec
  Load Avg:  0.86  0.33  0.12
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
      Ubuntu 24.04.3 LTS
  uname: Linux 6.14.0-1017-azure #17~24.04.1-Ubuntu SMP Mon Dec  1 20:10:50 UTC 2025 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        522 s          0 s         64 s       1624 s          0 s
       #2     0 MHz       1036 s          0 s         72 s       1110 s          0 s
       #3     0 MHz        377 s          0 s         49 s       1787 s          0 s
       #4     0 MHz        104 s          0 s         48 s       2050 s          0 s
  Memory: 15.619735717773438 GB (11797.79296875 MB free)
  Uptime: 224.21 sec
  Load Avg:  0.97  0.49  0.2
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver3)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 9 Mar 2026 - 10:09
* Package commit: 5689647
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
| `["base", "create"]`                 |   9.036 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  31.838 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  18.712 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  18.701 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  32.111 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  89.567 μs (5%) |            | 271.20 KiB (1%) |        5643 |
| `["quadgk", "int1"]`                 |   1.145 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    1.789 s (5%) | 255.406 ms |   2.82 GiB (1%) |    59960357 |
| `["specfun", "gamma"]`               | 109.070 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 557.812 ns (5%) |            |  624 bytes (1%) |          23 |
| `["uncertain", "log"]`               | 565.503 ns (5%) |            |  672 bytes (1%) |          24 |
| `["uncertain", "zeta"]`              | 456.193 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 782.814 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "mean - all different"]` |    2.266 s (5%) |   8.657 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 209.451 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 310.722 ms (5%) |  15.701 ms | 764.24 MiB (1%) |       40006 |
| `["vector", "prod - all equal"]`     |  48.605 ms (5%) |   9.148 ms | 763.78 MiB (1%) |       30007 |
| `["vector", "sin"]`                  | 266.899 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "sin²+cos²"]`            |   1.026 ms (5%) |            |   2.14 MiB (1%) |       40003 |
| `["vector", "sqrt"]`                 | 230.921 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "sum - all different"]`  | 214.951 ms (5%) |            | 625.11 KiB (1%) |       10005 |
| `["vector", "sum - all equal"]`      |  50.875 μs (5%) |            | 156.41 KiB (1%) |           6 |

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
      Ubuntu 24.04.3 LTS
  uname: Linux 6.14.0-1017-azure #17~24.04.1-Ubuntu SMP Mon Dec  1 20:10:50 UTC 2025 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        345 s          0 s         54 s        999 s          0 s
       #2     0 MHz        467 s          0 s         54 s        883 s          0 s
       #3     0 MHz        336 s          0 s         46 s       1020 s          0 s
       #4     0 MHz         99 s          0 s         46 s       1246 s          0 s
  Memory: 15.619735717773438 GB (11856.48046875 MB free)
  Uptime: 142.93 sec
  Load Avg:  0.86  0.33  0.12
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver3)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 9 Mar 2026 - 10:10
* Package commit: 496425c
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
| `["base", "multiplication"]`         |  31.466 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  18.692 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  18.690 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  31.405 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  86.081 μs (5%) |            | 271.20 KiB (1%) |        5643 |
| `["quadgk", "int1"]`                 |   1.143 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    1.685 s (5%) | 272.822 ms |   2.82 GiB (1%) |    59960357 |
| `["specfun", "gamma"]`               | 109.081 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 539.552 ns (5%) |            |  624 bytes (1%) |          23 |
| `["uncertain", "log"]`               | 555.429 ns (5%) |            |  672 bytes (1%) |          24 |
| `["uncertain", "zeta"]`              | 455.108 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 775.292 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "mean - all different"]` |    2.258 s (5%) |   8.510 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 209.822 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 278.307 ms (5%) |  13.172 ms | 764.24 MiB (1%) |       40006 |
| `["vector", "prod - all equal"]`     |  46.038 ms (5%) |   8.853 ms | 763.78 MiB (1%) |       30007 |
| `["vector", "sin"]`                  | 257.722 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "sin²+cos²"]`            |   1.037 ms (5%) |            |   2.14 MiB (1%) |       40003 |
| `["vector", "sqrt"]`                 | 231.272 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "sum - all different"]`  | 235.792 ms (5%) |            | 625.11 KiB (1%) |       10005 |
| `["vector", "sum - all equal"]`      |  53.801 μs (5%) |            | 156.41 KiB (1%) |           6 |

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
      Ubuntu 24.04.3 LTS
  uname: Linux 6.14.0-1017-azure #17~24.04.1-Ubuntu SMP Mon Dec  1 20:10:50 UTC 2025 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        522 s          0 s         64 s       1624 s          0 s
       #2     0 MHz       1036 s          0 s         72 s       1110 s          0 s
       #3     0 MHz        377 s          0 s         49 s       1787 s          0 s
       #4     0 MHz        104 s          0 s         48 s       2050 s          0 s
  Memory: 15.619735717773438 GB (11797.79296875 MB free)
  Uptime: 224.21 sec
  Load Avg:  0.97  0.49  0.2
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
    BogoMIPS:                                4890.85
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
    Vulnerability Reg file data sampling:    Not affected
    Vulnerability Retbleed:                  Not affected
    Vulnerability Spec rstack overflow:      Vulnerable: Safe RET, no microcode
    Vulnerability Spec store bypass:         Vulnerable
    Vulnerability Spectre v1:                Mitigation; usercopy/swapgs barriers and __user pointer sanitization
    Vulnerability Spectre v2:                Mitigation; Retpolines; STIBP disabled; RSB filling; PBRSB-eIBRS Not affected; BHI Not affected
    Vulnerability Srbds:                     Not affected
    Vulnerability Tsa:                       Vulnerable: Clear CPU buffers attempted, no microcode
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

