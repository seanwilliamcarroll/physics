// Types for engine.wasm's exports and imports: the contract implemented in
// crates/web/src/exports.rs and imports.rs. Integer codes live in abi.js
// (mirrored from abi.rs and checked by a Rust test).
//
// Types only: browsers never load this file. It lets `tsc --checkJs` catch
// wrong argument order, a handle passed where a count belongs, and similar
// mistakes at the boundary, where every value is a bare number.

declare const brand: unique symbol;

/** A number with a compile-time-only tag, so different kinds of integer
 *  can't be mixed up. At runtime it is just a number. */
type Branded<T, Name extends string> = T & { readonly [brand]: Name };

/** Opaque handle to a Rust `Demo` (a pointer into wasm memory). `0` is
 *  null: demo_new returns it for an unknown code. */
export type DemoHandle = Branded<number, "DemoHandle">;

/** Byte offset into `memory.buffer`. */
export type Ptr = Branded<number, "Ptr">;

/** 1 = success, 0 = rejected (unknown code, zero rate, or null handle). */
export type Status = 0 | 1;

export interface EngineExports {
  readonly memory: WebAssembly.Memory;

  /** Codes: abi.js DEMO_*, SCALAR_*. `n` and `seed` apply to the fountain. */
  demo_new(kind: number, scalar: number, n: number, seed: number): DemoHandle;
  demo_free(demo: DemoHandle): void;
  /** Adds real elapsed seconds; returns fixed physics steps taken. */
  demo_advance(demo: DemoHandle, elapsedSeconds: number): number;
  /** Interleaved f32 [x0, y0, x1, y1, ...]; re-read every frame. */
  demo_positions_ptr(demo: DemoHandle): Ptr;
  /** Number of f32s at demo_positions_ptr. */
  demo_positions_len(demo: DemoHandle): number;
  /** Code: abi.js INTEGRATOR_*. */
  demo_set_integrator(demo: DemoHandle, code: number): Status;
  /** Physics steps per second; 0 is rejected. */
  demo_set_rate(demo: DemoHandle, hz: number): Status;
  /** Softening length ε, m (gravity scenes); negative, NaN, or the
   *  fountain is rejected (0). ε = 0 is allowed. */
  demo_set_softening(demo: DemoHandle, eps: number): Status;
  /** Barnes–Hut opening angle θ (gravity scenes); negative, NaN, or the
   *  fountain is rejected (0). θ = 0 is exact. */
  demo_set_theta(demo: DemoHandle, theta: number): Status;
  /** Total energy in joules, or NaN where undefined (the fountain). */
  demo_energy(demo: DemoHandle): number;
  /** Test hook: panics on purpose (smoke test only). */
  demo_panic_for_test(): void;
}

/** What engine.wasm imports from JS (module "env"). A `type`, not an
 *  `interface`: interfaces stay open to extension, so TS won't treat one as
 *  assignable to `WebAssembly.Imports` (a string-keyed record). */
export type EngineImports = {
  env: {
    /** Called by the Rust panic hook: `len` UTF-8 bytes at `ptr`. */
    console_error(ptr: Ptr, len: number): void;
  };
};
