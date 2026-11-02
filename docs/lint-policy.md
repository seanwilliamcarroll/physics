# Lint Policy

Status: **Adopted** (M0)
Source of truth: root `Cargo.toml` (`[workspace.lints]`) and `clippy.toml`.
This doc records *why*; change the config and this doc in the same commit.

## Summary

Every crate opts in with `[lints] workspace = true`; nothing is repeated
per crate.

- `pedantic` on, minus three lints that fight physics notation
- library-safety restriction lints denied (`panic`, `unwrap_used`,
  `print_stdout`, …)
- tests exempted via `clippy.toml`'s `allow-*-in-tests` settings
- `f32::mul_add` / `f64::mul_add` disallowed (determinism)

## Why not per-crate attributes

A per-crate `#![cfg_attr(not(test), ...)]` block would repeat in every
crate, and a macro can't stamp it out: a macro can't emit crate-level `#![...]` attributes (tested), and the
`clippy.toml` test exemptions remove the need to repeat a block in each crate.

## Rules that come with it

- **Integration tests:** every `tests/*.rs` starts with `#![cfg(test)]`.
  Clippy only exempts code inside `#[test]` fns or `#[cfg(test)]` scopes,
  and generic test bodies (`fn free_fall<S>()`, called by macro-generated
  `#[test]` fns) and `tests/common/` helpers are neither. A crate-level
  `#![cfg(test)]` puts the whole file, `mod common` included, in scope
  (tested both ways). Unit tests in `src/` already sit in
  `#[cfg(test)] mod tests`.
- **`xtask`** is a CLI: `#![allow(clippy::print_stdout, clippy::print_stderr)]`
  at the top of `main.rs`. Cargo can't mix `workspace = true` with per-crate
  overrides, so the override goes in source.
- **`web`:** `#[expect(unsafe_code, reason = "...")]` on the exports module only.
- **`#[must_use]` on value types** (`Vec2`, later `Fixed`, `ParticleId`).
  Discarding one is then a rustc warning at the call site (`v.perp();`), and
  clippy stops asking for `#[must_use]` on each method that returns one.
  Not on containers that are mutated in place (`Particles`, `World`).
  For functions returning plain scalars (`dot -> S`, `len`),
  `must_use_candidate` makes us annotate the function itself (tested:
  without it, `v.dot(w);` compiles silently).
- **Local exceptions** use `#[expect(lint, reason = "...")]`, not `#[allow]`.
  `expect` fails if the lint stops firing, so stale exceptions don't build up.

## Perf and numeric lints: on vs off

| Lint | Group | Decision | Why |
|---|---|---|---|
| `perf` group | default | **on** | Already on by default (e.g. `manual_memcpy`, `large_enum_variant`) |
| `trivially_copy_pass_by_ref` | pedantic | **on** | `Vec2<f32>` is 8 bytes: pass by value |
| `large_types_passed_by_value`, `needless_pass_by_value` | pedantic | **on** | The other direction: don't copy big things |
| `inline_always` | pedantic | **on** | `#[inline(always)]` only with a benchmark to justify it |
| `cast_precision_loss` | pedantic | **on** | `n as f32` loses precision above 2²⁴: relevant for `f32` counts |
| `cast_possible_truncation`, `cast_sign_loss`, `cast_possible_wrap`, `cast_lossless` | pedantic | **on** | Your list; `pedantic` already covers them |
| `float_cmp` | pedantic | **on** | `==` on floats in library code is usually a bug. Tests compare bits with `to_bits()` or use tolerances |
| `suboptimal_flops` | nursery | **off** | Rewrites `a*x + y` into `mul_add` (tested). FMA changes results, so the determinism and golden-hash goals rule it out |
| `imprecise_flops` | nursery | **off** | Suggests `hypot`, `ln_1p`, …: slower libm calls that aren't guaranteed to match across platforms |
| `missing_inline_in_public_items` | restriction | **off** | Generic code (`Vec2<S>`) is monomorphized in the caller anyway, release uses LTO, and rustc already inlines small functions across crates |
| `float_arithmetic` | restriction | **off** | Forbids floats entirely; that's for no-FPU targets |
| `arithmetic_side_effects` | restriction | **revisit at M8** | Flags integer overflow: exactly what Q16.16 `Fixed` needs, but too noisy before then |
