# Benchmarks, 2026-11-19, macbook-air-5-native

- **Commit:** `2646727` (acoustic: every key's dispersion design tested, at both rates, against what limits it (with its room: 2 cents; room-limited: 3; one biquad for three partials: 12, a known gap) (#336))
- **Machine:** Darwin arm64, 10 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** native (`-C target-cpu=native`)
- **Run:** `cargo xtask bench --level native`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `macbook-air-5-native`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 435.3 µs | 0.6% |  | -1.9% |
| `barnes_hut_f32/theta_0.5/128` | 27.6 µs | 0.1% |  | +0.7% |
| `barnes_hut_f32/theta_0.5/4096` | 3.86 ms | 0.4% |  | +1.4% |
| `barnes_hut_f32/theta_1/1024` | 205.1 µs | 0.1% |  | -0.4% |
| `barnes_hut_f32/theta_1/128` | 17.6 µs | 0.1% |  | +1.1% |
| `barnes_hut_f32/theta_1/4096` | 1.60 ms | 0.3% |  | -2.3% |
| `barnes_hut_f64/theta_0.5/1024` | 436.3 µs | 0.2% |  | +0.0% |
| `barnes_hut_f64/theta_0.5/128` | 27.9 µs | 0.2% |  | +1.2% |
| `barnes_hut_f64/theta_0.5/4096` | 4.00 ms | 0.3% |  | +0.5% |
| `barnes_hut_f64/theta_1/1024` | 207.0 µs | 0.1% |  | -0.3% |
| `barnes_hut_f64/theta_1/128` | 17.7 µs | 0.1% |  | +1.3% |
| `barnes_hut_f64/theta_1/4096` | 1.78 ms | 1.2% |  | +5.8% |
| `bodyvec_f32/1024` | 259 ns | 1.2% |  | +3.4% |
| `bodyvec_f32/128` | 40 ns | 0.2% |  | +1.1% |
| `bodyvec_f32/16` | 11 ns | 0.5% |  | +3.4% |
| `bodyvec_f64/1024` | 550 ns | 1.2% |  | -1.2% |
| `bodyvec_f64/128` | 69 ns | 0.5% |  | +0.3% |
| `bodyvec_f64/16` | 23 ns | 0.2% |  | +0.2% |
| `broadphase_f64/1024` | 71.1 µs | 0.2% |  | +1.3% |
| `broadphase_f64/128` | 7.0 µs | 0.2% |  | +1.2% |
| `broadphase_f64/4096` | 326.9 µs | 0.1% |  | +1.3% |
| `fft_f32/1024` | 4.6 µs | 0.2% |  | +4.4% |
| `fft_f32/16384` | 98.9 µs | 0.2% |  | +0.9% |
| `fft_f32/4096` | 20.9 µs | 0.1% |  | +2.9% |
| `pairwise_f32/1024` | 272.8 µs | 0.1% |  | +1.0% |
| `pairwise_f32/128` | 5.6 µs | 0.2% |  | +1.0% |
| `pairwise_f32/16` | 148 ns | 0.1% |  | +1.1% |
| `pairwise_f32/4096` | 4.33 ms | 0.1% |  | +1.3% |
| `pairwise_f64/1024` | 498.6 µs | 0.1% |  | +1.0% |
| `pairwise_f64/128` | 8.4 µs | 0.2% |  | +1.4% |
| `pairwise_f64/16` | 167 ns | 0.2% |  | +1.0% |
| `pairwise_f64/4096` | 8.02 ms | 0.1% |  | +1.0% |
| `piano_16_voices_x3_strings/128` | 56.3 µs | 0.4% |  | +1.0% |
| `piano_design_88_keys` | 30.29 ms | 0.2% |  | +1.3% |
| `sand_step/busy/1920x1080_chunks` | 8.24 ms | 0.1% | 251.8 Melem/s | -43.8% |
| `sand_step/busy/1920x1080_full` | 8.23 ms | 0.4% | 251.9 Melem/s | -43.5% |
| `sand_step/busy/640x360_chunks` | 770.8 µs | 0.5% | 298.9 Melem/s | -49.7% |
| `sand_step/busy/640x360_full` | 776.9 µs | 0.3% | 296.6 Melem/s | -49.2% |
| `sand_step/settled/1920x1080_chunks` | 27.6 µs | 0.5% | 75.2 Gelem/s | -2.2% |
| `sand_step/settled/1920x1080_full` | 5.40 ms | 0.1% | 384.2 Melem/s | +2.5% |
| `sand_step/settled/640x360_chunks` | 3.1 µs | 0.3% | 73.4 Gelem/s | -6.0% |
| `sand_step/settled/640x360_full` | 597.7 µs | 0.1% | 385.5 Melem/s | +2.7% |
| `spectrum_f32/4096` | 26.3 µs | 0.1% |  | +1.5% |
| `step_f32_symplectic/1024` | 276.6 µs | 0.3% |  | +2.2% |
| `step_f32_symplectic/128` | 5.7 µs | 0.2% |  | +0.7% |
| `step_f32_symplectic/16` | 159 ns | 0.2% |  | +1.1% |
| `step_f32_verlet/1024` | 547.0 µs | 0.2% |  | +1.0% |
| `step_f32_verlet/128` | 11.6 µs | 0.2% |  | +1.6% |
| `step_f32_verlet/16` | 315 ns | 0.2% |  | +0.9% |
| `step_f64_symplectic/1024` | 497.7 µs | 0.1% |  | +0.6% |
| `step_f64_symplectic/128` | 8.5 µs | 0.2% |  | +1.5% |
| `step_f64_symplectic/16` | 183 ns | 0.2% |  | +1.1% |
| `step_f64_verlet/1024` | 998.7 µs | 0.2% |  | +0.9% |
| `step_f64_verlet/128` | 16.9 µs | 0.2% |  | +0.8% |
| `step_f64_verlet/16` | 358 ns | 0.1% |  | +0.5% |
| `stiff_waveguide_new/21` | 51.5 µs | 0.3% |  | +0.1% |
| `stiff_waveguide_new/36` | 508.9 µs | 0.3% |  | +1.6% |
| `stiff_waveguide_new/60` | 164.6 µs | 0.3% |  | +0.3% |
| `stiff_waveguide_new/69` | 3.54 ms | 0.2% |  | +1.4% |
| `stiff_waveguide_new/84` | 604.6 µs | 0.3% |  | +1.4% |
| `swarm_models/ants/200x120_500` | 187.6 µs | 0.0% |  | -1.1% |
| `swarm_models/physarum/512_100k` | 2.76 ms | 0.3% |  | -1.5% |
| `swarm_models/vicsek/4000` | 978.2 µs | 0.0% |  | -1.3% |
| `swarm_step/Brute/1000` | 451.2 µs | 0.2% | 2.2 Melem/s | -0.5% |
| `swarm_step/Brute/10000` | 43.96 ms | 0.2% | 227.5 Kelem/s | -0.1% |
| `swarm_step/Brute/300` | 43.6 µs | 0.3% | 6.9 Melem/s | +1.0% |
| `swarm_step/Brute/3000` | 3.98 ms | 0.3% | 754.1 Kelem/s | +0.2% |
| `swarm_step/Grid/1000` | 210.6 µs | 0.4% | 4.7 Melem/s | +10.0% |
| `swarm_step/Grid/10000` | 2.62 ms | 0.1% | 3.8 Melem/s | +0.9% |
| `swarm_step/Grid/100000` | 29.03 ms | 0.0% | 3.4 Melem/s | -15.6% |
| `swarm_step/Grid/300` | 93.8 µs | 0.2% | 3.2 Melem/s | +64.9% |
| `swarm_step/Grid/3000` | 687.4 µs | 0.0% | 4.4 Melem/s | +1.0% |
| `swarm_step/Sorted/1000` | 81.7 µs | 0.6% | 12.2 Melem/s | -3.1% |
| `swarm_step/Sorted/10000` | 952.6 µs | 0.2% | 10.5 Melem/s | -10.6% |
| `swarm_step/Sorted/100000` | 10.39 ms | 0.0% | 9.6 Melem/s | -32.1% |
| `swarm_step/Sorted/300` | 32.4 µs | 0.1% | 9.3 Melem/s | +30.8% |
| `swarm_step/Sorted/3000` | 262.8 µs | 0.1% | 11.4 Melem/s | -7.5% |
