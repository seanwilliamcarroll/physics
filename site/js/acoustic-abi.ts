// Wire codes for acoustic.wasm. Mirrors crates/acoustic-web/src/abi.rs.

export const EXCITATION_NOISE = 0;
export const EXCITATION_TRIANGLE = 1;

export const MODEL_LOOP = 0;
export const MODEL_WAVEGUIDE = 1;
/** A3's piano; the first switch designs every key (a one-time pause). */
export const MODEL_PIANO = 2;

/** The synth's spectrum size (crates/acoustic-web SPECTRUM_SIZE): bins
 *  are `sampleRate / SPECTRUM_SIZE` Hz apart, `SPECTRUM_SIZE / 2` of them. */
export const SPECTRUM_SIZE = 4096;
