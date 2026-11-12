# Repository Layout

Status: **Adopted** (M0). `02-core-types.md` and `03-wasm-shell.md` follow it.
Unnumbered on purpose: `05-roadmap.md` reserves `06-constraints.md` for M3.

## Tree

```
physics/
├── Cargo.toml              # [workspace]: crates/*, xtask
├── Cargo.lock
├── rust-toolchain.toml     # pin toolchain + targets (wasm32-unknown-unknown, wasm32-wasip1)
├── .nvmrc                  # Node 22 (nvm install / nvm use; docs/setup.md)
├── .cargo/config.toml      # [target.wasm32-wasip1] runner = "wasmtime"
├── .gitignore              # target/, site/pkg/, dist/
├── .githooks/              # pre-commit (lint), pre-push (tests, smoke)
├── .github/workflows/ci.yml  # the same checks on every PR (04-testing.md, "CI")
│
├── docs/
│   ├── 00-scope.md … 09-billiards.md, 11-falling-sand.md … 14-piano.md, 15-swarm.md
│   ├── setup.md            # a fresh machine, step by step (nvm for Node)
│   ├── repo-layout.md      # this file
│   ├── types.md            # key types, one line each, with links
│   ├── hosting.md          # future work
│   ├── workers.md          # design note: step budget, Web Workers, wasm threads
│   ├── api/                # each library crate's public API, generated (cargo xtask api)
│   ├── api-audit.md        # each crate's public surface, and what to narrow
│   ├── swarm-resources.md  # swarm track: reading list (05-roadmap, "Swarm track")
│   ├── swarm-rust-implementation.md  # swarm track: implementation notes
│   └── references.md
│
├── crates/
│   ├── math/               # shared by engine, acoustic, sand, swarm
│   │   └── src/
│   │       ├── lib.rs
│   │       ├── scalar.rs   # Scalar trait, f32/f64 impls
│   │       ├── vec2.rs
│   │       ├── unit_vec2.rs # UnitVec2: a direction, length 1 by construction
│   │       └── fixed.rs    # M8
│   │
│   ├── engine/
│   │   ├── src/
│   │   │   ├── lib.rs
│   │   │   ├── particles.rs
│   │   │   ├── force.rs
│   │   │   ├── barnes_hut.rs       # M2 stretch: docs/barnes-hut.md
│   │   │   ├── integrate.rs
│   │   │   ├── world.rs
│   │   │   ├── diagnostics.rs
│   │   │   ├── params.rs           # checked parameters (Mass, Softening, θ, β), one file each in params/
│   │   │   ├── scenarios.rs        # shared by tests AND demos; hub re-exporting
│   │   │   ├── scenarios/          #   one file per scene (+ shared.rs, <scene>/tests.rs)
│   │   │   └── <module>/tests.rs   # each module's unit tests (no mod.rs)
│   │   ├── tests/
│   │   │   ├── invariants.rs
│   │   │   ├── known_failures.rs
│   │   │   ├── determinism.rs
│   │   │   ├── properties.rs
│   │   │   ├── barnes_hut.rs       # accuracy vs θ, momentum
│   │   │   └── properties.proptest-regressions  # committed
│   │   └── benches/step.rs
│   │
│   ├── acoustic/           # A1+: Karplus–Strong string, waveguide, piano (stiff strings, hammer, body); offline measurement
│   ├── acoustic-web/       # cdylib → acoustic.wasm (the audio worklet's synth)
│   ├── test-support/       # dev-dep: shared integration-test helpers
│   │   └── src/            # tol, orbit, hash, worlds (proptest)
│   │
│   ├── engine-web/         # cdylib → engine.wasm (renamed from `web` after M7)
│   │   └── src/
│   │       ├── abi.rs      # wire codes and caps (mirrored in site/js/abi.ts)
│   │       ├── demo.rs     # Demo, AnyWorld, scenes' glue (tested natively)
│   │       └── exports.rs  # extern "C" exports, one file per group
│   ├── web-common/         # what every *-web crate shares: panic hook, FixedStep, boundary parsing
│   │
│   ├── sand/               # M9: the falling-sand automaton (grid, rules; integers only)
│   ├── sand-web/           # cdylib → sand.wasm (the sand page's C ABI, on web-common)
│   ├── swarm/              # S1: boids (double-buffered SoA, f32; the counting-sort grid)
│   ├── swarm-web/          # cdylib → swarm.wasm (simd128; the boids page's C ABI)
│   └── acoustic/           # A1+
│
├── xtask/                  # build helper (clap; see docs/00-scope.md)
│   ├── src/main.rs
│   ├── serve.py            # dev and smoke server: http.server + no-store + a deep backlog
│   ├── smoke_page.mjs      # one smoke load: Chrome over DevTools, waits for SMOKE
│   └── bench_wasm.mjs      # Node side of `cargo xtask bench-wasm`
│
└── site/
    ├── index.html          # demo gallery
    ├── css/site.css
    ├── js/                 # TypeScript library; tsc emits .js beside it (gitignored)
    │   ├── wasm.ts         # load + instantiate engine.wasm (the panic hook, shared)
    │   ├── sand-wasm.ts    # M9: load sand.wasm, its step budget
    │   ├── sand-abi.ts     # M9: material codes, caps (mirrors sand-web abi.rs)
    │   ├── sand.d.ts       # M9: types for sand.wasm's exports
    │   ├── sand-scenes.ts  # M9: the starting scenes, drawn with the brush (pure)
    │   ├── swarm-abi.ts    # S1: neighbour and parameter codes, caps (mirrors swarm-web abi.rs)
    │   ├── swarm.d.ts      # S1: types for swarm.wasm's exports
    │   ├── swarm-wasm.ts   # S1: load swarm.wasm, its step budget
    │   ├── swarm-cost.ts   # S1: the world for n boids, the cost table (pure)
    │   ├── vicsek-sweep.ts # S2: Fig. 2a's sizes, the η grid, the sweep's cases (pure)
    │   ├── ant-scenes.ts   # S3: the ants page's scenes, drawn with the paint tools (pure)
    │   ├── pixels.ts       # RGBA buffer → ImageData → canvas; CSS point → cell; strokes
    │   ├── loop.ts         # rAF loop → demo_advance
    │   ├── canvas.ts       # world↔screen, high-DPI, batched drawing (points, links, disks, grid)
    │   ├── pointer.ts      # pointer drags → world coordinates (grab/drag/release)
    │   ├── plot.ts         # ring-buffer line plots
    │   ├── controls.ts     # sliders/dropdowns → demo_set_*
    │   ├── perf.ts         # timings, per-N cost table (ns/pair)
    │   ├── divergence.ts   # RMS distance between two runs
    │   ├── panels.ts       # side-by-side panel markup, demo handle checks
    │   ├── page.ts         # every page's lifecycle: rate/fps options, smoke or live loop, errors
    │   ├── scalars.ts      # f32/f64 names → scalar codes, URL parsing
    │   ├── stiffness.ts    # M5 log stiffness slider (rigid stop), k_crit hint
    │   ├── ks.ts           # A1: MIDI, note names, computer-keyboard piano layout
    │   ├── acoustic.d.ts   # types for acoustic.wasm's exports
    │   ├── synth-worklet.ts # the AudioWorklet processor (A1–A3)
    │   ├── synth-live.ts   # starting audio, snapshot buffers, offline render
    │   ├── piano-ui.ts     # on-screen piano (velocity from press depth), keyboard, songs
    │   ├── tone.ts         # amplitude, level, peak, onsets, silenced harmonics (pure)
    │   ├── …               # abi, dom, options, ring, smoke, trail
    │   └── engine.d.ts     # types for the wasm exports/imports
    ├── demos/
    │   ├── m0-hello/       # each: index.html + main.ts (emits main.js)
    │   ├── m1-orbits/
    │   ├── m2-cluster/
    │   ├── m3-pendulum/
    │   ├── m4-chain/
    │   ├── m4-double-pendulum/
    │   ├── m5-jelly/
    │   ├── m6-collisions/
    │   ├── m6-cradle/
    │   ├── m7-billiards/
    │   ├── m9-falling-sand/
    │   ├── s1-boids/
    │   ├── s2-vicsek/
    │   ├── s3-ants/
    │   ├── s4-physarum/
    │   ├── a1-string/
    │   ├── a2-waveguide/
    │   └── a3-piano/
    └── pkg/                # build output (gitignored): engine.wasm, acoustic.wasm, sand.wasm, swarm.wasm
```

## Decisions

### `math` is its own crate

`00-scope.md` says the acoustic track shares math types with the engine;
`02-core-types.md` puts `Scalar` and `Vec2` inside `engine`. If they stay
there, `acoustic` must depend on the whole physics engine to get `Fixed`.
Splitting now is free; splitting after M8 touches every import.

Dependency direction: `math` ← `engine` ← `engine-web`; `math` ←
`acoustic` ← `acoustic-web`; `math` ← `sand` ← `sand-web` (M9); every
`*-web` crate ← `web-common`, which depends on nothing. Nothing depends
on a `*-web` crate.

### `scenarios.rs` lives in `engine`

The orbit you test is the orbit you demo. Same reasoning as `diagnostics`.

### `engine-web` splits exports from logic

All `unsafe` lives in one-line wrappers in `lib.rs`. Everything with
behavior is in `demo.rs` and runs under native `cargo test`.

### `xtask` for builds

The standard Rust pattern: a std-only binary in the workspace, run as
`cargo xtask <cmd>`. Cross-platform, no Makefile, no dependencies.

Commands (`cargo xtask help` lists what exists):

| Command | Status | Does |
|---|---|---|
| `cargo xtask site` | M0 | Build `engine-web` and `acoustic-web` for `wasm32-unknown-unknown` (release), copy to `site/pkg/engine.wasm` |
| `cargo xtask install-hooks` | M0 | `git config core.hooksPath .githooks` |
| `cargo xtask serve` | M2 | `site`, then serve `site/` with `tsc --watch` alongside (default port 8000) |
| `cargo xtask smoke` | M0 | `site`, then load the demo in headless Chrome and check it draws (pre-push; `docs/04-testing.md`) |
| `cargo xtask bench-wasm` | M2 | time the cluster through `engine.wasm` in Node; compare with criterion's native results |
| `cargo xtask test-wasm` | M1 | `cargo test -p engine -p math --target wasm32-wasip1` under wasmtime (pre-push) |
| `cargo xtask coverage` | M2 | Rust coverage via `cargo-llvm-cov` (per-crate summary, HTML in `target/llvm-cov/html`) and site JS via `node --test --experimental-test-coverage`; report only (`docs/04-testing.md`) |
| `cargo xtask dist` | planned | `site` + produce a deployable `dist/` (see `hosting.md`) |

Local serving: `cargo xtask serve`.

### Site structure

- **One folder per demo.** Each page stays tiny; shared behavior lives in `site/js/`.
- **Native ES modules, no bundler.** `<script type="module">` and `import`
  work in every current browser. The shared library is TypeScript
  (adopted after M1, `type-invariants.md` item 8): `tsc` deletes the types
  (`erasableSyntaxOnly`) and emits one `.js` per `.ts`, unbundled. New
  pages are `.ts`; the M0/M1 demo pages are JSDoc-checked `.js` until next
  touched.
- **Relative URLs everywhere.** `./js/wasm.js`, `../../pkg/engine.wasm`.
  Never `/js/...`. This is what lets the site later be served from a
  sub-path of another domain (`hosting.md`) without changes.
- **`site/js/` mirrors M1's "shared demo infrastructure."** It grows
  alongside the roadmap, not ahead of it.

### `docs/` lives with the code

Design decisions are versioned alongside what they describe. A PR that
changes behavior updates the doc in the same commit.

## Bootstrapping order (M0)

1. Workspace `Cargo.toml`, `rust-toolchain.toml`, `.gitignore`
2. `crates/math` with tests (M0 test-first step 1)
3. `crates/engine` skeleton, then the phase 1 test-first order from `04-testing.md`
4. `crates/web` + `xtask site`
5. `site/demos/m0-hello`

Create `sand/` and `acoustic/` when their milestones begin, not before.

## Open questions

- ~~Workspace dependency inheritance~~: adopted in M2 (`[workspace.dependencies]`).
- One `engine.wasm` for all demos, or one per crate (`engine.wasm`,
  `sand.wasm`, `acoustic.wasm`)? Likely per crate: demos shouldn't
  download code they don't use. Revisit at M9.
