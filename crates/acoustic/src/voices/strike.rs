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
            self.designs = Some(Designs::new(self.fs));
        }
    }

    /// Whether the piano's strings are stiff, from the next strike (off:
    /// A2's ideal strings, harmonic partials).
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
        let Some(i) = self.slot(key) else {
            return false;
        };
        let design = if self.stiff {
            self.designs.as_ref().and_then(|d| d.get(key))
        } else {
            None
        };
        let voicing = piano::voicing(key, self.stiff);
        let ok = self
            .pool
            .get_mut(i)
            .is_some_and(|v| v.piano.restrike(key, voicing, design, velocity));
        if ok {
            self.started(i, key, piano::frequency(key), Model::Piano);
            self.trace.clear();
            self.traced = Some(i);
        }
        ok
    }

    /// The latest strike's hammer force on its middle string, N, a sample
    /// at a time from impact: up to [`TRACE_SECONDS`](super::TRACE_SECONDS) of it, as rendered so
    /// far. Empty before any strike.
    #[must_use]
    pub fn strike_trace(&self) -> &[f64] {
        &self.trace
    }

    /// Adds the piano voices to `out`: their bridge forces summed a block at
    /// a time, through the one body (see `render`).
    pub(super) fn render_piano(&mut self, out: &mut [S]) {
        // The piano: its voices' bridge forces summed a block at a time,
        // through the one body (linear, so one on the sum is one per voice).
        // It runs once the piano has played, so a released note's ring
        // fades through it too.
        if self.designs.is_none() {
            return;
        }
        {
            for chunk in out.chunks_mut(PIANO_BLOCK) {
                let Some(block) = self.piano_block.get_mut(..chunk.len()) else {
                    continue;
                };
                block.fill(S::ZERO);
                let (pool, trace, traced) = (&mut self.pool, &mut self.trace, self.traced);
                let playing = pool
                    .iter_mut()
                    .enumerate()
                    .filter(|(_, v)| v.key.is_some() && v.model == Model::Piano);
                for (i, v) in playing {
                    let tracing = traced == Some(i);
                    for x in block.iter_mut() {
                        *x += v.piano.next_sample();
                        // Within capacity: recording never allocates.
                        if tracing && trace.len() < trace.capacity() {
                            let force = v
                                .piano
                                .middle()
                                .and_then(Waveguide::hammer)
                                .map_or(0.0, crate::hammer::Hammer::force);
                            trace.push(force);
                        }
                    }
                }
                for (s, &x) in chunk.iter_mut().zip(block.iter()) {
                    *s += self.piano_scale * self.body.process(x);
                }
            }
        }
    }
}
