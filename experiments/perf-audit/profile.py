#!/usr/bin/env python3
"""Profile one case of every bench group, natively and in V8: which code
each one spends its time in (`docs/perf-audit.md`, phase 1).

Natively through `cargo xtask profile` (samply; on Linux it needs
`cargo install --locked samply` and `kernel.perf_event_paranoid` <= 1);
in V8 by running the same bench, built for wasm32-wasip1 with simd128,
under `node --cpu-prof` (the repo's Node, `.nvmrc`). A profile measures
shares of a run, so the machine needn't be idle.

Writes results/<host>/: native/<case>.txt (xtask profile's report: hot
functions and source lines), v8/<case>.txt (hot functions), and
summary.md (each case's top functions on both). Stdlib only.

    experiments/perf-audit/profile.py                 # every case
    experiments/perf-audit/profile.py --only swarm    # cases containing "swarm"
    experiments/perf-audit/profile.py --no-v8
"""

import argparse
import collections
import glob
import json
import os
import re
import shutil
import socket
import subprocess
import sys
import tempfile
from pathlib import Path

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
WASI_NODE = REPO / "experiments" / "sweep" / "wasi-node.mjs"

# (package, bench, case): one case per bench group, the largest size the
# pages use, plus the dispersion design's outlier (key 69) and a neighbour.
CASES = [
    ("engine", "step", "pairwise_f64/4096"),
    ("engine", "step", "barnes_hut_f64/theta_0.5/4096"),
    ("engine", "step", "broadphase_f64/4096"),
    ("engine", "step", "step_f64_verlet/1024"),
    ("engine", "step", "step_f64_symplectic/1024"),
    ("sand", "step", "sand_step/busy/1920x1080_chunks"),
    ("sand", "step", "sand_step/settled/1920x1080_chunks"),
    ("swarm", "step", "swarm_step/Sorted/10000"),
    ("swarm", "step", "swarm_step/Grid/10000"),
    ("swarm", "step", "swarm_step/Brute/10000"),
    ("swarm", "step", "swarm_models/ants/200x120_500"),
    ("swarm", "step", "swarm_models/physarum/512_100k"),
    ("swarm", "step", "swarm_models/vicsek/4000"),
    ("acoustic", "fft", "fft_f32/16384"),
    ("acoustic", "fft", "spectrum_f32/4096"),
    ("acoustic", "piano", "piano_16_voices_x3_strings/128"),
    ("acoustic", "piano", "piano_design_88_keys"),
    ("acoustic", "dispersion", "stiff_waveguide_new/69"),
    ("acoustic", "dispersion", "stiff_waveguide_new/60"),
]


def run(cmd, **kw):
    print("+", " ".join(str(c) for c in cmd), flush=True)
    return subprocess.run(cmd, cwd=REPO, text=True, **kw)


def native(case, pkg, bench, out, seconds):
    r = run(["cargo", "xtask", "profile", "-p", pkg, "--bench", bench, "--seconds",
             str(seconds), "--top", "15", "--", f"^{case}$"], capture_output=True)
    (out / "native" / name(case)).write_text(r.stdout + r.stderr)
    return top_native(r.stdout)


def top_native(text, n=4):
    """xtask profile's first section: functions by self time."""
    lines = text.splitlines()
    try:
        i = next(k for k, l in enumerate(lines) if l.startswith("self (of"))
    except StopIteration:
        return ["(no profile: see the native/ file)"]
    out = []
    for l in lines[i + 1:]:
        m = re.match(r"\s*([\d.]+)%\s+(.*)", l)
        if not m:
            break
        if not idle(m.group(2)):
            out.append((float(m.group(1)), short(m.group(2))))
    return [f"{p:.0f}% {f}" for p, f in out[:n]]


def wasm_exe(pkg, bench, built):
    """The bench built for wasm32-wasip1 (simd128 from .cargo/config.toml)."""
    if (pkg, bench) not in built:
        r = run(["cargo", "bench", "-p", pkg, "--bench", bench, "--no-run",
                 "--target", "wasm32-wasip1", "--message-format=json"],
                capture_output=True)
        exes = [json.loads(l).get("executable") for l in r.stdout.splitlines()
                if l.startswith("{")]
        exes = [e for e in exes if e]
        if r.returncode != 0 or not exes:
            sys.exit(f"building {pkg}'s {bench} bench for wasm failed:\n{r.stderr[-2000:]}")
        built[(pkg, bench)] = exes[-1]
    return built[(pkg, bench)]


def v8(case, pkg, bench, out, seconds, built):
    exe = wasm_exe(pkg, bench, built)
    with tempfile.TemporaryDirectory() as tmp:
        crit = Path(tmp) / "criterion"
        crit.mkdir()
        run(["node", "--cpu-prof", f"--cpu-prof-dir={tmp}", "--cpu-prof-interval", "200",
             str(WASI_NODE), exe, str(crit), "--bench", "--profile-time", str(seconds),
             f"^{case}$"], capture_output=True)
        profiles = sorted(glob.glob(f"{tmp}/*.cpuprofile"))
        if not profiles:
            (out / "v8" / name(case)).write_text("no profile written\n")
            return ["(no profile)"]
        p = json.loads(Path(profiles[-1]).read_text())
    hits = collections.Counter()
    for node in p["nodes"]:
        hits[node["callFrame"]["functionName"] or "(anonymous)"] += node.get("hitCount", 0)
    total = sum(hits.values()) or 1
    rows = [(100 * h / total, demangle(f)) for f, h in hits.most_common()]
    (out / "v8" / name(case)).write_text(
        "".join(f"{p:6.1f}%  {f}\n" for p, f in rows[:30]))
    return [f"{p:.0f}% {short(f)}" for p, f in rows if not idle(f)][:4]


def demangle(symbol):
    """v0 mangled names (`_RNv…`) to paths, with rustfilt when it's installed."""
    if not symbol.startswith("_R"):
        return symbol
    if shutil.which("rustfilt"):
        return subprocess.run(["rustfilt"], input=symbol, capture_output=True,
                              text=True).stdout.strip() or symbol
    # Without it, the readable part: v0 names spell each path segment as
    # its length then its text (`5swarm5rules4Seen8add_span`).
    # Back-references (`B4_`) and crate hashes (`Cs…_`) aren't segments.
    symbol = re.sub(r"Cs[0-9A-Za-z]{1,16}_|B[0-9A-Za-z]{0,6}_", "", symbol)
    parts, k = [], 0
    while k < len(symbol):
        m = re.compile(r"(\d+)").match(symbol, k)
        if m:
            n, start = int(m.group(1)), m.end()
            seg = symbol[start:start + n]
            if n and len(seg) == n and re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", seg):
                parts.append(seg)
                k = start + n
                continue
        k += 1
    return "::".join(parts) or symbol


def idle(f):
    return bool(re.match(r"\(idle\)|\(program\)|\(garbage collector\)|__workq|poll$|read$|"
                         r"semaphore|__open|stat$|instantiate", f))


def short(f):
    f = re.sub(r"<criterion::[^ ]*", "criterion", f)
    return f if len(f) < 70 else f[:67] + "…"


def name(case):
    return case.replace("/", "_") + ".txt"


def main():
    p = argparse.ArgumentParser(description=__doc__,
                                formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("--only", help="only cases whose name contains this")
    p.add_argument("--no-v8", action="store_true", help="native profiles only")
    p.add_argument("--seconds", type=int, default=3, help="seconds each case runs")
    host = socket.gethostname().split(".")[0]
    p.add_argument("--out", type=Path, default=HERE / "results" / host)
    args = p.parse_args()
    out = args.out.resolve()
    for d in ("native", "v8"):
        (out / d).mkdir(parents=True, exist_ok=True)
    rows, built = [], {}
    for pkg, bench, case in CASES:
        if args.only and args.only not in case:
            continue
        print(f"\n=== {case}", flush=True)
        nat = native(case, pkg, bench, out, args.seconds)
        v8_top = [] if args.no_v8 else v8(case, pkg, bench, out, args.seconds, built)
        rows.append((case, nat, v8_top))
        write_summary(out, rows)
    print(f"\nDone: {out / 'summary.md'}")


def write_summary(out, rows):
    md = [f"# Where the time goes ({socket.gethostname().split('.')[0]})", "",
          "Each case's top functions by self time, native (samply) and V8 "
          "(`node --cpu-prof`, the wasm32-wasip1 + simd128 bench). Idle and "
          "harness frames left out; files per case in native/ and v8/.", "",
          "| case | native | V8 |", "|---|---|---|"]
    for case, nat, v8_top in rows:
        md.append(f"| `{case}` | {'<br>'.join(nat)} | {'<br>'.join(v8_top) or '–'} |")
    (out / "summary.md").write_text("\n".join(md) + "\n")


if __name__ == "__main__":
    main()
