//! The plain pair loop: one pair at a time, body i's sum in order. What
//! `PairwiseGravity` was before the vector loops (#273); kept for few
//! bodies, where the vector loops' setup outweighs them (`PLAIN_BELOW`).

use super::PairwiseGravity;
use crate::{Particles, Scalar, Vec2};

pub(super) fn accumulate<S: Scalar>(g: &PairwiseGravity<S>, p: &Particles<S>, acc: &mut [Vec2<S>]) {
    // Masses once per call: n divisions here instead of n² in the pair
    // loop. Static particles get mass 0, so they exert no pull.
    let bodies: Vec<(Vec2<S>, S, S)> = p
        .pos()
        .iter()
        .zip(p.inv_mass())
        .map(|(&x, &w)| (x, if w == S::ZERO { S::ZERO } else { S::ONE / w }, w))
        .collect();

    // Each pair once (i < j), without indexing: take the first body, pair
    // it with every later one, continue with the rest. `mem::take` moves
    // the slice out so its tail can replace it.
    let mut acc_rest = acc;
    let mut body_rest = bodies.as_slice();
    while let (Some((a_i, acc_tail)), Some((&(x_i, m_i, w_i), body_tail))) = (
        core::mem::take(&mut acc_rest).split_first_mut(),
        body_rest.split_first(),
    ) {
        // Body i's sum in a local, not through `a_i` in memory: the same
        // additions in the same order.
        let mut sum_i = *a_i;
        for (a_j, &(x_j, m_j, w_j)) in acc_tail.iter_mut().zip(body_tail) {
            let r = x_j - x_i;
            let d_sq = r.length_sq() + g.softening_sq;
            if d_sq == S::ZERO {
                // Coincident and unsoftened: no direction; skip, not 0/0.
                continue;
            }
            // One force vector per pair, applied +/-: equal and opposite by
            // construction. Accelerations are F * w, so a static body
            // (w = 0) isn't moved.
            let f = r * (g.g_const * m_i * m_j / (d_sq * d_sq.sqrt()));
            sum_i += f * w_i;
            *a_j -= f * w_j;
        }
        *a_i = sum_i;
        acc_rest = acc_tail;
        body_rest = body_tail;
    }
}
