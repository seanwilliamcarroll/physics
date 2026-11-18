#!/usr/bin/env bash
# Push the current gh stack and give each PR its title and body, in one go.
#
#   submit.sh
#
# Each branch's PR text is a file in $PR_BODIES (default
# $TMPDIR/pr-bodies), named after the branch with "/" as "__"
# (tooling/sync -> tooling__sync.md):
#
#   # The PR title
#
#   The body, in Markdown.
#
# A body without the Claude Code attribution line gets it appended.
# Branches without a file keep the title and body they have, so re-running
# after more commits only pushes. New PRs are opened ready for review
# (--open), never as drafts.
set -euo pipefail

dir=${PR_BODIES:-${TMPDIR:-/tmp}/pr-bodies}
attribution='🤖 Generated with [Claude Code](https://claude.com/claude-code)'

# A failed push (usually the pre-push hook) stops here, with the hook's
# last lines, before any PR is touched.
if ! out=$(gh stack submit --auto --open 2>&1) || printf '%s\n' "$out" | grep -q "✗"; then
  printf '%s\n' "$out" | tail -n 25
  echo "submit.sh: push failed; nothing else done" >&2
  exit 1
fi
printf '%s\n' "$out" | grep -E "Pushed|Created|Updated" || true

branches=$(gh stack view --json | jq -r '.branches[] | select(.isMerged | not) | .name')
tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT
for b in $branches; do
  f="$dir/${b//\//__}.md"
  [ -f "$f" ] || continue
  title=$(head -n 1 "$f" | sed 's/^#[[:space:]]*//')
  # The body: everything after the title, leading blank lines dropped.
  tail -n +2 "$f" | sed '/./,$!d' >"$tmp"
  grep -qF "$attribution" "$tmp" || printf '\n%s\n' "$attribution" >>"$tmp"
  gh pr edit "$b" --title "$title" --body-file "$tmp" >/dev/null
  echo "set: $b — $title"
done

gh stack view --short
