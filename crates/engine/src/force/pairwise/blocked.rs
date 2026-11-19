//! The blocked loop (`PairLoop::Blocked`): one pass per body i, in blocks
//! of `L` pairs; each step is one operation on `[S; L]`, which the compiler
//! packs into vectors. The same arithmetic as the two-pass loop.

use super::{Bodies, PairwiseGravity, lane_total};
use crate::{Scalar, Vec2};

pub(super) fn accumulate<S: Scalar, const L: usize>(
    gravity: &PairwiseGravity<S>,
    bodies: &Bodies<S>,
    accelerations: &mut [Vec2<S>],
) {
    // The accelerations as separate arrays too, copied in and out: body j's
    // additions keep their order, so its bits don't change.
    let mut acceleration_x: Vec<S> = accelerations.iter().map(|a| a.x).collect();
    let mut acceleration_y: Vec<S> = accelerations.iter().map(|a| a.y).collect();

    let mut remaining = Remaining {
        x: &bodies.x,
        y: &bodies.y,
        mass: &bodies.mass,
        inv_mass: &bodies.inv_mass,
        acceleration_x: &mut acceleration_x,
        acceleration_y: &mut acceleration_y,
    };
    while let Some((first, later)) = remaining.split_first() {
        let (lanes_x, lanes_y) = sweep::<S, L>(
            Body {
                x: first.x,
                y: first.y,
                gravity_times_mass: gravity.gravitational_constant * first.mass,
            },
            gravity.softening_sq,
            (later.x, later.y, later.mass, later.inv_mass),
            (&mut *later.acceleration_x, &mut *later.acceleration_y),
        );
        *first.acceleration_x += lane_total(&lanes_x) * first.inv_mass;
        *first.acceleration_y += lane_total(&lanes_y) * first.inv_mass;
        remaining = later;
    }
    for ((acceleration, &x), &y) in accelerations
        .iter_mut()
        .zip(&acceleration_x)
        .zip(&acceleration_y)
    {
        *acceleration = Vec2::new(x, y);
    }
}

/// Body i, as the sweep needs it: its position and `G m_i`.
#[derive(Clone, Copy)]
struct Body<S> {
    x: S,
    y: S,
    gravity_times_mass: S,
}

/// What's left of the arrays: body i and the bodies after it.
struct Remaining<'a, S> {
    x: &'a [S],
    y: &'a [S],
    mass: &'a [S],
    inv_mass: &'a [S],
    acceleration_x: &'a mut [S],
    acceleration_y: &'a mut [S],
}

/// The first body of a [`Remaining`]: its values, and its acceleration to
/// add to.
struct First<'a, S> {
    x: S,
    y: S,
    mass: S,
    inv_mass: S,
    acceleration_x: &'a mut S,
    acceleration_y: &'a mut S,
}

impl<'a, S: Copy> Remaining<'a, S> {
    /// The first body, and the rest after it; `None` when empty.
    fn split_first(self) -> Option<(First<'a, S>, Self)> {
        let ((&x, x_rest), (&y, y_rest)) = (self.x.split_first()?, self.y.split_first()?);
        let ((&mass, mass_rest), (&inv_mass, inv_mass_rest)) =
            (self.mass.split_first()?, self.inv_mass.split_first()?);
        let ((acceleration_x, acceleration_x_rest), (acceleration_y, acceleration_y_rest)) = (
            self.acceleration_x.split_first_mut()?,
            self.acceleration_y.split_first_mut()?,
        );
        Some((
            First {
                x,
                y,
                mass,
                inv_mass,
                acceleration_x,
                acceleration_y,
            },
            Self {
                x: x_rest,
                y: y_rest,
                mass: mass_rest,
                inv_mass: inv_mass_rest,
                acceleration_x: acceleration_x_rest,
                acceleration_y: acceleration_y_rest,
            },
        ))
    }
}

/// Lane by lane: `[f(a0, b0), f(a1, b1), ..]`. A fixed-length loop, so
/// the compiler unrolls it.
fn map2<S: Copy, const L: usize>(
    left: [S; L],
    right: [S; L],
    combine: impl Fn(S, S) -> S,
) -> [S; L] {
    let mut out = left;
    for (slot, (&left_value, &right_value)) in out.iter_mut().zip(left.iter().zip(&right)) {
        *slot = combine(left_value, right_value);
    }
    out
}

/// Body `first` against every later body: each pair's force, subtracted
/// from body j's acceleration (times its `inv_mass`) and added to body i's
/// lanes (returned, to be multiplied by its `inv_mass`). The slices are
/// parameters of a function that isn't inlined, so the compiler knows they
/// don't overlap.
#[inline(never)]
fn sweep<S: Scalar, const L: usize>(
    first: Body<S>,
    softening_sq: S,
    (xs, ys, masses, inv_masses): (&[S], &[S], &[S], &[S]),
    (acceleration_xs, acceleration_ys): (&mut [S], &mut [S]),
) -> ([S; L], [S; L]) {
    let (mut lanes_x, mut lanes_y) = ([S::ZERO; L], [S::ZERO; L]);
    let (x_blocks, x_tail) = xs.as_chunks::<L>();
    let (y_blocks, y_tail) = ys.as_chunks::<L>();
    let (mass_blocks, mass_tail) = masses.as_chunks::<L>();
    let (inv_mass_blocks, inv_mass_tail) = inv_masses.as_chunks::<L>();
    let (acceleration_x_blocks, acceleration_x_tail) = acceleration_xs.as_chunks_mut::<L>();
    let (acceleration_y_blocks, acceleration_y_tail) = acceleration_ys.as_chunks_mut::<L>();
    let blocks = x_blocks
        .iter()
        .zip(y_blocks)
        .zip(mass_blocks)
        .zip(inv_mass_blocks)
        .zip(
            acceleration_x_blocks
                .iter_mut()
                .zip(acceleration_y_blocks.iter_mut()),
        );
    for ((((x_block, y_block), mass_block), inv_mass_block), (acceleration_x, acceleration_y)) in
        blocks
    {
        let offset_x = x_block.map(|x| x - first.x);
        let offset_y = y_block.map(|y| y - first.y);
        let distance_sq = map2(offset_x, offset_y, |offset_x, offset_y| {
            offset_x * offset_x + offset_y * offset_y + softening_sq
        });
        let scale = map2(distance_sq, *mass_block, |distance_sq, mass| {
            let scale = first.gravity_times_mass * mass / (distance_sq * distance_sq.sqrt());
            // Coincident and unsoftened: 0/0, selected away (no branch).
            if distance_sq == S::ZERO {
                S::ZERO
            } else {
                scale
            }
        });
        let force_x = map2(offset_x, scale, |offset, scale| offset * scale);
        let force_y = map2(offset_y, scale, |offset, scale| offset * scale);
        *acceleration_x = map2(
            *acceleration_x,
            map2(force_x, *inv_mass_block, |force, inv_mass| force * inv_mass),
            |acceleration, force| acceleration - force,
        );
        *acceleration_y = map2(
            *acceleration_y,
            map2(force_y, *inv_mass_block, |force, inv_mass| force * inv_mass),
            |acceleration, force| acceleration - force,
        );
        lanes_x = map2(lanes_x, force_x, |lane, force| lane + force);
        lanes_y = map2(lanes_y, force_y, |lane, force| lane + force);
    }
    // The last few, into the same lanes in the same order.
    let lanes = lanes_x.iter_mut().zip(lanes_y.iter_mut());
    let tail = x_tail
        .iter()
        .zip(y_tail)
        .zip(mass_tail)
        .zip(inv_mass_tail)
        .zip(
            acceleration_x_tail
                .iter_mut()
                .zip(acceleration_y_tail.iter_mut()),
        );
    for ((lane_x, lane_y), ((((&x, &y), &mass), &inv_mass), (acceleration_x, acceleration_y))) in
        lanes.zip(tail)
    {
        let (offset_x, offset_y) = (x - first.x, y - first.y);
        let distance_sq = offset_x * offset_x + offset_y * offset_y + softening_sq;
        let scale = first.gravity_times_mass * mass / (distance_sq * distance_sq.sqrt());
        let scale = if distance_sq == S::ZERO {
            S::ZERO
        } else {
            scale
        };
        let (force_x, force_y) = (offset_x * scale, offset_y * scale);
        *acceleration_x -= force_x * inv_mass;
        *acceleration_y -= force_y * inv_mass;
        *lane_x += force_x;
        *lane_y += force_y;
    }
    (lanes_x, lanes_y)
}
