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

  // S3: ant foraging.
  /** A width × height world (cells) with n ants, drawn scale px a cell; 0 if refused. */
  ant_new(width: number, height: number, n: number, scale: number, seed: number): AntHandle;
  ant_free(d: AntHandle): void;
  /** Adds real elapsed seconds; returns the fixed steps taken. */
  ant_advance(d: AntHandle, elapsedSeconds: number): number;
  ant_set_rate(d: AntHandle, hz: number): Status;
  ant_set_step_cap(d: AntHandle, n: number): Status;
  /** 1: ants follow trails; 0: a random walk. */
  ant_set_sensing(d: AntHandle, on: number): Status;
  /** TOOL_* at cell (x, y), radius in cells, food per cell; what changed, or -1 if refused. */
  ant_paint(d: AntHandle, tool: number, x: number, y: number, radius: number, amount: number): number;
  /** ANT_* code and value; refused if unusable. */
  ant_set_param(d: AntHandle, code: number, value: number): Status;
  /** An ANT_* value, or NaN. */
  ant_param(d: AntHandle, code: number): number;
  /** Draws and returns a pointer to the view's RGBA u32s. */
  ant_render(d: AntHandle): number;
  ant_view_width(d: AntHandle): number;
  ant_view_height(d: AntHandle): number;
  ant_len(d: AntHandle): number;
  ant_delivered(d: AntHandle): number;
  ant_carrying(d: AntHandle): number;
  ant_food(d: AntHandle): number;

  // S4: Physarum.
  /** n agents on a side × side periodic field (cells), drawn scale px a cell (1–4); 0 if refused. */
  slime_new(side: number, n: number, scale: number, seed: number): SlimeHandle;
  slime_free(d: SlimeHandle): void;
  /** Adds real elapsed seconds; returns the fixed steps taken. */
  slime_advance(d: SlimeHandle, elapsedSeconds: number): number;
  slime_set_rate(d: SlimeHandle, hz: number): Status;
  slime_set_step_cap(d: SlimeHandle, n: number): Status;
  /** 1: agents sense; 0: a random walk. */
  slime_set_sensing(d: SlimeHandle, on: number): Status;
  /** A node at cell (x, y) depositing amount a step; refused past MAX_NODES. */
  slime_add_node(d: SlimeHandle, x: number, y: number, amount: number): Status;
  slime_clear_nodes(d: SlimeHandle): void;
  /** SLIME_* code and value; refused if unusable. */
  slime_set_param(d: SlimeHandle, code: number, value: number): Status;
  /** A SLIME_* value, or NaN. */
  slime_param(d: SlimeHandle, code: number): number;
  /** Draws the field; a pointer to view × view RGBA u32s. */
  slime_render(d: SlimeHandle): number;
  slime_view(d: SlimeHandle): number;
  slime_len(d: SlimeHandle): number;
  /** The top 10% of cells' share of the field (linear time: not every frame). */
  slime_concentration(d: SlimeHandle): number;
}

/** A `*mut SlimeDemo`: 0 is null. */
export type SlimeHandle = number & { readonly __slime: unique symbol };

/** A `*mut AntDemo`: 0 is null. */
export type AntHandle = number & { readonly __ant: unique symbol };

/** A `*mut VicsekDemo`: 0 is null. */
export type VicsekHandle = number & { readonly __vicsek: unique symbol };

/** What swarm.wasm imports from JS (module "env"). */
export type SwarmImports = {
  env: {
    /** The panic hook: `len` UTF-8 bytes at `ptr`. */
    console_error(ptr: number, len: number): void;
  };
};
