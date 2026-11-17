#!/usr/bin/env python3
"""What each target compiled the tuned kernels to (`docs/perf-audit.md`):
pairwise gravity's (`force/pairwise/tuning.rs`) and the boids' lane loop
(`rules/tuning.rs`), on the M4 or this host, x86 at the SSE2 baseline, at
x86-64-v3 and with AVX-512 (cross-compiled for x86_64-apple-darwin, which
links on a Mac), and wasm with simd128. Run it after changing a tuning
table: each kernel's hottest loops, their register width, vector and
scalar float operations, square roots, stack traffic and shuffles.

Each function is cut at its own label (`cargo asm` may print neighbours),
loops found by backward branches (wasm: `loop` blocks). Builds go to
`.work/` here (git-ignored). Needs cargo-show-asm; stdlib Python.

    experiments/perf-audit/kernels.py
"""
import os, re, subprocess
REPO = "/Users/sean/physics"
HERE = os.path.join(os.path.dirname(os.path.abspath(__file__)), ".work")
TARGETS = [
    ("aarch64 (M4)", [], {}, "arm"),
    ("x86 SSE2", ["--target", "x86_64-apple-darwin"], {"RUSTFLAGS": "-C target-cpu=x86-64"}, "x86"),
    ("x86 AVX2", ["--target", "x86_64-apple-darwin"], {"RUSTFLAGS": "-C target-cpu=x86-64-v3"}, "x86"),
    ("x86 AVX-512", ["--target", "x86_64-apple-darwin"], {"RUSTFLAGS": "-C target-cpu=znver5"}, "x86"),
    ("wasm simd128", ["--target", "wasm32-wasip1"], {}, "wasm"),
]
KERNELS = [("engine", r"pairwise::(blocked::sweep|two_pass::pass_one)::<", 1),
           ("swarm", r"Seen>::add_span::<|<swarm::flock::Flock>::step$", 2)]


def body(text, name):
    lines = text.splitlines()
    start = next((i for i, l in enumerate(lines) if l.rstrip().endswith(":") and name in l and not l.startswith((" ", "\t"))), None)
    if start is None:
        return []
    out = []
    for l in lines[start + 1:]:
        if re.match(r"^[^\s.L#;][^:]*:\s*$", l) and not re.match(r"^\.?L", l):
            break
        out.append(l.strip())
    return [l for l in out if l and not l.startswith(("//", ";", "#"))]


def loops(ins, kind):
    if kind == "wasm":
        st, out = [], []
        for i, l in enumerate(ins):
            op = l.split()[0]
            if op in ("block", "loop", "if"):
                st.append((op, i))
            elif op in ("end_block", "end_loop", "end_if") and st:
                k, s = st.pop()
                if k == "loop":
                    out.append((s, i))
        return out
    labels, code = {}, []
    for l in ins:
        m = re.match(r"^\.?(L\w+):", l)
        if m:
            labels[m.group(1)] = len(code)
        elif not l.startswith("."):
            code.append(l)
    ins[:] = code
    out = []
    for k, t in enumerate(code):
        m = re.search(r"(?:^b(?:\.\w+)?|^j\w+|cbn?z\s+\w+,|tbn?z\s+\w+,\s*#\d+,)\s+\.?(L\w+)$", t)
        if m and m.group(1) in labels and labels[m.group(1)] <= k:
            out.append((labels[m.group(1)], k))
    return out


def vec_ops(t, kind):
    op = t.split()[0]
    if kind == "wasm":
        return op.startswith(("f32x4.", "f64x2."))
    if kind == "arm":
        return op.startswith("f") and bool(re.search(r"\.(4s|2d)\b", op + " " + t))
    return bool(re.match(r"v?\w+p[sd]$", op)) and not op.startswith(("vmov", "mov", "vxor", "xor", "vunpck", "unpck", "vshuf", "shuf", "vperm", "vblend", "blend", "vbroadcast"))


def describe(seg, kind):
    s = " ".join(seg)
    if kind == "x86":
        width = "zmm" if "zmm" in s else "ymm" if "ymm" in s else "xmm"
    elif kind == "arm":
        width = ".4s/.2d" if re.search(r"\.(4s|2d)", s) else "scalar"
    else:
        width = "v128" if re.search(r"x[24]\.", s) else "scalar"
    vec = sum(1 for t in seg if vec_ops(t, kind))
    sca = sum(1 for t in seg if re.match(r"^(v?(add|sub|mul|div|sqrt)s[sd]|f(add|sub|mul|div|sqrt|madd|msub)\s+[sd]\d|f(32|64)\.(add|sub|mul|div|sqrt))\b", t))
    sq = sorted(set(re.findall(r"\b(v?sqrtp[sd]|v?sqrts[sd]|fsqrt(?:\.\d[sd])?|f64x2\.sqrt|f32x4\.sqrt|f64\.sqrt|f32\.sqrt)\b", s)))
    stack = len(re.findall(r"\[(rsp|rbp|sp)\b", s))
    shuf = len(re.findall(r"\b(ld4|st4|zip[12]|uzp[12]|extract_lane|replace_lane|vextract\w+|vperm\w+|v?shufp[sd]|v?unpck\w+)\b", s))
    return f"{len(seg):4} instr, {width:7}, vector float {vec:3}, scalar float {sca:3}, sqrt {','.join(sq) or '-':16} stack {stack:3}, shuffles {shuf}"


for tag, args, env, kind in TARGETS:
    print(f"\n== {tag}")
    for pkg, pat, top in KERNELS:
        tdir = os.path.join(HERE, "target-" + re.sub(r"\W+", "-", tag + pkg))
        e = dict(os.environ, CARGO_TARGET_DIR=tdir, **env)
        base = ["cargo", "asm", "-p", pkg, "--bench", "step"] + args
        names = subprocess.run(base, cwd=REPO, env=e, capture_output=True, text=True).stdout
        found = [(m.group(1), m.group(2)) for m in (re.match(r'\s*(\d+)\s+"([^"]+)"', l) for l in names.splitlines()) if m and re.search(pat, m.group(2))]
        # add_span if it exists, else the step it's inlined into.
        if pkg == "swarm" and any("add_span" in n for _, n in found):
            found = [(i, n) for i, n in found if "add_span" in n]
        for idx, name in found:
            out = subprocess.run(base + (["--intel"] if kind == "x86" else []) + [idx],
                                 cwd=REPO, env=e, capture_output=True, text=True).stdout
            ins = body(out, name)
            if not ins:
                ins = [l.strip() for l in out.splitlines() if l.strip()]
            lp = loops(ins, kind)
            ranked = sorted(lp, key=lambda ab: -sum(1 for t in ins[ab[0]:ab[1] + 1] if vec_ops(t, kind)))
            # innermost among those carrying the most vector work
            chosen = []
            for a, b in ranked:
                if any(a <= c and d <= b for c, d in chosen):
                    continue
                chosen = [(c, d) for c, d in chosen if not (c <= a and b <= d)]
                chosen.append((a, b))
                if len(chosen) >= top:
                    break
            short = re.sub(r"^.*?pairwise::|^<swarm::rules::|^<swarm::flock::", "", name)
            for a, b in chosen or [(0, len(ins) - 1)]:
                print(f"  {short:30} {describe(ins[a:b + 1], kind)}")
