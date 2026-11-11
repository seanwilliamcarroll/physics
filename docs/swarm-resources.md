# Swarm Intelligence Simulation: Resources

_As of 2026-11-02_

## Foundational papers

Start with Reynolds (flocking) and Jones (slime mold). Together they cover the two families of model you saw in videos: agents that react to each other, and agents that react to a shared field.

| Paper | Year | Why read it | Link |
| --- | --- | --- | --- |
| Reynolds, "Flocks, Herds, and Schools: A Distributed Behavioral Model" (SIGGRAPH '87) | 1987 | The original boids paper: separation, alignment, cohesion, using local perception only | [HTML reprint](https://www.cs.toronto.edu/~dt/siggraph97-course/cwr87/) · [DOI](https://doi.org/10.1145/37402.37406) |
| Reynolds, "Steering Behaviors For Autonomous Characters" (GDC '99) | 1999 | Seek, flee, arrive, wander, obstacle avoidance, path following: the toolkit for task-driven agents | [Paper](http://www.red3d.com/cwr/steer/gdc99/) |
| Reynolds, "Interaction with Groups of Autonomous Characters" (GDC 2000) | 2000 | Running large crowds in real time on a PS2, using spatial data structures for neighbor lookup | [PDF](https://www.cs.princeton.edu/courses/archive/spr01/cs598b/papers/reynolds00.pdf) |
| Vicsek et al., "Novel Type of Phase Transition in a System of Self-Driven Particles" (PRL 75) | 1995 | The physicist's minimal flocking model: one alignment rule plus noise, with an order-disorder transition | [arXiv](https://arxiv.org/abs/cond-mat/0611743) |
| Couzin et al., "Collective Memory and Spatial Sorting in Animal Groups" (J. Theor. Biol. 218) | 2002 | Zones of repulsion, orientation, and attraction; swarm, torus, and parallel-group regimes as parameters change | [PDF](https://www.cs.princeton.edu/courses/archive/fall24/cos597C/bib/couzinKJRF.pdf) |
| Dorigo, Maniezzo, Colorni, "Ant System: Optimization by a Colony of Cooperating Agents" (IEEE SMC-B 26) | 1996 | Pheromone deposit and evaporation as positive feedback, applied to the traveling salesman problem | [PDF](https://staff.washington.edu/paymana/swarm/dorigo96-itsmc.pdf) · [DOI](https://doi.org/10.1109/3477.484436) |
| Kennedy and Eberhart, "Particle Swarm Optimization" (ICNN '95) | 1995 | Swarm dynamics used as a search over a cost landscape, with no visual creatures | [DOI](https://doi.org/10.1109/ICNN.1995.488968) |
| Jones, "Characteristics of Pattern Formation and Evolution in Approximations of Physarum Transport Networks" (Artificial Life 16) | 2010 | The slime mold model behind most Physarum visuals: agents sense and deposit on a diffusing trail map | [Repository](https://uwe-repository.worktribe.com/output/980579) · [DOI](https://doi.org/10.1162/artl.2010.16.2.16202) |
| Jones, "Influences on the Formation and Evolution of Physarum Polycephalum Inspired Emergent Transport Networks" (Natural Computing 10) | 2011 | Follow-up: the networks approximate Steiner trees and proximity graphs, so the swarm solves a real problem | [Repository](https://uwe-repository.worktribe.com/output/985963/influences-on-the-formation-and-evolution-of-physarum-polycephalum-inspired-emergent-transport-networks) |

The PSO paper has no open PDF that I could confirm. The DOI goes to IEEE Xplore.

## Tutorials, explainers and videos

The Lague videos are likely the ones you remember seeing. The Nature of Code chapter is the clearest written walkthrough of steering and flocking.

| Resource | Type | What it covers | Link |
| --- | --- | --- | --- |
| Craig Reynolds' boids page | Web page | Reynolds' own overview of the model, plus a large index of later flocking work | [red3d.com/cwr/boids](http://www.red3d.com/cwr/boids/) |
| Shiffman, *The Nature of Code*, Ch. 5 "Autonomous Agents" | Free online book chapter | Steering force = desired velocity − current velocity; seek, path following, flow-field following, flocking | [natureofcode.com](https://natureofcode.com/autonomous-agents/) |
| Sebastian Lague, "Coding Adventure: Boids" | Video (8 min) | 3D boids with obstacle avoidance on the GPU | [YouTube](https://www.youtube.com/watch?v=bqtqltqcQhw) · [source](https://github.com/SebLague/Boids) |
| Sebastian Lague, "Coding Adventure: Ant and Slime Simulations" | Video (18 min) | Ant colony optimization on TSP, pheromone-only ant foraging, and multi-species slime as a compute shader | [YouTube](https://www.youtube.com/watch?v=X-iSQQgOd1A) · [slime source](https://github.com/SebLague/Slime-Simulation) · [ant source](https://github.com/SebLague/Ant-Simulation) |
| Sage Jenson, "physarum" | Illustrated blog post | The Jones algorithm step by step (sense, rotate, move, deposit, diffuse, decay) with its parameters | [sagejenson.com/physarum](https://sagejenson.com/physarum) |
| Ben Eater, boids | Interactive web demo | Minimal 2D boids in the browser, with readable JavaScript | [eater.net/boids](https://eater.net/boids) |
| Processing, "Flocking" example | Code example | Shiffman's compact reference flocking implementation | [processing.org](https://processing.org/examples/flocking.html) |

## Implementation and performance

Naive neighbor search is O(n²). The standard fix is a uniform grid sorted by cell ID, which is the same broad phase your physics engine needs.

| Resource | What it covers | Link |
| --- | --- | --- |
| Hunter Adams, ECE 4760 "Boids Lab" (RP2040) | The successor to Bruce Land's course: boids in fixed point, multicore, an alpha-max-beta-min speed clamp, and DMA/PIO, pushing for the largest flock at 30 fps | [Lab](https://vha3.github.io/Pico/Animal_Movement/Boids_Lab.html) · [Algorithm and pseudocode](https://vha3.github.io/Pico/Animal_Movement/Boids-algorithm.html) |
| Land, "Fixed point on RP2040" | Timing of the s15x16 and s1x14 formats against float on a core without an FPU | [Page](https://people.ece.cornell.edu/land/courses/ece4760/RP2040/C_SDK_fixed_pt/index_fixed.html) |
| ECE 5760 final project, "FPGA-accelerated Boid Algorithm Simulation on VGA" (2023) | Moving the boid update into dedicated hardware to beat roughly 3,000 boids on the ARM core | [Report](https://people.ece.cornell.edu/land/courses/ece5760/FinalProjects/s2023/yw2464_yl2924_mah426/yw2464_yl2924_mah426/index.html) |
| Le Grand, *GPU Gems 3* Ch. 32, "Broad-Phase Collision Detection with CUDA" | Sort-and-sweep versus spatial subdivision: hash cell IDs, sort, and walk runs of equal cells in parallel | [Free online chapter](https://developer.nvidia.com/gpugems/gpugems3/part-v-physics-simulation/chapter-32-broad-phase-collision-detection-cuda) |
| wgpu `boids` example | A compute pass updates the boids and a render pass draws them; WGSL shaders that port cleanly to WebGPU in wasm | [Source](https://wgpu.rs/doc/src/wgpu_examples/boids/mod.rs.html) |

## Books and broader reading

To give a swarm a task harder than foraging, the TERMES work on collective construction is the clearest model to build toward.

| Resource | What it covers | Link |
| --- | --- | --- |
| Bonabeau, Dorigo, Theraulaz, *Swarm Intelligence: From Natural to Artificial Systems* (Oxford UP, 1999) | The field's founding textbook: ant foraging and routing, division of labor, brood sorting, nest building, cooperative transport | [JASSS review](https://jasss.org/4/1/reviews/kluegl.html) |
| Shiffman, *The Nature of Code* (2nd ed.) | Free online book; the evolutionary computing chapter pairs well with evolving swarm rule parameters | [natureofcode.com](https://natureofcode.com/) |
| Werfel, Petersen, Nagpal, "Designing Collective Behavior in a Termite-Inspired Robot Construction Team" (Science 343, 2014) | Robots build a user-specified 3D structure through stigmergy alone, with no central controller | [PDF](https://ssr.princeton.edu/sites/g/files/toruqf2946/files/documents/science2014-termes.pdf) · [DOI](https://doi.org/10.1126/science.1245842) · [Harvard summary](https://seas.harvard.edu/news/2014/02/robotic-construction-crew-needs-no-foreman) |
| Justin Werfel's publication list | Earlier collective construction papers, including extended stigmergy (2006) and the TERMES algorithms | [Homepage](https://people.seas.harvard.edu/~jkwerfel/) |
