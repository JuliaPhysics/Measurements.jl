# Benchmark result

* Pull request commit: [`5a0faf0b1ad508240e420535489e3c005deacd4c`](https://github.com/JuliaPhysics/Measurements.jl/commit/5a0faf0b1ad508240e420535489e3c005deacd4c)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/98> (Do not pollute scope with `@uncertain` macro)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 14 Mar 2021 - 00:38
    - Baseline: 14 Mar 2021 - 00:40
* Package commits:
    - Target: e64491
    - Baseline: d83e54
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

| ID                                   | time ratio | memory ratio |
|--------------------------------------|------------|--------------|

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       1955 s          1 s        101 s        300 s          0 s
       #2  2095 MHz        414 s          0 s        113 s       1747 s          0 s
       
  Memory: 6.7913818359375 GB (3379.015625 MB free)
  Uptime: 247.0 sec
  Load Avg:  1.07  0.85  0.39
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, skylake-avx512)
```

### Baseline
```
Julia Version 1.6.0-rc2
Commit 4b6b9fe4d7 (2021-03-11 07:05 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1040-azure #42-Ubuntu SMP Fri Feb 5 15:39:06 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       2664 s          1 s        119 s        453 s          0 s
       #2  2095 MHz        573 s          0 s        118 s       2461 s          0 s
       
  Memory: 6.7913818359375 GB (3366.1953125 MB free)
  Uptime: 335.0 sec
  Load Avg:  1.04  0.9  0.45
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, skylake-avx512)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 14 Mar 2021 - 0:38
* Package commit: e64491
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
| `["base", "create"]`                 |   6.700 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  32.698 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  19.560 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  19.579 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  32.396 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  14.100 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.230 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 369.515 ms (5%) |  7.105 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 110.663 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 542.894 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 560.578 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.250 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 790.451 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    2.907 s (5%) |  7.157 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 236.215 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 490.949 ms (5%) | 11.151 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     |  90.755 ms (5%) |  8.408 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 271.817 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.048 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 227.215 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 342.599 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      |  93.306 μs (5%) |           | 156.45 KiB (1%) |           5 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       1955 s          1 s        101 s        300 s          0 s
       #2  2095 MHz        414 s          0 s        113 s       1747 s          0 s
       
  Memory: 6.7913818359375 GB (3379.015625 MB free)
  Uptime: 247.0 sec
  Load Avg:  1.07  0.85  0.39
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, skylake-avx512)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 14 Mar 2021 - 0:40
* Package commit: d83e54
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

| ID                                   | time            | GC time  | memory          | allocations |
|--------------------------------------|----------------:|---------:|----------------:|------------:|
| `["base", "create"]`                 |   6.800 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  32.598 ns (5%) |          |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  19.560 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  19.480 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  32.698 ns (5%) |          |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  14.100 μs (5%) |          |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.230 μs (5%) |          |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 372.339 ms (5%) | 7.129 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 109.802 ns (5%) |          |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 542.365 ns (5%) |          |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 554.632 ns (5%) |          |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.260 μs (5%) |          |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 795.151 μs (5%) |          | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    2.903 s (5%) | 6.844 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 234.115 μs (5%) |          | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 488.379 ms (5%) | 9.505 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     |  87.969 ms (5%) | 7.366 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 278.318 μs (5%) |          | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.051 ms (5%) |          |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 234.116 μs (5%) |          | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 326.822 ms (5%) |          | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      |  90.406 μs (5%) |          | 156.45 KiB (1%) |           5 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       2664 s          1 s        119 s        453 s          0 s
       #2  2095 MHz        573 s          0 s        118 s       2461 s          0 s
       
  Memory: 6.7913818359375 GB (3366.1953125 MB free)
  Uptime: 335.0 sec
  Load Avg:  1.04  0.9  0.45
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, skylake-avx512)
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
    Model:                           85
    Model name:                      Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz
    Stepping:                        4
    CPU MHz:                         2095.172
    BogoMIPS:                        4190.34
    Hypervisor vendor:               Microsoft
    Virtualization type:             full
    L1d cache:                       64 KiB
    L1i cache:                       64 KiB
    L2 cache:                        2 MiB
    L3 cache:                        35.8 MiB
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
    Flags:                           fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt avx512cd avx512bw avx512vl xsaveopt xsavec xsaves md_clear
    

| Cpu Property       | Value                                                   |
|:------------------ |:------------------------------------------------------- |
| Brand              | Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz           |
| Vendor             | :Intel                                                  |
| Architecture       | :Skylake                                                |
| Model              | Family: 0x06, Model: 0x55, Stepping: 0x04, Type: 0x00   |
| Cores              | 2 physical cores, 2 logical cores (on executing CPU)    |
|                    | No Hyperthreading detected                              |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (32, 1024, 36608) kbytes                    |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 46 bits physical                       |
| SIMD               | 512 bit = 64 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |

