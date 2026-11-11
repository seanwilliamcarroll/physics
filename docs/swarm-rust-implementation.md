# Swarm Experiments in Rust: Implementation Notes

_As of 2026-11-02. Companion to `swarm-resources.md`._

## Recommendation up front

Yes, wasm is a good choice for these experiments, and it fits the site that already hosts the physics engine. Keep the simulation in a pure Rust core crate with no rendering dependencies. Put two thin front ends over it:

1. **Canvas 2D via `web-sys` (start here).** The sim writes an RGBA pixel buffer in wasm memory, and the page blits it with `putImageData`. No graphics crate is needed. This easily covers boids, Vicsek, ants, and Physarum up to a few hundred thousand agents on the CPU.
2. **`wgpu` (when you want GPU compute).** The same code runs natively and in the browser through WebGPU. It is the community-standard, actively maintained low-level graphics crate. It is also the library Firefox uses for its own WebGPU implementation.

Each front end has a hard constraint:

- **WebGPU still doesn't reach every browser.** As of September 2026, WebGPU ships in Chrome and Edge, in Safari 26 on every Apple platform, and in Firefox only on Windows and Apple Silicon Macs. Firefox on Linux is the notable gap.
- **The WebGL2 fallback can't run compute.** wgpu can fall back to WebGL2, but WebGL2 has no compute shaders. The GPU sim path is therefore WebGPU-only. Keep the Canvas/CPU path as the fallback.

### The other crates, and why I wouldn't lead with them

| Crate | Verdict | Why |
| --- | --- | --- |
| `wgpu` | Use for the GPU tier | Explicit, well maintained, native and web from one codebase, compute shaders in WGSL |
| `macroquad` | Fine for a quick native toy | Very easy, and actively maintained (0.4.x). However, it ships its own JS loader instead of `wasm-bindgen`, which makes it awkward to embed in a site that already uses wasm-bindgen. It also has no compute. |
| `bevy` | Overkill here | Healthy project (0.19 is out), but an ECS game engine brings long builds, multi-MB wasm, and many dependencies. That conflicts with your vanilla-Rust stance. |
| `nannou` | Wait | A Processing-style creative coding toolkit with a Nature of Code port, but still mid-rework. Its own README calls it early days. |
| `egui` / `eframe` | Optional add-on | The usual pick for parameter sliders and debug plots if you get tired of HTML inputs. |

## Workspace layout

```
swarm/
├── swarm-core/     # no_std-friendly sim: agents, grids, models. No rendering, no web-sys.
├── swarm-web/      # wasm-bindgen + web-sys: Canvas 2D front end, JS glue
├── swarm-gpu/      # wgpu compute + render (native and web)
└── swarm-bench/    # native benches and profiling harness
```

`swarm-core` exposes `step(&mut self, dt)` and `render_into(&self, rgba: &mut [u8], w, h)`. Every front end and benchmark drives the same API. Profiling happens natively, where `perf`, cachegrind, and flamegraphs work, and the browser only displays the result.

Keep the scalar generic as you did in the physics engine (`T: Scalar`). Boids in fixed point matches what the ECE 4760 RP2040 lab does, so you can benchmark f32 against s15.16 directly.

**Determinism.** Use a seeded RNG and a fixed timestep so that native and wasm runs produce identical trajectories. That makes regressions diffable. A 10-line PCG32 or xorshift keeps the core dependency-free. Avoid `rand` with OS entropy, because it pulls in `getrandom` and its wasm feature flags.

## Shared machinery

### State layout: structure of arrays, double-buffered

```rust
pub struct Agents {
    pub px: Vec<f32>, pub py: Vec<f32>,
    pub vx: Vec<f32>, pub vy: Vec<f32>,
}

pub struct Sim {
    cur: Agents,
    next: Agents,   // write here, then swap
    grid: Grid,
}
```

Updating in place makes the result depend on iteration order: boid 7 sees boid 3's new velocity but boid 9's old one. Reading `cur` and writing `next` removes that dependence. It also makes the update embarrassingly parallel, which is exactly the shape a GPU compute pass needs.

SoA lets the inner neighbor loop vectorize. Compare it against AoS `[Agent]` with `#[repr(C)]` as an early experiment, because the answer changes once you sort agents by cell (next section).

### Neighbor search: uniform grid via counting sort

Set the cell size to the perception radius r, so every neighbor lies in the 3×3 block of cells around the agent. Rebuild the grid every step with a counting sort, which is O(n) and avoids the comparison sort in the GPU Gems chapter:

```rust
pub struct Grid {
    inv_cell: f32,
    cols: usize,
    rows: usize,
    cell_start: Vec<u32>, // len = cols * rows + 1
    cursor: Vec<u32>,     // scratch, same len
    order: Vec<u32>,      // agent indices sorted by cell
}

impl Grid {
    fn cell_of(&self, x: f32, y: f32) -> usize {
        let cx = ((x * self.inv_cell) as usize).min(self.cols - 1);
        let cy = ((y * self.inv_cell) as usize).min(self.rows - 1);
        cy * self.cols + cx
    }

    pub fn rebuild(&mut self, px: &[f32], py: &[f32]) {
        let n_cells = self.cols * self.rows;
        self.cell_start.clear();
        self.cell_start.resize(n_cells + 1, 0);

        // 1. histogram, shifted by one so step 2 yields start offsets
        for i in 0..px.len() {
            let c = self.cell_of(px[i], py[i]);
            self.cell_start[c + 1] += 1;
        }
        // 2. prefix sum: cell_start[c] = first slot of cell c
        for c in 0..n_cells {
            self.cell_start[c + 1] += self.cell_start[c];
        }
        // 3. scatter
        self.cursor.clear();
        self.cursor.extend_from_slice(&self.cell_start);
        self.order.resize(px.len(), 0);
        for i in 0..px.len() {
            let c = self.cell_of(px[i], py[i]);
            self.order[self.cursor[c] as usize] = i as u32;
            self.cursor[c] += 1;
        }
    }

    pub fn cell(&self, c: usize) -> &[u32] {
        &self.order[self.cell_start[c] as usize..self.cell_start[c + 1] as usize]
    }
}
```

Next, physically reorder the agent arrays by `order` every N frames, instead of indexing through it. Neighbors then sit next to each other in memory, and the 3×3 scan becomes a handful of contiguous reads. This is the cache-behavior experiment worth measuring.

This grid is the physics engine's broad phase with a different query. Write it once in a shared crate.

### Rendering the CPU path

- **Agents:** splat each one as a few pixels into the RGBA buffer rather than issuing Canvas path calls. Per-agent `fill()` calls stop scaling at a few thousand agents.
- **Trail maps (ants, Physarum):** map the f32 field to a color ramp in Rust, then call `ImageData::new_with_u8_clamped_array_and_sh` and `put_image_data`. One copy per frame, which is fine at 1024².
- **Zero-copy alternative:** expose the buffer's pointer and have JS build a `Uint8ClampedArray` view over `wasm.memory.buffer`. Re-create the view after any allocation that could grow memory.

## The experiments, in suggested order

### 1. Boids (CPU, then grid)

Each agent sums three steering terms over neighbors within r: separation (within a smaller protected range), alignment, and cohesion. It also gets edge avoidance, and its speed is clamped between a minimum and a maximum. The ECE 4760 lab pseudocode gives a tested parameter set to start from (visual range 20, protected range 2, max speed 3, min speed 2, small centering, avoid, and matching factors).

- **Milestone A:** brute force O(n²), 1k agents, Canvas render.
- **Milestone B:** add the grid, then plot ns per agent-step for n = 1k, 10k, 100k, brute force versus grid. The crossover point is the first real result.
- **Milestone C:** sort agents by cell, then add wasm SIMD (`-C target-feature=+simd128`). Measure each change separately.

### 2. Vicsek model: a quantitative check

Each particle moves at constant speed v₀. It takes the mean heading of the neighbors within r (itself included), plus uniform noise in [−η/2, η/2], in a periodic box of side L. The order parameter is

```latex
v_a = \frac{1}{N v_0}\left|\sum_{i=1}^{N} \mathbf{v}_i\right|
```

Sweep η and plot v_a: the paper reports a continuous transition from disorder to collective motion. This is the experiment that tells you the sim is correct and not just pretty. It reuses the boids grid, with periodic wrap in the 3×3 lookup.

There is one known numerical gotcha. If the neighbor headings cancel exactly, the mean direction is 0/0. Pick a rule (keep the old heading) and document it; a published comment discusses this case.

### 3. Ant foraging: stigmergy

Use two pheromone fields on a grid, `to_food` and `to_home`. Ants leaving the nest deposit `to_home` and follow `to_food`, and ants carrying food do the reverse. Each ant samples the field at three points ahead (left, center, right) and turns toward the strongest. Each step the fields diffuse with a 3×3 blur and decay by a constant factor.

This is the first experiment where agents read and write a shared field instead of each other, which brings write contention. On the CPU, deposit serially or into per-thread fields and then sum. On the GPU, deposit with atomic adds on a u32 fixed-point field, since WGSL atomics are integer-only. That's a natural place for your fixed-point experience.

### 4. Physarum (Jones 2010)

The model has a single trail field and up to millions of agents. Per agent:

1. **Sense:** sample the trail at distance SO, at angles −SA, 0, and +SA from the current heading.
2. **Rotate:** turn by RA toward the strongest sample, or turn randomly if both sides beat the center.
3. **Move:** step forward by SS.
4. **Deposit:** add a fixed amount at the new position.

Then the field diffuses (3×3 mean) and decays. Sage Jenson's write-up lists parameters to start from and shows how SA, RA, and SO change the pattern. This is the experiment that justifies the GPU tier. The CPU path will reach roughly 10⁵ agents, and a compute shader will reach millions.

### 5. Stretch goals

- **Evolve the rules.** Use a genetic algorithm over the boids or ant parameters with a fitness function such as food returned per tick. This is cheap with a headless `swarm-core` run natively in parallel.
- **Collective construction.** TERMES-style agents add blocks to a grid according to local rules until a target structure exists. This is the "task greater than themselves" version, and it's the hardest to get right.

## GPU tier (`swarm-gpu`)

Follow the shape of the wgpu `boids` example:

1. Ping-pong two storage buffers (`cur` and `next`), mirroring the CPU double buffer.
2. Run one compute pass per step. Physarum adds a deposit pass, then a diffuse/decay pass on a storage texture.
3. Run a render pass that draws instanced triangles for agents or a full-screen quad sampling the trail texture.
4. A grid on the GPU is a counting sort again: atomic histogram, prefix-sum pass, scatter pass. The GPU Gems chapter covers the parallel version of the same ideas.

Develop natively first, because shader errors and GPU timing are much easier to inspect there. Then build for `wasm32-unknown-unknown` with the WebGPU backend.

## Performance caveats specific to wasm

- **SIMD:** `simd128` is widely supported. Enable it with `RUSTFLAGS="-C target-feature=+simd128"` and use `core::arch::wasm32` or autovectorization from the SoA layout.
- **Threads:** wasm threads need `SharedArrayBuffer`. That requires the page to be cross-origin isolated (COOP/COEP headers), plus a nightly toolchain build with atomics. Check whether your site host lets you set those headers before planning on it. Otherwise stay single-threaded in the browser and use threads only in native benchmarks.
- **Timing:** `performance.now()` is coarsened in browsers, so do the serious per-step timing natively.

## Open questions

- Does the physics engine's front end already use `wasm-bindgen` and Canvas 2D? If so, `swarm-web` should reuse its glue rather than add a second loader.
- Should the grid and vector types live in a crate shared with the physics engine from day one, or be extracted later?

## Sources

- [WebGPU vs WebGL for Games (2026)](https://app.cinevva.com/guides/webgpu-vs-webgl-games) and [WebGL 2 or WebGPU Not Supported? (Sept 2026)](https://app.cinevva.com/guides/webgl-webgpu-not-supported-fix): browser support status
- [wgpu boids example](https://wgpu.rs/doc/src/wgpu_examples/boids/mod.rs.html)
- [macroquad README](https://github.com/not-fl3/macroquad)
- [Bevy 0.19 release coverage](https://gamefromscratch.com/bevy-0-19-released/)
- [nannou repository](https://github.com/nannou-org/nannou)
- [ECE 4760 Boids algorithm](https://vha3.github.io/Pico/Animal_Movement/Boids-algorithm.html)
- [Vicsek et al. 1995](https://arxiv.org/abs/cond-mat/0611743) and [comment on the 0/0 case](https://arxiv.org/pdf/cond-mat/0703532)
- [Sage Jenson, physarum](https://sagejenson.com/physarum) and [Jones 2010](https://uwe-repository.worktribe.com/output/980579)
- [GPU Gems 3 Ch. 32](https://developer.nvidia.com/gpugems/gpugems3/part-v-physics-simulation/chapter-32-broad-phase-collision-detection-cuda)
