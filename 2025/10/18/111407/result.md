# Benchmark result

* Pull request commit: [`789e5b1d00f0c14ee4ad0efd140ad0d1840b384d`](https://github.com/JuliaPhysics/Measurements.jl/commit/789e5b1d00f0c14ee4ad0efd140ad0d1840b384d)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/192> (Release v2.14.1)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 18 Oct 2025 - 11:12
    - Baseline: 18 Oct 2025 - 11:13
* Package commits:
    - Target: db65c3
    - Baseline: 16e452
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

| ID                                   | time ratio                   | memory ratio |
|--------------------------------------|------------------------------|--------------|
| `["base", "multiplication"]`         |                1.07 (5%) :x: |   1.00 (1%)  |
| `["base", "sum"]`                    |                1.08 (5%) :x: |   1.00 (1%)  |
| `["quadgk", "sin"]`                  |                1.20 (5%) :x: |   1.00 (1%)  |
| `["uncertain", "atan"]`              |                1.06 (5%) :x: |   1.00 (1%)  |
| `["uncertain", "log"]`               | 0.95 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "prod - all equal"]`     |                1.07 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sum - all equal"]`      |                1.05 (5%) :x: |   1.00 (1%)  |

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
      Ubuntu 24.04.3 LTS
  uname: Linux 6.14.0-1012-azure #12~24.04.1-Ubuntu SMP Tue Sep  9 19:01:23 UTC 2025 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        320 s          0 s         60 s      16493 s          0 s
       #2     0 MHz        429 s          0 s         67 s      16381 s          0 s
       #3     0 MHz       1010 s          0 s         87 s      15776 s          0 s
       #4     0 MHz       1221 s          0 s        111 s      15533 s          0 s
  Memory: 15.620410919189453 GB (11502.00390625 MB free)
  Uptime: 1690.9 sec
  Load Avg:  1.04  0.72  0.32
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
      Ubuntu 24.04.3 LTS
  uname: Linux 6.14.0-1012-azure #12~24.04.1-Ubuntu SMP Tue Sep  9 19:01:23 UTC 2025 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        679 s          0 s         76 s      16918 s          0 s
       #2     0 MHz        817 s          0 s         78 s      16783 s          0 s
       #3     0 MHz       1024 s          0 s         89 s      16560 s          0 s
       #4     0 MHz       1242 s          0 s        112 s      16310 s          0 s
  Memory: 15.620410919189453 GB (11851.953125 MB free)
  Uptime: 1770.94 sec
  Load Avg:  1.01  0.79  0.38
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver3)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 18 Oct 2025 - 11:12
* Package commit: db65c3
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
| `["base", "create"]`                 |   9.016 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  33.543 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  18.912 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  18.962 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  33.443 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  88.504 μs (5%) |            | 271.19 KiB (1%) |        5643 |
| `["quadgk", "int1"]`                 |   1.140 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    1.935 s (5%) | 294.612 ms |   2.82 GiB (1%) |    59960357 |
| `["specfun", "gamma"]`               | 114.609 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 577.940 ns (5%) |            |  624 bytes (1%) |          23 |
| `["uncertain", "log"]`               | 563.658 ns (5%) |            |  672 bytes (1%) |          24 |
| `["uncertain", "zeta"]`              | 461.569 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 842.436 μs (5%) |            | 781.31 KiB (1%) |       10003 |
| `["vector", "mean - all different"]` |    2.249 s (5%) |   9.962 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 206.834 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 273.893 ms (5%) |  15.970 ms | 764.16 MiB (1%) |       40006 |
| `["vector", "prod - all equal"]`     |  51.524 ms (5%) |  10.693 ms | 763.70 MiB (1%) |       30007 |
| `["vector", "sin"]`                  | 263.360 μs (5%) |            | 781.31 KiB (1%) |       10003 |
| `["vector", "sin²+cos²"]`            |   1.041 ms (5%) |            |   2.14 MiB (1%) |       40003 |
| `["vector", "sqrt"]`                 | 232.092 μs (5%) |            | 781.31 KiB (1%) |       10003 |
| `["vector", "sum - all different"]`  | 219.260 ms (5%) |            | 625.09 KiB (1%) |       10005 |
| `["vector", "sum - all equal"]`      |  53.790 μs (5%) |            | 156.39 KiB (1%) |           6 |

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
      Ubuntu 24.04.3 LTS
  uname: Linux 6.14.0-1012-azure #12~24.04.1-Ubuntu SMP Tue Sep  9 19:01:23 UTC 2025 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        320 s          0 s         60 s      16493 s          0 s
       #2     0 MHz        429 s          0 s         67 s      16381 s          0 s
       #3     0 MHz       1010 s          0 s         87 s      15776 s          0 s
       #4     0 MHz       1221 s          0 s        111 s      15533 s          0 s
  Memory: 15.620410919189453 GB (11502.00390625 MB free)
  Uptime: 1690.9 sec
  Load Avg:  1.04  0.72  0.32
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver3)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 18 Oct 2025 - 11:13
* Package commit: 16e452
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
| `["base", "create"]`                 |   9.055 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  31.346 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  18.952 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  18.932 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  31.043 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  86.230 μs (5%) |            | 271.19 KiB (1%) |        5643 |
| `["quadgk", "int1"]`                 |   1.144 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    1.608 s (5%) | 201.487 ms |   2.82 GiB (1%) |    59960357 |
| `["specfun", "gamma"]`               | 114.501 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 545.297 ns (5%) |            |  624 bytes (1%) |          23 |
| `["uncertain", "log"]`               | 594.418 ns (5%) |            |  672 bytes (1%) |          24 |
| `["uncertain", "zeta"]`              | 453.990 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 837.718 μs (5%) |            | 781.31 KiB (1%) |       10003 |
| `["vector", "mean - all different"]` |    2.271 s (5%) |   7.835 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 206.885 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 264.599 ms (5%) |  13.794 ms | 764.16 MiB (1%) |       40006 |
| `["vector", "prod - all equal"]`     |  48.354 ms (5%) |   9.221 ms | 763.70 MiB (1%) |       30007 |
| `["vector", "sin"]`                  | 258.932 μs (5%) |            | 781.31 KiB (1%) |       10003 |
| `["vector", "sin²+cos²"]`            |   1.025 ms (5%) |            |   2.14 MiB (1%) |       40003 |
| `["vector", "sqrt"]`                 | 231.059 μs (5%) |            | 781.31 KiB (1%) |       10003 |
| `["vector", "sum - all different"]`  | 235.378 ms (5%) |            | 625.09 KiB (1%) |       10005 |
| `["vector", "sum - all equal"]`      |  51.085 μs (5%) |            | 156.39 KiB (1%) |           6 |

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
      Ubuntu 24.04.3 LTS
  uname: Linux 6.14.0-1012-azure #12~24.04.1-Ubuntu SMP Tue Sep  9 19:01:23 UTC 2025 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        679 s          0 s         76 s      16918 s          0 s
       #2     0 MHz        817 s          0 s         78 s      16783 s          0 s
       #3     0 MHz       1024 s          0 s         89 s      16560 s          0 s
       #4     0 MHz       1242 s          0 s        112 s      16310 s          0 s
  Memory: 15.620410919189453 GB (11851.953125 MB free)
  Uptime: 1770.94 sec
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
    Vulnerability Tsx async abort:           Not affected
    

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

