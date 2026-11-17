# Benchmarks, 2026-11-17, llm-v8

- **Commit:** `ac13749` (xtask bench --record: the pull request leads with what moved past the threshold against the previous record, every level, slower first (#311))
- **Machine:** Linux x86_64, 16 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** v8 (wasm32-wasip1 with `simd128`, in Node)
- **Run:** `cargo xtask bench --level v8`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from each benchmark's previous run. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 1.02 ms | 0.0% |  |  |
| `barnes_hut_f32/theta_0.5/128` | 27.2 µs | 0.1% |  |  |
| `barnes_hut_f32/theta_0.5/4096` | 5.71 ms | 0.0% |  |  |
| `barnes_hut_f32/theta_1/1024` | 663.3 µs | 0.1% |  |  |
| `barnes_hut_f32/theta_1/128` | 17.8 µs | 0.1% |  |  |
| `barnes_hut_f32/theta_1/4096` | 3.40 ms | 0.0% |  |  |
| `barnes_hut_f64/theta_0.5/1024` | 1.12 ms | 0.1% |  |  |
| `barnes_hut_f64/theta_0.5/128` | 27.6 µs | 0.1% |  |  |
| `barnes_hut_f64/theta_0.5/4096` | 6.31 ms | 0.0% |  |  |
| `barnes_hut_f64/theta_1/1024` | 750.2 µs | 0.1% |  |  |
| `barnes_hut_f64/theta_1/128` | 18.2 µs | 0.0% |  |  |
| `barnes_hut_f64/theta_1/4096` | 3.80 ms | 0.0% |  |  |
| `bodyvec_f32/1024` | 380 ns | 0.1% |  |  |
| `bodyvec_f32/128` | 63 ns | 0.4% |  |  |
| `bodyvec_f32/16` | 21 ns | 0.1% |  |  |
| `bodyvec_f64/1024` | 761 ns | 0.0% |  |  |
| `bodyvec_f64/128` | 108 ns | 0.0% |  |  |
| `bodyvec_f64/16` | 29 ns | 0.0% |  |  |
| `broadphase_f64/1024` | 73.4 µs | 0.1% |  |  |
| `broadphase_f64/128` | 7.4 µs | 0.0% |  |  |
| `broadphase_f64/4096` | 456.4 µs | 0.0% |  |  |
| `fft_f32/1024` | 5.3 µs | 0.1% |  |  |
| `fft_f32/16384` | 150.1 µs | 0.1% |  |  |
| `fft_f32/4096` | 25.0 µs | 0.1% |  |  |
| `pairwise_f32/1024` | 303.1 µs | 0.0% |  |  |
| `pairwise_f32/128` | 6.9 µs | 0.1% |  |  |
| `pairwise_f32/16` | 345 ns | 0.0% |  |  |
| `pairwise_f32/4096` | 4.69 ms | 0.1% |  |  |
| `pairwise_f64/1024` | 626.8 µs | 0.2% |  |  |
| `pairwise_f64/128` | 10.7 µs | 0.0% |  |  |
| `pairwise_f64/16` | 294 ns | 0.0% |  |  |
| `pairwise_f64/4096` | 9.91 ms | 0.1% |  |  |
| `piano_16_voices_x3_strings/128` | 74.6 µs | 0.0% |  |  |
| `piano_design_88_keys` | 37.81 ms | 0.0% |  |  |
| `sand_step/busy/1920x1080_chunks` | 18.98 ms | 0.1% | 109.3 Melem/s |  |
| `sand_step/busy/1920x1080_full` | 18.68 ms | 0.3% | 111.0 Melem/s |  |
| `sand_step/busy/640x360_chunks` | 2.10 ms | 0.0% | 109.6 Melem/s |  |
| `sand_step/busy/640x360_full` | 2.07 ms | 0.1% | 111.4 Melem/s |  |
| `sand_step/settled/1920x1080_chunks` | 21.6 µs | 0.1% | 96.2 Gelem/s |  |
| `sand_step/settled/1920x1080_full` | 6.88 ms | 0.2% | 301.4 Melem/s |  |
| `sand_step/settled/640x360_chunks` | 2.8 µs | 0.1% | 81.6 Gelem/s |  |
| `sand_step/settled/640x360_full` | 762.9 µs | 0.1% | 302.0 Melem/s |  |
| `spectrum_f32/4096` | 35.7 µs | 0.0% |  |  |
| `step_f32_symplectic/1024` | 304.2 µs | 0.0% |  |  |
| `step_f32_symplectic/128` | 6.9 µs | 0.1% |  |  |
| `step_f32_symplectic/16` | 359 ns | 0.0% |  |  |
| `step_f32_verlet/1024` | 608.1 µs | 0.1% |  |  |
| `step_f32_verlet/128` | 13.8 µs | 0.0% |  |  |
| `step_f32_verlet/16` | 713 ns | 0.0% |  |  |
| `step_f64_symplectic/1024` | 637.3 µs | 0.1% |  |  |
| `step_f64_symplectic/128` | 10.8 µs | 0.0% |  |  |
| `step_f64_symplectic/16` | 311 ns | 0.0% |  |  |
| `step_f64_verlet/1024` | 1.29 ms | 0.0% |  |  |
| `step_f64_verlet/128` | 23.2 µs | 0.0% |  |  |
| `step_f64_verlet/16` | 614 ns | 0.1% |  |  |
| `stiff_waveguide_new/21` | 70.0 µs | 0.1% |  |  |
| `stiff_waveguide_new/36` | 678.4 µs | 0.0% |  |  |
| `stiff_waveguide_new/60` | 216.7 µs | 0.1% |  |  |
| `stiff_waveguide_new/69` | 4.44 ms | 0.0% |  |  |
| `stiff_waveguide_new/84` | 706.8 µs | 0.1% |  |  |
| `swarm_models/ants/200x120_500` | 318.8 µs | 0.2% |  |  |
| `swarm_models/physarum/512_100k` | 3.27 ms | 0.9% |  |  |
| `swarm_models/vicsek/4000` | 2.23 ms | 2.6% |  |  |
| `swarm_step/Brute/1000` | 521.2 µs | 0.1% | 1.9 Melem/s |  |
| `swarm_step/Brute/10000` | 49.18 ms | 0.0% | 203.3 Kelem/s |  |
| `swarm_step/Brute/300` | 55.9 µs | 0.0% | 5.4 Melem/s |  |
| `swarm_step/Brute/3000` | 4.51 ms | 0.1% | 664.6 Kelem/s |  |
| `swarm_step/Grid/1000` | 670.1 µs | 3.2% | 1.5 Melem/s |  |
| `swarm_step/Grid/10000` | 6.26 ms | 16.6% | 1.6 Melem/s |  |
| `swarm_step/Grid/100000` | 47.55 ms | 1.5% | 2.1 Melem/s |  |
| `swarm_step/Grid/300` | 214.6 µs | 0.1% | 1.4 Melem/s |  |
| `swarm_step/Grid/3000` | 1.98 ms | 6.0% | 1.5 Melem/s |  |
| `swarm_step/Sorted/1000` | 193.6 µs | 1.1% | 5.2 Melem/s |  |
| `swarm_step/Sorted/10000` | 1.98 ms | 3.0% | 5.0 Melem/s |  |
| `swarm_step/Sorted/100000` | 18.31 ms | 0.3% | 5.5 Melem/s |  |
| `swarm_step/Sorted/300` | 58.8 µs | 0.0% | 5.1 Melem/s |  |
| `swarm_step/Sorted/3000` | 572.7 µs | 2.1% | 5.2 Melem/s |  |
