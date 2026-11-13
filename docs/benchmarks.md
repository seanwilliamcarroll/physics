# Benchmarks

What's measured, how to run it, and the numbers as of the last run. The
milestone docs keep the tables that drove their decisions; this file is
the index and the current state.

## Running

| Command | What it does |
|---|---|
| `cargo xtask bench [FILTER]` | Every criterion bench (`cargo bench --workspace --bench '*'`), or those whose names contain FILTER (e.g. `sand_step`), **compared with this machine's record** (`docs/bench/<machine>/`, below) if it has one, else with each benchmark's previous run here. Then a table, and what moved more than 10% (`--threshold N`), faster or slower: reported, never failed. |
| `cargo xtask bench --compare-local` | The same, compared with each benchmark's previous run here instead of the record. |
| `cargo xtask bench --save main` | The same, also kept as a named local baseline `main` (in `target/criterion/`). |
| `cargo xtask bench --baseline main` | Compared with that local baseline instead, and **fails if anything got slower** by more than the threshold. |
| `cargo xtask bench --record` | Any of the above, then this machine's record updated from the run and proposed in a pull request (below). |
| `cargo xtask profile …` | Where the time goes in one example or bench (`profiling.md`). |
| `cargo xtask bench-wasm` | Builds the site, then times the modules in Node: the engine's cluster against criterion's native numbers, then sand, boids, Vicsek, ants and Physarum through their exports (`xtask/bench_modules.mjs`). |

Benchmarks are noisy on a laptop (a few percent run to run, more with
other work going on): **compare on the same machine, idle**, ideally the
compute node. None of this runs in a hook: a full criterion run takes
minutes.

**The table** (after every run; `xtask/src/bench/table.rs` reads it back
from criterion's files under `target/criterion/`):

```
Benchmark                                 Time       ±        Throughput   Change
---------------------------------------------------------------------------------
sand_step/busy/640x360_chunks          1.53 ms    0.1%     151.1 Melem/s    +0.6%
sand_step/settled/640x360_chunks        3.3 µs    0.1%      70.4 Gelem/s    +0.2%
```

- **Time:** the mean time per iteration (criterion's estimate from 100
  samples after a 3 s warm-up).
- **±:** half the mean's 95% confidence interval, as a share of it.
- **Throughput:** what the bench says one iteration processes (cells,
  bodies, samples), per second; blank if it doesn't say.
- **Change:** the mean's change from whatever this run compared with
  (the line under the table says which). Within a few percent is noise;
  criterion's own block above says whether a change is significant.

Criterion's own output (a block per benchmark, with its progress) still
prints above it as each finishes.

## Records

A machine's **record** is what later runs on it compare with by
default: its last recorded results, committed to the repository.

- `docs/bench/<machine>/<benchmark>/`: criterion's own four files for
  each benchmark (`benchmark.json`, `estimates.json`, `sample.json` with
  every sample, `tukey.json`), about 2 KB a benchmark. Every sample is
  kept so a comparison can tell a real change from noise, as criterion
  does with any baseline.
- `docs/bench/<machine>/record.txt`: the rustc, criterion version,
  commit and date it was measured with.
- `docs/bench/<machine>.md`: the same results as a table, to read.

`<machine>` is `hostname -s` in lower case: numbers from different
machines don't compare, so each has its own record. Git's history keeps
the earlier ones (`git log -p docs/bench/llm.md`).

**Comparing:** a plain `cargo xtask bench` copies the record into
criterion's directory as a baseline named `recorded`
(`target/criterion/<benchmark>/recorded/`) and runs criterion with
`--baseline-lenient recorded`: a benchmark the record doesn't have runs
uncompared. On a branch, the record is the one committed there (usually
`main`'s from when you branched): the run says whether the branch is
slower than `main` was. It warns when the record was made with another
rustc or criterion (not like for like).

**Recording:** `cargo xtask bench --record`, on an idle machine (the
compute node), from a commit (it refuses uncommitted changes, and warns
when HEAD isn't `origin/main`).

- A full run replaces the record; a filtered run
  (`--record sand_step`) replaces just the benchmarks it measured and
  keeps the rest, and the table is rebuilt from the whole record.
- It opens a pull request with the record's files, made through GitHub's
  API (`gh api`): nothing in the checkout changes and no hooks run.
  Without a `gh` login it writes the files into `docs/bench/` to commit
  by hand. It never merges.
- GitHub's shared runners are too noisy to record on.

**Upgrading criterion.** It's pinned (`=0.8.2`, `Cargo.toml`) because the
records are its saved files, and that format isn't a public API. After a
bump, run `cargo xtask bench` against an existing record: every
benchmark should show a Change. If criterion can't read a record it
prints an error and skips the comparison, and `xtask` warns "weren't
compared with it". Then re-record on each machine (the old records stay
in git's history).

## The suites

| Crate | Bench | Covers | Drove |
|---|---|---|---|
| `engine` | `step` | `World::step` per scalar and integrator at n = 16, 128, 1024; pairwise gravity; Barnes–Hut θ = 0.5, 1.0; per-call allocation; the broadphase | O(n²) confirmed (~2 ns a pair); Barnes–Hut's crossover (`barnes-hut.md`); M6's broadphase |
| `acoustic` | `fft`, `dispersion`, `piano` | FFT sizes; stiff-string allpass design; 16 piano voices; designing 88 keys | A2's analyzer budget; A3's design-once decision (`14-piano.md`) |
| `sand` | `step` | busy and settled grids, chunks on and off, 640 × 360 and 1920 × 1080 | M9's chunks (~175× settled) |
| `swarm` | `step` | boids by brute force, grid and sorted, 300 to 100k; one step of Vicsek (N = 4000), the ants (200 × 120, 500) and Physarum (512², 100k) at their pages' sizes | S1's grid, the lane loop, `simd128` (`15-swarm.md`); the hot paths in `profiling.md` |

Not covered by criterion (measured by examples, `crates/swarm/examples/`):
native against wasm with and without `simd128` (`timing.rs`), the
transition sweep (`vicsek_sweep.rs`), the ants' evolution
(`evolve_ants.rs`). Where the time goes inside a benchmark:
`profiling.md`.

## Wasm, as of the last run

`cargo xtask bench-wasm`, Node 22, Apple silicon, 2026-11-12:

| Module | Case | Per call |
|---|---|---|
| sand | busy step, 640 × 360 | 0.56 ms (0.97 ms in an earlier run: the grid settles while it's timed, so this one varies) |
| sand | settled step, chunks on | 3.4 µs |
| sand | render | 53 µs |
| boids | sorted step, 10k (page's density) | 2.27 ms |
| boids | grid step, 10k | 4.81 ms |
| boids | brute-force step, 2k | 6.50 ms |
| boids | render, 10k | 0.24 ms |
| vicsek | step, N = 400 | 0.067 ms (0.12 before the health pass) |
| vicsek | step, N = 4000 | 0.76 ms (1.27 before) |
| ants | step, 200 × 120, 500 ants | 0.21 ms (0.68 before: the fields' diffusion, `profiling.md`) |
| ants | render, 600 × 360 | 0.33 ms |
| physarum | step, 512², 100k agents | 3.20 ms (5.89 before: the wraps) |
| physarum | render, 512² | 0.94 ms |

The engine's table (native against wasm, per case) is in
`04-testing.md`, "Benchmarks".
