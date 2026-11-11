# Running physics off the main thread

Status: **design note, not a plan.** Written 2026-11-10, after M6. Nothing
here is built. It records three options for heavy pages, from cheapest to
most invasive, and what each would change, so the decision is ready when
a milestone needs it.

The trigger is the M2 page at N = 4096 (TASKS, "Known gaps"). Its three
panels need about 55 ms of physics per display frame in the browser,
against a 16.7 ms frame at 60 Hz. The page drops to about 1 fps.

## Today: everything on the main thread

```
 main thread, once per display frame (~16.7 ms at 60 Hz)
 ┌─────────────────────────────────────────────────────────────┐
 │ for each panel:  demo_advance(panel, elapsed)  ← physics    │
 │ for each panel:  read positions from wasm memory, draw      │
 │ readouts, plots; then the browser handles input and paints  │
 └─────────────────────────────────────────────────────────────┘
```

A page loads one `engine.wasm` instance, and every panel's `Demo` lives in
its memory. Engine calls are synchronous. Positions are read in place
(`positionsView`), and a refused setting is caught on the spot
(`requireAccepted`).

The browser can't paint, run a slider's handler or deliver a pointer
event until the frame's physics returns. When physics falls behind,
`FixedStep` owes time and runs catch-up steps, up to its 0.25 s clamp per
frame (15 steps at 60 Hz). A slow page doesn't just run slowly: each frame
gets longer, and the page freezes.

## Option 1: a step budget (single thread) — built

**As built:** Rust's `FixedStep` takes a cap (`demo_set_step_cap`): at
most `n` steps per `demo_advance`, the whole steps owed past it dropped,
not carried. JavaScript decides `n` (`loop.ts` `StepBudget`):
`loadEngine` wraps `demo_advance` to time each call (physics only, not
drawing), keeps each demo's smoothed ms per step, and caps every demo at
the steps that fit **10 ms** for all of them together (at least 1, at
most `MAX_RATE_HZ`). Pages that keep up never reach the cap (every smoke
case still takes its 30 steps); the HUD says "slow motion" when one does.



Cap the physics at a wall-clock budget per frame, say 8 ms. Steps that
don't fit are dropped rather than owed, so simulated time runs slower
than real time instead of the display freezing.

- **Where:** `FixedStep` (Rust) or `runLoop` (TypeScript). One knob
  shared by every page, plus a HUD note ("running at 0.2× real time").
- **What it gives:** the display and controls stay responsive on any
  page. The simulation runs in slow motion. M2 at 4096 would run at
  roughly a fifth of real time (an estimate, from 8 ms of a ~55 ms step).
- **What it doesn't:** no parallelism. Three panels still share one core.
- **Cost:** small, one PR. It's needed inside workers too (below), so
  it's not throwaway work.

## Option 2: one Web Worker per panel

A Web Worker is a separate JavaScript thread with its own event loop. It
can instantiate wasm but can't touch the DOM. Each panel's simulation
moves into its own worker, and the main thread only handles input and
draws:

```
   main thread                          worker A (panel 1)
 ┌──────────────────────┐   commands  ┌────────────────────────┐
 │ sliders, pointer     │ ──────────► │ its own engine.wasm    │
 │ draws each frame     │             │ instance and memory    │
 │ from the latest      │ ◄────────── │ steps on a budget,     │
 │ snapshot; plots      │  snapshots  │ posts positions and    │
 └──────────────────────┘             │ readouts after each    │
                          ◄─────────► └────────────────────────┘
                          worker B (panel 2), worker C (panel 3)
```

- **Compile once, instantiate per worker.** The main thread compiles
  `engine.wasm` to a `WebAssembly.Module` and posts it to each worker.
  Modules are structured-cloneable, so it isn't downloaded or compiled
  three times.
- **Rust doesn't change.** Each worker calls the same C ABI (`demo_new`,
  `demo_advance`, …) on its own instance. Each simulation is still
  single-threaded, so determinism and the goldens mean exactly what they
  mean today.
- **Parallel across panels, not within one.** The panels are independent,
  so three panels can use three cores. The slowest panel (a direct-sum
  one at 4096) still takes longer than a frame, so M2 at 4096 would run
  smoothly at a fraction of real time, a few times faster than option 1
  alone (estimated, not measured).

### Moving the data: `postMessage`, not shared memory

| | `postMessage` (copy, or transfer an `ArrayBuffer`) | `SharedArrayBuffer` |
|---|---|---|
| How | The worker sends a snapshot after its steps | Both threads read one buffer |
| Cost at 4096 | 4096 × 2 × 4 B = 32 KB per panel per frame: negligible | none |
| Host | nothing | COOP/COEP headers (`hosting.md`, "Cross-origin isolation"), on `cargo xtask serve` and CloudFront |
| Code | messages | synchronization (atomics, a seqlock flag) |

`postMessage` is the clear choice. It's the same decision A1 made for
audio: buffers to and from the `AudioWorklet` are posted, not shared.

### What changes for pages

The cost is in TypeScript. Every engine call becomes a message:

- **Settings** become commands. A refused setting (status 0) can't throw
  on the spot. The worker reports it back, and `requireAccepted` becomes
  an error the page receives a frame later.
- **Readouts** (energy, momentum, rod error) come from the latest
  snapshot, at most a frame old. Plots don't care.
- **Dragging** gains a round trip, about one frame (16 ms at 60 Hz): the
  pointer goes to the worker, which grabs and drags, and the positions
  come back. Probably unnoticeable, but worth a hand check.
- **Restart and scene changes** tear down and recreate the demo in the
  worker. Snapshots still in flight from the old demo must be ignored
  (a generation counter in every message).
- **Smoke** waits for snapshots before judging pixels. The harness
  already waits for asynchronous reports (the A3 page's offline render).
- **Lifecycle** (#122's shared page code) terminates the workers on
  unload.

There's a precedent in the repo. `site/js/synth-live.ts` talks to the
audio worklet through a message port, with typed messages both ways. A
`remote-demo.ts` module would follow it: the operations the pages use
today as messages, and a snapshot type.

### Opt-in, not everywhere

Small pages (the pendulum, the cradle, billiards) step in well under a
millisecond and gain nothing from workers. Making the worker mode opt-in
keeps them synchronous and simple. M2 would pilot it, then the sand pages
(M9, M10), which are thousands of circles side by side, the same
multi-panel shape. The price is two ways to run a demo, behind one
interface.

## Option 3: wasm threads (parallelism inside one simulation)

Workers parallelize *across* panels. Making *one* simulation faster (say,
splitting an N-body force sum across four cores) needs threads that share
the simulation's memory. That's the WebAssembly threads proposal, which
browsers ship.

### What wasm threads are

WebAssembly has no "spawn a thread" instruction. Threads are three pieces,
two in wasm and one supplied by the host:

1. **Shared memory:** a `WebAssembly.Memory` created with `shared: true`,
   backed by a `SharedArrayBuffer`. Several instances can import the same
   memory.
2. **Atomic instructions:** atomic loads, stores and read-modify-writes,
   plus `memory.atomic.wait` / `notify` (like a futex), for
   synchronization in that shared memory.
3. **Web Workers as the threads:** the host spawns workers. Each
   instantiates the same module, importing the same shared memory, and
   calls an exported entry point with a pointer to its task. Every
   "thread" is a worker running the same wasm over one memory.

```
   worker 0 (runs the simulation)     workers 1..3 (the pool)
 ┌───────────────────────────┐      ┌───────────────────────────┐
 │ engine instance            │      │ engine instance           │
 │ splits the force sum,      │      │ waits (atomic.wait) for   │
 │ waits for the pool         │      │ work, computes its share  │
 └─────────────┬─────────────┘      └─────────────┬─────────────┘
               └──────────► one shared Memory ◄────┘
                         (SharedArrayBuffer)
```

### What it takes in Rust

- **A rebuilt `std`.** Rust's precompiled `std` for `wasm32-unknown-unknown`
  is built without atomics. Threads need `-C target-feature=+atomics,+bulk-memory`
  and `-Z build-std=panic_abort,std`, which is **nightly only**. This repo
  pins a stable toolchain, exactly, so results never change silently
  (`rust-toolchain.toml`, 1.99.1).
- **Linker flags** for shared, imported memory with a fixed maximum
  (`--shared-memory`, `--import-memory`, `--max-memory`). Shared memory
  must declare a maximum and can't shrink. The `__wasm_init_tls` and
  `__tls_*` symbols must be exported, so each worker can set up its own
  thread-local storage and stack.
- **No `std::thread::spawn` in the browser.** On `wasm32-unknown-unknown`,
  `std` has no way to create a thread: there's no OS to ask. Spawning
  returns an error. The JavaScript side creates the workers, and Rust code
  runs on them through an entry point.
- **A thread pool built on those workers.** The usual Rust tool for this
  kind of data parallelism is Rayon (`par_iter`). On the web it needs a
  pool whose threads are workers. `wasm-bindgen-rayon` provides that,
  through `wasm-bindgen`, which this repo doesn't use (`03-wasm-shell.md`,
  "Not now"). Without it, we'd write the worker bootstrap and a Rayon
  `ThreadPoolBuilder::spawn_handler` ourselves.
- **The main thread can't block.** Browsers forbid `Atomics.wait` on the
  main thread, and wasm's `memory.atomic.wait` with it, so a Rayon `join`
  there can't wait for its workers. The simulation must itself run in a
  worker (option 2), and the pool sits behind it. **Threads build on top
  of workers, not instead of them.**
- **Cross-origin isolation is required.** `SharedArrayBuffer` exists only
  on pages served with `Cross-Origin-Opener-Policy: same-origin` and
  `Cross-Origin-Embedder-Policy: require-corp` (`hosting.md`).
- **Testing:** the `wasm32-wasip1-threads` target supports `std::thread`
  (WASI's `thread-spawn`, which wasmtime implements), so the threaded code
  could be tested off the browser, as `cargo xtask test-wasm` does today.

### Determinism

The engine is deterministic by construction (`04-testing.md`, goldens on
native and wasm). Threads put that at risk in two places:

- **Floating-point sums depend on order.** A force sum split across
  threads and combined as they finish gives different rounding run to
  run. It stays deterministic if the split is fixed: each thread owns a
  fixed range of bodies, and each body's sum runs in its usual order. The
  direct N-body sum parallelizes this way cleanly. Barnes–Hut's tree walk
  per body does too; its tree build is harder.
- **Gauss–Seidel is sequential by definition.** Each constraint sees the
  previous one's correction (M4, M6). Parallel constraint solvers use
  graph coloring (constraints sharing no body solve together) or Jacobi
  iteration, and both change the results and the convergence. The
  goldens would change, and so would what the M4 and M6 pages teach.

### Can Tokio do this?

**No.** Tokio is the wrong tool for this job, and on the browser it
couldn't do it anyway.

- **The wrong kind of concurrency.** Tokio is an *async* runtime: it
  interleaves many tasks that spend their time *waiting* (sockets, timers,
  files), so one thread can serve thousands of them. A physics step never
  waits on anything. It's pure computation, and the question is how to
  split it across cores (data parallelism). That's Rayon's job, or plain
  threads with a fixed split. Async gives you concurrency, not
  parallelism. On a single thread, an async physics step is just a slower
  physics step.
- **And no threads on wasm anyway.** Tokio supports only a few features
  on wasm targets (`sync`, `macros`, `io-util`, `rt`, `time`). Its
  multi-threaded runtime needs `std::thread`, which the browser target
  doesn't have, and its docs list multi-threaded support only for
  Emscripten pthreads, which isn't how this repo builds.

The general answer to "can this be plain Rust, or must it be
wasm-specific?" is **both, in layers**:

| Layer | Portable Rust? |
|---|---|
| The parallel algorithm (`par_iter` over bodies, a fixed split) | **Yes.** The same code runs natively on OS threads, and the native tests and benches exercise it. |
| The thread pool's threads | **No.** On the web they're workers that JavaScript creates, wired to Rust through an entry point (or `wasm-bindgen-rayon`). |
| Shared memory, atomics, TLS setup | **No.** Build flags, a nightly `build-std`, linker arguments. |
| The host | **No.** COOP/COEP headers. |

### Verdict on threads

It's worth doing only if a *single* simulation must be faster in the
browser, and none needs it yet. The costs:
- a nightly toolchain;
- a second build configuration;
- the hosting headers;
- workers anyway;
- care with determinism;
- for constraints, results that change.

Keep it in the roadmap's "Deferred / stretch", which lists it already.

## Recommendation

1. **A step budget when convenient.** It's small, it ends the freeze on
   every page, and the worker design needs it too.
2. **Workers when a milestone needs them,** as an opt-in `remote-demo`
   module piloted on M2, then used by M9 and M10. Use `postMessage`, so
   there are no hosting headers. Rust is untouched.
3. **Wasm threads deferred,** unless one simulation outgrows a core. If
   that happens: Rayon on a worker pool, a fixed split of the work, a
   nightly `build-std`, COOP/COEP.

M7 (billiards) needs none of this. Sixteen balls step in microseconds.
