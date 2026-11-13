# 11 — Falling sand

Status: **Adopted** (M9.1; as built: the automaton M9.2, chunks M9.3,
lava and steam M9.4, `sand.wasm` M9.5, the page M9.6; each has an "as
built" section below). Depends on nothing in the engine: a cellular
automaton, not a solver.

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
creation.

A cell's byte:

```text
 7 6 5 4 3 2 1 0
[  shade  ][ mat ]
 4 bits     3 bits (bit 7 spare)
```

- **material** (3 bits, 8 values): empty, sand, water, stone; lava and
  steam in M9.4; two spare.
- **shade** (4 bits): a per-grain variation in colour, chosen when the
  cell is painted and moving with it, so sand reads as grains and a
  moving pile shows its motion. Rendering only; the rules ignore it.

No floats anywhere in the rules, so a step is bit-identical on every
platform by construction: goldens are hashes of the
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
   Measured in M9.2: a pour at the centre piles symmetrically.
3. **A moved-here mark.** A grain that moves sideways *in* the scan
   direction, or up (steam, M9.4), lands where the scan hasn't been
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
nothing, and the test (M9.3) is that it's **bit-identical** to
updating every cell, over random grids and random paint.

Noita's chunks are 64 × 64 with a dirty rectangle each, and its threads
take chunks in a four-pass checkerboard so no two write the same cells
(80.lv, after the GDC talk). M9 is single-threaded (`docs/workers.md`);
the chunk layout leaves that door open.

## Conservation, and its exceptions

Movement is swaps, so **every material's count is constant** while
nothing is painted: the core test, over long random runs. Painting
changes counts by construction (the brush reports what it wrote).
M9.4's reactions break per-material conservation on purpose
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

## Chunks as built (M9.3)

- **Exact:** a property test runs random grids (20–110 × 20–90, so edge
  chunks are partial) with random paint between steps, chunked against
  every-cell, and compares every cell after every step: identical, at
  500 cases. One subtlety found writing it: a move must wake its
  neighbours for **the rest of this step** as well as the next. A gap
  opened under a grain in a sleeping chunk above is filled in the same
  step by the full update, since the scan is bottom-up and reaches that
  grain later; waking only for the next step would be a step late.
- **Skipping** goes a chunk at a time (32 cells) along a row, checking
  awake on reaching each chunk, so the order is the same as cell by cell.
- **Measured** (`cargo bench -p sand`, native, Apple silicon):

  | Grid | Busy (first step of a 30% fill) | Settled, chunks | Settled, every cell |
  |---|---|---|---|
  | 640 × 360 | 1.32 ms (175 M cells/s) | 3.2 µs | 569 µs |
  | 1920 × 1080 | 12.5 ms (165 M cells/s) | 27 µs | 5.15 ms |

  Busy grids are all awake, so chunks cost nothing and save nothing;
  settled, they cut a step about 175×. The default 640 × 360 fits a 60 Hz
  frame busy with room to spare; 1920 × 1080 busy is near the budget, and
  the step budget slows it rather than freezing it. Wasm: "The page as
  built", below.

## Lava and steam as built (M9.4)

| Material | Rule |
|---|---|
| lava | if water touches it (below, left, right, above, first found): the lava becomes **stone** and that water **steam**; else it flows like water but on one step in `LAVA_FLOW_ONE_IN` (2), a cell sideways at most |
| steam | water upside down: **up** into empty or through water (swapping it down); else diagonally up; else sideways; blocked, it **condenses** to water, 1 in `CONDENSE_ONE_IN` (64) a step |

Both chances are our choices: lava visibly slower (a 10 × 9 block
spreads 44 cells in 60 steps, water 112), a cloud lingering about a
second. **Chunks stay exact** with them: a cell that could still change
by chance (lava waiting on its coin, blocked steam) keeps its own chunk
awake though nothing moved (`Chunks::keep`); the equivalence property
test now draws every material and still matches at 500 cases.

**The accounting** replaces per-material conservation: sand; water +
steam; lava + stone. All three hold at every step of random grids of
every material (`tests/lava.rs`). A second golden pins a lava scene,
the same on wasm32.

## The wasm module as built (M9.5, `crates/sand-web` → `sand.wasm`)

37.6 KB, its own module beside `engine.wasm` and `acoustic.wasm`, on
`web-common` (the panic hook, `FixedStep` with the step cap). Exports:
`sand_new` (sides up to `MAX_SIDE` = 2048: a 2048² grid is 16 MB of
pixels), `sand_advance`, `sand_set_rate`, `sand_set_step_cap`,
`sand_set_chunked`, `sand_paint` (a disc, radius up to `MAX_BRUSH` = 64,
clipped; empty erases), `sand_render` (the RGBA buffer, `ImageData`
order), `sand_width`/`height`, `sand_count`, `sand_last_moves`,
`sand_awake_chunks`/`sand_chunks`. Material codes mirrored in
`site/js/sand-abi.ts` (tested), types in `site/js/sand.d.ts` (checked
against the export table by `cargo xtask site`), and a call-sequence
property test (hostile values; every count always sums to the grid).

## The page as built (M9.6, `site/demos/m9-falling-sand`)

The canvas is the grid's size, one pixel a cell, scaled by CSS
(`pixels.ts`: `putImageData` over a view of wasm memory, no copy). The
brush paints a disc (radius 1–64, any material or erase) along the drag,
dabs at most half a radius apart so a fast stroke has no gaps, and keeps
painting while held. Scenes (`sand-scenes.ts`, drawn with the brush, so
they scale to any grid): an hourglass, a dam with a slot, lava down a
ramp into water, an empty box. The HUD: steps per second (and slow
motion when the step budget holds it), a step's time and cells per
second, draw time, moves, awake chunks, counts per material. Smoke cases:
the hourglass, lava with chunks off, the 1920 × 1080 grid, each checking
the three accounts held and the canvas drew.

**Measured in wasm** (Node 22, the same cases as the native bench):

| Grid | Busy step | Settled, chunks | Settled, every cell | Render |
|---|---|---|---|---|
| 640 × 360 | 1.84 ms (125 M cells/s) | 3.5 µs | 820 µs | 0.06 ms |
| 1920 × 1080 | 17.1 ms (121 M cells/s) | 28 µs | 7.6 ms | 0.47 ms |

Wasm is about 1.4× native busy. The default grid fits a 60 Hz frame
with a lot of room to spare; 1920 × 1080 busy just misses it, and the
step budget slows it (the HUD says so) until it settles, when its chunks
go to sleep. **Render** was 8.6 ms at 1920 × 1080 first, decoding each
cell through `Grid::get` and `shade_at`; a 256-entry palette (every cell
byte's colour, via `sand::unpack`) made it a lookup per cell, 18× faster.
So the whole buffer is still refreshed each frame: rendering only awake
chunks isn't needed.

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

Full entries in `references.md` ("Falling sand").

- Purho (2019), *Exploring the Tech and Design of Noita* (GDC), and
  80.lv's summary of it: bottom-up updates, 64 × 64 chunks with dirty
  rectangles, the four-pass checkerboard.
- Toffoli & Margolus (1987), *Cellular Automata Machines*: the Margolus
  neighbourhood.
