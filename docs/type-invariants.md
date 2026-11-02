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
| `World::new` | `substeps ≥ 1` | `Result<_, ConfigError>` (runtime check, typed error) |
| `ScalarKind`, `DemoKind`, xtask `Command` | Only known codes/commands | Enums parsed once at the boundary (`from_code`, `parse`); `None`/`Err` otherwise |
| `Vec2`, scalar-returning methods | Results aren't silently discarded | `#[must_use]` (`docs/lint-policy.md`) |
| `crates/web/src/abi.rs` | Rust and JS agree on wasm codes | One owner, a mirror, and a test that compares them |
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

## Considered and not adopted

| Where | Invariant | Decision | Why |
|---|---|---|---|
| `Particles::add(mass)` | `mass > 0` | Doc comment | Today every mass is the constant `S::ONE`. With `mass ≤ 0`, `inv_mass` becomes infinite or negative, but nothing in M0 consumes `inv_mass` except "is it zero" and diagnostics. See **Mass types** below for when this flips. |
| `World::step(dt)` | `dt ≥ 0`? | No type | A negative `dt` is meaningful: it steps backward in time (velocity Verlet is time-reversible in exact arithmetic; symplectic Euler isn't time-symmetric, so it only approximately retraces). Zero is a tested no-op. NaN only comes from a caller bug and `Scalar` makes no NaN promises. No loop depends on the sign, so nothing hangs. |
| `World::new(substeps)` | `substeps ≥ 1` | Keep `Result` | Decided in M0 (`docs/02-core-types.md`): `NonZeroU32` is the type-level alternative. See **`NonZeroU32` substeps** below. |
| `demo_advance(elapsed_s)` | finite, `≥ 0` | Sanitize, no type | It arrives from JS across the C ABI as a raw `f64`; a type can't be imposed on the caller. `FixedStep::advance` is the parse step: NaN and negatives become 0, long frames are clamped. |
| `SplitMix64::range(lo, hi)`, `FOUNTAIN_VX/VY` | `lo < hi` | Doc + tests | Only called with constants, and tests assert generated values fall in range. |
| Units (s, m, kg) | No mixing | No types | No unit-mixing bug so far, and unit types multiply operator impls (`Meters / Seconds = MetersPerSecond`, ...). Crates that do this well (`uom`) fail the dependency bar for one benefit. |

## Future work and possible extensions

Each item says what would make it worth doing. When a condition is met,
adopt it in that milestone's PR and move the row up.

1. **Mass types: `Mass<S>` / `InvMass<S>` (positive, or zero meaning static).**
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
   So the type is "non-negative", not "positive".

3. **`UnitVec2<S>` (normalized direction).** Constraint gradients
   (`n = x / |x|`, `docs/01-solvers.md`) assume unit length, and normalizing
   a zero vector divides by zero. `Vec2::normalized() -> Option<UnitVec2>`
   forces handling the degenerate case. *Adopt when* M3 adds a second call
   site that normalizes, or a bug traces to an unnormalized or zero-length
   direction. It matters more on fixed point (**M8**), where `x / |x|` near
   zero loses all precision.

4. **`NonZeroU32` substeps** in `World::new`. *Adopt if* the `Result`
   plumbing keeps propagating errors that can't happen (as `Fountain::world`
   already does for a constant `1`) across several scenarios, or substeps
   become a slider where the export layer parses anyway. The cost is
   call sites: `NonZeroU32::new(4)` returns an `Option`, so constants become
   `const` items like `PHYSICS_RATE`.

5. **`ParticleId` as a checked handle.** Deferred to **M3** already
   (`docs/02-core-types.md`). *Adopt a generational handle when* particles
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

8. **Checked JS.** JSDoc types checked by `tsc --checkJs` (or moving the
   site to TypeScript). *Adopt when* the shared site JS grows past a few
   hundred lines (M1's plots and controls), or a type-shaped JS bug costs
   real time. Needs an npm package (`typescript`), so it needs a
   dependency-policy entry, even as a dev tool.

9. **Typestate builders** (a world that's "being configured" vs "running"
   as different types). *Adopt when* there is configuration that is invalid
   to change mid-run (e.g. swapping integrators with per-solver state in
   M3). Not needed while every setter is safe at any time.
