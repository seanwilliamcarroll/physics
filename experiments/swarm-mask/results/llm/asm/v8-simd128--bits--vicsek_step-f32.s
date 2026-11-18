
    Finished `release` profile [optimized] target(s) in 0.01s
.section .text.<criterion::bencher::Bencher>::iter_batched_ref::<swarm::vicsek::Vicsek, (), step::models::{closure#0}::{closure#1}, <swarm::vicsek::Vicsek>::step>,"",@
.type	<criterion::bencher::Bencher>::iter_batched_ref::<swarm::vicsek::Vicsek, (), step::models::{closure#0}::{closure#1}, <swarm::vicsek::Vicsek>::step>,@function
<criterion::bencher::Bencher>::iter_batched_ref::<swarm::vicsek::Vicsek, (), step::models::{closure#0}::{closure#1}, <swarm::vicsek::Vicsek>::step>:
	.functype	<criterion::bencher::Bencher>::iter_batched_ref::<swarm::vicsek::Vicsek, (), step::models::{closure#0}::{closure#1}, <swarm::vicsek::Vicsek>::step> (i32, i32) -> ()
	.local  	i32, i64, i64, i64, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, f32, i32, i64, i64, i64, f32, i32, i32, i32, i32, i32, i32, i32, i64
	global.get __stack_pointer
	i32.const 416
	i32.sub 
	local.tee 2
	global.set __stack_pointer
	local.get 0
	i32.const 1
	i32.store8 44
	local.get 0
	i64.load 32
	local.tee 3
	i64.const 999
	i64.add 
	local.tee 4
	i64.const 1000
	i64.div_u
	local.set 5
	block 
	block 
	block 
	block 
	block 
	block 
	block 
	block 
	block 
	block 
	block 
	block 
	block 
	local.get 4
	i64.const 999
	i64.le_u
	br_if 0
	block 
	i32.const _CLOCK_MONOTONIC
	local.get 2
	i32.const 224
	i32.add 
	call clock_gettime
	i32.const -1
	i32.ne 
	br_if 0
	i32.const 0
	i64.load32_u errno
	local.set 4
	block 
	i32.const 0
	i32.load core::io::error::os_functions::OS_FUNCTIONS
	i32.const .Lanon.3633481a4dc2d6f92794ed7d38d85325.86
	i32.eq 
	br_if 0
	i32.const 0
	i32.const .Lanon.3633481a4dc2d6f92794ed7d38d85325.86
	i32.store core::io::error::os_functions::OS_FUNCTIONS
	end_block
	local.get 2
	local.get 4
	i64.const 32
	i64.shl 
	i64.store 16
	i32.const .Lanon.c449b7347331b772985a5e03369dd809.88
	i32.const 43
	local.get 2
	i32.const 16
	i32.add 
	i32.const .Lanon.3633481a4dc2d6f92794ed7d38d85325.105
	i32.const .Lanon.3633481a4dc2d6f92794ed7d38d85325.108
	call core::result::unwrap_failed
	unreachable
	end_block
	local.get 2
	i32.load 232
	local.tee 6
	i32.const 1000000000
	i32.ge_u
	br_if 1
	local.get 2
	i64.load 224
	local.set 4
	i32.const 0
	local.set 7
	local.get 0
	i32.const 0
	i32.store 8
	i64.const 0
	local.set 8
	local.get 0
	i64.const 0
	i64.store 0
	local.get 2
	local.get 6
	i32.store 8
	local.get 2
	local.get 4
	i64.store 0
	local.get 3
	i64.const -1
	i64.add 
	i64.const 1000
	i64.lt_u
	br_if 9
	local.get 1
	i32.const 48
	i32.add 
	local.set 9
	local.get 1
	i32.const 172
	i32.add 
	local.set 10
	local.get 1
	i32.load 128
	local.tee 11
	i32.const 2
	i32.shl 
	local.set 12
	local.get 1
	i32.load 116
	local.tee 6
	i32.const 2
	i32.shl 
	local.set 13
	local.get 1
	i32.load 104
	local.tee 7
	i32.const 2
	i32.shl 
	local.set 14
	local.get 1
	i32.load 124
	local.set 15
	local.get 1
	i32.load 112
	local.set 16
	local.get 1
	i32.load 100
	local.set 17
	local.get 1
	i32.load 140
	local.set 18
	local.get 1
	i32.load 136
	local.set 19
	local.get 1
	f32.load 132
	local.set 20
	local.get 1
	i32.load8_u 184
	local.set 21
	local.get 1
	i64.load 160
	local.set 22
	local.get 1
	i64.load 152
	local.set 23
	local.get 1
	i64.load 144
	local.set 24
	local.get 1
	f32.load 168
	local.set 25
	local.get 2
	i32.const 224
	i32.add 
	i32.const 48
	i32.add 
	local.set 26
	local.get 2
	i32.const 224
	i32.add 
	i32.const 172
	i32.add 
	local.set 27
	loop 
	block 
	block 
	local.get 3
	local.get 8
	i64.sub 
	local.tee 4
	local.get 5
	local.get 4
	local.get 5
	i64.lt_u
	i64.select
	local.tee 3
	i64.const 4294967295
	i64.gt_u
	local.tee 28
	i32.eqz
	br_if 0
	i32.const 0
	local.set 29
	local.get 2
	i32.const 224
	i32.add 
	local.set 30
	br 1
	end_block
	local.get 2
	i32.const 1
	i32.store 224
	local.get 3
	i32.wrap_i64
	local.set 29
	local.get 2
	i32.const 208
	i32.add 
	local.set 30
	end_block
	local.get 30
	local.get 29
	i32.store 0
	block 
	block 
	local.get 2
	i32.load 224
	i32.const 1
	i32.ne 
	br_if 0
	local.get 2
	i32.load 208
	local.tee 29
	i32.const 11184811
	i32.ge_u
	br_if 5
	i32.const 0
	local.set 31
	block 
	block 
	local.get 29
	i32.const 192
	i32.mul 
	local.tee 32
	br_if 0
	i32.const 8
	local.set 30
	i32.const 0
	local.set 29
	br 1
	end_block
	local.get 32
	call malloc
	local.tee 30
	i32.eqz
	br_if 7
	end_block
	local.get 2
	i32.const 0
	i32.store 24
	local.get 2
	local.get 30
	i32.store 20
	local.get 2
	local.get 29
	i32.store 16
	local.get 2
	i32.const 224
	i32.add 
	local.set 32
	block 
	local.get 28
	br_if 0
	local.get 2
	i32.const 1
	i32.store 224
	local.get 3
	i32.wrap_i64
	local.set 31
	local.get 2
	i32.const 208
	i32.add 
	local.set 32
	end_block
	local.get 32
	local.get 31
	i32.store 0
	block 
	local.get 2
	i32.load 224
	i32.const 1
	i32.ne 
	br_if 0
	i32.const 0
	local.set 32
	block 
	local.get 2
	i32.load 208
	local.tee 28
	local.get 29
	i32.le_u
	br_if 0
	local.get 2
	i32.const 16
	i32.add 
	i32.const 0
	local.get 28
	i32.const 8
	i32.const 192
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	local.get 2
	i32.load 20
	local.set 30
	local.get 2
	i32.load 24
	local.set 32
	end_block
	local.get 30
	local.get 32
	i32.const 192
	i32.mul 
	i32.add 
	local.set 29
	local.get 3
	local.set 4
	loop 
	local.get 27
	local.get 10
	i32.load 8
	i32.store 8
	local.get 27
	local.get 10
	i64.load 0:p2align=2
	i64.store 0:p2align=2
	local.get 2
	i32.const 224
	i32.add 
	local.get 1
	call <swarm::flock::Boids as core::clone::Clone>::clone
	local.get 26
	local.get 9
	call <swarm::flock::Boids as core::clone::Clone>::clone
	i32.const 4
	local.set 28
	i32.const 4
	local.set 30
	block 
	local.get 7
	i32.eqz
	br_if 0
	local.get 14
	call malloc
	local.tee 30
	i32.eqz
	br_if 10
	local.get 14
	i32.eqz
	br_if 0
	local.get 30
	local.get 17
	local.get 14
	memory.copy 0, 0
	end_block
	block 
	local.get 6
	i32.eqz
	br_if 0
	local.get 13
	call malloc
	local.tee 28
	i32.eqz
	br_if 11
	local.get 13
	i32.eqz
	br_if 0
	local.get 28
	local.get 16
	local.get 13
	memory.copy 0, 0
	end_block
	block 
	block 
	local.get 11
	br_if 0
	i32.const 4
	local.set 31
	br 1
	end_block
	local.get 12
	call malloc
	local.tee 31
	i32.eqz
	br_if 12
	local.get 12
	i32.eqz
	br_if 0
	local.get 31
	local.get 15
	local.get 12
	memory.copy 0, 0
	end_block
	local.get 2
	local.get 18
	i32.store 364
	local.get 2
	local.get 19
	i32.store 360
	local.get 2
	local.get 20
	f32.store 356
	local.get 2
	local.get 25
	f32.store 392
	local.get 2
	local.get 11
	i32.store 352
	local.get 2
	local.get 31
	i32.store 348
	local.get 2
	local.get 11
	i32.store 344
	local.get 2
	local.get 6
	i32.store 340
	local.get 2
	local.get 28
	i32.store 336
	local.get 2
	local.get 6
	i32.store 332
	local.get 2
	local.get 7
	i32.store 328
	local.get 2
	local.get 30
	i32.store 324
	local.get 2
	local.get 7
	i32.store 320
	local.get 2
	local.get 21
	i32.store8 408
	local.get 2
	local.get 22
	i64.store 384
	local.get 2
	local.get 23
	i64.store 376
	local.get 2
	local.get 24
	i64.store 368
	local.get 29
	local.get 2
	i32.const 224
	i32.add 
	i32.const 192
	memory.copy 0, 0
	local.get 29
	i32.const 192
	i32.add 
	local.set 29
	local.get 32
	i32.const 1
	i32.add 
	local.set 32
	local.get 4
	i64.const -1
	i64.add 
	local.tee 4
	i64.eqz
	i32.eqz
	br_if 0
	end_loop
	local.get 2
	local.get 2
	i64.load 16:p2align=2
	i64.store 208
	local.get 2
	local.get 32
	i32.store 216
	local.get 2
	i32.const 208
	i32.add 
	local.set 29
	#APP
	#NO_APP
	i32.const _CLOCK_MONOTONIC
	local.get 2
	i32.const 224
	i32.add 
	call clock_gettime
	i32.const -1
	i32.ne 
	br_if 2
	i32.const 0
	i64.load32_u errno
	local.set 4
	block 
	i32.const 0
	i32.load core::io::error::os_functions::OS_FUNCTIONS
	i32.const .Lanon.3633481a4dc2d6f92794ed7d38d85325.86
	i32.eq 
	br_if 0
	i32.const 0
	i32.const .Lanon.3633481a4dc2d6f92794ed7d38d85325.86
	i32.store core::io::error::os_functions::OS_FUNCTIONS
	end_block
	local.get 2
	local.get 4
	i64.const 32
	i64.shl 
	i64.store 16
	i32.const .Lanon.c449b7347331b772985a5e03369dd809.88
	i32.const 43
	local.get 2
	i32.const 16
	i32.add 
	i32.const .Lanon.3633481a4dc2d6f92794ed7d38d85325.105
	i32.const .Lanon.3633481a4dc2d6f92794ed7d38d85325.108
	call core::result::unwrap_failed
	unreachable
	end_block
	i32.const .Lanon.620df3e693fab81d05a7d7c21ecf4c1b.34
	i32.const 35
	i32.const .Lanon.620df3e693fab81d05a7d7c21ecf4c1b.35
	call core::panicking::panic_fmt
	unreachable
	end_block
	i32.const .Lanon.620df3e693fab81d05a7d7c21ecf4c1b.34
	i32.const 35
	i32.const .Lanon.620df3e693fab81d05a7d7c21ecf4c1b.809
	call core::panicking::panic_fmt
	unreachable
	end_block
	local.get 2
	i32.load 232
	local.tee 31
	i32.const 1000000000
	i32.ge_u
	br_if 8
	local.get 2
	i64.load 224
	local.set 4
	block 
	local.get 2
	i32.load 216
	local.tee 28
	i32.eqz
	br_if 0
	local.get 2
	i32.load 212
	local.set 29
	local.get 28
	local.set 30
	loop 
	local.get 29
	call <swarm::vicsek::Vicsek>::step
	local.get 29
	i32.const 192
	i32.add 
	local.set 29
	local.get 30
	i32.const -1
	i32.add 
	local.tee 30
	br_if 0
	end_loop
	end_block
	local.get 2
	local.get 31
	i32.store 232
	local.get 2
	local.get 4
	i64.store 224
	local.get 2
	i32.const 16
	i32.add 
	local.get 2
	i32.const 224
	i32.add 
	call <std::time::Instant>::elapsed
	local.get 2
	i64.load 16
	local.tee 33
	local.get 0
	i64.load 0
	i64.add 
	local.tee 4
	local.get 33
	i64.lt_u
	br_if 9
	block 
	local.get 0
	i32.load 8
	local.get 2
	i32.load 24
	i32.add 
	local.tee 29
	i32.const 1000000000
	i32.lt_u
	br_if 0
	local.get 4
	i64.const -1
	i64.eq 
	br_if 10
	local.get 29
	i32.const -1000000000
	i32.add 
	local.set 29
	local.get 4
	i64.const 1
	i64.add 
	local.set 4
	end_block
	local.get 0
	local.get 29
	i32.store 8
	local.get 0
	local.get 4
	i64.store 0
	local.get 2
	local.get 28
	i32.store 232
	local.get 2
	i64.const 4294967296
	i64.store 224:p2align=2
	local.get 2
	i32.const 224
	i32.add 
	local.set 29
	#APP
	#NO_APP
	local.get 2
	i32.load 212
	local.set 28
	block 
	local.get 2
	i32.load 216
	local.tee 30
	i32.eqz
	br_if 0
	local.get 28
	local.set 29
	loop 
	local.get 29
	call core::ptr::drop_glue::<swarm::vicsek::Vicsek>
	local.get 29
	i32.const 192
	i32.add 
	local.set 29
	local.get 30
	i32.const -1
	i32.add 
	local.tee 30
	br_if 0
	end_loop
	end_block
	local.get 3
	local.get 8
	i64.add 
	local.set 8
	block 
	local.get 2
	i32.load 208
	i32.eqz
	br_if 0
	local.get 28
	call free
	end_block
	local.get 8
	local.get 0
	i64.load 32
	local.tee 3
	i64.lt_u
	br_if 0
	br 11
	end_loop
	end_block
	i32.const .Lanon.1bb1792230c10d35a2e80ba21613ff7d.8
	i32.const 57
	i32.const .Lanon.1bb1792230c10d35a2e80ba21613ff7d.10
	call core::panicking::panic_fmt
	unreachable
	end_block
	local.get 2
	i32.const .Lanon.3633481a4dc2d6f92794ed7d38d85325.96
	i64.extend_i32_u
	i64.const 32
	i64.shl 
	i64.const 2
	i64.or 
	i64.store 16
	i32.const .Lanon.c449b7347331b772985a5e03369dd809.88
	i32.const 43
	local.get 2
	i32.const 16
	i32.add 
	i32.const .Lanon.3633481a4dc2d6f92794ed7d38d85325.105
	i32.const .Lanon.3633481a4dc2d6f92794ed7d38d85325.107
	call core::result::unwrap_failed
	unreachable
	end_block
	call alloc::raw_vec::capacity_overflow
	unreachable
	end_block
	i32.const 8
	local.get 32
	call alloc::raw_vec::handle_error
	unreachable
	end_block
	i32.const 4
	local.get 14
	call alloc::raw_vec::handle_error
	unreachable
	end_block
	i32.const 4
	local.get 13
	call alloc::raw_vec::handle_error
	unreachable
	end_block
	i32.const 4
	local.get 12
	call alloc::raw_vec::handle_error
	unreachable
	end_block
	local.get 2
	i32.const .Lanon.3633481a4dc2d6f92794ed7d38d85325.96
	i64.extend_i32_u
	i64.const 32
	i64.shl 
	i64.const 2
	i64.or 
	i64.store 16
	i32.const .Lanon.c449b7347331b772985a5e03369dd809.88
	i32.const 43
	local.get 2
	i32.const 16
	i32.add 
	i32.const .Lanon.3633481a4dc2d6f92794ed7d38d85325.105
	i32.const .Lanon.3633481a4dc2d6f92794ed7d38d85325.107
	call core::result::unwrap_failed
	unreachable
	end_block
	i32.const .Lanon.620df3e693fab81d05a7d7c21ecf4c1b.692
	i32.const 30
	i32.const .Lanon.620df3e693fab81d05a7d7c21ecf4c1b.693
	call core::option::expect_failed
	unreachable
	end_block
	local.get 1
	i32.const 96
	i32.add 
	local.set 30
	local.get 1
	i32.const 48
	i32.add 
	local.set 28
	local.get 1
	i32.const 172
	i32.add 
	local.set 6
	local.get 2
	i32.const 224
	i32.add 
	i32.const 96
	i32.add 
	local.set 31
	local.get 1
	i32.load8_u 184
	local.set 32
	local.get 1
	i64.load 160
	local.set 23
	local.get 1
	i64.load 152
	local.set 24
	local.get 1
	i64.load 144
	local.set 8
	local.get 2
	i32.const 224
	i32.add 
	i32.const 48
	i32.add 
	local.set 10
	local.get 2
	i32.const 224
	i32.add 
	i32.const 172
	i32.add 
	local.set 11
	local.get 1
	f32.load 168
	local.set 20
	i64.const 0
	local.set 4
	loop 
	local.get 11
	local.get 6
	i32.load 8
	i32.store 8
	local.get 11
	local.get 6
	i64.load 0:p2align=2
	i64.store 0:p2align=2
	local.get 2
	i32.const 224
	i32.add 
	local.get 1
	call <swarm::flock::Boids as core::clone::Clone>::clone
	local.get 10
	local.get 28
	call <swarm::flock::Boids as core::clone::Clone>::clone
	local.get 31
	local.get 30
	call <swarm::grid::Grid as core::clone::Clone>::clone
	local.get 2
	local.get 32
	i32.store8 408
	local.get 2
	local.get 23
	i64.store 384
	local.get 2
	local.get 24
	i64.store 376
	local.get 2
	local.get 8
	i64.store 368
	local.get 2
	local.get 20
	f32.store 392
	local.get 2
	i32.const 16
	i32.add 
	local.get 2
	i32.const 224
	i32.add 
	i32.const 192
	memory.copy 0, 0
	local.get 2
	i32.const 16
	i32.add 
	local.set 29
	#APP
	#NO_APP
	block 
	i32.const _CLOCK_MONOTONIC
	local.get 2
	i32.const 224
	i32.add 
	call clock_gettime
	i32.const -1
	i32.ne 
	br_if 0
	i32.const 0
	i64.load32_u errno
	local.set 4
	block 
	i32.const 0
	i32.load core::io::error::os_functions::OS_FUNCTIONS
	i32.const .Lanon.3633481a4dc2d6f92794ed7d38d85325.86
	i32.eq 
	br_if 0
	i32.const 0
	i32.const .Lanon.3633481a4dc2d6f92794ed7d38d85325.86
	i32.store core::io::error::os_functions::OS_FUNCTIONS
	end_block
	local.get 2
	local.get 4
	i64.const 32
	i64.shl 
	i64.store 208
	i32.const .Lanon.c449b7347331b772985a5e03369dd809.88
	i32.const 43
	local.get 2
	i32.const 208
	i32.add 
	i32.const .Lanon.3633481a4dc2d6f92794ed7d38d85325.105
	i32.const .Lanon.3633481a4dc2d6f92794ed7d38d85325.108
	call core::result::unwrap_failed
	unreachable
	end_block
	local.get 2
	i32.load 232
	local.tee 29
	i32.const 1000000000
	i32.ge_u
	br_if 2
	local.get 2
	i64.load 224
	local.set 22
	local.get 2
	i32.const 16
	i32.add 
	call <swarm::vicsek::Vicsek>::step
	local.get 2
	local.get 29
	i32.store 232
	local.get 2
	local.get 22
	i64.store 224
	local.get 2
	i32.const 208
	i32.add 
	local.get 2
	i32.const 224
	i32.add 
	call <std::time::Instant>::elapsed
	local.get 2
	i64.load 208
	local.tee 22
	local.get 4
	i64.add 
	local.tee 4
	local.get 22
	i64.lt_u
	br_if 3
	block 
	local.get 7
	local.get 2
	i32.load 216
	i32.add 
	local.tee 7
	i32.const 1000000000
	i32.lt_u
	br_if 0
	local.get 4
	i64.const -1
	i64.eq 
	br_if 4
	local.get 7
	i32.const -1000000000
	i32.add 
	local.set 7
	local.get 4
	i64.const 1
	i64.add 
	local.set 4
	end_block
	local.get 0
	local.get 7
	i32.store 8
	local.get 0
	local.get 4
	i64.store 0
	#APP
	#NO_APP
	local.get 2
	i32.const 224
	i32.add 
	local.get 2
	i32.const 16
	i32.add 
	i32.const 192
	memory.copy 0, 0
	local.get 2
	i32.const 224
	i32.add 
	local.set 29
	#APP
	#NO_APP
	local.get 2
	i32.const 224
	i32.add 
	call core::ptr::drop_glue::<swarm::vicsek::Vicsek>
	local.get 3
	i64.const -1
	i64.add 
	local.tee 3
	i64.const 0
	i64.ne 
	br_if 0
	end_loop
	end_block
	local.get 2
	i32.const 224
	i32.add 
	local.get 2
	call <std::time::Instant>::elapsed
	local.get 2
	i64.load 224
	local.set 4
	local.get 0
	local.get 2
	i32.load 232
	i32.store 24
	local.get 0
	local.get 4
	i64.store 16
	local.get 2
	i32.const 416
	i32.add 
	global.set __stack_pointer
	return
	end_block
	local.get 2
	i32.const .Lanon.3633481a4dc2d6f92794ed7d38d85325.96
	i64.extend_i32_u
	i64.const 32
	i64.shl 
	i64.const 2
	i64.or 
	i64.store 208
	i32.const .Lanon.c449b7347331b772985a5e03369dd809.88
	i32.const 43
	local.get 2
	i32.const 208
	i32.add 
	i32.const .Lanon.3633481a4dc2d6f92794ed7d38d85325.105
	i32.const .Lanon.3633481a4dc2d6f92794ed7d38d85325.107
	call core::result::unwrap_failed
	unreachable
	end_block
	i32.const .Lanon.620df3e693fab81d05a7d7c21ecf4c1b.692
	i32.const 30
	i32.const .Lanon.620df3e693fab81d05a7d7c21ecf4c1b.693
	call core::option::expect_failed
	unreachable
	end_function
