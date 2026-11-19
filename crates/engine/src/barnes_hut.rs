//! [`BarnesHut`]: softened gravity approximated with a quadtree, O(n log n).
//!
//! Design, accuracy, and what it gives up (momentum): `docs/barnes-hut.md`.
//! Reference: Barnes & Hut (1986), <https://doi.org/10.1038/324446a0>.

use crate::sort_key::{SortKey, sort, u64_from_key, u64_key};
use crate::{Force, OpeningAngle, PairwiseGravity, Particles, Scalar, Softening, Vec2};

mod tree;

use tree::{Body, Node, NodeKind, Root, build};

/// Same physics as [`PairwiseGravity`] (softened
/// Newtonian gravity between dynamic particles), but a group of bodies far
/// enough away is felt as one point mass at its center of mass.
///
/// "Far enough": a quadtree cell of side `s` whose center of mass is at
/// distance `d`, and `δ` from the cell's geometric center, is used whole
/// when `s / (d − δ) < θ`. The `δ` keeps a lopsided cell (its mass bunched
/// on one side) from being accepted by a target just outside its *other*
/// side, beside some of its bodies (Salmon & Warren 1994). θ = 0 never uses
/// a cell, which is direct summation; larger θ is faster and less
/// accurate. Forces aren't equal and opposite, so momentum is only
/// conserved up to the force error.
///
/// Static particles (`inv_mass = 0`) neither pull nor are pulled.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct BarnesHut<S> {
    gravitational_constant: S,
    /// ε², as in `PairwiseGravity`.
    softening_sq: S,
    /// θ, and θ², so the opening test needs no sqrt (see `accel_on`).
    theta: S,
    theta_sq: S,
}

impl<S: Scalar> BarnesHut<S> {
    /// `g_const` and `softening` as for `PairwiseGravity::new`. `theta`:
    /// the opening angle; 0 is exact direct summation, Barnes & Hut used
    /// about 1.
    #[must_use]
    pub fn new(g_const: S, softening: Softening<S>, theta: OpeningAngle<S>) -> Self {
        Self {
            gravitational_constant: g_const,
            softening_sq: softening.squared(),
            theta: theta.get(),
            theta_sq: theta.get() * theta.get(),
        }
    }

    /// The tree approximation of `exact`: same G and softening, opening
    /// angle `theta`. How a scene switches its force to Barnes–Hut while
    /// keeping `exact` for energy readouts.
    #[must_use]
    pub fn approximating(exact: &PairwiseGravity<S>, theta: OpeningAngle<S>) -> Self {
        Self {
            gravitational_constant: exact.g_const(),
            softening_sq: exact.softening_sq(),
            theta: theta.get(),
            theta_sq: theta.get() * theta.get(),
        }
    }

    /// Softened pull toward a point mass `mass` at `offset` (unsoftened
    /// `|r|² = distance_sq`): `G m r / (|r|² + ε²)^(3/2)`. Zero, not 0/0,
    /// for a coincident unsoftened pair (no direction).
    fn pull(&self, offset: Vec2<S>, distance_sq: S, mass: S) -> Vec2<S> {
        let softened_sq = distance_sq + self.softening_sq;
        if softened_sq == S::ZERO {
            return Vec2::ZERO;
        }
        offset * (self.gravitational_constant * mass / (softened_sq * softened_sq.sqrt()))
    }

    /// Acceleration of a body at `x` (Morton key `key`, particle `index`)
    /// from the tree in `nodes` (postorder: see [`Node`]).
    fn accel_on(&self, nodes: &[Node<S>], x: Vec2<S>, key: u64, index: usize) -> Vec2<S> {
        let mut acceleration = Vec2::ZERO;
        // One past the next node to visit; the root is last. Reading the
        // postorder array backwards is a preorder walk: "open" moves one
        // node down, "accept" skips the node's whole subtree. Running off
        // the front ends the walk.
        let mut cursor = nodes.len();
        while let Some(node) = cursor
            .checked_sub(1)
            .and_then(|node_index| nodes.get(node_index))
        {
            let offset = node.center_of_mass - x;
            let distance_sq = offset.length_sq();
            let open = match node.kind {
                NodeKind::Body { index: body_index } => {
                    if body_index != index {
                        acceleration += self.pull(offset, distance_sq, node.mass);
                    }
                    false
                }
                NodeKind::Cell {
                    width,
                    keys: (first_key, last_key),
                    offset: center_offset,
                } => {
                    // Never accept a cell containing the target: that
                    // would include its own mass (a self-force).
                    let contains = first_key <= key && key <= last_key;
                    // `s / (d − δ) < θ`, as `(s + θ δ)² < θ² d²`: both
                    // sides are non-negative, so squaring keeps the order,
                    // and `d ≤ δ` fails it, as it should.
                    let reach = width + self.theta * center_offset;
                    let far = reach * reach < self.theta_sq * distance_sq;
                    if !contains && far {
                        acceleration += self.pull(offset, distance_sq, node.mass);
                    }
                    contains || !far
                }
            };
            cursor = if open {
                cursor - 1
            } else {
                // size ≥ 1 and ≤ cursor by construction; saturating keeps
                // the walk total (it just ends) even if that were violated.
                cursor.saturating_sub(node.size)
            };
        }
        acceleration
    }
}

impl<S: Scalar> Force<S> for BarnesHut<S> {
    fn accumulate(&self, particles: &Particles<S>, accelerations: &mut [Vec2<S>]) {
        let dynamic = || {
            particles
                .pos()
                .iter()
                .zip(particles.inv_mass())
                .enumerate()
                .filter(|&(_, (_, &inv_mass))| inv_mass != S::ZERO)
        };
        let Some(root) = Root::around(
            dynamic().map(|(_, (&position, _))| position),
            S::ONE / (S::ONE + S::ONE),
        ) else {
            return; // no dynamic bodies: nothing pulls, nothing is pulled
        };

        // Sort (key, index) pairs, then gather the bodies in that order.
        // (key, index) is unique, so the order is fully determined by the
        // input whatever the sort algorithm: unstable is safe, and doesn't
        // allocate. Sorting the engine's one key type (`sort_key.rs`)
        // keeps one copy of the sort in the `.wasm` for every scalar and
        // every caller (sorting `Body<S>` compiled one per S, ~7 KB each).
        let mut order: Vec<SortKey> = dynamic()
            .map(|(index, (&position, _))| {
                let (high, low) = u64_key(root.key(position));
                (high, low, index)
            })
            .collect();
        sort(&mut order);
        let bodies: Vec<Body<S>> = order
            .into_iter()
            .filter_map(|(high, low, index)| {
                let key = u64_from_key(high, low);
                let (&pos, &inv_mass) = particles
                    .pos()
                    .get(index)
                    .zip(particles.inv_mass().get(index))?;
                Some(Body {
                    pos,
                    mass: S::ONE / inv_mass,
                    key,
                    index,
                })
            })
            .collect();

        // One leaf per body, and every stored cell has ≥ 2 children (path
        // compression; buckets hold ≥ 2 bodies): at most 2n − 1 nodes, so
        // this never regrows.
        let mut nodes = Vec::with_capacity(2 * bodies.len());
        let side = root.half_side + root.half_side;
        let _ = build(&bodies, 0, side, root.center, root.half, &mut nodes);

        for (index, (acceleration, (&x, &inv_mass))) in accelerations
            .iter_mut()
            .zip(particles.pos().iter().zip(particles.inv_mass()))
            .enumerate()
        {
            if inv_mass != S::ZERO {
                *acceleration += self.accel_on(&nodes, x, root.key(x), index);
            }
        }
    }
}

#[cfg(test)]
mod tests;
