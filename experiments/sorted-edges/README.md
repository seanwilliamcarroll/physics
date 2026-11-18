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

## Round 1 (2026-11-18): `results/{llm,m4}`

Mean step time against `base`, llm (Zen 5); the M4's `span-tail` and
`all` runs were disturbed (the machine in use: native `span-tail` +149%
at 10k where `all`, the same code there, is −3%) and are to be rerun.

| level | boids | cell | span | tail | span-tail | all |
|---|---|---|---|---|---|---|
| SSE2 | 10k | −6% | −11% | −22% | −14% | −21% |
| | 100k | −5% | −14% | −12% | −20% | −26% |
| AVX2 | 10k | 0% | −17% | −29% | −30% | −31% |
| | 100k | 0% | −18% | −19% | −31% | −32% |
| AVX-512 | 10k | −1% | −18% | −35% | −39% | −39% |
| | 100k | 0% | −16% | −24% | −38% | −38% |
| V8 | 10k | 0% | −1% | +4% | −4% | +2% |
| | 100k | −1% | −2% | −7% | −4% | +4% |

The M4 native: `span` −16% at 10k and 100k, `tail` −7%, −14%.

- The code as expected in every build: `span`'s reduction after the
  span loop (in `base` inside it); `tail`'s block straight vector code
  natively and in V8; `cell` without `floorf` at SSE2 (two calls a boid
  before), and nothing to remove above it.
- `tail` takes the scalar leftovers' branches: Zen 5's branch misses
  3.6% → 0.3%, IPC 3.0 → 4.2–4.75 (`perf stat`, 10k).
- llvm-mca (`-mcpu=znver5`, LLVM 21) put the masked block at 1–1.5 lane
  passes with AVX2 and AVX-512, 1.5–3 at SSE2 (its mask built from
  64-bit lane-number compares: two into a mask register with AVX-512,
  emulated at SSE2): the order measured, though mca can't see the
  mispredicts that made the gain.
- 1,000 boids (about one a span): `tail` +25–49% (a block of 8 for one
  or two), `all` +1% at SSE2, −4% to −13% above it.
- V8: wasm has 16 lanes, against spans of about 12; its mask rebuilds
  each lane-number constant (`movq`, `vpinsrq`) and emulates unsigned
  compares (`vpmaxud`, `vpcmpeqd`, `vpxor`) every block.

Kept (`rules/tuning.rs`): natively `all`; in wasm `base` with the cell
lookup truncating (the same cells; `f32.floor` is an instruction there).

## Round 2: the mask from a table, and 8 lanes in wasm

Every knob set in every build (unset, each is now the target's).

| Experiment | as | and |
|---|---|---|
| `table` | `all` | `SWARM_TAIL=table`: the mask a window of 8 (or 16) on a table of zeros then ones, one load, no compares |
| `all-8` | `all` | `SWARM_LANES=8` (in wasm; natively Sorted has 8 already) |
| `table-8` | `table` | `SWARM_LANES=8` |

Against `base` and `all`, larger flocks first (10k and 100k: 1k is
tens of microseconds).
