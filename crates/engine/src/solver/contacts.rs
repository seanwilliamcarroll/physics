//! Contact state and geometry both solvers share (`docs/08-collision.md`,
//! "The contact constraint").

use crate::collision::{Body, Contact, find_contacts};
use crate::{Particles, Scalar, UnitVec2, Vec2, Wall};

/// This substep's contacts and what the solvers keep per contact, in
/// matching order.
pub(crate) struct Contacts<S> {
    pub(crate) list: Vec<Contact<S>>,
    /// The impulse (or XPBD multiplier) applied this substep; never
    /// negative: a contact only pushes.
    pub(crate) lambda: Vec<S>,
    /// `v_n⁻`: the normal velocity when found, after the force kick and
    /// before the solve (negative = approaching). Restitution reverses it.
    pub(crate) approach: Vec<S>,
    /// Approach speeds at or below this get no bounce: `2 |a_b − a_a| h`,
    /// what the forces alone add in two substeps (Müller et al. 2020's
    /// `2 |g| h`, for any force). Keeps resting contacts at rest.
    pub(crate) rest_speed: Vec<S>,
    /// Every particle's velocity when the contacts were found (after the
    /// kick, before the solve): XPBD's velocity pass measures `v_n⁻` from
    /// these along the contact's *current* normal (Müller et al. 2020).
    pub(crate) vel_before: Vec<Vec2<S>>,
    /// The broadphase's scratch.
    pairs: Vec<(usize, usize)>,
}

impl<S: Scalar> Contacts<S> {
    pub(crate) const fn new() -> Self {
        Self {
            list: Vec::new(),
            lambda: Vec::new(),
            approach: Vec::new(),
            rest_speed: Vec::new(),
            vel_before: Vec::new(),
            pairs: Vec::new(),
        }
    }

    /// Finds this substep's contacts (`collision::find_contacts`) and
    /// records each one's approach speed and resting threshold. `acc` is
    /// this substep's per-particle acceleration from the forces.
    pub(crate) fn find(&mut self, p: &Particles<S>, walls: &[Wall<S>], acc: &[Vec2<S>], h: S) {
        find_contacts(p, walls, h, &mut self.pairs, &mut self.list);
        self.vel_before.clear();
        self.vel_before.extend_from_slice(p.vel());
        self.lambda.clear();
        self.lambda.resize(self.list.len(), S::ZERO);
        self.approach.clear();
        self.rest_speed.clear();
        let two = S::ONE + S::ONE;
        for c in &self.list {
            self.approach.push(normal_velocity(p, c, c.normal));
            let a_rel = body_acc(acc, c.b) - acc.get(c.a.index()).copied().unwrap_or(Vec2::ZERO);
            self.rest_speed.push(two * a_rel.length() * h);
        }
    }
}

/// `(a, b, w_a, w_b)`: the particle indices (`b` is `None` for a wall,
/// which has `w_b = 0`) and inverse masses, or `None` if a body isn't in
/// `p`.
pub(crate) fn bodies<S: Scalar>(
    p: &Particles<S>,
    c: &Contact<S>,
) -> Option<(usize, Option<usize>, S, S)> {
    let a = c.a.index();
    let wa = *p.inv_mass().get(a)?;
    match c.b {
        Body::Particle(b) => Some((a, Some(b.index()), wa, *p.inv_mass().get(b.index())?)),
        Body::Wall(_) => Some((a, None, wa, S::ZERO)),
    }
}

/// The contact's gap and normal (`a` toward `b`) at the *current*
/// positions: XPBD re-measures as positions move within a substep.
pub(crate) fn geometry<S: Scalar>(
    p: &Particles<S>,
    walls: &[Wall<S>],
    c: &Contact<S>,
) -> Option<(S, UnitVec2<S>)> {
    let a = c.a.index();
    let (xa, ra) = (*p.pos().get(a)?, *p.radius().get(a)?);
    match c.b {
        Body::Particle(b) => {
            let b = b.index();
            let (xb, rb) = (*p.pos().get(b)?, *p.radius().get(b)?);
            // Coincident: +x, as when the contact was found.
            let (dist, n) = (xb - xa)
                .length_and_direction()
                .unwrap_or((S::ZERO, UnitVec2::X));
            Some((dist - ra - rb, n))
        }
        Body::Wall(i) => {
            let wall = walls.get(i)?;
            Some((wall.distance(xa) - ra, -wall.normal()))
        }
    }
}

/// `n · (v_b − v_a)` at the particles' current velocities: positive when
/// separating. A wall's velocity is 0.
pub(crate) fn normal_velocity<S: Scalar>(p: &Particles<S>, c: &Contact<S>, n: UnitVec2<S>) -> S {
    normal_velocity_in(p.vel(), c, n)
}

/// `n · (v_b − v_a)` with velocities from `vel` (current, or saved).
pub(crate) fn normal_velocity_in<S: Scalar>(vel: &[Vec2<S>], c: &Contact<S>, n: UnitVec2<S>) -> S {
    let va = vel.get(c.a.index()).copied().unwrap_or(Vec2::ZERO);
    let vb = match c.b {
        Body::Particle(b) => vel.get(b.index()).copied().unwrap_or(Vec2::ZERO),
        Body::Wall(_) => Vec2::ZERO,
    };
    n.dot(vb - va)
}

/// A body's acceleration this substep (a wall's is 0).
fn body_acc<S: Scalar>(acc: &[Vec2<S>], b: Body) -> Vec2<S> {
    match b {
        Body::Particle(b) => acc.get(b.index()).copied().unwrap_or(Vec2::ZERO),
        Body::Wall(_) => Vec2::ZERO,
    }
}

/// Moves `a` by `−da` and `b` (if a particle) by `+db` in `v` (positions
/// or velocities, whichever slice is passed).
pub(crate) fn push_apart<S: Scalar>(
    v: &mut [Vec2<S>],
    a: usize,
    b: Option<usize>,
    da: Vec2<S>,
    db: Vec2<S>,
) {
    match b {
        Some(b) => {
            if let Ok([va, vb]) = v.get_disjoint_mut([a, b]) {
                *va -= da;
                *vb += db;
            }
        }
        None => {
            if let Some(va) = v.get_mut(a) {
                *va -= da;
            }
        }
    }
}
