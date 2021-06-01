# Benchmark result

* Pull request commit: [`2881e4a6a133a839907de4e9934f35335cc672d3`](https://github.com/JuliaPhysics/Measurements.jl/commit/2881e4a6a133a839907de4e9934f35335cc672d3)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/105> (Don't run `ccall` test on platforms that don't allow it)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 1 Jun 2021 - 23:12
    - Baseline: 1 Jun 2021 - 23:14
* Package commits:
    - Target: edfd3b
    - Baseline: 07bbf5
* Julia commits:
    - Target: 6aaede
    - Baseline: 6aaede
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
| `["base", "create"]`                 | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["uncertain", "log"]`               |                1.05 (5%) :x: |   1.00 (1%)  |
| `["vector", "mean - all equal"]`     |                1.05 (5%) :x: |   1.00 (1%)  |
| `["vector", "prod - all different"]` | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sin"]`                  |                1.06 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  | 0.91 (5%) :white_check_mark: |   1.00 (1%)  |
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
Julia Version 1.6.1
Commit 6aaedecc44 (2021-04-23 05:59 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1047-azure #49-Ubuntu SMP Thu Apr 22 14:30:37 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz        510 s          2 s        109 s       2411 s          0 s
       #2  2294 MHz       2315 s          1 s        145 s        570 s          0 s
       
  Memory: 6.791339874267578 GB (3664.3046875 MB free)
  Uptime: 308.0 sec
  Load Avg:  1.03  0.8  0.38
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

### Baseline
```
Julia Version 1.6.1
Commit 6aaedecc44 (2021-04-23 05:59 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1047-azure #49-Ubuntu SMP Thu Apr 22 14:30:37 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz        651 s          2 s        116 s       3356 s          0 s
       #2  2294 MHz       3277 s          1 s        156 s        697 s          0 s
       
  Memory: 6.791339874267578 GB (3467.98046875 MB free)
  Uptime: 418.0 sec
  Load Avg:  1.0  0.86  0.45
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 1 Jun 2021 - 23:12
* Package commit: edfd3b
* Julia commit: 6aaede
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
| `["base", "create"]`                 |   9.400 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  42.121 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  24.975 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  24.824 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  43.738 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  19.000 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.660 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 554.123 ms (5%) | 12.490 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 116.779 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 653.994 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 689.264 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.320 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                |   1.021 ms (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.761 s (5%) | 11.917 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 313.004 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 649.532 ms (5%) | 21.291 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 187.221 ms (5%) | 21.831 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 400.105 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.434 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 304.804 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 453.488 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 130.001 μs (5%) |           | 156.45 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.6.1
Commit 6aaedecc44 (2021-04-23 05:59 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1047-azure #49-Ubuntu SMP Thu Apr 22 14:30:37 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz        510 s          2 s        109 s       2411 s          0 s
       #2  2294 MHz       2315 s          1 s        145 s        570 s          0 s
       
  Memory: 6.791339874267578 GB (3664.3046875 MB free)
  Uptime: 308.0 sec
  Load Avg:  1.03  0.8  0.38
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 1 Jun 2021 - 23:14
* Package commit: 07bbf5
* Julia commit: 6aaede
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
| `["base", "create"]`                 |  10.000 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  44.141 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  25.477 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  24.825 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  44.545 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  18.900 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.600 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 555.135 ms (5%) | 11.666 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 119.334 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 658.288 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 653.727 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.360 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                |   1.044 ms (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.762 s (5%) | 11.849 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 297.603 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 693.871 ms (5%) | 18.810 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 184.925 ms (5%) | 18.535 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 379.105 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.422 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 318.904 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 499.061 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 122.401 μs (5%) |           | 156.45 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.6.1
Commit 6aaedecc44 (2021-04-23 05:59 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1047-azure #49-Ubuntu SMP Thu Apr 22 14:30:37 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz        651 s          2 s        116 s       3356 s          0 s
       #2  2294 MHz       3277 s          1 s        156 s        697 s          0 s
       
  Memory: 6.791339874267578 GB (3467.98046875 MB free)
  Uptime: 418.0 sec
  Load Avg:  1.0  0.86  0.45
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
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
    CPU MHz:                         2294.689
    BogoMIPS:                        4589.37
    Hypervisor vendor:               Microsoft
    Virtualization type:             full
    L1d cache:                       64 KiB
    L1i cache:                       64 KiB
    L2 cache:                        512 KiB
    L3 cache:                        50 MiB
    NUMA node0 CPU(s):               0,1
    Vulnerability Itlb multihit:     KVM: Vulnerable
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

