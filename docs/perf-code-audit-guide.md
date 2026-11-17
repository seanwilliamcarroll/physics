# Platform-Specific Performance Code: Audit Guide

A checklist for auditing whether a performance-sensitive codebase keeps platform-specific code contained, or whether it is drifting toward a tangle of `cfg` attributes, intrinsics, and magic numbers. Examples are in Rust, but the principles apply to C++ and other systems languages.

Work through the sections in order. Each one opens with the principle, then gives checks, red flags, and remediation steps.

---

## 0. Before You Start

Gather these first. The audit depends on them.

- [ ] A profile from **each** target platform (e.g. `perf`/`samply` on Zen 5, Instruments/`samply` on Apple Silicon)
- [ ] A benchmark suite that runs on every target, with saved baseline results
- [ ] A list of target platforms and how binaries are deployed (built on the machine that runs them, or shipped to unknown hardware?)
- [ ] A grep inventory of platform-specific code:

```sh
rg -n '#\[cfg\(target_(arch|feature|os)' --stats
rg -n 'is_(x86|aarch64)_feature_detected!' --stats
rg -n 'core::arch|std::arch' --stats
rg -n '#\[target_feature' --stats
```

Record the counts. They serve as the baseline for measuring whether remediation is working.

---

## 1. Boundary Containment

**Principle:** Platform-specific code lives behind a small, deliberate interface. Everything above the boundary (algorithms, data structures, blocking strategy) is written once.

### Checks

- [ ] Every `#[cfg(target_arch)]` / `#[cfg(target_feature)]` appears at a **module boundary** or in a **dispatcher**, not inside function bodies containing business logic
- [ ] Platform-specific kernels sit in a dedicated module tree with one file per backend:

```
kernels/
  mod.rs      // public API + dispatch; the only place cfg appears
  scalar.rs   // reference implementation, always compiled
  neon.rs     // aarch64
  avx2.rs     // x86_64
  avx512.rs   // x86_64
```

- [ ] The kernel interface is a plain function signature or trait, with no platform types (`__m512`, `float32x4_t`) leaking into callers
- [ ] Callers of kernels cannot tell which backend ran

### Red flags

- `#[cfg]` blocks scattered through high-level modules
- Intrinsic types appearing in struct definitions outside the kernel module
- The same function duplicated in full per platform when only an inner loop differs
- Platform `cfg` nested inside other platform `cfg`

### Remediation

1. List every function that contains intrinsics or `cfg`.
2. Extract the smallest platform-varying piece into a kernel function.
3. Move it into the backend module and route calls through `mod.rs`.
4. Re-run the grep inventory. The count outside `kernels/` should trend toward zero.

---

## 2. Dispatch Strategy

**Principle:** Choose compile-time or runtime dispatch deliberately, and dispatch at the coarsest sensible granularity.

### Checks

- [ ] The dispatch choice matches deployment:
  - **Compile-time** (`cfg` + `target-cpu`) when binaries are built for the machine they run on
  - **Runtime** (`is_x86_feature_detected!` + `#[target_feature]`) when binaries ship to unknown hardware
- [ ] aarch64 NEON paths are not runtime-detected unnecessarily (NEON is baseline on aarch64)
- [ ] Dispatch happens **once per outer operation** (a whole matmul, a whole buffer), not per element or per inner-loop call
- [ ] `#[target_feature]` functions call other `#[target_feature]` functions with the same features, so inlining is not blocked
- [ ] A scalar fallback exists and is reachable on every platform

### Red flags

- Feature detection inside a hot loop
- Hand-rolled function-pointer caches duplicated across modules
- `#[target_feature]` kernels that call generic helpers, which then fail to inline and lose the feature context (check the assembly)
- AVX-512 paths that are never exercised because the dev machine lacks the feature

### Remediation

- Hoist dispatch to the top-level operation. Make the driver generic over a backend type and dispatch once:

```rust
pub fn matmul(a: &Matrix, b: &Matrix, c: &mut Matrix) {
    #[cfg(target_arch = "x86_64")]
    if is_x86_feature_detected!("avx512f") {
        return unsafe { matmul_impl::<Avx512>(a, b, c) };
    }
    #[cfg(target_arch = "aarch64")]
    return matmul_impl::<Neon>(a, b, c);

    #[allow(unreachable_code)]
    matmul_impl::<Scalar>(a, b, c)
}
```

- Consider `pulp` or `multiversion` instead of hand-written dispatch boilerplate.

---

## 3. Tuning Parameters

**Principle:** Much platform-specific performance comes from parameters, not instructions. Keep parameters out of the code.

### Checks

- [ ] Tile sizes, unroll factors, block sizes, and prefetch distances live in **one** per-target configuration struct or module
- [ ] No magic numbers in kernel loops (search for literal `64`, `128`, `256`, `4096`, etc.)
- [ ] Cache-line size is a named constant, not assumed (Apple Silicon uses 128-byte lines; Zen uses 64-byte)
- [ ] Alignment and padding decisions (e.g. `#[repr(align(N))]` to avoid false sharing) reference the constant
- [ ] Each parameter has a comment or doc saying how its value was chosen (benchmark, autotune, vendor docs)

### Red flags

- The same kernel duplicated per platform where the copies differ only in constants
- Parameters tuned on one machine silently applied to another
- `#[repr(align(64))]` hardcoded in code that also runs on Apple Silicon

### Remediation

```rust
pub struct Tuning {
    pub cache_line: usize,
    pub mc: usize, pub kc: usize, pub nc: usize, // GEMM blocking
    pub unroll: usize,
}

#[cfg(target_arch = "aarch64")]
pub const TUNING: Tuning = Tuning { cache_line: 128, /* ... */ };

#[cfg(target_arch = "x86_64")]
pub const TUNING: Tuning = Tuning { cache_line: 64, /* ... */ };
```

- For maximum effect, autotune in `build.rs` or on first run and cache the results (the FFTW "wisdom" approach).

---

## 4. Autovectorization Before Intrinsics

**Principle:** Portable code that the compiler vectorizes well beats hand-written intrinsics you have to maintain per platform.

### Checks

- [ ] Each intrinsics kernel has a recorded justification: a benchmark showing the portable version underperforms by a meaningful margin
- [ ] Portable kernels are written in vectorizer-friendly style:
  - `chunks_exact` / `chunks_exact_mut` with explicit remainder handling
  - Fixed-size array accumulators (`[f32; 8]`) for reductions
  - No bounds checks in the hot loop (slices pre-sliced to known lengths, or assertions hoisted)
  - No aliasing ambiguity (`&mut` vs `&` separation)
- [ ] Per-target codegen flags are set in `.cargo/config.toml`, not passed ad hoc:

```toml
[target.x86_64-unknown-linux-gnu]
rustflags = ["-C", "target-cpu=native"]   # or znver5

[target.aarch64-apple-darwin]
rustflags = ["-C", "target-cpu=native"]
```

- [ ] The assembly of hot portable loops has been inspected (`cargo asm`, Compiler Explorer) on each target

### Red flags

- Intrinsics written before a portable version was benchmarked
- Release builds missing `target-cpu` settings, leaving x86 at the SSE2 baseline
- `target-cpu=native` used for binaries distributed to other machines

### Remediation

- For each intrinsics kernel, write or restore a vectorizer-friendly portable version and benchmark both. Delete the intrinsics if the gap is negligible.
- For explicit-but-portable SIMD, consider `std::simd` (nightly) or the `wide` crate.

---

## 5. Correctness: The Scalar Oracle

**Principle:** Multiple implementations are maintainable only if every one is tested against a single reference.

### Checks

- [ ] A scalar reference implementation exists for every kernel and is always compiled
- [ ] Every backend is differential-tested against the scalar reference
- [ ] Tests cover awkward sizes: 0, 1, lane width − 1, lane width + 1, non-multiples of the tile size, large sizes
- [ ] Tests cover unaligned inputs and sub-slices at odd offsets
- [ ] Floating-point comparisons use a tolerance justified by the reassociation each kernel does
- [ ] Property-based testing (`proptest` / `quickcheck`) generates sizes and values
- [ ] CI runs the tests on **every** target architecture, including the AVX-512 path

### Red flags

- Backends tested only against hand-picked expected values
- Remainder/tail handling with no tests
- An ISA path that cannot run on any CI machine (consider Intel SDE for emulating AVX-512)
- Exact float equality across backends

### Remediation

```rust
proptest! {
    #[test]
    fn dot_matches_scalar(len in 0usize..1024, seed: u64) {
        let (a, b) = random_vecs(len, seed);
        let expected = scalar::dot(&a, &b);
        let got = dot(&a, &b); // dispatched
        prop_assert!((got - expected).abs() <= tol(len, &a, &b));
    }
}
```

---

## 6. Performance Regression Protection

**Principle:** A change that is portable for correctness can still regress one platform for performance.

### Checks

- [ ] Benchmarks (e.g. `criterion`) exist for each kernel and each top-level hot operation
- [ ] Benchmarks run on **each** target platform, with per-platform baselines stored
- [ ] There is a documented threshold for what counts as a regression
- [ ] Benchmark results include the compiler version and flags used

### Red flags

- Benchmarks run only on the developer's primary machine
- No saved baselines, so regressions are judged from memory
- Toolchain upgrades merged without re-benchmarking (LLVM changes vectorization behavior between versions)

---

## 7. Escalation Discipline

**Principle:** Each level of platform specificity has a maintenance cost. Climb only as far as the profile justifies.

| Level | Approach | Platform-specific source |
|---|---|---|
| 1 | Portable code + `target-cpu` flags | None |
| 2 | Portable SIMD abstractions (`std::simd`, `wide`, `pulp`) | None to minimal |
| 3 | Hand-written intrinsics per ISA | Per-kernel backends |
| 4 | Inline / external assembly | Maximum |

### Checks

- [ ] Each kernel's current level is recorded, along with the benchmark that justified leaving the level below
- [ ] Most of the codebase is at level 1 or 2
- [ ] Level 3 and 4 code is limited to the kernels that dominate the profile

### Red flags

- Level 3 code in functions that don't appear in any profile
- No record of why a kernel was escalated

---

## Audit Summary Template

Copy this into the audit write-up.

```markdown
## Audit: <project> — <date>

Targets: <e.g. aarch64-apple-darwin (M4), x86_64-unknown-linux-gnu (Zen 5)>
Deployment: <built on target / distributed>
Toolchain: <rustc version>

### Inventory
| Metric | Count | Outside kernels/ |
|---|---|---|
| cfg(target_*) |  |  |
| target_feature fns |  |  |
| intrinsics call sites |  |  |

### Kernel table
| Kernel | % of profile (M4) | % of profile (Zen 5) | Level | Backends | Oracle-tested | Benchmarked |
|---|---|---|---|---|---|---|

### Findings
| # | Section | Severity | Finding | Remediation |
|---|---|---|---|---|

### Follow-ups
- [ ] ...
```

---

## Quick Reference: Severity Guide

- **High:** Untested backend paths; dispatch inside hot loops; platform types leaking out of the kernel module; `target-cpu=native` on distributed binaries
- **Medium:** Magic tuning numbers in loops; intrinsics with no portable benchmark; benchmarks on only one platform
- **Low:** Hand-rolled dispatch that a crate could replace; missing justification comments on tuning values
