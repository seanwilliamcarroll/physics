# Nightly CI

Status: **Done** (C1–C4, 2026-11-13). Still to see: the first scheduled
runs (one that runs, then one on an unchanged `main` that skips). The
plan this was built from, step by step, is in git's history.

## The idea

Checks on every pull request fight the way work lands here: a stack of
PRs loaded at once and merged one by one would run the whole suite per
PR per push. So per-PR CI has been off since #73, and the hooks were the
only gate, which can be skipped (`--no-verify`) or missing on a new
machine.

CI runs **once a night, and only if `main` moved**:

- However many PRs merge in a day, one run covers them all.
- A day with no merges costs a few seconds (a check that finds nothing
  to do).
- It runs what the hooks run, on a clean Linux machine, plus the slow
  tier, which nothing else runs automatically (a manual run of it found
  a real bug: `swarm::MAX_DEPOSIT`).

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
- **Late can mean hours.** The first scheduled run (2026-11-14) was
  queued at 07:17 and started at 14:07; it tested `main` as of 07:17.
  Nothing on our side was wrong (no incident was posted either), so a
  missing run in the morning isn't a fault until it's missing all day.

## How "only if main moved" works

A scheduled workflow always starts. Its first job decides whether the
rest runs:

1. `changed` asks GitHub for the last **successful** run of this
   workflow on `main` and compares that run's commit with `main`'s
   now (it needs `actions: read`).
2. The same commit: the other jobs are skipped, and the run ends in a
   few seconds, shown as skipped.
3. A different commit, or no successful run yet: the other jobs run.

Comparing with the last *successful* run (not the last run) means a
red `main` is tested again every night until it's fixed. That's the
intent: a failure shouldn't go quiet after one night.

A manual run (`gh workflow run Nightly`) always runs everything. Two
options change that:

- `-f fail=true` fails `hooks` at once and skips `slow` and `coverage`:
  a rehearsal of a red night (C4).
- `-f record_coverage=true` runs only `record-coverage`: `cargo xtask
  coverage --record` on the runner, so the coverage record comes from
  the machine the nightly compares on (`04-testing.md`, Coverage). That
  job alone may write (`contents`, `pull-requests`): it pushes the
  record's branch and opens the pull request. If the repository doesn't
  let Actions open pull requests (Settings → Actions → "Allow GitHub
  Actions to create and approve pull requests"), the branch is still
  pushed and the job's log gives the `gh pr create` command.

## What it runs

`.github/workflows/nightly.yml`: three jobs in parallel on `ubuntu-24.04`,
then a report.

| Job | Runs | Takes |
|---|---|---|
| `hooks` | `.githooks/pre-commit`, then `.githooks/pre-push </dev/null`: the scripts themselves, with `HOOKS_STRICT=1` | 10 min 15 s cold (setup 1 min 44 s, `pre-commit` 19 s, `pre-push` 8 min; nextest's 833 tests 80 s, against 20 s on Apple silicon) |
| `slow` | `cargo xtask slow`: every test with property tests at 10 000 cases, then the `slow_*` long runs | 54 min (the first stage 50 min 46 s, the second 47 s); 25 min on Apple silicon. Timeout: two hours |
| `coverage` | `cargo xtask coverage`, compared with `docs/coverage.md`: where coverage fell is in the job's summary, never a failure (`04-testing.md`, Coverage) | a few minutes (not yet measured) |
| `report` | `.github/scripts/nightly-report.sh` | seconds |

- **The hooks, not a copy of them.** The old per-PR workflow listed the
  hooks' commands again and had drifted (six checks missing by the time
  it was deleted). Calling the scripts makes drift impossible: a check
  added to a hook is in CI the same day.
- **Strict mode.** Three checks skip themselves, with a note, when
  their tool isn't installed: nextest (falls back to `cargo test`),
  `cargo machete`, `cargo xtask api --check`. With `HOOKS_STRICT=1` a
  missing tool is a failure. Locally the variable is unset. Shown: with
  each tool hidden in turn, a strict run exits 1 naming it.
- **No push to describe.** `pre-push` reads the pushed refs from stdin,
  for the mutation report. With nothing on stdin it runs every check
  and skips that report.
- **The setup is a composite action**
  (`.github/actions/setup/action.yml`), shared by both jobs so they
  can't drift: `rustup toolchain install` (reads `rust-toolchain.toml`),
  the pinned nightly `cargo xtask api` needs (its name read from
  `xtask/src/api.rs`, not repeated), the Rust build cache, Node from
  `.nvmrc` and `npm ci`, and the tools as prebuilt binaries at pinned
  versions (`cargo-nextest`, `cargo-machete`, `cargo-public-api`,
  `wasmtime`).
- **Actions pinned by commit**, not by tag: a tag can be moved.
- **Permissions:** `contents: read`, `actions: read`; `issues: write`
  on `report` only.
- **On failure,** the smoke test's screenshots are uploaded as an
  artifact.
- **Not in CI:** mutation testing (hours; it stays on the compute
  node), benchmarks (a shared runner's timings mean nothing).

## A failure that can't be missed

GitHub emails the person who last edited a scheduled workflow when it
fails, which is easy to lose. So `report`, on failure, opens an issue
titled "Nightly CI failed" with links to the run and the commits since
the last green one, or comments on that issue if it's already open; and
closes it on the next green run.

Rehearsed on `main`: a manual run takes a `fail` input that fails
`hooks` at once (and skips `slow`). One such run opened
[#247](https://github.com/seanwilliamcarroll/physics/issues/247),
naming `hooks`; the next full manual run, green in every job, closed it
with a link to itself.

## Things to know

- **GitHub pauses scheduled workflows** in a public repository after
  60 days without activity in it. No activity means nothing to test,
  but the schedule needs re-enabling by hand afterwards.
- **Cost:** standard runners are free for public repositories.
- **The goldens on Linux.** The compute node is Linux x86-64 and runs
  the whole suite, so the golden hashes were already known to match
  there; CI repeats that on a clean machine every night `main` moves.
- **The slow tier's second stage** (the seven `slow_*` runs) completed
  under nextest for the first time in CI's trial run.
- **A red night** means `main` is broken for whoever branches next.
  The hooks make that rare; when it happens, the fix is the next PR,
  and the issue says which commits to look at.
