# Benchmarks, 2026-11-19, llm-native

- **Commit:** `7137084` (swarm: Sorted's lane loop out of line in wasm (V8 Sorted/10k 2.26 → 1.69 ms on the M4): inlined into step_sorted as shipped, the function was too big for V8 (#340))
- **Machine:** Linux x86_64, 16 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** native (`-C target-cpu=native`)
- **Run:** `cargo xtask bench --level native`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `llm-native`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 649.3 µs | 0.0% |  | -0.8% |
| `barnes_hut_f32/theta_0.5/128` | 38.8 µs | 0.0% |  | +0.1% |
| `barnes_hut_f32/theta_0.5/4096` | 4.19 ms | 0.0% |  | -0.2% |
| `barnes_hut_f32/theta_1/1024` | 381.9 µs | 0.3% |  | +2.4% |
| `barnes_hut_f32/theta_1/128` | 31.6 µs | 0.1% |  | +1.3% |
| `barnes_hut_f32/theta_1/4096` | 2.14 ms | 0.0% |  | +0.6% |
| `barnes_hut_f64/theta_0.5/1024` | 632.9 µs | 0.0% |  | -0.1% |
| `barnes_hut_f64/theta_0.5/128` | 36.7 µs | 0.1% |  | +0.6% |
| `barnes_hut_f64/theta_0.5/4096` | 4.14 ms | 0.0% |  | +0.1% |
| `barnes_hut_f64/theta_1/1024` | 360.6 µs | 0.1% |  | -0.0% |
| `barnes_hut_f64/theta_1/128` | 29.8 µs | 0.2% |  | +0.5% |
| `barnes_hut_f64/theta_1/4096` | 2.06 ms | 0.1% |  | -0.0% |
| `bodyvec_f32/1024` | 107 ns | 0.1% |  | +1.1% |
| `bodyvec_f32/128` | 27 ns | 0.3% |  | +5.0% |
| `bodyvec_f32/16` | 6 ns | 0.3% |  | -2.3% |
| `bodyvec_f64/1024` | 246 ns | 0.1% |  | -0.7% |
| `bodyvec_f64/128` | 37 ns | 0.4% |  | -2.8% |
| `bodyvec_f64/16` | 8 ns | 0.4% |  | -5.3% |
| `broadphase_f64/1024` | 53.8 µs | 0.3% |  | -0.6% |
| `broadphase_f64/128` | 5.6 µs | 0.4% |  | -0.7% |
| `broadphase_f64/4096` | 344.8 µs | 0.2% |  | +0.2% |
| `fft_f32/1024` | 4.6 µs | 0.0% |  | -0.4% |
| `fft_f32/16384` | 129.0 µs | 0.0% |  | -0.4% |
| `fft_f32/4096` | 21.7 µs | 0.1% |  | +1.2% |
| `pairwise_f32/1024` | 96.5 µs | 0.1% |  | -1.3% |
| `pairwise_f32/128` | 4.5 µs | 0.1% |  | +0.4% |
| `pairwise_f32/16` | 200 ns | 0.1% |  | +1.8% |
| `pairwise_f32/4096` | 1.54 ms | 0.1% |  | +1.4% |
| `pairwise_f64/1024` | 198.7 µs | 0.1% |  | -0.5% |
| `pairwise_f64/128` | 6.8 µs | 0.1% |  | +13.4% |
| `pairwise_f64/16` | 277 ns | 0.1% |  | -0.0% |
| `pairwise_f64/4096` | 3.17 ms | 0.0% |  | -1.3% |
| `piano_16_voices_x3_strings/128` | 62.7 µs | 0.0% |  | +0.1% |
| `piano_design_88_keys` | 25.57 ms | 0.1% |  | -0.0% |
| `sand_step/busy/1920x1080_chunks` | 9.73 ms | 0.1% | 213.2 Melem/s | +1.1% |
| `sand_step/busy/1920x1080_full` | 9.53 ms | 0.0% | 217.6 Melem/s | +0.7% |
| `sand_step/busy/640x360_chunks` | 1.04 ms | 0.2% | 221.2 Melem/s | -1.1% |
| `sand_step/busy/640x360_full` | 1.03 ms | 0.1% | 224.5 Melem/s | -0.6% |
| `sand_step/settled/1920x1080_chunks` | 21.1 µs | 1.3% | 98.2 Gelem/s | +5.1% |
| `sand_step/settled/1920x1080_full` | 5.17 ms | 0.1% | 400.9 Melem/s | +1.0% |
| `sand_step/settled/640x360_chunks` | 2.6 µs | 1.4% | 88.6 Gelem/s | +2.9% |
| `sand_step/settled/640x360_full` | 571.8 µs | 0.1% | 402.9 Melem/s | -0.7% |
| `spectrum_f32/4096` | 24.1 µs | 0.0% |  | -0.2% |
| `step_f32_symplectic/1024` | 101.0 µs | 0.1% |  | +0.5% |
| `step_f32_symplectic/128` | 5.0 µs | 0.1% |  | +5.4% |
| `step_f32_symplectic/16` | 239 ns | 0.1% |  | -1.4% |
| `step_f32_verlet/1024` | 206.9 µs | 0.1% |  | +2.3% |
| `step_f32_verlet/128` | 9.5 µs | 0.1% |  | +0.8% |
| `step_f32_verlet/16` | 435 ns | 0.0% |  | -0.0% |
| `step_f64_symplectic/1024` | 202.0 µs | 0.1% |  | -2.1% |
| `step_f64_symplectic/128` | 6.2 µs | 0.1% |  | -1.9% |
| `step_f64_symplectic/16` | 312 ns | 0.0% |  | -1.2% |
| `step_f64_verlet/1024` | 398.2 µs | 0.0% |  | -0.6% |
| `step_f64_verlet/128` | 12.1 µs | 0.1% |  | -3.9% |
| `step_f64_verlet/16` | 588 ns | 0.1% |  | +0.5% |
| `stiff_waveguide_new/21` | 43.9 µs | 0.1% |  | -0.1% |
| `stiff_waveguide_new/36` | 426.1 µs | 0.0% |  | -0.2% |
| `stiff_waveguide_new/60` | 140.9 µs | 0.0% |  | -0.1% |
| `stiff_waveguide_new/69` | 3.15 ms | 0.2% |  | +0.0% |
| `stiff_waveguide_new/84` | 494.1 µs | 0.0% |  | -0.1% |
| `swarm_models/ants/200x120_500` | 182.4 µs | 0.1% |  | -0.1% |
| `swarm_models/physarum/512_100k` | 3.05 ms | 0.0% |  | +0.2% |
| `swarm_models/vicsek/4000` | 907.0 µs | 0.0% |  | -0.6% |
| `swarm_step/Brute/1000` | 155.9 µs | 0.1% | 6.4 Melem/s | +0.2% |
| `swarm_step/Brute/10000` | 13.10 ms | 0.0% | 763.3 Kelem/s | -0.0% |
| `swarm_step/Brute/300` | 20.0 µs | 0.2% | 15.0 Melem/s | -0.0% |
| `swarm_step/Brute/3000` | 1.25 ms | 0.0% | 2.4 Melem/s | -0.1% |
| `swarm_step/Grid/1000` | 236.7 µs | 0.0% | 4.2 Melem/s | -0.1% |
| `swarm_step/Grid/10000` | 2.99 ms | 0.0% | 3.3 Melem/s | +0.0% |
| `swarm_step/Grid/100000` | 33.26 ms | 0.1% | 3.0 Melem/s | -0.0% |
| `swarm_step/Grid/300` | 106.4 µs | 0.0% | 2.8 Melem/s | -0.0% |
| `swarm_step/Grid/3000` | 781.8 µs | 0.0% | 3.8 Melem/s | -0.0% |
| `swarm_step/Sorted/1000` | 51.1 µs | 0.1% | 19.6 Melem/s | -0.1% |
| `swarm_step/Sorted/10000` | 576.0 µs | 0.0% | 17.4 Melem/s | +0.0% |
| `swarm_step/Sorted/100000` | 6.36 ms | 0.0% | 15.7 Melem/s | -0.0% |
| `swarm_step/Sorted/300` | 18.5 µs | 0.1% | 16.2 Melem/s | -0.1% |
| `swarm_step/Sorted/3000` | 163.1 µs | 0.1% | 18.4 Melem/s | -0.0% |
