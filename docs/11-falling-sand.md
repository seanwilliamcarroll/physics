# 11 — Falling sand

Status: **Draft** (M9.1). Decisions: TASKS.md, M9. Depends on nothing in
the engine: a cellular automaton, not a solver.

M9 is a different kind of simulation. No forces, no velocities, no
floats: every cell holds a material, and each step every cell looks at
its neighbours and maybe swaps with one. Piles, flows and levels emerge
from those local rules. The problems are the automaton's own: the order
cells are visited in, so the rules don't push everything one way;
randomness that stays reproducible; and doing millions of cells a step,
which makes it a memory and cache problem rather than a numerical one.

## The grid

A `width × height` grid, row-major, **row 0 at the top** (screen order),
one byte per cell. Outside the grid is solid: a closed box. Fixed size at
creation (TASKS decision 7).

A cell's byte:

```text
 7 6 5 4 3 2 1 0
[  shade  ][ mat ]
 4 bits     3 bits (bit 7 spare)
```

- **material** (3 bits, 8 values): empty, sand, water, stone; lava and
  steam in section 4; two spare.
- **shade** (4 bits): a per-grain variation in colour, chosen when the
  cell is painted and moving with it, so sand reads as grains and a
  moving pile shows its motion. Rendering only; the rules ignore it.

No floats anywhere in the rules, so a step is bit-identical on every
platform by construction (TASKS decision 2): goldens are hashes of the
grid bytes, native and wasm.

## The rules

Each material's rule, tried in order; the first that applies moves the
cell by **swapping** it with the target (so nothing is ever created or
destroyed by movement, the conservation tests' premise):

| Material | Rule |
|---|---|
| empty | none |
| stone | none: static |
| sand | **down** if the cell below is empty or water; else **diagonally down**, both sides tried in a random order, each needing the diagonal and the side next to it to let it pass (no squeezing through a corner); else stay |
| water | **down** if empty; else **diagonally down**, as sand; else **sideways** up to `DISPERSION` cells (our choice: 3, measured on the level test) in a random direction, stopping at the first obstacle, the other direction if that's blocked; else stay |

Sand sinks through water (a swap: the water rises in its place). Water
doesn't sink through sand. Density as an ordering (empty < water < sand)
is the general form; M9 needs only these.

## Order: bottom-up, alternating, with a moved-here mark

The update is in place (one buffer, as every falling-sand game does: a
double buffer can't express "two grains wanted the same empty cell"
without a resolution rule of its own). In place, the visiting order
matters, three ways:

1. **Bottom-up.** Scanning from the top, a grain falls one row, is met
   again in the next row, and falls again: a column falls in one step.
   From the bottom, each grain moves once a step, and a falling column
   keeps its shape (Noita's developers: the world "has to" be updated
   bottom-up).
2. **Alternating direction.** Sweeping every row left to right, the left
   neighbour always moves first and takes the contested cell: piles lean,
   and water drifts one way. The direction alternates **each row and each
   step** (row `y` of step `s` runs left-to-right when `(y + s)` is even).
   Measured in section 2: a pour at the centre piles symmetrically.
3. **A moved-here mark.** A grain that moves sideways *in* the scan
   direction, or up (steam, section 4), lands where the scan hasn't been
   yet, and would be moved again. A bit per cell, **set where something
   moves to**, and checked before updating a cell, stops that. It's a
   separate bitset, cleared each step (1 bit a cell: 29 KB at 640 × 360).

   **Not** the plan's parity bit in the cell's byte (flip a global bit
   each step, a cell is "updated" when its bit matches): that works only
   if every cell is visited every step. With sleeping chunks (below),
   a cell untouched for two steps has a stale parity that looks current,
   and it would be skipped once when its chunk wakes. Noita's write-up
   weighs a per-frame counter in each cell for this (and avoids it with
   its threading scheme); a byte has no room for one.

## Randomness, by position

The random choices (which diagonal first, which way to disperse) come
from a hash of `(seed, step, x, y)`: `SplitMix64`'s mixer (`math`),
counter-based rather than a stream. A stream would make every later draw
depend on how many cells drew before; skip a sleeping chunk and the rest
of the step changes, so the chunked and full updates (below) couldn't be
bit-identical. Keyed by position, each cell's draw is the same whatever
else is updated. The bias test checks the choice is fair.

## Chunks

The grid in **32 × 32 chunks**, each with an awake flag. A step updates
only awake chunks. A chunk stays awake for the next step if anything in
it changed this step, and **a change wakes the chunk's eight
neighbours** too: a rule reads up to `DISPERSION` cells away (water
sideways), well within one chunk. A painted cell wakes its chunk and
neighbours.

**Why it's exact, not an approximation:** a chunk sleeps only after a
step in which none of its cells moved. A cell that didn't move had no
legal move *for any random choice* (the rules try both sides), so with
its neighbourhood unchanged it still has none. Anything that changes a
neighbourhood wakes the chunk first. So skipping sleeping chunks changes
nothing, and the test (section 3) is that it's **bit-identical** to
updating every cell, over random grids and random paint.

Noita's chunks are 64 × 64 with a dirty rectangle each, and its threads
take chunks in a four-pass checkerboard so no two write the same cells
(80.lv, after the GDC talk). M9 is single-threaded (`docs/workers.md`);
the chunk layout leaves that door open.

## Conservation, and its exceptions

Movement is swaps, so **every material's count is constant** while
nothing is painted: the core test, over long random runs. Painting
changes counts by construction (the brush reports what it wrote).
Section 4's reactions break per-material conservation on purpose
(lava + water → stone + steam; steam ↔ water): they're tested by their
own accounting, each reaction changing counts by exactly its recipe.

## Rendering

An RGBA buffer, one `u32` per cell: the material's colour, varied by the
shade bits, written by Rust, blitted by the page with `putImageData` onto
a canvas the size of the grid, scaled up by CSS with
`image-rendering: pixelated` (`site/js/pixels.ts`, shared later with A4
and the swarm track). The whole buffer is refreshed each frame to start
with; only awake chunks need it, if the cost shows.

## Costs to measure

- **Cells per second**, native and wasm, for a busy grid (a pour) and a
  settled one, with and without chunks. Done when 60 Hz holds at the
  page's default size while painting.
- **Default size:** about 640 × 360 (230k cells, 2 px a cell on a
  1280-px page); a stress case up to 1920 × 1080 (2M). Measured before
  choosing.

## As built (M9.2, `crates/sand`, `tests/automaton.rs`)

- **Conservation:** every material's count constant at every step over
  2,000 steps of random 80 × 60 grids (30% sand, 30% water, 10% stone).
- **Bottom-up:** a column of 10 grains in the air falls exactly one row
  a step, keeping its shape; water moves at most `DISPERSION` (3) a step.
- **No bias:** 3,000 grains poured at the centre, a grain a step, settle
  (a step with no moves) about 80 steps after the pour; the left-right
  imbalance is at most 0.60% of the mass and the centre of mass within
  0.075 cells of the pour, over four grids (bounds ~5×).
- **Levels:** 400 water cells poured at one wall of a 60-wide box end
  6–7 deep in every column (the mean 6.67).
- **Density:** sand sinks to the bottom of a water column; water on sand
  stays on top. Stone never moves.
- **Golden** for a scripted scene (two spouts, a shelf, 600 steps), the
  same on wasm32 (`cargo xtask test-wasm` now runs `sand`'s tests).
- The randomness is fair: the side bit over a 200 × 200 patch is 0.5013.

## Alternatives considered

- **Margolus neighbourhoods** (Toffoli & Margolus 1987): the grid in 2 × 2
  blocks, offset by one cell every other step, each block updated by a
  rule on its four cells alone. No order dependence and no flags at all,
  and conserving by construction if the block rule permutes its cells;
  parallel trivially. Not chosen: water's sideways dispersion reaches
  beyond a block, so liquids level slowly (one cell per step at best),
  and the scan order is the thing worth showing here. Noted for M10,
  whose CA panel compares models.
- **Double buffering** (the swarm track's choice for agents): order-free,
  but two grains wanting one empty cell need a conflict rule, and sand
  would need it every step.

## Out of scope

Velocity and momentum (cells move by rule, not force; M10's DEM panel
has those); temperature, pressure and gases beyond steam; threads and
the GPU.

## References

- Purho, P. (2019), *Exploring the Tech and Design of Noita*, GDC 2019,
  Independent Games Summit. https://gdcvault.com/play/1025695/Exploring-the-Tech-and-Design
  (free on GDC's YouTube channel).
- 80.lv (2019), *Noita: a game based on falling sand simulation* (the
  talk's technical points: bottom-up updates, 64 × 64 chunks with dirty
  rectangles, the four-pass checkerboard).
  https://80.lv/articles/noita-a-game-based-on-falling-sand-simulation/
- Toffoli, T. & Margolus, N. (1987), *Cellular Automata Machines: A New
  Environment for Modeling*, MIT Press. doi:10.7551/mitpress/1763.001.0001
  (the Margolus neighbourhood has its own chapter).
