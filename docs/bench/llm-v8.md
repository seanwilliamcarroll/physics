# Benchmarks, 2026-11-17, llm-v8

- **Commit:** `ceb9064` (swarm bench: every case steps the same warmed state (a clone per iteration, untimed), not one model on and on (a moving target: ±9-16% where everything else was ±1%; now ±0.1%); developed warm-ups (flocks 1,000 steps, Vicsek 3,000, ants 1,000, Physarum 300) (#315))
- **Machine:** Linux x86_64, 16 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** v8 (wasm32-wasip1 with `simd128`, in Node)
- **Run:** `cargo xtask bench --level v8 swarm_`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `llm-v8`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

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
| `swarm_models/ants/200x120_500` | 168.1 µs | 0.1% |  | -47.3% |
| `swarm_models/physarum/512_100k` | 3.54 ms | 0.0% |  | +8.2% |
| `swarm_models/vicsek/4000` | 2.27 ms | 0.1% |  | +1.7% |
| `swarm_step/Brute/1000` | 770.3 µs | 0.1% | 1.3 Melem/s | +47.8% |
| `swarm_step/Brute/10000` | 65.59 ms | 0.1% | 152.5 Kelem/s | +33.4% |
| `swarm_step/Brute/300` | 66.7 µs | 0.1% | 4.5 Melem/s | +19.3% |
| `swarm_step/Brute/3000` | 6.81 ms | 0.0% | 440.7 Kelem/s | +50.8% |
| `swarm_step/Grid/1000` | 336.7 µs | 0.1% | 3.0 Melem/s | -49.7% |
| `swarm_step/Grid/10000` | 4.62 ms | 0.5% | 2.2 Melem/s | -26.2% |
| `swarm_step/Grid/100000` | 58.60 ms | 0.0% | 1.7 Melem/s | +23.3% |
| `swarm_step/Grid/300` | 116.4 µs | 0.6% | 2.6 Melem/s | -45.8% |
| `swarm_step/Grid/3000` | 1.22 ms | 0.1% | 2.4 Melem/s | -38.3% |
| `swarm_step/Sorted/1000` | 135.6 µs | 0.1% | 7.4 Melem/s | -30.0% |
| `swarm_step/Sorted/10000` | 1.94 ms | 0.0% | 5.2 Melem/s | -2.2% |
| `swarm_step/Sorted/100000` | 22.27 ms | 0.0% | 4.5 Melem/s | +21.6% |
| `swarm_step/Sorted/300` | 54.4 µs | 0.1% | 5.5 Melem/s | -7.6% |
| `swarm_step/Sorted/3000` | 495.7 µs | 0.1% | 6.1 Melem/s | -13.4% |
