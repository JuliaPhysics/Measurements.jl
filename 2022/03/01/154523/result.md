# Benchmark result

* Pull request commit: [`f9c054e01d04400e183d25f10abae5b8581a04dd`](https://github.com/JuliaPhysics/Measurements.jl/commit/f9c054e01d04400e183d25f10abae5b8581a04dd)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/115> (add Aqua test & fix all ambiguities and unbound args)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 1 Mar 2022 - 15:43
    - Baseline: 1 Mar 2022 - 15:44
* Package commits:
    - Target: 2af8b3
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

| ID                                   | time ratio    | memory ratio |
|--------------------------------------|---------------|--------------|
| `["vector", "sum - all different"]`  | 1.05 (5%) :x: |   1.00 (1%)  |

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
  CPU: Intel(R) Xeon(R) Platinum 8370C CPU @ 2.80GHz: 
              speed         user         nice          sys         idle          irq
       #1  2793 MHz       1944 s          0 s         84 s        838 s          0 s
       #2  2793 MHz        449 s          0 s         80 s       2341 s          0 s
       
  Memory: 6.7845458984375 GB (3606.74609375 MB free)
  Uptime: 290.96 sec
  Load Avg:  1.0  0.63  0.27
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, icelake-server)
```

### Baseline
```
Julia Version 1.7.2
Commit bf53498635 (2022-02-06 15:21 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.3 LTS
  uname: Linux 5.11.0-1028-azure #31~20.04.2-Ubuntu SMP Tue Jan 18 08:46:15 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8370C CPU @ 2.80GHz: 
              speed         user         nice          sys         idle          irq
       #1  2793 MHz       2008 s          0 s         89 s       1629 s          0 s
       #2  2793 MHz       1244 s          0 s         91 s       2399 s          0 s
       
  Memory: 6.7845458984375 GB (3652.265625 MB free)
  Uptime: 377.29 sec
  Load Avg:  1.0  0.72  0.34
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, icelake-server)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 1 Mar 2022 - 15:43
* Package commit: 2af8b3
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
| `["base", "create"]`                 |   8.299 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  35.044 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  22.087 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  21.966 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  35.146 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  17.099 μs (5%) |           |   7.78 KiB (1%) |         325 |
| `["quadgk", "int1"]`                 |   1.440 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 403.056 ms (5%) |  7.459 ms | 132.00 MiB (1%) |     6666687 |
| `["specfun", "gamma"]`               | 146.243 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 670.873 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 701.294 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.730 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                |   1.001 ms (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.668 s (5%) |  9.012 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 255.696 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 471.214 ms (5%) | 10.274 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 120.661 ms (5%) |  7.069 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 309.795 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.151 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 248.596 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 338.501 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 113.098 μs (5%) |           | 156.39 KiB (1%) |           5 |

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
  CPU: Intel(R) Xeon(R) Platinum 8370C CPU @ 2.80GHz: 
              speed         user         nice          sys         idle          irq
       #1  2793 MHz       1944 s          0 s         84 s        838 s          0 s
       #2  2793 MHz        449 s          0 s         80 s       2341 s          0 s
       
  Memory: 6.7845458984375 GB (3606.74609375 MB free)
  Uptime: 290.96 sec
  Load Avg:  1.0  0.63  0.27
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, icelake-server)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 1 Mar 2022 - 15:44
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

| ID                                   | time            | GC time  | memory          | allocations |
|--------------------------------------|----------------:|---------:|----------------:|------------:|
| `["base", "create"]`                 |   8.300 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  34.441 ns (5%) |          |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  21.686 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  21.665 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  34.339 ns (5%) |          |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  17.200 μs (5%) |          |   7.78 KiB (1%) |         325 |
| `["quadgk", "int1"]`                 |   1.450 μs (5%) |          |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 404.763 ms (5%) | 7.547 ms | 132.00 MiB (1%) |     6666687 |
| `["specfun", "gamma"]`               | 146.243 ns (5%) |          |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 662.652 ns (5%) |          |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 677.771 ns (5%) |          |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.730 μs (5%) |          |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                |   1.023 ms (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.651 s (5%) | 8.810 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 254.395 μs (5%) |          | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 458.578 ms (5%) | 7.256 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 118.986 ms (5%) | 6.093 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 300.594 μs (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.137 ms (5%) |          |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 240.896 μs (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 321.312 ms (5%) |          | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 112.998 μs (5%) |          | 156.39 KiB (1%) |           5 |

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
  CPU: Intel(R) Xeon(R) Platinum 8370C CPU @ 2.80GHz: 
              speed         user         nice          sys         idle          irq
       #1  2793 MHz       2008 s          0 s         89 s       1629 s          0 s
       #2  2793 MHz       1244 s          0 s         91 s       2399 s          0 s
       
  Memory: 6.7845458984375 GB (3652.265625 MB free)
  Uptime: 377.29 sec
  Load Avg:  1.0  0.72  0.34
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, icelake-server)
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
    Model:                           106
    Model name:                      Intel(R) Xeon(R) Platinum 8370C CPU @ 2.80GHz
    Stepping:                        6
    CPU MHz:                         2793.438
    BogoMIPS:                        5586.87
    Hypervisor vendor:               Microsoft
    Virtualization type:             full
    L1d cache:                       96 KiB
    L1i cache:                       64 KiB
    L2 cache:                        2.5 MiB
    L3 cache:                        48 MiB
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
    Flags:                           fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm avx512f avx512dq rdseed adx smap clflushopt avx512cd avx512bw avx512vl xsaveopt xsavec xsaves md_clear
    

| Cpu Property       | Value                                                   |
|:------------------ |:------------------------------------------------------- |
| Brand              | Intel(R) Xeon(R) Platinum 8370C CPU @ 2.80GHz           |
| Vendor             | :Intel                                                  |
| Architecture       | :UnknownIntel                                           |
| Model              | Family: 0x06, Model: 0x6a, Stepping: 0x06, Type: 0x00   |
| Cores              | 2 physical cores, 2 logical cores (on executing CPU)    |
|                    | No Hyperthreading hardware capability detected          |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (48, 1280, 49152) kbytes                    |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 46 bits physical                       |
| SIMD               | 512 bit = 64 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |

