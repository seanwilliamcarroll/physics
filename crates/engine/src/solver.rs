//! Constraint solvers: complete ways of advancing a substep when a world
//! has constraints (`docs/06-constraints.md`, "Who steps").
//! One file per solver (`solver/xpbd.rs`, `solver/impulse.rs`); this hub
//! holds what they share.

mod impulse;
mod xpbd;

use core::num::NonZeroU32;

use crate::{Baumgarte, Force, Particles, Scalar, Vec2};

/// How a world with constraints is stepped.
///
/// An enum, like [`Integrator`](crate::Integrator): a small closed set,
/// exhaustive matches, and a wire code for the demo.
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub enum Solver {
    /// Extended position-based dynamics (Macklin et al. 2016): predict
    /// positions, project them onto the constraints, derive velocities.
    /// Holds a rigid rod to rounding; dissipates energy, less with more
    /// substeps.
    Xpbd,
    /// Sequential impulses (Catto 2005, 2006): solve the constraints'
    /// *velocities*, with a Baumgarte bias feeding position error back,
    /// then integrate positions. Drifts without the bias; with substeps,
    /// keeps energy far better than XPBD.
    Impulse,
}

impl Solver {
    /// Both solvers, for tests and side-by-side demos.
    pub const ALL: [Self; 2] = [Self::Xpbd, Self::Impulse];
}

/// The order a Gauss–Seidel pass visits the constraints in. Each
/// correction is used immediately by the next, so order is part of the
/// method: along a chain, `Forward` carries a correction down the chain in
/// one pass, `Reverse` up it (`docs/06-constraints.md`, "Iteration order").
#[derive(Copy, Clone, Debug, PartialEq, Eq, Default)]
pub enum Order {
    /// Insertion order, every pass (the M3 behavior).
    #[default]
    Forward,
    /// Reverse insertion order, every pass.
    Reverse,
    /// Forward on even passes, reverse on odd ones, cancelling the
    /// one-directional bias; with one pass per substep, the same as
    /// `Forward`.
    Alternating,
}

impl Order {
    /// Every order, for tests and controls.
    pub const ALL: [Self; 3] = [Self::Forward, Self::Reverse, Self::Alternating];

    /// Whether pass `pass` (0-based) runs in reverse.
    #[must_use]
    pub const fn reversed(self, pass: u32) -> bool {
        match self {
            Self::Forward => false,
            Self::Reverse => true,
            Self::Alternating => pass % 2 == 1,
        }
    }

    /// Calls `f` on each constraint with its λ, in this order for pass
    /// `pass`.
    pub(crate) fn sweep<C, S>(
        self,
        pass: u32,
        constraints: &[C],
        lambda: &mut [S],
        mut f: impl FnMut(&C, &mut S),
    ) {
        let pairs = constraints.iter().zip(lambda.iter_mut());
        if self.reversed(pass) {
            pairs.rev().for_each(|(c, l)| f(c, l));
        } else {
            pairs.for_each(|(c, l)| f(c, l));
        }
    }
}

/// Everything a solver substep reads and writes, borrowed from `World`.
pub(crate) struct Step<'a, S: Scalar, C> {
    pub(crate) forces: &'a [Box<dyn Force<S>>],
    pub(crate) particles: &'a mut Particles<S>,
    pub(crate) constraints: &'a [C],
    /// One λ per constraint, same order.
    pub(crate) lambda: &'a mut [S],
    pub(crate) acc: &'a mut Vec<Vec2<S>>,
    /// Positions at the start of the substep (XPBD's `x_prev`).
    pub(crate) prev: &'a mut Vec<Vec2<S>>,
    pub(crate) iterations: NonZeroU32,
    pub(crate) order: Order,
    pub(crate) baumgarte: Baumgarte<S>,
}

#[cfg(test)]
mod tests;
