#!/usr/bin/env python3
"""The boids' lane loop's build settings, swept: SWARM_LANES partial sums,
or one sum the compiler may reorder (SWARM_SUM=algebraic;
crates/swarm/src/rules/knobs.rs) at each CPU level and in wasm. The
machinery is experiments/sweep/ (its README: levels, output, flags).

    experiments/swarm-lanes/run.py --experiments sweep
    experiments/swarm-lanes/run.py --experiments loops --reference lanes-16
    experiments/swarm-lanes/run.py --levels default --quick
"""

import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / "sweep"))
from sweep import Experiment, Suite, main  # noqa: E402

EXPERIMENTS = {f"lanes-{n}": Experiment({"SWARM_LANES": str(n)}) for n in (1, 2, 4, 8, 16)}
EXPERIMENTS["algebraic"] = Experiment({"SWARM_LANES": "1", "SWARM_SUM": "algebraic"})
# The lane loop one pass per register's worth of lanes (SWARM_LOOP=grouped):
# no spills, the same bits as lanes-16 (the default). grouped-4 forces
# 4-lane passes where registers are wider (AVX2, AVX-512).
EXPERIMENTS["grouped"] = Experiment({"SWARM_LOOP": "grouped"})
EXPERIMENTS["grouped-4"] = Experiment({"SWARM_LOOP": "grouped", "SWARM_GROUP": "4"})

SUITE = Suite(
    title="Swarm lane experiments",
    package="swarm",
    knobs=("SWARM_LANES", "SWARM_SUM", "SWARM_LOOP", "SWARM_GROUP"),
    experiments=EXPERIMENTS,
    presets={"sweep": [f"lanes-{n}" for n in (1, 2, 4, 8, 16)] + ["algebraic"],
             # Against lanes-16 (`--reference lanes-16`): the shipped loop.
             "loops": ["lanes-16", "grouped", "grouped-4"]},
    reference="lanes-8",  # the code before the sweep (16 ships since)
    results=HERE / "results",
    # With one lane, add_span is inlined into Flock::step.
    functions=(("add_span", "<swarm::rules::Seen>::add_span"),
               ("flock_step", "<swarm::flock::Flock>::step")),
    filter="^swarm_step/(Brute|Sorted)/(1000|10000)$",
    perf_benches="swarm_step/Brute/10000,swarm_step/Sorted/10000",
)

if __name__ == "__main__":
    main(SUITE, __doc__)
