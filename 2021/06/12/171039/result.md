# Benchmark result

* Pull request commit: [`326cde7507d1e667946b26be9c10af253579e6c2`](https://github.com/JuliaPhysics/Measurements.jl/commit/326cde7507d1e667946b26be9c10af253579e6c2)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/107> (Use `Documenter.jl` v0.27)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 12 Jun 2021 - 17:08
    - Baseline: 12 Jun 2021 - 17:10
* Package commits:
    - Target: c9a972
    - Baseline: b44324
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
| `["base", "create"]`                 |                1.08 (5%) :x: |   1.00 (1%)  |
| `["base", "multiplication"]`         |                1.07 (5%) :x: |   1.00 (1%)  |
| `["base", "sin"]`                    |                1.15 (5%) :x: |   1.00 (1%)  |
| `["base", "sqrt"]`                   |                1.10 (5%) :x: |   1.00 (1%)  |
| `["base", "sum"]`                    |                1.07 (5%) :x: |   1.00 (1%)  |
| `["quadgk", "cos"]`                  | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["specfun", "gamma"]`               |                1.07 (5%) :x: |   1.00 (1%)  |
| `["vector", "gamma"]`                |                1.06 (5%) :x: |   1.00 (1%)  |
| `["vector", "prod - all different"]` |                1.12 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  |                1.19 (5%) :x: |   1.00 (1%)  |

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
  uname: Linux 5.8.0-1033-azure #35~20.04.1-Ubuntu SMP Wed May 19 06:46:04 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz        454 s          2 s        103 s       5533 s          0 s
       #2  2294 MHz       2361 s          1 s        142 s       3589 s          0 s
       
  Memory: 6.790924072265625 GB (3776.25 MB free)
  Uptime: 614.0 sec
  Load Avg:  1.01  0.72  0.35
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
  uname: Linux 5.8.0-1033-azure #35~20.04.1-Ubuntu SMP Wed May 19 06:46:04 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       1462 s          2 s        122 s       5605 s          0 s
       #2  2294 MHz       2439 s          1 s        148 s       4605 s          0 s
       
  Memory: 6.790924072265625 GB (3784.44140625 MB free)
  Uptime: 725.0 sec
  Load Avg:  1.0  0.81  0.43
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 12 Jun 2021 - 17:8
* Package commit: c9a972
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
| `["base", "multiplication"]`         |  44.602 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  27.638 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  28.040 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  43.334 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  17.401 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.590 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 524.457 ms (5%) | 10.946 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 119.642 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 622.673 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 669.937 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.280 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                |   1.043 ms (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.856 s (5%) | 10.878 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 285.302 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 705.516 ms (5%) | 21.755 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 165.340 ms (5%) | 19.445 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 359.804 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.405 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 280.703 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 523.964 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 126.301 μs (5%) |           | 156.45 KiB (1%) |           5 |

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
  uname: Linux 5.8.0-1033-azure #35~20.04.1-Ubuntu SMP Wed May 19 06:46:04 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz        454 s          2 s        103 s       5533 s          0 s
       #2  2294 MHz       2361 s          1 s        142 s       3589 s          0 s
       
  Memory: 6.790924072265625 GB (3776.25 MB free)
  Uptime: 614.0 sec
  Load Avg:  1.01  0.72  0.35
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 12 Jun 2021 - 17:10
* Package commit: b44324
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
| `["base", "create"]`                 |   9.300 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  41.878 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  24.020 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  25.528 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  40.606 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  18.999 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.590 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 528.649 ms (5%) | 11.960 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 111.337 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 640.000 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 691.608 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.320 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 987.808 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.804 s (5%) | 11.796 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 285.502 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 629.042 ms (5%) | 18.352 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 166.262 ms (5%) | 16.003 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 373.703 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.389 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 272.802 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 442.142 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 122.001 μs (5%) |           | 156.45 KiB (1%) |           5 |

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
  uname: Linux 5.8.0-1033-azure #35~20.04.1-Ubuntu SMP Wed May 19 06:46:04 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       1462 s          2 s        122 s       5605 s          0 s
       #2  2294 MHz       2439 s          1 s        148 s       4605 s          0 s
       
  Memory: 6.790924072265625 GB (3784.44140625 MB free)
  Uptime: 725.0 sec
  Load Avg:  1.0  0.81  0.43
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

