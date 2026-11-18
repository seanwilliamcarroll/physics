# Benchmarks, 2026-11-17, macbook-air-5-v8

- **Commit:** `8e2e7a25` (swarm: the grid's candidates through a branchless scalar add (Seen::add_masked; Grid −37% at 100k on the M4, −35% in V8); sorted's leftovers keep the branching add (the masked one was 20% slower at 1k in V8) (#320))
- **Machine:** Darwin arm64, 10 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** v8 (wasm32-wasip1 with `simd128`, in Node)
- **Run:** `cargo xtask bench --level v8`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `macbook-air-5-v8`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 608.4 µs | 0.2% |  | -6.4% |
| `barnes_hut_f32/theta_0.5/128` | 43.0 µs | 0.1% |  | +0.0% |
| `barnes_hut_f32/theta_0.5/4096` | 4.41 ms | 0.3% |  | -6.4% |
| `barnes_hut_f32/theta_1/1024` | 321.6 µs | 0.1% |  | -0.3% |
| `barnes_hut_f32/theta_1/128` | 30.9 µs | 0.1% |  | +0.2% |
| `barnes_hut_f32/theta_1/4096` | 2.08 ms | 0.2% |  | -2.6% |
| `barnes_hut_f64/theta_0.5/1024` | 643.6 µs | 2.6% |  | -3.4% |
| `barnes_hut_f64/theta_0.5/128` | 43.6 µs | 0.1% |  | +0.4% |
| `barnes_hut_f64/theta_0.5/4096` | 4.71 ms | 0.3% |  | -8.8% |
| `barnes_hut_f64/theta_1/1024` | 326.6 µs | 0.1% |  | -2.8% |
| `barnes_hut_f64/theta_1/128` | 31.3 µs | 0.1% |  | -0.1% |
| `barnes_hut_f64/theta_1/4096` | 2.18 ms | 0.4% |  | -7.5% |
| `bodyvec_f32/1024` | 573 ns | 0.1% |  | +0.1% |
| `bodyvec_f32/128` | 79 ns | 1.3% |  | +7.4% |
| `bodyvec_f32/16` | 18 ns | 0.8% |  | -8.2% |
| `bodyvec_f64/1024` | 687 ns | 0.1% |  | -0.2% |
| `bodyvec_f64/128` | 90 ns | 1.6% |  | +8.1% |
| `bodyvec_f64/16` | 23 ns | 0.7% |  | +1.2% |
| `broadphase_f64/1024` | 79.4 µs | 0.1% |  | +0.3% |
| `broadphase_f64/128` | 7.9 µs | 0.2% |  | +0.4% |
| `broadphase_f64/4096` | 360.0 µs | 0.2% |  | -0.1% |
| `fft_f32/1024` | 5.2 µs | 0.1% |  | -0.5% |
| `fft_f32/16384` | 112.4 µs | 0.2% |  | -1.4% |
| `fft_f32/4096` | 23.9 µs | 0.1% |  | -1.4% |
| `pairwise_f32/1024` | 268.6 µs | 0.0% |  | +0.1% |
| `pairwise_f32/128` | 6.2 µs | 0.1% |  | -0.8% |
| `pairwise_f32/16` | 219 ns | 0.6% |  | -0.6% |
| `pairwise_f32/4096` | 4.14 ms | 0.0% |  | -0.2% |
| `pairwise_f64/1024` | 444.1 µs | 0.5% |  | +1.6% |
| `pairwise_f64/128` | 7.9 µs | 0.1% |  | +0.3% |
| `pairwise_f64/16` | 201 ns | 0.2% |  | +2.0% |
| `pairwise_f64/4096` | 7.04 ms | 0.0% |  | +0.2% |
| `piano_16_voices_x3_strings/128` | 83.3 µs | 0.1% |  | -0.1% |
| `piano_design_88_keys` | 39.27 ms | 0.3% |  | -2.0% |
| `sand_step/busy/1920x1080_chunks` | 17.68 ms | 0.1% | 117.3 Melem/s | +0.5% |
| `sand_step/busy/1920x1080_full` | 17.54 ms | 0.1% | 118.2 Melem/s | -0.2% |
| `sand_step/busy/640x360_chunks` | 1.91 ms | 0.2% | 120.5 Melem/s | -1.1% |
| `sand_step/busy/640x360_full` | 1.90 ms | 0.1% | 121.1 Melem/s | -1.1% |
| `sand_step/settled/1920x1080_chunks` | 30.5 µs | 0.5% | 67.9 Gelem/s | +0.2% |
| `sand_step/settled/1920x1080_full` | 8.02 ms | 0.1% | 258.7 Melem/s | -0.5% |
| `sand_step/settled/640x360_chunks` | 3.6 µs | 0.3% | 64.3 Gelem/s | +0.3% |
| `sand_step/settled/640x360_full` | 873.1 µs | 0.1% | 263.9 Melem/s | +0.1% |
| `spectrum_f32/4096` | 30.3 µs | 0.1% |  | -0.6% |
| `step_f32_symplectic/1024` | 270.1 µs | 0.1% |  | +0.0% |
| `step_f32_symplectic/128` | 6.6 µs | 0.1% |  | -0.1% |
| `step_f32_symplectic/16` | 234 ns | 0.8% |  | -2.4% |
| `step_f32_verlet/1024` | 539.5 µs | 0.1% |  | -0.0% |
| `step_f32_verlet/128` | 12.9 µs | 0.1% |  | -0.2% |
| `step_f32_verlet/16` | 472 ns | 0.6% |  | -1.4% |
| `step_f64_symplectic/1024` | 443.2 µs | 0.1% |  | +0.7% |
| `step_f64_symplectic/128` | 8.0 µs | 0.1% |  | -0.2% |
| `step_f64_symplectic/16` | 217 ns | 0.1% |  | -0.0% |
| `step_f64_verlet/1024` | 889.7 µs | 0.0% |  | -0.5% |
| `step_f64_verlet/128` | 16.0 µs | 0.1% |  | -3.5% |
| `step_f64_verlet/16` | 430 ns | 0.1% |  | -0.2% |
| `stiff_waveguide_new/21` | 66.3 µs | 0.4% |  | +0.0% |
| `stiff_waveguide_new/36` | 645.8 µs | 0.2% |  | +1.2% |
| `stiff_waveguide_new/60` | 216.8 µs | 0.3% |  | +2.0% |
| `stiff_waveguide_new/69` | 4.61 ms | 0.3% |  | -0.7% |
| `stiff_waveguide_new/84` | 754.2 µs | 0.3% |  | -0.2% |
| `swarm_models/ants/200x120_500` | 177.7 µs | 0.1% |  | +3.9% |
| `swarm_models/physarum/512_100k` | 3.30 ms | 0.3% |  | -0.1% |
| `swarm_models/vicsek/4000` | 983.0 µs | 0.1% |  | +0.0% |
| `swarm_step/Brute/1000` | 505.0 µs | 0.2% | 2.0 Melem/s | +1.2% |
| `swarm_step/Brute/10000` | 48.32 ms | 1.6% | 206.9 Kelem/s | +2.2% |
| `swarm_step/Brute/300` | 52.2 µs | 0.1% | 5.7 Melem/s | +1.5% |
| `swarm_step/Brute/3000` | 4.34 ms | 0.3% | 691.6 Kelem/s | +1.0% |
| `swarm_step/Grid/1000` | 224.6 µs | 0.3% | 4.5 Melem/s | -25.7% |
| `swarm_step/Grid/10000` | 2.85 ms | 0.9% | 3.5 Melem/s | -39.5% |
| `swarm_step/Grid/100000` | 37.49 ms | 0.1% | 2.7 Melem/s | -39.1% |
| `swarm_step/Grid/300` | 105.8 µs | 0.2% | 2.8 Melem/s | -23.5% |
| `swarm_step/Grid/3000` | 725.5 µs | 0.2% | 4.1 Melem/s | -37.1% |
| `swarm_step/Sorted/1000` | 117.7 µs | 0.2% | 8.5 Melem/s | +1.1% |
| `swarm_step/Sorted/10000` | 1.66 ms | 0.4% | 6.0 Melem/s | +0.3% |
| `swarm_step/Sorted/100000` | 20.29 ms | 0.0% | 4.9 Melem/s | +0.0% |
| `swarm_step/Sorted/300` | 45.7 µs | 0.3% | 6.6 Melem/s | +0.4% |
| `swarm_step/Sorted/3000` | 364.2 µs | 0.2% | 8.2 Melem/s | -2.0% |
