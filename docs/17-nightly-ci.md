# Nightly CI

Status: **In progress** (C1 done, 2026-11-13).

## The idea

CI in this repo has been off since #73, because checks on every pull
request fight the way work lands here: a stack of PRs loaded at once
and merged one by one would run the whole suite per PR per push. The
hooks have been the only gate, and they can be skipped
(`--no-verify`), or missing on a new machine.

Run CI **once a night, and only if `main` moved**:

- However many PRs merge in a day, one run covers them all.
- A day with no merges costs a few seconds (a check that finds nothing
  to do).
- It runs what the hooks run, on a clean Linux machine, plus the slow
  tier, which nothing runs automatically today (the last manual run
  found a real bug: `swarm::MAX_DEPOSIT`).

What it gives up: a failure is found after the merge, up to a day
later, and is fixed by a follow-up PR. It can't be a *required* check
on a pull request. The hooks stay the first line.

## When it runs

`17 7 * * *`: 07:17 UTC every day.

- GitHub's cron is in UTC and doesn't follow daylight saving. 07:00
  UTC is 2 am Eastern in winter and 3 am in summer: the earliest it is
  ever, locally, is just after 2 am.
- Seventeen past, not the hour: scheduled runs queue behind everyone
  else's, and the top of the hour is the busiest. GitHub may start a
  run late; it doesn't start one early.

## How "only if main moved" works

A scheduled workflow always starts. Its first job decides whether the
rest runs:

1. `changed` asks GitHub for the last **successful** run of this
   workflow on `main` and compares that run's commit with `main`'s
   now.
2. The same commit: the other jobs are skipped, and the run ends in a
   few seconds, shown as skipped.
3. A different commit, or no successful run yet: the other jobs run.

Comparing with the last *successful* run (not the last run) means a
red `main` is tested again every night until it's fixed. That's the
intent: a failure shouldn't go quiet after one night.

A manual run (`workflow_dispatch`) always runs everything.

## What it runs

Two jobs, in parallel, both on `ubuntu-24.04`:

| Job | Runs | About |
|---|---|---|
| `hooks` | `.githooks/pre-commit`, then `.githooks/pre-push`: the scripts themselves | 10 min cold, less cached (to be measured: C2) |
| `slow` | `cargo xtask slow`: every test with property tests at 10 000 cases, then the `slow_*` long runs | 25 min on Apple silicon; unknown on a runner (to be measured: C3) |

**The hooks, not a copy of them.** Today's `ci.yml` lists the hooks'
commands again, and has drifted. Against the hooks as they are now, it
is missing:

- the syntax check of the plain-JS files (`node --check`);
- `sand-web` and `swarm-web` in the wasm32 clippy pass;
- nextest (it runs `cargo test`) and the doctest step;
- `cargo machete`;
- `cargo xtask api --check`;
- the Node version from `.nvmrc` (it hard-codes 22).

Calling the scripts makes drift impossible: a check added to a hook is
in CI the same day.

**Not in CI:** mutation testing (hours; it stays on the compute node),
benchmarks (a shared runner's timings mean nothing).

## The work, as pull requests

### C1. The hooks, runnable by CI

**Done** (2026-11-13). No change to how they behave locally.

- `pre-commit` needed nothing: it has no check that skips itself.
- `pre-push` fails under `HOOKS_STRICT=1` when nextest or
  `cargo machete` is missing; `cargo xtask api --check` reads the same
  variable.
- With nothing on stdin, `pre-push` already ran every check and
  skipped the mutation report. Run from a terminal it used to wait for
  typing; it no longer reads stdin there.
- **Shown:** both hooks pass in strict mode with every tool present;
  with nextest, machete and `cargo-public-api` hidden in turn, each
  strict run exits 1 naming the tool; without strict mode a hidden
  machete is still skipped with a note.

- **Touches:** `.githooks/pre-commit`, `.githooks/pre-push`,
  `docs/04-testing.md`.
- **Strict mode.** Three checks skip themselves, with a note, when
  their tool isn't installed: nextest (falls back to `cargo test`),
  `cargo machete`, `cargo xtask api --check`. With `HOOKS_STRICT=1` a
  missing tool is a failure. Locally the variable is unset.
- **No push to describe.** `pre-push` reads the pushed refs from
  stdin, for the mutation report. With nothing on stdin it must run
  every check and skip that report cleanly. (It may already: to be
  confirmed, with a test either way.)
- **Done when:** `HOOKS_STRICT=1 sh .githooks/pre-commit &&
  HOOKS_STRICT=1 sh .githooks/pre-push </dev/null` passes locally, and
  fails with a tool taken off `PATH`.

### C2. The workflow: nightly, the hooks job

- **Touches:** `.github/workflows/nightly.yml` (new),
  `.github/workflows/ci.yml` (deleted), `docs/04-testing.md` ("CI"),
  `TASKS.md` (the standing note that CI is off).
- **Triggers:** `schedule: 17 7 * * *`, and `workflow_dispatch`.
- **Job `changed`:** as above. Needs `actions: read`.
- **Job `hooks`:**
  1. checkout;
  2. `rustup toolchain install` (reads `rust-toolchain.toml`), and the
     pinned nightly `cargo xtask api` needs (`nightly-2026-10-15`,
     minimal);
  3. the Rust build cache;
  4. Node from `.nvmrc`, `npm ci`;
  5. the tools, at pinned versions: `cargo-nextest`, `cargo-machete`,
     `cargo-public-api`, `wasmtime` (50.0.1, as now);
  6. `HOOKS_STRICT=1 sh .githooks/pre-commit`;
  7. `HOOKS_STRICT=1 sh .githooks/pre-push </dev/null`;
  8. on failure, the smoke test's screenshots as an artifact (as now).
- **Actions pinned by commit**, not by tag: a tag can be moved.
- **Permissions:** `contents: read`, `actions: read`. Nothing else.
- **Merging this turns it on.** `ci.yml` is disabled by hand today;
  `nightly.yml` is a new workflow, and new workflows are enabled. The
  first run should be a manual one, the same day, watched.
- **Done when:** a manual run is green, and the next scheduled run on
  an unchanged `main` shows `hooks` skipped (checked the morning
  after). The run's duration goes in this document.

### C3. The slow tier job

- **Touches:** `.github/workflows/nightly.yml`, `.config/nextest.toml`
  if the runner needs longer than the `slow` profile's hour for one
  test, this document.
- **Job `slow`:** the same setup as `hooks` (shared through a
  composite action, so the two can't drift), then `cargo xtask slow`.
  A job timeout of three hours, to be tightened once measured.
- **Unknown, and the reason this is its own PR:** the longest test
  (acoustic-web's export sequences at 10 000 cases) takes 22 minutes
  on Apple silicon and one core. A hosted runner's core is slower. If
  the tier takes hours there, the fallback is fewer cases in CI
  (`--cases 2000`) with the full count staying a manual run on the
  node.
- **Done when:** a manual run is green and its duration is recorded
  here.

### C4. A failure that can't be missed

- **Touches:** `.github/workflows/nightly.yml`.
- GitHub emails the person who last edited a scheduled workflow when
  it fails, which is easy to lose. This adds a final job that, on
  failure, opens an issue titled "Nightly CI failed" with links to the
  run and the commits since the last green one, or comments on that
  issue if it's already open; and closes it on the next green run.
- Needs `issues: write`, on that job only.
- **Done when:** a deliberately failing manual run (an input that
  makes a step exit 1) opens the issue, and a green one closes it.

### Order

C1, C2, C3, C4, one after another. None depends on the site-demos
plan (`16-site-demos.md`) or blocks it.

## Things to know

- **GitHub pauses scheduled workflows** in a public repository after
  60 days without activity in it. No activity means nothing to test,
  but the schedule needs re-enabling by hand afterwards.
- **Cost:** standard runners are free for public repositories.
- **The goldens on Linux.** The compute node is Linux x86-64 and runs
  the whole suite, so the golden hashes are already known to match
  there; CI repeats that on a clean machine every night `main` moves.
- **A red night** means `main` is broken for whoever branches next.
  The hooks make that rare; when it happens, the fix is the next PR,
  and the issue from C4 says which commits to look at.
