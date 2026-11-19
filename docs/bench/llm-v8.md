# Benchmarks, 2026-11-19, llm-v8

- **Commit:** `24cb23b` (Health check: narrower APIs, ants.rs split, the workspace version, TASKS condensed (#334))
- **Machine:** Linux x86_64, 16 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** v8 (wasm32-wasip1 with `simd128`, in Node)
- **Run:** `cargo xtask bench --level v8`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `llm-v8`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 1.01 ms | 0.4% |  | +0.7% |
| `barnes_hut_f32/theta_0.5/128` | 25.9 µs | 0.1% |  | +0.1% |
| `barnes_hut_f32/theta_0.5/4096` | 5.69 ms | 0.1% |  | +0.2% |
| `barnes_hut_f32/theta_1/1024` | 671.8 µs | 0.2% |  | +0.4% |
| `barnes_hut_f32/theta_1/128` | 17.3 µs | 0.1% |  | +0.2% |
| `barnes_hut_f32/theta_1/4096` | 3.41 ms | 0.1% |  | -0.4% |
| `barnes_hut_f64/theta_0.5/1024` | 1.14 ms | 0.3% |  | +0.0% |
| `barnes_hut_f64/theta_0.5/128` | 26.1 µs | 0.1% |  | -0.1% |
| `barnes_hut_f64/theta_0.5/4096` | 6.31 ms | 0.3% |  | +0.2% |
| `barnes_hut_f64/theta_1/1024` | 770.4 µs | 0.1% |  | +0.4% |
| `barnes_hut_f64/theta_1/128` | 17.5 µs | 0.0% |  | -0.1% |
| `barnes_hut_f64/theta_1/4096` | 3.87 ms | 0.3% |  | +0.4% |
| `bodyvec_f32/1024` | 361 ns | 0.2% |  | -0.1% |
| `bodyvec_f32/128` | 62 ns | 0.1% |  | +0.3% |
| `bodyvec_f32/16` | 23 ns | 0.1% |  | +0.8% |
| `bodyvec_f64/1024` | 763 ns | 0.1% |  | +0.0% |
| `bodyvec_f64/128` | 108 ns | 0.2% |  | +0.2% |
| `bodyvec_f64/16` | 27 ns | 0.1% |  | +0.7% |
| `broadphase_f64/1024` | 70.5 µs | 0.2% |  | +0.9% |
| `broadphase_f64/128` | 7.2 µs | 0.6% |  | +1.0% |
| `broadphase_f64/4096` | 442.6 µs | 0.1% |  | +0.2% |
| `fft_f32/1024` | 6.1 µs | 0.4% |  | +0.1% |
| `fft_f32/16384` | 159.8 µs | 0.0% |  | +0.0% |
| `fft_f32/4096` | 28.5 µs | 0.1% |  | -1.0% |
| `pairwise_f32/1024` | 307.5 µs | 0.0% |  | +0.1% |
| `pairwise_f32/128` | 7.1 µs | 0.1% |  | +0.6% |
| `pairwise_f32/16` | 222 ns | 0.0% |  | -1.5% |
| `pairwise_f32/4096` | 4.69 ms | 0.4% |  | +0.5% |
| `pairwise_f64/1024` | 623.3 µs | 0.0% |  | -0.0% |
| `pairwise_f64/128` | 10.8 µs | 0.1% |  | +0.4% |
| `pairwise_f64/16` | 297 ns | 0.3% |  | +0.2% |
| `pairwise_f64/4096` | 9.85 ms | 0.0% |  | +0.0% |
| `piano_16_voices_x3_strings/128` | 74.2 µs | 0.1% |  | -0.3% |
| `piano_design_88_keys` | 38.39 ms | 0.1% |  | -0.1% |
| `sand_step/busy/1920x1080_chunks` | 11.36 ms | 0.1% | 182.5 Melem/s | -40.2% |
| `sand_step/busy/1920x1080_full` | 11.20 ms | 0.1% | 185.2 Melem/s | -40.6% |
| `sand_step/busy/640x360_chunks` | 1.24 ms | 0.1% | 185.8 Melem/s | -40.2% |
| `sand_step/busy/640x360_full` | 1.22 ms | 0.1% | 188.8 Melem/s | -40.6% |
| `sand_step/settled/1920x1080_chunks` | 20.6 µs | 0.1% | 100.8 Gelem/s | -0.8% |
| `sand_step/settled/1920x1080_full` | 6.12 ms | 0.1% | 338.6 Melem/s | -9.9% |
| `sand_step/settled/640x360_chunks` | 2.5 µs | 0.0% | 92.7 Gelem/s | -2.1% |
| `sand_step/settled/640x360_full` | 666.4 µs | 0.0% | 345.8 Melem/s | -11.6% |
| `spectrum_f32/4096` | 39.5 µs | 0.1% |  | -0.1% |
| `step_f32_symplectic/1024` | 308.6 µs | 0.2% |  | +0.1% |
| `step_f32_symplectic/128` | 7.2 µs | 0.1% |  | -1.3% |
| `step_f32_symplectic/16` | 239 ns | 0.1% |  | -0.6% |
| `step_f32_verlet/1024` | 616.8 µs | 0.1% |  | -0.0% |
| `step_f32_verlet/128` | 14.4 µs | 0.2% |  | +0.7% |
| `step_f32_verlet/16` | 471 ns | 0.1% |  | -0.3% |
| `step_f64_symplectic/1024` | 626.7 µs | 0.2% |  | +0.2% |
| `step_f64_symplectic/128` | 10.9 µs | 0.0% |  | -0.5% |
| `step_f64_symplectic/16` | 313 ns | 0.0% |  | -0.0% |
| `step_f64_verlet/1024` | 1.26 ms | 0.0% |  | +0.0% |
| `step_f64_verlet/128` | 21.8 µs | 0.1% |  | -0.3% |
| `step_f64_verlet/16` | 619 ns | 0.2% |  | +0.6% |
| `stiff_waveguide_new/21` | 70.7 µs | 0.1% |  | -0.5% |
| `stiff_waveguide_new/36` | 680.5 µs | 0.1% |  | +0.1% |
| `stiff_waveguide_new/60` | 218.8 µs | 0.0% |  | -0.5% |
| `stiff_waveguide_new/69` | 4.51 ms | 0.2% |  | -0.2% |
| `stiff_waveguide_new/84` | 723.9 µs | 0.1% |  | +0.2% |
| `swarm_models/ants/200x120_500` | 178.9 µs | 0.3% |  | +0.2% |
| `swarm_models/physarum/512_100k` | 3.58 ms | 0.1% |  | +0.1% |
| `swarm_models/vicsek/4000` | 2.27 ms | 0.2% |  | -0.7% |
| `swarm_step/Brute/1000` | 527.6 µs | 0.2% | 1.9 Melem/s | +1.8% |
| `swarm_step/Brute/10000` | 50.63 ms | 0.1% | 197.5 Kelem/s | +1.8% |
| `swarm_step/Brute/300` | 52.8 µs | 0.1% | 5.7 Melem/s | +1.4% |
| `swarm_step/Brute/3000` | 4.63 ms | 0.4% | 648.4 Kelem/s | +2.2% |
| `swarm_step/Grid/1000` | 377.6 µs | 0.1% | 2.6 Melem/s | -28.8% |
| `swarm_step/Grid/10000` | 4.53 ms | 0.1% | 2.2 Melem/s | -29.7% |
| `swarm_step/Grid/100000` | 49.48 ms | 0.0% | 2.0 Melem/s | -40.9% |
| `swarm_step/Grid/300` | 159.8 µs | 0.1% | 1.9 Melem/s | -32.7% |
| `swarm_step/Grid/3000` | 1.19 ms | 0.0% | 2.5 Melem/s | -30.3% |
| `swarm_step/Sorted/1000` | 185.8 µs | 0.1% | 5.4 Melem/s | +58.8% |
| `swarm_step/Sorted/10000` | 2.25 ms | 0.1% | 4.4 Melem/s | +23.2% |
| `swarm_step/Sorted/100000` | 24.76 ms | 0.1% | 4.0 Melem/s | +21.3% |
| `swarm_step/Sorted/300` | 78.3 µs | 0.1% | 3.8 Melem/s | +73.6% |
| `swarm_step/Sorted/3000` | 601.0 µs | 0.1% | 5.0 Melem/s | +31.5% |
