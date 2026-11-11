//! The M7 pool table: its constructor, the cue, speculation and the
//! readouts the billiards page draws (`docs/09-billiards.md`).

use core::num::NonZeroU32;

use engine::scenarios::{
    POOL_BALL_MASS, POOL_BALL_RADIUS, POOL_CUE, POOL_LENGTH, POOL_RACK, pool_rack,
};
use engine::{ConfigError, Mass, Radius, Scalar, Solver, Vec2, World};

use super::any_world::{build_any, each_scalar};
use super::sim::Sim;
use super::{BetweenSteps, Demo, ScalarKind};

/// Substeps the table starts with: 10 (`tests/billiards.rs` measured the
/// break there). The page can change it.
// `unwrap` in a const item runs at compile time (as `PHYSICS_RATE`).
const START_SUBSTEPS: NonZeroU32 = NonZeroU32::new(10).unwrap();

impl Demo {
    /// `scenarios::pool_rack`: the cue ball on the head spot and 15 balls
    /// racked, impulse to start, tunnels counted.
    ///
    /// # Errors
    /// [`ConfigError`] from building the scene (not for valid input).
    pub(crate) fn new_pool(scalar: ScalarKind) -> Result<Self, ConfigError> {
        let world = build_any!(scalar, {
            let mut w = pool_rack(Solver::Impulse, START_SUBSTEPS)?;
            w.count_tunnels(true);
            Sim::on_table(w)
        });
        let mut demo = Self::assemble(world, BetweenSteps::Pocket(Vec::new()), 16);
        demo.fill_statics();
        Ok(demo)
    }

    /// Strikes the cue ball along `(aim_x, aim_y)` at `speed` m/s, the tip
    /// `tip` radii above centre. Parsed by the export; `false`, changing
    /// nothing, for a world that isn't a table, a cue ball out of play, or
    /// an aim with no direction.
    pub(crate) fn strike(&mut self, aim_x: f64, aim_y: f64, speed: f64, tip: f64) -> bool {
        each_scalar!(&mut self.world, s => strike_in(&mut s.world, aim_x, aim_y, speed, tip))
    }

    /// Speculative contacts on or off; `false` for a world without
    /// collisions.
    pub(crate) fn set_speculative(&mut self, on: bool) -> bool {
        each_scalar!(&mut self.world, s => s.world.collides() && {
            s.world.set_speculative(on);
            true
        })
    }

    /// Tunnels counted since the table was racked, or `None` if this world
    /// doesn't count them.
    #[must_use]
    pub(crate) fn tunnels(&self) -> Option<u64> {
        each_scalar!(&self.world, s => s.world.tunnels())
    }

    /// Whether every ball has stopped, spin included (the page's cue is
    /// enabled only then).
    #[must_use]
    pub(crate) fn at_rest(&self) -> bool {
        self.energy() == Some(0.0)
    }

    /// Re-spots a potted cue ball on the head spot (or the first free
    /// place behind it), once the table is at rest. `false` if the cue ball
    /// is in play, the table isn't at rest, or it isn't a table.
    pub(crate) fn respot_cue(&mut self) -> bool {
        if !self.at_rest() {
            return false;
        }
        let done = each_scalar!(&mut self.world, s => respot_in(&mut s.world));
        if done {
            self.fill_render_buf();
        }
        done
    }

    /// `[ball, pocket, …]`: everything potted since the rack.
    #[must_use]
    pub(crate) fn potted(&self) -> &[u32] {
        match &self.between_steps {
            BetweenSteps::Pocket(potted) => potted,
            BetweenSteps::Respawn(_) | BetweenSteps::Nothing => &[],
        }
    }

    /// Ball `i`'s number: 0 the cue ball, 1–15 as racked; `None` past the
    /// rack or for a world that isn't a table.
    #[must_use]
    pub(crate) fn ball_number(&self, i: usize) -> Option<u8> {
        if !matches!(self.between_steps, BetweenSteps::Pocket(_)) {
            return None;
        }
        match i {
            0 => Some(0),
            _ => POOL_RACK.get(i - 1).copied(),
        }
    }

    /// Particle `i`'s spin `(ω_x, ω_y)`, rad/s; `None` past the end.
    #[must_use]
    pub(crate) fn spin(&self, i: usize) -> Option<(f64, f64)> {
        each_scalar!(&self.world, s => {
            let n = s.world.particles().len();
            (i < n).then(|| s.world.spin().get(i).map_or((0.0, 0.0), |w| (w.x.to_f64(), w.y.to_f64())))
        })
    }

    /// `[x0, y0, x1, y1, …]`: every segment's ends, `f32`.
    #[must_use]
    pub(crate) fn segments(&self) -> &[f32] {
        &self.segments_buf
    }

    /// `[x, y, r, …]`: every pocket, `f32`.
    #[must_use]
    pub(crate) fn pocket_circles(&self) -> &[f32] {
        &self.pockets_buf
    }

    /// Copies the segments and pockets into their render buffers (they
    /// never move).
    fn fill_statics(&mut self) {
        let (segs, pockets) = (&mut self.segments_buf, &mut self.pockets_buf);
        each_scalar!(&self.world, s => {
            let f = |x: f64| math::convert::f64_to_f32(x);
            segs.clear();
            for seg in s.world.segments() {
                for e in seg.ends() {
                    segs.extend([f(e.x.to_f64()), f(e.y.to_f64())]);
                }
            }
            pockets.clear();
            for p in s.world.pockets() {
                let c = p.center();
                pockets.extend([f(c.x.to_f64()), f(c.y.to_f64()), f(p.radius().to_f64())]);
            }
        });
    }
}

fn strike_in<S: Scalar>(w: &mut World<S>, aim_x: f64, aim_y: f64, speed: f64, tip: f64) -> bool {
    if w.table().is_none() {
        return false;
    }
    let Some((_, aim)) = Vec2::from_f64(aim_x, aim_y).length_and_direction() else {
        return false;
    };
    let tip = S::from_f64(tip * POOL_BALL_RADIUS);
    w.strike(POOL_CUE, aim, S::from_f64(speed), tip)
}

/// Puts a retired cue ball back on the head spot, or the first place
/// behind it (toward the head rail) clear of every other ball.
fn respot_in<S: Scalar>(w: &mut World<S>) -> bool {
    if w.table().is_none() || w.particles().radius().first().is_none_or(|&r| r != S::ZERO) {
        return false;
    }
    let (Some(mass), Some(radius)) = (
        Mass::new(S::from_f64(POOL_BALL_MASS)),
        Radius::new(S::from_f64(POOL_BALL_RADIUS)),
    ) else {
        return false;
    };
    let clear = 2.0 * POOL_BALL_RADIUS;
    let head = -POOL_LENGTH / 4.0;
    // Back toward the head rail a ball's width at a time.
    let spot = (0..8).map(|k| head - f64::from(k) * clear).find(|&x| {
        w.particles()
            .pos()
            .iter()
            .zip(w.particles().radius())
            .all(|(p, r)| {
                *r == S::ZERO
                    || (Vec2::new(p.x.to_f64(), p.y.to_f64()) - Vec2::new(x, 0.0)).length() >= clear
            })
    });
    let Some(x) = spot else {
        return false;
    };
    w.reinstate(POOL_CUE, Vec2::new(S::from_f64(x), S::ZERO), mass, radius)
}
