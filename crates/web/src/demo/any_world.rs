//! [`AnyWorld`]: the runtime scalar choice, and the two macros that keep
//! every per-scalar `match` to one line.

use engine::{Scalar, World};

use super::sim::Sim;

/// Runtime scalar choice. Each variant monomorphizes a full engine copy into
/// the `.wasm`, so binary size grows per variant (measure when adding one).
pub(super) enum AnyWorld {
    F32(Sim<f32>),
    F64(Sim<f64>),
}

/// Runs `$body` on whichever `Sim` `$world` holds, bound as `$s`:
/// `each_scalar!(&mut self.world, s => s.world.set_solver(x))`. The body
/// is compiled once per scalar type, so it must type-check for both
/// (values parsed in `f64` go through `.cast()`, exact for `f64` itself).
macro_rules! each_scalar {
    ($world:expr, $s:ident => $body:expr) => {
        match $world {
            $crate::demo::any_world::AnyWorld::F32($s) => $body,
            $crate::demo::any_world::AnyWorld::F64($s) => $body,
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

/// Copies `w`'s positions into `buf` as interleaved `f32` (the render
/// buffer the page reads).
pub(super) fn fill_positions<S: Scalar>(w: &World<S>, buf: &mut Vec<f32>) {
    buf.clear();
    for p in w.particles.pos() {
        buf.push(to_render(p.x));
        buf.push(to_render(p.y));
    }
}

/// Engine scalar to render coordinate. `to_f64` is the lossless readout;
/// narrowing to `f32` is fine for drawing (sub-micrometer at demo scales).
#[expect(
    clippy::cast_possible_truncation,
    reason = "intended narrowing: render coordinates only need f32 precision"
)]
fn to_render<S: Scalar>(x: S) -> f32 {
    x.to_f64() as f32
}
