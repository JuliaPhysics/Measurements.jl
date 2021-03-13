# Benchmark result

* Pull request commit: [`9aa91cde4aad391acd9660a1ecd4a11b26903228`](https://github.com/JuliaPhysics/Measurements.jl/commit/9aa91cde4aad391acd9660a1ecd4a11b26903228)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/97> (Fix deprecations in `SpecialFunctions.jl`)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 13 Mar 2021 - 16:55
    - Baseline: 13 Mar 2021 - 16:57
* Package commits:
    - Target: 15652e
    - Baseline: e0625c
* Julia commits:
    - Target: 4b6b9f
    - Baseline: 4b6b9f
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
| `["vector", "gamma"]`                | 0.95 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sin"]`                  |                1.05 (5%) :x: |   1.00 (1%)  |

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
Julia Version 1.6.0-rc2
Commit 4b6b9fe4d7 (2021-03-11 07:05 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1040-azure #42-Ubuntu SMP Fri Feb 5 15:39:06 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2397 MHz        610 s          2 s        110 s       3113 s          0 s
       #2  2397 MHz       2239 s          0 s        127 s       1477 s          0 s
       
  Memory: 6.7913818359375 GB (3510.9453125 MB free)
  Uptime: 399.0 sec
  Load Avg:  1.02  0.83  0.4
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, haswell)
```

### Baseline
```
Julia Version 1.6.0-rc2
Commit 4b6b9fe4d7 (2021-03-11 07:05 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1040-azure #42-Ubuntu SMP Fri Feb 5 15:39:06 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2397 MHz        969 s          2 s        115 s       3818 s          0 s
       #2  2397 MHz       2943 s          0 s        140 s       1831 s          0 s
       
  Memory: 6.7913818359375 GB (3488.2109375 MB free)
  Uptime: 506.0 sec
  Load Avg:  1.03  0.9  0.48
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, haswell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 13 Mar 2021 - 16:55
* Package commit: 15652e
* Julia commit: 4b6b9f
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
| `["base", "create"]`                 |   9.610 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  45.760 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  28.113 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  28.013 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  45.861 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  19.000 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.660 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 501.354 ms (5%) |  9.418 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 139.166 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 718.870 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 745.403 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.550 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                |   1.308 ms (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.495 s (5%) |  9.420 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 317.412 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 606.267 ms (5%) | 20.685 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 162.339 ms (5%) | 20.385 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 441.817 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.494 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 301.911 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 441.462 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 116.404 μs (5%) |           | 156.45 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.6.0-rc2
Commit 4b6b9fe4d7 (2021-03-11 07:05 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1040-azure #42-Ubuntu SMP Fri Feb 5 15:39:06 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2397 MHz        610 s          2 s        110 s       3113 s          0 s
       #2  2397 MHz       2239 s          0 s        127 s       1477 s          0 s
       
  Memory: 6.7913818359375 GB (3510.9453125 MB free)
  Uptime: 399.0 sec
  Load Avg:  1.02  0.83  0.4
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, haswell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 13 Mar 2021 - 16:57
* Package commit: e0625c
* Julia commit: 4b6b9f
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
| `["base", "create"]`                 |   9.610 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  44.749 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  28.013 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  28.013 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  44.748 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  18.901 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.700 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 519.254 ms (5%) | 10.039 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 140.331 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 721.768 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 716.832 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.550 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                |   1.381 ms (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.477 s (5%) |  9.361 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 314.912 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 610.724 ms (5%) | 17.841 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 155.749 ms (5%) | 16.597 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 419.316 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.503 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 300.812 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 429.893 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 112.704 μs (5%) |           | 156.45 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.6.0-rc2
Commit 4b6b9fe4d7 (2021-03-11 07:05 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1040-azure #42-Ubuntu SMP Fri Feb 5 15:39:06 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2397 MHz        969 s          2 s        115 s       3818 s          0 s
       #2  2397 MHz       2943 s          0 s        140 s       1831 s          0 s
       
  Memory: 6.7913818359375 GB (3488.2109375 MB free)
  Uptime: 506.0 sec
  Load Avg:  1.03  0.9  0.48
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, haswell)
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
    Model:                           63
    Model name:                      Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz
    Stepping:                        2
    CPU MHz:                         2397.224
    BogoMIPS:                        4794.44
    Hypervisor vendor:               Microsoft
    Virtualization type:             full
    L1d cache:                       64 KiB
    L1i cache:                       64 KiB
    L2 cache:                        512 KiB
    L3 cache:                        30 MiB
    NUMA node0 CPU(s):               0,1
    Vulnerability Itlb multihit:     KVM: Vulnerable
    Vulnerability L1tf:              Mitigation; PTE Inversion
    Vulnerability Mds:               Mitigation; Clear CPU buffers; SMT Host state unknown
    Vulnerability Meltdown:          Mitigation; PTI
    Vulnerability Spec store bypass: Vulnerable
    Vulnerability Spectre v1:        Mitigation; usercopy/swapgs barriers and __user pointer sanitization
    Vulnerability Spectre v2:        Mitigation; Full generic retpoline, STIBP disabled, RSB filling
    Vulnerability Srbds:             Not affected
    Vulnerability Tsx async abort:   Not affected
    Flags:                           fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm invpcid_single pti fsgsbase bmi1 avx2 smep bmi2 erms invpcid xsaveopt md_clear
    

| Cpu Property       | Value                                                   |
|:------------------ |:------------------------------------------------------- |
| Brand              | Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz               |
| Vendor             | :Intel                                                  |
| Architecture       | :Haswell                                                |
| Model              | Family: 0x06, Model: 0x3f, Stepping: 0x02, Type: 0x00   |
| Cores              | 2 physical cores, 2 logical cores (on executing CPU)    |
|                    | No Hyperthreading detected                              |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (32, 256, 30720) kbytes                     |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 46 bits physical                       |
| SIMD               | 256 bit = 32 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |

