# Key types

Status: **Reference** (written at the M3/M4 boundary). Every type that
carries a decision, with one line on why it exists. Update it in the same
PR that adds, removes, or moves one. The *why* in depth lives in the
design docs: `02-core-types.md`, `06-constraints.md`, `type-invariants.md`.

Private helpers that are pure implementation detail (iterator adapters,
local tuples) are left out.

## `math` — numbers

| Type | Why it exists |
|---|---|
| [`Scalar`](../crates/math/src/scalar.rs) | The engine is generic over its number type, so f32, f64, and (M8) fixed point run the same code and can be compared side by side. |
| [`Vec2<S>`](../crates/math/src/vec2.rs) | The 2D vector everything is written in; `#[must_use]`, so a discarded result (`v.perp();`) is a compiler warning. |

## `engine` — storage and identity

| Type | Why it exists |
|---|---|
| [`Particles<S>`](../crates/engine/src/particles.rs) | Struct-of-arrays storage (`pos`, `vel`, `inv_mass`) whose lengths can't diverge: callers get slices, never the `Vec`s. |
| [`ParticleId`](../crates/engine/src/particles.rs) | Names a particle for constraints; only the engine can make one, so ids come from a real `add`. Plain index until particles can be removed. |
| [`World<S>`](../crates/engine/src/world.rs) | The simulation: particles, forces, constraints, and how a step is taken (integrator, or solver when constraints exist). |
| [`Constraints<S>`](../crates/engine/src/world/constraints.rs) | A world's constraints, one λ each, and the solver settings in one field, so `lambda` can't fall out of step with the list and a solver switch always resets it. |
| [`Grab`](../crates/engine/src/world/drag.rs) | A drag in progress; `release` consumes it (or hands it back if something newer was added), so a grab can't be released twice or leave a stale anchor. |
| [`ConfigError`](../crates/engine/src/world/config_error.rs) | One typed error for every invalid configuration (substeps, softening, mass, unknown particle, β), so scenes return `Result` instead of panicking. |

## `engine` — checked parameters (parse, don't validate)

Each is checked once where the value enters, then trusted
(`type-invariants.md`). All live in [`params/`](../crates/engine/src/params.rs);
the interval types share one macro, `checked_param!` (`new -> Option`,
`get`, `cast`), which is where M5's `Compliance` and M7's `Restitution`
and `Friction` go.

| Type | Why it exists |
|---|---|
| [`Mass<S>`](../crates/engine/src/params/mass.rs) | Positive, finite, with a finite inverse: a bad mass would corrupt every constraint it touches; static particles come only from `add_static`. |
| [`Softening<S>`](../crates/engine/src/params/softening.rs) | ε ≥ 0 (0 allowed: M2 demos it). A negative ε from a slider is reported, not silently squared away. |
| [`OpeningAngle<S>`](../crates/engine/src/params/opening_angle.rs) | Barnes–Hut θ ≥ 0; became a type when θ got a slider. |
| [`Compliance<S>`](../crates/engine/src/params/compliance.rs) | α = 1/stiffness ≥ 0 (0 rigid): both solvers read it as the same spring, so the drag's soft pull means the same thing in either panel. |
| [`Baumgarte<S>`](../crates/engine/src/params/baumgarte.rs) | Impulse solver's β in `[0, 1]`: above 1 the bias overshoots. A world setting, so `Solver` stays a plain enum. |

## `engine` — forces, constraints, stepping

| Type | Why it exists |
|---|---|
| [`Force<S>`](../crates/engine/src/force.rs) | Anything that adds acceleration; `dyn`, because one call per force per step is cheap next to the loop inside. |
| [`UniformGravity<S>`](../crates/engine/src/force.rs) | The same acceleration for every dynamic particle (fountain, pendulum). |
| [`PairwiseGravity<S>`](../crates/engine/src/force.rs) | Exact softened N-body gravity, O(n²), equal and opposite by construction (momentum to rounding). |
| [`BarnesHut<S>`](../crates/engine/src/barnes_hut.rs) | The same gravity in O(n log n) via a quadtree; trades accuracy (θ) and exact momentum for speed past ~200 bodies. |
| [`Constraint<S>`](../crates/engine/src/constraint.rs) | Geometry only (C, ∇C, compliance), so both solvers read the same definition; solvers are generic over it (no `dyn` in the hot loop). |
| [`DistanceConstraint<S>`](../crates/engine/src/constraint.rs) | A rod; to a static particle, a pin. Rest length from current positions, so no invalid length can be passed. |
| [`Integrator`](../crates/engine/src/integrate.rs) | How an unconstrained substep turns acceleration into motion; an enum (closed set, exhaustive matches, a wire code). |
| [`Order`](../crates/engine/src/solver.rs) | The order each Gauss–Seidel pass visits constraints (forward, reverse, alternating): part of the method along a chain. |
| [`Solver`](../crates/engine/src/solver.rs) | How a constrained substep is taken (XPBD or impulses); owns the whole step when constraints exist. |

## `engine` — scenes and support

| Type | Why it exists |
|---|---|
| [`Fountain`](../crates/engine/src/scenarios/fountain.rs) | The one scene with state between steps (respawning), so it owns its PRNG and the run is deterministic per seed. |
| [`SplitMix64`](../crates/engine/src/rng.rs) | A tiny in-house seeded PRNG: integer-only, so scenes are bit-identical on every platform (`00-scope.md`, dependency policy). |

Scenes without state are functions, not types, one file each under
[`scenarios/`](../crates/engine/src/scenarios/) (`cluster`, `disk`,
`collapse`, `orbit`, `pendulum`, `chain`, `double_pendulum`),
re-exported by [`scenarios.rs`](../crates/engine/src/scenarios.rs).

## `web` — the wasm boundary

| Type | Why it exists |
|---|---|
| [`Demo`](../crates/web/src/demo.rs) | One running demo (world, clock, render buffer) behind an opaque handle; all export logic as safe, natively tested Rust. |
| [`AnyWorld`](../crates/web/src/demo/any_world.rs) | Runtime scalar choice: JS picks f32 or f64 per demo; each variant is a full engine copy in the `.wasm`. `each_scalar!` / `build_any!` keep every per-scalar `match` to one line. |
| [`Sim<S>`](../crates/web/src/demo/sim.rs) | A world plus what the demo must remember about its force, because `World` keeps forces as `dyn` and can't hand them back. |
| [`SceneForce<S>`](../crates/web/src/demo/sim.rs) | That memory as one enum (none, pairwise with optional θ, uniform), so a θ can't exist without the gravity it approximates. |
| [`BetweenSteps`](../crates/web/src/demo.rs) | What runs between steps: the fountain's respawn, or nothing. |
| [`DemoKind`](../crates/web/src/demo/codes.rs), [`GravityScene`](../crates/web/src/demo/codes.rs), [`ScalarKind`](../crates/web/src/demo/codes.rs) | Wire codes decoded once at the boundary; unknown codes become `None`, never a wrong scene. |
| [`FixedStep`](../crates/web/src/fixed_step.rs) | Turns real frame time into fixed physics steps, so simulation speed doesn't depend on the display's refresh rate; rate is `NonZeroU32`, so it can't hang. |

## `site` — TypeScript

| Type | Why it exists |
|---|---|
| [`EngineExports`, `DemoHandle`, `Ptr`, `Status`](../site/js/engine.d.ts) | Types for the untyped wasm exports; branded handles can't be swapped with counts or pointers. |
| [`View`, `ViewBox`, `ViewTransform`](../site/js/canvas.ts) | World (m, y up) to screen (px, y down) as one canvas transform, aspect preserved; `toWorld` is its exact inverse for pointer input, the math pure and unit-tested. |
| [`DragHandlers`, `DragTracker`, `PointerSample`](../site/js/pointer.ts) | Pointer drags (mouse, pen, touch) delivered to pages in world meters; the tracker (pure, unit-tested) keeps one primary pointer per drag. |
| [`LinePlot`](../site/js/plot.ts) | Live multi-series plots over simulated time (linear or log); scale math is pure and unit-tested. |
| [`Ring`](../site/js/ring.ts) | Fixed-capacity history in constant memory, for plots and trails. |
| [`Trail`](../site/js/trail.ts) | Fading position history; rendering-only memory that Rust doesn't keep. |
| [`RateMeter`, `Smoothed`](../site/js/loop.ts) | Steady per-second counts and smoothed timings for HUDs. |
| [`CostTable`](../site/js/perf.ts) | Measured ms/step per N (and ns/pair), so cost growth is visible on the page. |
| [`ChoiceOption`, `IntOption`](../site/js/options.ts) | URL options as data: parsing and the on-page options table read the same definition, so documented ranges can't drift. |
| [`ScalarName`](../site/js/scalars.ts) | The engine number types by URL/menu name; `isScalar` narrows a string, so `SCALAR_CODES[name]` can't miss. |
| [`PanelConfig`, `PanelBase`](../site/js/panels.ts) | Side-by-side panels built one way on every page (all appended before any canvas is sized); pages spread their own fields onto `PanelBase`. |
| [`SliderSpec`, `SelectSpec`, …](../site/js/controls.ts) | Control builders that know nothing of the engine; pages wire them to `demo_set_*`. |
| [`SmokePanel`](../site/js/smoke.ts) | What `?smoke` mode checks per panel (steps taken, pixels drawn, finite energy). |

## Test and tooling crates

| Type | Why it exists |
|---|---|
| [`Tol`](../crates/test-support/src/tol.rs) | Per-scalar tolerances (`EPSILON`, …), so one generic test runs for f32 and f64 with the right bounds. |
| [`BodySpec`](../crates/test-support/src/worlds.rs) | proptest's generated body, shrinkable to a minimal failing world. |
| [`PendulumRun`](../crates/test-support/src/pendulum.rs) | What `01-solvers.md`'s table reports for one run (rod error, energy lost). |
| [`Fnv1a`](../crates/test-support/src/hash.rs) | Stable state hash for golden-hash determinism tests (native and wasm must match). |
| [`Command`](../xtask/src/main.rs) | `cargo xtask` subcommands (clap derive), so `--help`, typos, and ranges are checked. |
