# Boids Sorted's span edges

Profiled (2026-11-18, the M4 and Zen 5, Sorted at the page's default
10,000 boids and at 100,000), a quarter to a third of a Sorted step is
the edges of the spans the lane loop reads: a boid's candidates are three
spans (a row of three cells each, a dozen boids or so at the page's
density), and each span ends with its leftovers (under a block of 8) one
at a time through the branching scalar rule, and its lanes added into
the sums (an 8-to-1 reduction of seven quantities), three times a boid.
On x86's baseline about 5% more is the grid's cell lookup, whose `floor`
is a library call there.

`run.py` runs it, with the machinery in `experiments/sweep/`.

## Experiments

Build settings (`crates/swarm/src/rules/knobs.rs`), each off by default
(the code as it was):

| Experiment | `SWARM_SPAN` | `SWARM_TAIL` | `SWARM_CELL` |
|---|---|---|---|
| `base` | per-span | scalar | floor |
| `cell` | | | **truncate**: no `floor` (the value is non-negative: truncating is the floor) |
| `span` | **per-boid**: one set of lanes for a boid's three spans, reduced once | | |
| `tail` | | **masked**: the leftovers as one more block, the lanes outside them masked out | |
| `span-tail` | per-boid | masked | |
| `all` | per-boid | masked | truncate |

`cell` is in other code (`Grid::fill`, the coordinates) and exact, so
it's measured alone and in `all`; `span` and `tail` both reshape the
same loop, so their 2 × 2. `span` and `tail` change the order of the
sums (the last bits); a test checks every setting against the scalar
sums (`rules/tests.rs`).

## The code, checked for each build

`results/<machine>/asm/`: rustc's `step_sorted` and `Grid::fill` at each
CPU level, the wasm, and V8's code from it. What each should show:

- the lane loop vector code everywhere (as before);
- `tail`: the masked block vector code too, and no scalar leftover loop
  (but its fallback for a flock under 8);
- `span`: one 8-to-1 reduction a boid, outside the span loop;
- `cell`: no call to `floorf` on x86's baseline (`roundss` needs SSE4.1).
