# API audit (after M7)

Status: **audit, with recommendations**, 2026-11-11. Each recommendation
is its own PR, decided separately. Tools: `cargo public-api` (every public
item, from rustdoc JSON; nightly installed, the build stays on the pinned
stable), `cargo modules` (module dependency edges), `cargo machete`
(unused dependencies).

## The crates and their surfaces

| Crate | Kind | Public items | Surface |
|---|---|---|---|
| `math` | library | 91 | `Scalar`, `Vec2`, `UnitVec2`, `convert`, `SplitMix64`, `Fnv1a` |
| `engine` | library | **442** | the world and everything in it; scenes; diagnostics |
| `acoustic` | library | 173 | strings, voices, the piano, measurement |
| `test-support` | dev library | 61 | test worlds, tolerances, hashes |
| `web` | `cdylib` | 0 Rust | the C ABI (`engine.wasm`), typed by `engine.d.ts` |
| `acoustic-web` | `cdylib` | 0 Rust | the C ABI (`acoustic.wasm`), typed by `acoustic.d.ts` |
| `xtask` | binary | — | the build helper |

The two `cdylib`s expose nothing to Rust (everything is `pub(crate)`):
their surface is the C ABI, which `cargo xtask site` already checks
against the hand-written `.d.ts` files (#143), and the call-sequence
property test hammers.

## What's healthy

- **No unused dependencies** (`cargo machete`).
- **No cycles between modules.** Collapsed to top-level modules, both
  libraries form clean layers:
  - `engine`: `params` → `particles` → `force`, `constraint`,
    `collision`, `table` → `integrate` → `solver` → `world` →
    `scenarios` (with `diagnostics`, `barnes_hut` and `sort_key` beside
    them, used, never using upward).
  - `acoustic`: `voicing` at the bottom; `bridge`, `dispersion`,
    `delay_line`, `hammer` → `string`, `waveguide` → `excitation`,
    `unison`, `piano` → `voices`.
  (`cargo modules`' own acyclicity check works item by item and flags
  every type with its own methods; the module-level graph above is
  computed from its edges.)
- **State behind checked types.** `Particles`' vectors are `pub(crate)`,
  read through slices; parameters are newtypes with `new() ->
  Option<Self>`; the one write escape hatch (`vel_mut`) is deliberate and
  tested (statics stay put whatever velocity it sets).

## Where the engine is wider than it needs to be

`engine`'s 442 items are mostly the right ones: `World`'s methods, the
parameter types, forces and constraints, 90 scene constructors and
constants (pages mirror the constants, so they're API). The excess is
in `collision`, which became public module by module as M6 and M7 needed
pieces of it:

| Item | Used outside the engine by | Recommendation |
|---|---|---|
| `collision::pair_impact`, `segment_impact` | nothing | `pub(crate)` |
| `collision::count_tunnels` (the function) | nothing (`World::count_tunnels` is the API) | `pub(crate)` |
| `collision::find_contacts`, `Contact`, `Body`, `Statics`, `CONTACT_MARGIN` | one integration test, `tests/narrowphase_properties.rs` | move that property test into the crate (`collision/narrowphase/properties.rs`), then `pub(crate)` |
| `collision::candidate_pairs`, `broadphase_cell` | the M6 overlay (`web`), the broadphase bench and property test | keep: a page draws them |
| `collision::Wall`, `Segment`, `Pocket` | scenes, tests, `web` | keep: they're what a world is built from |
| `BarnesHut::g_const`, `softening_sq` | nothing | `pub(crate)` |
| `table::rotational_energy` | `web`, tests | move to `diagnostics` beside `kinetic_energy` (re-export from `table` for one release isn't needed: no outside users) |
| `table::slip`, `rolling_spin` | one test (`slip`) | keep: slip is the physics' central quantity, a reasonable readout |

After those, `collision` would expose the static shapes and the two
broadphase pieces a page draws, and nothing about how contacts are
solved: the solver's internals stay free to change (as M7.2's moment of
impact did) without touching any public signature.

## `acoustic`

Narrow already: each public module (`hammer`, `unison`, `fft`, `piano`,
`measure`) is used by `acoustic-web` or by the tests. One exception:
`body` is used only inside the crate → `pub(crate)`. `measure` is
offline analysis (pitch, partials, T₆₀) used by the tests; it's public
because integration tests are outside the crate, which is fine.

## The wasm side: `shell`, and naming

- **Duplicated glue.** The panic hook and its `env.console_error`
  import are copied in `web` and `acoustic-web` (`imports.rs`, 46 and 39
  lines), and `sand-web` (M9) would make a third copy; `FixedStep`
  (with the step cap) lives in `web` and `sand-web` needs it.
  **Recommendation: a `shell` crate** (the layer `03-wasm-shell.md`
  names) holding the panic hook, `FixedStep`, and the boundary helpers
  (`capped`); every `*-web` crate depends on it, no simulation crate
  does. It holds the unsafe `extern` block, so it opts out of
  `unsafe_code = "deny"` locally, as `web`'s exports do.
- **Do the web crates shrink?** Modestly: `web` (2,499 lines) loses
  ~160 (`fixed_step` and `imports`), `acoustic-web` (643) ~40. They stay
  what they are: adapters from a C ABI to their simulation. The gain is
  one copy of the glue, not size.
- **Rename `web` → `engine-web`**, matching `acoustic-web` and `sand-web`
  (each named for the simulation it wraps). The served file stays
  `engine.wasm`; the build artifact becomes `engine_web.wasm`
  (`xtask/src/main.rs`'s `WASM_ARTIFACT`), and docs and paths follow.
  Mechanical, but it touches many files, so its own PR.

## Keeping it narrow: `cargo xtask api`

An audit is a snapshot; surfaces drift a `pub` at a time (that's how
`collision` grew). **Recommendation:** `cargo xtask api` writes each
library's public API (`cargo public-api`, auto-trait and blanket impls
omitted) to `docs/api/<crate>.txt`, checked in. A PR that changes a
surface then shows it as a plain diff, and the pre-push hook fails when
a snapshot is stale (with "run `cargo xtask api`"), as the `.d.ts` check
does for the ABI. The nightly it needs should be pinned by date in
xtask, so the snapshot's format doesn't shift with nightly churn; where
it isn't installed, the check skips with a message rather than failing.

## Order

1. `shell` (unblocks M9's `sand-web`), with the rename in the same
   stack.
2. Narrowing `engine` (`collision`, `BarnesHut`, `rotational_energy`)
   and `acoustic::body`.
3. `cargo xtask api`, recording the narrowed surfaces as the baseline.
