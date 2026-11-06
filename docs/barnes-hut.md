# Barnes–Hut Gravity

Status: **Draft** (M2 stretch, section 8: engine half; the θ-slider
panel waits for the M2 page)
Depends on: `02-core-types.md` (`Force<S>`, `PairwiseGravity`),
`04-testing.md`, `lint-policy.md`
Reference: Barnes, J., Hut, P. (1986). *A hierarchical O(N log N)
force-calculation algorithm.* Nature 324:446–449.
https://doi.org/10.1038/324446a0; the opening test's `δ`: Salmon & Warren
(1994), *Skeletons from the Treecode Closet* (`references.md`)

## The idea

`PairwiseGravity` sums every pair: n(n−1)/2 interactions per step, O(n²).
Barnes and Hut's observation: a distant group of bodies pulls almost
exactly like one body of the group's total mass at its center of mass. If
groups are the cells of a spatial tree, each body only needs O(log n)
interactions: near bodies one by one, farther regions as ever-larger
cells. Total cost O(n log n), at the price of an approximation whose size
one parameter, θ, controls.

## The quadtree

The 2D version of the paper's octree. The root is the smallest square
containing every dynamic body; each cell splits into four equal quadrants,
recursively, until each leaf holds one body. Every cell stores its total
mass `M` and center of mass `X = Σ mᵢxᵢ / M` (the *monopole*; the paper
uses only this, and so do we: higher multipoles buy accuracy per cell at
more cost per interaction, a refinement for later).

**Path compression:** a cell whose bodies all fall in one quadrant isn't
stored; the tree jumps straight to the smallest cell that actually splits
them. Every stored cell then has at least two children, so the tree has at
most `2n − 1` nodes, however close two bodies are.

**Depth limit:** 32 levels (two bits per level in a `u64` key, below). Bodies
that still share a cell at the deepest level (closer than `side / 2³²`, or
exactly coincident) go into one *bucket* cell whose bodies are summed
directly. That's exact, not approximate, and it is what makes coincident
bodies safe: without a limit, splitting two bodies at the same point never
terminates.

## Opening criterion θ

Walking the tree for a target body at `x`, a cell of side `s` whose center
of mass is at distance `d` from `x`, and **`δ` from the cell's geometric
center**, is **accepted** (used as one point mass) when

```text
s / (d − δ) < θ     evaluated as   (s + θ δ)² < θ² d²   (no sqrt, no division)
```

and **opened** (its children visited) otherwise. Both sides of the
squared form are non-negative, so squaring keeps the order, and `d ≤ δ`
fails it, as it should. Small θ opens more cells: more accurate, more
expensive. **θ = 0 never accepts a cell**, so every body is visited
individually: exact direct summation, the same sum as `PairwiseGravity`
up to rounding (summation order differs). The paper uses θ ≈ 1; values
from 0.3 to 1 are common.

**Why `δ`** (audit after A3). The paper's test is `s / d < θ`, with `d`
measured to the center of mass. A cell whose bodies bunch on one side
(its center of mass far from its middle) can then pass for a target just
outside its *other* side, right beside some of its bodies, and the point
mass is a poor stand-in there. Salmon & Warren (1994) showed the classic
test's error has no bound in such configurations. Measured here: a cell
with 90% of its mass at its far edge, the target 0.6 cell widths outside
its near edge, θ = 0.7: the classic test accepted it, 25.5% off; with
`δ` it's opened, 0.03% off (`a_target_just_outside_a_lopsided_cell_is_accurate`).
For an evenly filled cell `δ ≈ 0` and nothing changes. The build tracks
each cell's geometric center exactly as the Morton key steps (a quarter of
the side toward each quadrant), so `δ` costs one `length` per cell built
and one multiply-add per cell visited.

**A cell containing the target is never accepted**, whatever θ says. For
θ ≳ 0.7 a body near a corner of a large cell can be far from that cell's
center of mass, pass the test, and then feel its own mass pulling it toward
the cell's center. Opening such cells removes the self-force outright. The
test is exact and cheap: cells are contiguous ranges of Morton keys (below),
so "contains the target" is `key_lo ≤ key ≤ key_hi`.

θ arrives as an `OpeningAngle<S>` (`params/`): finite and `≥ 0`, checked
where it's made (the θ slider's value at the wasm boundary), so
`BarnesHut::new` can't fail. θ is stored as is and squared (the test uses
both), like ε. ε arrives already checked, as a `Softening<S>`, the same as
for `PairwiseGravity::new`.

## Softening for cells

A cell is treated as a point mass at its center of mass, with the same
Plummer softening as a single body:

```text
a = G M r / (|r|² + ε²)^(3/2),   r = X − x
```

So θ = 0 reproduces the softened pairwise force exactly, and softening
means the same thing for both forces. For an accepted cell `d > s / θ`,
so with ε small next to the cell size the softening term barely matters;
it matters for close interactions, which are always individual bodies.
`d` in the opening criterion is the *unsoftened* distance: softening
changes the force, not the geometry of "far away".

## Accuracy vs cost

Each accepted cell contributes a monopole error of relative size about
`(s/d)² < θ²` from the next (quadrupole) term (the dipole term vanishes
about the center of mass), so the force error should grow roughly like θ².
Cost: a body visits O(1/θ²) cells per tree level, O(log n) levels: O(n log
n / θ²) per step, plus O(n log n) to build the tree (a sort).
Direct summation is O(n²) with a smaller constant, so it wins below some
crossover n: about 200–256 bodies at θ = 0.5 (**Measurements** below).

## What it gives up: momentum

`PairwiseGravity` computes one force per pair and applies it ±, so
Newton's third law holds by construction and total momentum changes only
by rounding (`docs/04-testing.md`, the property tests'
`steps · ε · Σm|v|` law). Barnes–Hut breaks that symmetry: body *i* may
feel cell *C* as a monopole while the bodies in *C* each feel *i* exactly.
The forces are no longer equal and opposite, so **momentum is not
conserved**, and the property tests' momentum law does not apply to it.

What holds instead: each step changes momentum by

```text
Δp = h Σ mᵢ aᵢ = h Σ mᵢ (aᵢ − aᵢ*)        (Σ mᵢ aᵢ* = 0 for the exact forces a*)
|Δp| ≤ h Σ mᵢ |aᵢ − aᵢ*|
```

so the drift over a run is bounded by the summed force error, plus
rounding. The tests check this inequality step by step against a
`PairwiseGravity` reference, and record the measured drift. The drift is
systematic-plus-random, not a rounding-level random walk: expect it to
grow with θ and with time. The center of mass drifts accordingly. Energy
is no longer exactly the softened potential's either; for a demo panel
those are the costs, and θ is the knob.

## Determinism

The result must be bit-identical for identical input (`docs/00-scope.md`,
goal 2), on every platform. Tree builds are where that usually breaks:

- **No hashing.** No `HashMap` iteration order, no pointer-address
  order. The tree is built from a **sorted array**: each body gets a
  64-bit Morton key (its quadrant at each of 32 levels, two bits per
  level: the Z-order curve), and bodies are sorted by `(key, index)`.
  That pair is unique, so the sorted order is fully determined by the
  input, independent of the sort algorithm (`sort_unstable` is fine and
  doesn't allocate).
- **Keys from comparisons, not casts.** A key bit is `x ≥ cell center`,
  with the centers computed by the same `S` additions and halvings for
  every body. No float-to-integer quantization, no `to_f64` in the
  force path (`02-core-types.md`: `to_f64` is a readout), and it works
  unchanged for fixed point.
- **Fixed summation order.** Child aggregates are added in quadrant
  order; each body's acceleration is summed in tree-walk order.
- **No transcendental functions.** One `sqrt` per interaction (correctly
  rounded under IEEE 754), no `powf`/`sin`/`cos`.

A golden hash of a Barnes–Hut cluster run sits next to the others in
`tests/determinism.rs`, so `cargo xtask test-wasm` checks it on wasm too.
Permuting the input changes the result in the last bits (ties and sums
regroup), as it does for `PairwiseGravity`.

## f32

The tree itself is exact in topology: keys come from comparisons. In f32,
cell centers stop changing once the half-size drops below an ulp of the
coordinate (about level 24 for a unit-scale scene), so deeper levels can't
separate bodies; they then share a bucket and are summed directly. That
costs time, not accuracy. Cell aggregates `Σ m x` round like any sum; the
approximation error at practical θ (≥ 0.3) is far above f32 rounding, so
f32 and f64 should show the same θ dependence. Measured below.

## Data structure and the lint policy

Library code may not index, unwrap, or panic (`lint-policy.md`). A tree
with index links (`children: [u32; 4]` into an arena) needs a `.get()` at
every hop, each with a "can't happen" branch. Instead:

- **Postorder arena.** The build pushes nodes into one `Vec` in
  postorder (children before their parent), and each node records the size
  of its subtree. Read backwards, that array is a preorder walk: from a
  node at `i`, "open" is `i − 1` (its last child) and "accept" is
  `i − size` (skip the subtree). The walk is one loop,
  `while let Some(node) = cursor.checked_sub(1).and_then(|i| nodes.get(i))`
  (the cursor is one past the next node), and running off the front is
  how it ends: the `None` case is the loop exit, not an unreachable
  error branch. No stack, no recursion in the walk, and memory is read
  in one direction.
- **Build by slices.** Sorted by Morton key, each cell's bodies are a
  contiguous slice and its quadrants are consecutive runs:
  `chunk_by` splits them. The build is recursive (depth ≤ 33) and returns
  each subtree's mass and `Σ m x` to its parent, so no node is ever looked
  up again after it's pushed.
- **Alternative considered:** a `Box`ed recursive tree (`children:
  [Option<Box<Node>>; 4]`) also needs no indexing, but allocates once per
  node per step, scatters nodes across the heap, and walks recursively.

No `#[expect]` is needed.

## Allocation per step

Each `accumulate` call allocates two `Vec`s: the dynamic bodies (n) and the
node arena (capacity `2n`, the most it can need, so it never regrows).
`PairwiseGravity` already allocates one per call. `Force::accumulate`
takes `&self`, so reusing buffers across calls would need interior
mutability (`RefCell`), which the trait shape doesn't invite; worth it only
if a profile shows allocation mattering next to the O(n log n) work.

## Measurements

From `crates/engine/tests/barnes_hut.rs`, re-measured with the `δ` test
(2026-11-06, audit after A3; first measured 2026-11-02 with the classic
one), aarch64-apple-darwin, Rust 1.99.1. Scene: `scenarios::cluster` (uniform disk of radius 2 m,
ε = 0.1 m), with `PairwiseGravity` as the exact reference.

### Accuracy vs θ

Force error after one evaluation, worst over seeds 1–3. Two measures:

- **max / RMS**: `max |a_tree − a_direct|` over bodies, divided by the
  RMS of `|a_direct|`. This is what the tests bound.
- **per-body relative**: `|a_tree − a_direct| / |a_direct|` for each
  body; median and max. The max is dominated by bodies near the center,
  whose pulls almost cancel (small `|a_direct|`), so it reflects
  cancellation more than the approximation, and grows with n.

| θ | max / RMS, n = 64 | 256 | 1024 | median rel., n = 1024 | max rel., n = 1024 | test bound (max / RMS) |
|---|---|---|---|---|---|---|
| 0.3 | 0.0086 | 0.0101 | 0.0100 | 0.38% | 0.57 | 0.13 |
| 0.5 | 0.0506 | 0.0304 | 0.0330 | 1.3% | 2.00 | 0.5 |
| 0.8 | 0.104 | 0.0939 | 0.0864 | 3.5% | 2.04 | 2.0 |
| 1.0 | 0.155 | 0.180 | 0.175 | 5.8% | 5.09 | 3.0 |

Against the classic test (first measurement: 0.0127, 0.0487, 0.198, 0.302
worst max / RMS; medians 0.42%, 1.5%, 4.0%, 6.4%), `δ` roughly halves the
worst case at θ = 0.8 and 1.0, where cells are accepted closest, and
trims the medians everywhere. Two numbers grew: θ = 0.5's worst at n = 64
(0.0487 → 0.0506) and its max relative at n = 1024 (1.46 → 2.00), from
different accept decisions on a few cells (that max is the
cancellation-dominated measure above).

f32 matches f64 to three digits: the approximation error is far above
f32 rounding, as expected. The error rises faster than θ² over this
range (×3.3–5.6 from θ = 0.3 to 0.5 across the three sizes, against
2.8 for θ²). θ = 0 matches
`PairwiseGravity` to 2.7e-16 (f64) and 2.1e-7 (f32) of the largest
acceleration (unit test).

These errors are larger than a quadrupole-corrected code would give, so
before trusting the first (classic-test) measurement we checked against an
independent implementation: a plain recursive Python quadtree with the
same criterion, on the same 256 bodies, agreed with this one to 1.7e-15 of
RMS `|a|` at θ = 0.5. They are the monopole method's errors with `s` the
full cell side. The `δ` test changes only which cells are accepted (the
same tree, the same monopoles), and is checked by θ = 0's exactness, the
errors growing with θ (both tests), and the lopsided-cell test.

### Momentum

64 bodies, 1000 steps of 1/60 s (seed 1); drift `|p(t) − p(0)|` as a
fraction of `Σ m|v|`:

| θ | f64 | f32 |
|---|---|---|
| 0 | 2.3e-16 | 2.2e-7 |
| 0.3 | 8.8e-4 | 2.7e-3 |
| 0.5 | 5.2e-3 | 8.7e-3 |
| 0.8 | 2.6e-2 | 1.2e-2 |
| 1.0 | 7.0e-2 | 3.1e-2 |

For scale, the cluster's initial momentum is about 4e-3 of `Σ m|v|`:
from θ = 0.5 up, Barnes–Hut changes the total momentum by more than the
cluster started with, so the center of mass visibly wanders off its
straight line. The drift is 0.7–1.1% of the bound `Σ h Σ mᵢ|aᵢ − aᵢ*|`
(force errors mostly cancel in the sum), and θ = 0 stays ~400x inside the
property tests' rounding law. The tests assert the bound at θ = 0.5, a
measured cap of 0.1 there, and the rounding law at θ = 0. f32 and f64
differ by up to ~2.5x above θ = 0 because the cluster is chaotic: the two
runs diverge, and so do their drifts.

### Cost

`cargo bench -p engine --bench step -- 'barnes_hut|pairwise'`
(criterion, release, aarch64-apple-darwin, Rust 1.99.1): mean per
`accumulate` call on `scenarios::cluster` (seed 1), and the speedup over
`PairwiseGravity` on the same bodies:

| n | pairwise f32 | θ = 0.5 f32 | θ = 1.0 f32 | pairwise f64 | θ = 0.5 f64 | θ = 1.0 f64 |
|---|---|---|---|---|---|---|
| 128 | 17.0 µs | 26.6 µs (0.64x) | 16.7 µs (**1.02x**) | 17.9 µs | 27.5 µs (0.65x) | 17.3 µs (**1.03x**) |
| 1024 | 1.02 ms | 437 µs (2.3x) | 207 µs (4.9x) | 1.08 ms | 450 µs (2.4x) | 206 µs (5.2x) |
| 4096 | 9.69 ms | 3.80 ms (2.5x) | 1.69 ms (5.7x) | 13.2 ms | 4.00 ms (3.3x) | 1.74 ms (7.6x) |

Re-measured with the `δ` test (2026-11-06): it opens more cells, so
Barnes–Hut is 4–7% slower at θ = 0.5 and up to ~24% at θ = 1.0, the
largest cost where it fixes the most error. Pairwise is unchanged (within
2% of the first run).

The bench covers 128, 1024 and 4096 only. To place the crossover, a
one-off run of the same groups at n = 256 and 512 (not kept in the
bench):

| n | pairwise f32 | θ = 0.5 f32 | θ = 1.0 f32 | pairwise f64 | θ = 0.5 f64 | θ = 1.0 f64 |
|---|---|---|---|---|---|---|
| 256 | 84.2 µs | 70.0 µs (**1.20x**) | 38.9 µs (2.2x) | 84.8 µs | 70.7 µs (**1.20x**) | 39.5 µs (2.1x) |
| 512 | 347 µs | 170 µs (2.0x) | 86.0 µs (4.0x) | 353 µs | 172 µs (2.1x) | 87.7 µs (4.0x) |

(Barnes–Hut re-measured with the `δ` test; pairwise from the first run,
its code unchanged.)

**Crossover** (bold: first measured n where Barnes–Hut wins): at θ = 0.5,
~200–256 bodies (1.2x at 256, 2x by 512); at θ = 1.0, break-even at 128
and 2x by 256. Below that,
building the tree (two allocations, a sort, 32-level keys) costs more
than it saves. For the M2 demo's "a few hundred bodies", θ = 0.5 is at
best ~1.2–2x faster, for a median force error of ~1.3%; the payoff
is at thousands of bodies. Growth from n = 1024 to 4096 (4x bodies) is
8.7x (f32) and 8.9x (f64) for Barnes–Hut at θ = 0.5, against 9.5x and
12.2x for direct summation (ideal 16x); n log n alone predicts 4.8x,
which suggests memory effects (the walk's scattered reads) at this size;
not profiled.
