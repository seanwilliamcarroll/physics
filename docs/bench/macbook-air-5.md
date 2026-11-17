# Benchmarks, 2026-11-17, macbook-air-5

- **Commit:** `ac137491` (xtask bench --record: the pull request leads with what moved past the threshold against the previous record, every level, slower first (#311))
- **Machine:** Darwin arm64, 10 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** baseline (the target's default: no `target-cpu`)
- **Run:** `cargo xtask bench`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `macbook-air-5`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 433.7 µs | 0.2% |  | -1.5% |
| `barnes_hut_f32/theta_0.5/128` | 28.0 µs | 0.2% |  | +1.2% |
| `barnes_hut_f32/theta_0.5/4096` | 3.83 ms | 0.4% |  | -0.6% |
| `barnes_hut_f32/theta_1/1024` | 207.4 µs | 0.2% |  | -2.7% |
| `barnes_hut_f32/theta_1/128` | 17.7 µs | 0.1% |  | +1.0% |
| `barnes_hut_f32/theta_1/4096` | 1.61 ms | 0.6% |  | -4.3% |
| `barnes_hut_f64/theta_0.5/1024` | 434.4 µs | 0.1% |  | +0.0% |
| `barnes_hut_f64/theta_0.5/128` | 27.9 µs | 0.4% |  | +1.0% |
| `barnes_hut_f64/theta_0.5/4096` | 4.00 ms | 0.4% |  | +0.7% |
| `barnes_hut_f64/theta_1/1024` | 209.1 µs | 0.2% |  | +1.1% |
| `barnes_hut_f64/theta_1/128` | 17.6 µs | 0.1% |  | +0.3% |
| `barnes_hut_f64/theta_1/4096` | 1.67 ms | 0.5% |  | -4.7% |
| `bodyvec_f32/1024` | 254 ns | 0.5% |  | -0.9% |
| `bodyvec_f32/128` | 40 ns | 0.2% |  | -9.1% |
| `bodyvec_f32/16` | 11 ns | 0.2% |  | -19.2% |
| `bodyvec_f64/1024` | 544 ns | 1.2% |  | -6.5% |
| `bodyvec_f64/128` | 70 ns | 0.2% |  | -5.5% |
| `bodyvec_f64/16` | 23 ns | 0.1% |  | -14.7% |
| `broadphase_f64/1024` | 70.5 µs | 0.1% |  | +0.6% |
| `broadphase_f64/128` | 7.0 µs | 0.4% |  | +2.1% |
| `broadphase_f64/4096` | 326.8 µs | 0.2% |  | +1.3% |
| `fft_f32/1024` | 4.5 µs | 0.7% |  | +2.5% |
| `fft_f32/16384` | 99.2 µs | 0.2% |  | +1.4% |
| `fft_f32/4096` | 20.5 µs | 0.1% |  | +1.0% |
| `pairwise_f32/1024` | 272.3 µs | 0.1% |  | +0.8% |
| `pairwise_f32/128` | 5.7 µs | 0.2% |  | +1.3% |
| `pairwise_f32/16` | 149 ns | 0.2% |  | +1.2% |
| `pairwise_f32/4096` | 4.36 ms | 0.1% |  | +1.8% |
| `pairwise_f64/1024` | 502.8 µs | 0.2% |  | -4.1% |
| `pairwise_f64/128` | 8.6 µs | 0.4% |  | -10.5% |
| `pairwise_f64/16` | 171 ns | 0.2% |  | +3.8% |
| `pairwise_f64/4096` | 8.08 ms | 0.1% |  | -4.2% |
| `piano_16_voices_x3_strings/128` | 51.0 µs | 0.2% |  | +0.4% |
| `piano_design_88_keys` | 30.44 ms | 0.5% |  | -82.6% |
| `sand_step/busy/1920x1080_chunks` | 14.70 ms | 0.1% | 141.1 Melem/s | +0.6% |
| `sand_step/busy/1920x1080_full` | 14.62 ms | 0.1% | 141.8 Melem/s | +0.9% |
| `sand_step/busy/640x360_chunks` | 1.53 ms | 0.3% | 150.1 Melem/s | +1.0% |
| `sand_step/busy/640x360_full` | 1.53 ms | 0.1% | 150.8 Melem/s | +0.6% |
| `sand_step/settled/1920x1080_chunks` | 28.0 µs | 0.5% | 74.0 Gelem/s | +0.6% |
| `sand_step/settled/1920x1080_full` | 5.39 ms | 0.6% | 384.4 Melem/s | +2.6% |
| `sand_step/settled/640x360_chunks` | 3.3 µs | 0.3% | 69.0 Gelem/s | +0.4% |
| `sand_step/settled/640x360_full` | 586.9 µs | 0.1% | 392.6 Melem/s | +0.8% |
| `spectrum_f32/4096` | 26.2 µs | 0.2% |  | +1.0% |
| `step_f32_symplectic/1024` | 275.7 µs | 0.1% |  | +1.8% |
| `step_f32_symplectic/128` | 5.8 µs | 0.2% |  | +1.1% |
| `step_f32_symplectic/16` | 158 ns | 0.1% |  | -1.9% |
| `step_f32_verlet/1024` | 544.3 µs | 0.1% |  | -0.1% |
| `step_f32_verlet/128` | 11.5 µs | 0.1% |  | +0.8% |
| `step_f32_verlet/16` | 315 ns | 0.1% |  | -0.8% |
| `step_f64_symplectic/1024` | 497.3 µs | 0.1% |  | -6.1% |
| `step_f64_symplectic/128` | 8.4 µs | 0.1% |  | -13.0% |
| `step_f64_symplectic/16` | 181 ns | 0.1% |  | +1.8% |
| `step_f64_verlet/1024` | 999.3 µs | 0.1% |  | -5.3% |
| `step_f64_verlet/128` | 16.9 µs | 0.1% |  | -13.0% |
| `step_f64_verlet/16` | 355 ns | 0.1% |  | +0.2% |
| `stiff_waveguide_new/21` | 51.1 µs | 0.4% |  | -96.1% |
| `stiff_waveguide_new/36` | 502.3 µs | 0.4% |  | -77.5% |
| `stiff_waveguide_new/60` | 166.3 µs | 0.4% |  | -90.7% |
| `stiff_waveguide_new/69` | 3.51 ms | 0.3% |  | -87.2% |
| `stiff_waveguide_new/84` | 590.0 µs | 0.3% |  | -78.7% |
| `swarm_models/ants/200x120_500` | 191.4 µs | 0.6% |  | +1.0% |
| `swarm_models/physarum/512_100k` | 2.60 ms | 0.6% |  | -0.2% |
| `swarm_models/vicsek/4000` | 1.10 ms | 7.6% |  | +1.1% |
| `swarm_step/Brute/1000` | 453.6 µs | 0.4% | 2.2 Melem/s | -14.3% |
| `swarm_step/Brute/10000` | 44.14 ms | 0.3% | 226.6 Kelem/s | -14.8% |
| `swarm_step/Brute/300` | 45.4 µs | 0.2% | 6.6 Melem/s | -12.1% |
| `swarm_step/Brute/3000` | 3.97 ms | 0.1% | 755.0 Kelem/s | -14.7% |
| `swarm_step/Grid/1000` | 598.2 µs | 3.7% | 1.7 Melem/s | +0.7% |
| `swarm_step/Grid/10000` | 6.43 ms | 9.2% | 1.6 Melem/s | +2.6% |
| `swarm_step/Grid/100000` | 43.06 ms | 1.4% | 2.3 Melem/s | +1.8% |
| `swarm_step/Grid/300` | 138.1 µs | 0.4% | 2.2 Melem/s | +3.8% |
| `swarm_step/Grid/3000` | 1.69 ms | 9.0% | 1.8 Melem/s | +0.5% |
| `swarm_step/Sorted/1000` | 123.8 µs | 4.2% | 8.1 Melem/s | -6.5% |
| `swarm_step/Sorted/10000` | 1.42 ms | 7.3% | 7.0 Melem/s | -9.0% |
| `swarm_step/Sorted/100000` | 12.50 ms | 3.6% | 8.0 Melem/s | -6.3% |
| `swarm_step/Sorted/300` | 36.3 µs | 3.0% | 8.3 Melem/s | -6.0% |
| `swarm_step/Sorted/3000` | 394.2 µs | 4.0% | 7.6 Melem/s | -7.6% |
