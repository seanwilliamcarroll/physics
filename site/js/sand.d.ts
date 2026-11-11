// Types for sand.wasm's exports (crates/sand-web/src/exports.rs).
// `cargo xtask site` checks SandExports against the .wasm's export table
// (names, parameter and result counts): one signature per line.

/** A `*mut SandDemo`: 0 is null. */
export type SandHandle = number & { readonly __sand: unique symbol };

/** 1 = applied, 0 = refused. */
export type Status = 0 | 1;

export interface SandExports {
  memory: WebAssembly.Memory;
  /** An empty grid, width × height (each ≤ sand-abi.ts MAX_SIDE); 0 if refused. */
  sand_new(width: number, height: number, seed: number): SandHandle;
  sand_free(d: SandHandle): void;
  /** Adds real elapsed seconds; returns the fixed steps taken. */
  sand_advance(d: SandHandle, elapsedSeconds: number): number;
  /** Steps per simulated second; 0 or above MAX_RATE_HZ refused. */
  sand_set_rate(d: SandHandle, hz: number): Status;
  /** At most n steps per sand_advance (0: no cap): the step budget. */
  sand_set_step_cap(d: SandHandle, n: number): Status;
  /** Chunked updates on (1) or off (0). */
  sand_set_chunked(d: SandHandle, on: number): Status;
  /** A disc of radius cells at (x, y) of material code (empty erases); returns cells painted. */
  sand_paint(d: SandHandle, x: number, y: number, radius: number, code: number): number;
  /** Renders and returns a pointer to width × height RGBA u32s (ImageData order). */
  sand_render(d: SandHandle): number;
  sand_width(d: SandHandle): number;
  sand_height(d: SandHandle): number;
  /** Cells holding material code. */
  sand_count(d: SandHandle, code: number): number;
  /** Moves made by the last step (0: settled). */
  sand_last_moves(d: SandHandle): number;
  /** Chunks the next step updates, and all of them. */
  sand_awake_chunks(d: SandHandle): number;
  sand_chunks(d: SandHandle): number;
}

/** What sand.wasm imports from JS (module "env"). */
export type SandImports = {
  env: {
    /** The panic hook: `len` UTF-8 bytes at `ptr`. */
    console_error(ptr: number, len: number): void;
  };
};
