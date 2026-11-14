#!/usr/bin/env python3
"""Benchmark the gravity-loop experiments and dump their assembly.

Each experiment is a patch against BASE (README.md). For each CPU level and
each experiment: a detached git worktree of BASE, the patch applied, the
pairwise benches run (criterion), and the hot functions' assembly saved.
Results land in results/<host>/: summary.md, results.csv, machine.txt, asm/.

Usage (from the repo root or anywhere):
    experiments/gravity-vectorize/run.py                 # everything
    experiments/gravity-vectorize/run.py --levels default --quick
Stdlib only.
"""

import argparse
import csv
import json
import os
import platform
import re
import shutil
import socket
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
# The commit every patch applies to: main after #273.
BASE = "ea2169b"

# name -> (patch file or None, functions to dump besides accumulate, as
# (short name, symbol); {s} is f64 or f32). Not inlined: #[inline(never)].
EXPERIMENTS = {
    "base": (None, []),
    "b-select": ("b-select.patch", []),
    "c-lanes": ("c-lanes.patch", [("pass_one", "engine::force::pass_one::<{s}>")]),
    "d-soa": ("d-soa.patch", [("sweep", "engine::force::sweep::<{s}>")]),
}
ACCUMULATE = ("accumulate",
              "<engine::force::PairwiseGravity<{s}> as engine::force::Force<{s}>>::accumulate")

# CPU level -> RUSTFLAGS. "default" is the target's baseline (x86-64: SSE2,
# 2 f64 per vector; aarch64: NEON, the same). x86-64-v3 adds AVX2 (4 f64);
# native here may add AVX-512 (8 f64).
LEVELS = {
    "default": "",
    "x86-64-v3": "-C target-cpu=x86-64-v3",
    "native": "-C target-cpu=native",
}


def run(cmd, cwd=None, env=None, capture=False, check=True):
    print("+", " ".join(cmd), flush=True)
    return subprocess.run(
        cmd, cwd=cwd, env=env, check=check, text=True,
        stdout=subprocess.PIPE if capture else None,
        stderr=subprocess.STDOUT if capture else None,
    )


def worktree(name, work):
    """A fresh detached worktree of BASE with the experiment's patch."""
    path = work / name
    if path.exists():
        run(["git", "worktree", "remove", "--force", str(path)], cwd=REPO)
    run(["git", "worktree", "add", "--detach", str(path), BASE], cwd=REPO)
    patch = EXPERIMENTS[name][0]
    if patch:
        run(["git", "apply", str(HERE / "patches" / patch)], cwd=path)
    return path


def bench(tree, env, out, args):
    """Run the pairwise benches; criterion's data goes under out/criterion."""
    env = dict(env, CRITERION_HOME=str(out / "criterion"))
    cmd = ["cargo", "bench", "-p", "engine", "--bench", "step", "--",
           args.filter, "--noplot"]
    if args.quick:
        cmd += ["--warm-up-time", "0.5", "--measurement-time", "1"]
    run(cmd, cwd=tree, env=env)
    times = {}
    for est in sorted((out / "criterion").glob("pairwise_*/*/new/estimates.json")):
        group, size = est.parts[-4], est.parts[-3]
        data = json.loads(est.read_text())
        times[f"{group}/{size}"] = data["mean"]["point_estimate"]
    return times


def dump_asm(tree, env, name, level, asm_dir):
    """Save each hot function's assembly; return per-file instruction counts."""
    counts = {}
    for s in ("f64", "f32"):
        for short, fn in [ACCUMULATE] + EXPERIMENTS[name][1]:
            symbol = fn.format(s=s)
            dest = asm_dir / f"{level}--{name}--{short}-{s}.s"
            result = run(["cargo", "asm", "-p", "engine", "--bench", "step",
                          "--intel", symbol], cwd=tree, env=env,
                         capture=True, check=False)
            asm = only(result.stdout, symbol)
            dest.write_text(asm)
            counts[dest.name] = count_ops(asm) if result.returncode == 0 else None
    return counts


def only(asm, symbol):
    """The one function's lines: cargo-show-asm may print every match (e.g.
    both sweep::<f64> and sweep::<f32>) one after another."""
    lines = asm.splitlines(keepends=True)
    starts = [k for k, line in enumerate(lines) if line.rstrip() == f"{symbol}:"]
    if not starts:
        return asm
    # A function's label starts at column 0 and isn't a local label (L, .L).
    top = re.compile(r"^[^\s.L][^:]*:$")
    end = next((k for k in range(starts[0] + 1, len(lines)) if top.match(lines[k].rstrip())),
               len(lines))
    return "".join(lines[starts[0]:end])


# sqrt and div by width. x86: scalar sd/ss, packed pd/ps by register (xmm
# 128-bit, ymm 256, zmm 512). aarch64 (Apple syntax): fsqrt d0 scalar,
# fsqrt.2d / fsqrt.4s 128-bit.
X86_OPS = re.compile(r"^\s*v?(sqrt|div)(sd|ss|pd|ps)\s+([xyz]mm)?", re.M)
ARM_OPS = re.compile(r"^\s*f(sqrt|div)(\.2d|\.4s)?\s+([ds])?", re.M)


def count_ops(asm):
    """Count sqrt/div by form, e.g. {'sqrtpd ymm': 2, 'divsd': 1}."""
    found = {}
    for op, kind, reg in X86_OPS.findall(asm):
        key = f"{op}{kind}" + (f" {reg}" if kind in ("pd", "ps") else "")
        found[key] = found.get(key, 0) + 1
    for op, lanes, reg in ARM_OPS.findall(asm):
        key = f"f{op}{lanes}" if lanes else f"f{op} {reg}"
        found[key] = found.get(key, 0) + 1
    return found


def machine_info():
    lines = [f"host: {socket.gethostname()}", f"arch: {platform.machine()}"]
    cpuinfo = Path("/proc/cpuinfo")
    if cpuinfo.exists():
        text = cpuinfo.read_text()
        model = re.search(r"model name\s*:\s*(.*)", text)
        lines.append(f"cpu: {model.group(1) if model else '?'}")
        flags = set(re.search(r"flags\s*:\s*(.*)", text).group(1).split())
        lines.append("simd: " + " ".join(f for f in ("sse2", "avx", "avx2", "fma",
                     "avx512f", "avx512dq", "avx512vl") if f in flags))
    else:
        cpu = run(["sysctl", "-n", "machdep.cpu.brand_string"], capture=True, check=False)
        lines.append(f"cpu: {cpu.stdout.strip()}")
    rustc = run(["rustc", "-vV"], cwd=REPO, capture=True)
    lines.append(rustc.stdout.strip())
    return "\n".join(lines) + "\n"


def write_summary(out, results, counts, levels, names):
    benches = sorted({b for r in results.values() for b in r},
                     key=lambda b: (b.split("/")[0], int(b.split("/")[1])))
    with open(out / "results.csv", "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["level", "experiment", "bench", "mean_ns"])
        for (level, name), times in sorted(results.items()):
            for b, t in sorted(times.items()):
                w.writerow([level, name, b, f"{t:.1f}"])

    def fmt(ns):
        for unit, scale in (("ms", 1e6), ("µs", 1e3)):
            if ns >= scale:
                return f"{ns / scale:.3g} {unit}"
        return f"{ns:.3g} ns"

    md = ["# Gravity experiments", "", "```", machine_info().strip(), "```", ""]
    md += ["Mean time; in brackets, the change against `base` at the same level.", ""]
    for level in levels:
        md += [f"## {level} (`RUSTFLAGS={LEVELS[level]!r}`)", ""]
        md += ["| bench | " + " | ".join(names) + " |",
               "|---" * (len(names) + 1) + "|"]
        base = results.get((level, "base"), {})
        for b in benches:
            cells = []
            for name in names:
                t = results.get((level, name), {}).get(b)
                if t is None:
                    cells.append("–")
                elif name == "base" or b not in base:
                    cells.append(fmt(t))
                else:
                    cells.append(f"{fmt(t)} ({(t / base[b] - 1) * 100:+.0f}%)")
            md.append(f"| {b} | " + " | ".join(cells) + " |")
        md.append("")
    if "default" in levels and len(levels) > 1:
        md += ["## base, each level against default", ""]
        md += ["| bench | " + " | ".join(levels) + " |", "|---" * (len(levels) + 1) + "|"]
        ref = results.get(("default", "base"), {})
        for b in benches:
            cells = []
            for level in levels:
                t = results.get((level, "base"), {}).get(b)
                cells.append("–" if t is None or b not in ref
                             else f"{fmt(t)} ({(t / ref[b] - 1) * 100:+.0f}%)")
            md.append(f"| {b} | " + " | ".join(cells) + " |")
        md.append("")
    md += ["## sqrt and div in the dumped functions", "",
           "x86: scalar `sd`/`ss`; packed by register: xmm 128-bit, ymm 256, zmm 512.",
           "aarch64: `fsqrt d`/`s` scalar; `.2d`/`.4s` 128-bit.",
           "Each file is in asm/.", ""]
    for name, c in sorted(counts.items()):
        text = "not found (inlined?)" if c is None else (
            ", ".join(f"{k} ×{v}" for k, v in sorted(c.items())) or "none")
        md.append(f"- `{name}`: {text}")
    (out / "summary.md").write_text("\n".join(md) + "\n")


def main():
    p = argparse.ArgumentParser(description=__doc__,
                                formatter_class=argparse.RawDescriptionHelpFormatter)
    is_x86 = platform.machine() in ("x86_64", "AMD64")
    p.add_argument("--levels", default="default,x86-64-v3,native" if is_x86 else "default,native",
                   help="comma-separated CPU levels: " + ", ".join(LEVELS))
    p.add_argument("--experiments", default=",".join(EXPERIMENTS),
                   help="comma-separated: " + ", ".join(EXPERIMENTS))
    p.add_argument("--filter", default="^pairwise_", help="criterion's bench filter (regex)")
    p.add_argument("--quick", action="store_true", help="short criterion runs (a smoke test)")
    p.add_argument("--out", type=Path, default=HERE / "results" / socket.gethostname().split(".")[0])
    args = p.parse_args()
    levels, names = args.levels.split(","), args.experiments.split(",")
    for x in levels:
        if x not in LEVELS:
            sys.exit(f"unknown level {x}")
    for x in names:
        if x not in EXPERIMENTS:
            sys.exit(f"unknown experiment {x}")

    out = args.out
    if out.exists():
        shutil.rmtree(out)
    (out / "asm").mkdir(parents=True)
    (out / "machine.txt").write_text(machine_info())
    work = HERE / ".work"
    work.mkdir(exist_ok=True)

    results, counts = {}, {}
    try:
        for name in names:
            tree = worktree(name, work)
            for level in levels:
                # One target dir per level: changing RUSTFLAGS rebuilds every
                # dependency, so levels don't share. Experiments do (each
                # worktree's engine is its own package; deps are reused).
                env = dict(os.environ, RUSTFLAGS=LEVELS[level],
                           CARGO_TARGET_DIR=str(work / f"target-{level}"))
                print(f"\n=== {name} at {level} ===", flush=True)
                results[(level, name)] = bench(tree, env, out / level / name, args)
                counts.update(dump_asm(tree, env, name, level, out / "asm"))
                write_summary(out, results, counts, levels, names)
    finally:
        for name in names:
            if (work / name).exists():
                run(["git", "worktree", "remove", "--force", str(work / name)],
                    cwd=REPO, check=False)
    print(f"\nDone: {out / 'summary.md'}")


if __name__ == "__main__":
    main()
