# Benchmarks, 2026-11-17, macbook-air-5-native

- **Commit:** `8e2e7a25` (swarm: the grid's candidates through a branchless scalar add (Seen::add_masked; Grid −37% at 100k on the M4, −35% in V8); sorted's leftovers keep the branching add (the masked one was 20% slower at 1k in V8) (#320))
- **Machine:** Darwin arm64, 10 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** native (`-C target-cpu=native`)
- **Run:** `cargo xtask bench --level native`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `macbook-air-5-native`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 443.8 µs | 0.4% |  | +1.9% |
| `barnes_hut_f32/theta_0.5/128` | 27.4 µs | 0.1% |  | +0.1% |
| `barnes_hut_f32/theta_0.5/4096` | 3.81 ms | 0.4% |  | -0.9% |
| `barnes_hut_f32/theta_1/1024` | 205.9 µs | 0.2% |  | -0.1% |
| `barnes_hut_f32/theta_1/128` | 17.4 µs | 0.1% |  | +0.2% |
| `barnes_hut_f32/theta_1/4096` | 1.64 ms | 0.2% |  | -0.1% |
| `barnes_hut_f64/theta_0.5/1024` | 436.1 µs | 0.2% |  | -2.1% |
| `barnes_hut_f64/theta_0.5/128` | 27.5 µs | 0.1% |  | -0.0% |
| `barnes_hut_f64/theta_0.5/4096` | 3.98 ms | 0.3% |  | +0.2% |
| `barnes_hut_f64/theta_1/1024` | 207.6 µs | 0.1% |  | -0.1% |
| `barnes_hut_f64/theta_1/128` | 17.5 µs | 0.1% |  | -0.2% |
| `barnes_hut_f64/theta_1/4096` | 1.68 ms | 0.5% |  | +0.9% |
| `bodyvec_f32/1024` | 251 ns | 0.5% |  | -1.4% |
| `bodyvec_f32/128` | 39 ns | 0.1% |  | +0.2% |
| `bodyvec_f32/16` | 11 ns | 0.2% |  | -0.1% |
| `bodyvec_f64/1024` | 557 ns | 1.7% |  | +0.5% |
| `bodyvec_f64/128` | 69 ns | 0.2% |  | +0.4% |
| `bodyvec_f64/16` | 23 ns | 0.2% |  | -0.5% |
| `broadphase_f64/1024` | 70.2 µs | 0.1% |  | +0.5% |
| `broadphase_f64/128` | 6.9 µs | 0.1% |  | +0.2% |
| `broadphase_f64/4096` | 322.7 µs | 0.1% |  | +0.3% |
| `fft_f32/1024` | 4.4 µs | 0.1% |  | +0.3% |
| `fft_f32/16384` | 98.0 µs | 0.1% |  | +0.1% |
| `fft_f32/4096` | 20.3 µs | 0.1% |  | +0.2% |
| `pairwise_f32/1024` | 270.1 µs | 0.1% |  | +0.1% |
| `pairwise_f32/128` | 5.6 µs | 0.1% |  | -0.0% |
| `pairwise_f32/16` | 147 ns | 0.1% |  | +0.0% |
| `pairwise_f32/4096` | 4.27 ms | 0.0% |  | -0.2% |
| `pairwise_f64/1024` | 493.9 µs | 0.2% |  | +0.1% |
| `pairwise_f64/128` | 8.3 µs | 0.1% |  | -0.1% |
| `pairwise_f64/16` | 165 ns | 0.1% |  | +0.1% |
| `pairwise_f64/4096` | 7.94 ms | 0.0% |  | -0.5% |
| `piano_16_voices_x3_strings/128` | 55.7 µs | 0.2% |  | +0.1% |
| `piano_design_88_keys` | 29.90 ms | 0.1% |  | -0.3% |
| `sand_step/busy/1920x1080_chunks` | 14.66 ms | 0.1% | 141.5 Melem/s | -0.0% |
| `sand_step/busy/1920x1080_full` | 14.56 ms | 0.1% | 142.4 Melem/s | +0.2% |
| `sand_step/busy/640x360_chunks` | 1.53 ms | 0.1% | 150.3 Melem/s | -0.3% |
| `sand_step/busy/640x360_full` | 1.53 ms | 0.1% | 150.8 Melem/s | -0.2% |
| `sand_step/settled/1920x1080_chunks` | 28.2 µs | 0.5% | 73.6 Gelem/s | -0.2% |
| `sand_step/settled/1920x1080_full` | 5.27 ms | 0.1% | 393.7 Melem/s | -0.1% |
| `sand_step/settled/640x360_chunks` | 3.3 µs | 0.4% | 69.0 Gelem/s | +0.7% |
| `sand_step/settled/640x360_full` | 582.3 µs | 0.1% | 395.7 Melem/s | +0.0% |
| `spectrum_f32/4096` | 25.9 µs | 0.1% |  | +0.0% |
| `step_f32_symplectic/1024` | 270.7 µs | 0.1% |  | +0.0% |
| `step_f32_symplectic/128` | 5.7 µs | 0.1% |  | +0.1% |
| `step_f32_symplectic/16` | 157 ns | 0.1% |  | -0.1% |
| `step_f32_verlet/1024` | 541.8 µs | 0.1% |  | +0.2% |
| `step_f32_verlet/128` | 11.4 µs | 0.1% |  | +0.1% |
| `step_f32_verlet/16` | 312 ns | 0.2% |  | +0.0% |
| `step_f64_symplectic/1024` | 494.7 µs | 0.1% |  | +0.1% |
| `step_f64_symplectic/128` | 8.4 µs | 0.2% |  | +0.2% |
| `step_f64_symplectic/16` | 181 ns | 0.1% |  | +0.2% |
| `step_f64_verlet/1024` | 989.7 µs | 0.1% |  | +0.1% |
| `step_f64_verlet/128` | 16.8 µs | 0.1% |  | -0.1% |
| `step_f64_verlet/16` | 356 ns | 0.1% |  | +0.1% |
| `stiff_waveguide_new/21` | 51.5 µs | 0.4% |  | +0.5% |
| `stiff_waveguide_new/36` | 500.8 µs | 0.1% |  | -0.1% |
| `stiff_waveguide_new/60` | 164.1 µs | 0.1% |  | +0.8% |
| `stiff_waveguide_new/69` | 3.49 ms | 0.1% |  | +0.2% |
| `stiff_waveguide_new/84` | 596.2 µs | 0.1% |  | +0.9% |
| `swarm_models/ants/200x120_500` | 189.7 µs | 0.3% |  | +1.6% |
| `swarm_models/physarum/512_100k` | 2.80 ms | 0.2% |  | +0.9% |
| `swarm_models/vicsek/4000` | 990.9 µs | 0.5% |  | +0.7% |
| `swarm_step/Brute/1000` | 453.5 µs | 0.3% | 2.2 Melem/s | +0.7% |
| `swarm_step/Brute/10000` | 43.99 ms | 0.3% | 227.3 Kelem/s | +1.1% |
| `swarm_step/Brute/300` | 43.2 µs | 0.2% | 7.0 Melem/s | -0.2% |
| `swarm_step/Brute/3000` | 3.97 ms | 0.2% | 755.4 Kelem/s | +0.9% |
| `swarm_step/Grid/1000` | 191.4 µs | 0.2% | 5.2 Melem/s | -14.4% |
| `swarm_step/Grid/10000` | 2.59 ms | 0.7% | 3.9 Melem/s | -41.7% |
| `swarm_step/Grid/100000` | 34.41 ms | 0.2% | 2.9 Melem/s | -37.7% |
| `swarm_step/Grid/300` | 56.9 µs | 0.2% | 5.3 Melem/s | +14.2% |
| `swarm_step/Grid/3000` | 680.5 µs | 0.3% | 4.4 Melem/s | -34.4% |
| `swarm_step/Sorted/1000` | 84.4 µs | 0.4% | 11.9 Melem/s | +1.2% |
| `swarm_step/Sorted/10000` | 1.07 ms | 0.6% | 9.4 Melem/s | +0.9% |
| `swarm_step/Sorted/100000` | 15.30 ms | 0.4% | 6.5 Melem/s | +1.0% |
| `swarm_step/Sorted/300` | 24.7 µs | 0.2% | 12.1 Melem/s | +1.6% |
| `swarm_step/Sorted/3000` | 284.2 µs | 0.3% | 10.6 Melem/s | +1.2% |
