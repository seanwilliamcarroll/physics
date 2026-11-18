#!/usr/bin/env bash
# Wait for CI and print only what matters: the outcome, and the tail of
# whatever failed.
#
#   ci-status.sh [PR|BRANCH]    a PR's checks (default: the current
#                               branch's), waiting up to 2 min for them to
#                               appear, then watching to the end
#   ci-status.sh --nightly      the latest run of the nightly workflow on
#                               main, watched if still running
#   ci-status.sh --amplify [BRANCH]
#                               the latest AWS Amplify job for BRANCH
#                               (default main): waited for, then each
#                               step's status and its WARN/ERROR lines.
#                               App: $AMPLIFY_APP_ID, else the app whose
#                               repository matches this repo's origin.
#                               Region: $AWS_REGION, else us-east-1.
#
# Exits non-zero if what it watched failed.
set -uo pipefail

TAIL=${CI_TAIL:-60}

failed_logs() { # run ids on stdin
  sort -u | while read -r id; do
    [ -n "$id" ] || continue
    echo "== failed: run $id"
    gh run view "$id" --json jobs --jq '.jobs[] | select(.conclusion=="failure") | "  job: \(.name)"'
    gh run view "$id" --log-failed 2>/dev/null | tail -n "$TAIL" | cut -c1-220
  done
}

pr_checks() {
  local pr=${1:-$(git branch --show-current)}
  local i
  for i in $(seq 12); do
    gh pr checks "$pr" 2>&1 | grep -q "no checks reported" || break
    [ "$i" = 12 ] && { echo "no checks on $pr after 2 min"; return 1; }
    sleep 10
  done
  gh pr checks "$pr" --watch --fail-fast --interval 15 >/dev/null 2>&1
  local rc=$?
  gh pr checks "$pr" 2>&1 | cut -f1,2,3
  if [ "$rc" -ne 0 ]; then
    gh pr checks "$pr" --json bucket,link --jq '.[] | select(.bucket=="fail") | .link' |
      sed -n 's|.*/runs/\([0-9]*\).*|\1|p' | failed_logs
  fi
  return "$rc"
}

nightly() {
  local id status
  id=$(gh run list --workflow nightly.yml --branch main -L 1 --json databaseId --jq '.[0].databaseId')
  [ -n "$id" ] || { echo "no nightly runs"; return 1; }
  status=$(gh run view "$id" --json status --jq .status)
  [ "$status" = completed ] || gh run watch "$id" --interval 30 >/dev/null 2>&1
  gh run view "$id" --json headSha,createdAt,conclusion,jobs \
    --jq '"run '"$id"' on \(.headSha[0:8]) at \(.createdAt): \(.conclusion)", (.jobs[] | "  \(.name): \(.conclusion)")'
  [ "$(gh run view "$id" --json conclusion --jq .conclusion)" = success ] && return 0
  echo "$id" | failed_logs
  return 1
}

amplify() {
  local branch=${1:-main} region=${AWS_REGION:-us-east-1} app=${AMPLIFY_APP_ID:-}
  aws sts get-caller-identity >/dev/null 2>&1 ||
    { echo "aws isn't logged in: have the user run \`aws login\`"; return 1; }
  if [ -z "$app" ]; then
    local repo
    repo=$(git remote get-url origin | sed -E 's|.*[:/]([^/]+/[^/]+)$|\1|; s|\.git$||')
    app=$(aws amplify list-apps --region "$region" \
      --query "apps[?ends_with(repository, '$repo')].appId | [0]" --output text)
    [ -n "$app" ] && [ "$app" != None ] || { echo "no Amplify app for $repo; set AMPLIFY_APP_ID"; return 1; }
  fi
  local job status i
  for i in $(seq 60); do
    read -r job status < <(aws amplify list-jobs --app-id "$app" --branch-name "$branch" \
      --region "$region" --max-items 1 --query 'jobSummaries[0].[jobId,status]' --output text)
    [ -n "${job:-}" ] || { echo "no Amplify jobs for $branch"; return 1; }
    case "$status" in PENDING|PROVISIONING|RUNNING|CANCELLING) sleep 20 ;; *) break ;; esac
  done
  echo "amplify $branch job $job: $status"
  local dir
  dir=$(mktemp -d)
  aws amplify get-job --app-id "$app" --branch-name "$branch" --job-id "$job" --region "$region" \
    --query 'job.steps[].[stepName,status,logUrl]' --output text |
    while read -r name st url; do
      echo "  $name: $st"
      [ "$url" != None ] || continue
      curl -fsS -o "$dir/$name.log" "$url" || continue
      # Amplify tags all of nvm's stderr [WARNING] (the download, its
      # progress bar, the checksum), and tool summaries say "0 errors".
      grep -n -i -E "warn|error" "$dir/$name.log" |
        grep -v -E '#{5,}|[0-9.]+%$|Downloading https://nodejs|[Cc]hecksum|\b0 (errors|warnings)\b' |
        cut -c1-220 | head -n 20 | sed 's/^/    /'
    done
  echo "full logs: $dir"
  [ "$status" = SUCCEED ]
}

case "${1:-}" in
  --nightly) nightly ;;
  --amplify) shift; amplify "${1:-}" ;;
  -h|--help) sed -n '2,/^set /p' "$0" | sed '$d; s/^# \{0,1\}//' ;;
  *) pr_checks "${1:-}" ;;
esac
