//! [`Table`]: the cloth a ball slides and rolls on (`docs/09-billiards.md`,
//! "The ball model").
//!
//! A ball carries spin about the horizontal axes, `ω = (ω_x, ω_y)`; its
//! bottom slips over the cloth at `u = v + ω × (−R ẑ) = (v_x − R ω_y,
//! v_y + R ω_x)`. While sliding (`u ≠ 0`), kinetic friction `μ_s m g`
//! shrinks `u` along a fixed direction at `(7/2) μ_s g` to 0 in finite
//! time; then rolling resistance `μ_r g` slows the ball to rest, again in
//! finite time. Both transitions are clamped, so neither overshoots.

use crate::{Particles, Scalar, Vec2};

/// The cloth's coefficients and gravity (the table is seen from above, so
/// gravity enters only here).
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Table<S> {
    sliding_friction: S,
    rolling_resistance: S,
    gravity: S,
}

impl<S: Scalar> Table<S> {
    /// Sliding friction `μ_s`, rolling resistance `μ_r` (both ≥ 0) and `g`
    /// (> 0), m/s². `None` for a negative or non-finite coefficient or a
    /// non-positive `g`.
    #[must_use]
    pub fn new(sliding_friction: S, rolling_resistance: S, gravity: S) -> Option<Self> {
        let finite = |value: S| value.to_f64().is_finite();
        let ok = sliding_friction >= S::ZERO
            && rolling_resistance >= S::ZERO
            && gravity > S::ZERO
            && finite(sliding_friction)
            && finite(rolling_resistance)
            && finite(gravity);
        ok.then_some(Self {
            sliding_friction,
            rolling_resistance,
            gravity,
        })
    }

    #[must_use]
    pub const fn sliding_friction(self) -> S {
        self.sliding_friction
    }

    #[must_use]
    pub const fn rolling_resistance(self) -> S {
        self.rolling_resistance
    }

    #[must_use]
    pub const fn gravity(self) -> S {
        self.gravity
    }
}

/// The slip velocity of a ball of `radius` at `velocity` and `spin`.
pub fn slip<S: Scalar>(velocity: Vec2<S>, spin: Vec2<S>, radius: S) -> Vec2<S> {
    Vec2::new(velocity.x - radius * spin.y, velocity.y + radius * spin.x)
}

/// The spin of a ball rolling at `velocity`: `ω_x = −v_y / R`, `ω_y = v_x / R`.
pub(crate) fn rolling_spin<S: Scalar>(velocity: Vec2<S>, radius: S) -> Vec2<S> {
    Vec2::new(-velocity.y / radius, velocity.x / radius)
}

/// Slip below this fraction of a ball's own speeds (`|v| + R |ω|`) counts
/// as rolling. After snapping to rolling, `v_x − R (v_x / R)` can be an
/// ulp off zero, and an exact test would never see the ball roll. Removing
/// a slip this small takes under a microsecond of cloth at any speed; it
/// holds for `f32` as well as `f64`.
const ROLLING_TOL: f64 = 1e-6;

/// `dt` seconds of cloth on every ball (a moving circle) in `particles`:
/// slide toward rolling, landing on it exactly, then roll toward rest,
/// landing on it exactly. `spins` is aligned with the particles.
pub(crate) fn cloth<S: Scalar>(
    table: Table<S>,
    particles: &mut Particles<S>,
    spins: &mut [Vec2<S>],
    dt: S,
) {
    let two = S::ONE + S::ONE;
    let five = two + two + S::ONE;
    let seven = five + two;
    let slide = table.sliding_friction * table.gravity;
    let roll = table.rolling_resistance * table.gravity;
    let rolling_tol = S::from_f64(ROLLING_TOL);
    for (((velocity, spin), &radius), &inverse_mass) in particles
        .velocities
        .iter_mut()
        .zip(spins.iter_mut())
        .zip(&particles.radius)
        .zip(&particles.inverse_mass)
    {
        if radius == S::ZERO || inverse_mass == S::ZERO {
            continue;
        }
        let mut time_left = dt;
        let slip_velocity = slip(*velocity, *spin, radius);
        let mut rolling =
            slip_velocity.length() <= rolling_tol * (velocity.length() + radius * spin.length());
        if !rolling
            && let Some((slip_speed, direction)) = slip_velocity.length_and_direction()
            && slide > S::ZERO
        {
            // |u| falls at (7/2) μ_s g: rolling after |u| / that.
            let time_to_roll = two * slip_speed / (seven * slide);
            let slide_time = if time_to_roll < time_left {
                time_to_roll
            } else {
                time_left
            };
            let direction = direction.get();
            *velocity -= direction * (slide * slide_time);
            *spin +=
                Vec2::new(-direction.y, direction.x) * (five * slide * slide_time / (two * radius));
            time_left -= slide_time;
            rolling = slide_time == time_to_roll;
        }
        if rolling {
            if let Some((speed, direction)) = velocity.length_and_direction() {
                let speed_after = speed - roll * time_left;
                *velocity = if speed_after > S::ZERO {
                    direction.get() * speed_after
                } else {
                    Vec2::ZERO
                };
            }
            // Exactly rolling: no slip left over from rounding.
            *spin = rolling_spin(*velocity, radius);
        }
    }
}

#[cfg(test)]
mod tests;
