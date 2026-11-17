# Benchmarks, 2026-11-17, macbook-air-5-v8

- **Commit:** `ac137491` (xtask bench --record: the pull request leads with what moved past the threshold against the previous record, every level, slower first (#311))
- **Machine:** Darwin arm64, 10 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** v8 (wasm32-wasip1 with `simd128`, in Node)
- **Run:** `cargo xtask bench --level v8`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from each benchmark's previous run. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 650.1 µs | 0.5% |  |  |
| `barnes_hut_f32/theta_0.5/128` | 43.0 µs | 0.1% |  |  |
| `barnes_hut_f32/theta_0.5/4096` | 4.71 ms | 0.2% |  |  |
| `barnes_hut_f32/theta_1/1024` | 322.7 µs | 0.1% |  |  |
| `barnes_hut_f32/theta_1/128` | 30.9 µs | 0.1% |  |  |
| `barnes_hut_f32/theta_1/4096` | 2.14 ms | 0.3% |  |  |
| `barnes_hut_f64/theta_0.5/1024` | 666.4 µs | 0.1% |  |  |
| `barnes_hut_f64/theta_0.5/128` | 43.5 µs | 0.1% |  |  |
| `barnes_hut_f64/theta_0.5/4096` | 5.16 ms | 0.3% |  |  |
| `barnes_hut_f64/theta_1/1024` | 336.0 µs | 0.3% |  |  |
| `barnes_hut_f64/theta_1/128` | 31.3 µs | 0.1% |  |  |
| `barnes_hut_f64/theta_1/4096` | 2.36 ms | 0.2% |  |  |
| `bodyvec_f32/1024` | 573 ns | 0.1% |  |  |
| `bodyvec_f32/128` | 74 ns | 0.2% |  |  |
| `bodyvec_f32/16` | 20 ns | 3.0% |  |  |
| `bodyvec_f64/1024` | 689 ns | 0.1% |  |  |
| `bodyvec_f64/128` | 83 ns | 0.2% |  |  |
| `bodyvec_f64/16` | 23 ns | 0.7% |  |  |
| `broadphase_f64/1024` | 79.2 µs | 0.1% |  |  |
| `broadphase_f64/128` | 7.9 µs | 0.2% |  |  |
| `broadphase_f64/4096` | 360.4 µs | 0.2% |  |  |
| `fft_f32/1024` | 5.2 µs | 0.2% |  |  |
| `fft_f32/16384` | 114.1 µs | 0.3% |  |  |
| `fft_f32/4096` | 24.2 µs | 0.2% |  |  |
| `pairwise_f32/1024` | 268.5 µs | 0.1% |  |  |
| `pairwise_f32/128` | 6.3 µs | 0.3% |  |  |
| `pairwise_f32/16` | 220 ns | 0.3% |  |  |
| `pairwise_f32/4096` | 4.15 ms | 0.2% |  |  |
| `pairwise_f64/1024` | 437.2 µs | 0.1% |  |  |
| `pairwise_f64/128` | 7.9 µs | 0.1% |  |  |
| `pairwise_f64/16` | 197 ns | 0.2% |  |  |
| `pairwise_f64/4096` | 7.02 ms | 0.1% |  |  |
| `piano_16_voices_x3_strings/128` | 83.4 µs | 0.1% |  |  |
| `piano_design_88_keys` | 40.09 ms | 1.2% |  |  |
| `sand_step/busy/1920x1080_chunks` | 17.60 ms | 0.2% | 117.8 Melem/s |  |
| `sand_step/busy/1920x1080_full` | 17.58 ms | 0.1% | 118.0 Melem/s |  |
| `sand_step/busy/640x360_chunks` | 1.93 ms | 0.2% | 119.1 Melem/s |  |
| `sand_step/busy/640x360_full` | 1.92 ms | 0.2% | 119.8 Melem/s |  |
| `sand_step/settled/1920x1080_chunks` | 30.5 µs | 0.5% | 68.0 Gelem/s |  |
| `sand_step/settled/1920x1080_full` | 8.05 ms | 0.1% | 257.4 Melem/s |  |
| `sand_step/settled/640x360_chunks` | 3.6 µs | 0.4% | 64.5 Gelem/s |  |
| `sand_step/settled/640x360_full` | 872.6 µs | 0.1% | 264.0 Melem/s |  |
| `spectrum_f32/4096` | 30.5 µs | 0.2% |  |  |
| `step_f32_symplectic/1024` | 270.0 µs | 0.1% |  |  |
| `step_f32_symplectic/128` | 6.6 µs | 0.1% |  |  |
| `step_f32_symplectic/16` | 239 ns | 0.3% |  |  |
| `step_f32_verlet/1024` | 539.5 µs | 0.1% |  |  |
| `step_f32_verlet/128` | 13.0 µs | 0.2% |  |  |
| `step_f32_verlet/16` | 478 ns | 0.4% |  |  |
| `step_f64_symplectic/1024` | 440.3 µs | 0.1% |  |  |
| `step_f64_symplectic/128` | 8.0 µs | 0.2% |  |  |
| `step_f64_symplectic/16` | 217 ns | 0.1% |  |  |
| `step_f64_verlet/1024` | 894.2 µs | 0.0% |  |  |
| `step_f64_verlet/128` | 16.6 µs | 0.1% |  |  |
| `step_f64_verlet/16` | 431 ns | 0.1% |  |  |
| `stiff_waveguide_new/21` | 66.2 µs | 0.5% |  |  |
| `stiff_waveguide_new/36` | 637.9 µs | 0.3% |  |  |
| `stiff_waveguide_new/60` | 212.5 µs | 0.4% |  |  |
| `stiff_waveguide_new/69` | 4.64 ms | 0.2% |  |  |
| `stiff_waveguide_new/84` | 756.1 µs | 0.2% |  |  |
| `swarm_models/ants/200x120_500` | 154.5 µs | 0.4% |  |  |
| `swarm_models/physarum/512_100k` | 2.91 ms | 0.8% |  |  |
| `swarm_models/vicsek/4000` | 1.10 ms | 7.1% |  |  |
| `swarm_step/Brute/1000` | 516.1 µs | 0.5% | 1.9 Melem/s |  |
| `swarm_step/Brute/10000` | 49.22 ms | 0.6% | 203.2 Kelem/s |  |
| `swarm_step/Brute/300` | 56.6 µs | 0.3% | 5.3 Melem/s |  |
| `swarm_step/Brute/3000` | 4.42 ms | 0.8% | 678.6 Kelem/s |  |
| `swarm_step/Grid/1000` | 726.8 µs | 3.4% | 1.4 Melem/s |  |
| `swarm_step/Grid/10000` | 6.43 ms | 14.5% | 1.6 Melem/s |  |
| `swarm_step/Grid/100000` | 50.77 ms | 0.4% | 2.0 Melem/s |  |
| `swarm_step/Grid/300` | 231.9 µs | 0.3% | 1.3 Melem/s |  |
| `swarm_step/Grid/3000` | 2.09 ms | 6.6% | 1.4 Melem/s |  |
| `swarm_step/Sorted/1000` | 197.7 µs | 1.1% | 5.1 Melem/s |  |
| `swarm_step/Sorted/10000` | 2.02 ms | 2.9% | 4.9 Melem/s |  |
| `swarm_step/Sorted/100000` | 18.67 ms | 0.3% | 5.4 Melem/s |  |
| `swarm_step/Sorted/300` | 60.2 µs | 0.3% | 5.0 Melem/s |  |
| `swarm_step/Sorted/3000` | 590.1 µs | 2.2% | 5.1 Melem/s |  |
