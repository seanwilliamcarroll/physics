// Types for acoustic.wasm's exports (crates/acoustic-web/src/exports.rs).

/** A `*mut Synth`: 0 is null. Branded so it can't be mixed up with a count. */
export type SynthHandle = number & { readonly __synth: unique symbol };

/** 1 = applied, 0 = refused. */
export type Status = 0 | 1;

export interface AcousticExports {
  memory: WebAssembly.Memory;
  synth_new(sampleRate: number, seed: number): SynthHandle;
  synth_free(s: SynthHandle): void;
  /** Pointer to `frames` f32 samples; 0 for null or over 4096 frames. */
  synth_render(s: SynthHandle, frames: number): number;
  synth_note_on(s: SynthHandle, key: number): Status;
  /** Strikes piano key `key` at `velocity` m/s (pp 0.5 to ff 5). */
  synth_note_on_velocity(s: SynthHandle, key: number, velocity: number): Status;
  /** 1: the piano's strings stiff; 0: ideal. From the next strike. */
  synth_set_stiffness(s: SynthHandle, stiff: number): Status;
  synth_note_off(s: SynthHandle, key: number): void;
  synth_set_tuned(s: SynthHandle, tuned: number): Status;
  synth_set_t60(s: SynthHandle, t60: number): Status;
  synth_set_excitation(s: SynthHandle, code: number, peak: number): Status;
  synth_set_gain(s: SynthHandle, gain: number): Status;
  /** Fills the snapshot; returns its length (0 before any note). */
  synth_snapshot(s: SynthHandle): number;
  synth_snapshot_ptr(s: SynthHandle): number;
  synth_clipped(s: SynthHandle): number;
  /** The latest note's loop vs its pitch, cents (0 tuned). */
  synth_latest_cents(s: SynthHandle): number;
  /** Code: acoustic-abi.ts MODEL_*; for the next notes. */
  synth_set_model(s: SynthHandle, code: number): Status;
  /** Every waveguide's pickup, 0..1 from the bridge, live. */
  synth_set_pickup(s: SynthHandle, at: number): Status;
  /** Computes the last 4096 samples' spectrum; returns its bins (dB). */
  synth_spectrum(s: SynthHandle): number;
  synth_spectrum_ptr(s: SynthHandle): number;
}
