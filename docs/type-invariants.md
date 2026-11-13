# Type-Level Invariants

Status: **Adopted** (M0 cleanup). A standing record: update it when a
decision below changes or a trigger condition is met.

## The idea

*Parse, don't validate* (Alexis King, 2019): check a value once where it
enters the program, and hand the rest of the code a type that cannot hold a
bad value. Callers can't skip the check, and callees don't repeat it.

What it costs here is specific to this project:

- **No panics in library code** (`docs/lint-policy.md`), so a fallible
  constructor returns `Option`/`Result`, and every caller handles it. The
  cost is plumbing, not runtime: a newtype over `f64` compiles to an `f64`.
- **Generic `S: Scalar`.** A check like "positive" needs comparisons that
  work for `f32`, `f64`, and later fixed point. Fine, but every newtype is
  generic too.
- **Hot loops.** Types must not get in the way of struct-of-arrays storage
  (e.g. an enum per particle instead of a plain `S` would).

So a type is worth it when **a bad value is plausible** (it comes from
outside: JS, a slider, user code) **and its failure is bad** (a hang, a
silent wrong answer, a blow-up far from the cause). If the value is a
compile-time constant or a bad value fails loudly at once, a doc comment
and a test are cheaper.

## Already enforced by types (M0)

| Where | Invariant | How |
|---|---|---|
| `Particles` | `pos`, `vel`, `inv_mass` stay the same length | Private `Vec`s; accessors return slices (can edit elements, can't resize) |
| `Particles::add_static` | Static means `inv_mass = 0` and zero velocity, never `1 / 0` | A separate constructor instead of `add(mass = 0)` |
| `World::new`, `set_substeps` | `substeps ≥ 1` | `NonZeroU32` (since the M3/M4 audit; was a `Result`) |
| `ScalarKind`, `DemoKind`, xtask `Command` | Only known codes/commands | Enums parsed once at the boundary (`from_code`, `parse`); `None`/`Err` otherwise |
| `Vec2`, scalar-returning methods | Results aren't silently discarded | `#[must_use]` (`docs/lint-policy.md`) |
| `crates/engine-web/src/abi.rs` | Rust and JS agree on wasm codes | One owner, a mirror, and a test that compares them |
| `demo_set_integrator` (M1) | Only known integrators | Wire code decoded once at the boundary (`integrator_from_code`); unknown codes return 0 |
| `diagnostics::center_of_mass` (M1) | No mean of zero mass | Returns `Option`: `None` rather than `0/0` |
| Exports | Raw pointers only in one module, each with a contract | `unsafe extern "C"`, `# Safety` docs, `#[expect(unsafe_code)]` on the module |

## Adopted in the cleanup PR

**`FixedStep::new(rate: NonZeroU32)`**, previously `new(dt: f64)`. A zero or
negative `dt` made `advance` loop forever (`leftover >= dt` never becomes
false), and only a doc comment said "must be positive". Taking the physics
rate as a nonzero integer makes `dt = 1 / rate` positive and finite by
construction, with a std type and no `Option` plumbing. `PHYSICS_RATE` is a
`const`, so a zero literal fails to compile (verified).

Why this one: the failure was a hang, the cheapest kind of bug to cause and
the hardest to diagnose in a browser tab, and the fix cost nothing.

## Adopted in M1

- **`demo_set_rate(hz)`** parses `u32 → NonZeroU32` at the C boundary, so
  `FixedStep`'s positive-`dt` guarantee reaches all the way to the slider;
  0 is rejected with status 0.
- **JS side** (with `tsc --checkJs`, item 8): branded `DemoHandle` and
  `Ptr` in `site/js/engine.d.ts`, so a handle can't be passed where a count
  or a pointer belongs (verified with swapped arguments); `dom.ts`'s
  `byId(id, Type)` turns "maybe null, maybe the wrong element" into a
  checked, typed element or a clear error; `OPTIONS` entries are a
  discriminated union (`kind: "choice" | "int"`).

## Adopted in M2

- **`Softening<S>`** (item 2 below; trigger: M2's softening slider).
  `Softening::new(eps) -> Option`: `None` for a negative ε or NaN (NaN
  fails `eps >= 0`, so one comparison rejects both); ε = 0 is valid.
  `PairwiseGravity::new` takes it, so the force never re-checks. Before,
  ε was stored squared, which made a negative ε *harmless* but also
  *silent*: a sign error from a slider would have been absorbed rather
  than reported. The scene constants go through the same check once
  (`cluster_gravity`/`orbit_gravity` return `ConfigError::InvalidSoftening`),
  which is more of the item 4 plumbing for errors that can't happen.

- **`OpeningAngle<S>`** (M2.8, same trigger as `Softening`: the θ
  slider). `OpeningAngle::new(θ) -> Option`, `None` for negative or NaN;
  θ = 0 is valid (exact). `BarnesHut::new` became infallible.
  `demo_set_theta` parses at the boundary in `f64` and `cast`s to the
  engine's scalar.

**Triggers re-checked at the end of A1:** the acoustic crate's runtime
settings (`T₆₀`, triangle peak, gain, MIDI key) arrive as `f64`/`u32` at
the `synth_*` boundary and are checked once there (`Synth`'s setters) or
when a note is voiced (`Voicing::coefficients`, which refuses invalid
rates and decays). Item 2's trigger (a runtime-settable physical
parameter) is met in principle; not adopted, because each value has one
entry point and one use, so a newtype would only move the check. Revisit
if A2–A3 pass them around (a hammer, pickup positions). `UnitVec2` and
the rest: unchanged.

**Audit after A3:** the macro-built types checked only their range, so
`Compliance`, `Softening` and `OpeningAngle` accepted ±∞ (`α ≥ 0` holds
for ∞), and an infinite compliance made XPBD compute `∞ · 0 = NaN`. Now
`checked_param!` requires finiteness for every type, and its `cast`
re-checks (`Option`): the old argument that rounding can't leave the range
held only for `[0, 1]`, while a valid `1e300` is `+∞` in `f32`. `Radius`,
`Stiffness` and `Damping`, written out by hand only to get exactly that,
are macro-built now. `World::step` takes a **`TimeStep`** (dt > 0,
finite), the same idea for the engine's most-called function. Statics
got a handle, **`StaticId`** (from `add_static`, taken by
`set_static_position`), and immobility by construction: `kick`, `drift`
and the split impulse drift skip `inv_mass = 0`, so a static given a
velocity still stays put (it drifted before).

**Triggers re-checked at the end of A3:** A1's note asked to revisit
if A2–A3 passed parameters around. A3 does, in two cases:
- **The hammer's velocity** travels `Synth` → `Voices::strike` →
  `Unison::restrike` → `Hammer::new` as a plain `f64`. It is checked
  once, in `Hammer::new` (with the felt and the impedance: positive,
  finite), and a refusal propagates as `false` up to the ABI. The layers
  in between only pass it on, so a `Velocity` newtype would move the
  check, not add one. Not adopted.
- **`Felt`'s fields are public**, so an invalid felt can be built. It
  can't be used, though: the hammer is the only consumer, and it checks.
  Not adopted for the same reason.

`B` arrives per key from the Rigaud model, never from the page. The
dispersion design reads `B ≤ 0` or NaN as "no stiffness", which is right
for the toggle and can't be reached from outside. Item 2 is otherwise
unchanged; `UnitVec2` and the rest too.

**Triggers re-checked at the end of M5:** `Stiffness` and `Damping`
adopted (item 2, trigger: the stiffness and damping sliders); both reject
NaN and infinity, and rigid lives only in `Compliance` (α = 0), since a
force spring has no rigid form. **Item 3's trigger is now met:**
`SpringForce::accumulate` is the second `d / |d|` call site after
`DistanceConstraint::evaluate`, both skipping `|d| = 0` by hand. Not
adopted in M5 (a cross-cutting change); up for decision before M6, whose
contact normals would make three. Item 5's generational `ParticleId` still
waits for general removal.

**Triggers re-checked at the end of M4:** `Compliance` adopted (above),
a milestone early. `UnitVec2` (item 3) still has one call site: the drag
reuses `DistanceConstraint`'s gradient, so M6's contact normals remain the
likely second. Mass types are in; the generational `ParticleId` still
waits for general removal (M4's drag only pops the latest add). No new
runtime-settable parameter is unchecked: order, start, and the drag's
compliance are enums or constants.

**Triggers re-checked at the end of M3:** item 3 (`UnitVec2`) is half
met: `DistanceConstraint::evaluate` is the first `x / |x|` in a constraint
gradient, and it returns `None` at `|x| = 0`. Its trigger asks for a second
call site; M4's chains reuse the same constraint, so likely M6 (contact
normals). Item 2's `Compliance` waits for M5's springs (rods are rigid-only
until then). Item 4 (`NonZeroU32` substeps) was half adopted in M3
(`set_substeps`) and finished in the M3/M4 audit (`World::new`). Item 5's generational `ParticleId` waits for removal.

**Triggers re-checked at the end of M2:** item 1 (mass types) still
waits: masses are still scenario-computed, never user input, and M2 added
no constraint solver. Item 2's other parameters (compliance, restitution,
friction) wait for their sliders. Item 4 (`NonZeroU32` substeps) is
closer: M2 added more `Result` plumbing for errors that can't happen
(`InvalidSoftening` on positive constants), but substeps are still
constants, and one enum variant per invariant is cheap. Item 3
(`UnitVec2`) waits for M3. Barnes–Hut's opening angle θ did get a slider
(M2.8), so it is now a parameter type, below.

**Triggers re-checked at the end of M1:** softening is still a scenario
constant (not settable), so `Softening` (item 2) waits for M2's slider;
mass is still constant per scenario, so item 1 waits for M3; no unit-mixing
bug yet (item 7).

## Adopted before M6

- **`UnitVec2<S>`** (item 3; trigger met in M5: `SpringForce` became the
  second `d / |d|`, after `DistanceConstraint`). In `math`, a private
  field; made only by `Vec2::normalized` or `Vec2::length_and_direction`,
  `None` unless `|x| > 0` (so NaN too). `Constraint::evaluate` returns
  `Option<UnitVec2>`, so the solvers can't receive an unnormalized
  gradient; scaling returns a plain `Vec2`. Still `x / |x|` per
  component, so every golden hash is unchanged (native and wasm). Adopted
  now so M6's contact normals start with it rather than adding a third
  hand-written check.

## Adopted in M4

- **`Compliance<S>`** (item 2; trigger: the drag's soft constraint, a
  milestone before M5's spring slider). `new(α) -> Option`, α ≥ 0, NaN
  rejected; `RIGID` is 0. Shares `checked_param!` with the other interval
  types.

## Adopted in M3

- **`Baumgarte<S>`** (item 2; trigger: the β slider). `new(β) -> Option`
  for `0 ≤ β ≤ 1` (NaN rejected; above 1 overshoots). Not a field of
  `Solver::Impulse`, so `Solver` stays a plain non-generic enum, and β
  survives solver switches.

- **`Mass<S>`** (item 1; trigger: M3's constraint solvers weight every
  correction by `inv_mass`). `Mass::new(m) -> Option`: `None` for
  `m ≤ 0`, NaN, ±∞, or an `m` so small that `1 / m` overflows (e.g.
  `1e-39` in `f32`). `Scalar` has no `is_finite`, so finiteness is read
  through the lossless `to_f64()` (a fixed-point scalar passes trivially);
  `1 / m > 0` is also checked, which only fixed point can fail. The
  inverse is computed once in `new`, the same `1 / m` `add` used to
  compute, so every golden hash is unchanged. `Particles::add` takes a
  `Mass`; `add_static` stays the only way to get `inv_mass = 0`. Scene
  masses go through `Mass::new` once (`ConfigError::InvalidMass`, like
  `InvalidSoftening`); storage is still a plain `Vec<S>` of inverses.
- **`ParticleId`** (item 5, plain-index variant): `add` and `add_static`
  return one; `index()` reads the slot. Only `Particles` creates ids.
  No generation counter: nothing can be removed, so an id can't go
  stale. Item 5's trigger for a generational handle still stands.

## Considered and not adopted

| Where | Invariant | Decision | Why |
|---|---|---|---|
| `World::step(dt)` | `dt ≥ 0`? | No type at M0; **reversed in the audit after A3** (`TimeStep`, above) | The M0 reasoning: a negative `dt` steps backward in time, zero is a no-op, and no loop depends on the sign, so nothing hangs. It stopped holding with the solvers: XPBD's velocity is `Δx / h`, so zero and NaN are no longer harmless. |
| `demo_advance(elapsed_s)` | finite, `≥ 0` | Sanitize, no type | It arrives from JS across the C ABI as a raw `f64`; a type can't be imposed on the caller. `FixedStep::advance` is the parse step: NaN and negatives become 0, long frames are clamped. |
| `SplitMix64::range(lo, hi)`, `FOUNTAIN_VX/VY` | `lo < hi` | Doc + tests | Only called with constants, and tests assert generated values fall in range. |
| Units (s, m, kg) | No mixing | No types | No unit-mixing bug so far, and unit types multiply operator impls (`Meters / Seconds = MetersPerSecond`, ...). Crates that do this well (`uom`) fail the dependency bar for one benefit. |

## Future work and possible extensions

Each item says what would make it worth doing. When a condition is met,
adopt it in that milestone's PR and move the row up.

1. **Mass types: `Mass<S>` / `InvMass<S>` (positive, or zero meaning static).**
   ✅ *`Mass<S>` adopted in M3 (above); no separate `InvMass` type.*
   *Adopt when* constraint solvers start dividing by or weighting with
   `inv_mass` (**M3**), or masses become user input (a slider). An infinite
   `inv_mass` then corrupts every constraint the particle touches, far from
   the cause. Storage stays a plain `Vec<S>`; the type guards `add` only.

2. **Parameter types for physical constants:** `Softening` (ε ≥ 0),
   `Compliance` (α ≥ 0), `Restitution` (0 ≤ e ≤ 1), `Friction` (μ ≥ 0).
   *Adopt each when* the parameter becomes runtime-settable through a
   `demo_set_*` export or slider (M1+ controls), since the export is then
   the boundary where parsing belongs. Until then each is a constant in a
   scenario. Note for **M1/M2**: softening must allow **ε = 0**, because the M2
   demo deliberately sets it to zero to show close encounters exploding.
   So the type is "non-negative", not "positive". **`Softening` adopted in
   M2** (above); the other three wait for their sliders.

3. **`UnitVec2<S>` (normalized direction).** Constraint gradients
   (`n = x / |x|`, `docs/01-solvers.md`) assume unit length, and normalizing
   a zero vector divides by zero. `Vec2::normalized() -> Option<UnitVec2>`
   forces handling the degenerate case. ✅ *Adopted before M6* (above).
   *Adopt when* M3 adds a second call
   site that normalizes, or a bug traces to an unnormalized or zero-length
   direction. It matters more on fixed point (**M8**), where `x / |x|` near
   zero loses all precision.

4. **`NonZeroU32` substeps** in `World::new`. ✅ *Adopted in the M3/M4
   audit*, together with `Baumgarte::default()`, so `World::new` can't
   fail at all. Original trigger: *adopt if* the `Result`
   plumbing keeps propagating errors that can't happen (as `Fountain::world`
   already does for a constant `1`) across several scenarios, or substeps
   become a slider where the export layer parses anyway. The cost is
   call sites: `NonZeroU32::new(4)` returns an `Option`, so constants become
   `const` items like `PHYSICS_RATE`.

5. **`ParticleId` as a checked handle.** ✅ *Plain index adopted in M3
   (above).* *Adopt a generational handle when* particles
   can be removed: a stale plain index would silently refer to a different
   particle.

6. **Fixed-point quantity types** (Q formats per quantity: position,
   velocity, `dt²`, compliance). *Adopt when* M8's range analysis shows that
   one Q16.16 doesn't fit every quantity. Separate types then stop a value
   in one format from being used as another.

7. **Unit-of-measure newtypes** (`Seconds`, `Meters`, `Hz`). *Adopt when*
   a unit-mixing bug happens, or the acoustic track mixes time bases
   (samples at 44.1/48 kHz, physics seconds, frame milliseconds). The
   `FixedStep` rate-vs-`dt` change is a small instance of the same idea.

8. **Checked JS.** ✅ *Adopted in M1.5½ as JSDoc + `tsc --checkJs`; `.ts` source adopted after M1 (below).* *Trigger met at M1.1:* the site JS is 465 lines in 6
   files, and M1's plots, controls, and three-panel page roughly double
   it. Options, cheapest first:
   - **JSDoc types + `tsc --checkJs --noEmit` (recommended).** Files stay
     plain `.js`, served as-is, so there is still no build step and no
     bundler; `tsc` only *checks*, in pre-commit. A hand-written
     `engine.d.ts` types the wasm exports (pointers, codes, return values),
     which is where untyped JS is riskiest: every export takes and returns
     bare numbers.
   - **TypeScript source (`.ts`).** Nicer syntax for types, but browsers
     can't run it, so it needs a compile step (`tsc` emitting into
     `site/`, run by `cargo xtask site`). That loses "edit, reload", adds
     generated files to keep out of git, and buys little over JSDoc at
     this size.
   - **Neither.** Keep `node --check` (syntax only) and rely on the smoke
     test to catch wiring mistakes at runtime.

   Either typed option needs `typescript` (an npm dev tool, Microsoft-
   maintained, very widely used: meets the dependency bar) pinned in a
   `package.json`, which is a dependency-policy entry (`00-scope.md`).

   **`.ts` experiment (after M1), measured on the 11 shared modules in
   `site/js/`, with the demos left as JSDoc `.js` importing them:**

   | | JSDoc `.js` (before) | `.ts` (experiment) |
   |---|---|---|
   | Lines | 927, incl. 141 JSDoc type-tag lines | 928: types moved into signatures |
   | Errors found by converting | n/a | **none**: strict `checkJs` already caught everything |
   | Build step | none: files served as written | `tsc` emits `.js` + maps, 0.14 s; `npm run watch` recompiles on save |
   | Generated files | none | `site/js/*.js`, `*.js.map` (gitignored) |
   | Configs | one `tsconfig.json` | two: check everything; emit the library only |
   | Unit tests | import `.js` | import `.ts` directly (Node 22 type stripping), no build |
   | Debugging in DevTools | the served file | via source maps; `inlineSources` embeds the `.ts`, since static servers send `.ts` as `video/mp2t` |
   | Syntax limits | JSDoc's | `erasableSyntaxOnly`: no `enum`, `namespace`, parameter properties |

   **What `.ts` buys:** readability, not more safety. Signatures carry their
   types; option and spec shapes become named, exported types (`Option`,
   `SliderSpec`, `Scale`); `import type` and `as` replace JSDoc
   comment-casts. **What it costs:** a build step before the site can be
   served, generated files, and a second tsconfig, all cheap with TS 7's
   0.14 s builds and `--watch`.

   **Decision (after M1): adopt.** The shared library stays `.ts`; new pages
   (M2 onward) are written in `.ts`; the M0 and M1 demo pages convert when
   next touched.

9. **Typestate builders** (a world that's "being configured" vs "running"
   as different types). *Adopt when* there is configuration that is invalid
   to change mid-run (e.g. swapping integrators with per-solver state in
   M3). Not needed while every setter is safe at any time.
