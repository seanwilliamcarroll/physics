# Repository Layout

Status: **Adopted** (M0). `02-core-types.md` and `03-wasm-shell.md` follow it.
The trees below are a map, not a listing: they name what's worth finding.

## Tree

```
physics/
├── Cargo.toml              # [workspace]: crates/*, xtask
├── Cargo.lock
├── rust-toolchain.toml     # pin toolchain + targets (wasm32-unknown-unknown, wasm32-wasip1)
├── .nvmrc                  # Node 24 (nvm install / nvm use; docs/setup.md)
├── .cargo/config.toml      # [target.wasm32-wasip1] runner = "wasmtime"
├── .gitignore              # target/, site/pkg/, dist/
├── .githooks/              # pre-commit (lint), pre-push (tests, smoke)
├── .github/workflows/nightly.yml  # the hooks and the slow tier, nightly if main moved (17-nightly-ci.md)
│
├── docs/
│   ├── 00-scope.md … 09-billiards.md, 11-falling-sand.md … 15-swarm.md  # design docs, by milestone
│   ├── 16-site-demos.md    # demos on the personal site, from a package built here (in progress)
│   ├── 17-nightly-ci.md    # CI once a night, only if main moved: the hooks and the slow tier (done)
│   ├── setup.md            # a fresh machine, step by step (nvm for Node)
│   ├── repo-layout.md      # this file
│   ├── types.md            # key types, one line each, with links
│   ├── type-invariants.md  # what types enforce, and what was considered and left out
│   ├── lint-policy.md      # why the lints are what they are
│   ├── barnes-hut.md       # the O(n log n) gravity: design and measurements
│   ├── benchmarks.md       # running and comparing benchmarks; the current numbers
│   ├── profiling.md        # finding where the time goes: cargo xtask profile, the hot paths found
│   ├── workers.md          # design note: step budget (built), Web Workers, wasm threads
│   ├── hosting.md          # not planned (16-site-demos.md replaced it); what wasm needs from a server
│   ├── api/                # each library crate's public API, generated (cargo xtask api)
│   ├── api-audit.md        # the audit after M7 that narrowed the public surfaces (done)
│   ├── numerical-testing-checklist.md  # a generic test plan; 04-testing.md maps this repo onto it
│   ├── swarm-resources.md  # swarm track: reading list (05-roadmap, "Swarm track")
│   ├── swarm-rust-implementation.md  # swarm track: the notes it started from
│   └── references.md       # the bibliography for every design doc
│
├── crates/
│   ├── math/               # shared by engine, acoustic, sand, swarm
│   │   └── src/
│   │       ├── lib.rs
│   │       ├── scalar.rs   # Scalar trait, f32/f64 impls
│   │       ├── vec2.rs
│   │       ├── unit_vec2.rs # UnitVec2: a direction, length 1 by construction
│   │       ├── convert.rs  # checked numeric conversions (lint-policy.md)
│   │       ├── rng.rs      # SplitMix64, the seeded PRNG
│   │       └── hash.rs     # Fnv1a, the goldens' hash
│   │
│   ├── engine/
│   │   ├── src/
│   │   │   ├── lib.rs
│   │   │   ├── particles.rs
│   │   │   ├── force.rs
│   │   │   ├── barnes_hut.rs       # docs/barnes-hut.md
│   │   │   ├── integrate.rs
│   │   │   ├── constraint.rs, solver.rs   # docs/06-constraints.md
│   │   │   ├── collision.rs, table.rs     # docs/08-collision.md, 09-billiards.md
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
│   ├── swarm/              # S1–S5: boids, Vicsek, ants, Physarum, evolution (f32; the counting-sort grid)
│   └── swarm-web/          # cdylib → swarm.wasm (simd128; the swarm pages' C ABI)
│
├── package/                # the physics-engine npm package's README and tsconfig (cargo xtask package)
├── xtask/                  # build helper (clap; see docs/00-scope.md)
│   ├── src/main.rs         # the commands; one module each for the larger ones (bench, api, mutants, …)
│   ├── serve.py            # dev and smoke server: http.server + no-store + a deep backlog
│   ├── smoke_page.mjs      # one smoke load: Chrome over DevTools, waits for SMOKE
│   ├── bench_wasm.mjs      # Node side of `cargo xtask bench-wasm` (bench_modules.mjs: the other modules)
│   └── profile_top.mjs     # a samply profile's hottest functions and source lines (`cargo xtask profile`)
│
└── site/
    ├── index.html          # demo gallery
    ├── css/site.css
    ├── js/                 # TypeScript library; tsc emits .js beside it (gitignored)
    │   ├── engine-loader.ts # instantiate a module (the panic hook, streaming with a fallback); no page state
    │   ├── wasm.ts         # the lab pages' engine: the loader, the step budget, buffer views
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
    │   ├── ant-evolution.ts # S5: the native evolution's history and result (data)
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
    │   ├── s5-evolve/
    │   ├── a1-string/
    │   ├── a2-waveguide/
    │   └── a3-piano/
    └── pkg/                # build output (gitignored): engine.wasm, acoustic.wasm, sand.wasm, swarm.wasm
```

## Decisions

### `math` is its own crate

`00-scope.md` says the acoustic track shares math types with the engine.
Inside `engine`, `acoustic` would have had to depend on the whole physics
engine to get them. Splitting at M0 was free; later it would have touched
every import.

Dependency direction: `math` ← `engine` ← `engine-web`; `math` ←
`acoustic` ← `acoustic-web`; `math` ← `sand` ← `sand-web`; `math` ←
`swarm` ← `swarm-web`; every `*-web` crate ← `web-common`, which depends
on nothing. Nothing depends on a `*-web` crate.

### `scenarios.rs` lives in `engine`

The orbit you test is the orbit you demo. Same reasoning as `diagnostics`.

### `engine-web` splits exports from logic

All `unsafe` lives in one-line wrappers in `exports.rs`. Everything with
behavior is in `demo.rs` and runs under native `cargo test`. Every `*-web`
crate is built the same way.

### `xtask` for builds

The standard Rust pattern: a binary in the workspace, run as
`cargo xtask <cmd>`. Cross-platform, no Makefile; its one dependency is
`clap` (`00-scope.md`, dependency policy).

Commands (`cargo xtask help` is the authority):

| Command | Status | Does |
|---|---|---|
| `cargo xtask site` | M0 | Compile the TypeScript, build every `*-web` crate for `wasm32-unknown-unknown` (release), copy each to `site/pkg/<name>.wasm`, and check the `.d.ts` files against the export tables |
| `cargo xtask install-hooks` | M0 | `git config core.hooksPath .githooks` |
| `cargo xtask serve` | M2 | `site`, then serve `site/` with `tsc --watch` alongside (default port 8000) |
| `cargo xtask smoke` | M0 | `site`, then load every demo in headless Chrome and check it draws (pre-push; `docs/04-testing.md`) |
| `cargo xtask bench-wasm` | M2 | time the modules through their exports in Node; the engine's cluster against criterion's native results |
| `cargo xtask bench` | health | the criterion benches and a table of the results; baselines and records (`docs/benchmarks.md`) |
| `cargo xtask profile` | health | one example or bench under `samply`, built with debug info; prints the hottest functions and source lines (`docs/profiling.md`) |
| `cargo xtask package` | site demos | the `physics-engine` npm package (engine.wasm, its types, the loader) as a tarball in `target/package/`, checked by using it (`docs/16-site-demos.md`) |
| `cargo xtask release` | site demos | everything about releasing the package except publishing: checks the repo is ready, builds, drafts notes, prints the `gh release create` command (never runs it) |
| `cargo xtask test-wasm` | M1 | the `math`, `engine`, `acoustic`, `sand` and `swarm` tests for `wasm32-wasip1` under wasmtime (pre-push) |
| `cargo xtask coverage` | M2 | Rust coverage via `cargo-llvm-cov` (per-crate summary, HTML in `target/llvm-cov/html`) and site JS via `node --test --experimental-test-coverage`; report only (`docs/04-testing.md`) |
| `cargo xtask api` | health | each library crate's public API to `docs/api/`; `--check` in pre-push (`docs/api/README.md`) |
| `cargo xtask mutants` | health | `cargo mutants` for full runs (`docs/04-testing.md`, "Mutation testing") |
| `cargo xtask slow` | health | the slow tier: property tests at 10 000 cases, then the `slow_*` runs (`docs/04-testing.md`, "Running strategy") |

### Site structure

- **One folder per demo.** Each page stays tiny; shared behavior lives in `site/js/`.
- **Native ES modules, no bundler.** `<script type="module">` and `import`
  work in every current browser. The shared library is TypeScript
  (adopted after M1, `type-invariants.md` item 8): `tsc` deletes the types
  (`erasableSyntaxOnly`) and emits one `.js` per `.ts`, unbundled. Every
  page is `.ts`.
- **Relative URLs everywhere.** `./js/wasm.js`, `../../pkg/engine.wasm`.
  Never `/js/...`, so the site works from any path.
- **`site/js/` mirrors M1's "shared demo infrastructure."** It grows
  alongside the roadmap, not ahead of it.

### `docs/` lives with the code

Design decisions are versioned alongside what they describe. A PR that
changes behavior updates the doc in the same commit.

### One `.wasm` per track

`engine.wasm`, `acoustic.wasm`, `sand.wasm`, `swarm.wasm`: a page
downloads only the code it uses (decided as each track began; sizes in
`03-wasm-shell.md`). Shared dependency versions live once, in the root
`Cargo.toml` (`[workspace.dependencies]`, since M2).
