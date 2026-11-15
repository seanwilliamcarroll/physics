<engine::force::PairwiseGravity<f32> as engine::force::Force<f32>>::accumulate:
	.functype	<engine::force::PairwiseGravity<f32> as engine::force::Force<f32>>::accumulate (i32, i32, i32, i32) -> ()
	.local  	i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, f32, f32, f32, i32, i32, f32, f32, i32, i32, v128, v128
	global.get __stack_pointer
	i32.const 80
	i32.sub 
	local.tee 4
	global.set __stack_pointer
	block 
	block 
	block 
	block 
	block 
	block 
	block 
	local.get 1
	i32.load 8
	local.tee 5
	i32.const 1073741823
	i32.gt_u
	br_if 0
	local.get 5
	i32.const 2
	i32.shl 
	local.tee 6
	i32.const 2147483645
	i32.ge_u
	br_if 0
	block 
	block 
	local.get 6
	br_if 0
	i32.const 4
	local.set 7
	i32.const 4
	local.set 8
	i32.const 4
	local.set 9
	i32.const 4
	local.set 10
	br 1
	end_block
	local.get 6
	call malloc
	local.tee 7
	i32.eqz
	br_if 2
	local.get 6
	call malloc
	local.tee 9
	i32.eqz
	br_if 3
	local.get 6
	call malloc
	local.tee 8
	i32.eqz
	br_if 4
	local.get 6
	call malloc
	local.tee 10
	i32.eqz
	br_if 5
	end_block
	i32.const 0
	local.set 11
	local.get 4
	i32.const 0
	i32.store 20
	local.get 4
	local.get 7
	i32.store 16
	local.get 4
	local.get 5
	i32.store 12
	local.get 4
	i32.const 0
	i32.store 32
	local.get 4
	local.get 9
	i32.store 28
	local.get 4
	local.get 5
	i32.store 24
	local.get 4
	i32.const 0
	i32.store 44
	local.get 4
	local.get 8
	i32.store 40
	local.get 4
	local.get 5
	i32.store 36
	local.get 4
	i32.const 0
	i32.store 56
	local.get 4
	local.get 10
	i32.store 52
	local.get 4
	local.get 5
	i32.store 48
	i32.const 0
	local.set 12
	i32.const 0
	local.set 13
	i32.const 0
	local.set 6
	block 
	local.get 1
	i32.load 32
	local.tee 14
	local.get 5
	local.get 14
	local.get 5
	i32.lt_u
	i32.select
	local.tee 15
	i32.eqz
	br_if 0
	local.get 1
	i32.load 28
	local.set 16
	local.get 1
	i32.load 4
	local.set 1
	i32.const 0
	local.set 14
	i32.const 0
	local.set 6
	loop 
	local.get 16
	local.get 14
	i32.add 
	f32.load 0
	local.set 17
	local.get 1
	i32.const 4
	i32.add 
	f32.load 0
	local.set 18
	local.get 1
	f32.load 0
	local.set 19
	block 
	local.get 6
	local.get 5
	i32.ne 
	br_if 0
	local.get 4
	i32.const 12
	i32.add 
	call <alloc::raw_vec::RawVec<alloc::boxed::Box<regex_automata::meta::regex::Cache>>>::grow_one
	local.get 4
	i32.load 16
	local.set 7
	local.get 4
	i32.load 12
	local.set 5
	end_block
	local.get 7
	local.get 14
	i32.add 
	local.get 19
	f32.store 0
	local.get 4
	local.get 6
	i32.const 1
	i32.add 
	local.tee 6
	i32.store 20
	block 
	local.get 4
	i32.load 32
	local.tee 20
	local.get 4
	i32.load 24
	i32.ne 
	br_if 0
	local.get 4
	i32.const 24
	i32.add 
	call <alloc::raw_vec::RawVec<alloc::boxed::Box<regex_automata::meta::regex::Cache>>>::grow_one
	end_block
	local.get 4
	i32.load 28
	local.tee 9
	local.get 20
	i32.const 2
	i32.shl 
	i32.add 
	local.get 18
	f32.store 0
	local.get 4
	local.get 20
	i32.const 1
	i32.add 
	local.tee 11
	i32.store 32
	f32.const 0x0p0
	f32.const 0x1p0
	local.get 17
	f32.div 
	local.get 17
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.set 18
	block 
	local.get 4
	i32.load 44
	local.tee 20
	local.get 4
	i32.load 36
	i32.ne 
	br_if 0
	local.get 4
	i32.const 36
	i32.add 
	call <alloc::raw_vec::RawVec<alloc::boxed::Box<regex_automata::meta::regex::Cache>>>::grow_one
	end_block
	local.get 4
	i32.load 40
	local.tee 8
	local.get 20
	i32.const 2
	i32.shl 
	i32.add 
	local.get 18
	f32.store 0
	local.get 4
	local.get 20
	i32.const 1
	i32.add 
	local.tee 12
	i32.store 44
	block 
	local.get 4
	i32.load 56
	local.tee 20
	local.get 4
	i32.load 48
	i32.ne 
	br_if 0
	local.get 4
	i32.const 48
	i32.add 
	call <alloc::raw_vec::RawVec<alloc::boxed::Box<regex_automata::meta::regex::Cache>>>::grow_one
	end_block
	local.get 4
	i32.load 52
	local.tee 10
	local.get 20
	i32.const 2
	i32.shl 
	i32.add 
	local.get 17
	f32.store 0
	local.get 4
	local.get 20
	i32.const 1
	i32.add 
	local.tee 13
	i32.store 56
	local.get 1
	i32.const 8
	i32.add 
	local.set 1
	local.get 14
	i32.const 4
	i32.add 
	local.set 14
	local.get 15
	local.get 6
	i32.ne 
	br_if 0
	end_loop
	end_block
	block 
	local.get 3
	br_if 0
	i32.const 4
	local.set 7
	i32.const 4
	local.set 15
	br 7
	end_block
	block 
	local.get 3
	i32.const 2
	i32.shl 
	local.tee 16
	call malloc
	local.tee 7
	i32.eqz
	br_if 0
	i32.const 0
	local.set 20
	local.get 3
	i32.const 4
	i32.le_u
	br_if 6
	local.get 2
	local.set 1
	local.get 7
	local.set 14
	local.get 3
	local.get 3
	i32.const 3
	i32.and 
	local.tee 20
	i32.const 4
	local.get 20
	i32.select
	i32.sub 
	local.tee 20
	local.set 5
	loop 
	local.get 14
	local.get 1
	local.get 1
	v128.load 0:p2align=2
	local.get 1
	v128.load64_zero 16:p2align=2
	i8x16.shuffle 0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 0, 1, 2, 3
	v128.load32_lane 24, 3
	v128.store 0:p2align=2
	local.get 1
	i32.const 32
	i32.add 
	local.set 1
	local.get 14
	i32.const 16
	i32.add 
	local.set 14
	local.get 5
	i32.const -4
	i32.add 
	local.tee 5
	br_if 0
	br 7
	end_loop
	end_block
	i32.const 4
	local.get 16
	call alloc::raw_vec::handle_error
	unreachable
	end_block
	call alloc::raw_vec::capacity_overflow
	unreachable
	end_block
	i32.const 4
	local.get 6
	call alloc::raw_vec::handle_error
	unreachable
	end_block
	i32.const 4
	local.get 6
	call alloc::raw_vec::handle_error
	unreachable
	end_block
	i32.const 4
	local.get 6
	call alloc::raw_vec::handle_error
	unreachable
	end_block
	i32.const 4
	local.get 6
	call alloc::raw_vec::handle_error
	unreachable
	end_block
	local.get 2
	local.get 20
	i32.const 3
	i32.shl 
	i32.add 
	local.set 1
	local.get 7
	local.get 20
	i32.const 2
	i32.shl 
	i32.add 
	local.set 14
	loop 
	local.get 14
	local.get 1
	f32.load 0
	f32.store 0
	local.get 1
	i32.const 8
	i32.add 
	local.set 1
	local.get 14
	i32.const 4
	i32.add 
	local.set 14
	local.get 3
	local.get 20
	i32.const 1
	i32.add 
	local.tee 20
	i32.ne 
	br_if 0
	end_loop
	block 
	block 
	local.get 16
	call malloc
	local.tee 15
	i32.eqz
	br_if 0
	i32.const 0
	local.set 5
	local.get 3
	i32.const 4
	i32.le_u
	br_if 1
	local.get 2
	i32.const 4
	i32.add 
	local.set 1
	local.get 15
	local.set 14
	local.get 3
	local.get 3
	i32.const 3
	i32.and 
	local.tee 20
	i32.const 4
	local.get 20
	i32.select
	i32.sub 
	local.tee 5
	local.set 20
	loop 
	local.get 14
	local.get 1
	local.get 1
	v128.load 0:p2align=2
	local.get 1
	v128.load64_zero 16:p2align=2
	i8x16.shuffle 0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 0, 1, 2, 3
	v128.load32_lane 24, 3
	v128.store 0:p2align=2
	local.get 1
	i32.const 32
	i32.add 
	local.set 1
	local.get 14
	i32.const 16
	i32.add 
	local.set 14
	local.get 20
	i32.const -4
	i32.add 
	local.tee 20
	br_if 0
	br 2
	end_loop
	end_block
	i32.const 4
	local.get 16
	call alloc::raw_vec::handle_error
	unreachable
	end_block
	local.get 3
	local.get 5
	i32.sub 
	local.set 20
	local.get 15
	local.get 5
	i32.const 2
	i32.shl 
	i32.add 
	local.set 1
	local.get 5
	i32.const 3
	i32.shl 
	local.get 2
	i32.add 
	i32.const 4
	i32.add 
	local.set 14
	loop 
	local.get 1
	local.get 14
	f32.load 0
	f32.store 0
	local.get 14
	i32.const 8
	i32.add 
	local.set 14
	local.get 1
	i32.const 4
	i32.add 
	local.set 1
	local.get 20
	i32.const -1
	i32.add 
	local.tee 20
	br_if 0
	end_loop
	end_block
	block 
	local.get 6
	i32.eqz
	br_if 0
	local.get 3
	i32.const 2
	i32.shl 
	local.set 21
	local.get 0
	f32.load 4
	local.set 22
	local.get 0
	f32.load 0
	local.set 23
	i32.const 0
	local.set 1
	local.get 4
	i32.load 16
	local.set 24
	i32.const 0
	local.set 14
	loop 
	local.get 11
	local.get 14
	i32.add 
	local.tee 16
	i32.eqz
	br_if 1
	local.get 12
	local.get 14
	i32.add 
	i32.eqz
	br_if 1
	local.get 13
	local.get 14
	i32.add 
	i32.eqz
	br_if 1
	local.get 21
	local.get 1
	i32.eq 
	br_if 1
	local.get 7
	local.get 1
	i32.add 
	local.set 20
	local.get 15
	local.get 1
	i32.add 
	local.set 5
	local.get 9
	local.get 1
	i32.add 
	local.tee 0
	f32.load 0
	local.set 18
	local.get 24
	local.get 1
	i32.add 
	local.tee 25
	f32.load 0
	local.set 19
	local.get 10
	local.get 1
	i32.add 
	f32.load 0
	local.set 17
	local.get 4
	local.get 8
	local.get 1
	i32.add 
	f32.load 0
	local.get 23
	f32.mul 
	f32.store 76
	local.get 4
	local.get 18
	f32.store 72
	local.get 4
	local.get 19
	f32.store 68
	local.get 4
	i32.const 60
	i32.add 
	local.get 4
	i32.const 68
	i32.add 
	local.get 22
	local.get 25
	i32.const 4
	i32.add 
	local.get 6
	local.get 14
	i32.add 
	i32.const -1
	i32.add 
	local.get 0
	i32.const 4
	i32.add 
	local.get 16
	i32.const -1
	i32.add 
	local.get 1
	i32.const 4
	i32.add 
	local.tee 1
	local.get 8
	i32.add 
	local.get 14
	i32.const -1
	i32.add 
	local.tee 14
	local.get 12
	i32.add 
	local.get 1
	local.get 10
	i32.add 
	local.get 14
	local.get 13
	i32.add 
	local.get 1
	local.get 7
	i32.add 
	local.get 14
	local.get 3
	i32.add 
	local.tee 16
	local.get 1
	local.get 15
	i32.add 
	local.get 16
	call engine::force::sweep::<f32>
	local.get 4
	f32.load 64
	local.set 18
	local.get 20
	local.get 17
	local.get 4
	f32.load 60
	f32.mul 
	local.get 20
	f32.load 0
	f32.add 
	f32.store 0
	local.get 5
	local.get 17
	local.get 18
	f32.mul 
	local.get 5
	f32.load 0
	f32.add 
	f32.store 0
	local.get 6
	local.get 14
	i32.add 
	br_if 0
	end_loop
	end_block
	block 
	local.get 3
	i32.eqz
	br_if 0
	i32.const 0
	local.set 12
	block 
	block 
	local.get 3
	i32.const 4
	i32.lt_u
	br_if 0
	local.get 2
	local.set 6
	local.get 7
	local.set 1
	local.get 15
	local.set 14
	local.get 3
	i32.const 268435452
	i32.and 
	local.tee 12
	local.set 20
	loop 
	local.get 6
	local.get 1
	v128.load 0:p2align=2
	local.tee 26
	local.get 14
	v128.load 0:p2align=2
	local.tee 27
	i8x16.shuffle 8, 9, 10, 11, 24, 25, 26, 27, 12, 13, 14, 15, 28, 29, 30, 31
	v128.store 16:p2align=2
	local.get 6
	local.get 26
	local.get 27
	i8x16.shuffle 0, 1, 2, 3, 16, 17, 18, 19, 4, 5, 6, 7, 20, 21, 22, 23
	v128.store 0:p2align=2
	local.get 6
	i32.const 32
	i32.add 
	local.set 6
	local.get 1
	i32.const 16
	i32.add 
	local.set 1
	local.get 14
	i32.const 16
	i32.add 
	local.set 14
	local.get 20
	i32.const -4
	i32.add 
	local.tee 20
	br_if 0
	end_loop
	local.get 3
	local.get 12
	i32.eq 
	br_if 1
	end_block
	local.get 3
	local.get 12
	i32.sub 
	local.set 20
	local.get 2
	local.get 12
	i32.const 3
	i32.shl 
	i32.add 
	local.set 6
	local.get 7
	local.get 12
	i32.const 2
	i32.shl 
	local.tee 14
	i32.add 
	local.set 1
	local.get 15
	local.get 14
	i32.add 
	local.set 14
	loop 
	local.get 6
	i32.const 4
	i32.add 
	local.get 14
	f32.load 0
	f32.store 0
	local.get 6
	local.get 1
	f32.load 0
	f32.store 0
	local.get 6
	i32.const 8
	i32.add 
	local.set 6
	local.get 1
	i32.const 4
	i32.add 
	local.set 1
	local.get 14
	i32.const 4
	i32.add 
	local.set 14
	local.get 20
	i32.const -1
	i32.add 
	local.tee 20
	br_if 0
	end_loop
	end_block
	local.get 15
	call free
	local.get 7
	call free
	end_block
	block 
	local.get 4
	i32.load 48
	i32.eqz
	br_if 0
	local.get 10
	call free
	end_block
	block 
	local.get 4
	i32.load 36
	i32.eqz
	br_if 0
	local.get 8
	call free
	end_block
	block 
	local.get 4
	i32.load 24
	i32.eqz
	br_if 0
	local.get 9
	call free
	end_block
	block 
	local.get 4
	i32.load 12
	i32.eqz
	br_if 0
	local.get 4
	i32.load 16
	call free
	end_block
	local.get 4
	i32.const 80
	i32.add 
	global.set __stack_pointer
	end_function
