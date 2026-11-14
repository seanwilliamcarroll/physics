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
#
# The wasm levels build for wasm32-wasip1 and run under wasmtime, which
# compiles the wasm to this machine's code when it loads it (Cranelift).
# The v8 levels run the same .wasm in Node, whose V8 compiles it with its
# own optimizing compiler (TurboFan), as Chrome does for the demos.
# wasm has one vector width, 128 bits (2 f64 / 4 f32), and only with
# simd128 enabled; without it, everything is scalar.
LEVELS = {
    "default": "",
    "x86-64-v3": "-C target-cpu=x86-64-v3",
    "native": "-C target-cpu=native",
    "wasm": "",
    "wasm-simd128": "-C target-feature=+simd128",
    "v8": "",
    "v8-simd128": "-C target-feature=+simd128",
}
WASM_TARGET = "wasm32-wasip1"


def is_wasm(level):
    return level.startswith(("wasm", "v8"))


def is_v8(level):
    """The same .wasm as the wasm levels, run by Node (V8) instead of wasmtime."""
    return level.startswith("v8")


def build_dir(work, level):
    """One target dir per build: the v8 levels share the wasm levels'."""
    return work / ("target-" + level.replace("v8", "wasm"))


def target_args(level):
    return ["--target", WASM_TARGET] if is_wasm(level) else []


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


def bench(tree, env, level, out, args):
    """Run the pairwise benches; criterion's data goes under out/criterion."""
    crit = out / "criterion"
    crit.mkdir(parents=True, exist_ok=True)
    flags = [args.filter, "--noplot"]
    if args.quick:
        flags += ["--warm-up-time", "0.5", "--measurement-time", "1"]
    if is_wasm(level):
        # wasm sees only the directories and variables it's given.
        exe = bench_exe(tree, env, level)
        if is_v8(level):
            run(["node", str(HERE / "wasi-node.mjs"), exe, str(crit), "--bench"] + flags,
                env=env)
        else:
            run(["wasmtime", "run", "--dir", f"{crit}::/criterion",
                 "--env", "CRITERION_HOME=/criterion", exe, "--bench"] + flags, env=env)
    else:
        run(["cargo", "bench", "-p", "engine", "--bench", "step", "--"] + flags,
            cwd=tree, env=dict(env, CRITERION_HOME=str(crit)))
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
            style = [] if is_wasm(level) else ["--intel"]
            result = run(["cargo", "asm", "-p", "engine", "--bench", "step"]
                         + target_args(level) + style + [symbol], cwd=tree, env=env,
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
WASM_OPS = re.compile(r"^\s*(f64|f32|f64x2|f32x4)\.(sqrt|div)\b", re.M)
ARM_OPS = re.compile(r"^\s*f(sqrt|div)(\.2d|\.4s)?\s+([ds])?", re.M)


def count_ops(asm):
    """Count sqrt/div by form, e.g. {'sqrtpd ymm': 2, 'divsd': 1}."""
    found = {}
    for op, kind, reg in X86_OPS.findall(asm):
        key = f"{op}{kind}" + (f" {reg}" if kind in ("pd", "ps") else "")
        found[key] = found.get(key, 0) + 1
    for kind, op in WASM_OPS.findall(asm):
        key = f"{kind}.{op}"
        found[key] = found.get(key, 0) + 1
    for op, lanes, reg in ARM_OPS.findall(asm):
        key = f"f{op}{lanes}" if lanes else f"f{op} {reg}"
        found[key] = found.get(key, 0) + 1
    return found


# Hardware counters, as perf names them. Stalls aren't on every CPU; perf
# says "<not supported>" and the column is left empty.
PERF_EVENTS = ["task-clock", "cycles", "instructions", "branches", "branch-misses",
               "stalled-cycles-frontend", "stalled-cycles-backend"]


def bench_exe(tree, env, level):
    """The built bench binary's path (cargo prints it as JSON); a .wasm for wasm."""
    built = run(["cargo", "bench", "-p", "engine", "--bench", "step", "--no-run",
                 "--message-format=json"] + target_args(level),
                cwd=tree, env=env, capture=True)
    for line in built.stdout.splitlines():
        if line.startswith("{"):
            msg = json.loads(line)
            if msg.get("target", {}).get("name") == "step" and msg.get("executable"):
                return msg["executable"]
    sys.exit("no bench executable in cargo's output")


def perf_run(tree, env, name, level, out, args):
    """perf stat and perf record + annotate on each of args.perf_benches.

    Criterion's --profile-time runs one bench in a loop for that long with
    no analysis: clean for a profiler, but it doesn't say how many
    iterations it ran. So counters come out as ratios here (IPC, per-cent
    stalls), and per-pair numbers are made from them with criterion's time.
    """
    exe = bench_exe(tree, env, level)
    env = dict(env, CRITERION_HOME=str(out / level / name / "criterion-profile"))
    stats = {}
    for b in args.perf_benches.split(","):
        bench_args = [exe, "--bench", "--profile-time", str(args.perf_time), f"^{b}$"]
        stem = f"{level}--{name}--{b.replace('/', '-')}"
        stat_file = out / "perf" / f"{stem}.stat.csv"
        run(["perf", "stat", "-x,", "-o", str(stat_file), "-e", ",".join(PERF_EVENTS),
             "--"] + bench_args, env=env, capture=True)
        stats[b] = parse_stat(stat_file.read_text())
        data = out / "perf" / f"{stem}.data"
        run(["perf", "record", "-q", "-o", str(data), "--"] + bench_args,
            env=env, capture=True)
        # The functions over 5% of the samples, each instruction with its
        # share: where the loop spends its cycles.
        report = run(["perf", "annotate", "-i", str(data), "--stdio", "-M", "intel",
                      "--percent-limit", "5", "--no-source"],
                     env=env, capture=True, check=False)
        (out / "perf" / f"{stem}.annotate.txt").write_text(report.stdout)
        data.unlink(missing_ok=True)
    return stats


def parse_stat(text):
    """perf stat -x, lines: value,unit,event,... -> {event: value}."""
    found = {}
    for line in text.splitlines():
        fields = line.split(",")
        if len(fields) < 3 or line.startswith("#"):
            continue
        try:
            # perf may suffix the event (e.g. "cycles:u").
            found[fields[2].split(":")[0]] = float(fields[0])
        except ValueError:
            pass  # <not supported> or <not counted>
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
    for tool, cmd in (("wasmtime", ["wasmtime", "--version"]),
                      ("node", ["node", "-p", "`node ${process.version}, V8 ${process.versions.v8}`"])):
        if shutil.which(tool):
            lines.append(run(cmd, capture=True, check=False).stdout.strip())
    rustc = run(["rustc", "-vV"], cwd=REPO, capture=True)
    lines.append(rustc.stdout.strip())
    return "\n".join(lines) + "\n"


def write_summary(out, results, counts, levels, names, perf):
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
    if perf:
        md += ["## perf", "",
               "From `perf stat` over criterion's `--profile-time` run. GHz is",
               "cycles / task-clock; per pair is criterion's mean time × GHz / pairs,",
               "with pairs = n(n−1)/2. Backend stalls: cycles the core waited on",
               "results or memory. Where each loop spends its cycles, instruction by",
               "instruction: `perf/*.annotate.txt`.", "",
               "| level | experiment | bench | GHz | IPC | cycles/pair | instr/pair "
               "| branch miss | backend stall |",
               "|---|---|---|---|---|---|---|---|---|"]
        for (level, name), by_bench in perf.items():
            for b, c in by_bench.items():
                cycles, clock = c.get("cycles"), c.get("task-clock")
                instr = c.get("instructions")
                if not (cycles and clock and instr):
                    md.append(f"| {level} | {name} | {b} | – | – | – | – | – | – |")
                    continue
                ghz = cycles / (clock * 1e6)  # task-clock is in ms
                n = int(b.split("/")[1])
                t = results.get((level, name), {}).get(b)
                cpp = t * ghz / (n * (n - 1) / 2) if t else None
                ipc = instr / cycles

                def pct(event, of):
                    v = c.get(event)
                    return f"{v / of * 100:.1f}%" if v is not None and of else "–"

                md.append(f"| {level} | {name} | {b} | {ghz:.2f} | {ipc:.2f} | "
                          + (f"{cpp:.2f} | {cpp * ipc:.1f}" if cpp else "– | –")
                          + f" | {pct('branch-misses', c.get('branches'))}"
                          + f" | {pct('stalled-cycles-backend', cycles)} |")
        md.append("")
    md += ["## sqrt and div in the dumped functions", "",
           "x86: scalar `sd`/`ss`; packed by register: xmm 128-bit, ymm 256, zmm 512.",
           "aarch64: `fsqrt d`/`s` scalar; `.2d`/`.4s` 128-bit.",
           "wasm: `f64.sqrt` scalar; `f64x2.sqrt`/`f32x4.sqrt` 128-bit.",
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
    levels = ["default", "x86-64-v3", "native"] if is_x86 else ["default", "native"]
    if shutil.which("wasmtime"):
        levels += ["wasm", "wasm-simd128"]
    if shutil.which("node"):
        levels += ["v8", "v8-simd128"]
    p.add_argument("--levels", default=",".join(levels),
                   help="comma-separated CPU levels: " + ", ".join(LEVELS))
    p.add_argument("--experiments", default=",".join(EXPERIMENTS),
                   help="comma-separated: " + ", ".join(EXPERIMENTS))
    p.add_argument("--filter", default="^pairwise_", help="criterion's bench filter (regex)")
    p.add_argument("--quick", action="store_true", help="short criterion runs (a smoke test)")
    p.add_argument("--perf", action="store_true",
                   help="also perf stat and perf record/annotate (Linux; needs "
                        "kernel.perf_event_paranoid <= 2)")
    p.add_argument("--perf-benches", default="pairwise_f64/1024,pairwise_f32/1024",
                   help="comma-separated bench ids for --perf")
    p.add_argument("--perf-time", type=int, default=5,
                   help="seconds per bench under perf (criterion's --profile-time)")
    p.add_argument("--out", type=Path, default=HERE / "results" / socket.gethostname().split(".")[0])
    args = p.parse_args()
    levels, names = args.levels.split(","), args.experiments.split(",")
    for x in levels:
        if x not in LEVELS:
            sys.exit(f"unknown level {x}")
    for x in names:
        if x not in EXPERIMENTS:
            sys.exit(f"unknown experiment {x}")

    if args.perf and not shutil.which("perf"):
        sys.exit("--perf: perf isn't installed")
    out = args.out
    if out.exists():
        shutil.rmtree(out)
    (out / "asm").mkdir(parents=True)
    if args.perf:
        (out / "perf").mkdir()
    (out / "machine.txt").write_text(machine_info())
    work = HERE / ".work"
    work.mkdir(exist_ok=True)

    results, counts, perf = {}, {}, {}
    try:
        for name in names:
            tree = worktree(name, work)
            for level in levels:
                # One target dir per level: changing RUSTFLAGS rebuilds every
                # dependency, so levels don't share. Experiments do (each
                # worktree's engine is its own package; deps are reused).
                env = dict(os.environ, RUSTFLAGS=LEVELS[level],
                           CARGO_TARGET_DIR=str(build_dir(work, level)))
                print(f"\n=== {name} at {level} ===", flush=True)
                results[(level, name)] = bench(tree, env, level, out / level / name, args)
                if not is_v8(level):  # same wasm as the wasm level's
                    counts.update(dump_asm(tree, env, name, level, out / "asm"))
                # perf can't name wasmtime's generated code, so no wasm.
                if args.perf and not is_wasm(level):
                    perf[(level, name)] = perf_run(tree, env, name, level, out, args)
                write_summary(out, results, counts, levels, names, perf)
    finally:
        for name in names:
            if (work / name).exists():
                run(["git", "worktree", "remove", "--force", str(work / name)],
                    cwd=REPO, check=False)
    print(f"\nDone: {out / 'summary.md'}")


if __name__ == "__main__":
    main()
