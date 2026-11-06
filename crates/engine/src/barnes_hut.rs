//! [`BarnesHut`]: softened gravity approximated with a quadtree, O(n log n).
//!
//! Design, accuracy, and what it gives up (momentum): `docs/barnes-hut.md`.
//! Reference: Barnes & Hut (1986), <https://doi.org/10.1038/324446a0>.

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
/// side, beside some of its bodies (Salmon & Warren 1994; measured 25% off
/// at θ = 0.7 before, audit after A3). θ = 0 never uses a cell, which is
/// direct summation; larger θ is faster and less accurate. Forces are no longer equal and
/// opposite, so momentum is only conserved up to the force error.
///
/// Static particles (`inv_mass = 0`) neither pull nor are pulled.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct BarnesHut<S> {
    g_const: S,
    /// ε², as in `PairwiseGravity`: nonnegative ε is guaranteed by
    /// [`Softening`], checked where it was built.
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
            g_const,
            softening_sq: softening.squared(),
            theta: theta.get(),
            theta_sq: theta.get() * theta.get(),
        }
    }

    /// The tree approximation of `exact`: same G and softening (already
    /// checked when `exact` was built), opening angle `theta`. How a scene
    /// switches its force to Barnes–Hut while keeping `exact` for energy
    /// readouts.
    #[must_use]
    pub fn approximating(exact: &PairwiseGravity<S>, theta: OpeningAngle<S>) -> Self {
        Self {
            g_const: exact.g_const(),
            softening_sq: exact.softening_sq(),
            theta: theta.get(),
            theta_sq: theta.get() * theta.get(),
        }
    }

    #[must_use]
    pub const fn g_const(&self) -> S {
        self.g_const
    }

    #[must_use]
    pub const fn softening_sq(&self) -> S {
        self.softening_sq
    }

    /// Softened pull toward a point mass `mass` at offset `r` (unsoftened
    /// `|r|² = dist_sq`): `G m r / (|r|² + ε²)^(3/2)`. Zero, not 0/0, for
    /// a coincident unsoftened pair (no direction).
    fn pull(&self, r: Vec2<S>, dist_sq: S, mass: S) -> Vec2<S> {
        let d_sq = dist_sq + self.softening_sq;
        if d_sq == S::ZERO {
            return Vec2::ZERO;
        }
        r * (self.g_const * mass / (d_sq * d_sq.sqrt()))
    }

    /// Acceleration of a body at `x` (Morton key `key`, particle `index`)
    /// from the tree in `nodes` (postorder: see [`Node`]).
    fn accel_on(&self, nodes: &[Node<S>], x: Vec2<S>, key: u64, index: usize) -> Vec2<S> {
        let mut a = Vec2::ZERO;
        // One past the next node to visit; the root is last. Reading the
        // postorder array backwards is a preorder walk: "open" moves one
        // node down, "accept" skips the node's whole subtree. Running off
        // the front ends the walk.
        let mut cursor = nodes.len();
        while let Some(node) = cursor.checked_sub(1).and_then(|i| nodes.get(i)) {
            let r = node.com - x;
            let dist_sq = r.length_sq();
            let open = match node.kind {
                NodeKind::Body { index: j } => {
                    if j != index {
                        a += self.pull(r, dist_sq, node.mass);
                    }
                    false
                }
                NodeKind::Cell {
                    width,
                    keys: (lo, hi),
                    offset,
                } => {
                    // Never accept a cell containing the target: that
                    // would include its own mass (a self-force).
                    let contains = lo <= key && key <= hi;
                    // `s / (d − δ) < θ`, as `(s + θ δ)² < θ² d²`: both
                    // sides are non-negative, so squaring keeps the order,
                    // and `d ≤ δ` fails it, as it should.
                    let reach = width + self.theta * offset;
                    let far = reach * reach < self.theta_sq * dist_sq;
                    if !contains && far {
                        a += self.pull(r, dist_sq, node.mass);
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
        a
    }
}

impl<S: Scalar> Force<S> for BarnesHut<S> {
    fn accumulate(&self, p: &Particles<S>, acc: &mut [Vec2<S>]) {
        let dynamic = || {
            p.pos()
                .iter()
                .zip(p.inv_mass())
                .enumerate()
                .filter(|&(_, (_, &w))| w != S::ZERO)
        };
        let Some(root) = Root::around(dynamic().map(|(_, (&x, _))| x), S::ONE / (S::ONE + S::ONE))
        else {
            return; // no dynamic bodies: nothing pulls, nothing is pulled
        };

        // Sort (key, index) pairs, then gather the bodies in that order.
        // (key, index) is unique, so the order is fully determined by the
        // input whatever the sort algorithm: unstable is safe, and doesn't
        // allocate. Sorting a non-generic type keeps one copy of the sort
        // in the `.wasm` for every scalar type (sorting `Body<S>` compiled
        // one per S, ~7 KB each).
        let mut order: Vec<(u64, usize)> = dynamic()
            .map(|(index, (&pos, _))| (root.key(pos), index))
            .collect();
        order.sort_unstable();
        let bodies: Vec<Body<S>> = order
            .into_iter()
            .filter_map(|(key, index)| {
                let (&pos, &w) = p.pos().get(index).zip(p.inv_mass().get(index))?;
                Some(Body {
                    pos,
                    mass: S::ONE / w,
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

        for (index, (a, (&x, &w))) in acc
            .iter_mut()
            .zip(p.pos().iter().zip(p.inv_mass()))
            .enumerate()
        {
            if w != S::ZERO {
                *a += self.accel_on(&nodes, x, root.key(x), index);
            }
        }
    }
}

#[cfg(test)]
mod tests;
