//! Dragging and the links buffer.

use engine::{Compliance, Order, Scalar, Stabilization, Vec2, World};

use super::Demo;
use super::any_world::each_scalar;

/// Compliance of the drag's rod, m/N (a spring of 1000 N/m). Measured on the
/// 1:100 chain (`engine/tests/drag.rs`): firm enough that the bob follows
/// the cursor within ~8 cm under XPBD, soft enough that a fast flick
/// doesn't yank the chain or (impulse) inject energy.
const DRAG_COMPLIANCE: f64 = 1e-3;

impl Demo {
    /// Whether this demo's world can be grabbed ([`engine::World::grabbable`]).
    pub(crate) fn grabbable(&self) -> bool {
        each_scalar!(&self.world, sim => sim.world.grabbable())
    }

    /// Grabs the dynamic particle nearest to `(x, y)` (m) within `radius`
    /// (m), releasing any grab already held. Returns its index, or `None`
    /// if nothing dynamic is that close.
    pub(crate) fn grab(&mut self, x: f64, y: f64, radius: f64) -> Option<usize> {
        self.release();
        let grab = each_scalar!(&mut self.world, sim => grab_in(&mut sim.world, x, y, radius));
        let index = grab.as_ref().map(|grab| grab.particle().index());
        self.grab = grab;
        self.refresh_links();
        self.fill_render_buffer();
        index
    }

    /// Moves the held grab's anchor to `(x, y)`. `false` if nothing is held.
    pub(crate) fn drag(&mut self, x: f64, y: f64) -> bool {
        let Some(grab) = &self.grab else { return false };
        each_scalar!(&mut self.world, sim => sim.world.drag(grab, Vec2::from_f64(x, y)));
        true
    }

    /// Releases the held grab. `false` if nothing is held.
    pub(crate) fn release(&mut self) -> bool {
        let Some(grab) = self.grab.take() else {
            return false;
        };
        // Release can't be refused (nothing is added to the world after a
        // grab); if it were, keep the grab rather than lose it.
        let result = each_scalar!(&mut self.world, sim => sim.world.release(grab));
        if let Err(grab) = result {
            self.grab = Some(grab);
            return false;
        }
        self.refresh_links();
        self.fill_render_buffer();
        true
    }

    pub(crate) fn set_order(&mut self, order: Order) {
        each_scalar!(&mut self.world, sim => sim.world.set_order(order));
    }

    pub(crate) fn set_stabilization(&mut self, stabilization: Stabilization) {
        each_scalar!(&mut self.world, sim => sim.world.set_stabilization(stabilization));
    }

    /// `[a0, b0, a1, b1, ...]`: the particles each constraint joins.
    #[must_use]
    pub(crate) fn links(&self) -> &[u32] {
        &self.links
    }

    pub(super) fn refresh_links(&mut self) {
        let links = &mut self.links;
        each_scalar!(&self.world, sim => fill_links(&sim.world, sim.spring_ends(), links));
    }
}

fn grab_in<S: Scalar>(world: &mut World<S>, x: f64, y: f64, radius: f64) -> Option<engine::Grab> {
    let compliance = Compliance::new(S::from_f64(DRAG_COMPLIANCE))?;
    world.grab(Vec2::from_f64(x, y), S::from_f64(radius), compliance)
}

/// Rebuilds `links` from `world`'s constraints and then `springs` (a jelly's
/// force springs, which aren't constraints but are drawn the same way).
/// Indices past `u32::MAX` can't occur in a wasm32 address space; one would
/// be skipped, not wrapped.
fn fill_links<S: Scalar>(
    world: &World<S>,
    springs: Vec<[engine::ParticleId; 2]>,
    links: &mut Vec<u32>,
) {
    links.clear();
    let ends = world
        .constraints()
        .iter()
        .map(engine::Constraint::bodies)
        .chain(springs);
    for [first, second] in ends {
        if let (Ok(first), Ok(second)) =
            (u32::try_from(first.index()), u32::try_from(second.index()))
        {
            links.extend([first, second]);
        }
    }
}
