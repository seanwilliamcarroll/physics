#!/usr/bin/env python3
"""Writes results/sweep.md from results/llm-sweep and results/m4-sweep:
all the data, then by platform and by method. Stdlib only."""
import os
os.chdir(os.path.join(os.path.dirname(os.path.abspath(__file__)), "results"))
import csv, re
RUNS = [("Zen 5", "llm-sweep"), ("M4", "m4-sweep")]
LEVELS = ["default", "x86-64-v3", "native", "wasm", "wasm-simd128", "v8", "v8-simd128"]
EXPS = ["base"] + [f"{l}-l{n}" for l in "cd" for n in (1, 2, 4, 8, 16)]
BENCHES = [f"pairwise_{s}/{n}" for s in ("f64", "f32") for n in (16, 128, 1024, 4096)]
UNIT = {"16": ("ns", 1), "128": ("µs", 1e3), "1024": ("µs", 1e3), "4096": ("ms", 1e6)}

data = {}
machine = {}
for m, d in RUNS:
    for r in csv.DictReader(open(f"{d}/results.csv")):
        data[(m, r["level"], r["experiment"], r["bench"])] = float(r["mean_ns"])
    info = open(f"{d}/machine.txt").read().splitlines()
    machine[m] = [l for l in info if l.split(":")[0] in ("cpu", "simd") or l.startswith(("wasmtime", "node", "rustc"))]
levels = {m: [l for l in LEVELS if any(k[0] == m and k[1] == l for k in data)] for m, _ in RUNS}

def head(b):
    s, n = b.split("_")[1].split("/")
    return f"{s} {n} ({UNIT[n][0]})"
def val(t, b):
    u, sc = UNIT[b.split("/")[1]]
    v = t / sc
    return f"{v:.3g}" if v < 100 else f"{v:.0f}"
def cell(m, l, e, b, best=None):
    t = data.get((m, l, e, b))
    if t is None: return "–"
    base = data.get((m, l, "base", b))
    txt = val(t, b) if e == "base" or base is None else f"{val(t, b)} ({(t/base-1)*100:+.0f}%)"
    return f"**{txt}**" if best is not None and t == best else txt
def table(cols, rows):
    out = ["| " + " | ".join(cols) + " |", "|" + "---|" * len(cols)]
    out += ["| " + " | ".join(r) + " |" for r in rows]
    return out + [""]

md = ["# Gravity sweep: C and D at 1–16 lanes", "",
      "Mean time per `accumulate` call (criterion). In brackets: change against `base` at the same machine and level. Bold: fastest in the column of that table.", "",
      "Experiments: `base` (main at ea2169b); `c-lN`: C (two passes, pass 2 in N lanes); `d-lN`: D (one pass, blocks of N lanes). C and D give identical bits at the same N.", ""]
for m, _ in RUNS:
    md += [f"**{m}:** " + "; ".join(machine[m]), ""]
md += ["Levels: `default` (target baseline), `x86-64-v3` (AVX2), `native` (`-C target-cpu=native`), `wasm` / `wasm-simd128` (wasmtime), `v8` / `v8-simd128` (Node).", ""]

md += ["## Contents", "", "1. All data", "2. By platform", "3. By method", "4. Best per platform", "4a. Best per build, 4096 bodies", "5. perf (Zen 5, 1024 bodies)", ""]

md += ["## 1. All data", ""]
rows = []
for m, _ in RUNS:
    for l in levels[m]:
        for e in EXPS:
            rows.append([m, l, e] + [cell(m, l, e, b) for b in BENCHES])
md += table(["machine", "level", "experiment"] + [head(b) for b in BENCHES], rows)

md += ["## 2. By platform", ""]
for m, _ in RUNS:
    for l in levels[m]:
        md += [f"### {m}, {l}", ""]
        best = {b: min(data[(m, l, e, b)] for e in EXPS if (m, l, e, b) in data) for b in BENCHES}
        md += table(["experiment"] + [head(b) for b in BENCHES],
                    [[e] + [cell(m, l, e, b, best[b]) for b in BENCHES] for e in EXPS])

md += ["## 3. By method", ""]
for e in EXPS:
    md += [f"### {e}", ""]
    md += table(["machine", "level"] + [head(b) for b in BENCHES],
                [[m, l] + [cell(m, l, e, b) for b in BENCHES] for m, _ in RUNS for l in levels[m]])

md += ["## 4. Best per platform", "", "Fastest experiment per machine, level and bench, with its time and change against `base`.", ""]
rows = []
for m, _ in RUNS:
    for l in levels[m]:
        r = [m, l]
        for b in BENCHES:
            e = min((x for x in EXPS if (m, l, x, b) in data), key=lambda x: data[(m, l, x, b)])
            r.append(f"{e}: {cell(m, l, e, b)}")
        rows.append(r)
md += table(["machine", "level"] + [head(b) for b in BENCHES], rows)

md += ["## 4a. Best per build, 4096 bodies", "",
       "For each machine and level, the fastest experiment at 4096 bodies, with its time and change against `base`.", ""]
rows = []
for m, _ in RUNS:
    for l in levels[m]:
        r = [m, l]
        for b in ("pairwise_f64/4096", "pairwise_f32/4096"):
            e = min((x for x in EXPS if (m, l, x, b) in data), key=lambda x: data[(m, l, x, b)])
            t, base = data[(m, l, e, b)], data[(m, l, "base", b)]
            r += [f"`{e}`", f"{t / 1e6:.2f}", f"{base / 1e6:.2f}", f"{(t / base - 1) * 100:+.0f}%"]
        rows.append(r)
md += table(["machine", "level", "f64 best", "f64 ms", "f64 base ms", "f64 vs base",
             "f32 best", "f32 ms", "f32 base ms", "f32 vs base"], rows)

md += ["## 5. perf (Zen 5, 1024 bodies)", "", "From `llm-sweep/summary.md`: cycles and instructions per pair, IPC.", ""]
perf = open("llm-sweep/summary.md").read()
sec = perf[perf.index("## perf"):perf.index("## sqrt")]
lines = [l for l in sec.splitlines() if l.startswith("|")]
hdr = [c.strip() for c in lines[0].strip("|").split("|")]
keep = [i for i, c in enumerate(hdr) if c not in ("backend stall", "GHz")]
prow = []
for l in lines[2:]:
    c = [x.strip() for x in l.strip("|").split("|")]
    prow.append([c[i] for i in keep])
order = {e: i for i, e in enumerate(EXPS)}
lvl = {l: i for i, l in enumerate(LEVELS)}
prow.sort(key=lambda r: (r[2], lvl.get(r[0], 9), order.get(r[1], 99)))
md += table([hdr[i] for i in keep], prow)

open("sweep.md", "w").write("\n".join(md))
print(len(md), "lines")
