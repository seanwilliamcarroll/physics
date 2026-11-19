#!/usr/bin/env python3
"""Drain a queue of benchmark and profiling jobs on one machine.

Each job names a git ref and a command. The queue is a JSON file read
straight from a git ref (by default `queue.json` on origin's `bench-queue`
branch), so adding work is a push there and the machine needs no `git pull`.
Every job runs in this machine's own worktree, outside the repository
(`~/sweep-results/queue/<machine>/worktree`), checked out at the job's
commit: what is measured is that commit, whatever `~/physics` has checked
out, and a `git pull` there mid-run changes nothing. Results go to
`~/sweep-results/<out>/<machine>` (the job's `{out}`), outside any checkout.

Jobs run one at a time, in the file's order. A job is done once it ran
at the commit its ref names now; push a new commit to the ref and it runs
again. A failed job is skipped on later runs (`--retry-failed` reruns it).
`touch ~/sweep-results/queue/<machine>/STOP` stops after the current job.
On macOS the run holds `caffeinate -is`. Stdlib only; see README.md.
"""

import argparse
import fcntl
import json
import os
import platform
import re
import signal
import subprocess
import sys
import time
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
RESULTS = Path.home() / "sweep-results"
DEFAULT_QUEUE = "origin/bench-queue:queue.json"
ID = re.compile(r"^[A-Za-z0-9._-]+$")
HEX = re.compile(r"^[0-9a-f]{7,40}$")

# A job runs under bash in the worktree. nvm (if installed) picks the Node
# the job's commit pins in .nvmrc; a tmux command's shell doesn't load it.
PRELUDE = '[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh" && nvm install >/dev/null 2>&1\n'


def git(*args, cwd=REPO, capture=True):
    r = subprocess.run(["git", *args], cwd=cwd, text=True,
                       capture_output=capture, check=False)
    if r.returncode != 0:
        raise RuntimeError(f"git {' '.join(args)}: {(r.stderr or '').strip()}")
    return (r.stdout or "").strip()


def load_queue(spec):
    """`REF:PATH` read with git show, or a file on disk."""
    if Path(spec).expanduser().is_file():
        text = Path(spec).expanduser().read_text()
    else:
        text = git("show", spec)
    jobs = json.loads(text)
    if isinstance(jobs, dict):
        jobs = jobs["jobs"]
    seen = set()
    for job in jobs:
        jid = job.get("id", "")
        if not ID.match(jid):
            raise SystemExit(f"queue: bad or missing id {jid!r}")
        if jid in seen:
            raise SystemExit(f"queue: duplicate id {jid!r}")
        seen.add(jid)
        for key in ("ref", "cmd"):
            if key not in job:
                raise SystemExit(f"queue: job {jid} has no {key!r}")
    return jobs


def command_for(job, machine):
    """The job's command on this machine, or None if it doesn't run here.

    `cmd` is one string for every machine in `machines` (all if absent),
    or an object mapping each machine to its own command."""
    cmd = job["cmd"]
    if isinstance(cmd, dict):
        return cmd.get(machine)
    machines = job.get("machines")
    return cmd if machines is None or machine in machines else None


def resolve(ref):
    """The commit a ref names: a sha as given, else origin's branch or tag."""
    candidates = [ref] if HEX.match(ref) else [f"origin/{ref}", ref]
    for c in candidates:
        try:
            return git("rev-parse", "--verify", "--quiet", f"{c}^{{commit}}")
        except RuntimeError:
            continue
    return None


class State:
    """What has run on this machine: job id -> its last attempt."""

    def __init__(self, path):
        self.path = path
        self.jobs = json.loads(path.read_text()) if path.exists() else {}

    def status(self, jid, sha):
        rec = self.jobs.get(jid)
        # "running" or "interrupted" (a reboot or Ctrl-C mid-job) runs again.
        if rec is None or rec.get("sha") != sha or rec["status"] not in ("done", "failed"):
            return "pending"
        return rec["status"]

    def record(self, jid, **rec):
        self.jobs[jid] = rec
        tmp = self.path.with_suffix(".tmp")
        tmp.write_text(json.dumps(self.jobs, indent=2) + "\n")
        tmp.replace(self.path)


def checkout(tree, sha):
    """This machine's worktree at `sha`, keeping git-ignored files (target/)."""
    if not (tree / ".git").exists():
        git("worktree", "prune")
        git("worktree", "add", "--detach", str(tree), sha, capture=False)
    else:
        git("checkout", "--detach", "--force", sha, cwd=tree)
        git("clean", "-fd", "--quiet", cwd=tree)


def run_job(job, cmd, sha, machine, root, tree):
    """Run one job, its output both to the terminal and to a log."""
    out = RESULTS / job.get("out", job["id"]) / machine
    out.parent.mkdir(parents=True, exist_ok=True)
    cmd = cmd.replace("{out}", str(out)).replace("{machine}", machine)
    stamp = time.strftime("%Y%m%d-%H%M%S")
    log = root / "logs" / f"{stamp}-{job['id']}-{sha[:8]}.log"
    log.parent.mkdir(exist_ok=True)
    env = dict(os.environ, **{k: str(v) for k, v in job.get("env", {}).items()})
    with open(log, "w") as f:
        head = (f"# job {job['id']} at {job['ref']} ({sha})\n# out {out}\n"
                f"# cmd {cmd}\n# started {time.strftime('%Y-%m-%d %H:%M:%S')}\n")
        print(head, end="", flush=True)
        f.write(head)
        f.flush()
        proc = subprocess.Popen(["bash", "-c", PRELUDE + cmd], cwd=tree, env=env,
                                stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                                text=True, bufsize=1, start_new_session=True)
        try:
            for line in proc.stdout:
                sys.stdout.write(line)
                f.write(line)
            rc = proc.wait()
        except KeyboardInterrupt:
            # The job is in its own session: stop all of it, not only bash.
            os.killpg(proc.pid, signal.SIGTERM)
            proc.wait()
            raise
    return rc, out, log


def fmt_minutes(m):
    return f"{m // 60}h{m % 60:02d}" if m >= 60 else f"{m}m"


def main():
    p = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    p.add_argument("--machine", required=True,
                   help="this machine's name in the queue (e.g. m4, llm)")
    p.add_argument("--queue", default=DEFAULT_QUEUE,
                   help=f"REF:PATH in git, or a local file (default {DEFAULT_QUEUE})")
    p.add_argument("--list", action="store_true", help="show the queue and stop")
    p.add_argument("--only", action="append", default=[], metavar="ID",
                   help="only this job (repeatable)")
    p.add_argument("--rerun", action="append", default=[], metavar="ID",
                   help="run this job even if done (repeatable)")
    p.add_argument("--retry-failed", action="store_true",
                   help="rerun jobs that failed at the same commit")
    p.add_argument("--no-fetch", action="store_true", help="skip git fetch")
    a = p.parse_args()

    root = RESULTS / "queue" / a.machine
    root.mkdir(parents=True, exist_ok=True)
    lock = open(root / "lock", "w")
    try:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
    except BlockingIOError:
        sys.exit(f"another run_queue.py holds {root / 'lock'}")

    if not a.no_fetch:
        git("fetch", "--quiet", "--prune", "origin", capture=False)
    jobs = load_queue(a.queue)
    state = State(root / "state.json")

    plan = []  # (job, cmd, sha, status)
    for job in jobs:
        cmd = command_for(job, a.machine)
        if cmd is None or job.get("disabled") or (a.only and job["id"] not in a.only):
            continue
        sha = resolve(job["ref"])
        if sha is None:
            plan.append((job, cmd, None, "no-ref"))
            continue
        status = state.status(job["id"], sha)
        if job["id"] in a.rerun or (a.retry_failed and status == "failed"):
            status = "pending"
        plan.append((job, cmd, sha, status))

    todo = [x for x in plan if x[3] == "pending"]
    est = sum(x[0].get("minutes", 0) for x in todo)
    print(f"queue {a.queue} on {a.machine}: {len(todo)} to run"
          + (f", about {fmt_minutes(est)}" if est else ""))
    for job, _, sha, status in plan:
        mins = f" ~{fmt_minutes(job['minutes'])}" if "minutes" in job else ""
        print(f"  {status:<11} {job['id']:<28} {job['ref']}"
              f"{' @ ' + sha[:8] if sha else ''}{mins}")
    if a.list or not todo:
        return

    if platform.system() == "Darwin":
        # Hold the Mac awake while this process lives (-w: until it exits).
        subprocess.Popen(["caffeinate", "-is", "-w", str(os.getpid())])

    tree = root / "worktree"
    stop = root / "STOP"
    stop.unlink(missing_ok=True)
    done = []
    try:
        for job, cmd, sha, _ in todo:
            if stop.exists():
                stop.unlink()
                print(f"\nSTOP found: stopping before {job['id']}")
                break
            print(f"\n=== {job['id']} ===", flush=True)
            started = time.time()
            base = dict(sha=sha, ref=job["ref"],
                        started=time.strftime("%Y-%m-%d %H:%M:%S"))
            state.record(job["id"], status="running", **base)
            try:
                checkout(tree, sha)
                rc, out, log = run_job(job, cmd, sha, a.machine, root, tree)
            except KeyboardInterrupt:
                state.record(job["id"], status="interrupted", **base)
                print(f"\ninterrupted: {job['id']} will run again next time")
                raise
            except RuntimeError as e:  # the checkout failed
                rc, out, log = None, None, None
                print(f"error: {e}")
            mins = round((time.time() - started) / 60)
            status = "done" if rc == 0 else "failed"
            state.record(job["id"], status=status, rc=rc, minutes=mins,
                         out=str(out), log=str(log), **base)
            done.append((job, status, mins, out if rc == 0 else log))
            print(f"=== {job['id']}: {status} in {fmt_minutes(mins)} ===", flush=True)
    except KeyboardInterrupt:
        pass
    finally:
        print(f"\n{a.machine}: ran {len(done)} of {len(todo)}")
        for job, status, mins, out in done:
            print(f"  {status:<7} {job['id']:<28} {fmt_minutes(mins):>6}  {out}")


if __name__ == "__main__":
    main()
