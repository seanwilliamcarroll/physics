# Barnes–Hut Gravity

Status: **Draft** (M2 stretch, section 8: engine half; the θ-slider
panel waits for the M2 page)
Depends on: `02-core-types.md` (`Force<S>`, `PairwiseGravity`),
`04-testing.md`, `lint-policy.md`
Reference: Barnes, J., Hut, P. (1986). *A hierarchical O(N log N)
force-calculation algorithm.* Nature 324:446–449.
https://doi.org/10.1038/324446a0 (`references.md`)

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
of mass is at distance `d` from `x` is **accepted** (used as one point mass)
when

```text
s / d < θ      evaluated as   s² < θ² d²   (no sqrt, no division)
```

and **opened** (its children visited) otherwise. Small θ opens more cells:
more accurate, more expensive. **θ = 0 never accepts a cell**, so every
body is visited individually: exact direct summation, the same sum as
`PairwiseGravity` up to rounding (summation order differs). The paper
uses θ ≈ 1; values from 0.3 to 1 are common.

**A cell containing the target is never accepted**, whatever θ says. For
θ ≳ 0.7 a body near a corner of a large cell can be far from that cell's
center of mass, pass the test, and then feel its own mass pulling it toward
the cell's center. Opening such cells removes the self-force outright. The
test is exact and cheap: cells are contiguous ranges of Morton keys (below),
so "contains the target" is `key_lo ≤ key ≤ key_hi`.

θ is validated at construction: `BarnesHut::new` returns `None` for θ < 0
(or NaN). It's the parameter a slider will set, so this is the boundary
`type-invariants.md` asks to parse at. θ is stored squared, like ε.

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
crossover n. Measured numbers: **Measurements** below.

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
  `while let Some(node) = nodes.get(cursor)`, and running off the front is
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

Filled in from the tests (`crates/engine/tests/barnes_hut.rs`):
accuracy vs θ, momentum drift, and cost vs `PairwiseGravity`.
