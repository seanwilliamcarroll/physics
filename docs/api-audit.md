# API audit (after M7)

Status: **Done** (2026-11-11, #160–#164). A short record; the audit's
tables and reasoning are in git's history. Each crate's surface today is
in `docs/api/`.

Tools: `cargo public-api` (every public item, from rustdoc JSON, on a
pinned nightly; the build stays on the pinned stable), `cargo modules`
(module dependency edges), `cargo machete` (unused dependencies).

## What it found, and what was done

- **Healthy:** no unused dependencies; no cycles between modules (both
  `engine` and `acoustic` form clean layers); state behind checked
  types.
- **`engine` was wider than it needed to be,** mostly in `collision`,
  which had become public piece by piece as M6 and M7 needed it.
  Narrowed (#162): `engine` 442 → 421 public items, `acoustic` 173 →
  166. The narrowphase is crate-private, and its property test moved
  into the crate (`collision/narrowphase/properties.rs`). What a page
  draws stayed public (`candidate_pairs`, `broadphase_cell`, the static
  shapes). The solver's internals can change without touching a public
  signature.
- **Duplicated wasm glue.** The panic hook and `FixedStep` were copied
  per `*-web` crate. Now one copy, in **`web-common`** (#160; named at
  review: `shell` read as a Unix shell, `-core` as the simulation the
  web crates wrap). Every `*-web` crate depends on it; no simulation
  crate does.
- **`web` renamed `engine-web`** (#161), matching the other `*-web`
  crates. The served file stays `engine.wasm`.

## Keeping it narrow

An audit is a snapshot; surfaces drift a `pub` at a time. So **`cargo
xtask api`** (#164) writes each library's public API to
`docs/api/<crate>.txt`, checked in, and the pre-push hook fails while a
snapshot is stale: a change to a surface shows in the PR's diff
(`docs/api/README.md`). The `cdylib`s expose nothing to Rust; their
surface is the C ABI, checked against the `.d.ts` files by `cargo xtask
site`.

## Health check (2026-11-18)

- **Healthy:** no `mod.rs`, every module directory with its hub file,
  nothing deeper than three levels; no unused dependencies (`cargo
  machete`); the API snapshots current; nothing large in git's history.
- **Narrowed:** public items no other crate, test, bench or page used,
  and that no public item's docs or signatures need: 32 of them, mostly
  `acoustic` (`DelayLine`; the hammer's cheap contact model, now
  test-only: only the offline fit runs it). Kept on purpose: the
  scenarios' constants (their functions' docs link them: a scenario's
  parameters are its contract), constants public docs cite
  (`RELEASE_T60`, `PREDATOR_RANGE`), trait methods.
- **Split:** `swarm`'s `ants.rs` (610 lines, the largest library file;
  next 392): the painting in `ants/paint.rs`.
- **The workspace version** inherited by every crate (cargo warned on
  every build).
- **Left as is:** `swarm`'s five simulations flat at its root (distinct
  names, ~60 items; modules would rename every web crate's imports for
  nothing); the demos' few repeated setup lines (each already one call
  to a shared helper; `site/js/page.ts` keeps setup per page on
  purpose).
