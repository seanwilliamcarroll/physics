# LLVM's ordered FP reductions on AArch64: a slow loop that wasm doesn't have

Found in the gravity experiments (`docs/gravity-vectorize.md`, steps 7
and 11). On an Apple M4, the engine's *blocked* pair loop at 4 lanes ran
**1.7× slower natively** than the same Rust compiled to wasm and run by
wasmtime (Cranelift) or V8. The cause is one choice by LLVM's loop
vectorizer, and `repro.rs` here shows it in 30 lines.

## What happens

The loop walks blocks of four `f64`, and keeps four running sums (one
per lane) across blocks:

```rust
for ((x4, y4), o4) in xs.iter().zip(ys).zip(out.iter_mut()) {
    for l in 0..4 {
        let (x, y) = (x4[l], y4[l]);
        let d = x * x + y * y;
        let s = k / (d * d.sqrt());
        let (fx, fy) = (x * s, y * s);
        o4[l] -= fx;
        sx[l] += fx;   // four sums, one per lane, across blocks
        sy[l] += fy;
    }
}
```

The SLP vectorizer packs each block into two 2-wide vectors, which is
the shape that's fast. On AArch64, the **loop vectorizer** then goes
further: it vectorizes the *outer* loop across blocks (two blocks an
iteration, de-interleaved with `ld4.2d`/`zip`), so each vector holds
one lane of two consecutive blocks. The sums must stay in order (block
*b*'s value before *b+1*'s: floating-point addition isn't associative,
and Rust doesn't allow reordering it), so it adds them one element at a
time: an **ordered reduction**, a serial chain of scalar `fadd`s with
`mov d, v[1]` between them, and many more live values (spills to the
stack).

LLVM's option for this is `-force-ordered-reductions`; on AArch64 it
behaves as if on by default. Set to `false`, the outer-loop
vectorization goes away and the fast loop is what runs. The wasm32
target doesn't vectorize this way, so the wasm that Cranelift and V8
compile already has the fast shape.

## Numbers (Apple M4)

The engine's blocked loop, 4 lanes, `f64`, `PairwiseGravity::accumulate`:

| | 1,024 bodies | 4,096 bodies |
|---|---|---|
| native, rustc 1.99.1 (LLVM 23.1.1) | 773 µs | 12.48 ms |
| native, `-C llvm-args=-force-ordered-reductions=false` | 477 µs | **7.58 ms** |
| native, `-C no-vectorize-loops` (the loop vectorizer off) | 499 µs | 7.83 ms |
| wasm + `simd128`, wasmtime 50 (Cranelift) | 460 µs | 7.36 ms |
| wasm + `simd128`, Node 24 (V8) | 440 µs | 7.08 ms |

`repro.rs` (1,024 blocks of 4, a call):

| | time | `ld4`/`ld2` | scalar `fadd d` | stack accesses |
|---|---|---|---|---|
| native, rustc 1.99.1 (LLVM 23.1.1) | 3.0 µs | 2 | 33 | 82 |
| native, nightly 2026-10-15 (LLVM 23.1.3) | 3.0 µs | 2 | 33 | 82 |
| native, `-force-ordered-reductions=false` | 2.5 µs | 0 | 1 | 46 |
| wasm + `simd128`, wasmtime 50 | 2.0 µs | | | |

The reproducer shows the same code and a smaller cost (16–18%; the
engine's loop has more live values, so spills cost more). It also has a
second gap the engine doesn't: Cranelift's loop is 20% faster than
LLVM's fast one though their shapes match (below). Not explained.

Not affected: the engine's default loop (two-pass, 16 lanes) is the same
speed with the option off.

## The loops side by side (`repro.rs`, `sweep`)

**LLVM, default (ordered reductions).** 185 lines for two blocks, the
main loop. Excerpts: it starts by spilling and de-interleaving two
blocks,

```asm
LBB5_5:
	stp	q5, q4, [sp, #32]
	stp	q18, q16, [sp, #192]
	stp	q3, q2, [sp, #224]
	str	q7, [sp, #256]
	ld4.2d	{ v12, v13, v14, v15 }, [x14]
	ldp	q6, q0, [x12, #-32]
	ldp	q19, q18, [x12, #-64]
	zip1.2d	v2, v19, v6
	zip2.2d	v1, v19, v6
	...
```

and adds each sum in order, element by element (32 of these):

```asm
	fadd	d18, d18, d1
	mov	d1, v1[1]
	fadd	d1, d18, d1
	fadd	d1, d1, d16
	mov	d16, v16[1]
	fadd	d18, d1, d16
	...
```

**LLVM, `-force-ordered-reductions=false`.** One block an iteration, the
sums in vector registers (`v0`, `v2`, `v3`, `v4`):

```asm
LBB5_2:
	ldp	q5, q6, [x11, #-16]
	fmul.2d	v7, v5, v5
	ldp	q16, q17, [x10, #-16]
	fmul.2d	v18, v16, v16
	fadd.2d	v7, v7, v18
	fsqrt.2d	v18, v7
	fmul.2d	v7, v7, v18
	fdiv.2d	v7, v1, v7
	fmul.2d	v5, v5, v7
	fmul.2d	v7, v16, v7
	ldp	q16, q18, [x9, #-16]
	fsub.2d	v16, v16, v5
	fadd.2d	v0, v0, v5
	fadd.2d	v3, v3, v7
	fmul.2d	v5, v6, v6
	fmul.2d	v7, v17, v17
	fadd.2d	v5, v5, v7
	fsqrt.2d	v7, v5
	fmul.2d	v5, v5, v7
	fdiv.2d	v5, v1, v5
	fmul.2d	v6, v6, v5
	fmul.2d	v5, v17, v5
	fsub.2d	v7, v18, v6
	stp	q16, q7, [x9, #-16]
	fadd.2d	v2, v2, v6
	fadd.2d	v4, v4, v5
	add	x9, x9, #32
	add	x10, x10, #32
	add	x11, x11, #32
	subs	x8, x8, #1
	b.ne	LBB5_2
```

**Cranelift (wasmtime 50), from the wasm.** The same shape (wasm memory
is addressed from a base, `x8`, with 32-bit offsets):

```asm
	ldr     q20, [x8, w11, uxtw]
	ldr     q18, [x8, w5, uxtw]
	ldr     q17, [x8, w7, uxtw]
	fmul    v19.2d, v18.2d, v18.2d
	fmul    v21.2d, v17.2d, v17.2d
	fadd    v19.2d, v19.2d, v21.2d
	fsqrt   v21.2d, v19.2d
	fmul    v19.2d, v19.2d, v21.2d
	fdiv    v19.2d, v16.2d, v19.2d
	fmul    v18.2d, v18.2d, v19.2d
	fsub    v20.2d, v20.2d, v18.2d
	str     q20, [x8, w11, uxtw]
	add     w10, w11, #0x10
	ldr     q21, [x8, w10, uxtw]
	add     w12, w5, #0x10
	ldr     q22, [x8, w12, uxtw]
	add     w12, w7, #0x10
	ldr     q20, [x8, w12, uxtw]
	fmul    v23.2d, v22.2d, v22.2d
	fmul    v24.2d, v20.2d, v20.2d
	fadd    v23.2d, v23.2d, v24.2d
	fsqrt   v24.2d, v23.2d
	fmul    v23.2d, v23.2d, v24.2d
	fdiv    v23.2d, v16.2d, v23.2d
	fmul    v22.2d, v22.2d, v23.2d
	fsub    v21.2d, v21.2d, v22.2d
	str     q21, [x8, w10, uxtw]
	sub     w0, w0, #1
	add     w11, w11, #0x20
	add     w5, w5, #0x20
	add     w7, w7, #0x20
	fmul    v20.2d, v20.2d, v23.2d
	fadd    v26.2d, v26.2d, v20.2d
	fadd    v1.2d, v1.2d, v22.2d
	fmul    v17.2d, v17.2d, v19.2d
	fadd    v2.2d, v2.2d, v17.2d
	fadd    v0.2d, v0.2d, v18.2d
	cbnz    w0, #0x674
```

## Reproducing

```sh
# native, both ways (asm in repro.s, repro-off.s)
rustc -O -C codegen-units=1 --emit asm,link -o repro experiments/llvm-ordered-reductions/repro.rs && ./repro
rustc -O -C codegen-units=1 -C llvm-args=-force-ordered-reductions=false --emit asm,link -o repro-off experiments/llvm-ordered-reductions/repro.rs && ./repro-off
# wasm, run by wasmtime, and Cranelift's machine code
rustc -O -C codegen-units=1 --target wasm32-wasip1 -C target-feature=+simd128 -o repro.wasm experiments/llvm-ordered-reductions/repro.rs && wasmtime run repro.wasm
wasmtime compile repro.wasm -o repro.cwasm && wasmtime objdump --filter sweep repro.cwasm
```

The engine's version: `GRAVITY_LOOP=blocked GRAVITY_LANES=4
GRAVITY_PLAIN_BELOW=1 cargo bench -p engine --bench step -- pairwise_f64`,
with and without `RUSTFLAGS="-C llvm-args=-force-ordered-reductions=false"`;
the asm, `cargo asm -p engine --bench step
"engine::force::pairwise::blocked::sweep::<f64>"` under the same
settings.

## Before reporting it

- **LLVM's main branch.** Checked only on LLVM 23 (stable rustc and the
  pinned nightly). Compiler Explorer can compile `repro.rs` with Rust
  nightly or the IR with `llc` trunk; that sends the code to a public
  site, so it's a step to take by hand.
- **An IR reproducer.** LLVM's developers prefer IR and an `opt`
  command: `rustc -O --emit llvm-ir` on `repro.rs`, then the loop
  vectorizer alone, `opt -passes=loop-vectorize
  -mtriple=aarch64-apple-darwin` with and without
  `-force-ordered-reductions=false`.
- **Where:** `llvm/llvm-project` GitHub issues, labels
  `backend:AArch64`, `vectorizers`, `missed-optimization`.

## A draft issue

> **[AArch64][LoopVectorize] Ordered FP reductions make a loop 1.2–1.7× slower than not vectorizing it**
>
> A loop over blocks of four `f64`, with four running sums (one per
> lane) across blocks, is SLP-vectorized into two `<2 x double>` per
> block. On AArch64 the loop vectorizer then also vectorizes the outer
> loop (VF 2, interleaving two blocks with `ld4`/`zip`) using ordered
> (strict) reductions: each sum becomes a chain of scalar `fadd` and lane
> moves, with heavy spilling. With `-force-ordered-reductions=false` the
> outer loop isn't vectorized and the result is faster: 3.0 → 2.5 µs for
> the attached reproducer, 12.5 → 7.6 ms for the original (an n-body
> gravity loop), on an Apple M4, rustc 1.99 / LLVM 23.1. The same Rust
> compiled to wasm32 (+simd128), whose loop vectorizer doesn't do this,
> runs at 7.4 ms under wasmtime's Cranelift.
>
> Expected: the cost model rejects the ordered-reduction plan when the
> reductions' serial chain (32 scalar adds per iteration in the
> reproducer) outweighs the gain from the wider loop.
>
> Reproducer: `repro.rs` (attached), asm for both settings (attached).
