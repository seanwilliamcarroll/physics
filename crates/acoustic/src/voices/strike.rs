//! The piano in the voices (`docs/14-piano.md`, "The piano in the
//! synth"): the design table, strikes with velocity, the stiffness toggle,
//! the strike trace, and the body on the summed bridge force.

use super::{Model, PIANO_BLOCK, Voices};
use crate::Scalar;
use crate::Waveguide;
use crate::piano::{self, Designs};

impl<S: Scalar> Voices<S> {
    /// Designs the piano's keys, if not yet.
    pub(super) fn prepare_piano(&mut self) {
        if self.designs.is_none() {
            self.designs = Some(Designs::new(self.sample_rate));
        }
    }

    /// Whether the piano's strings are stiff, from the next strike (off:
    /// the ideal strings, harmonic partials).
    pub const fn set_stiffness(&mut self, stiff: bool) {
        self.stiff = stiff;
    }

    /// Strikes piano key `key` at `velocity` m/s (the hammer's speed:
    /// [`hammer::PIANISSIMO`](crate::hammer::PIANISSIMO) to
    /// [`FORTISSIMO`](crate::hammer::FORTISSIMO)), whatever the model new
    /// notes play. Designs the keys first if the piano wasn't chosen yet
    /// (the one-time pause). `false`, playing nothing, off the keyboard or
    /// for a velocity the hammer can't take.
    pub fn strike(&mut self, key: u8, velocity: f64) -> bool {
        self.prepare_piano();
        let Some(slot) = self.slot(key) else {
            return false;
        };
        let design = if self.stiff {
            self.designs.as_ref().and_then(|designs| designs.get(key))
        } else {
            None
        };
        let voicing = piano::voicing(key, self.stiff);
        let struck = self
            .pool
            .get_mut(slot)
            .is_some_and(|voice| voice.piano.restrike(key, voicing, design, velocity));
        if struck {
            self.started(slot, key, piano::frequency(key), Model::Piano);
            self.trace.clear();
            self.traced = Some(slot);
        }
        struck
    }

    /// The latest strike's hammer force on its middle string, N, a sample
    /// at a time from impact: up to [`TRACE_SECONDS`](super::TRACE_SECONDS)
    /// of it, as rendered so far. Empty before any strike.
    #[must_use]
    pub fn strike_trace(&self) -> &[f64] {
        &self.trace
    }

    /// Adds the piano voices to `out`: their bridge forces summed a block at
    /// a time, through the one body (linear, so one on the sum is one per
    /// voice). It runs once the piano has played, so a released note's ring
    /// fades through it too.
    pub(super) fn render_piano(&mut self, out: &mut [S]) {
        if self.designs.is_none() {
            return;
        }
        for chunk in out.chunks_mut(PIANO_BLOCK) {
            let Some(block) = self.piano_block.get_mut(..chunk.len()) else {
                continue;
            };
            block.fill(S::ZERO);
            let (pool, trace, traced) = (&mut self.pool, &mut self.trace, self.traced);
            let playing = pool
                .iter_mut()
                .enumerate()
                .filter(|(_, voice)| voice.key.is_some() && voice.model == Model::Piano);
            for (slot, voice) in playing {
                let tracing = traced == Some(slot);
                for force in block.iter_mut() {
                    *force += voice.piano.next_sample();
                    // Within capacity: recording never allocates.
                    if tracing && trace.len() < trace.capacity() {
                        let hammer_force = voice
                            .piano
                            .middle()
                            .and_then(Waveguide::hammer)
                            .map_or(0.0, crate::hammer::Hammer::force);
                        trace.push(hammer_force);
                    }
                }
            }
            for (sample, &force) in chunk.iter_mut().zip(block.iter()) {
                *sample += self.piano_scale * self.body.process(force);
            }
        }
    }
}
