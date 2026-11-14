# Coverage

Lines and functions the native Rust tests run (`cargo xtask coverage`, `docs/04-testing.md`, "Coverage"). Recorded by `cargo xtask coverage --record`; every later run compares with it.

- **Commit:** `dd5bd46` (nightly CI: record coverage on the runner (record_coverage), since coverage differs by machine (#271))
- **Date:** 2026-11-14
- **Toolchain:** rustc 1.99.1 (58cf8f9c3 2026-10-13)

## By crate

| Crate | Lines | Functions |
|---|---:|---:|
| `acoustic-web` | 98.82% (251/254) | 100.00% (64/64) |
| `acoustic` | 92.98% (1575/1694) | 94.02% (236/251) |
| `engine-web` | 98.08% (971/990) | 98.52% (200/203) |
| `engine` | 97.35% (2828/2905) | 98.13% (368/375) |
| `math` | 98.17% (161/164) | 97.78% (44/45) |
| `sand-web` | 100.00% (150/150) | 100.00% (38/38) |
| `sand` | 100.00% (359/359) | 100.00% (66/66) |
| `swarm-web` | 99.88% (805/806) | 100.00% (181/181) |
| `swarm` | 98.63% (1659/1682) | 98.63% (216/219) |
| `web-common` | 100.00% (69/69) | 100.00% (15/15) |
| **total** | 97.30% (8828/9073) | 98.01% (1428/1457) |

## By file

| File | Lines | Functions |
|---|---:|---:|
| `acoustic-web/src/exports.rs` | 98.33% (118/120) | 100.00% (40/40) |
| `acoustic-web/src/synth.rs` | 99.25% (133/134) | 100.00% (24/24) |
| `acoustic/src/body.rs` | 100.00% (35/35) | 100.00% (5/5) |
| `acoustic/src/bridge.rs` | 100.00% (82/82) | 100.00% (6/6) |
| `acoustic/src/delay_line.rs` | 100.00% (79/79) | 100.00% (16/16) |
| `acoustic/src/dispersion.rs` | 99.22% (128/129) | 100.00% (19/19) |
| `acoustic/src/dispersion/refine.rs` | 97.47% (77/79) | 100.00% (13/13) |
| `acoustic/src/excitation.rs` | 100.00% (29/29) | 100.00% (6/6) |
| `acoustic/src/fft.rs` | 99.02% (101/102) | 100.00% (10/10) |
| `acoustic/src/hammer.rs` | 100.00% (119/119) | 100.00% (17/17) |
| `acoustic/src/hammer/contact.rs` | 97.14% (34/35) | 100.00% (2/2) |
| `acoustic/src/hammer/fit.rs` | 0.00% (0/101) | 0.00% (0/15) |
| `acoustic/src/hammer/keys.rs` | 100.00% (26/26) | 100.00% (7/7) |
| `acoustic/src/measure.rs` | 98.25% (112/114) | 100.00% (16/16) |
| `acoustic/src/piano.rs` | 100.00% (27/27) | 100.00% (8/8) |
| `acoustic/src/solve.rs` | 95.35% (41/43) | 100.00% (7/7) |
| `acoustic/src/stiffness.rs` | 100.00% (4/4) | 100.00% (1/1) |
| `acoustic/src/string.rs` | 97.96% (48/49) | 100.00% (12/12) |
| `acoustic/src/unison.rs` | 99.09% (109/110) | 100.00% (16/16) |
| `acoustic/src/voices.rs` | 97.91% (187/191) | 100.00% (22/22) |
| `acoustic/src/voices/strike.rs` | 96.77% (60/62) | 100.00% (8/8) |
| `acoustic/src/voicing.rs` | 100.00% (70/70) | 100.00% (8/8) |
| `acoustic/src/waveguide.rs` | 99.39% (163/164) | 100.00% (32/32) |
| `acoustic/src/waveguide/strike.rs` | 100.00% (44/44) | 100.00% (5/5) |
| `engine-web/src/demo.rs` | 99.19% (123/124) | 100.00% (24/24) |
| `engine-web/src/demo/any_world.rs` | 100.00% (10/10) | 100.00% (2/2) |
| `engine-web/src/demo/codes.rs` | 100.00% (55/55) | 100.00% (8/8) |
| `engine-web/src/demo/collisions.rs` | 100.00% (71/71) | 100.00% (11/11) |
| `engine-web/src/demo/constraint_scenes.rs` | 100.00% (24/24) | 100.00% (2/2) |
| `engine-web/src/demo/drag.rs` | 96.83% (61/63) | 100.00% (11/11) |
| `engine-web/src/demo/jelly.rs` | 100.00% (24/24) | 100.00% (4/4) |
| `engine-web/src/demo/pool.rs` | 98.21% (110/112) | 100.00% (21/21) |
| `engine-web/src/demo/sim.rs` | 95.95% (142/148) | 100.00% (22/22) |
| `engine-web/src/exports/collisions.rs` | 100.00% (62/62) | 100.00% (19/19) |
| `engine-web/src/exports/drag.rs` | 100.00% (24/24) | 100.00% (6/6) |
| `engine-web/src/exports/lifecycle.rs` | 95.56% (86/90) | 95.24% (20/21) |
| `engine-web/src/exports/pool.rs` | 95.35% (82/86) | 92.59% (25/27) |
| `engine-web/src/exports/readouts.rs` | 100.00% (22/22) | 100.00% (6/6) |
| `engine-web/src/exports/settings.rs` | 100.00% (75/75) | 100.00% (19/19) |
| `engine/src/barnes_hut.rs` | 100.00% (96/96) | 100.00% (10/10) |
| `engine/src/barnes_hut/tree.rs` | 98.98% (97/98) | 100.00% (10/10) |
| `engine/src/collision/broadphase.rs` | 100.00% (100/100) | 100.00% (18/18) |
| `engine/src/collision/narrowphase.rs` | 99.26% (134/135) | 100.00% (11/11) |
| `engine/src/collision/narrowphase/properties.rs` | 100.00% (36/36) | 100.00% (5/5) |
| `engine/src/collision/pocket.rs` | 100.00% (12/12) | 100.00% (4/4) |
| `engine/src/collision/segment.rs` | 100.00% (34/34) | 100.00% (6/6) |
| `engine/src/collision/tunnel.rs` | 96.92% (63/65) | 100.00% (7/7) |
| `engine/src/collision/wall.rs` | 100.00% (12/12) | 100.00% (3/3) |
| `engine/src/constraint.rs` | 94.55% (52/55) | 90.00% (9/10) |
| `engine/src/diagnostics.rs` | 99.09% (109/110) | 100.00% (25/25) |
| `engine/src/force.rs` | 100.00% (49/49) | 100.00% (8/8) |
| `engine/src/force/spring.rs` | 97.53% (79/81) | 100.00% (14/14) |
| `engine/src/integrate.rs` | 100.00% (75/75) | 100.00% (7/7) |
| `engine/src/params.rs` | 100.00% (9/9) | 100.00% (3/3) |
| `engine/src/params/baumgarte.rs` | 100.00% (3/3) | 100.00% (1/1) |
| `engine/src/params/mass.rs` | 100.00% (16/16) | 100.00% (4/4) |
| `engine/src/params/softening.rs` | 100.00% (3/3) | 100.00% (1/1) |
| `engine/src/params/time_step.rs` | 100.00% (3/3) | 100.00% (1/1) |
| `engine/src/particles.rs` | 95.90% (117/122) | 96.15% (25/26) |
| `engine/src/scenarios/ball_box.rs` | 100.00% (38/38) | 100.00% (1/1) |
| `engine/src/scenarios/billiards.rs` | 100.00% (99/99) | 100.00% (6/6) |
| `engine/src/scenarios/break_shot.rs` | 100.00% (28/28) | 100.00% (1/1) |
| `engine/src/scenarios/chain.rs` | 100.00% (22/22) | 100.00% (1/1) |
| `engine/src/scenarios/cluster.rs` | 100.00% (31/31) | 100.00% (4/4) |
| `engine/src/scenarios/collapse.rs` | 100.00% (11/11) | 100.00% (1/1) |
| `engine/src/scenarios/cradle.rs` | 100.00% (26/26) | 100.00% (1/1) |
| `engine/src/scenarios/disk.rs` | 100.00% (62/62) | 100.00% (10/10) |
| `engine/src/scenarios/double_pendulum.rs` | 100.00% (29/29) | 100.00% (2/2) |
| `engine/src/scenarios/fountain.rs` | 100.00% (30/30) | 100.00% (4/4) |
| `engine/src/scenarios/jelly.rs` | 100.00% (85/85) | 100.00% (8/8) |
| `engine/src/scenarios/orbit.rs` | 100.00% (34/34) | 100.00% (5/5) |
| `engine/src/scenarios/pendulum.rs` | 100.00% (17/17) | 100.00% (2/2) |
| `engine/src/scenarios/shared.rs` | 100.00% (29/29) | 100.00% (7/7) |
| `engine/src/solver.rs` | 100.00% (29/29) | 100.00% (5/5) |
| `engine/src/solver/contacts.rs` | 98.41% (186/189) | 100.00% (20/20) |
| `engine/src/solver/impacts.rs` | 98.68% (150/152) | 100.00% (9/9) |
| `engine/src/solver/impulse.rs` | 89.76% (149/166) | 90.00% (9/10) |
| `engine/src/solver/impulse/contact_solve.rs` | 92.06% (58/63) | 100.00% (5/5) |
| `engine/src/solver/xpbd.rs` | 90.91% (100/110) | 100.00% (6/6) |
| `engine/src/sort_key.rs` | 100.00% (20/20) | 100.00% (7/7) |
| `engine/src/table.rs` | 87.14% (61/70) | 62.50% (5/8) |
| `engine/src/world.rs` | 98.25% (168/171) | 97.22% (35/36) |
| `engine/src/world/config_error.rs` | 50.00% (6/12) | 100.00% (1/1) |
| `engine/src/world/constraints.rs` | 98.21% (110/112) | 100.00% (12/12) |
| `engine/src/world/drag.rs` | 95.56% (43/45) | 100.00% (7/7) |
| `engine/src/world/ground.rs` | 100.00% (17/17) | 100.00% (4/4) |
| `engine/src/world/pockets.rs` | 98.08% (51/52) | 100.00% (9/9) |
| `engine/src/world/table.rs` | 95.24% (40/42) | 100.00% (9/9) |
| `math/src/convert.rs` | 100.00% (28/28) | 100.00% (7/7) |
| `math/src/hash.rs` | 78.57% (11/14) | 75.00% (3/4) |
| `math/src/rng.rs` | 100.00% (18/18) | 100.00% (4/4) |
| `math/src/scalar.rs` | 100.00% (30/30) | 100.00% (10/10) |
| `math/src/unit_vec2.rs` | 100.00% (30/30) | 100.00% (6/6) |
| `math/src/vec2.rs` | 100.00% (44/44) | 100.00% (14/14) |
| `sand-web/src/demo.rs` | 100.00% (67/67) | 100.00% (13/13) |
| `sand-web/src/exports.rs` | 100.00% (83/83) | 100.00% (25/25) |
| `sand/src/grid.rs` | 100.00% (102/102) | 100.00% (21/21) |
| `sand/src/material.rs` | 100.00% (27/27) | 100.00% (6/6) |
| `sand/src/random.rs` | 100.00% (8/8) | 100.00% (1/1) |
| `sand/src/rules.rs` | 100.00% (222/222) | 100.00% (38/38) |
| `swarm-web/src/ant_demo.rs` | 100.00% (145/145) | 100.00% (19/19) |
| `swarm-web/src/ant_exports.rs` | 100.00% (107/107) | 100.00% (30/30) |
| `swarm-web/src/demo.rs` | 99.17% (119/120) | 100.00% (20/20) |
| `swarm-web/src/exports.rs` | 100.00% (93/93) | 100.00% (27/27) |
| `swarm-web/src/slime_demo.rs` | 100.00% (107/107) | 100.00% (22/22) |
| `swarm-web/src/slime_exports.rs` | 100.00% (81/81) | 100.00% (25/25) |
| `swarm-web/src/vicsek_demo.rs` | 100.00% (72/72) | 100.00% (13/13) |
| `swarm-web/src/vicsek_exports.rs` | 100.00% (81/81) | 100.00% (25/25) |
| `swarm/src/ants.rs` | 99.47% (374/376) | 100.00% (50/50) |
| `swarm/src/evolve.rs` | 96.93% (158/163) | 96.30% (26/27) |
| `swarm/src/field.rs` | 98.34% (178/181) | 100.00% (24/24) |
| `swarm/src/flock.rs` | 98.59% (210/213) | 96.88% (31/32) |
| `swarm/src/grid.rs` | 97.60% (122/125) | 100.00% (17/17) |
| `swarm/src/params.rs` | 100.00% (30/30) | 100.00% (6/6) |
| `swarm/src/physarum.rs` | 99.50% (200/201) | 100.00% (23/23) |
| `swarm/src/rules.rs` | 100.00% (160/160) | 100.00% (9/9) |
| `swarm/src/vicsek.rs` | 97.42% (227/233) | 96.77% (30/31) |
| `web-common/src/boundary.rs` | 100.00% (6/6) | 100.00% (1/1) |
| `web-common/src/fixed_step.rs` | 100.00% (62/62) | 100.00% (13/13) |
| `web-common/src/panic_hook.rs` | 100.00% (1/1) | 100.00% (1/1) |
