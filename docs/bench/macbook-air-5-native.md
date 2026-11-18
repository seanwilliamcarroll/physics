# Benchmarks, 2026-11-17, macbook-air-5-native

- **Commit:** `ceb90645` (swarm bench: every case steps the same warmed state (a clone per iteration, untimed), not one model on and on (a moving target: ±9-16% where everything else was ±1%; now ±0.1%); developed warm-ups (flocks 1,000 steps, Vicsek 3,000, ants 1,000, Physarum 300) (#315))
- **Machine:** Darwin arm64, 10 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** native (`-C target-cpu=native`)
- **Run:** `cargo xtask bench --level native swarm_`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from each benchmark's previous run. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `swarm_models/ants/200x120_500` | 187.9 µs | 0.2% |  |  |
| `swarm_models/physarum/512_100k` | 2.76 ms | 0.2% |  |  |
| `swarm_models/vicsek/4000` | 982.9 µs | 0.2% |  |  |
| `swarm_step/Brute/1000` | 455.0 µs | 0.2% | 2.2 Melem/s |  |
| `swarm_step/Brute/10000` | 44.04 ms | 0.3% | 227.0 Kelem/s |  |
| `swarm_step/Brute/300` | 43.6 µs | 0.2% | 6.9 Melem/s |  |
| `swarm_step/Brute/3000` | 3.98 ms | 0.3% | 752.9 Kelem/s |  |
| `swarm_step/Grid/1000` | 226.0 µs | 0.3% | 4.4 Melem/s |  |
| `swarm_step/Grid/10000` | 4.52 ms | 0.3% | 2.2 Melem/s |  |
| `swarm_step/Grid/100000` | 56.67 ms | 1.7% | 1.8 Melem/s |  |
| `swarm_step/Grid/300` | 49.7 µs | 0.3% | 6.0 Melem/s |  |
| `swarm_step/Grid/3000` | 1.02 ms | 0.3% | 2.9 Melem/s |  |
| `swarm_step/Sorted/1000` | 84.4 µs | 0.9% | 11.9 Melem/s |  |
| `swarm_step/Sorted/10000` | 1.05 ms | 0.3% | 9.5 Melem/s |  |
| `swarm_step/Sorted/100000` | 15.28 ms | 0.3% | 6.5 Melem/s |  |
| `swarm_step/Sorted/300` | 24.8 µs | 0.5% | 12.1 Melem/s |  |
| `swarm_step/Sorted/3000` | 283.1 µs | 0.2% | 10.6 Melem/s |  |
