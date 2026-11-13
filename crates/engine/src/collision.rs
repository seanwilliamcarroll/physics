//! Collision (`docs/08-collision.md`): walls and segments, the broadphase,
//! contact generation, pockets and the tunnel count. One file per piece, re-exported
//! here.

mod broadphase;
mod narrowphase;
mod pocket;
mod segment;
mod tunnel;
mod wall;

pub use broadphase::candidate_pairs;
pub use narrowphase::broadphase_cell;
pub(crate) use narrowphase::{
    Body, CONTACT_MARGIN, Contact, find_contacts, pair_impact, segment_impact,
};
pub use pocket::Pocket;
pub use segment::Segment;
pub(crate) use segment::Statics;
pub(crate) use tunnel::count_tunnels;
pub use wall::Wall;
