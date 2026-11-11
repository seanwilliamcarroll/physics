//! Ready-made worlds, shared by tests and demos: the scene you test is the
//! scene you demo. All in SI units.
//!
//! One file per scene (`scenarios/<scene>.rs`), re-exported here, so
//! callers write `scenarios::cluster` whatever file it lives in.

mod ball_box;
mod billiards;
mod break_shot;
mod chain;
mod cluster;
mod collapse;
mod cradle;
mod disk;
mod double_pendulum;
mod fountain;
mod jelly;
mod orbit;
mod pendulum;
mod shared;

pub use ball_box::{
    BOX_BALL_MASS, BOX_BALL_RADIUS, BOX_BALLS, BOX_HALF_WIDTH, BOX_HEIGHT, BOX_MAX_BALLS,
    BOX_SPEED, ball_box,
};
pub use billiards::{
    POOL_BALL_MASS, POOL_BALL_RADIUS, POOL_CORNER_MOUTH, POOL_CUE, POOL_E_BALL, POOL_E_CUSHION,
    POOL_G, POOL_LENGTH, POOL_MAX_SPEED, POOL_MU_ROLL, POOL_MU_SLIDE, POOL_RACK, POOL_SIDE_MOUTH,
    POOL_WIDTH, pool_break, pool_rack, pool_table,
};
pub use break_shot::{
    BREAK_BALL_MASS, BREAK_BALL_RADIUS, BREAK_CUE_DISTANCE, BREAK_ROWS, BREAK_SPEED, break_shot,
};
pub use chain::{CHAIN_LENGTH, CHAIN_LINK_MASS, CHAIN_LINKS, chain};
pub use cluster::{
    CLUSTER_RADIUS, CLUSTER_SOFTENING, CLUSTER_SPEED, CLUSTER_SUBSTEPS, CLUSTER_TOTAL_MASS,
    CLUSTER_WEIGHT, cluster, cluster_gravity,
};
pub use collapse::{COLLAPSE_TOTAL_MASS, collapse};
pub use cradle::{CRADLE_BALLS, CRADLE_LENGTH, CRADLE_MASS, CRADLE_RADIUS, cradle};
pub use disk::{DISK_CENTRAL_MASS, DISK_INNER_RADIUS, DISK_ORBITERS_TOTAL_MASS, DISK_RADIUS, disk};
pub use double_pendulum::{
    DOUBLE_PENDULUM_LENGTH, DOUBLE_PENDULUM_MASS, DoublePendulumStart, double_pendulum,
};
pub use fountain::{FOUNTAIN_SUBSTEPS, FOUNTAIN_VX, FOUNTAIN_VY, Fountain};
pub use jelly::{
    JELLY_COLS, JELLY_DROP, JELLY_GROUND, JELLY_MASS, JELLY_ROWS, JELLY_SPACING, Jelly, JellyBody,
    SpringKind, SpringNetwork, compliance_for, jelly,
};
pub use orbit::{
    ORBIT_CIRCULAR, ORBIT_MASS_RATIO, ORBIT_NOMINAL_PERIOD, ORBIT_SEPARATION, ORBIT_SOFTENING,
    ORBIT_SUBSTEPS, ORBIT_TOTAL_MASS, orbit, orbit_gravity, orbit_period, orbit_relative_speed,
};
pub use pendulum::{PENDULUM_LENGTH, PENDULUM_MASS, pendulum, pendulum_gravity};
pub use shared::{GRAVITATIONAL_CONSTANT, STANDARD_GRAVITY, newtonian};
