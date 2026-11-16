# Gravity-loop experiments

`PairwiseGravity`'s build settings, swept across CPU levels and wasm
engines. The settings are the engine's gravity knobs
(`crates/engine/src/force/pairwise/knobs.rs`); how they were chosen, step
by step: `docs/gravity-vectorize.md`. `run.py` runs it, with the shared
machinery in `experiments/sweep/` (its README has the levels, commands
and output).

| File | What |
|---|---|
| `run.py` | the driver: the experiments below |
| `sweep_doc.py` | writes `results/sweep.md` from the two first recorded sweeps |
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
Benches: `pairwise_f32` and `pairwise_f64` at 16, 128, 1,024 and 4,096
bodies; `--perf` profiles both at 1,024.

```sh
experiments/gravity-vectorize/run.py --experiments sweep
```

A sweep is 11 experiments × up to 7 levels: about three hours.

## Results

- `results/llm-sweep` (Ryzen 7 9700X) and `results/m4-sweep` (Apple M4):
  run before the knobs existed, as patches, under the experiments' old
  names: `base` = `plain`, `c-lN` = `two-pass-lN`, `d-lN` = `blocked-lN`.
  The arithmetic is the same (the golden hashes match), though the
  shipped loops are a little faster: the lane total became a loop
  instead of recursion (`docs/gravity-vectorize.md`, step 8).
  `results/sweep.md` puts them side by side.
- `results/llm-main`, `results/m4-main`: the knobs swept on `main`
  (`docs/gravity-vectorize.md`, step 10).
