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

  /** Codes: abi.js DEMO_*, SCALAR_*. `n` (≤ abi.ts MAX_PARTICLES, MAX_GRAVITY_BODIES for gravity) and `seed` apply to the fountain and the M2 scenes. */
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
  /** Physics steps per second; 0 or above abi.ts MAX_RATE_HZ is rejected. */
  demo_set_rate(demo: DemoHandle, hz: number): Status;
  /** Softening length ε, m (gravity scenes); negative, NaN, or the
   *  fountain is rejected (0). ε = 0 is allowed. */
  demo_set_softening(demo: DemoHandle, eps: number): Status;
  /** Barnes–Hut opening angle θ (gravity scenes); negative, NaN, or the
   *  fountain is rejected (0). θ = 0 is exact. */
  demo_set_theta(demo: DemoHandle, theta: number): Status;
  /** Code: abi.ts SOLVER_*; steps worlds with constraints. */
  demo_set_solver(demo: DemoHandle, code: number): Status;
  /** Impulse solver's Baumgarte β in [0, 1]; else rejected (0). */
  demo_set_beta(demo: DemoHandle, beta: number): Status;
  /** Substeps per physics step; 0 or above abi.ts MAX_SUBSTEPS is rejected. */
  demo_set_substeps(demo: DemoHandle, n: number): Status;
  /** Constraint iterations per substep; 0 or above abi.ts MAX_ITERATIONS is rejected. */
  demo_set_iterations(demo: DemoHandle, n: number): Status;
  /** Largest constraint error |C| in meters, or NaN without constraints. */
  demo_constraint_error(demo: DemoHandle): number;
  /** The M4 chain: `links` (≤ abi.ts MAX_CHAIN_LINKS) links, bob `massRatio` × a link; null if invalid. */
  demo_new_chain(scalar: number, links: number, massRatio: number): DemoHandle;
  /** The M4 double pendulum (abi.ts START_*), tip nudged by `offset` m. */
  demo_new_double_pendulum(scalar: number, start: number, offset: number): DemoHandle;
  /** [a0, b0, a1, b1, ...] u32 particle indices joined by constraints. */
  demo_links_ptr(demo: DemoHandle): Ptr;
  /** Number of u32s at demo_links_ptr (two per constraint). */
  demo_links_len(demo: DemoHandle): number;
  /** Grabs the nearest dynamic particle within `radius` m; its index or -1. */
  /** 1 if the demo can be grabbed: a world a solver steps (constraints, or
   *  collisions). A world its integrator steps refuses. */
  demo_grabbable(demo: DemoHandle): number;
  demo_grab(demo: DemoHandle, x: number, y: number, radius: number): number;
  /** Moves the held grab's anchor; 0 if nothing is held. */
  demo_drag(demo: DemoHandle, x: number, y: number): Status;
  /** Releases the held grab; 0 if nothing was held. */
  demo_release(demo: DemoHandle): Status;
  /** Particle i's exact x / y in meters (the engine's scalar as f64); NaN past the end. */
  demo_particle_x(demo: DemoHandle, i: number): number;
  demo_particle_y(demo: DemoHandle, i: number): number;
  /** Code: abi.ts STABILIZATION_*; the impulse solver's position correction. */
  demo_set_stabilization(demo: DemoHandle, code: number): Status;
  /** The M5 jelly (abi.ts JELLY_*): cols × rows (each ≤ abi.ts MAX_JELLY_SIDE), stiffness k N/m, damping c; null if invalid. */
  demo_new_jelly(scalar: number, body: number, cols: number, rows: number, k: number, c: number): DemoHandle;
  /** A jelly's stiffness, live; 0 for a value its body can't take (springs can't be rigid). */
  demo_set_stiffness(demo: DemoHandle, k: number): Status;
  /** A jelly's damping, live; 0 for negative/NaN/infinite. */
  demo_set_damping(demo: DemoHandle, c: number): Status;
  /** Kinetic energy in joules (NaN for null): the explosion indicator. */
  demo_kinetic_energy(demo: DemoHandle): number;
  /** Code: abi.ts ORDER_*; order of each solver pass over constraints. */
  demo_set_order(demo: DemoHandle, code: number): Status;
  /** Total energy in joules, or NaN where undefined (the fountain). */
  demo_energy(demo: DemoHandle): number;
  /** The M6 box: `n` (≤ abi.ts MAX_BOX_BALLS) balls, velocities from `seed`; null if invalid. */
  demo_new_ball_box(scalar: number, n: number, seed: number): DemoHandle;
  /** The M6 break: rack `gap` m apart (0 … abi.ts MAX_BREAK_GAP); null if invalid. */
  demo_new_break_shot(scalar: number, gap: number): DemoHandle;
  /** The M6 cradle: `balls` (≤ abi.ts MAX_CRADLE_BALLS) on rods, the first `pulled` swung out. */
  demo_new_cradle(scalar: number, balls: number, pulled: number): DemoHandle;
  /** Restitution e in [0, 1] for every collision; 0 if outside or nothing collides. */
  demo_set_restitution(demo: DemoHandle, e: number): Status;
  /** Particle i's radius in meters (0 for a pin); NaN past the end. */
  demo_particle_radius(demo: DemoHandle, i: number): number;
  /** Total momentum's x / y, kg·m/s. */
  demo_momentum_x(demo: DemoHandle): number;
  demo_momentum_y(demo: DemoHandle): number;
  /** Recomputes the broadphase's candidate pairs; returns its cell size in
   *  meters, or NaN (no collisions). Re-read demo_pairs_ptr after. */
  demo_update_pairs(demo: DemoHandle): number;
  /** [a0, b0, a1, b1, ...] u32 candidate pairs from demo_update_pairs. */
  demo_pairs_ptr(demo: DemoHandle): Ptr;
  /** Number of u32s at demo_pairs_ptr (two per pair). */
  demo_pairs_len(demo: DemoHandle): number;
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
