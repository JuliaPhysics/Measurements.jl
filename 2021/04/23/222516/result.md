# Benchmark result

* Pull request commit: [`5fce0d513f2f12fe9ddca50e56924adccb5763ff`](https://github.com/JuliaPhysics/Measurements.jl/commit/5fce0d513f2f12fe9ddca50e56924adccb5763ff)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/104> (Add `Base.hash(::Measurement, ::UInt)` method)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 23 Apr 2021 - 22:22
    - Baseline: 23 Apr 2021 - 22:24
* Package commits:
    - Target: 8aafaf
    - Baseline: cbda13
* Julia commits:
    - Target: f9720d
    - Baseline: f9720d
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
| `["base", "create"]`                 | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["base", "sin"]`                    |                1.16 (5%) :x: |   1.00 (1%)  |
| `["base", "sqrt"]`                   |                1.25 (5%) :x: |   1.00 (1%)  |
| `["base", "sum"]`                    |                1.09 (5%) :x: |   1.00 (1%)  |
| `["quadgk", "int1"]`                 |                1.07 (5%) :x: |   1.00 (1%)  |
| `["specfun", "gamma"]`               |                1.06 (5%) :x: |   1.00 (1%)  |
| `["uncertain", "atan"]`              |                1.07 (5%) :x: |   1.00 (1%)  |
| `["uncertain", "zeta"]`              |                1.20 (5%) :x: |   1.00 (1%)  |
| `["vector", "mean - all equal"]`     | 0.95 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "prod - all different"]` | 0.91 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sin²+cos²"]`            | 0.90 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sqrt"]`                 | 0.86 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  | 0.91 (5%) :white_check_mark: |   1.00 (1%)  |

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
Julia Version 1.6.0
Commit f9720dc2eb (2021-03-24 12:55 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1046-azure #48-Ubuntu SMP Tue Apr 13 07:18:42 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       1952 s          1 s        111 s       3312 s          0 s
       #2  2294 MHz        943 s          2 s        141 s       4280 s          0 s
       
  Memory: 6.791343688964844 GB (3627.78515625 MB free)
  Uptime: 541.0 sec
  Load Avg:  1.07  0.76  0.37
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

### Baseline
```
Julia Version 1.6.0
Commit f9720dc2eb (2021-03-24 12:55 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1046-azure #48-Ubuntu SMP Tue Apr 13 07:18:42 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       2050 s          1 s        116 s       4348 s          0 s
       #2  2294 MHz       1972 s          2 s        161 s       4371 s          0 s
       
  Memory: 6.791343688964844 GB (3656.3515625 MB free)
  Uptime: 655.0 sec
  Load Avg:  1.01  0.84  0.44
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 23 Apr 2021 - 22:22
* Package commit: 8aafaf
* Julia commit: f9720d
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
| `["base", "create"]`                 |   7.800 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  44.109 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  26.807 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  28.715 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  41.877 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  16.999 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.570 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 524.056 ms (5%) | 11.144 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 116.411 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 644.865 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 656.768 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.330 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 845.596 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.730 s (5%) | 12.296 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 262.199 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 598.848 ms (5%) | 23.942 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 177.676 ms (5%) | 21.503 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 336.198 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.156 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 226.898 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 418.810 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 108.899 μs (5%) |           | 156.45 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.6.0
Commit f9720dc2eb (2021-03-24 12:55 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1046-azure #48-Ubuntu SMP Tue Apr 13 07:18:42 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       1952 s          1 s        111 s       3312 s          0 s
       #2  2294 MHz        943 s          2 s        141 s       4280 s          0 s
       
  Memory: 6.791343688964844 GB (3627.78515625 MB free)
  Uptime: 541.0 sec
  Load Avg:  1.07  0.76  0.37
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 23 Apr 2021 - 22:24
* Package commit: cbda13
* Julia commit: f9720d
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
| `["base", "create"]`                 |   8.500 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  43.000 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  23.091 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  22.992 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  38.547 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  17.500 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.470 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 509.719 ms (5%) | 12.836 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 109.518 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 603.205 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 643.219 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.110 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 850.295 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.719 s (5%) | 11.346 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 275.999 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 656.808 ms (5%) | 19.624 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 173.095 ms (5%) | 19.231 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 322.798 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.290 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 264.800 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 460.237 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 110.200 μs (5%) |           | 156.45 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.6.0
Commit f9720dc2eb (2021-03-24 12:55 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1046-azure #48-Ubuntu SMP Tue Apr 13 07:18:42 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       2050 s          1 s        116 s       4348 s          0 s
       #2  2294 MHz       1972 s          2 s        161 s       4371 s          0 s
       
  Memory: 6.791343688964844 GB (3656.3515625 MB free)
  Uptime: 655.0 sec
  Load Avg:  1.01  0.84  0.44
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
    CPU MHz:                         2294.687
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
|                    | No Hyperthreading detected                              |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (32, 256, 51200) kbytes                     |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 46 bits physical                       |
| SIMD               | 256 bit = 32 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |

