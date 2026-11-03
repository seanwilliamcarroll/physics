//! Wire codes from JS, decoded once at the boundary into enums: an unknown
//! code becomes `None`, never a wrong scene.

use engine::scenarios::DoublePendulumStart;
use engine::{Integrator, Order, Solver};

use crate::abi;

/// Which numeric type the engine runs on, chosen at runtime by JS.
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub(crate) enum ScalarKind {
    F32,
    F64,
}

impl ScalarKind {
    /// Decodes a `demo_new` scalar code ([`abi`]).
    #[must_use]
    pub(crate) const fn from_code(code: u32) -> Option<Self> {
        match code {
            abi::SCALAR_F32 => Some(Self::F32),
            abi::SCALAR_F64 => Some(Self::F64),
            _ => None,
        }
    }
}

/// Which scene to run.
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub(crate) enum DemoKind {
    Fountain,
    Orbit,
    /// One of the M2 scenes of `n` bodies under pairwise gravity.
    Gravity(GravityScene),
    /// M3: `01-solvers.md`'s pendulum (a pin and a bob on a rod).
    Pendulum,
}

/// The M2 gravity scenes, all under `scenarios::cluster_gravity` (same ε).
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub(crate) enum GravityScene {
    /// Random bodies in a disk, drifting (`scenarios::cluster`).
    Cluster,
    /// A heavy center and `n - 1` orbiters (`scenarios::disk`).
    Disk,
    /// A cold cloud at rest (`scenarios::collapse`).
    Collapse,
}

impl DemoKind {
    /// Decodes a `demo_new` kind code ([`abi`]).
    #[must_use]
    pub(crate) const fn from_code(code: u32) -> Option<Self> {
        match code {
            abi::DEMO_FOUNTAIN => Some(Self::Fountain),
            abi::DEMO_ORBIT => Some(Self::Orbit),
            abi::DEMO_CLUSTER => Some(Self::Gravity(GravityScene::Cluster)),
            abi::DEMO_DISK => Some(Self::Gravity(GravityScene::Disk)),
            abi::DEMO_COLLAPSE => Some(Self::Gravity(GravityScene::Collapse)),
            abi::DEMO_PENDULUM => Some(Self::Pendulum),
            _ => None,
        }
    }
}

/// Decodes a `demo_set_integrator` code ([`abi`]). A free function because
/// `Integrator` belongs to the engine, which knows nothing of wire codes.
#[must_use]
pub(crate) const fn integrator_from_code(code: u32) -> Option<Integrator> {
    match code {
        abi::INTEGRATOR_SYMPLECTIC_EULER => Some(Integrator::SymplecticEuler),
        abi::INTEGRATOR_EXPLICIT_EULER => Some(Integrator::ExplicitEuler),
        abi::INTEGRATOR_VELOCITY_VERLET => Some(Integrator::VelocityVerlet),
        _ => None,
    }
}

/// Decodes a `demo_set_solver` code ([`abi`]).
#[must_use]
pub(crate) const fn solver_from_code(code: u32) -> Option<Solver> {
    match code {
        abi::SOLVER_XPBD => Some(Solver::Xpbd),
        abi::SOLVER_IMPULSE => Some(Solver::Impulse),
        _ => None,
    }
}

/// Decodes a `demo_set_order` code ([`abi`]).
#[must_use]
pub(crate) const fn order_from_code(code: u32) -> Option<Order> {
    match code {
        abi::ORDER_FORWARD => Some(Order::Forward),
        abi::ORDER_REVERSE => Some(Order::Reverse),
        abi::ORDER_ALTERNATING => Some(Order::Alternating),
        _ => None,
    }
}

/// Decodes a `demo_new_double_pendulum` start code ([`abi`]).
#[must_use]
pub(crate) const fn start_from_code(code: u32) -> Option<DoublePendulumStart> {
    match code {
        abi::START_HORIZONTAL => Some(DoublePendulumStart::Horizontal),
        abi::START_RAISED => Some(DoublePendulumStart::Raised),
        _ => None,
    }
}

#[cfg(test)]
mod tests;
