# Queue

Line up benchmark and profiling runs ahead of time; a machine works
through them while it's otherwise idle (the M4 overnight, llm during the
day). `run_queue.py` is the runner. Stdlib Python 3.

## The queue

`queue.json` on the **`bench-queue` branch** (not main, which needs a PR
per change): adding work is a commit pushed there. The runner fetches
origin and reads the file with `git show`, so nothing on the machine
needs pulling or checking out for new jobs.

```json
[
  {
    "id": "sorted-edges-r2",
    "ref": "experiments/sorted-edges-r2",
    "out": "sorted-edges",
    "minutes": 120,
    "cmd": {
      "m4":  "experiments/sorted-edges/run.py --experiments base,all --out {out}",
      "llm": "experiments/sorted-edges/run.py --experiments base,all --perf --out {out}"
    }
  }
]
```

| Field | |
|---|---|
| `id` | unique; letters, digits, `.`, `_`, `-` |
| `ref` | a branch or tag on origin, or a commit sha |
| `cmd` | a bash command, run from the repository's root at `ref`; or an object, machine to command |
| `machines` | with a string `cmd`, where it runs (default: everywhere) |
| `out` | `{out}` is `~/sweep-results/<out>/<machine>` (default: the id) |
| `minutes` | an estimate, summed by `--list` |
| `env` | extra environment variables |
| `disabled` | `true` skips it |

`{machine}` is the machine's name. Jobs run in the file's order, one at
a time.

## Running

On the M4, when leaving it for the night (the runner holds
`caffeinate -is`; closing the lid still sleeps it):

```sh
cd ~/physics && git pull && experiments/queue/run_queue.py --machine m4 2>&1 | tee ~/queue.log
```

On llm, in tmux:

```sh
tmux new -s queue 'cd ~/physics && git pull && experiments/queue/run_queue.py --machine llm 2>&1 | tee ~/queue.log; exec bash'
```

`git pull` there only updates the runner itself; the jobs don't need it.
`--list` shows what would run. `touch ~/sweep-results/queue/<machine>/STOP`
stops after the current job (or Ctrl-C now; that job runs again next time).

## What happens

- Each job runs in the machine's own worktree,
  `~/sweep-results/queue/<machine>/worktree`, checked out at the job's
  commit. `~/physics` is untouched: a `git pull` or a branch switch there
  mid-run changes nothing, and results never land in a checkout. The
  worktree keeps its `target/` between jobs, so builds stay warm.
- If nvm is installed, it loads the Node the commit's `.nvmrc` pins.
- `~/sweep-results/queue/<machine>/state.json` records each job's last
  run: its commit, status, minutes and log
  (`~/sweep-results/queue/<machine>/logs/`).
- A job is **done** once it ran at the commit its ref names now. Push a new
  commit to that branch and it runs again; pin a sha to stop that. A
  **failed** job is skipped until `--retry-failed`; `--rerun ID` runs one
  regardless. A job cut off (Ctrl-C, a reboot) runs again.
- Results come back as usual:
  `rsync -a llm:sweep-results/<out>/llm/ experiments/<experiment>/results/llm/`.

Benchmarks want the machine left alone; profiles (shares of a run) don't
mind. Put the benchmarks where nobody will be using the machine.
