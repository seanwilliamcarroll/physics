"""The sweep: benchmark an experiment's build settings at several CPU levels
and in two WebAssembly engines, and keep the hot functions' assembly.

A library: each experiment's folder has a short driver (its `run.py`) that
describes it as a `Suite` and calls `main(suite)`. The suite says what to
build and bench (a package's `step` bench), the experiments (settings of
build knobs, environment variables the crate reads at compile time), which
functions to dump, and what the tables compare against. This file knows
nothing about any particular experiment. Stdlib only; see README.md.
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
import dataclasses
from dataclasses import dataclass, field
from pathlib import Path

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]


@dataclass(frozen=True)
class Experiment:
    """One build: knob settings, and functions to dump besides the suite's."""
    knobs: dict
    # (short name, symbol); `{s}` in a symbol is each of the suite's scalars.
    functions: tuple = ()


@dataclass(frozen=True)
class Suite:
    """An experiment folder's whole description (see the module doc)."""
    title: str                  # summary.md's heading
    package: str                # cargo package with a `step` bench
    knobs: tuple                # every knob it reads: unset unless an experiment sets it
    experiments: dict           # name -> Experiment
    reference: str              # the experiment tables compare against
    results: Path               # default --out is results/<host>
    functions: tuple = ()       # dumped for every experiment: (short, symbol[, index])
    presets: dict = field(default_factory=dict)  # name -> [experiment names]
    filter: str = "."           # criterion's default filter
    perf_benches: str = ""      # default --perf-benches
    scalars: tuple = ("f32",)   # what `{s}` in symbols takes
    # Whether a bench id's last part is a body count n with n(n-1)/2 pairs:
    # the perf table's per-pair columns.
    pairs: bool = False
    # V8's machine code (TurboFan's, the optimized tier) for these wasm
    # functions at the v8 levels: (short, a substring of the function's
    # name in the wasm, which is its mangled symbol), captured from a short
    # run of v8_filter's benches (they must run the functions hot).
    v8_functions: tuple = ()
    v8_filter: str = ""


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


def bench(suite, tree, env, level, out, args):
    """Run the suite's benches; criterion's data goes under out/criterion."""
    crit = out / "criterion"
    crit.mkdir(parents=True, exist_ok=True)
    flags = [args.filter, "--noplot"]
    if args.quick:
        flags += ["--warm-up-time", "0.5", "--measurement-time", "1"]
    if is_wasm(level):
        # wasm sees only the directories and variables it's given.
        exe = bench_exe(suite, tree, env, level)
        if is_v8(level):
            run(["node", str(HERE / "wasi-node.mjs"), exe, str(crit), "--bench"] + flags,
                env=env)
        else:
            run(["wasmtime", "run", "--dir", f"{crit}::/criterion",
                 "--env", "CRITERION_HOME=/criterion", exe, "--bench"] + flags, env=env)
    else:
        run(["cargo", "bench", "-p", suite.package, "--bench", "step", "--"] + flags,
            cwd=tree, env=dict(env, CRITERION_HOME=str(crit)))
    times = {}
    # Every case's latest run, named by criterion's own id (benchmark.json).
    for est in sorted((out / "criterion").rglob("new/estimates.json")):
        meta = json.loads((est.parent / "benchmark.json").read_text())
        times[meta["full_id"]] = json.loads(est.read_text())["mean"]["point_estimate"]
    return times


def dump_asm(suite, tree, env, name, level, asm_dir):
    """Save each hot function's assembly; return per-file instruction counts."""
    counts = {}
    for s in suite.scalars:
        for short, fn, *pick in tuple(suite.functions) + tuple(suite.experiments[name].functions):
            # (short, symbol[, index]): the index picks one of several
            # copies of a symbol (cargo asm lists them and stops otherwise).
            symbol = fn.format(s=s)
            dest = asm_dir / f"{level}--{name}--{short}-{s}.s"
            style = [] if is_wasm(level) else ["--intel"]
            result = run(["cargo", "asm", "-p", suite.package, "--bench", "step"]
                         + target_args(level) + style + [symbol] + [str(i) for i in pick],
                         cwd=tree, env=env,
                         capture=True, check=False)
            asm = only(result.stdout, symbol)
            dest.write_text(asm)
            counts[dest.name] = count_ops(asm) if result.returncode == 0 else None
    return counts


def v8_code(suite, tree, env, name, level, asm_dir):
    """Save V8's optimized machine code for the suite's v8_functions: a short
    run of v8_filter's benches with --print-wasm-code (every function's
    code, both tiers; the index filter is ignored), cut down to each
    function's TurboFan listing (the last, if it was compiled again)."""
    if not suite.v8_functions:
        return
    exe = bench_exe(suite, tree, env, level)
    crit = asm_dir / ".v8-criterion"
    crit.mkdir(exist_ok=True)
    dump = asm_dir / ".v8-dump.txt"
    with dump.open("w") as f:
        subprocess.run(["node", "--no-warnings", "--print-wasm-code",
                        str(HERE / "wasi-node.mjs"), exe, str(crit), "--bench",
                        suite.v8_filter, "--noplot", "--warm-up-time", "1",
                        "--measurement-time", "2"],
                       cwd=tree, env=env, stdout=f, stderr=subprocess.STDOUT, check=False)
    listings = {}
    for block in dump.read_text(errors="replace").split("--- WebAssembly code ---"):
        if "\ncompiler: TurboFan" not in block:
            continue
        head = block.split("\n", 2)[1]  # "name: <symbol>"
        for short, needle in suite.v8_functions:
            if head.startswith("name: ") and needle in head:
                listings[short] = block.split("--- End code ---")[0].strip() + "\n"
    for short, _ in suite.v8_functions:
        dest = asm_dir / f"{level}--{name}--{short}.v8.s"
        dest.write_text(listings.get(short, "(no TurboFan code: the function never got hot)\n"))
    dump.unlink()
    shutil.rmtree(crit, ignore_errors=True)


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


def bench_exe(suite, tree, env, level):
    """The built bench binary's path (cargo prints it as JSON); a .wasm for wasm."""
    built = run(["cargo", "bench", "-p", suite.package, "--bench", "step", "--no-run",
                 "--message-format=json"] + target_args(level),
                cwd=tree, env=env, capture=True)
    for line in built.stdout.splitlines():
        if line.startswith("{"):
            msg = json.loads(line)
            if msg.get("target", {}).get("name") == "step" and msg.get("executable"):
                return msg["executable"]
    sys.exit("no bench executable in cargo's output")


def perf_run(suite, tree, env, name, level, out, args):
    """perf stat and perf record + annotate on each of args.perf_benches.

    Criterion's --profile-time runs one bench in a loop for that long with
    no analysis: clean for a profiler, but it doesn't say how many
    iterations it ran. So counters come out as ratios here (IPC, per-cent
    stalls), and per-pair numbers are made from them with criterion's time.
    """
    exe = bench_exe(suite, tree, env, level)
    env = dict(env, CRITERION_HOME=str(out / level / name / "criterion-profile"))
    stats = {}
    for b in args.perf_benches.split(","):
        bench_args = [exe, "--bench", "--profile-time", str(args.perf_time), f"^{b}$"]
        stem = f"{level}--{name}--{b.replace('/', '__')}"
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


def check_node():
    """The v8 levels use the repo's Node (.nvmrc), so V8 is the one we pin."""
    pinned = [line.strip() for line in (REPO / ".nvmrc").read_text().splitlines()
              if line.strip() and not line.startswith("#")][-1]
    version = run(["node", "--version"], capture=True).stdout.strip()  # e.g. v24.22.3
    if version.lstrip("v").split(".")[0] != pinned.lstrip("v").split(".")[0]:
        sys.exit(f"node is {version}, .nvmrc wants {pinned}: run "
                 "`. ~/.nvm/nvm.sh && nvm install` first (installs it if missing)")


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


def bench_order(bench):
    """Sort key: the id's name parts, then its last part as a number (sizes
    in order, 16 before 128)."""
    head, _, last = bench.rpartition("/")
    return (head, int(last) if last.isdigit() else 0, last)


def write_summary(suite, out, results, counts, levels, names, perf,
                  statistic="mean"):
    benches = sorted({b for r in results.values() for b in r},
                     key=bench_order)
    with open(out / "results.csv", "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["level", "experiment", "bench", f"{statistic}_ns"])
        for (level, name), times in sorted(results.items()):
            for b, t in sorted(times.items()):
                w.writerow([level, name, b, f"{t:.1f}"])

    def fmt(ns):
        for unit, scale in (("ms", 1e6), ("µs", 1e3)):
            if ns >= scale:
                return f"{ns / scale:.3g} {unit}"
        return f"{ns:.3g} ns"

    machine = (out / "machine.txt").read_text().strip()
    md = [f"# {suite.title}", "", "```", machine, "```", ""]
    md += [{"mean": "Mean time",
            "estimate": "Time as criterion printed it (its point estimate; rebuilt "
                        "from the run's log with `--from-log`)"}[statistic]
           + f"; in brackets, the change against `{suite.reference}` at the same level.", ""]
    for level in levels:
        md += [f"## {level} (`RUSTFLAGS={LEVELS[level]!r}`)", ""]
        md += ["| bench | " + " | ".join(names) + " |",
               "|---" * (len(names) + 1) + "|"]
        base = results.get((level, suite.reference), {})
        for b in benches:
            cells = []
            for name in names:
                t = results.get((level, name), {}).get(b)
                if t is None:
                    cells.append("–")
                elif name == suite.reference or b not in base:
                    cells.append(fmt(t))
                else:
                    cells.append(f"{fmt(t)} ({(t / base[b] - 1) * 100:+.0f}%)")
            md.append(f"| {b} | " + " | ".join(cells) + " |")
        md.append("")
    if "default" in levels and len(levels) > 1:
        md += [f"## {suite.reference}, each level against default", ""]
        md += ["| bench | " + " | ".join(levels) + " |", "|---" * (len(levels) + 1) + "|"]
        ref = results.get(("default", suite.reference), {})
        for b in benches:
            cells = []
            for level in levels:
                t = results.get((level, suite.reference), {}).get(b)
                cells.append("–" if t is None or b not in ref
                             else f"{fmt(t)} ({(t / ref[b] - 1) * 100:+.0f}%)")
            md.append(f"| {b} | " + " | ".join(cells) + " |")
        md.append("")
    if perf:
        md += ["## perf", "",
               "From `perf stat` over criterion's `--profile-time` run. GHz is",
               "cycles / task-clock; per pair (where the bench's size is a body count)",
               "is criterion's mean time × GHz / pairs, with pairs = n(n−1)/2. Backend stalls: cycles the core waited on",
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
                n = int(b.rpartition("/")[2]) if suite.pairs else 0
                t = results.get((level, name), {}).get(b)
                cpp = t * ghz / (n * (n - 1) / 2) if t and suite.pairs else None
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


UNITS = {"ps": 1e-3, "ns": 1.0, "µs": 1e3, "us": 1e3, "ms": 1e6, "s": 1e9}
HEADER = re.compile(r"^=== (\S+) at (\S+) ===$")
TIME = re.compile(r"^(\S+/\d+)\s+time:\s+\[\S+ \S+ (\S+) (\S+) ")


def from_log(suite, log, out):
    """Rebuild out's summary from a run's log: criterion's printed estimate
    for every bench, the asm counts and perf stats from the files in out."""
    results, levels, names = {}, [], []
    key = None
    for line in log.read_text().splitlines():
        if m := HEADER.match(line):
            name, level = m.groups()
            key = (level, name)
            levels += [level] if level not in levels else []
            names += [name] if name not in names else []
        elif (m := TIME.match(line)) and key:
            bench, value, unit = m.groups()
            results.setdefault(key, {})[bench] = float(value) * UNITS[unit]
    counts = {f.name: count_ops(f.read_text()) for f in sorted((out / "asm").glob("*.s"))}
    perf = {}
    for f in sorted((out / "perf").glob("*.stat.csv")) if (out / "perf").exists() else []:
        level, name, bench = f.name.removesuffix(".stat.csv").split("--")
        # "swarm_step__Brute__10000"; older runs wrote "pairwise_f64-1024".
        bench = bench.replace("__", "/") if "__" in bench else "/".join(bench.rsplit("-", 1))
        perf.setdefault((level, name), {})[bench] = parse_stat(f.read_text())
    write_summary(suite, out, results, counts, levels, names, perf, statistic="estimate")
    print(f"Rebuilt from {log}: {out / 'summary.md'}")


def main(suite, doc=None):
    """Parse the command line and run the sweep `suite` describes. `doc` is
    the driver's own docstring, for --help."""
    p = argparse.ArgumentParser(description=doc,
                                formatter_class=argparse.RawDescriptionHelpFormatter)
    is_x86 = platform.machine() in ("x86_64", "AMD64")
    levels = ["default", "x86-64-v3", "native"] if is_x86 else ["default", "native"]
    if shutil.which("wasmtime"):
        levels += ["wasm", "wasm-simd128"]
    if shutil.which("node"):
        levels += ["v8", "v8-simd128"]
    p.add_argument("--levels", default=",".join(levels),
                   help="comma-separated CPU levels: " + ", ".join(LEVELS))
    presets = f"; or a preset: {', '.join(suite.presets)}" if suite.presets else ""
    p.add_argument("--experiments", default=",".join(suite.experiments),
                   help="comma-separated: " + ", ".join(suite.experiments) + presets)
    p.add_argument("--reference", default=suite.reference,
                   help="the experiment tables compare against (default %(default)s)")
    p.add_argument("--filter", default=suite.filter, help="criterion's bench filter (regex)")
    p.add_argument("--quick", action="store_true", help="short criterion runs (a smoke test)")
    p.add_argument("--perf", action="store_true",
                   help="also perf stat and perf record/annotate (Linux; needs "
                        "kernel.perf_event_paranoid <= 2)")
    p.add_argument("--perf-benches", default=suite.perf_benches,
                   help="comma-separated bench ids for --perf")
    p.add_argument("--perf-time", type=int, default=5,
                   help="seconds per bench under perf (criterion's --profile-time)")
    p.add_argument("--from-log", type=Path,
                   help="rebuild --out's summary from a run's log (its criterion "
                        "lines), the asm and perf files already in --out")
    host = socket.gethostname().split(".")[0]
    p.add_argument("--out", type=Path, default=suite.results / host,
                   help="where results go (replaced); default results/<host>")
    args = p.parse_args()
    if args.reference != suite.reference:
        if args.reference not in suite.experiments:
            sys.exit(f"unknown reference {args.reference}")
        suite = dataclasses.replace(suite, reference=args.reference)
    if args.from_log:
        return from_log(suite, args.from_log, args.out.resolve())
    levels = args.levels.split(",")
    names = [n for x in args.experiments.split(",") for n in suite.presets.get(x, [x])]
    for x in levels:
        if x not in LEVELS:
            sys.exit(f"unknown level {x}")
    for x in names:
        if x not in suite.experiments:
            sys.exit(f"unknown experiment {x}")

    if any(is_v8(x) for x in levels):
        check_node()
    if args.perf and not args.perf_benches:
        sys.exit("--perf: no --perf-benches")
    if args.perf and not shutil.which("perf"):
        sys.exit("--perf: perf isn't installed")
    # Absolute: criterion runs from the crate's folder, so a relative path
    # would land there.
    out = args.out.resolve()
    if out.exists():
        shutil.rmtree(out)
    (out / "asm").mkdir(parents=True)
    if args.perf:
        (out / "perf").mkdir()
    (out / "machine.txt").write_text(machine_info())
    work = HERE / ".work"
    work.mkdir(exist_ok=True)

    results, counts, perf = {}, {}, {}
    for name in names:
        for level in levels:
            # One target dir per level: changing RUSTFLAGS rebuilds every
            # dependency, so levels don't share. A knob change rebuilds only
            # the crate that reads them (cargo tracks the variables).
            knobs = suite.experiments[name].knobs
            env = dict(os.environ, RUSTFLAGS=LEVELS[level],
                       CARGO_TARGET_DIR=str(build_dir(work, level)), **knobs)
            for knob in suite.knobs:
                if knob not in knobs:
                    env.pop(knob, None)
            print(f"\n=== {name} at {level} ===", flush=True)
            results[(level, name)] = bench(suite, REPO, env, level, out / level / name, args)
            # The wasm text once: at the wasm level, or at v8's if that's unswept.
            if not is_v8(level) or level.replace("v8", "wasm") not in levels:
                counts.update(dump_asm(suite, REPO, env, name, level, out / "asm"))
            if is_v8(level):
                v8_code(suite, REPO, env, name, level, out / "asm")
            # perf can't name wasmtime's generated code, so no wasm.
            if args.perf and not is_wasm(level):
                perf[(level, name)] = perf_run(suite, REPO, env, name, level, out, args)
            write_summary(suite, out, results, counts, levels, names, perf)
    print(f"\nDone: {out / 'summary.md'}")

