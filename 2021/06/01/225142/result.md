# Benchmark result

* Pull request commit: [`7132f545e8d7858d1460102d96effb06e051766c`](https://github.com/JuliaPhysics/Measurements.jl/commit/7132f545e8d7858d1460102d96effb06e051766c)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/105> (Don't run `ccall` test on platforms that don't allow it)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 1 Jun 2021 - 22:49
    - Baseline: 1 Jun 2021 - 22:51
* Package commits:
    - Target: 68cbac
    - Baseline: 713041
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
| `["base", "sum"]`                    |                1.06 (5%) :x: |   1.00 (1%)  |
| `["quadgk", "cos"]`                  | 0.84 (5%) :white_check_mark: |   1.00 (1%)  |
| `["quadgk", "sin"]`                  | 0.84 (5%) :white_check_mark: |   1.00 (1%)  |
| `["uncertain", "atan"]`              | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["uncertain", "log"]`               |                1.10 (5%) :x: |   1.00 (1%)  |
| `["uncertain", "zeta"]`              |                1.05 (5%) :x: |   1.00 (1%)  |
| `["vector", "mean - all equal"]`     |                1.07 (5%) :x: |   1.00 (1%)  |
| `["vector", "sin"]`                  |                1.08 (5%) :x: |   1.00 (1%)  |
| `["vector", "sin²+cos²"]`            |                1.05 (5%) :x: |   1.00 (1%)  |
| `["vector", "sqrt"]`                 |                1.07 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  |                1.20 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all equal"]`      |                1.10 (5%) :x: |   1.00 (1%)  |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       1838 s          1 s        108 s        867 s          0 s
       #2  2095 MHz        838 s          1 s        128 s       1871 s          0 s
       
  Memory: 6.791339874267578 GB (3662.4609375 MB free)
  Uptime: 287.0 sec
  Load Avg:  1.02  0.72  0.33
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, skylake-avx512)
```

### Baseline
```
Julia Version 1.6.1
Commit 6aaedecc44 (2021-04-23 05:59 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1047-azure #49-Ubuntu SMP Thu Apr 22 14:30:37 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       2052 s          1 s        113 s       1672 s          0 s
       #2  2095 MHz       1643 s          1 s        141 s       2081 s          0 s
       
  Memory: 6.791339874267578 GB (3667.94921875 MB free)
  Uptime: 390.0 sec
  Load Avg:  1.08  0.83  0.41
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, skylake-avx512)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 1 Jun 2021 - 22:49
* Package commit: 68cbac
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
| `["base", "create"]`                 |   9.901 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  47.122 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  28.144 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  28.444 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  47.020 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  20.601 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.680 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 511.994 ms (5%) |  9.191 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 147.612 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 728.505 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 821.500 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.810 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                |   1.162 ms (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.957 s (5%) |  9.401 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 343.728 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 624.108 ms (5%) | 13.355 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 114.033 ms (5%) | 12.141 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 411.033 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.545 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 325.227 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 509.021 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 137.311 μs (5%) |           | 156.45 KiB (1%) |           5 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       1838 s          1 s        108 s        867 s          0 s
       #2  2095 MHz        838 s          1 s        128 s       1871 s          0 s
       
  Memory: 6.791339874267578 GB (3662.4609375 MB free)
  Uptime: 287.0 sec
  Load Avg:  1.02  0.72  0.33
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, skylake-avx512)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 1 Jun 2021 - 22:51
* Package commit: 713041
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
| `["base", "multiplication"]`         |  45.505 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  27.339 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  27.440 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  44.391 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  24.402 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.750 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 606.946 ms (5%) |  9.630 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 147.614 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 790.890 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 748.643 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.720 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                |   1.158 ms (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.950 s (5%) |  9.207 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 320.425 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 633.123 ms (5%) | 11.216 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 112.448 ms (5%) |  9.785 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 380.731 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.471 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 302.625 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 423.574 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 124.810 μs (5%) |           | 156.45 KiB (1%) |           5 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       2052 s          1 s        113 s       1672 s          0 s
       #2  2095 MHz       1643 s          1 s        141 s       2081 s          0 s
       
  Memory: 6.791339874267578 GB (3667.94921875 MB free)
  Uptime: 390.0 sec
  Load Avg:  1.08  0.83  0.41
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
    CPU MHz:                         2095.200
    BogoMIPS:                        4190.40
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

