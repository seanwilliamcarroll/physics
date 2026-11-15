# Gravity-loop experiments

Benchmarks `PairwiseGravity`'s build settings across CPU levels and wasm
engines, and keeps the assembly. The settings are the engine's gravity
knobs (`crates/engine/src/force/pairwise/knobs.rs`); how they were
chosen, step by step: `docs/gravity-vectorize.md`.

## What's here

| File | What |
|---|---|
| `run.py` | runs everything on the current checkout (stdlib Python 3) |
| `wasi-node.mjs` | runs the wasm bench in Node, for the `v8` levels |
| `sweep_doc.py` | writes `results/sweep.md` from the two recorded sweeps |
| `results/` | the recorded sweeps (below) |

## Experiments

Each is a setting of the knobs:

| Experiment | `GRAVITY_LOOP` | `GRAVITY_LANES` | `GRAVITY_PLAIN_BELOW` |
|---|---|---|---|
| `default` | (default: `two-pass`) | (default: 16) | (default: 64) |
| `plain` | — | — | 1000000: the plain loop at every size |
| `two-pass-l1` … `two-pass-l16` | `two-pass` | 1, 2, 4, 8, 16 | 1: the loop at every size |
| `blocked-l1` … `blocked-l16` | `blocked` | 1, 2, 4, 8, 16 | 1 |

Tables compare against `plain`. `--experiments sweep` is `plain` and both
loops at every lane count; without `--experiments`, all of the above.

## Levels

| Level | `RUSTFLAGS` | Widest vector (x86-64) |
|---|---|---|
| `default` | none | SSE2: 2 f64 / 4 f32 |
| `x86-64-v3` | `-C target-cpu=x86-64-v3` | AVX2: 4 f64 / 8 f32 |
| `native` | `-C target-cpu=native` | this CPU; AVX-512 if it has it: 8 f64 / 16 f32 |
| `wasm` | none, `--target wasm32-wasip1` | none: wasm without simd128 is scalar |
| `wasm-simd128` | `-C target-feature=+simd128`, wasm | 128-bit: 2 f64 / 4 f32 |
| `v8`, `v8-simd128` | the same two wasm builds, run in Node | as above |

`RUSTFLAGS` replaces `.cargo/config.toml`'s flags, so `wasm` really is
without SIMD. On aarch64 the native levels are `default` and `native`.
The wasm levels need `wasmtime` (Cranelift compiles the wasm), the `v8`
levels the repo's Node (`.nvmrc`; V8's TurboFan compiles it; Node warns
that WASI is experimental, which is expected). Their asm is wasm text.

## Running

On the compute node, in tmux (a tmux command runs in a non-interactive
shell, so nvm is loaded by hand; `nvm install` reads `.nvmrc`):

```sh
tmux new -s gv 'cd ~/physics && git pull && . ~/.nvm/nvm.sh && nvm install && experiments/gravity-vectorize/run.py --perf --experiments sweep --out experiments/gravity-vectorize/results/llm-sweep 2>&1 | tee ~/gv.log; exec bash'
```

On a Mac, with `caffeinate` keeping it awake (`-i`: no idle sleep; `-s`:
no system sleep on mains power; closing the lid still sleeps it). Leave
the machine alone meanwhile:

```sh
cd ~/physics && git pull && . ~/.nvm/nvm.sh && nvm install && caffeinate -is experiments/gravity-vectorize/run.py --experiments sweep --out experiments/gravity-vectorize/results/m4-sweep 2>&1 | tee ~/gv-m4.log
```

A sweep is 11 experiments × up to 7 levels: about three hours.
`--quick`, `--levels`, `--experiments` and `--filter` narrow it
(`run.py --help`). Each run replaces its `--out` folder.

`--perf` (Linux) adds hardware counters for `pairwise_f64/1024` and
`pairwise_f32/1024`: `perf stat` (cycles, instructions, branch misses)
and `perf record` + `perf annotate` (where the cycles go). Ubuntu stops
users using perf by default; `sudo sysctl kernel.perf_event_paranoid=1`
allows it until the next reboot. perf skips the wasm levels.

`--from-log LOG --out DIR` rebuilds a summary from a run's log.

## Results

Each run writes to its `--out` folder:

- `summary.md`: per level, mean times with the change against `plain`;
  `plain` at each level against `default`; sqrt/div instructions in each
  dumped function by width; with `--perf`, IPC and cycles and
  instructions per pair.
- `results.csv`: level, experiment, bench, mean in ns.
- `machine.txt`: CPU, SIMD flags, wasmtime, Node, rustc.
- `asm/`, `perf/`, `<level>/<experiment>/criterion/`: listings, perf
  output, criterion's data.

**Committed:** `summary.md`, `results.csv` and `machine.txt` only, and
`results/sweep.md`. The asm, perf output, logs and criterion's data are
git-ignored and stay on the machine that ran it.

The recorded sweeps, `results/llm-sweep` (Ryzen 7 9700X) and
`results/m4-sweep` (Apple M4), were run before the knobs existed, as
patches, under the experiments' old names: `base` = `plain`, `c-lN` =
`two-pass-lN`, `d-lN` = `blocked-lN`. The arithmetic is the same (the
golden hashes match), though the shipped loops are a little faster: the
lane total became a loop instead of recursion
(`docs/gravity-vectorize.md`, step 8).

To bring results back to the Mac:

```sh
rsync -a llm:physics/experiments/gravity-vectorize/results/llm-sweep experiments/gravity-vectorize/results/
```
