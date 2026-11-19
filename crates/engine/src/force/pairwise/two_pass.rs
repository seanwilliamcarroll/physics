//! The two-pass loop (`PairLoop::TwoPass`): for each body i, pass 1
//! computes every later pair's force (summing nothing, so it vectorizes at
//! the target's full width); pass 2 sums the kept forces into `L` lanes.

use super::{Bodies, PairwiseGravity, lane_total};
use crate::{Scalar, Vec2};

pub(super) fn accumulate<S: Scalar, const L: usize>(
    gravity: &PairwiseGravity<S>,
    bodies: &Bodies<S>,
    accelerations: &mut [Vec2<S>],
) {
    let body_count = bodies.x.len();
    // Each pair's force on body i, x and y, for pass 2.
    let (mut force_x, mut force_y) = (vec![S::ZERO; body_count], vec![S::ZERO; body_count]);

    let mut acceleration_rest = accelerations;
    let (mut x_rest, mut y_rest, mut mass_rest, mut inv_mass_rest) = (
        bodies.x.as_slice(),
        bodies.y.as_slice(),
        bodies.mass.as_slice(),
        bodies.inverse_mass.as_slice(),
    );
    while let (
        Some((acceleration_i, acceleration_tail)),
        Some((&x_i, x_tail)),
        Some((&y_i, y_tail)),
        Some((&mass_i, mass_tail)),
        Some((&inv_mass_i, inv_mass_tail)),
    ) = (
        core::mem::take(&mut acceleration_rest).split_first_mut(),
        x_rest.split_first(),
        y_rest.split_first(),
        mass_rest.split_first(),
        inv_mass_rest.split_first(),
    ) {
        pass_one(
            (
                x_i,
                y_i,
                gravity.gravitational_constant * mass_i,
                gravity.softening_sq,
            ),
            (x_tail, y_tail, mass_tail, inv_mass_tail),
            acceleration_tail,
            (&mut force_x, &mut force_y),
        );
        let later_count = acceleration_tail.len();
        let (sum_x, sum_y) = (
            lane_sum::<S, L>(force_x.get(..later_count).unwrap_or_default()),
            lane_sum::<S, L>(force_y.get(..later_count).unwrap_or_default()),
        );
        *acceleration_i += Vec2::new(sum_x, sum_y) * inv_mass_i;
        acceleration_rest = acceleration_tail;
        (x_rest, y_rest, mass_rest, inv_mass_rest) = (x_tail, y_tail, mass_tail, inv_mass_tail);
    }
}

/// Body i against every later body j: body j's share goes into
/// `accelerations`, the force is kept in `force_x`/`force_y`. A function of
/// its own so `&mut` parameters tell the compiler the slices don't overlap
/// (with local slices it took a scalar path, 2× slower).
#[inline(never)]
fn pass_one<S: Scalar>(
    (x_i, y_i, gravity_times_mass_i, softening_sq): (S, S, S, S),
    (xs, ys, masses, inv_masses): (&[S], &[S], &[S], &[S]),
    accelerations: &mut [Vec2<S>],
    (force_x, force_y): (&mut [S], &mut [S]),
) {
    let others = xs.iter().zip(ys).zip(masses).zip(inv_masses);
    let kept = force_x.iter_mut().zip(force_y.iter_mut());
    for ((acceleration_j, (((&x_j, &y_j), &mass_j), &inv_mass_j)), (kept_x, kept_y)) in
        accelerations.iter_mut().zip(others).zip(kept)
    {
        let (offset_x, offset_y) = (x_j - x_i, y_j - y_i);
        let distance_sq = offset_x * offset_x + offset_y * offset_y + softening_sq;
        let scale = gravity_times_mass_i * mass_j / (distance_sq * distance_sq.sqrt());
        // Coincident and unsoftened: 0/0, selected away (no branch).
        let scale = if distance_sq == S::ZERO {
            S::ZERO
        } else {
            scale
        };
        let (pair_x, pair_y) = (offset_x * scale, offset_y * scale);
        acceleration_j.x -= pair_x * inv_mass_j;
        acceleration_j.y -= pair_y * inv_mass_j;
        (*kept_x, *kept_y) = (pair_x, pair_y);
    }
}

/// `values` summed in `L` partial sums (value k in lane k mod L),
/// then the lanes as a tree ([`lane_total`]).
fn lane_sum<S: Scalar, const L: usize>(values: &[S]) -> S {
    let mut lanes = [S::ZERO; L];
    let (chunks, rest) = values.as_chunks::<L>();
    for chunk in chunks {
        for (lane, &value) in lanes.iter_mut().zip(chunk) {
            *lane += value;
        }
    }
    for (lane, &value) in lanes.iter_mut().zip(rest) {
        *lane += value;
    }
    lane_total(&lanes)
}
