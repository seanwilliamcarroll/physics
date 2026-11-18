# Benchmarks, 2026-11-17, llm-v8

- **Commit:** `8e2e7a2` (swarm: the grid's candidates through a branchless scalar add (Seen::add_masked; Grid −37% at 100k on the M4, −35% in V8); sorted's leftovers keep the branching add (the masked one was 20% slower at 1k in V8) (#320))
- **Machine:** Linux x86_64, 16 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** v8 (wasm32-wasip1 with `simd128`, in Node)
- **Run:** `cargo xtask bench --level v8`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `llm-v8`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 1.01 ms | 0.1% |  | -1.3% |
| `barnes_hut_f32/theta_0.5/128` | 25.9 µs | 0.0% |  | -4.8% |
| `barnes_hut_f32/theta_0.5/4096` | 5.67 ms | 0.1% |  | -0.7% |
| `barnes_hut_f32/theta_1/1024` | 669.4 µs | 0.2% |  | +0.9% |
| `barnes_hut_f32/theta_1/128` | 17.3 µs | 0.0% |  | -2.9% |
| `barnes_hut_f32/theta_1/4096` | 3.42 ms | 0.1% |  | +0.7% |
| `barnes_hut_f64/theta_0.5/1024` | 1.14 ms | 0.1% |  | +1.6% |
| `barnes_hut_f64/theta_0.5/128` | 26.1 µs | 0.0% |  | -5.4% |
| `barnes_hut_f64/theta_0.5/4096` | 6.30 ms | 0.0% |  | -0.3% |
| `barnes_hut_f64/theta_1/1024` | 767.2 µs | 0.1% |  | +2.3% |
| `barnes_hut_f64/theta_1/128` | 17.5 µs | 0.0% |  | -3.8% |
| `barnes_hut_f64/theta_1/4096` | 3.85 ms | 0.1% |  | +1.3% |
| `bodyvec_f32/1024` | 361 ns | 0.1% |  | -4.8% |
| `bodyvec_f32/128` | 62 ns | 0.1% |  | -1.4% |
| `bodyvec_f32/16` | 23 ns | 0.1% |  | +9.0% |
| `bodyvec_f64/1024` | 763 ns | 0.1% |  | +0.3% |
| `bodyvec_f64/128` | 108 ns | 0.3% |  | +0.5% |
| `bodyvec_f64/16` | 27 ns | 0.1% |  | -5.2% |
| `broadphase_f64/1024` | 69.9 µs | 0.1% |  | -4.7% |
| `broadphase_f64/128` | 7.1 µs | 0.1% |  | -4.0% |
| `broadphase_f64/4096` | 441.7 µs | 0.1% |  | -3.2% |
| `fft_f32/1024` | 6.1 µs | 0.7% |  | +14.2% |
| `fft_f32/16384` | 159.8 µs | 0.1% |  | +6.4% |
| `fft_f32/4096` | 28.8 µs | 0.1% |  | +15.4% |
| `pairwise_f32/1024` | 307.1 µs | 0.1% |  | +1.3% |
| `pairwise_f32/128` | 7.1 µs | 0.4% |  | +2.5% |
| `pairwise_f32/16` | 225 ns | 0.1% |  | -34.8% |
| `pairwise_f32/4096` | 4.67 ms | 0.1% |  | -0.3% |
| `pairwise_f64/1024` | 623.4 µs | 0.0% |  | -0.5% |
| `pairwise_f64/128` | 10.8 µs | 0.1% |  | +0.5% |
| `pairwise_f64/16` | 296 ns | 0.1% |  | +0.8% |
| `pairwise_f64/4096` | 9.85 ms | 0.0% |  | -0.6% |
| `piano_16_voices_x3_strings/128` | 74.4 µs | 0.1% |  | -0.2% |
| `piano_design_88_keys` | 38.43 ms | 0.1% |  | +1.6% |
| `sand_step/busy/1920x1080_chunks` | 19.00 ms | 0.1% | 109.1 Melem/s | +0.1% |
| `sand_step/busy/1920x1080_full` | 18.85 ms | 0.1% | 110.0 Melem/s | +0.9% |
| `sand_step/busy/640x360_chunks` | 2.07 ms | 0.1% | 111.1 Melem/s | -1.4% |
| `sand_step/busy/640x360_full` | 2.05 ms | 0.0% | 112.2 Melem/s | -0.7% |
| `sand_step/settled/1920x1080_chunks` | 20.7 µs | 0.1% | 100.0 Gelem/s | -3.9% |
| `sand_step/settled/1920x1080_full` | 6.79 ms | 0.1% | 305.2 Melem/s | -1.2% |
| `sand_step/settled/640x360_chunks` | 2.5 µs | 0.0% | 90.7 Gelem/s | -10.0% |
| `sand_step/settled/640x360_full` | 753.7 µs | 0.1% | 305.7 Melem/s | -1.2% |
| `spectrum_f32/4096` | 39.5 µs | 0.1% |  | +10.5% |
| `step_f32_symplectic/1024` | 308.3 µs | 0.1% |  | +1.4% |
| `step_f32_symplectic/128` | 7.3 µs | 0.2% |  | +4.5% |
| `step_f32_symplectic/16` | 241 ns | 0.2% |  | -33.0% |
| `step_f32_verlet/1024` | 616.9 µs | 0.0% |  | +1.5% |
| `step_f32_verlet/128` | 14.3 µs | 0.0% |  | +4.0% |
| `step_f32_verlet/16` | 473 ns | 0.0% |  | -33.7% |
| `step_f64_symplectic/1024` | 625.5 µs | 0.2% |  | -1.9% |
| `step_f64_symplectic/128` | 10.9 µs | 0.1% |  | +0.8% |
| `step_f64_symplectic/16` | 313 ns | 0.1% |  | +0.5% |
| `step_f64_verlet/1024` | 1.26 ms | 0.0% |  | -2.4% |
| `step_f64_verlet/128` | 21.9 µs | 0.0% |  | -5.8% |
| `step_f64_verlet/16` | 615 ns | 0.1% |  | +0.1% |
| `stiff_waveguide_new/21` | 71.0 µs | 0.0% |  | +1.5% |
| `stiff_waveguide_new/36` | 679.9 µs | 0.1% |  | +0.2% |
| `stiff_waveguide_new/60` | 219.8 µs | 0.2% |  | +1.4% |
| `stiff_waveguide_new/69` | 4.51 ms | 0.0% |  | +1.7% |
| `stiff_waveguide_new/84` | 722.7 µs | 0.1% |  | +2.2% |
| `swarm_models/ants/200x120_500` | 178.5 µs | 0.2% |  | +6.2% |
| `swarm_models/physarum/512_100k` | 3.57 ms | 0.1% |  | +1.0% |
| `swarm_models/vicsek/4000` | 2.29 ms | 0.1% |  | +0.7% |
| `swarm_step/Brute/1000` | 518.5 µs | 0.1% | 1.9 Melem/s | -32.7% |
| `swarm_step/Brute/10000` | 49.73 ms | 0.1% | 201.1 Kelem/s | -24.2% |
| `swarm_step/Brute/300` | 52.1 µs | 0.8% | 5.8 Melem/s | -21.9% |
| `swarm_step/Brute/3000` | 4.53 ms | 0.1% | 662.6 Kelem/s | -33.5% |
| `swarm_step/Grid/1000` | 530.2 µs | 0.2% | 1.9 Melem/s | +57.5% |
| `swarm_step/Grid/10000` | 6.44 ms | 0.2% | 1.6 Melem/s | +39.5% |
| `swarm_step/Grid/100000` | 83.67 ms | 0.3% | 1.2 Melem/s | +42.8% |
| `swarm_step/Grid/300` | 237.5 µs | 0.1% | 1.3 Melem/s | +104.0% |
| `swarm_step/Grid/3000` | 1.71 ms | 0.4% | 1.7 Melem/s | +40.0% |
| `swarm_step/Sorted/1000` | 117.0 µs | 0.3% | 8.5 Melem/s | -13.7% |
| `swarm_step/Sorted/10000` | 1.83 ms | 0.1% | 5.5 Melem/s | -5.9% |
| `swarm_step/Sorted/100000` | 20.41 ms | 0.0% | 4.9 Melem/s | -8.4% |
| `swarm_step/Sorted/300` | 45.1 µs | 0.2% | 6.7 Melem/s | -17.1% |
| `swarm_step/Sorted/3000` | 456.9 µs | 0.2% | 6.6 Melem/s | -7.8% |
