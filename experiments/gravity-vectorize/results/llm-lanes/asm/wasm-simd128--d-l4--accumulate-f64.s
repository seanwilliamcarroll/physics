<engine::force::PairwiseGravity<f64> as engine::force::Force<f64>>::accumulate:
	.functype	<engine::force::PairwiseGravity<f64> as engine::force::Force<f64>>::accumulate (i32, i32, i32, i32) -> ()
	.local  	i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, f64, f64, f64, i32, i32, f64, f64, i32, i32, i32
	global.get __stack_pointer
	i32.const 176
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
	i32.load 16
	local.tee 5
	i32.const 536870911
	i32.gt_u
	br_if 0
	local.get 5
	i32.const 3
	i32.shl 
	local.tee 6
	i32.const 2147483641
	i32.ge_u
	br_if 0
	block 
	block 
	local.get 6
	br_if 0
	i32.const 8
	local.set 7
	i32.const 8
	local.set 8
	i32.const 8
	local.set 9
	i32.const 8
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
	i32.store 8
	local.get 4
	local.get 7
	i32.store 4
	local.get 4
	local.get 5
	i32.store 0
	local.get 4
	i32.const 0
	i32.store 20
	local.get 4
	local.get 9
	i32.store 16
	local.get 4
	local.get 5
	i32.store 12
	local.get 4
	i32.const 0
	i32.store 32
	local.get 4
	local.get 8
	i32.store 28
	local.get 4
	local.get 5
	i32.store 24
	local.get 4
	i32.const 0
	i32.store 44
	local.get 4
	local.get 10
	i32.store 40
	local.get 4
	local.get 5
	i32.store 36
	i32.const 0
	local.set 12
	i32.const 0
	local.set 13
	i32.const 0
	local.set 6
	block 
	local.get 1
	i32.load 40
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
	i32.load 36
	local.set 16
	local.get 1
	i32.load 12
	local.set 1
	i32.const 0
	local.set 14
	i32.const 0
	local.set 6
	loop 
	local.get 16
	local.get 14
	i32.add 
	f64.load 0
	local.set 17
	local.get 1
	i32.const 8
	i32.add 
	f64.load 0
	local.set 18
	local.get 1
	f64.load 0
	local.set 19
	block 
	local.get 6
	local.get 5
	i32.ne 
	br_if 0
	local.get 4
	call <alloc::raw_vec::RawVec<f64>>::grow_one
	local.get 4
	i32.load 4
	local.set 7
	local.get 4
	i32.load 0
	local.set 5
	end_block
	local.get 7
	local.get 14
	i32.add 
	local.get 19
	f64.store 0
	local.get 4
	local.get 6
	i32.const 1
	i32.add 
	local.tee 6
	i32.store 8
	block 
	local.get 4
	i32.load 20
	local.tee 20
	local.get 4
	i32.load 12
	i32.ne 
	br_if 0
	local.get 4
	i32.const 12
	i32.add 
	call <alloc::raw_vec::RawVec<f64>>::grow_one
	end_block
	local.get 4
	i32.load 16
	local.tee 9
	local.get 20
	i32.const 3
	i32.shl 
	i32.add 
	local.get 18
	f64.store 0
	local.get 4
	local.get 20
	i32.const 1
	i32.add 
	local.tee 11
	i32.store 20
	f64.const 0x0p0
	f64.const 0x1p0
	local.get 17
	f64.div 
	local.get 17
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.set 18
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
	call <alloc::raw_vec::RawVec<f64>>::grow_one
	end_block
	local.get 4
	i32.load 28
	local.tee 8
	local.get 20
	i32.const 3
	i32.shl 
	i32.add 
	local.get 18
	f64.store 0
	local.get 4
	local.get 20
	i32.const 1
	i32.add 
	local.tee 12
	i32.store 32
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
	call <alloc::raw_vec::RawVec<f64>>::grow_one
	end_block
	local.get 4
	i32.load 40
	local.tee 10
	local.get 20
	i32.const 3
	i32.shl 
	i32.add 
	local.get 17
	f64.store 0
	local.get 4
	local.get 20
	i32.const 1
	i32.add 
	local.tee 13
	i32.store 44
	local.get 1
	i32.const 16
	i32.add 
	local.set 1
	local.get 14
	i32.const 8
	i32.add 
	local.set 14
	local.get 15
	local.get 6
	i32.ne 
	br_if 0
	end_loop
	end_block
	block 
	block 
	local.get 3
	br_if 0
	i32.const 8
	local.set 5
	i32.const 8
	local.set 7
	br 1
	end_block
	local.get 3
	i32.const 3
	i32.shl 
	local.tee 16
	call malloc
	local.tee 5
	i32.eqz
	br_if 6
	local.get 3
	i32.const 3
	i32.and 
	local.set 20
	i32.const 0
	local.set 7
	block 
	block 
	local.get 3
	i32.const 4
	i32.lt_u
	br_if 0
	local.get 3
	i32.const 134217724
	i32.and 
	local.set 15
	i32.const 0
	local.set 7
	local.get 5
	local.set 14
	local.get 2
	local.set 1
	loop 
	local.get 14
	local.get 1
	i32.const 16
	i32.add 
	local.get 1
	v128.load64_zero 0
	v128.load64_lane 0, 1
	v128.store 0:p2align=3
	local.get 14
	local.get 1
	i32.const 48
	i32.add 
	local.get 1
	i32.const 32
	i32.add 
	v128.load64_zero 0
	v128.load64_lane 0, 1
	v128.store 16:p2align=3
	local.get 14
	i32.const 32
	i32.add 
	local.set 14
	local.get 1
	i32.const 64
	i32.add 
	local.set 1
	local.get 15
	local.get 7
	i32.const 4
	i32.add 
	local.tee 7
	i32.ne 
	br_if 0
	end_loop
	local.get 20
	i32.eqz
	br_if 1
	end_block
	local.get 2
	local.get 7
	i32.const 4
	i32.shl 
	i32.add 
	local.set 1
	local.get 5
	local.get 7
	i32.const 3
	i32.shl 
	i32.add 
	local.set 14
	loop 
	local.get 14
	local.get 1
	f64.load 0
	f64.store 0
	local.get 1
	i32.const 16
	i32.add 
	local.set 1
	local.get 14
	i32.const 8
	i32.add 
	local.set 14
	local.get 20
	i32.const -1
	i32.add 
	local.tee 20
	br_if 0
	end_loop
	end_block
	local.get 16
	call malloc
	local.tee 7
	i32.eqz
	br_if 7
	local.get 3
	i32.const 3
	i32.and 
	local.set 20
	i32.const 0
	local.set 15
	block 
	local.get 3
	i32.const 4
	i32.lt_u
	br_if 0
	local.get 2
	i32.const 56
	i32.add 
	local.set 1
	local.get 3
	i32.const 134217724
	i32.and 
	local.set 16
	i32.const 0
	local.set 15
	local.get 7
	local.set 14
	loop 
	local.get 14
	local.get 1
	local.get 1
	i32.const -16
	i32.add 
	v128.load64_zero 0
	v128.load64_lane 0, 1
	v128.store 16:p2align=3
	local.get 14
	local.get 1
	i32.const -32
	i32.add 
	local.get 1
	i32.const -48
	i32.add 
	v128.load64_zero 0
	v128.load64_lane 0, 1
	v128.store 0:p2align=3
	local.get 14
	i32.const 32
	i32.add 
	local.set 14
	local.get 1
	i32.const 64
	i32.add 
	local.set 1
	local.get 16
	local.get 15
	i32.const 4
	i32.add 
	local.tee 15
	i32.ne 
	br_if 0
	end_loop
	local.get 20
	i32.eqz
	br_if 1
	end_block
	local.get 7
	local.get 15
	i32.const 3
	i32.shl 
	i32.add 
	local.set 1
	local.get 15
	i32.const 4
	i32.shl 
	local.get 2
	i32.add 
	i32.const 8
	i32.add 
	local.set 14
	loop 
	local.get 1
	local.get 14
	f64.load 0
	f64.store 0
	local.get 14
	i32.const 16
	i32.add 
	local.set 14
	local.get 1
	i32.const 8
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
	i32.const 3
	i32.shl 
	local.set 21
	local.get 4
	i32.const 112
	i32.add 
	local.set 16
	local.get 0
	f64.load 8
	local.set 22
	local.get 0
	f64.load 0
	local.set 23
	i32.const 0
	local.set 1
	local.get 4
	i32.load 4
	local.set 24
	i32.const 0
	local.set 14
	loop 
	local.get 11
	local.get 14
	i32.add 
	local.tee 0
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
	local.get 5
	local.get 1
	i32.add 
	local.set 20
	local.get 7
	local.get 1
	i32.add 
	local.set 15
	local.get 9
	local.get 1
	i32.add 
	local.tee 25
	f64.load 0
	local.set 18
	local.get 24
	local.get 1
	i32.add 
	local.tee 26
	f64.load 0
	local.set 19
	local.get 10
	local.get 1
	i32.add 
	f64.load 0
	local.set 17
	local.get 4
	local.get 8
	local.get 1
	i32.add 
	f64.load 0
	local.get 23
	f64.mul 
	f64.store 160
	local.get 4
	local.get 18
	f64.store 152
	local.get 4
	local.get 19
	f64.store 144
	local.get 4
	i32.const 80
	i32.add 
	local.get 4
	i32.const 144
	i32.add 
	local.get 22
	local.get 26
	i32.const 8
	i32.add 
	local.get 6
	local.get 14
	i32.add 
	i32.const -1
	i32.add 
	local.get 25
	i32.const 8
	i32.add 
	local.get 0
	i32.const -1
	i32.add 
	local.get 1
	i32.const 8
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
	local.get 5
	i32.add 
	local.get 14
	local.get 3
	i32.add 
	local.tee 0
	local.get 1
	local.get 7
	i32.add 
	local.get 0
	call engine::force::sweep::<f64>
	local.get 4
	local.get 4
	v128.load 96:p2align=3
	v128.store 160:p2align=3
	local.get 4
	local.get 4
	v128.load 80:p2align=3
	v128.store 144:p2align=3
	local.get 4
	local.get 16
	v128.load 16:p2align=3
	v128.store 64:p2align=3
	local.get 4
	local.get 16
	v128.load 0:p2align=3
	v128.store 48:p2align=3
	local.get 20
	local.get 17
	local.get 4
	i32.const 144
	i32.add 
	i32.const 4
	call engine::force::tree_sum::<f64>
	f64.mul 
	local.get 20
	f64.load 0
	f64.add 
	f64.store 0
	local.get 4
	local.get 4
	v128.load 64:p2align=3
	v128.store 96:p2align=3
	local.get 4
	local.get 4
	v128.load 48:p2align=3
	v128.store 80:p2align=3
	local.get 15
	local.get 17
	local.get 4
	i32.const 80
	i32.add 
	i32.const 4
	call engine::force::tree_sum::<f64>
	f64.mul 
	local.get 15
	f64.load 0
	f64.add 
	f64.store 0
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
	i32.const 1
	i32.eq 
	br_if 0
	local.get 3
	i32.const 1
	i32.and 
	local.set 13
	local.get 3
	i32.const -2
	i32.and 
	local.set 12
	local.get 3
	i32.const 3
	i32.shl 
	i32.const -16
	i32.and 
	local.set 8
	i32.const 0
	local.set 1
	local.get 2
	local.set 6
	loop 
	local.get 6
	i32.const 8
	i32.add 
	local.get 7
	local.get 1
	i32.add 
	local.tee 14
	f64.load 0
	f64.store 0
	local.get 6
	local.get 5
	local.get 1
	i32.add 
	local.tee 20
	f64.load 0
	f64.store 0
	local.get 6
	i32.const 24
	i32.add 
	local.get 14
	i32.const 8
	i32.add 
	f64.load 0
	f64.store 0
	local.get 6
	i32.const 16
	i32.add 
	local.get 20
	i32.const 8
	i32.add 
	f64.load 0
	f64.store 0
	local.get 6
	i32.const 32
	i32.add 
	local.set 6
	local.get 8
	local.get 1
	i32.const 16
	i32.add 
	local.tee 1
	i32.ne 
	br_if 0
	end_loop
	local.get 13
	i32.eqz
	br_if 1
	end_block
	local.get 2
	local.get 12
	i32.const 4
	i32.shl 
	i32.add 
	local.tee 6
	local.get 7
	local.get 12
	i32.const 3
	i32.shl 
	local.tee 1
	i32.add 
	f64.load 0
	f64.store 8
	local.get 6
	local.get 5
	local.get 1
	i32.add 
	f64.load 0
	f64.store 0
	end_block
	local.get 7
	call free
	local.get 5
	call free
	end_block
	block 
	local.get 4
	i32.load 36
	i32.eqz
	br_if 0
	local.get 10
	call free
	end_block
	block 
	local.get 4
	i32.load 24
	i32.eqz
	br_if 0
	local.get 4
	i32.load 28
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
	block 
	local.get 4
	i32.load 0
	i32.eqz
	br_if 0
	local.get 4
	i32.load 4
	call free
	end_block
	local.get 4
	i32.const 176
	i32.add 
	global.set __stack_pointer
	return
	end_block
	call alloc::raw_vec::capacity_overflow
	unreachable
	end_block
	i32.const 8
	local.get 6
	call alloc::raw_vec::handle_error
	unreachable
	end_block
	i32.const 8
	local.get 6
	call alloc::raw_vec::handle_error
	unreachable
	end_block
	i32.const 8
	local.get 6
	call alloc::raw_vec::handle_error
	unreachable
	end_block
	i32.const 8
	local.get 6
	call alloc::raw_vec::handle_error
	unreachable
	end_block
	i32.const 8
	local.get 16
	call alloc::raw_vec::handle_error
	unreachable
	end_block
	i32.const 8
	local.get 16
	call alloc::raw_vec::handle_error
	unreachable
	end_function
