# Benchmarks, 2026-11-17, macbook-air-5

- **Commit:** `8e2e7a25` (swarm: the grid's candidates through a branchless scalar add (Seen::add_masked; Grid −37% at 100k on the M4, −35% in V8); sorted's leftovers keep the branching add (the masked one was 20% slower at 1k in V8) (#320))
- **Machine:** Darwin arm64, 10 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** baseline (the target's default: no `target-cpu`)
- **Run:** `cargo xtask bench`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `macbook-air-5`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 433.5 µs | 0.2% |  | -0.1% |
| `barnes_hut_f32/theta_0.5/128` | 27.5 µs | 0.1% |  | -1.6% |
| `barnes_hut_f32/theta_0.5/4096` | 3.82 ms | 0.3% |  | -0.4% |
| `barnes_hut_f32/theta_1/1024` | 210.4 µs | 0.7% |  | +1.4% |
| `barnes_hut_f32/theta_1/128` | 17.4 µs | 0.2% |  | -1.3% |
| `barnes_hut_f32/theta_1/4096` | 1.64 ms | 0.3% |  | +1.8% |
| `barnes_hut_f64/theta_0.5/1024` | 435.8 µs | 0.3% |  | +0.3% |
| `barnes_hut_f64/theta_0.5/128` | 27.7 µs | 0.4% |  | -0.6% |
| `barnes_hut_f64/theta_0.5/4096` | 3.94 ms | 0.3% |  | -1.5% |
| `barnes_hut_f64/theta_1/1024` | 207.7 µs | 0.1% |  | -0.7% |
| `barnes_hut_f64/theta_1/128` | 17.5 µs | 0.1% |  | -0.4% |
| `barnes_hut_f64/theta_1/4096` | 1.67 ms | 0.4% |  | +0.3% |
| `bodyvec_f32/1024` | 250 ns | 0.7% |  | -1.6% |
| `bodyvec_f32/128` | 40 ns | 0.1% |  | -0.6% |
| `bodyvec_f32/16` | 11 ns | 0.2% |  | -1.0% |
| `bodyvec_f64/1024` | 540 ns | 1.5% |  | -0.8% |
| `bodyvec_f64/128` | 70 ns | 0.8% |  | -0.1% |
| `bodyvec_f64/16` | 23 ns | 0.1% |  | -0.9% |
| `broadphase_f64/1024` | 70.2 µs | 0.1% |  | -0.4% |
| `broadphase_f64/128` | 6.9 µs | 0.1% |  | -2.4% |
| `broadphase_f64/4096` | 324.7 µs | 0.7% |  | -0.6% |
| `fft_f32/1024` | 4.4 µs | 0.1% |  | -3.0% |
| `fft_f32/16384` | 97.8 µs | 0.1% |  | -1.4% |
| `fft_f32/4096` | 20.3 µs | 0.1% |  | -1.0% |
| `pairwise_f32/1024` | 269.6 µs | 0.1% |  | -1.0% |
| `pairwise_f32/128` | 5.6 µs | 0.2% |  | -1.3% |
| `pairwise_f32/16` | 147 ns | 0.1% |  | -1.3% |
| `pairwise_f32/4096` | 4.27 ms | 0.0% |  | -2.1% |
| `pairwise_f64/1024` | 494.0 µs | 0.1% |  | -1.8% |
| `pairwise_f64/128` | 8.3 µs | 0.1% |  | -3.8% |
| `pairwise_f64/16` | 166 ns | 0.1% |  | -3.3% |
| `pairwise_f64/4096` | 8.01 ms | 0.0% |  | -0.9% |
| `piano_16_voices_x3_strings/128` | 50.8 µs | 0.2% |  | -0.4% |
| `piano_design_88_keys` | 29.85 ms | 0.5% |  | -1.9% |
| `sand_step/busy/1920x1080_chunks` | 14.65 ms | 0.1% | 141.5 Melem/s | -0.3% |
| `sand_step/busy/1920x1080_full` | 14.56 ms | 0.1% | 142.4 Melem/s | -0.4% |
| `sand_step/busy/640x360_chunks` | 1.52 ms | 0.1% | 151.8 Melem/s | -1.1% |
| `sand_step/busy/640x360_full` | 1.53 ms | 0.2% | 150.9 Melem/s | -0.0% |
| `sand_step/settled/1920x1080_chunks` | 28.2 µs | 0.5% | 73.6 Gelem/s | +0.5% |
| `sand_step/settled/1920x1080_full` | 5.25 ms | 0.1% | 395.2 Melem/s | -2.7% |
| `sand_step/settled/640x360_chunks` | 3.3 µs | 0.3% | 69.5 Gelem/s | -0.8% |
| `sand_step/settled/640x360_full` | 582.0 µs | 0.1% | 395.9 Melem/s | -0.8% |
| `spectrum_f32/4096` | 25.8 µs | 0.1% |  | -1.3% |
| `step_f32_symplectic/1024` | 270.2 µs | 0.1% |  | -2.0% |
| `step_f32_symplectic/128` | 5.7 µs | 0.1% |  | -1.2% |
| `step_f32_symplectic/16` | 157 ns | 0.1% |  | -0.9% |
| `step_f32_verlet/1024` | 540.7 µs | 0.0% |  | -0.7% |
| `step_f32_verlet/128` | 11.4 µs | 0.1% |  | -1.0% |
| `step_f32_verlet/16` | 312 ns | 0.1% |  | -1.2% |
| `step_f64_symplectic/1024` | 494.6 µs | 0.1% |  | -0.5% |
| `step_f64_symplectic/128` | 8.4 µs | 0.1% |  | -0.8% |
| `step_f64_symplectic/16` | 179 ns | 0.1% |  | -1.2% |
| `step_f64_verlet/1024` | 990.0 µs | 0.1% |  | -0.9% |
| `step_f64_verlet/128` | 16.7 µs | 0.1% |  | -0.7% |
| `step_f64_verlet/16` | 355 ns | 0.1% |  | -0.1% |
| `stiff_waveguide_new/21` | 51.2 µs | 0.1% |  | +0.1% |
| `stiff_waveguide_new/36` | 502.8 µs | 0.1% |  | +0.1% |
| `stiff_waveguide_new/60` | 164.8 µs | 0.1% |  | -0.9% |
| `stiff_waveguide_new/69` | 3.49 ms | 0.1% |  | -0.7% |
| `stiff_waveguide_new/84` | 590.1 µs | 0.1% |  | +0.0% |
| `swarm_models/ants/200x120_500` | 186.5 µs | 0.1% |  | -1.2% |
| `swarm_models/physarum/512_100k` | 2.76 ms | 0.6% |  | -2.6% |
| `swarm_models/vicsek/4000` | 975.3 µs | 0.0% |  | -0.8% |
| `swarm_step/Brute/1000` | 450.5 µs | 0.0% | 2.2 Melem/s | -2.2% |
| `swarm_step/Brute/10000` | 43.53 ms | 0.0% | 229.7 Kelem/s | -1.2% |
| `swarm_step/Brute/300` | 43.3 µs | 0.1% | 6.9 Melem/s | -0.6% |
| `swarm_step/Brute/3000` | 3.93 ms | 0.0% | 762.9 Kelem/s | -0.6% |
| `swarm_step/Grid/1000` | 190.7 µs | 0.1% | 5.2 Melem/s | +0.1% |
| `swarm_step/Grid/10000` | 2.56 ms | 0.1% | 3.9 Melem/s | -43.3% |
| `swarm_step/Grid/100000` | 34.09 ms | 0.1% | 2.9 Melem/s | -38.9% |
| `swarm_step/Grid/300` | 56.2 µs | 0.1% | 5.3 Melem/s | +17.8% |
| `swarm_step/Grid/3000` | 682.8 µs | 0.2% | 4.4 Melem/s | -30.7% |
| `swarm_step/Sorted/1000` | 83.3 µs | 0.1% | 12.0 Melem/s | -0.9% |
| `swarm_step/Sorted/10000` | 1.05 ms | 0.1% | 9.5 Melem/s | -1.8% |
| `swarm_step/Sorted/100000` | 15.13 ms | 0.1% | 6.6 Melem/s | -0.9% |
| `swarm_step/Sorted/300` | 24.4 µs | 0.0% | 12.3 Melem/s | -1.3% |
| `swarm_step/Sorted/3000` | 280.7 µs | 0.2% | 10.7 Melem/s | -1.0% |
