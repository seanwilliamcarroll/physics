//! What `cargo xtask smoke` loads and what each load must show. One case
//! table for every milestone's pages, so it grows here, not in the runner.

/// What a case must show.
#[derive(Copy, Clone)]
pub(super) enum Check {
    /// Physics stepped and particles were drawn ([`judge`](super::judge)).
    Draws,
    /// A deliberate Rust panic reached the console via the hook ([`judge_panic`](super::judge_panic)).
    PanicReported,
}

/// One page load to check: a name (for the screenshot), the page (relative
/// to `site/`), a URL query, and what it must show.
pub(super) struct Case {
    pub(super) name: &'static str,
    pub(super) page: &'static str,
    pub(super) query: &'static str,
    pub(super) check: Check,
}

const M0: &str = "demos/m0-hello/";
const M1: &str = "demos/m1-orbits/";
const M2: &str = "demos/m2-cluster/";
const M3: &str = "demos/m3-pendulum/";
const M4_CHAIN: &str = "demos/m4-chain/";
const M4_DP: &str = "demos/m4-double-pendulum/";

/// M0: default settings, the other scalar, the size that once rendered a
/// blank canvas (one path over Chrome's ~16 MiB draw-command limit), and
/// the panic hook. M1: all three orbit panels must draw and report finite
/// energy, in both scalars. M2: both panels on the default disk, the
/// unsoftened collapse (energy must stay finite through the blow-up), and
/// a heavier cluster. M3: both solver panels, default and the f32 stress
/// case (100 substeps). M4: the chain (both solver panels) and the double
/// pendulum in both comparison modes.
pub(super) const CASES: [Case; 14] = [
    Case {
        name: "default",
        page: M0,
        query: "?smoke",
        check: Check::Draws,
    },
    Case {
        name: "f64",
        page: M0,
        query: "?smoke&scalar=f64&n=1000",
        check: Check::Draws,
    },
    Case {
        name: "500k",
        page: M0,
        query: "?smoke&n=500000",
        check: Check::Draws,
    },
    Case {
        name: "panic",
        page: M0,
        query: "?smoke&panic",
        check: Check::PanicReported,
    },
    Case {
        name: "orbits",
        page: M1,
        query: "?smoke",
        check: Check::Draws,
    },
    Case {
        name: "orbits32",
        page: M1,
        query: "?smoke&scalar=f32",
        check: Check::Draws,
    },
    Case {
        name: "m2",
        page: M2,
        query: "?smoke",
        check: Check::Draws,
    },
    Case {
        name: "m2eps0",
        page: M2,
        query: "?smoke&scene=collapse&eps_mm=0",
        check: Check::Draws,
    },
    Case {
        name: "m2n1024",
        page: M2,
        query: "?smoke&scene=cluster&n=1024",
        check: Check::Draws,
    },
    Case {
        name: "m3",
        page: M3,
        query: "?smoke",
        check: Check::Draws,
    },
    Case {
        name: "m3f32",
        page: M3,
        query: "?smoke&scalar=f32&substeps=100&beta_pct=0",
        check: Check::Draws,
    },
    Case {
        name: "m4chain",
        page: M4_CHAIN,
        query: "?smoke",
        check: Check::Draws,
    },
    Case {
        name: "m4dp",
        page: M4_DP,
        query: "?smoke",
        check: Check::Draws,
    },
    Case {
        name: "m4dp32",
        page: M4_DP,
        query: "?smoke&mode=scalar",
        check: Check::Draws,
    },
];
