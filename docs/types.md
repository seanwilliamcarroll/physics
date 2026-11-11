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
| [`UnitVec2<S>`](../crates/math/src/unit_vec2.rs) | A direction of length 1, only from `Vec2::normalized`/`length_and_direction` (`None` at zero or NaN), so every `x / \|x\|` handles the degenerate case: constraint gradients, spring axes, M6's contact normals. |
| [`convert`](../crates/math/src/convert.rs) (functions) | Checked count ↔ measure conversions, each justified once instead of an `as` with a lint exemption at every site: exact where they say so, `None` or a named clamp where `as` would saturate silently (`docs/lint-policy.md`). |
| [`Fnv1a`](../crates/math/src/hash.rs) | The fixed, published hash behind every golden: in `math` so the engine's tests and the acoustic track's share one. |

## `engine` — storage and identity

| Type | Why it exists |
|---|---|
| [`Particles<S>`](../crates/engine/src/particles.rs) | Struct-of-arrays storage (`pos`, `vel`, `inv_mass`) whose lengths can't diverge: callers get slices, never the `Vec`s. |
| [`ParticleId`](../crates/engine/src/particles.rs) | Names a particle for constraints; only the engine can make one, so ids come from a real `add`. Plain index: only a grab's anchor is ever removed, and only its `Grab` holds the id. |
| [`StaticId`](../crates/engine/src/particles.rs) | Names an immovable particle (`add_static`): `set_static_position` takes one, so teleporting a dynamic particle doesn't compile. Converts into a `ParticleId` for constraints. A handle, not separate storage: a static is a particle of infinite mass, which every solver handles with no special case, and kick/drift never move it. |
| [`World<S>`](../crates/engine/src/world.rs) | The simulation: particles, forces, constraints, and how a step is taken (integrator, or solver when constraints exist). |
| [`Constraints<S>`](../crates/engine/src/world/constraints.rs) | A world's constraints, one λ each, and the solver settings in one field, so `lambda` can't fall out of step with the list and a solver switch always resets it. |
| [`Grab`](../crates/engine/src/world/drag.rs) | A drag in progress; `release` consumes it (or hands it back if something newer was added), so a grab can't be released twice or leave a stale anchor. |
| [`ConfigError`](../crates/engine/src/world/config_error.rs) | One typed error for every invalid configuration (substeps, softening, mass, unknown particle, β), so scenes return `Result` instead of panicking. |

## `engine` — checked parameters (parse, don't validate)

Each is checked once where the value enters, then trusted
(`type-invariants.md`). All live in [`params/`](../crates/engine/src/params.rs);
every one but `Mass` comes from one macro, `checked_param!`: `new ->
Option` (finite, and the type's own range), `get`, and `cast`, which
checks again in the target scalar (narrowing can overflow to ∞). Since
the audit after A3, no parameter accepts ±∞: an infinite compliance had
made XPBD compute `∞ · 0 = NaN`.

| Type | Why it exists |
|---|---|
| [`Mass<S>`](../crates/engine/src/params/mass.rs) | Positive, finite, with a finite inverse: a bad mass would corrupt every constraint it touches; static particles come only from `add_static`. |
| [`Softening<S>`](../crates/engine/src/params/softening.rs) | ε ≥ 0 (0 allowed: M2 demos it). A negative ε from a slider is reported, not silently squared away. |
| [`OpeningAngle<S>`](../crates/engine/src/params/opening_angle.rs) | Barnes–Hut θ ≥ 0; became a type when θ got a slider. |
| [`Compliance<S>`](../crates/engine/src/params/compliance.rs) | α = 1/stiffness ≥ 0 (0 rigid): both solvers read it as the same spring, so the drag's soft pull means the same thing in either panel. |
| [`Stiffness<S>`](../crates/engine/src/params/stiffness.rs) | A force-based spring's k > 0 and finite (rigid has no force law). |
| [`Damping<S>`](../crates/engine/src/params/damping.rs) | A damper's c ≥ 0 and finite, the same physical damping in every stepper. |
| [`Radius<S>`](../crates/engine/src/params/radius.rs) | A circle's r > 0 and finite; particles without one are points that never collide (radius 0 in `Particles`). |
| [`Restitution<S>`](../crates/engine/src/params/restitution.rs) | e ∈ [0, 1]: 0 inelastic, 1 elastic; above 1 a collision would add energy. |
| [`Baumgarte<S>`](../crates/engine/src/params/baumgarte.rs) | Impulse solver's β in `[0, 1]`: above 1 the bias overshoots. A world setting, so `Solver` stays a plain enum. |
| [`TimeStep<S>`](../crates/engine/src/params/time_step.rs) | `World::step`'s dt > 0 and finite: time can't run backward, stand still (XPBD's velocity is `Δx / h`), or turn NaN. `per_second(rate)` for a clock. |

## `engine` — forces, constraints, stepping

| Type | Why it exists |
|---|---|
| [`Force<S>`](../crates/engine/src/force.rs) | Anything that adds acceleration; `dyn`, because one call per force per step is cheap next to the loop inside. |
| [`UniformGravity<S>`](../crates/engine/src/force.rs) | The same acceleration for every dynamic particle (fountain, pendulum). |
| [`PairwiseGravity<S>`](../crates/engine/src/force.rs) | Exact softened N-body gravity, O(n²), equal and opposite by construction (momentum to rounding). |
| [`BarnesHut<S>`](../crates/engine/src/barnes_hut.rs) | The same gravity in O(n log n) via a quadtree; trades accuracy (θ) and exact momentum for speed past ~200 bodies. |
| [`Spring<S>`, `SpringForce<S>`](../crates/engine/src/force/spring.rs) | Force-based springs with dampers, the M5 baseline: stepped by the integrator, so they explode past `k_crit = 4m/h²`. |
| [`Wall<S>`](../crates/engine/src/collision/wall.rs) | A static half-plane (`UnitVec2` normal into the free side, offset); `distance` is signed meters. Not a particle: no mass or position. |
| [`Segment<S>`](../crates/engine/src/collision/segment.rs) | A static segment with its own restitution (a cushion, M7): closest point on it, ends as rounded corners (pocket jaws). |
| [`Statics<'a, S>`](../crates/engine/src/collision/segment.rs) | Walls and segments borrowed together for a substep, so the narrowphase and both solvers take one argument for everything static. |
| [`Pocket<S>`](../crates/engine/src/collision/pocket.rs) | A sensor circle: pots a ball whose centre enters it; pushes nothing. |
| [`Table<S>`](../crates/engine/src/table.rs) | The cloth (μ_s, μ_r, g): makes a ball with spin slide, roll, and stop, landing exactly on each transition (M7). |
| [`SpringNetwork`, `JellyBody`, `Jelly<S>`](../crates/engine/src/scenarios/jelly.rs) | One grid of pairs realized as force springs or compliant constraints, so the M5 panels differ only in how springs are enforced. |
| [`Constraint<S>`](../crates/engine/src/constraint.rs) | Geometry only (C, ∇C, compliance), so both solvers read the same definition; solvers are generic over it (no `dyn` in the hot loop). |
| [`DistanceConstraint<S>`](../crates/engine/src/constraint.rs) | A rod; to a static particle, a pin. Rest length from current positions, so no invalid length can be passed. |
| [`Integrator`](../crates/engine/src/integrate.rs) | How an unconstrained substep turns acceleration into motion; an enum (closed set, exhaustive matches, a wire code). |
| [`Order`](../crates/engine/src/solver.rs) | The order each Gauss–Seidel pass visits constraints (forward, reverse, alternating): part of the method along a chain. |
| [`Stabilization`](../crates/engine/src/solver.rs) | How the impulse solver corrects rigid rods' position error: classic Baumgarte (energy-faithful; blows up on heavy chains with warm starting) or split impulses (robust; dissipates like XPBD). |
| [`Solver`](../crates/engine/src/solver.rs) | How a constrained substep is taken (XPBD or impulses); owns the whole step when constraints exist. |

## `engine` — scenes and support

| Type | Why it exists |
|---|---|
| [`Fountain`](../crates/engine/src/scenarios/fountain.rs) | The one scene with state between steps (respawning), so it owns its PRNG and the run is deterministic per seed. |
| [`DoublePendulumStart`](../crates/engine/src/scenarios/double_pendulum.rs) | Fixed release positions (horizontal, raised) rather than an angle: arbitrary angles need `sin`/`cos`, whose last bits differ by platform, and the goldens must match on wasm. |
| [`SplitMix64`](../crates/engine/src/rng.rs) | A tiny in-house seeded PRNG: integer-only, so scenes are bit-identical on every platform (`00-scope.md`, dependency policy). |

Scenes without state are functions, not types, one file each under
[`scenarios/`](../crates/engine/src/scenarios/) (`cluster`, `disk`,
`collapse`, `orbit`, `pendulum`, `chain`, `double_pendulum`, `ball_box`,
`break_shot`, `cradle`, `pool_table` / `pool_rack` / `pool_break`),
re-exported by [`scenarios.rs`](../crates/engine/src/scenarios.rs).

## `engine-web` — the wasm boundary

| Type | Why it exists |
|---|---|
| [`Demo`](../crates/engine-web/src/demo.rs) | One running demo (world, clock, render buffer) behind an opaque handle; all export logic as safe, natively tested Rust. |
| [`AnyWorld`](../crates/engine-web/src/demo/any_world.rs) | Runtime scalar choice: JS picks f32 or f64 per demo; each variant is a full engine copy in the `.wasm`. `each_scalar!` / `build_any!` keep every per-scalar `match` to one line. |
| [`Sim<S>`](../crates/engine-web/src/demo/sim.rs) | A world plus what the demo must remember about its force, because `World` keeps forces as `dyn` and can't hand them back. |
| [`SceneForce<S>`](../crates/engine-web/src/demo/sim.rs) | That memory as one enum (none, pairwise with optional θ, uniform), so a θ can't exist without the gravity it approximates. |
| [`BetweenSteps`](../crates/engine-web/src/demo.rs) | What runs between steps: the fountain's respawn, or nothing. |
| [`DemoKind`](../crates/engine-web/src/demo/codes.rs), [`GravityScene`](../crates/engine-web/src/demo/codes.rs), [`ScalarKind`](../crates/engine-web/src/demo/codes.rs) | Wire codes decoded once at the boundary; unknown codes become `None`, never a wrong scene. |
| [`FixedStep`](../crates/web-common/src/fixed_step.rs) (`web-common`) | Turns real frame time into fixed physics steps, so simulation speed doesn't depend on the display's refresh rate; rate is `NonZeroU32`, so it can't hang. |

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
| [`PanelConfig`, `Panel`](../site/js/panels.ts) | Side-by-side panels built one way on every page (all appended before any canvas is sized), each holding its demo; pages spread their own fields onto `Panel`. |
| [`DemoOptions`, `Frame`, `AudioPageOptions`](../site/js/page.ts) | What a page hands the shared lifecycle (`runDemo`, `runAudioPage`): its panels, how to draw one, and one frame's work. The smoke-or-live split, the rates in the HUD and the error path live there once. |
| [`SliderSpec`, `SelectSpec`, …](../site/js/controls.ts) | Control builders that know nothing of the engine; pages wire them to `demo_set_*`. |
| [`SmokePanel`](../site/js/smoke.ts) | What `?smoke` mode checks per panel (steps taken, pixels drawn, finite energy). |

## `sand` — the falling-sand automaton (M9)

| Type | Why it exists |
|---|---|
| [`Grid`](../crates/sand/src/grid.rs) | The automaton: a byte a cell, row-major, row 0 at the top; `step` updates in place and returns the moves (0: settled). Sizes checked once (`MAX_CELLS`); outside is solid. |
| [`Material`](../crates/sand/src/material.rs) | The six materials as a `repr(u8)` enum whose codes are the cell's low 3 bits and the wire codes; `from_code` refuses the rest. `unpack` splits a byte into material and shade, for renderers. |
| [`Chunks`](../crates/sand/src/grid.rs) (crate-private) | Awake flags per 32 × 32 chunk, `now` and `next`, so a settled region costs nothing; exact (a property test: bit-identical to updating every cell). |
| [`Purpose`](../crates/sand/src/random.rs) (crate-private) | What a random draw is for, mixed into the `(seed, step, x, y)` key, so two draws at one cell in one step are independent. |
| [`SandDemo`](../crates/sand-web/src/demo.rs) | A grid, its `FixedStep` clock, the RGBA buffer (rendered through a 256-entry palette) and the brush, behind the `sand_*` C ABI; safe and natively tested. |
| [`SandExports`, `SandHandle`](../site/js/sand.d.ts) | Types for `sand.wasm`'s exports; the handle is branded, like `DemoHandle`. |
| [`Paint`, `SCENES`](../site/js/sand-scenes.ts) | The page's scenes as functions of the grid's size that only call the brush: no scene code in Rust, and unit-testable against an array. |

## `swarm` — boids (S1)

| Type | Why it exists |
|---|---|
| [`Params`](../crates/swarm/src/params.rs) | The rules' constants (ECE 4760's by default), checked once: `0 ≤ protected < visual`, gains ≥ 0, `0 < min ≤ max`. |
| [`Arena`](../crates/swarm/src/params.rs) | The box, two positive finite sides; soft walls, so boids may leave it. |
| [`Flock`](../crates/swarm/src/flock.rs) | The boids as structure of arrays, double-buffered so a step reads one instant whatever the storage order; the step, polarization, the predator. |
| [`Neighbours`](../crates/swarm/src/flock.rs) | Brute force, the grid, or the grid with boids sorted into cell order: the same neighbours, three costs. |
| [`Grid`](../crates/swarm/src/grid.rs) (crate-private) | A cell list by counting sort, cells a hair wider than the range (the property test found why). |
| [`Seen`, `Ranges`](../crates/swarm/src/rules.rs) (crate-private) | What a boid saw, summed one candidate at a time or 8 lanes at once over contiguous runs (the branchless loop SIMD runs). |
| [`SwarmDemo`](../crates/swarm-web/src/demo.rs) | A flock, its clock and its heading-coloured RGBA buffer behind the `swarm_*` C ABI. |
| [`SwarmExports`, `SwarmHandle`](../site/js/swarm.d.ts) | Types for `swarm.wasm`'s exports; a branded handle. |

## `acoustic` — the plucked string (A1)

| Type | Why it exists |
|---|---|
| [`SplitMix64`](../crates/math/src/rng.rs) | The seeded PRNG, in `math` since A1.4 so the engine (scenes) and the acoustic track (noise) share one deterministic generator. |
| [`DelayLine<S>`](../crates/acoustic/src/delay_line.rs) | A ring buffer of samples; `with_capacity` + `reset` re-length it without allocating, which the audio thread requires. |
| [`KsString<S>`](../crates/acoustic/src/string.rs) | The Karplus–Strong loop: delay line, lowpass with the loss folded in, optional allpass. `restring` re-voices it in place. |
| [`Voicing`, `Decay`](../crates/acoustic/src/voicing.rs) | A note's tuning (allpass or integer loop), decay (`Loss(ρ)` or a target `T60`) and stiffness (`B`, A3), turned into coefficients once at note on, with `libm` so they're bit-identical on wasm. |
| [`Excitation`](../crates/acoustic/src/excitation.rs) | What a pluck leaves in the loop (noise, or the Piano Gloves triangle), always zero-mean. |
| [`Voices<S>`](../crates/acoustic/src/voices.rs) | 16 preallocated voices played by MIDI key (each a loop, a waveguide and a piano key's strings): stealing, release, gain and a counted clamp. |
| [`Synth`](../crates/acoustic-web/src/synth.rs) | The worklet's whole state behind the `synth_*` C ABI: voices, settings, and preallocated output and snapshot buffers. |
| [`ProcessorInit`, `ToWorklet`, `FromWorklet`](../site/js/synth-worklet.ts) | The messages between page and worklet as a discriminated union, so a misspelled field or type is a compile error on both sides. Shared by the acoustic pages since A2. |
| [`Waveguide<S>`](../crates/acoustic/src/waveguide.rs) | A2's string: two rails with inverting ends and A1's loop filter at the bridge; positions on the effective length (`fs / 2f₀`), so a pluck or pickup at 1/n really sits on the node. Bit-exact to A1's loop from the same state. |
| [`Model`](../crates/acoustic/src/voices.rs) | Which string a note plays (loop, waveguide, piano); every voice preallocates all three, so the choice never allocates. |
| [`Fft<S>`, `Spectrum<S>`](../crates/acoustic/src/fft.rs) | Our radix-2 FFT and the Hann/dB analyzer around it, everything precomputed so analysis on the audio thread never allocates. |
| [`Live`, `LiveOptions`](../site/js/synth-live.ts) | One way for every acoustic page to start audio and keep the snapshot buffers circulating. |
| [`SynthHandle`](../site/js/acoustic.d.ts) | A branded `*mut Synth`, like the engine's `DemoHandle`. |

## `acoustic` — the piano (A3)

| Type | Why it exists |
|---|---|
| [`Dispersion`](../crates/acoustic/src/dispersion.rs) | A stiff string's allpass cascade: up to 16 biquads as pole pairs, placed (Abel, Välimäki & Smith) then refined; its delay at `f₀` joins the tuning budget. `Copy`, so a stored design re-strings a note without designing. |
| [`Designs`](../crates/acoustic/src/piano.rs) | All 88 keys' cascades, built once when the piano is first chosen (milliseconds a key), looked up at every strike. Valid because the piano's decay is a fixed curve. |
| [`Felt`, `Hammer`](../crates/acoustic/src/hammer.rs) | A key's fitted hammer (mass, felt stiffness, exponent) and a blow in progress: physical units, an energy-conserving step (a discrete gradient), re-contact until it moves away. `Hammer::new` checks every value once, so velocity and felt travel as plain `f64`s. |
| [`Unison<S>`](../crates/acoustic/src/unison.rs) | One key's 1–3 strings, a cent apart, each with its own copy of the hammer; three waveguides sized for A0, re-struck without allocating; output the summed bridge force. |
| [`Body<S>`](../crates/acoustic/src/body.rs) | Five fixed bandpass resonances plus the direct sound, once on the piano's sum (linear, so one is as good as one per voice). |
| `drawTrace`, `DrawColors.stretched` ([`audio-draw.ts`](../site/js/audio-draw.ts)) | The hammer's force plot, and the stiff partials' ticks on the spectrum. |

## Test and tooling crates

| Type | Why it exists |
|---|---|
| [`Tol`](../crates/test-support/src/tol.rs) | Per-scalar tolerances (`EPSILON`, …), so one generic test runs for f32 and f64 with the right bounds. |
| [`BodySpec`](../crates/test-support/src/worlds.rs) | proptest's generated body, shrinkable to a minimal failing world. |
| [`PendulumRun`](../crates/test-support/src/pendulum.rs) | What `01-solvers.md`'s table reports for one run (rod error, energy lost). |
| [`Fnv1a`](../crates/test-support/src/hash.rs) | Stable state hash for golden-hash determinism tests (native and wasm must match). |
| [`Command`](../xtask/src/main.rs) | `cargo xtask` subcommands (clap derive), so `--help`, typos, and ranges are checked. |
