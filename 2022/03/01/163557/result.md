# Benchmark result

* Pull request commit: [`b1f6d5b1b3774ccb5c5a6934bbba0869f0b5dc47`](https://github.com/JuliaPhysics/Measurements.jl/commit/b1f6d5b1b3774ccb5c5a6934bbba0869f0b5dc47)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/115> (add Aqua test & fix all ambiguities and unbound args)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 1 Mar 2022 - 16:33
    - Baseline: 1 Mar 2022 - 16:35
* Package commits:
    - Target: c5b90f
    - Baseline: c79947
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

| ID                                   | time ratio                   | memory ratio |
|--------------------------------------|------------------------------|--------------|
| `["quadgk", "int1"]`                 |                1.05 (5%) :x: |   1.00 (1%)  |
| `["quadgk", "sin"]`                  |                1.15 (5%) :x: |   1.00 (1%)  |
| `["vector", "prod - all different"]` | 0.91 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sin"]`                  |                1.07 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  |                1.08 (5%) :x: |   1.00 (1%)  |

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
      Ubuntu 20.04.3 LTS
  uname: Linux 5.11.0-1028-azure #31~20.04.2-Ubuntu SMP Tue Jan 18 08:46:15 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       1061 s          0 s         88 s       2242 s          0 s
       #2  2294 MHz       1482 s          0 s        113 s       1822 s          0 s
       
  Memory: 6.7845458984375 GB (3709.8515625 MB free)
  Uptime: 345.36 sec
  Load Avg:  1.0  0.74  0.35
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, broadwell)
```

### Baseline
```
Julia Version 1.7.2
Commit bf53498635 (2022-02-06 15:21 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.3 LTS
  uname: Linux 5.11.0-1028-azure #31~20.04.2-Ubuntu SMP Tue Jan 18 08:46:15 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       1927 s          0 s        104 s       2298 s          0 s
       #2  2294 MHz       1543 s          0 s        117 s       2692 s          0 s
       
  Memory: 6.7845458984375 GB (3681.2890625 MB free)
  Uptime: 439.24 sec
  Load Avg:  1.07  0.84  0.43
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 1 Mar 2022 - 16:33
* Package commit: c5b90f
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

| ID                                   | time            | GC time   | memory          | allocations |
|--------------------------------------|----------------:|----------:|----------------:|------------:|
| `["base", "create"]`                 |   8.100 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  34.839 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  20.640 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  20.561 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  34.939 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  14.699 μs (5%) |           |   7.78 KiB (1%) |         325 |
| `["quadgk", "int1"]`                 |   1.370 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 428.429 ms (5%) | 11.656 ms | 132.00 MiB (1%) |     6666687 |
| `["specfun", "gamma"]`               |  98.901 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 738.454 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 577.596 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.090 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 825.495 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.057 s (5%) | 11.186 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 238.700 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 545.658 ms (5%) | 15.567 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 135.376 ms (5%) | 14.914 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 303.998 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.130 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 221.400 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 378.317 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 107.899 μs (5%) |           | 156.39 KiB (1%) |           5 |

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
      Ubuntu 20.04.3 LTS
  uname: Linux 5.11.0-1028-azure #31~20.04.2-Ubuntu SMP Tue Jan 18 08:46:15 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       1061 s          0 s         88 s       2242 s          0 s
       #2  2294 MHz       1482 s          0 s        113 s       1822 s          0 s
       
  Memory: 6.7845458984375 GB (3709.8515625 MB free)
  Uptime: 345.36 sec
  Load Avg:  1.0  0.74  0.35
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 1 Mar 2022 - 16:35
* Package commit: c79947
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

| ID                                   | time            | GC time   | memory          | allocations |
|--------------------------------------|----------------:|----------:|----------------:|------------:|
| `["base", "create"]`                 |   7.900 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  36.546 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  20.541 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  20.562 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  35.340 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  14.800 μs (5%) |           |   7.78 KiB (1%) |         325 |
| `["quadgk", "int1"]`                 |   1.300 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 373.086 ms (5%) |  9.407 ms | 132.00 MiB (1%) |     6666687 |
| `["specfun", "gamma"]`               |  98.793 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 739.231 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 583.601 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.090 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 822.299 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    2.970 s (5%) | 11.585 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 238.500 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 600.936 ms (5%) | 17.079 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 131.089 ms (5%) | 14.118 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 284.499 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.109 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 223.699 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 350.107 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 106.300 μs (5%) |           | 156.39 KiB (1%) |           5 |

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
      Ubuntu 20.04.3 LTS
  uname: Linux 5.11.0-1028-azure #31~20.04.2-Ubuntu SMP Tue Jan 18 08:46:15 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       1927 s          0 s        104 s       2298 s          0 s
       #2  2294 MHz       1543 s          0 s        117 s       2692 s          0 s
       
  Memory: 6.7845458984375 GB (3681.2890625 MB free)
  Uptime: 439.24 sec
  Load Avg:  1.07  0.84  0.43
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, broadwell)
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
    Model:                           79
    Model name:                      Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz
    Stepping:                        1
    CPU MHz:                         2294.683
    BogoMIPS:                        4589.36
    Hypervisor vendor:               Microsoft
    Virtualization type:             full
    L1d cache:                       64 KiB
    L1i cache:                       64 KiB
    L2 cache:                        512 KiB
    L3 cache:                        50 MiB
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
    Flags:                           fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm rdseed adx smap xsaveopt md_clear
    

| Cpu Property       | Value                                                   |
|:------------------ |:------------------------------------------------------- |
| Brand              | Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz               |
| Vendor             | :Intel                                                  |
| Architecture       | :Broadwell                                              |
| Model              | Family: 0x06, Model: 0x4f, Stepping: 0x01, Type: 0x00   |
| Cores              | 2 physical cores, 2 logical cores (on executing CPU)    |
|                    | No Hyperthreading hardware capability detected          |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (32, 256, 51200) kbytes                     |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 46 bits physical                       |
| SIMD               | 256 bit = 32 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |

