// Types for swarm.wasm's exports (crates/swarm-web/src/exports.rs).
// `cargo xtask site` checks SwarmExports against the .wasm's export table
// (names, parameter and result counts): one signature per line.

/** A `*mut SwarmDemo`: 0 is null. */
export type SwarmHandle = number & { readonly __swarm: unique symbol };

/** 1 = applied, 0 = refused. */
export type Status = 0 | 1;

export interface SwarmExports {
  memory: WebAssembly.Memory;
  /** n boids in a width × height world (px), drawn at 1 px per scale; 0 if refused. */
  swarm_new(n: number, width: number, height: number, scale: number, seed: number): SwarmHandle;
  swarm_free(d: SwarmHandle): void;
  /** Adds real elapsed seconds; returns the fixed steps taken. */
  swarm_advance(d: SwarmHandle, elapsedSeconds: number): number;
  /** Steps per simulated second; 0 or above MAX_RATE_HZ refused. */
  swarm_set_rate(d: SwarmHandle, hz: number): Status;
  /** At most n steps per swarm_advance (0: no cap): the step budget. */
  swarm_set_step_cap(d: SwarmHandle, n: number): Status;
  /** NEIGHBOURS_* code; brute force refused past MAX_BRUTE boids. */
  swarm_set_neighbours(d: SwarmHandle, code: number): Status;
  /** PARAM_* code and value; refused if the rules would be unusable. */
  swarm_set_param(d: SwarmHandle, code: number, value: number): Status;
  /** A PARAM_* value, or NaN for an unknown code. */
  swarm_param(d: SwarmHandle, code: number): number;
  /** The predator at world (x, y) if on (1), else none. */
  swarm_set_predator(d: SwarmHandle, x: number, y: number, on: number): Status;
  /** Draws and returns a pointer to view width × height RGBA u32s (ImageData order). */
  swarm_render(d: SwarmHandle): number;
  swarm_view_width(d: SwarmHandle): number;
  swarm_view_height(d: SwarmHandle): number;
  swarm_len(d: SwarmHandle): number;
  /** |Σ unit velocities| / n: 0 disordered, 1 all one way. */
  swarm_polarization(d: SwarmHandle): number;

  // S2: the Vicsek model.
  /** n particles in an L × L box (radii) at noise η, drawn view px a side; 0 if refused. */
  vicsek_new(n: number, side: number, noise: number, view: number, seed: number): VicsekHandle;
  vicsek_free(d: VicsekHandle): void;
  /** Adds real elapsed seconds; returns the fixed steps taken. */
  vicsek_advance(d: VicsekHandle, elapsedSeconds: number): number;
  vicsek_set_rate(d: VicsekHandle, hz: number): Status;
  vicsek_set_step_cap(d: VicsekHandle, n: number): Status;
  /** η in [0, 2π]. */
  vicsek_set_noise(d: VicsekHandle, eta: number): Status;
  vicsek_set_speed(d: VicsekHandle, v: number): Status;
  /** transient steps, then v_a's mean over window steps (≤ MAX_RUN in all); NaN if refused. */
  vicsek_mean_order(d: VicsekHandle, transient: number, window: number): number;
  vicsek_order(d: VicsekHandle): number;
  /** Exact zero heading sums so far (0/0, kept). */
  vicsek_annihilations(d: VicsekHandle): number;
  /** Draws and returns a pointer to view × view RGBA u32s. */
  vicsek_render(d: VicsekHandle): number;
  vicsek_view(d: VicsekHandle): number;
  vicsek_len(d: VicsekHandle): number;
}

/** A `*mut VicsekDemo`: 0 is null. */
export type VicsekHandle = number & { readonly __vicsek: unique symbol };

/** What swarm.wasm imports from JS (module "env"). */
export type SwarmImports = {
  env: {
    /** The panic hook: `len` UTF-8 bytes at `ptr`. */
    console_error(ptr: number, len: number): void;
  };
};
