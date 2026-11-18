# Benchmarks, 2026-11-17, macbook-air-5-native

- **Commit:** `ceb90645` (swarm bench: every case steps the same warmed state (a clone per iteration, untimed), not one model on and on (a moving target: ±9-16% where everything else was ±1%; now ±0.1%); developed warm-ups (flocks 1,000 steps, Vicsek 3,000, ants 1,000, Physarum 300) (#315))
- **Machine:** Darwin arm64, 10 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** native (`-C target-cpu=native`)
- **Run:** `cargo xtask bench --level native`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from each benchmark's previous run. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 435.5 µs | 0.2% |  |  |
| `barnes_hut_f32/theta_0.5/128` | 27.4 µs | 0.1% |  |  |
| `barnes_hut_f32/theta_0.5/4096` | 3.84 ms | 0.3% |  |  |
| `barnes_hut_f32/theta_1/1024` | 206.0 µs | 0.1% |  |  |
| `barnes_hut_f32/theta_1/128` | 17.4 µs | 0.1% |  |  |
| `barnes_hut_f32/theta_1/4096` | 1.64 ms | 0.3% |  |  |
| `barnes_hut_f64/theta_0.5/1024` | 445.7 µs | 0.5% |  |  |
| `barnes_hut_f64/theta_0.5/128` | 27.6 µs | 0.1% |  |  |
| `barnes_hut_f64/theta_0.5/4096` | 3.97 ms | 0.4% |  |  |
| `barnes_hut_f64/theta_1/1024` | 207.8 µs | 0.1% |  |  |
| `barnes_hut_f64/theta_1/128` | 17.5 µs | 0.1% |  |  |
| `barnes_hut_f64/theta_1/4096` | 1.66 ms | 0.3% |  |  |
| `bodyvec_f32/1024` | 254 ns | 1.0% |  |  |
| `bodyvec_f32/128` | 39 ns | 0.1% |  |  |
| `bodyvec_f32/16` | 11 ns | 0.2% |  |  |
| `bodyvec_f64/1024` | 554 ns | 1.5% |  |  |
| `bodyvec_f64/128` | 69 ns | 0.2% |  |  |
| `bodyvec_f64/16` | 23 ns | 0.2% |  |  |
| `broadphase_f64/1024` | 69.8 µs | 0.1% |  |  |
| `broadphase_f64/128` | 6.9 µs | 0.1% |  |  |
| `broadphase_f64/4096` | 321.8 µs | 0.1% |  |  |
| `fft_f32/1024` | 4.4 µs | 0.1% |  |  |
| `fft_f32/16384` | 98.0 µs | 0.1% |  |  |
| `fft_f32/4096` | 20.2 µs | 0.1% |  |  |
| `pairwise_f32/1024` | 269.7 µs | 0.1% |  |  |
| `pairwise_f32/128` | 5.6 µs | 0.1% |  |  |
| `pairwise_f32/16` | 147 ns | 0.1% |  |  |
| `pairwise_f32/4096` | 4.28 ms | 0.0% |  |  |
| `pairwise_f64/1024` | 493.4 µs | 0.1% |  |  |
| `pairwise_f64/128` | 8.3 µs | 0.1% |  |  |
| `pairwise_f64/16` | 165 ns | 0.1% |  |  |
| `pairwise_f64/4096` | 7.99 ms | 0.1% |  |  |
| `piano_16_voices_x3_strings/128` | 55.7 µs | 0.0% |  |  |
| `piano_design_88_keys` | 29.98 ms | 0.1% |  |  |
| `sand_step/busy/1920x1080_chunks` | 14.66 ms | 0.1% | 141.5 Melem/s |  |
| `sand_step/busy/1920x1080_full` | 14.53 ms | 0.1% | 142.7 Melem/s |  |
| `sand_step/busy/640x360_chunks` | 1.54 ms | 0.1% | 149.8 Melem/s |  |
| `sand_step/busy/640x360_full` | 1.53 ms | 0.1% | 150.5 Melem/s |  |
| `sand_step/settled/1920x1080_chunks` | 28.2 µs | 0.4% | 73.4 Gelem/s |  |
| `sand_step/settled/1920x1080_full` | 5.27 ms | 0.1% | 393.3 Melem/s |  |
| `sand_step/settled/640x360_chunks` | 3.3 µs | 0.3% | 69.4 Gelem/s |  |
| `sand_step/settled/640x360_full` | 582.1 µs | 0.0% | 395.8 Melem/s |  |
| `spectrum_f32/4096` | 25.9 µs | 0.1% |  |  |
| `step_f32_symplectic/1024` | 270.6 µs | 0.1% |  |  |
| `step_f32_symplectic/128` | 5.7 µs | 0.1% |  |  |
| `step_f32_symplectic/16` | 157 ns | 0.1% |  |  |
| `step_f32_verlet/1024` | 540.6 µs | 0.1% |  |  |
| `step_f32_verlet/128` | 11.4 µs | 0.1% |  |  |
| `step_f32_verlet/16` | 312 ns | 0.1% |  |  |
| `step_f64_symplectic/1024` | 494.4 µs | 0.1% |  |  |
| `step_f64_symplectic/128` | 8.4 µs | 0.1% |  |  |
| `step_f64_symplectic/16` | 181 ns | 0.1% |  |  |
| `step_f64_verlet/1024` | 989.0 µs | 0.0% |  |  |
| `step_f64_verlet/128` | 16.8 µs | 0.1% |  |  |
| `step_f64_verlet/16` | 355 ns | 0.1% |  |  |
| `stiff_waveguide_new/21` | 51.2 µs | 0.1% |  |  |
| `stiff_waveguide_new/36` | 501.2 µs | 0.2% |  |  |
| `stiff_waveguide_new/60` | 162.9 µs | 0.2% |  |  |
| `stiff_waveguide_new/69` | 3.48 ms | 0.1% |  |  |
| `stiff_waveguide_new/84` | 590.9 µs | 0.1% |  |  |
| `swarm_models/ants/200x120_500` | 186.7 µs | 0.0% |  | -0.6% |
| `swarm_models/physarum/512_100k` | 2.77 ms | 0.3% |  | +0.3% |
| `swarm_models/vicsek/4000` | 984.3 µs | 0.1% |  | +0.1% |
| `swarm_step/Brute/1000` | 450.6 µs | 0.1% | 2.2 Melem/s | -1.0% |
| `swarm_step/Brute/10000` | 43.53 ms | 0.0% | 229.7 Kelem/s | -1.2% |
| `swarm_step/Brute/300` | 43.2 µs | 0.1% | 6.9 Melem/s | -0.7% |
| `swarm_step/Brute/3000` | 3.93 ms | 0.1% | 762.5 Kelem/s | -1.3% |
| `swarm_step/Grid/1000` | 223.7 µs | 0.2% | 4.5 Melem/s | -1.0% |
| `swarm_step/Grid/10000` | 4.45 ms | 0.0% | 2.2 Melem/s | -1.5% |
| `swarm_step/Grid/100000` | 55.24 ms | 0.0% | 1.8 Melem/s | -2.5% |
| `swarm_step/Grid/300` | 49.8 µs | 0.2% | 6.0 Melem/s | +0.1% |
| `swarm_step/Grid/3000` | 1.04 ms | 0.0% | 2.9 Melem/s | +1.6% |
| `swarm_step/Sorted/1000` | 83.4 µs | 0.1% | 12.0 Melem/s | -1.2% |
| `swarm_step/Sorted/10000` | 1.06 ms | 0.4% | 9.5 Melem/s | +0.3% |
| `swarm_step/Sorted/100000` | 15.15 ms | 0.0% | 6.6 Melem/s | -0.9% |
| `swarm_step/Sorted/300` | 24.3 µs | 0.1% | 12.3 Melem/s | -1.7% |
| `swarm_step/Sorted/3000` | 280.8 µs | 0.0% | 10.7 Melem/s | -0.8% |
