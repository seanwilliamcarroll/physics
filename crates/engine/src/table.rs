//! [`Table`]: the cloth a ball slides and rolls on (M7,
//! `docs/09-billiards.md`, "The ball model").
//!
//! A ball carries spin about the horizontal axes, `ω = (ω_x, ω_y)`; its
//! bottom slips over the cloth at `u = v + ω × (−R ẑ) = (v_x − R ω_y,
//! v_y + R ω_x)`. Sliding (`u ≠ 0`), kinetic friction `μ_s m g` opposes
//! `u` at the contact point, so `u` shrinks along a fixed direction at
//! `(7/2) μ_s g` and reaches 0 in finite time; then the ball rolls, and
//! rolling resistance `μ_r g` slows it to rest, again in finite time.
//! Applied with the forces, after each half kick, and clamped at both
//! transitions, so neither overshoots.

use crate::{Particles, Scalar, Vec2};

/// The cloth's coefficients and `g` (the table is seen from above, so
/// gravity enters only here).
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Table<S> {
    mu_slide: S,
    mu_roll: S,
    g: S,
}

impl<S: Scalar> Table<S> {
    /// Sliding friction `μ_s`, rolling resistance `μ_r` (both ≥ 0) and `g`
    /// (> 0), m/s². `None` for a negative or non-finite coefficient or a
    /// non-positive `g`.
    #[must_use]
    pub fn new(mu_slide: S, mu_roll: S, g: S) -> Option<Self> {
        let finite = |x: S| x.to_f64().is_finite();
        let ok = mu_slide >= S::ZERO
            && mu_roll >= S::ZERO
            && g > S::ZERO
            && finite(mu_slide)
            && finite(mu_roll)
            && finite(g);
        ok.then_some(Self {
            mu_slide,
            mu_roll,
            g,
        })
    }

    #[must_use]
    pub const fn mu_slide(self) -> S {
        self.mu_slide
    }

    #[must_use]
    pub const fn mu_roll(self) -> S {
        self.mu_roll
    }

    #[must_use]
    pub const fn g(self) -> S {
        self.g
    }
}

/// The slip velocity of a ball of radius `r` at velocity `v` and spin `w`.
pub fn slip<S: Scalar>(v: Vec2<S>, w: Vec2<S>, r: S) -> Vec2<S> {
    Vec2::new(v.x - r * w.y, v.y + r * w.x)
}

/// The spin of a ball rolling at `v`: `ω_x = −v_y / R`, `ω_y = v_x / R`.
pub fn rolling_spin<S: Scalar>(v: Vec2<S>, r: S) -> Vec2<S> {
    Vec2::new(-v.y / r, v.x / r)
}

/// Slip below this fraction of a ball's own speeds (`|v| + R |ω|`) counts
/// as rolling. After snapping to rolling, `v_x − R (v_x / R)` can be an
/// ulp off zero, and an exact test would never see the ball roll, so it
/// would never stop. Removing a slip this small takes the cloth under a
/// microsecond at any speed, so it changes nothing physical; it holds for
/// `f32` as well as `f64`.
const ROLLING_TOL: f64 = 1e-6;

/// `dt` seconds of cloth on every ball (a moving circle) in `p`: slide
/// toward rolling, landing on it exactly, then roll toward rest, landing
/// on it exactly. `spin` is aligned with the particles.
pub(crate) fn cloth<S: Scalar>(table: Table<S>, p: &mut Particles<S>, spin: &mut [Vec2<S>], dt: S) {
    let two = S::ONE + S::ONE;
    let five = two + two + S::ONE;
    let seven = five + two;
    let slide = table.mu_slide * table.g;
    let roll = table.mu_roll * table.g;
    let rolling_tol = S::from_f64(ROLLING_TOL);
    for (((v, w), &r), &inv_mass) in p
        .vel
        .iter_mut()
        .zip(spin.iter_mut())
        .zip(&p.radius)
        .zip(&p.inv_mass)
    {
        if r == S::ZERO || inv_mass == S::ZERO {
            continue;
        }
        let mut left = dt;
        let u = slip(*v, *w, r);
        let mut rolling = u.length() <= rolling_tol * (v.length() + r * w.length());
        if !rolling
            && let Some((u, dir)) = u.length_and_direction()
            && slide > S::ZERO
        {
            // |u| falls at (7/2) μ_s g: rolling after |u| / that.
            let to_roll = two * u / (seven * slide);
            let t = if to_roll < left { to_roll } else { left };
            let d = dir.get();
            *v -= d * (slide * t);
            *w += Vec2::new(-d.y, d.x) * (five * slide * t / (two * r));
            left -= t;
            rolling = t == to_roll;
        }
        if rolling {
            if let Some((speed, dir)) = v.length_and_direction() {
                let after = speed - roll * left;
                *v = if after > S::ZERO {
                    dir.get() * after
                } else {
                    Vec2::ZERO
                };
            }
            // Exactly rolling: no slip left over from rounding.
            *w = rolling_spin(*v, r);
        }
    }
}

#[cfg(test)]
mod tests;
