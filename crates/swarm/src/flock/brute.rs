//! [`Neighbours::Brute`](super::Neighbours::Brute): every boid against
//! every other.

use super::Flock;
use crate::rules::{BRUTE_LANES, Ranges, Seen, finish};

impl Flock {
    /// Every boid's next state into `next`, every other boid a candidate:
    /// n² checks a step. The whole arrays are one run, read by the lane
    /// loop (`Seen::add_span`); the boid itself, at distance 0, adds
    /// nothing. The reference for which boids are neighbours. (The scalar
    /// loop this replaced ran 20× slower in wasm with `simd128`:
    /// `docs/15-swarm.md`, S1.5.)
    pub(super) fn step_brute(&mut self) {
        let (cur, p, arena, predator) = (&self.cur, &self.params, self.arena, self.predator);
        let ranges = Ranges::of(p);
        for i in 0..cur.len() {
            let Some(me) = cur.get(i) else { continue };
            let mut seen = Seen::default();
            seen.add_span::<BRUTE_LANES>(ranges, me, &cur.x, &cur.y, &cur.vx, &cur.vy);
            self.next.set(i, finish(p, arena, predator, me, &seen));
        }
    }
}
