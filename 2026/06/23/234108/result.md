# Benchmark result

* Pull request commit: [`aceb8639939aa4dfcc45f44aac2d42d39c420599`](https://github.com/JuliaPhysics/Measurements.jl/commit/aceb8639939aa4dfcc45f44aac2d42d39c420599)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/206> (Add Supposition.jl-based tests)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 23 Jun 2026 - 23:39
    - Baseline: 23 Jun 2026 - 23:40
* Package commits:
    - Target: 4c6f405
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
| `["base", "create"]`                 | 0.88 (5%) :white_check_mark: |   1.00 (1%)  |

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
  CPU: AMD EPYC 9V74 80-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        100 s          0 s         43 s       2430 s          0 s
       #2     0 MHz        140 s          0 s         44 s       2402 s          0 s
       #3     0 MHz        282 s          0 s         45 s       2273 s          0 s
       #4     0 MHz        716 s          0 s         69 s       1806 s          0 s
  Memory: 15.614940643310547 GB (11810.1328125 MB free)
  Uptime: 262.42 sec
  Load Avg:  0.89  0.52  0.23
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver4)
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
  CPU: AMD EPYC 9V74 80-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        219 s          0 s         49 s       3134 s          0 s
       #2     0 MHz        464 s          0 s         57 s       2895 s          0 s
       #3     0 MHz        312 s          0 s         46 s       3070 s          0 s
       #4     0 MHz       1057 s          0 s         82 s       2282 s          0 s
  Memory: 15.614940643310547 GB (11749.48046875 MB free)
  Uptime: 345.44 sec
  Load Avg:  0.97  0.63  0.29
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver4)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 23 Jun 2026 - 23:39
* Package commit: 4c6f405
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
| `["base", "create"]`                 |   9.143 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  32.723 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  21.144 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  21.144 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  32.753 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  87.281 μs (5%) |            | 271.20 KiB (1%) |        5643 |
| `["quadgk", "int1"]`                 |   1.208 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    1.818 s (5%) | 303.577 ms |   2.82 GiB (1%) |    59960357 |
| `["specfun", "gamma"]`               | 111.804 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 527.672 ns (5%) |            |  624 bytes (1%) |          23 |
| `["uncertain", "log"]`               | 546.799 ns (5%) |            |  672 bytes (1%) |          24 |
| `["uncertain", "zeta"]`              | 429.114 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 800.413 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "mean - all different"]` |    2.541 s (5%) |  12.074 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 223.957 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 313.686 ms (5%) |  13.038 ms | 764.24 MiB (1%) |       40006 |
| `["vector", "prod - all equal"]`     |  62.438 ms (5%) |   9.441 ms | 763.78 MiB (1%) |       30007 |
| `["vector", "sin"]`                  | 255.434 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "sin²+cos²"]`            |   1.057 ms (5%) |            |   2.14 MiB (1%) |       40003 |
| `["vector", "sqrt"]`                 | 214.192 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "sum - all different"]`  | 247.227 ms (5%) |            | 625.11 KiB (1%) |       10005 |
| `["vector", "sum - all equal"]`      |  58.347 μs (5%) |            | 156.41 KiB (1%) |           6 |

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
  CPU: AMD EPYC 9V74 80-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        100 s          0 s         43 s       2430 s          0 s
       #2     0 MHz        140 s          0 s         44 s       2402 s          0 s
       #3     0 MHz        282 s          0 s         45 s       2273 s          0 s
       #4     0 MHz        716 s          0 s         69 s       1806 s          0 s
  Memory: 15.614940643310547 GB (11810.1328125 MB free)
  Uptime: 262.42 sec
  Load Avg:  0.89  0.52  0.23
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver4)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 23 Jun 2026 - 23:40
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
| `["base", "create"]`                 |  10.436 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  32.219 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  21.214 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  21.225 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  32.189 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  88.032 μs (5%) |            | 271.20 KiB (1%) |        5643 |
| `["quadgk", "int1"]`                 |   1.215 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    1.877 s (5%) | 321.854 ms |   2.82 GiB (1%) |    59960357 |
| `["specfun", "gamma"]`               | 112.083 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 527.828 ns (5%) |            |  624 bytes (1%) |          23 |
| `["uncertain", "log"]`               | 546.857 ns (5%) |            |  672 bytes (1%) |          24 |
| `["uncertain", "zeta"]`              | 427.347 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 802.265 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "mean - all different"]` |    2.562 s (5%) |  12.198 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 227.812 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 320.843 ms (5%) |  13.410 ms | 764.24 MiB (1%) |       40006 |
| `["vector", "prod - all equal"]`     |  61.134 ms (5%) |   9.451 ms | 763.78 MiB (1%) |       30007 |
| `["vector", "sin"]`                  | 256.465 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "sin²+cos²"]`            |   1.074 ms (5%) |            |   2.14 MiB (1%) |       40003 |
| `["vector", "sqrt"]`                 | 217.587 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "sum - all different"]`  | 258.444 ms (5%) |            | 625.11 KiB (1%) |       10005 |
| `["vector", "sum - all equal"]`      |  57.005 μs (5%) |            | 156.41 KiB (1%) |           6 |

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
  CPU: AMD EPYC 9V74 80-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        219 s          0 s         49 s       3134 s          0 s
       #2     0 MHz        464 s          0 s         57 s       2895 s          0 s
       #3     0 MHz        312 s          0 s         46 s       3070 s          0 s
       #4     0 MHz       1057 s          0 s         82 s       2282 s          0 s
  Memory: 15.614940643310547 GB (11749.48046875 MB free)
  Uptime: 345.44 sec
  Load Avg:  0.97  0.63  0.29
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver4)
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
    Model name:                              AMD EPYC 9V74 80-Core Processor
    CPU family:                              25
    Model:                                   17
    Thread(s) per core:                      2
    Core(s) per socket:                      2
    Socket(s):                               1
    Stepping:                                1
    BogoMIPS:                                5192.28
    Flags:                                   fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl tsc_reliable nonstop_tsc cpuid extd_apicid aperfmperf tsc_known_freq pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm cmp_legacy svm cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw topoext vmmcall fsgsbase bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 xsaves user_shstk clzero xsaveerptr rdpru arat npt nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold v_vmsave_vmload umip vaes vpclmulqdq rdpid fsrm
    Virtualization:                          AMD-V
    Hypervisor vendor:                       Microsoft
    Virtualization type:                     full
    L1d cache:                               64 KiB (2 instances)
    L1i cache:                               64 KiB (2 instances)
    L2 cache:                                2 MiB (2 instances)
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
| Brand              | AMD EPYC 9V74 80-Core Processor                            |
| Vendor             | :AMD                                                       |
| Architecture       | :Unknown                                                   |
| Model              | Family: 0xaf, Model: 0x11, Stepping: 0x01, Type: 0x00      |
| Cores              | 16 physical cores, 16 logical cores (on executing CPU)     |
|                    | No Hyperthreading hardware capability detected             |
| Clock Frequencies  | Not supported by CPU                                       |
| Data Cache         | Level 1:3 : (32, 1024, 32768) kbytes                       |
|                    | 64 byte cache line size                                    |
| Address Size       | 48 bits virtual, 48 bits physical                          |
| SIMD               | 256 bit = 32 byte max. SIMD vector size                    |
| Time Stamp Counter | TSC is accessible via `rdtsc`                              |
|                    | TSC runs at constant rate (invariant from clock frequency) |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported    |
| Hypervisor         | Yes, Microsoft                                             |

