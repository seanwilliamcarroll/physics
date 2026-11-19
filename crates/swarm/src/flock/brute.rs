//! [`Neighbours::Brute`](super::Neighbours::Brute): every boid against
//! every other.

use super::Flock;
use crate::rules::{BRUTE_LANES, Ranges, Seen, finish};

impl Flock {
    /// The whole arrays are one run for the lane loop; the boid itself, at
    /// distance 0, adds nothing. (A scalar loop is 20× slower in wasm
    /// with `simd128`.)
    pub(super) fn step_brute(&mut self) {
        let (now, params, arena, predator) = (&self.now, &self.params, self.arena, self.predator);
        let ranges = Ranges::of(params);
        for index in 0..now.len() {
            let Some(me) = now.get(index) else { continue };
            let mut seen = Seen::default();
            seen.add_span::<BRUTE_LANES>(ranges, me, &now.x, &now.y, &now.vx, &now.vy);
            self.next
                .set(index, finish(params, arena, predator, me, &seen));
        }
    }
}
