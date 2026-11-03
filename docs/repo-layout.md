# Repository Layout

Status: **Adopted** (M0). `02-core-types.md` and `03-wasm-shell.md` follow it.
Unnumbered on purpose: `05-roadmap.md` reserves `06-constraints.md` for M3.

## Tree

```
physics/
├── Cargo.toml              # [workspace]: crates/*, xtask
├── Cargo.lock
├── rust-toolchain.toml     # pin toolchain + targets (wasm32-unknown-unknown, wasm32-wasip1)
├── .cargo/config.toml      # [target.wasm32-wasip1] runner = "wasmtime"
├── .gitignore              # target/, site/pkg/, dist/
│
├── docs/
│   ├── 00-scope.md … 06-constraints.md
│   ├── repo-layout.md      # this file
│   ├── types.md            # key types, one line each, with links
│   ├── hosting.md          # future work
│   └── references.md
│
├── crates/
│   ├── math/               # shared by engine, acoustic, sand
│   │   └── src/
│   │       ├── lib.rs
│   │       ├── scalar.rs   # Scalar trait, f32/f64 impls
│   │       ├── vec2.rs
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
│   ├── test-support/       # dev-dep: shared integration-test helpers
│   │   └── src/            # tol, orbit, hash, worlds (proptest)
│   │
│   ├── web/                # cdylib → engine.wasm
│   │   └── src/
│   │       ├── lib.rs      # extern "C" exports only, one line each
│   │       ├── demo.rs     # Demo, AnyWorld, accumulator (tested natively)
│   │       └── render.rs   # render buffer fill
│   │
│   ├── sand/               # M9
│   └── acoustic/           # A1+
│
├── xtask/                  # build helper (clap; see docs/00-scope.md)
│   ├── src/main.rs
│   ├── serve.py            # dev server: http.server + Cache-Control: no-store
│   └── bench_wasm.mjs      # Node side of `cargo xtask bench-wasm`
│
└── site/
    ├── index.html          # demo gallery
    ├── css/site.css
    ├── js/                 # TypeScript library; tsc emits .js beside it (gitignored)
    │   ├── wasm.ts         # load + instantiate engine.wasm
    │   ├── loop.ts         # rAF loop → demo_advance
    │   ├── canvas.ts       # world↔screen, high-DPI, batched drawing (points, links)
    │   ├── pointer.ts      # pointer drags → world coordinates (grab/drag/release)
    │   ├── plot.ts         # ring-buffer line plots
    │   ├── controls.ts     # sliders/dropdowns → demo_set_*
    │   ├── perf.ts         # timings, per-N cost table (ns/pair)
    │   ├── divergence.ts   # RMS distance between two runs
    │   ├── panels.ts       # side-by-side panel markup, demo handle check
    │   ├── scalars.ts      # f32/f64 names → scalar codes, URL parsing
    │   ├── …               # abi, dom, options, ring, smoke, trail
    │   └── engine.d.ts     # types for the wasm exports/imports
    ├── demos/
    │   ├── m0-hello/       # each: index.html + main.ts (emits main.js)
    │   ├── m1-orbits/
    │   ├── m2-cluster/
    │   ├── m3-pendulum/
    │   ├── m4-chain/
    │   └── m4-double-pendulum/
    └── pkg/                # build output (gitignored): engine.wasm
```

## Decisions

### `math` is its own crate

`00-scope.md` says the acoustic track shares math types with the engine;
`02-core-types.md` puts `Scalar` and `Vec2` inside `engine`. If they stay
there, `acoustic` must depend on the whole physics engine to get `Fixed`.
Splitting now is free; splitting after M8 touches every import.

Dependency direction: `math` ← `engine` ← `web`; `math` ← `acoustic`;
`math` ← `sand` (if it needs anything). Nothing depends on `web`.

### `scenarios.rs` lives in `engine`

The orbit you test is the orbit you demo. Same reasoning as `diagnostics`.

### `web` splits exports from logic

All `unsafe` lives in one-line wrappers in `lib.rs`. Everything with
behavior is in `demo.rs` and runs under native `cargo test`.

### `xtask` for builds

The standard Rust pattern: a std-only binary in the workspace, run as
`cargo xtask <cmd>`. Cross-platform, no Makefile, no dependencies.

Commands (`cargo xtask help` lists what exists):

| Command | Status | Does |
|---|---|---|
| `cargo xtask site` | M0 | Build `web` for `wasm32-unknown-unknown` (release), copy to `site/pkg/engine.wasm` |
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
