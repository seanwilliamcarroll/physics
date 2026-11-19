//! [`AnyWorld`]: the runtime scalar choice, and the macros that keep every
//! per-scalar `match` to one line.

use engine::{Scalar, World};
use math::convert::f64_to_f32;

use super::sim::Sim;

/// Runtime scalar choice. Each variant monomorphizes a full engine copy into
/// the `.wasm`, so binary size grows per variant.
pub(super) enum AnyWorld {
    F32(Sim<f32>),
    F64(Sim<f64>),
}

/// Runs `$body` on whichever `Sim` `$world` holds, bound as `$sim`:
/// `each_scalar!(&mut self.world, sim => sim.world.set_solver(x))`. The body
/// is compiled once per scalar type, so it must type-check for both
/// (values parsed in `f64` go through `.cast()`).
macro_rules! each_scalar {
    ($world:expr, $sim:ident => $body:expr) => {
        match $world {
            $crate::demo::any_world::AnyWorld::F32($sim) => $body,
            $crate::demo::any_world::AnyWorld::F64($sim) => $body,
        }
    };
}
pub(super) use each_scalar;

/// Builds an [`AnyWorld`] of `$scalar`'s type from `$sim`, an expression
/// generic over the scalar (inferred from the variant it's wrapped in).
macro_rules! build_any {
    ($scalar:expr, $sim:expr) => {
        match $scalar {
            $crate::demo::codes::ScalarKind::F32 => $crate::demo::any_world::AnyWorld::F32($sim),
            $crate::demo::codes::ScalarKind::F64 => $crate::demo::any_world::AnyWorld::F64($sim),
        }
    };
}
pub(super) use build_any;

/// Copies `world`'s positions into `buffer` as interleaved `f32`, the render
/// buffer the page reads.
pub(super) fn fill_positions<S: Scalar>(world: &World<S>, buffer: &mut Vec<f32>) {
    buffer.clear();
    for position in world.particles().pos() {
        buffer.push(to_render(position.x));
        buffer.push(to_render(position.y));
    }
}

/// Narrowing to `f32` is fine for drawing (sub-micrometer at demo scales).
fn to_render<S: Scalar>(coordinate: S) -> f32 {
    f64_to_f32(coordinate.to_f64())
}
