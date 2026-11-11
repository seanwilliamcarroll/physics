//! Dragging and the links buffer: what the M4 pages need beyond stepping.

use engine::{Compliance, Order, Scalar, Stabilization, Vec2, World};

use super::Demo;
use super::any_world::each_scalar;

/// Compliance of the drag's rod, m/N: k = 1/α = 1000 N/m. Measured on the
/// 1:100 chain (`engine/tests/drag.rs`): firm enough that the bob follows
/// the cursor within ~8 cm under XPBD, soft enough that a fast flick
/// doesn't yank the chain or (impulse) inject energy.
const DRAG_COMPLIANCE: f64 = 1e-3;

impl Demo {
    /// Whether this demo's world can be grabbed ([`engine::World::grabbable`]:
    /// only one a solver already steps).
    pub(crate) fn grabbable(&self) -> bool {
        each_scalar!(&self.world, s => s.world.grabbable())
    }

    /// Grabs the dynamic particle nearest to `(x, y)` (m) within `radius`
    /// (m), releasing any grab already held. Returns its index, or `None`
    /// if nothing dynamic is that close.
    pub(crate) fn grab(&mut self, x: f64, y: f64, radius: f64) -> Option<usize> {
        self.release();
        let grab = each_scalar!(&mut self.world, s => grab_in(&mut s.world, x, y, radius));
        let index = grab.as_ref().map(|g| g.particle().index());
        self.grab = grab;
        self.refresh_links();
        self.fill_render_buf();
        index
    }

    /// Moves the held grab's anchor to `(x, y)`. `false` if nothing is held.
    pub(crate) fn drag(&mut self, x: f64, y: f64) -> bool {
        let Some(grab) = &self.grab else { return false };
        each_scalar!(&mut self.world, s => s.world.drag(grab, Vec2::from_f64(x, y)));
        true
    }

    /// Releases the held grab. `false` if nothing is held.
    pub(crate) fn release(&mut self) -> bool {
        let Some(grab) = self.grab.take() else {
            return false;
        };
        // Nothing is added to a demo's world after a grab, so release
        // can't be refused; if it were, keep the grab rather than lose it.
        let result = each_scalar!(&mut self.world, s => s.world.release(grab));
        if let Err(grab) = result {
            self.grab = Some(grab);
            return false;
        }
        self.refresh_links();
        self.fill_render_buf();
        true
    }

    /// The order each solver pass visits the constraints in.
    pub(crate) fn set_order(&mut self, order: Order) {
        each_scalar!(&mut self.world, s => s.world.set_order(order));
    }

    /// How the impulse solver corrects rigid rods' position error.
    pub(crate) fn set_stabilization(&mut self, stabilization: Stabilization) {
        each_scalar!(&mut self.world, s => s.world.set_stabilization(stabilization));
    }

    /// `[a0, b0, a1, b1, ...]`: the particles each constraint joins.
    #[must_use]
    pub(crate) fn links(&self) -> &[u32] {
        &self.links
    }

    pub(super) fn refresh_links(&mut self) {
        let links = &mut self.links;
        each_scalar!(&self.world, s => fill_links(&s.world, s.spring_ends(), links));
    }
}

fn grab_in<S: Scalar>(w: &mut World<S>, x: f64, y: f64, radius: f64) -> Option<engine::Grab> {
    let soft = Compliance::new(S::from_f64(DRAG_COMPLIANCE))?;
    w.grab(Vec2::from_f64(x, y), S::from_f64(radius), soft)
}

/// Rebuilds `links` from `w`'s constraints. Indices past `u32::MAX` can't
/// occur in a wasm32 address space; one would be skipped, not wrapped.
/// Rebuilds `links` from `w`'s constraints and then `springs` (a jelly's
/// force springs, which aren't constraints but are drawn the same way).
fn fill_links<S: Scalar>(
    w: &World<S>,
    springs: Vec<[engine::ParticleId; 2]>,
    links: &mut Vec<u32>,
) {
    links.clear();
    let ends = w
        .constraints()
        .iter()
        .map(engine::Constraint::bodies)
        .chain(springs);
    for [a, b] in ends {
        if let (Ok(a), Ok(b)) = (u32::try_from(a.index()), u32::try_from(b.index())) {
            links.extend([a, b]);
        }
    }
}
