# Benchmark result

* Pull request commit: [`5928c05cbe9749237b5cfddf46abc4f2bdf73774`](https://github.com/JuliaPhysics/Measurements.jl/commit/5928c05cbe9749237b5cfddf46abc4f2bdf73774)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/92> (Add GitHub Actions workflows to run benchmarks on CI)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 23 Feb 2021 - 23:39
    - Baseline: 23 Feb 2021 - 23:40
* Package commits:
    - Target: 1be6c8
    - Baseline: ea4d04
* Julia commits:
    - Target: a58bdd
    - Baseline: a58bdd
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

| ID                           | time ratio | memory ratio |
|------------------------------|------------|--------------|

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
Julia Version 1.6.0-rc1
Commit a58bdd9010 (2021-02-06 15:49 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.5 LTS
  uname: Linux 5.4.0-1039-azure #41~18.04.1-Ubuntu SMP Mon Jan 18 14:00:01 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2397 MHz       1503 s          0 s        126 s        549 s          0 s
       #2  2397 MHz        554 s          0 s        149 s       1531 s          0 s
       
  Memory: 6.791393280029297 GB (3802.0859375 MB free)
  Uptime: 233.0 sec
  Load Avg:  1.1  0.79  0.35
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, haswell)
```

### Baseline
```
Julia Version 1.6.0-rc1
Commit a58bdd9010 (2021-02-06 15:49 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.5 LTS
  uname: Linux 5.4.0-1039-azure #41~18.04.1-Ubuntu SMP Mon Jan 18 14:00:01 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2397 MHz       2093 s          0 s        142 s        725 s          0 s
       #2  2397 MHz        741 s          0 s        154 s       2118 s          0 s
       
  Memory: 6.791393280029297 GB (3856.171875 MB free)
  Uptime: 312.0 sec
  Load Avg:  1.11  0.86  0.41
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, haswell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 23 Feb 2021 - 23:39
* Package commit: 1be6c8
* Julia commit: a58bdd
* Julia command flags: None
* Environment variables: None

## Results
Below is a table of this job's results, obtained by running the benchmarks.
The values listed in the `ID` column have the structure `[parent_group, child_group, ..., key]`, and can be used to
index into the BaseBenchmarks suite to retrieve the corresponding benchmarks.
The percentages accompanying time and memory values in the below table are noise tolerances. The "true"
time/memory value for a given benchmark is expected to fall within this percentage of the reported value.
An empty cell means that the value was zero.

| ID                           | time            | GC time   | memory          | allocations |
|------------------------------|----------------:|----------:|----------------:|------------:|
| `["base", "create"]`         |  10.310 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]` |  48.332 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`            |  30.151 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`           |  30.151 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`            |  47.879 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`          |  22.501 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`         |   1.810 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`          | 594.450 ms (5%) | 10.239 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`       | 160.534 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`      | 799.059 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`       | 767.588 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`      |   1.670 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`        |   1.400 ms (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin"]`          | 453.704 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`    |   1.573 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`         | 325.103 μs (5%) |           | 781.33 KiB (1%) |       10002 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.6.0-rc1
Commit a58bdd9010 (2021-02-06 15:49 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.5 LTS
  uname: Linux 5.4.0-1039-azure #41~18.04.1-Ubuntu SMP Mon Jan 18 14:00:01 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2397 MHz       1503 s          0 s        126 s        549 s          0 s
       #2  2397 MHz        554 s          0 s        149 s       1531 s          0 s
       
  Memory: 6.791393280029297 GB (3802.0859375 MB free)
  Uptime: 233.0 sec
  Load Avg:  1.1  0.79  0.35
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, haswell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 23 Feb 2021 - 23:40
* Package commit: ea4d04
* Julia commit: a58bdd
* Julia command flags: None
* Environment variables: None

## Results
Below is a table of this job's results, obtained by running the benchmarks.
The values listed in the `ID` column have the structure `[parent_group, child_group, ..., key]`, and can be used to
index into the BaseBenchmarks suite to retrieve the corresponding benchmarks.
The percentages accompanying time and memory values in the below table are noise tolerances. The "true"
time/memory value for a given benchmark is expected to fall within this percentage of the reported value.
An empty cell means that the value was zero.

| ID                           | time            | GC time   | memory          | allocations |
|------------------------------|----------------:|----------:|----------------:|------------:|
| `["base", "create"]`         |  10.411 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]` |  48.839 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`            |  30.252 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`           |  30.252 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`            |  49.092 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`          |  22.401 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`         |   1.840 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`          | 590.486 ms (5%) | 10.543 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`       | 161.553 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`      | 791.196 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`       | 762.298 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`      |   1.670 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`        |   1.400 ms (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin"]`          | 452.413 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`    |   1.555 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`         | 325.510 μs (5%) |           | 781.33 KiB (1%) |       10002 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.6.0-rc1
Commit a58bdd9010 (2021-02-06 15:49 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.5 LTS
  uname: Linux 5.4.0-1039-azure #41~18.04.1-Ubuntu SMP Mon Jan 18 14:00:01 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz: 
              speed         user         nice          sys         idle          irq
       #1  2397 MHz       2093 s          0 s        142 s        725 s          0 s
       #2  2397 MHz        741 s          0 s        154 s       2118 s          0 s
       
  Memory: 6.791393280029297 GB (3856.171875 MB free)
  Uptime: 312.0 sec
  Load Avg:  1.11  0.86  0.41
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

    Architecture:        x86_64
    CPU op-mode(s):      32-bit, 64-bit
    Byte Order:          Little Endian
    CPU(s):              2
    On-line CPU(s) list: 0,1
    Thread(s) per core:  1
    Core(s) per socket:  2
    Socket(s):           1
    NUMA node(s):        1
    Vendor ID:           GenuineIntel
    CPU family:          6
    Model:               63
    Model name:          Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz
    Stepping:            2
    CPU MHz:             2397.225
    BogoMIPS:            4794.45
    Hypervisor vendor:   Microsoft
    Virtualization type: full
    L1d cache:           32K
    L1i cache:           32K
    L2 cache:            256K
    L3 cache:            30720K
    NUMA node0 CPU(s):   0,1
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm invpcid_single pti fsgsbase bmi1 avx2 smep bmi2 erms invpcid xsaveopt md_clear
    

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

