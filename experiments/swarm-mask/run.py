#!/usr/bin/env python3
"""The grid's scalar candidate test (Seen::add_masked), its masks written
five ways (SWARM_MASK; crates/swarm/src/rules/knobs.rs): which form
compiles well everywhere, natively and in V8 on both CPUs? The machinery
is experiments/sweep/ (its README: levels, output, flags).

    experiments/swarm-mask/run.py --levels default,x86-64-v3,native,v8-simd128
    experiments/swarm-mask/run.py --levels native,v8-simd128 --quick
"""

import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / "sweep"))
from sweep import Experiment, Suite, main  # noqa: E402

FORMS = ("convert", "select", "bits", "value", "branch")
EXPERIMENTS = {m: Experiment({"SWARM_MASK": m}) for m in FORMS}

SUITE = Suite(
    title="Swarm mask experiments",
    package="swarm",
    knobs=("SWARM_MASK",),
    experiments=EXPERIMENTS,
    reference="convert",  # what wasm and x86 shipped (#320)
    results=HERE / "results",
    # rustc's code natively, the wasm text at the v8 level.
    functions=(("step_grid", "<swarm::flock::Flock>::step_grid"),
               # The name also matches criterion's wrapper (0): the function is 1.
               ("vicsek_step", "<swarm::vicsek::Vicsek>::step", 1)),
    # V8's code from that wasm (names in the wasm are mangled symbols).
    v8_functions=(("step_grid", "5Flock9step_grid"),
                  ("vicsek_step", "6Vicsek4step")),
    v8_filter="^swarm_step/Grid/10000$|^swarm_models/vicsek/4000$",
    filter="^swarm_step/Grid/(1000|10000|100000)$|^swarm_models/vicsek/4000$",
    perf_benches="swarm_step/Grid/10000,swarm_models/vicsek/4000",
)

if __name__ == "__main__":
    main(SUITE, __doc__)
