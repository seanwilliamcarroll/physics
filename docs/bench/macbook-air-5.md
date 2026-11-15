# Benchmarks, 2026-11-15, macbook-air-5

- **Commit:** `78905d81` (bench record: one small .tsv per machine (was ~300 criterion files); uploads in batches (#279))
- **Machine:** Darwin arm64, 10 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Run:** `cargo xtask bench`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from each benchmark's previous run. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 440.5 µs | 0.5% |  |  |
| `barnes_hut_f32/theta_0.5/128` | 27.6 µs | 0.1% |  |  |
| `barnes_hut_f32/theta_0.5/4096` | 3.86 ms | 0.3% |  |  |
| `barnes_hut_f32/theta_1/1024` | 213.1 µs | 0.9% |  |  |
| `barnes_hut_f32/theta_1/128` | 17.5 µs | 0.1% |  |  |
| `barnes_hut_f32/theta_1/4096` | 1.69 ms | 0.4% |  |  |
| `barnes_hut_f64/theta_0.5/1024` | 434.3 µs | 0.1% |  |  |
| `barnes_hut_f64/theta_0.5/128` | 27.6 µs | 0.1% |  |  |
| `barnes_hut_f64/theta_0.5/4096` | 3.97 ms | 0.4% |  |  |
| `barnes_hut_f64/theta_1/1024` | 206.8 µs | 0.1% |  |  |
| `barnes_hut_f64/theta_1/128` | 17.5 µs | 0.2% |  |  |
| `barnes_hut_f64/theta_1/4096` | 1.75 ms | 0.3% |  |  |
| `bodyvec_f32/1024` | 256 ns | 1.0% |  |  |
| `bodyvec_f32/128` | 44 ns | 4.4% |  |  |
| `bodyvec_f32/16` | 14 ns | 8.8% |  |  |
| `bodyvec_f64/1024` | 582 ns | 1.6% |  |  |
| `bodyvec_f64/128` | 74 ns | 2.8% |  |  |
| `bodyvec_f64/16` | 27 ns | 6.5% |  |  |
| `broadphase_f64/1024` | 70.1 µs | 0.2% |  |  |
| `broadphase_f64/128` | 6.9 µs | 0.1% |  |  |
| `broadphase_f64/4096` | 322.5 µs | 0.1% |  |  |
| `fft_f32/1024` | 4.4 µs | 0.1% |  |  |
| `fft_f32/16384` | 97.8 µs | 0.2% |  |  |
| `fft_f32/4096` | 20.3 µs | 0.1% |  |  |
| `pairwise_f32/1024` | 270.2 µs | 0.1% |  |  |
| `pairwise_f32/128` | 5.6 µs | 0.1% |  |  |
| `pairwise_f32/16` | 147 ns | 0.1% |  |  |
| `pairwise_f32/4096` | 4.29 ms | 0.2% |  |  |
| `pairwise_f64/1024` | 524.1 µs | 0.1% |  |  |
| `pairwise_f64/128` | 9.6 µs | 0.1% |  |  |
| `pairwise_f64/16` | 165 ns | 0.1% |  |  |
| `pairwise_f64/4096` | 8.43 ms | 0.1% |  |  |
| `piano_16_voices_x3_strings/128` | 50.8 µs | 0.0% |  |  |
| `piano_design_88_keys` | 174.64 ms | 0.1% |  |  |
| `sand_step/busy/1920x1080_chunks` | 14.61 ms | 0.1% | 142.0 Melem/s |  |
| `sand_step/busy/1920x1080_full` | 14.49 ms | 0.1% | 143.2 Melem/s |  |
| `sand_step/busy/640x360_chunks` | 1.52 ms | 0.3% | 151.6 Melem/s |  |
| `sand_step/busy/640x360_full` | 1.52 ms | 0.1% | 151.8 Melem/s |  |
| `sand_step/settled/1920x1080_chunks` | 27.9 µs | 0.5% | 74.4 Gelem/s |  |
| `sand_step/settled/1920x1080_full` | 5.26 ms | 0.1% | 394.4 Melem/s |  |
| `sand_step/settled/640x360_chunks` | 3.3 µs | 0.4% | 69.3 Gelem/s |  |
| `sand_step/settled/640x360_full` | 582.4 µs | 0.1% | 395.6 Melem/s |  |
| `spectrum_f32/4096` | 25.9 µs | 0.1% |  |  |
| `step_f32_symplectic/1024` | 270.7 µs | 0.1% |  |  |
| `step_f32_symplectic/128` | 5.7 µs | 0.1% |  |  |
| `step_f32_symplectic/16` | 161 ns | 0.1% |  |  |
| `step_f32_verlet/1024` | 544.6 µs | 0.8% |  |  |
| `step_f32_verlet/128` | 11.4 µs | 0.1% |  |  |
| `step_f32_verlet/16` | 318 ns | 0.1% |  |  |
| `step_f64_symplectic/1024` | 529.8 µs | 0.1% |  |  |
| `step_f64_symplectic/128` | 9.7 µs | 0.1% |  |  |
| `step_f64_symplectic/16` | 178 ns | 0.1% |  |  |
| `step_f64_verlet/1024` | 1.06 ms | 0.1% |  |  |
| `step_f64_verlet/128` | 19.4 µs | 0.1% |  |  |
| `step_f64_verlet/16` | 354 ns | 0.1% |  |  |
| `stiff_waveguide_new/21` | 1.32 ms | 0.2% |  |  |
| `stiff_waveguide_new/36` | 2.23 ms | 0.0% |  |  |
| `stiff_waveguide_new/60` | 1.79 ms | 0.1% |  |  |
| `stiff_waveguide_new/69` | 27.47 ms | 0.1% |  |  |
| `stiff_waveguide_new/84` | 2.77 ms | 0.1% |  |  |
| `swarm_models/ants/200x120_500` | 189.6 µs | 0.6% |  |  |
| `swarm_models/physarum/512_100k` | 2.60 ms | 0.6% |  |  |
| `swarm_models/vicsek/4000` | 1.09 ms | 7.7% |  |  |
| `swarm_step/Brute/1000` | 529.1 µs | 0.1% | 1.9 Melem/s |  |
| `swarm_step/Brute/10000` | 51.82 ms | 0.1% | 193.0 Kelem/s |  |
| `swarm_step/Brute/300` | 51.6 µs | 0.1% | 5.8 Melem/s |  |
| `swarm_step/Brute/3000` | 4.66 ms | 0.1% | 644.3 Kelem/s |  |
| `swarm_step/Grid/1000` | 594.0 µs | 3.7% | 1.7 Melem/s |  |
| `swarm_step/Grid/10000` | 6.26 ms | 9.0% | 1.6 Melem/s |  |
| `swarm_step/Grid/100000` | 42.31 ms | 1.5% | 2.4 Melem/s |  |
| `swarm_step/Grid/300` | 133.0 µs | 0.7% | 2.3 Melem/s |  |
| `swarm_step/Grid/3000` | 1.68 ms | 8.8% | 1.8 Melem/s |  |
| `swarm_step/Sorted/1000` | 132.5 µs | 4.7% | 7.5 Melem/s |  |
| `swarm_step/Sorted/10000` | 1.57 ms | 9.0% | 6.4 Melem/s |  |
| `swarm_step/Sorted/100000` | 13.34 ms | 3.9% | 7.5 Melem/s |  |
| `swarm_step/Sorted/300` | 38.6 µs | 3.4% | 7.8 Melem/s |  |
| `swarm_step/Sorted/3000` | 426.5 µs | 4.7% | 7.0 Melem/s |  |
