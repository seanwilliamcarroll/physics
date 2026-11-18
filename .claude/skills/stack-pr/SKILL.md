---
name: stack-pr
description: The PR loop in this repo (and ~/personal_site) - syncing after the user says "merged", branching a stack, writing PR bodies once, submitting with gh stack, and waiting on CI, nightly or Amplify. Use whenever a turn starts with "merged"/"all merged"/"continue", before any new branch or stack, when opening or updating PRs, and when asked whether CI, the nightly run or the Amplify build passed.
---

# Stack PRs

Scripts are in `.claude/skills/stack-pr/scripts/` (paths below are from the
repo root; they act on the repo in the current directory). Each prints a
short summary: read it instead of re-running git and gh by hand.

## 1. After the user merges: sync

```sh
.claude/skills/stack-pr/scripts/sync.sh        # -n to see what it would delete
```

It fetches, fast-forwards `main`, deletes local branches whose merged PR's
head is the branch's tip (nothing unpushed is lost), and lists the branches
and open PRs left. Run it at the start of every "merged, continue" turn and
before any new branch, never a hand-written fetch/checkout/merge chain.

**Partial merge of a stack** (some PRs merged, the rest open): merge
`origin/main` into the lowest unmerged branch, resolve, then merge each
branch into the one above it, and push. Never `gh stack rebase` pushed
branches: that needs a force push.

## 2. Branch

- `gh stack init <first-branch>` from the synced `main`; `gh stack add
  <next-branch>` for each further PR. Branch names: `<area>/<what>`.
- One PR per TASKS.md section (or per self-contained change). Commit small
  and often; every commit passes the pre-commit hook, so run
  `cargo fmt && cargo clippy -q` before committing, not after.
- Commit messages end with the attribution line given in the session.

## 3. PR text: write it once, as a file

Write each body with the Write tool to
`$TMPDIR/pr-bodies/<branch with / as __>.md`, never in a heredoc inside a
command:

```markdown
# Title: what changed, plain words

One or two sentences: what this does and why.

- **The change**, one bullet per visible effect.

## Checked

- What was run or measured, and what it showed.
```

The script adds the Claude Code attribution line if it's missing.

## 4. Submit

```sh
.claude/skills/stack-pr/scripts/submit.sh
```

It pushes the stack (`gh stack submit --auto --open`: ready for review,
never drafts), then sets each PR's title and body from its file. After
more commits, run it again: it pushes, and a changed body file updates
that PR. Don't `gh pr edit` bodies by hand.

**Never merge** (`gh pr merge`, `gh stack merge`): the user merges on
GitHub. Report the PR links and stop.

## 5. CI

```sh
.claude/skills/stack-pr/scripts/ci-status.sh [PR]      # a PR's checks (personal_site)
.claude/skills/stack-pr/scripts/ci-status.sh --nightly # physics: CI is nightly, not per PR
.claude/skills/stack-pr/scripts/ci-status.sh --amplify # personal_site's Amplify build
```

Each waits, then prints the result and only the failing log's tail. Run it
in the background (`run_in_background`) when there's other work to do.
If it says aws isn't logged in, ask the user to run `aws login`.

## Mutants runs from the node

When the user has copied a run back (`mutants_<node>_<sha>.out/`):

```sh
cargo xtask mutants-report DIR --commit SHA --previous OLD_DIR --summary
cargo xtask mutants-report DIR --commit SHA --file <path>   # one file in full
```

Skip `[gone]` mutants (their code has changed since); triage the rest
per `docs/04-testing.md`, "Mutation testing".
