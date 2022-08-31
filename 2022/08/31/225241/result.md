# Benchmark result

* Pull request commit: [`ea061f83d19e75737eaae1f9b3e8d94dbe40c8e8`](https://github.com/JuliaPhysics/Measurements.jl/commit/ea061f83d19e75737eaae1f9b3e8d94dbe40c8e8)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/118> (Use atomic tag counter)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 31 Aug 2022 - 22:50
    - Baseline: 31 Aug 2022 - 22:52
* Package commits:
    - Target: cbdb99
    - Baseline: 5e84ab
* Julia commits:
    - Target: 5544a0
    - Baseline: 5544a0
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
| `["base", "create"]`                 | 1.61 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  | 1.09 (5%) :x: |   1.00 (1%)  |

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
Julia Version 1.8.0
Commit 5544a0fab76 (2022-08-17 13:38 UTC)
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 20.04.4 LTS
  uname: Linux 5.15.0-1017-azure #20~20.04.1-Ubuntu SMP Fri Aug 5 12:16:53 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz       2101 s          0 s        105 s        340 s          0 s
       #2  2593 MHz        293 s          0 s        103 s       2149 s          0 s
  Memory: 6.781246185302734 GB (3495.078125 MB free)
  Uptime: 259.1 sec
  Load Avg:  1.02  0.69  0.31
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, skylake-avx512)
  Threads: 1 on 2 virtual cores
```

### Baseline
```
Julia Version 1.8.0
Commit 5544a0fab76 (2022-08-17 13:38 UTC)
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 20.04.4 LTS
  uname: Linux 5.15.0-1017-azure #20~20.04.1-Ubuntu SMP Fri Aug 5 12:16:53 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz       2796 s          0 s        116 s        572 s          0 s
       #2  2593 MHz        536 s          0 s        112 s       2837 s          0 s
  Memory: 6.781246185302734 GB (3474.18359375 MB free)
  Uptime: 352.97 sec
  Load Avg:  1.03  0.8  0.39
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, skylake-avx512)
  Threads: 1 on 2 virtual cores
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 31 Aug 2022 - 22:50
* Package commit: cbdb99
* Julia commit: 5544a0
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
| `["base", "create"]`                 |  14.315 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  41.272 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |   0.001 ns (5%) |           |                 |             |
| `["base", "sqrt"]`                   |   0.001 ns (5%) |           |                 |             |
| `["base", "sum"]`                    |  41.372 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  17.400 μs (5%) |           |   7.53 KiB (1%) |         312 |
| `["quadgk", "int1"]`                 |   1.370 μs (5%) |           |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  | 426.967 ms (5%) |  9.468 ms | 132.00 MiB (1%) |     6666680 |
| `["specfun", "gamma"]`               | 133.828 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 693.669 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 701.993 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 822.235 ns (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 988.013 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.381 s (5%) | 10.531 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 290.904 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 525.564 ms (5%) | 13.864 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 106.400 ms (5%) | 10.868 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 331.204 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.352 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 270.304 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 378.453 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 122.402 μs (5%) |           | 156.39 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.8.0
Commit 5544a0fab76 (2022-08-17 13:38 UTC)
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 20.04.4 LTS
  uname: Linux 5.15.0-1017-azure #20~20.04.1-Ubuntu SMP Fri Aug 5 12:16:53 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz       2101 s          0 s        105 s        340 s          0 s
       #2  2593 MHz        293 s          0 s        103 s       2149 s          0 s
  Memory: 6.781246185302734 GB (3495.078125 MB free)
  Uptime: 259.1 sec
  Load Avg:  1.02  0.69  0.31
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, skylake-avx512)
  Threads: 1 on 2 virtual cores
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 31 Aug 2022 - 22:52
* Package commit: 5e84ab
* Julia commit: 5544a0
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
| `["base", "create"]`                 |   8.909 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  41.372 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |   0.001 ns (5%) |           |                 |             |
| `["base", "sqrt"]`                   |   0.001 ns (5%) |           |                 |             |
| `["base", "sum"]`                    |  40.970 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  17.500 μs (5%) |           |   7.53 KiB (1%) |         312 |
| `["quadgk", "int1"]`                 |   1.380 μs (5%) |           |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  | 429.438 ms (5%) |  9.762 ms | 132.00 MiB (1%) |     6666680 |
| `["specfun", "gamma"]`               | 133.828 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 693.676 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 702.656 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 825.926 ns (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 985.313 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.359 s (5%) | 10.132 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 302.504 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 501.121 ms (5%) | 10.556 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 107.398 ms (5%) | 10.423 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 334.604 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.344 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 270.003 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 347.446 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 119.401 μs (5%) |           | 156.39 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.8.0
Commit 5544a0fab76 (2022-08-17 13:38 UTC)
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 20.04.4 LTS
  uname: Linux 5.15.0-1017-azure #20~20.04.1-Ubuntu SMP Fri Aug 5 12:16:53 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz       2796 s          0 s        116 s        572 s          0 s
       #2  2593 MHz        536 s          0 s        112 s       2837 s          0 s
  Memory: 6.781246185302734 GB (3474.18359375 MB free)
  Uptime: 352.97 sec
  Load Avg:  1.03  0.8  0.39
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
    Model name:                      Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz
    Stepping:                        7
    CPU MHz:                         2593.906
    BogoMIPS:                        5187.81
    Hypervisor vendor:               Microsoft
    Virtualization type:             full
    L1d cache:                       64 KiB
    L1i cache:                       64 KiB
    L2 cache:                        2 MiB
    L3 cache:                        35.8 MiB
    NUMA node0 CPU(s):               0,1
    Vulnerability Itlb multihit:     KVM: Mitigation: VMX unsupported
    Vulnerability L1tf:              Mitigation; PTE Inversion
    Vulnerability Mds:               Mitigation; Clear CPU buffers; SMT Host state unknown
    Vulnerability Meltdown:          Mitigation; PTI
    Vulnerability Mmio stale data:   Vulnerable: Clear CPU buffers attempted, no microcode; SMT Host state unknown
    Vulnerability Retbleed:          Vulnerable
    Vulnerability Spec store bypass: Vulnerable
    Vulnerability Spectre v1:        Mitigation; usercopy/swapgs barriers and __user pointer sanitization
    Vulnerability Spectre v2:        Mitigation; Retpolines, STIBP disabled, RSB filling
    Vulnerability Srbds:             Not affected
    Vulnerability Tsx async abort:   Mitigation; Clear CPU buffers; SMT Host state unknown
    Flags:                           fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm avx512f avx512dq rdseed adx smap clflushopt avx512cd avx512bw avx512vl xsaveopt xsavec xsaves md_clear
    

| Cpu Property       | Value                                                   |
|:------------------ |:------------------------------------------------------- |
| Brand              | Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz          |
| Vendor             | :Intel                                                  |
| Architecture       | :Skylake                                                |
| Model              | Family: 0x06, Model: 0x55, Stepping: 0x07, Type: 0x00   |
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

