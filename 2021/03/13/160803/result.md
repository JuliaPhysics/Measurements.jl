# Benchmark result

* Pull request commit: [`51145dc6ba0c50f4c3f55f6a5f4bbb4900b70271`](https://github.com/JuliaPhysics/Measurements.jl/commit/51145dc6ba0c50f4c3f55f6a5f4bbb4900b70271)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/96> (Fix failing doctest)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 13 Mar 2021 - 16:05
    - Baseline: 13 Mar 2021 - 16:07
* Package commits:
    - Target: 5fe9b9
    - Baseline: 5e5513
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
| `["base", "create"]`                 |                1.06 (5%) :x: |   1.00 (1%)  |
| `["base", "sin"]`                    |                1.14 (5%) :x: |   1.00 (1%)  |
| `["base", "sqrt"]`                   |                1.14 (5%) :x: |   1.00 (1%)  |
| `["vector", "prod - all different"]` |                1.15 (5%) :x: |   1.00 (1%)  |
| `["vector", "prod - all equal"]`     | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sin²+cos²"]`            |                1.05 (5%) :x: |   1.00 (1%)  |
| `["vector", "sqrt"]`                 |                1.09 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  | 0.84 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sum - all equal"]`      | 0.95 (5%) :white_check_mark: |   1.00 (1%)  |

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
       #1  2095 MHz       2147 s          1 s        157 s       1059 s          0 s
       #2  2095 MHz       1002 s          1 s        153 s       2196 s          0 s
       
  Memory: 6.7913818359375 GB (3380.703125 MB free)
  Uptime: 350.0 sec
  Load Avg:  1.02  0.91  0.46
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
       #1  2095 MHz       2215 s          1 s        164 s       2159 s          0 s
       #2  2095 MHz       2099 s          1 s        176 s       2254 s          0 s
       
  Memory: 6.7913818359375 GB (3408.71875 MB free)
  Uptime: 468.0 sec
  Load Avg:  1.12  1.0  0.55
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, skylake-avx512)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 13 Mar 2021 - 16:5
* Package commit: 5fe9b9
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
| `["base", "create"]`                 |  11.512 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  48.536 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  32.295 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  32.296 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  48.839 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  21.001 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.800 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 534.018 ms (5%) | 11.915 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 159.476 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 777.923 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 803.030 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.810 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                |   1.206 ms (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.972 s (5%) | 11.462 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 344.215 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 682.844 ms (5%) | 24.872 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 152.647 ms (5%) | 16.032 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 456.920 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.605 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 357.616 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 427.154 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 137.206 μs (5%) |           | 156.45 KiB (1%) |           5 |

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
       #1  2095 MHz       2147 s          1 s        157 s       1059 s          0 s
       #2  2095 MHz       1002 s          1 s        153 s       2196 s          0 s
       
  Memory: 6.7913818359375 GB (3380.703125 MB free)
  Uptime: 350.0 sec
  Load Avg:  1.02  0.91  0.46
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, skylake-avx512)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 13 Mar 2021 - 16:7
* Package commit: 5e5513
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
| `["base", "create"]`                 |  10.811 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  47.525 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  28.271 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  28.271 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  47.019 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  20.701 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.770 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 542.260 ms (5%) | 12.147 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 157.707 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 787.529 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 808.040 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.800 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                |   1.217 ms (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.940 s (5%) | 10.633 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 330.813 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 591.409 ms (5%) | 19.913 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 164.937 ms (5%) | 19.405 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 465.616 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.522 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 326.613 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 506.908 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 144.702 μs (5%) |           | 156.45 KiB (1%) |           5 |

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
       #1  2095 MHz       2215 s          1 s        164 s       2159 s          0 s
       #2  2095 MHz       2099 s          1 s        176 s       2254 s          0 s
       
  Memory: 6.7913818359375 GB (3408.71875 MB free)
  Uptime: 468.0 sec
  Load Avg:  1.12  1.0  0.55
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
    CPU MHz:                         2095.146
    BogoMIPS:                        4190.29
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

