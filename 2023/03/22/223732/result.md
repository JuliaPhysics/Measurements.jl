# Benchmark result

* Pull request commit: [`b386e66448c446c6c399b0b0342500853291dff2`](https://github.com/JuliaPhysics/Measurements.jl/commit/b386e66448c446c6c399b0b0342500853291dff2)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/138> (Build docs in strict mode)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 22 Mar 2023 - 22:35
    - Baseline: 22 Mar 2023 - 22:36
* Package commits:
    - Target: 866bf5
    - Baseline: d1ac98
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
| `["specfun", "gamma"]`               | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["uncertain", "atan"]`              | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["uncertain", "log"]`               | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "gamma"]`                | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "mean - all equal"]`     | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sin"]`                  | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  |                1.12 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all equal"]`      |                1.06 (5%) :x: |   1.00 (1%)  |

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
      Ubuntu 22.04.2 LTS
  uname: Linux 5.15.0-1034-azure #41-Ubuntu SMP Fri Feb 10 19:59:45 UTC 2023 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       1390 s          0 s        161 s       2554 s          0 s
       #2  2095 MHz       1396 s          0 s        157 s       2528 s          0 s
  Memory: 6.781219482421875 GB (4965.37109375 MB free)
  Uptime: 414.92 sec
  Load Avg:  1.01  0.73  0.34
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, skylake-avx512)
  Threads: 1 on 2 virtual cores
```

### Baseline
```
Julia Version 1.8.5
Commit 17cfb8e65ea (2023-01-08 06:45 UTC)
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 22.04.2 LTS
  uname: Linux 5.15.0-1034-azure #41-Ubuntu SMP Fri Feb 10 19:59:45 UTC 2023 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       1426 s          0 s        166 s       3479 s          0 s
       #2  2095 MHz       2320 s          0 s        171 s       2560 s          0 s
  Memory: 6.781219482421875 GB (5064.03125 MB free)
  Uptime: 511.94 sec
  Load Avg:  1.0  0.81  0.41
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, skylake-avx512)
  Threads: 1 on 2 virtual cores
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 22 Mar 2023 - 22:35
* Package commit: 866bf5
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

| ID                                   | time            | GC time   | memory          | allocations |
|--------------------------------------|----------------:|----------:|----------------:|------------:|
| `["base", "create"]`                 |  17.536 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  50.307 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  27.840 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  28.645 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  49.598 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  | 125.008 μs (5%) |           | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.630 μs (5%) |           |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    3.554 s (5%) |   1.357 s |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 155.609 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 790.044 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 812.244 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 720.940 ns (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                |   1.098 ms (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    4.032 s (5%) | 10.543 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 329.520 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 524.702 ms (5%) | 12.258 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 110.022 ms (5%) | 11.011 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 358.621 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.666 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 320.319 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 461.697 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 148.509 μs (5%) |           | 156.39 KiB (1%) |           5 |

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
      Ubuntu 22.04.2 LTS
  uname: Linux 5.15.0-1034-azure #41-Ubuntu SMP Fri Feb 10 19:59:45 UTC 2023 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       1390 s          0 s        161 s       2554 s          0 s
       #2  2095 MHz       1396 s          0 s        157 s       2528 s          0 s
  Memory: 6.781219482421875 GB (4965.37109375 MB free)
  Uptime: 414.92 sec
  Load Avg:  1.01  0.73  0.34
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, skylake-avx512)
  Threads: 1 on 2 virtual cores
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 22 Mar 2023 - 22:36
* Package commit: d1ac98
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

| ID                                   | time            | GC time   | memory          | allocations |
|--------------------------------------|----------------:|----------:|----------------:|------------:|
| `["base", "create"]`                 |  17.636 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  51.420 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  28.846 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  28.947 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  50.610 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  | 126.208 μs (5%) |           | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.690 μs (5%) |           |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    3.408 s (5%) |   1.280 s |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 167.204 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 853.378 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 874.439 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 735.119 ns (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                |   1.163 ms (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    4.045 s (5%) |  8.758 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 354.222 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 525.221 ms (5%) | 10.762 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 111.048 ms (5%) | 10.191 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 387.824 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.599 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 315.619 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 411.507 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 140.308 μs (5%) |           | 156.39 KiB (1%) |           5 |

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
      Ubuntu 22.04.2 LTS
  uname: Linux 5.15.0-1034-azure #41-Ubuntu SMP Fri Feb 10 19:59:45 UTC 2023 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       1426 s          0 s        166 s       3479 s          0 s
       #2  2095 MHz       2320 s          0 s        171 s       2560 s          0 s
  Memory: 6.781219482421875 GB (5064.03125 MB free)
  Uptime: 511.94 sec
  Load Avg:  1.0  0.81  0.41
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, skylake-avx512)
  Threads: 1 on 2 virtual cores
```

---
# Runtime information
| Runtime Info | |
|:--|:--|
| BLAS #threads | 1 |
| `BLAS.vendor()` | `openblas64` |
| `Sys.CPU_THREADS` | 2 |

`lscpu` output:

    Architecture:                    x86_64
    CPU op-mode(s):                  32-bit, 64-bit
    Address sizes:                   46 bits physical, 48 bits virtual
    Byte Order:                      Little Endian
    CPU(s):                          2
    On-line CPU(s) list:             0,1
    Vendor ID:                       GenuineIntel
    Model name:                      Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz
    CPU family:                      6
    Model:                           85
    Thread(s) per core:              1
    Core(s) per socket:              2
    Socket(s):                       1
    Stepping:                        4
    BogoMIPS:                        4190.35
    Flags:                           fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm avx512f avx512dq rdseed adx smap clflushopt avx512cd avx512bw avx512vl xsaveopt xsavec xsaves md_clear
    Hypervisor vendor:               Microsoft
    Virtualization type:             full
    L1d cache:                       64 KiB (2 instances)
    L1i cache:                       64 KiB (2 instances)
    L2 cache:                        2 MiB (2 instances)
    L3 cache:                        35.8 MiB (1 instance)
    NUMA node(s):                    1
    NUMA node0 CPU(s):               0,1
    Vulnerability Itlb multihit:     KVM: Mitigation: VMX unsupported
    Vulnerability L1tf:              Mitigation; PTE Inversion
    Vulnerability Mds:               Mitigation; Clear CPU buffers; SMT Host state unknown
    Vulnerability Meltdown:          Mitigation; PTI
    Vulnerability Mmio stale data:   Vulnerable: Clear CPU buffers attempted, no microcode; SMT Host state unknown
    Vulnerability Retbleed:          Vulnerable
    Vulnerability Spec store bypass: Vulnerable
    Vulnerability Spectre v1:        Mitigation; usercopy/swapgs barriers and __user pointer sanitization
    Vulnerability Spectre v2:        Mitigation; Retpolines, STIBP disabled, RSB filling, PBRSB-eIBRS Not affected
    Vulnerability Srbds:             Not affected
    Vulnerability Tsx async abort:   Mitigation; Clear CPU buffers; SMT Host state unknown
    

| Cpu Property       | Value                                                   |
|:------------------ |:------------------------------------------------------- |
| Brand              | Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz           |
| Vendor             | :Intel                                                  |
| Architecture       | :Skylake                                                |
| Model              | Family: 0x06, Model: 0x55, Stepping: 0x04, Type: 0x00   |
| Cores              | 2 physical cores, 2 logical cores (on executing CPU)    |
|                    | No Hyperthreading hardware capability detected          |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (32, 1024, 36608) kbytes                    |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 46 bits physical                       |
| SIMD               | 512 bit = 64 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |

