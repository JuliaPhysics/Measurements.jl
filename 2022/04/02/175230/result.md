# Benchmark result

* Pull request commit: [`19a2a854e2770a271646973adbe436338bdac715`](https://github.com/JuliaPhysics/Measurements.jl/commit/19a2a854e2770a271646973adbe436338bdac715)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/118> (Use atomic tag counter)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 2 Apr 2022 - 17:50
    - Baseline: 2 Apr 2022 - 17:52
* Package commits:
    - Target: e1a261
    - Baseline: 83e587
* Julia commits:
    - Target: bf5349
    - Baseline: bf5349
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
| `["base", "create"]`                 | 1.60 (5%) :x: |   1.00 (1%)  |
| `["vector", "prod - all equal"]`     | 1.06 (5%) :x: |   1.00 (1%)  |

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
Julia Version 1.7.2
Commit bf53498635 (2022-02-06 15:21 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.4 LTS
  uname: Linux 5.11.0-1028-azure #31~20.04.2-Ubuntu SMP Tue Jan 18 08:46:15 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8370C CPU @ 2.80GHz: 
              speed         user         nice          sys         idle          irq
       #1  2793 MHz        397 s          1 s         69 s       4169 s          0 s
       #2  2793 MHz       2000 s          1 s        102 s       2556 s          0 s
       
  Memory: 6.784542083740234 GB (3595.046875 MB free)
  Uptime: 470.57 sec
  Load Avg:  1.01  0.64  0.28
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, icelake-server)
```

### Baseline
```
Julia Version 1.7.2
Commit bf53498635 (2022-02-06 15:21 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.4 LTS
  uname: Linux 5.11.0-1028-azure #31~20.04.2-Ubuntu SMP Tue Jan 18 08:46:15 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8370C CPU @ 2.80GHz: 
              speed         user         nice          sys         idle          irq
       #1  2793 MHz       1198 s          1 s         84 s       4226 s          0 s
       #2  2793 MHz       2061 s          1 s        106 s       3364 s          0 s
       
  Memory: 6.784542083740234 GB (3659.11328125 MB free)
  Uptime: 558.08 sec
  Load Avg:  1.0  0.74  0.35
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, icelake-server)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 2 Apr 2022 - 17:50
* Package commit: e1a261
* Julia commit: bf5349
* Julia command flags: None
* Environment variables: None

## Results
Below is a table of this job's results, obtained by running the benchmarks.
The values listed in the `ID` column have the structure `[parent_group, child_group, ..., key]`, and can be used to
index into the BaseBenchmarks suite to retrieve the corresponding benchmarks.
The percentages accompanying time and memory values in the below table are noise tolerances. The "true"
time/memory value for a given benchmark is expected to fall within this percentage of the reported value.
An empty cell means that the value was zero.

| ID                                   | time            | GC time  | memory          | allocations |
|--------------------------------------|----------------:|---------:|----------------:|------------:|
| `["base", "create"]`                 |  13.399 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  34.945 ns (5%) |          |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  21.665 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  21.665 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  34.642 ns (5%) |          |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  17.200 μs (5%) |          |   7.78 KiB (1%) |         325 |
| `["quadgk", "int1"]`                 |   1.420 μs (5%) |          |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 402.805 ms (5%) | 7.207 ms | 132.00 MiB (1%) |     6666687 |
| `["specfun", "gamma"]`               | 145.887 ns (5%) |          |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 664.551 ns (5%) |          |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 684.204 ns (5%) |          |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.730 μs (5%) |          |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 998.693 μs (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.641 s (5%) | 9.155 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 252.998 μs (5%) |          | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 468.124 ms (5%) | 9.335 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 131.738 ms (5%) | 8.763 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 313.298 μs (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.124 ms (5%) |          |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 243.099 μs (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 353.881 ms (5%) |          | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 115.499 μs (5%) |          | 156.39 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.7.2
Commit bf53498635 (2022-02-06 15:21 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.4 LTS
  uname: Linux 5.11.0-1028-azure #31~20.04.2-Ubuntu SMP Tue Jan 18 08:46:15 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8370C CPU @ 2.80GHz: 
              speed         user         nice          sys         idle          irq
       #1  2793 MHz        397 s          1 s         69 s       4169 s          0 s
       #2  2793 MHz       2000 s          1 s        102 s       2556 s          0 s
       
  Memory: 6.784542083740234 GB (3595.046875 MB free)
  Uptime: 470.57 sec
  Load Avg:  1.01  0.64  0.28
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, icelake-server)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 2 Apr 2022 - 17:52
* Package commit: 83e587
* Julia commit: bf5349
* Julia command flags: None
* Environment variables: None

## Results
Below is a table of this job's results, obtained by running the benchmarks.
The values listed in the `ID` column have the structure `[parent_group, child_group, ..., key]`, and can be used to
index into the BaseBenchmarks suite to retrieve the corresponding benchmarks.
The percentages accompanying time and memory values in the below table are noise tolerances. The "true"
time/memory value for a given benchmark is expected to fall within this percentage of the reported value.
An empty cell means that the value was zero.

| ID                                   | time            | GC time  | memory          | allocations |
|--------------------------------------|----------------:|---------:|----------------:|------------:|
| `["base", "create"]`                 |   8.400 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  35.247 ns (5%) |          |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  21.764 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  21.765 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  35.045 ns (5%) |          |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  17.100 μs (5%) |          |   7.78 KiB (1%) |         325 |
| `["quadgk", "int1"]`                 |   1.410 μs (5%) |          |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 408.937 ms (5%) | 8.009 ms | 132.00 MiB (1%) |     6666687 |
| `["specfun", "gamma"]`               | 145.052 ns (5%) |          |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 674.677 ns (5%) |          |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 663.809 ns (5%) |          |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.730 μs (5%) |          |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 997.994 μs (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.674 s (5%) | 8.595 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 251.699 μs (5%) |          | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 492.083 ms (5%) | 7.146 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 123.934 ms (5%) | 6.359 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 308.298 μs (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.137 ms (5%) |          |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 243.198 μs (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 349.318 ms (5%) |          | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 113.099 μs (5%) |          | 156.39 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.7.2
Commit bf53498635 (2022-02-06 15:21 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.4 LTS
  uname: Linux 5.11.0-1028-azure #31~20.04.2-Ubuntu SMP Tue Jan 18 08:46:15 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8370C CPU @ 2.80GHz: 
              speed         user         nice          sys         idle          irq
       #1  2793 MHz       1198 s          1 s         84 s       4226 s          0 s
       #2  2793 MHz       2061 s          1 s        106 s       3364 s          0 s
       
  Memory: 6.784542083740234 GB (3659.11328125 MB free)
  Uptime: 558.08 sec
  Load Avg:  1.0  0.74  0.35
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, icelake-server)
```

---
# Runtime information
| Runtime Info | |
|:--|:--|
| BLAS #threads | 2 |
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
    Model:                           106
    Model name:                      Intel(R) Xeon(R) Platinum 8370C CPU @ 2.80GHz
    Stepping:                        6
    CPU MHz:                         2793.438
    BogoMIPS:                        5586.87
    Hypervisor vendor:               Microsoft
    Virtualization type:             full
    L1d cache:                       96 KiB
    L1i cache:                       64 KiB
    L2 cache:                        2.5 MiB
    L3 cache:                        48 MiB
    NUMA node0 CPU(s):               0,1
    Vulnerability Itlb multihit:     KVM: Mitigation: VMX unsupported
    Vulnerability L1tf:              Mitigation; PTE Inversion
    Vulnerability Mds:               Mitigation; Clear CPU buffers; SMT Host state unknown
    Vulnerability Meltdown:          Mitigation; PTI
    Vulnerability Spec store bypass: Vulnerable
    Vulnerability Spectre v1:        Mitigation; usercopy/swapgs barriers and __user pointer sanitization
    Vulnerability Spectre v2:        Mitigation; Full generic retpoline, STIBP disabled, RSB filling
    Vulnerability Srbds:             Not affected
    Vulnerability Tsx async abort:   Mitigation; Clear CPU buffers; SMT Host state unknown
    Flags:                           fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm avx512f avx512dq rdseed adx smap clflushopt avx512cd avx512bw avx512vl xsaveopt xsavec xsaves md_clear
    

| Cpu Property       | Value                                                   |
|:------------------ |:------------------------------------------------------- |
| Brand              | Intel(R) Xeon(R) Platinum 8370C CPU @ 2.80GHz           |
| Vendor             | :Intel                                                  |
| Architecture       | :UnknownIntel                                           |
| Model              | Family: 0x06, Model: 0x6a, Stepping: 0x06, Type: 0x00   |
| Cores              | 2 physical cores, 2 logical cores (on executing CPU)    |
|                    | No Hyperthreading hardware capability detected          |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (48, 1280, 49152) kbytes                    |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 46 bits physical                       |
| SIMD               | 512 bit = 64 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |

