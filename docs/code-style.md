# Code style: names and comments

How this repo's code is named and commented, and the procedure for
bringing a crate in line with it. The first crate done this way is
`sand` (#343); read its source as the worked example.

## The goal

Someone dropping into any file, at any line, can tell what each name
holds and why the code is the way it is, without the history of how it
got there. Code should explain itself through its names and structure;
comments are for what the code can't say.

## Names

**Spell names out.** Prefer long, descriptive names over short ones:

| Instead of | Write |
|---|---|
| `g`, `w`, `h` | `grid`, `width`, `height` |
| `c`, `m`, `s` | `cell_byte`, `material`, `shade` (what it is, not its type) |
| `i`, `k` | `index`, `offset`, `chunk_number`, `key`: whatever it counts |
| `lo`, `hi` | `first_x`, `end_x` (the role: inclusive start, exclusive end) |
| `d`, `n`, `r`, `t` | `distance`, `cell_count`, `roll`, `target` |
| `cx`, `sx`, `wx` | `chunk_x`, `side_x`, `water_x` |
| `a`, `b` (pairs) | what each one is: `now`/`next`, `from`/`to`, `chunked`/`every_cell` |
| `STEP_MUL` | `STEP_MULTIPLIER` |
| `frac`, `cnt`, `idx`, `tmp` | `fraction`, `count`, `index`, and a name for what it holds |

**Kept short, on purpose:**

- Coordinates and their parts: `x`, `y`, `vx`, `vy`, `dx`, `dy`, `dz`.
- Inside a short function that implements a cited equation, the
  paper's symbols, with one comment naming the source and the symbols
  (`// Abel et al. 2006, eq. 3: τ₀ the delay at f₀, …`). Everywhere else,
  formula symbols become words: `fs` → `sample_rate`, `f0` →
  `fundamental_hz`, `b` → `inharmonicity`, `w` (angular frequency) →
  `omega`, `t60` → `decay_time_60db`.
- `rng` for a random number generator; closure parameters in one-line
  iterator chains, if the chain names the thing (`.map(|boid| boid.x)`
  over `.map(|b| b.x)`, but `|&(x, y)|` is fine).
- Test function names are already sentences; leave them.

**Public API names are in scope.** Rename a short or unclear public
field, method, function, type or constant, and update every caller in the
workspace (`crates/`, `xtask/`, benches, tests, `docs/` text). Then run
`cargo xtask api` to refresh `docs/api/`.
**Except** the C ABI: functions marked `#[unsafe(no_mangle)]` in the
`*-web` crates (their names are what the TypeScript in `site/` calls)
and the `site/js/*.d.ts` declarations. Don't rename those in a crate
pass; list candidates in your report instead.

**Clippy's naming lints are on** (pedantic): `struct_field_names` refuses
a field that repeats its struct's name (`Chunks::chunks_across` →
`columns`), `similar_names` flags near-identical names, and
`many_single_char_names` the opposite problem. Fix the name, don't
silence the lint.

## Comments

**Remove:**

- History: dates, PR numbers (`#324`), milestone tags (`M9.4`, `S3`),
  "found by the mutation run at 16cea2a", "was …, now …", "until
  2026-11-17 …", "used to", "no longer", what an earlier version did.
- Transitional notes: migration steps, "kept for compatibility", notes
  about how code moved between files.
- Sweep and experiment narratives: which builds were tried and how each
  one did. The experiment's README has them.
- Restatements of the code: `// increment the counter`, a doc comment
  that only repeats the function's name.
- Long explanations of straightforward code.

**Keep, shortened:**

- **The why of non-obvious code**, above all performance choices: one or
  two lines naming the reason and the key number, e.g. "Out of line in
  wasm: inlined, it made `step_sorted` too big for V8 (2.26 ms at 10k
  against 1.69)." Drop the dates and the story of how it was found.
- **Invariants and safety:** what must hold, and why a check exists.
- **A test's bound and where it came from:** "measured 0.5013, bound
  ±1%". The measured value justifies the tolerance
  (`docs/04-testing.md`).
- **Doc comments on public items:** what it is or does, units, what
  `None`/`false` means. One to three lines.
- **Module docs:** one to three lines, with a pointer to the design doc
  where there is one (`docs/11-falling-sand.md`, "Chunks"). Pointers into
  `docs/` are fine; pointers to commits and PRs aren't.
- **Lint expectations' reasons** (`#[expect(clippy::…, reason = "…")]`):
  keep them, short.

## Rules for the pass

- **No behaviour change.** Renames and comments only, plus small
  readability refactors that are obviously equivalent (a helper for a
  formula written out three times, a type alias for a repeated tuple).
- **Hot loops: renames only, no restructuring.** Don't reorder float
  operations (results are tested bit-for-bit in places), and don't split,
  merge, inline or extract functions in these files: `swarm/src/rules/`
  (the lane loop), `swarm/src/flock/`, `swarm/src/grid.rs`,
  `swarm/src/vicsek.rs`, `sand/src/rules.rs`, `engine/src/force/`,
  `acoustic/src/dispersion*`, `acoustic/src/waveguide*`. `#[inline]`,
  `#[inline(never)]` and `#[cold]` attributes stay exactly as they are.
- **Tuning values and constants keep their values.** Rename them if their
  names are unclear; never change the number.
- **Tests:** rename locals in tests as in source. Keep every assertion
  and bound; keep the messages, renamed to match.
- **Edit with the Edit and Write tools.** No `python3` or `sed` scripts
  doing find-and-replace across files: a word-boundary replace of `w` or
  `g` hits strings and other identifiers. A reviewed `perl -pi` on one
  exact multi-character identifier is acceptable.

## Procedure, one crate

1. Read every file in the crate (`src/`, `tests/`, `benches/`) before
   editing any.
2. Edit file by file.
3. After each file or two: `cargo fmt -p CRATE`, then
   `cargo clippy -q -p CRATE --all-targets` (no warnings), and for a
   `*-web` crate also `cargo clippy -q -p CRATE --target
   wasm32-unknown-unknown`.
4. For a public rename: `grep -rnw OLD crates xtask site docs` and update
   every use, then `cargo check -q --workspace --all-targets`.
5. `cargo test -q -p CRATE` and the crates that depend on it. All must
   pass, unchanged.
6. `cargo xtask api`; commit `docs/api/CRATE.txt` if it changed.
7. Commit in small logical steps (e.g. one commit per module), each
   passing the pre-commit hook. Messages: what changed in plain words,
   ending with the session's `Co-Authored-By` line.

## The report (for a pass handed to a subagent)

- The commits, one line each.
- Every public rename, old → new, and the files it touched outside the
  crate.
- Anything left alone on purpose, and why (an ABI name, a hot loop you
  didn't restructure, a name you weren't sure about).
- Comments you were unsure whether to keep.
- The final `cargo test` and `cargo clippy` result lines.
