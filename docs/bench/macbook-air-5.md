# Benchmarks, 2026-11-17, macbook-air-5

- **Commit:** `ceb90645` (swarm bench: every case steps the same warmed state (a clone per iteration, untimed), not one model on and on (a moving target: ±9-16% where everything else was ±1%; now ±0.1%); developed warm-ups (flocks 1,000 steps, Vicsek 3,000, ants 1,000, Physarum 300) (#315))
- **Machine:** Darwin arm64, 10 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** baseline (the target's default: no `target-cpu`)
- **Run:** `cargo xtask bench swarm_`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `macbook-air-5`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 433.7 µs | 0.2% |  |  |
| `barnes_hut_f32/theta_0.5/128` | 28.0 µs | 0.2% |  |  |
| `barnes_hut_f32/theta_0.5/4096` | 3.83 ms | 0.4% |  |  |
| `barnes_hut_f32/theta_1/1024` | 207.4 µs | 0.2% |  |  |
| `barnes_hut_f32/theta_1/128` | 17.7 µs | 0.1% |  |  |
| `barnes_hut_f32/theta_1/4096` | 1.61 ms | 0.6% |  |  |
| `barnes_hut_f64/theta_0.5/1024` | 434.4 µs | 0.1% |  |  |
| `barnes_hut_f64/theta_0.5/128` | 27.9 µs | 0.4% |  |  |
| `barnes_hut_f64/theta_0.5/4096` | 4.00 ms | 0.4% |  |  |
| `barnes_hut_f64/theta_1/1024` | 209.1 µs | 0.2% |  |  |
| `barnes_hut_f64/theta_1/128` | 17.6 µs | 0.1% |  |  |
| `barnes_hut_f64/theta_1/4096` | 1.67 ms | 0.5% |  |  |
| `bodyvec_f32/1024` | 254 ns | 0.5% |  |  |
| `bodyvec_f32/128` | 40 ns | 0.2% |  |  |
| `bodyvec_f32/16` | 11 ns | 0.2% |  |  |
| `bodyvec_f64/1024` | 544 ns | 1.2% |  |  |
| `bodyvec_f64/128` | 70 ns | 0.2% |  |  |
| `bodyvec_f64/16` | 23 ns | 0.1% |  |  |
| `broadphase_f64/1024` | 70.5 µs | 0.1% |  |  |
| `broadphase_f64/128` | 7.0 µs | 0.4% |  |  |
| `broadphase_f64/4096` | 326.8 µs | 0.2% |  |  |
| `fft_f32/1024` | 4.5 µs | 0.7% |  |  |
| `fft_f32/16384` | 99.2 µs | 0.2% |  |  |
| `fft_f32/4096` | 20.5 µs | 0.1% |  |  |
| `pairwise_f32/1024` | 272.3 µs | 0.1% |  |  |
| `pairwise_f32/128` | 5.7 µs | 0.2% |  |  |
| `pairwise_f32/16` | 149 ns | 0.2% |  |  |
| `pairwise_f32/4096` | 4.36 ms | 0.1% |  |  |
| `pairwise_f64/1024` | 502.8 µs | 0.2% |  |  |
| `pairwise_f64/128` | 8.6 µs | 0.4% |  |  |
| `pairwise_f64/16` | 171 ns | 0.2% |  |  |
| `pairwise_f64/4096` | 8.08 ms | 0.1% |  |  |
| `piano_16_voices_x3_strings/128` | 51.0 µs | 0.2% |  |  |
| `piano_design_88_keys` | 30.44 ms | 0.5% |  |  |
| `sand_step/busy/1920x1080_chunks` | 14.70 ms | 0.1% | 141.1 Melem/s |  |
| `sand_step/busy/1920x1080_full` | 14.62 ms | 0.1% | 141.8 Melem/s |  |
| `sand_step/busy/640x360_chunks` | 1.53 ms | 0.3% | 150.1 Melem/s |  |
| `sand_step/busy/640x360_full` | 1.53 ms | 0.1% | 150.8 Melem/s |  |
| `sand_step/settled/1920x1080_chunks` | 28.0 µs | 0.5% | 74.0 Gelem/s |  |
| `sand_step/settled/1920x1080_full` | 5.39 ms | 0.6% | 384.4 Melem/s |  |
| `sand_step/settled/640x360_chunks` | 3.3 µs | 0.3% | 69.0 Gelem/s |  |
| `sand_step/settled/640x360_full` | 586.9 µs | 0.1% | 392.6 Melem/s |  |
| `spectrum_f32/4096` | 26.2 µs | 0.2% |  |  |
| `step_f32_symplectic/1024` | 275.7 µs | 0.1% |  |  |
| `step_f32_symplectic/128` | 5.8 µs | 0.2% |  |  |
| `step_f32_symplectic/16` | 158 ns | 0.1% |  |  |
| `step_f32_verlet/1024` | 544.3 µs | 0.1% |  |  |
| `step_f32_verlet/128` | 11.5 µs | 0.1% |  |  |
| `step_f32_verlet/16` | 315 ns | 0.1% |  |  |
| `step_f64_symplectic/1024` | 497.3 µs | 0.1% |  |  |
| `step_f64_symplectic/128` | 8.4 µs | 0.1% |  |  |
| `step_f64_symplectic/16` | 181 ns | 0.1% |  |  |
| `step_f64_verlet/1024` | 999.3 µs | 0.1% |  |  |
| `step_f64_verlet/128` | 16.9 µs | 0.1% |  |  |
| `step_f64_verlet/16` | 355 ns | 0.1% |  |  |
| `stiff_waveguide_new/21` | 51.1 µs | 0.4% |  |  |
| `stiff_waveguide_new/36` | 502.3 µs | 0.4% |  |  |
| `stiff_waveguide_new/60` | 166.3 µs | 0.4% |  |  |
| `stiff_waveguide_new/69` | 3.51 ms | 0.3% |  |  |
| `stiff_waveguide_new/84` | 590.0 µs | 0.3% |  |  |
| `swarm_models/ants/200x120_500` | 188.7 µs | 0.2% |  | -1.4% |
| `swarm_models/physarum/512_100k` | 2.84 ms | 0.2% |  | +9.3% |
| `swarm_models/vicsek/4000` | 983.4 µs | 0.2% |  | -10.8% |
| `swarm_step/Brute/1000` | 460.7 µs | 1.0% | 2.2 Melem/s | +1.6% |
| `swarm_step/Brute/10000` | 44.08 ms | 0.4% | 226.9 Kelem/s | -0.1% |
| `swarm_step/Brute/300` | 43.5 µs | 0.3% | 6.9 Melem/s | -4.1% |
| `swarm_step/Brute/3000` | 3.96 ms | 0.4% | 758.3 Kelem/s | -0.4% |
| `swarm_step/Grid/1000` | 190.5 µs | 1.2% | 5.2 Melem/s | -68.1% |
| `swarm_step/Grid/10000` | 4.51 ms | 0.3% | 2.2 Melem/s | -29.9% |
| `swarm_step/Grid/100000` | 55.77 ms | 0.3% | 1.8 Melem/s | +29.5% |
| `swarm_step/Grid/300` | 47.7 µs | 0.2% | 6.3 Melem/s | -65.5% |
| `swarm_step/Grid/3000` | 985.7 µs | 1.1% | 3.0 Melem/s | -41.6% |
| `swarm_step/Sorted/1000` | 84.1 µs | 0.2% | 11.9 Melem/s | -32.1% |
| `swarm_step/Sorted/10000` | 1.07 ms | 0.3% | 9.4 Melem/s | -25.1% |
| `swarm_step/Sorted/100000` | 15.27 ms | 0.2% | 6.6 Melem/s | +22.2% |
| `swarm_step/Sorted/300` | 24.7 µs | 0.4% | 12.1 Melem/s | -31.8% |
| `swarm_step/Sorted/3000` | 283.5 µs | 0.3% | 10.6 Melem/s | -28.1% |
