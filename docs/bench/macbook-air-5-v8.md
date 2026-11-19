# Benchmarks, 2026-11-19, macbook-air-5-v8

- **Commit:** `2646727` (acoustic: every key's dispersion design tested, at both rates, against what limits it (with its room: 2 cents; room-limited: 3; one biquad for three partials: 12, a known gap) (#336))
- **Machine:** Darwin arm64, 10 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** v8 (wasm32-wasip1 with `simd128`, in Node)
- **Run:** `cargo xtask bench --level v8`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `macbook-air-5-v8`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 607.7 µs | 0.1% |  | -0.1% |
| `barnes_hut_f32/theta_0.5/128` | 42.9 µs | 0.1% |  | -0.2% |
| `barnes_hut_f32/theta_0.5/4096` | 4.41 ms | 0.3% |  | -0.0% |
| `barnes_hut_f32/theta_1/1024` | 320.4 µs | 0.1% |  | -0.4% |
| `barnes_hut_f32/theta_1/128` | 30.9 µs | 0.1% |  | -0.2% |
| `barnes_hut_f32/theta_1/4096` | 2.10 ms | 0.4% |  | +1.1% |
| `barnes_hut_f64/theta_0.5/1024` | 621.0 µs | 0.2% |  | -3.5% |
| `barnes_hut_f64/theta_0.5/128` | 43.5 µs | 0.1% |  | -0.3% |
| `barnes_hut_f64/theta_0.5/4096` | 4.72 ms | 0.3% |  | +0.3% |
| `barnes_hut_f64/theta_1/1024` | 327.8 µs | 0.2% |  | +0.4% |
| `barnes_hut_f64/theta_1/128` | 31.3 µs | 0.1% |  | +0.1% |
| `barnes_hut_f64/theta_1/4096` | 2.19 ms | 0.3% |  | +0.4% |
| `bodyvec_f32/1024` | 573 ns | 0.1% |  | +0.0% |
| `bodyvec_f32/128` | 75 ns | 0.9% |  | -5.3% |
| `bodyvec_f32/16` | 17 ns | 0.5% |  | -4.1% |
| `bodyvec_f64/1024` | 688 ns | 0.1% |  | +0.1% |
| `bodyvec_f64/128` | 86 ns | 1.4% |  | -4.5% |
| `bodyvec_f64/16` | 22 ns | 1.3% |  | -4.5% |
| `broadphase_f64/1024` | 79.5 µs | 0.1% |  | +0.1% |
| `broadphase_f64/128` | 7.9 µs | 0.1% |  | +0.2% |
| `broadphase_f64/4096` | 360.5 µs | 0.1% |  | +0.1% |
| `fft_f32/1024` | 5.1 µs | 0.1% |  | -1.4% |
| `fft_f32/16384` | 111.8 µs | 0.1% |  | -0.5% |
| `fft_f32/4096` | 23.8 µs | 0.1% |  | -0.3% |
| `pairwise_f32/1024` | 268.4 µs | 0.1% |  | -0.1% |
| `pairwise_f32/128` | 6.2 µs | 0.1% |  | +0.2% |
| `pairwise_f32/16` | 219 ns | 0.4% |  | -0.1% |
| `pairwise_f32/4096` | 4.14 ms | 0.0% |  | +0.0% |
| `pairwise_f64/1024` | 439.1 µs | 0.1% |  | -1.1% |
| `pairwise_f64/128` | 7.9 µs | 0.1% |  | +0.1% |
| `pairwise_f64/16` | 197 ns | 0.1% |  | -2.1% |
| `pairwise_f64/4096` | 7.04 ms | 0.1% |  | -0.0% |
| `piano_16_voices_x3_strings/128` | 83.5 µs | 0.1% |  | +0.2% |
| `piano_design_88_keys` | 39.34 ms | 0.2% |  | +0.2% |
| `sand_step/busy/1920x1080_chunks` | 11.14 ms | 0.1% | 186.2 Melem/s | -37.0% |
| `sand_step/busy/1920x1080_full` | 11.11 ms | 0.2% | 186.6 Melem/s | -36.7% |
| `sand_step/busy/640x360_chunks` | 1.22 ms | 0.4% | 189.4 Melem/s | -36.4% |
| `sand_step/busy/640x360_full` | 1.21 ms | 0.1% | 189.8 Melem/s | -36.2% |
| `sand_step/settled/1920x1080_chunks` | 30.7 µs | 0.4% | 67.6 Gelem/s | +0.4% |
| `sand_step/settled/1920x1080_full` | 6.30 ms | 0.1% | 329.1 Melem/s | -21.4% |
| `sand_step/settled/640x360_chunks` | 3.6 µs | 0.3% | 64.2 Gelem/s | +0.1% |
| `sand_step/settled/640x360_full` | 697.8 µs | 0.0% | 330.2 Melem/s | -20.1% |
| `spectrum_f32/4096` | 30.1 µs | 0.1% |  | -0.6% |
| `step_f32_symplectic/1024` | 276.3 µs | 0.2% |  | +2.3% |
| `step_f32_symplectic/128` | 6.3 µs | 0.1% |  | -4.4% |
| `step_f32_symplectic/16` | 234 ns | 0.5% |  | +0.1% |
| `step_f32_verlet/1024` | 552.7 µs | 0.0% |  | +2.4% |
| `step_f32_verlet/128` | 12.9 µs | 0.1% |  | -0.1% |
| `step_f32_verlet/16` | 477 ns | 0.1% |  | +1.1% |
| `step_f64_symplectic/1024` | 441.4 µs | 0.1% |  | -0.4% |
| `step_f64_symplectic/128` | 8.3 µs | 0.1% |  | +3.7% |
| `step_f64_symplectic/16` | 219 ns | 0.1% |  | +0.9% |
| `step_f64_verlet/1024` | 889.6 µs | 0.0% |  | -0.0% |
| `step_f64_verlet/128` | 16.7 µs | 0.1% |  | +4.4% |
| `step_f64_verlet/16` | 435 ns | 0.1% |  | +1.2% |
| `stiff_waveguide_new/21` | 65.8 µs | 0.3% |  | -0.7% |
| `stiff_waveguide_new/36` | 633.8 µs | 0.2% |  | -1.8% |
| `stiff_waveguide_new/60` | 215.1 µs | 0.1% |  | -0.8% |
| `stiff_waveguide_new/69` | 4.61 ms | 0.2% |  | -0.1% |
| `stiff_waveguide_new/84` | 751.8 µs | 0.1% |  | -0.3% |
| `swarm_models/ants/200x120_500` | 162.6 µs | 0.1% |  | -8.5% |
| `swarm_models/physarum/512_100k` | 3.29 ms | 0.3% |  | -0.4% |
| `swarm_models/vicsek/4000` | 986.4 µs | 0.0% |  | +0.3% |
| `swarm_step/Brute/1000` | 494.6 µs | 0.6% | 2.0 Melem/s | -2.0% |
| `swarm_step/Brute/10000` | 47.45 ms | 0.6% | 210.8 Kelem/s | -1.8% |
| `swarm_step/Brute/300` | 50.0 µs | 0.1% | 6.0 Melem/s | -4.3% |
| `swarm_step/Brute/3000` | 4.29 ms | 0.4% | 699.7 Kelem/s | -1.2% |
| `swarm_step/Grid/1000` | 269.2 µs | 0.2% | 3.7 Melem/s | +19.9% |
| `swarm_step/Grid/10000` | 3.37 ms | 0.1% | 3.0 Melem/s | +18.4% |
| `swarm_step/Grid/100000` | 37.46 ms | 0.1% | 2.7 Melem/s | -0.1% |
| `swarm_step/Grid/300` | 120.3 µs | 0.6% | 2.5 Melem/s | +13.7% |
| `swarm_step/Grid/3000` | 888.2 µs | 0.0% | 3.4 Melem/s | +22.4% |
| `swarm_step/Sorted/1000` | 184.7 µs | 0.0% | 5.4 Melem/s | +56.9% |
| `swarm_step/Sorted/10000` | 2.24 ms | 0.0% | 4.5 Melem/s | +34.9% |
| `swarm_step/Sorted/100000` | 24.64 ms | 0.1% | 4.1 Melem/s | +21.4% |
| `swarm_step/Sorted/300` | 78.6 µs | 0.0% | 3.8 Melem/s | +72.0% |
| `swarm_step/Sorted/3000` | 600.8 µs | 0.1% | 5.0 Melem/s | +64.9% |
