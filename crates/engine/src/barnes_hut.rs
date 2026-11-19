//! [`BarnesHut`]: softened gravity approximated with a quadtree, O(n log n).
//!
//! Design, accuracy, and what it gives up (momentum): `docs/barnes-hut.md`.
//! Reference: Barnes & Hut (1986), <https://doi.org/10.1038/324446a0>.

use crate::sort_key::{SortKey, sort, u64_from_key, u64_key};
use crate::{Force, OpeningAngle, PairwiseGravity, Particles, Scalar, Softening, Vec2};

mod tree;

use tree::{Body, Node, NodeKind, Root, build};

/// Same physics as [`PairwiseGravity`], but a group of bodies far enough
/// away is felt as one point mass at its center of mass.
///
/// A quadtree cell of side `s`, center of mass at distance `d` and `δ` from
/// the cell's center, is used whole when `s / (d − δ) < θ` (the `δ` rejects
/// lopsided cells; Salmon & Warren 1994). θ = 0 is direct summation. Forces
/// aren't equal and opposite, so momentum is conserved only up to the force
/// error. Static particles neither pull nor are pulled.
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
    /// `gravitational_constant` and `softening` as for `PairwiseGravity::new`. `theta`: the
    /// opening angle; 0 is direct summation, Barnes & Hut used about 1.
    #[must_use]
    pub fn new(gravitational_constant: S, softening: Softening<S>, theta: OpeningAngle<S>) -> Self {
        Self {
            gravitational_constant,
            softening_sq: softening.squared(),
            theta: theta.get(),
            theta_sq: theta.get() * theta.get(),
        }
    }

    /// The tree approximation of `exact`: same G and softening, opening
    /// angle `theta`.
    #[must_use]
    pub fn approximating(exact: &PairwiseGravity<S>, theta: OpeningAngle<S>) -> Self {
        Self {
            gravitational_constant: exact.gravitational_constant(),
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

    fn accel_on(&self, nodes: &[Node<S>], x: Vec2<S>, key: u64, index: usize) -> Vec2<S> {
        let mut acceleration = Vec2::ZERO;
        // Reading the postorder array backwards is a preorder walk: "open"
        // steps one node down, "accept" skips the subtree.
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
                .positions()
                .iter()
                .zip(particles.inverse_mass())
                .enumerate()
                .filter(|&(_, (_, &inverse_mass))| inverse_mass != S::ZERO)
        };
        let Some(root) = Root::around(
            dynamic().map(|(_, (&position, _))| position),
            S::ONE / (S::ONE + S::ONE),
        ) else {
            return; // no dynamic bodies: nothing pulls, nothing is pulled
        };

        // `sort_key.rs`'s one key type: sorting `Body<S>` compiled one copy
        // per S, ~7 KB each in the `.wasm`. (key, index) is unique.
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
                let (&pos, &inverse_mass) = particles
                    .positions()
                    .get(index)
                    .zip(particles.inverse_mass().get(index))?;
                Some(Body {
                    pos,
                    mass: S::ONE / inverse_mass,
                    key,
                    index,
                })
            })
            .collect();

        // One leaf per body, every cell ≥ 2 children: at most 2n − 1 nodes.
        let mut nodes = Vec::with_capacity(2 * bodies.len());
        let side = root.half_side + root.half_side;
        let _ = build(&bodies, 0, side, root.center, root.half, &mut nodes);

        for (index, (acceleration, (&x, &inverse_mass))) in accelerations
            .iter_mut()
            .zip(particles.positions().iter().zip(particles.inverse_mass()))
            .enumerate()
        {
            if inverse_mass != S::ZERO {
                *acceleration += self.accel_on(&nodes, x, root.key(x), index);
            }
        }
    }
}

#[cfg(test)]
mod tests;
