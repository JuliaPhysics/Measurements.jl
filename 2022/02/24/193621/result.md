# Benchmark result

* Pull request commit: [`a7ed7dd1c2abf930d7747263dc10a7cf7b4aed29`](https://github.com/JuliaPhysics/Measurements.jl/commit/a7ed7dd1c2abf930d7747263dc10a7cf7b4aed29)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/115> (add Aqua test & fix all ambiguities and unbound args)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 24 Feb 2022 - 19:34
    - Baseline: 24 Feb 2022 - 19:35
* Package commits:
    - Target: 9638f6
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
| `["quadgk", "cos"]`                  |                1.06 (5%) :x: |   1.00 (1%)  |
| `["specfun", "gamma"]`               |                1.14 (5%) :x: |   1.00 (1%)  |
| `["uncertain", "zeta"]`              |                1.08 (5%) :x: |   1.00 (1%)  |
| `["vector", "sin²+cos²"]`            | 0.87 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sqrt"]`                 | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  |                1.24 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all equal"]`      | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       2146 s          0 s        102 s       2122 s          0 s
       #2  2095 MHz        476 s          0 s        109 s       3799 s          0 s
       
  Memory: 6.7845458984375 GB (3888.546875 MB free)
  Uptime: 442.72 sec
  Load Avg:  1.0  0.69  0.33
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, skylake-avx512)
```

### Baseline
```
Julia Version 1.7.2
Commit bf53498635 (2022-02-06 15:21 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.3 LTS
  uname: Linux 5.11.0-1028-azure #31~20.04.2-Ubuntu SMP Tue Jan 18 08:46:15 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       2212 s          0 s        109 s       3071 s          0 s
       #2  2095 MHz       1423 s          0 s        128 s       3860 s          0 s
       
  Memory: 6.7845458984375 GB (3847.3671875 MB free)
  Uptime: 545.54 sec
  Load Avg:  1.0  0.78  0.4
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, skylake-avx512)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 24 Feb 2022 - 19:34
* Package commit: 9638f6
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
| `["base", "create"]`                 |  10.001 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  40.812 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  26.006 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  26.006 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  44.101 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  20.702 μs (5%) |           |   7.78 KiB (1%) |         325 |
| `["quadgk", "int1"]`                 |   1.720 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 491.389 ms (5%) | 10.402 ms | 132.00 MiB (1%) |     6666687 |
| `["specfun", "gamma"]`               | 146.737 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 776.206 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 774.905 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.810 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                |   1.098 ms (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    4.066 s (5%) | 12.027 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 310.530 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 545.862 ms (5%) | 14.504 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 115.693 ms (5%) | 11.823 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 368.936 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.281 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 302.829 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 496.733 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 123.112 μs (5%) |           | 156.39 KiB (1%) |           5 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       2146 s          0 s        102 s       2122 s          0 s
       #2  2095 MHz        476 s          0 s        109 s       3799 s          0 s
       
  Memory: 6.7845458984375 GB (3888.546875 MB free)
  Uptime: 442.72 sec
  Load Avg:  1.0  0.69  0.33
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, skylake-avx512)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 24 Feb 2022 - 19:35
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
| `["base", "create"]`                 |   9.901 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  40.003 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  26.308 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  26.709 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  44.606 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  19.601 μs (5%) |           |   7.78 KiB (1%) |         325 |
| `["quadgk", "int1"]`                 |   1.790 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 503.836 ms (5%) | 11.178 ms | 132.00 MiB (1%) |     6666687 |
| `["specfun", "gamma"]`               | 129.215 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 782.006 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 786.469 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.670 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                |   1.104 ms (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    4.079 s (5%) | 11.621 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 308.429 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 526.283 ms (5%) | 11.699 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 115.490 ms (5%) | 10.742 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 355.934 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.470 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 321.931 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 401.233 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 131.413 μs (5%) |           | 156.39 KiB (1%) |           5 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       2212 s          0 s        109 s       3071 s          0 s
       #2  2095 MHz       1423 s          0 s        128 s       3860 s          0 s
       
  Memory: 6.7845458984375 GB (3847.3671875 MB free)
  Uptime: 545.54 sec
  Load Avg:  1.0  0.78  0.4
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, skylake-avx512)
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
    CPU MHz:                         2095.247
    BogoMIPS:                        4190.49
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

