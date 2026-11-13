#!/bin/sh
# The nightly run's last job (docs/17-nightly-ci.md, "A failure that can't be missed"): a failed night
# opens an issue titled "Nightly CI failed", or comments on it if it is
# already open; the next green night closes it. One issue, so a red
# `main` is one thread and not one a night.
#
# From the environment:
#   GH_TOKEN, REPO (owner/name), RUN_URL, HEAD (the commit tested),
#   RESULTS: the jobs' results as "name=result" words, e.g.
#            "hooks=success slow=failure".
#   DRY_RUN=1 prints what would be done and changes nothing.
set -eu

TITLE="Nightly CI failed"

failed=""
ran=""
for pair in $RESULTS; do
  name=${pair%%=*}
  result=${pair#*=}
  case "$result" in
    success) ran="$ran $name" ;;
    failure) failed="$failed $name" ;;
    # skipped (main hadn't moved) and cancelled say nothing either way.
  esac
done

act() {
  if [ "${DRY_RUN:-0}" = "1" ]; then
    echo "would run: gh $*"
  else
    gh "$@"
  fi
}

# The open issue's number, or empty. Matched on the exact title.
issue=$(gh issue list --repo "$REPO" --state open --search "\"$TITLE\" in:title" \
  --json number,title --jq "[.[] | select(.title == \"$TITLE\")][0].number // \"\"")

if [ -n "$failed" ]; then
  # What changed since the last night that passed: where to look.
  last=$(gh run list --repo "$REPO" --workflow nightly.yml --branch main \
    --status success --limit 1 --json headSha --jq '.[0].headSha // ""')
  if [ -n "$last" ] && [ "$last" != "$HEAD" ]; then
    since="Commits since the last green run: https://github.com/$REPO/compare/$last...$HEAD"
  else
    since="No earlier green run to compare with."
  fi
  body=$(printf 'Failed:%s.\n\nRun: %s\nCommit: %s\n%s\n' "$failed" "$RUN_URL" "$HEAD" "$since")
  if [ -n "$issue" ]; then
    echo "Failed:$failed. Commenting on #$issue."
    act issue comment "$issue" --repo "$REPO" --body "$body"
  else
    echo "Failed:$failed. Opening an issue."
    act issue create --repo "$REPO" --title "$TITLE" --body "$body"
  fi
elif [ -n "$ran" ] && [ -n "$issue" ]; then
  # Green only counts if every job that reports here ran and passed.
  case "$RESULTS" in
    *=skipped*|*=cancelled*)
      echo "Not every job ran ($RESULTS): #$issue stays open." ;;
    *)
      echo "Green again. Closing #$issue."
      act issue close "$issue" --repo "$REPO" \
        --comment "Green again: $RUN_URL (commit $HEAD)." ;;
  esac
else
  echo "Nothing to report ($RESULTS)."
fi
