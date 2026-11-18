#!/usr/bin/env bash
# After PRs merge on GitHub: bring the repo in the current directory up to
# date and clear away what merged.
#
#   sync.sh [-n] [TRUNK]   (TRUNK defaults to main; -n: delete nothing,
#                          list what would go)
#
# 1. Fetches (pruning deleted remote branches).
# 2. Fast-forwards TRUNK to origin/TRUNK: in place if it's checked out
#    here; by moving the ref if it isn't checked out anywhere; left alone,
#    with a note, if another worktree has it.
# 3. Deletes each local branch whose merged PR's head is exactly the
#    branch's tip, so nothing unpushed is lost (squash merges hide merged
#    branches from git, so GitHub is asked instead). Branches checked out
#    in any worktree are kept.
# 4. Prints TRUNK's last commits, the local branches left, and your open PRs.
set -euo pipefail

dry=
if [ "${1:-}" = -n ]; then dry=1; shift; fi
trunk=${1:-main}
git fetch -q --prune origin

current=$(git branch --show-current)
checked_out=$(git worktree list --porcelain | sed -n 's|^branch refs/heads/||p')

if [ "$current" = "$trunk" ]; then
  git merge -q --ff-only "origin/$trunk"
elif printf '%s\n' "$checked_out" | grep -qxF "$trunk"; then
  echo "note: $trunk is checked out in another worktree; not moved (origin/$trunk is current)"
elif git merge-base --is-ancestor "$trunk" "origin/$trunk"; then
  git update-ref "refs/heads/$trunk" "origin/$trunk"
else
  echo "note: $trunk has commits origin/$trunk doesn't; not moved"
fi

merged=$(gh pr list --state merged --author @me --limit 200 \
  --json headRefName,headRefOid --jq '.[] | "\(.headRefName) \(.headRefOid)"')
deleted=""
while read -r name oid; do
  [ -n "$name" ] || continue
  [ "$name" = "$trunk" ] && continue
  tip=$(git rev-parse -q --verify "refs/heads/$name" 2>/dev/null) || continue
  [ "$tip" = "$oid" ] || continue
  printf '%s\n' "$checked_out" | grep -qxF "$name" && continue
  [ -n "$dry" ] || git branch -q -D "$name"
  deleted="$deleted $name"
done <<EOF
$merged
EOF

echo "== $trunk"
git log --oneline -3 "origin/$trunk"
if [ -n "$deleted" ]; then
  echo "== ${dry:+would be }deleted (merged):$deleted"
fi
echo "== local branches"
git for-each-ref --format='%(refname:short) %(upstream:track)' refs/heads |
  grep -vx "$trunk " || true
echo "== your open PRs"
gh pr list --author @me --json number,headRefName,title \
  --jq '.[] | "#\(.number) \(.headRefName): \(.title)"'
