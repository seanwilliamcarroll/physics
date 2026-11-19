//! The plain pair loop: one pair at a time, body i's sum in order. Used for
//! few bodies, where the vector loops' setup outweighs them (`PLAIN_BELOW`).

use super::PairwiseGravity;
use crate::{Particles, Scalar, Vec2};

pub(super) fn accumulate<S: Scalar>(
    gravity: &PairwiseGravity<S>,
    particles: &Particles<S>,
    accelerations: &mut [Vec2<S>],
) {
    // Masses once per call: n divisions here instead of n² in the pair
    // loop. Static particles get mass 0, so they exert no pull.
    let bodies: Vec<(Vec2<S>, S, S)> = particles
        .pos()
        .iter()
        .zip(particles.inv_mass())
        .map(|(&position, &inv_mass)| {
            (
                position,
                if inv_mass == S::ZERO {
                    S::ZERO
                } else {
                    S::ONE / inv_mass
                },
                inv_mass,
            )
        })
        .collect();

    // Each pair once (i < j), without indexing: split off the first body,
    // pair it with the rest. `mem::take` moves the slice out to replace it.
    let mut acceleration_rest = accelerations;
    let mut body_rest = bodies.as_slice();
    while let (
        Some((acceleration_i, acceleration_tail)),
        Some((&(position_i, mass_i, inv_mass_i), body_tail)),
    ) = (
        core::mem::take(&mut acceleration_rest).split_first_mut(),
        body_rest.split_first(),
    ) {
        // Body i's sum in a local, not through `acceleration_i` in memory:
        // the same additions in the same order.
        let mut sum_i = *acceleration_i;
        for (acceleration_j, &(position_j, mass_j, inv_mass_j)) in
            acceleration_tail.iter_mut().zip(body_tail)
        {
            let offset = position_j - position_i;
            let distance_sq = offset.length_sq() + gravity.softening_sq;
            if distance_sq == S::ZERO {
                // Coincident and unsoftened: no direction; skip, not 0/0.
                continue;
            }
            // One force per pair, applied +/-; times inv_mass, so statics stay put.
            let force = offset
                * (gravity.gravitational_constant * mass_i * mass_j
                    / (distance_sq * distance_sq.sqrt()));
            sum_i += force * inv_mass_i;
            *acceleration_j -= force * inv_mass_j;
        }
        *acceleration_i = sum_i;
        acceleration_rest = acceleration_tail;
        body_rest = body_tail;
    }
}
