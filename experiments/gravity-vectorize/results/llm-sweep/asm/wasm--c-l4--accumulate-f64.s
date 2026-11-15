<engine::force::PairwiseGravity<f64> as engine::force::Force<f64>>::accumulate:
	.functype	<engine::force::PairwiseGravity<f64> as engine::force::Force<f64>>::accumulate (i32, i32, i32, i32) -> ()
	.local  	i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, f64, f64, f64, i32, f64, f64, i32, i32, i32, f64, i32, i32, i32, i32, i32, i32, i32, i32, f64, f64
	global.get __stack_pointer
	i32.const 128
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
	local.set 14
	block 
	local.get 1
	i32.load 40
	local.tee 15
	local.get 5
	local.get 15
	local.get 5
	i32.lt_u
	i32.select
	local.tee 16
	i32.eqz
	br_if 0
	local.get 1
	i32.load 36
	local.set 17
	local.get 1
	i32.load 12
	local.set 1
	i32.const 0
	local.set 15
	local.get 5
	local.set 18
	i32.const 0
	local.set 13
	loop 
	local.get 17
	local.get 15
	i32.add 
	f64.load 0
	local.set 19
	local.get 1
	i32.const 8
	i32.add 
	f64.load 0
	local.set 20
	local.get 1
	f64.load 0
	local.set 21
	block 
	local.get 13
	local.get 18
	i32.ne 
	br_if 0
	local.get 4
	call <alloc::raw_vec::RawVec<f64>>::grow_one
	local.get 4
	i32.load 4
	local.set 7
	local.get 4
	i32.load 0
	local.set 18
	end_block
	local.get 7
	local.get 15
	i32.add 
	local.get 21
	f64.store 0
	local.get 4
	local.get 13
	i32.const 1
	i32.add 
	local.tee 13
	i32.store 8
	block 
	local.get 4
	i32.load 20
	local.tee 8
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
	local.get 8
	i32.const 3
	i32.shl 
	i32.add 
	local.get 20
	f64.store 0
	local.get 4
	local.get 8
	i32.const 1
	i32.add 
	local.tee 12
	i32.store 20
	f64.const 0x0p0
	f64.const 0x1p0
	local.get 19
	f64.div 
	local.get 19
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.set 20
	block 
	local.get 4
	i32.load 32
	local.tee 22
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
	local.get 22
	i32.const 3
	i32.shl 
	i32.add 
	local.get 20
	f64.store 0
	local.get 4
	local.get 22
	i32.const 1
	i32.add 
	local.tee 11
	i32.store 32
	block 
	local.get 4
	i32.load 44
	local.tee 22
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
	local.get 22
	i32.const 3
	i32.shl 
	i32.add 
	local.get 19
	f64.store 0
	local.get 4
	local.get 22
	i32.const 1
	i32.add 
	local.tee 14
	i32.store 44
	local.get 1
	i32.const 16
	i32.add 
	local.set 1
	local.get 15
	i32.const 8
	i32.add 
	local.set 15
	local.get 16
	local.get 13
	i32.ne 
	br_if 0
	end_loop
	end_block
	local.get 5
	i32.const 268435456
	i32.ge_u
	br_if 0
	local.get 0
	f64.load 8
	local.set 23
	local.get 0
	f64.load 0
	local.set 24
	i32.const 8
	local.set 25
	i32.const 8
	local.set 26
	block 
	local.get 5
	i32.eqz
	br_if 0
	local.get 6
	i32.const 1
	call calloc
	local.tee 25
	i32.eqz
	br_if 6
	local.get 6
	i32.const 1
	call calloc
	local.tee 26
	i32.eqz
	br_if 7
	end_block
	local.get 4
	i32.load 4
	local.set 17
	local.get 10
	local.set 27
	loop 
	local.get 2
	local.set 22
	local.get 17
	local.set 1
	local.get 12
	local.set 7
	local.get 11
	local.set 18
	local.get 27
	local.set 15
	block 
	block 
	local.get 14
	i32.eqz
	br_if 0
	local.get 3
	i32.eqz
	br_if 0
	local.get 13
	i32.eqz
	br_if 0
	local.get 1
	i32.eqz
	br_if 0
	local.get 7
	i32.eqz
	br_if 0
	local.get 9
	i32.eqz
	br_if 0
	local.get 18
	i32.eqz
	br_if 0
	local.get 8
	br_if 1
	end_block
	block 
	local.get 5
	i32.eqz
	br_if 0
	local.get 26
	call free
	local.get 25
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
	i32.const 128
	i32.add 
	global.set __stack_pointer
	return
	end_block
	local.get 1
	i32.const 8
	i32.add 
	local.get 17
	local.get 13
	i32.select
	local.set 17
	local.get 15
	f64.load 0
	local.set 28
	local.get 1
	f64.load 0
	local.set 19
	local.get 9
	f64.load 0
	local.set 20
	local.get 8
	f64.load 0
	local.set 21
	local.get 4
	local.get 23
	f64.store 72
	local.get 4
	local.get 24
	local.get 21
	f64.mul 
	f64.store 64
	local.get 4
	local.get 20
	f64.store 56
	local.get 4
	local.get 19
	f64.store 48
	local.get 4
	local.get 14
	i32.const -1
	i32.add 
	local.tee 14
	i32.store 124
	local.get 4
	local.get 15
	i32.const 8
	i32.add 
	local.tee 27
	i32.store 120
	local.get 4
	local.get 18
	i32.const -1
	i32.add 
	local.tee 29
	i32.store 116
	local.get 4
	local.get 8
	i32.const 8
	i32.add 
	local.tee 30
	i32.store 112
	local.get 4
	local.get 7
	i32.const -1
	i32.add 
	local.tee 31
	i32.store 108
	local.get 4
	local.get 9
	i32.const 8
	i32.add 
	local.tee 32
	i32.store 104
	local.get 4
	local.get 13
	i32.const -1
	i32.add 
	local.get 13
	local.get 13
	i32.select
	local.tee 13
	i32.store 100
	local.get 4
	local.get 17
	i32.store 96
	local.get 4
	local.get 5
	i32.store 92
	local.get 4
	local.get 26
	i32.store 88
	local.get 4
	local.get 5
	i32.store 84
	local.get 4
	local.get 25
	i32.store 80
	local.get 4
	i32.const 48
	i32.add 
	local.get 4
	i32.const 96
	i32.add 
	local.get 22
	i32.const 16
	i32.add 
	local.tee 33
	local.get 3
	i32.const -1
	i32.add 
	local.tee 0
	local.get 4
	i32.const 80
	i32.add 
	call engine::force::pass_one::<f64>
	local.get 4
	i64.const 0
	i64.store 120
	local.get 4
	i64.const 0
	i64.store 112
	local.get 4
	i64.const 0
	i64.store 104
	local.get 4
	i64.const 0
	i64.store 96
	i32.const 8
	local.get 25
	local.get 0
	local.get 5
	i32.gt_u
	local.tee 34
	i32.select
	local.set 16
	i32.const 0
	local.get 0
	local.get 34
	i32.select
	local.tee 35
	i32.const 134217724
	i32.and 
	local.set 36
	block 
	local.get 35
	i32.const 3
	i32.shl 
	i32.const 1073741792
	i32.and 
	local.tee 6
	i32.eqz
	br_if 0
	f64.const 0x0p0
	local.set 19
	f64.const 0x0p0
	local.set 20
	f64.const 0x0p0
	local.set 21
	f64.const 0x0p0
	local.set 37
	local.get 16
	local.set 1
	block 
	local.get 6
	i32.const -32
	i32.add 
	local.tee 15
	i32.const 32
	i32.and 
	br_if 0
	local.get 16
	i32.const 32
	i32.add 
	local.set 1
	local.get 16
	f64.load 24
	f64.const 0x0p0
	f64.add 
	local.set 19
	local.get 16
	f64.load 16
	f64.const 0x0p0
	f64.add 
	local.set 20
	local.get 16
	f64.load 8
	f64.const 0x0p0
	f64.add 
	local.set 21
	local.get 16
	f64.load 0
	f64.const 0x0p0
	f64.add 
	local.set 37
	end_block
	block 
	local.get 15
	i32.eqz
	br_if 0
	local.get 16
	local.get 6
	i32.add 
	local.set 15
	loop 
	local.get 37
	local.get 1
	f64.load 0
	f64.add 
	local.get 1
	i32.const 32
	i32.add 
	f64.load 0
	f64.add 
	local.set 37
	local.get 19
	local.get 1
	i32.const 24
	i32.add 
	f64.load 0
	f64.add 
	local.get 1
	i32.const 56
	i32.add 
	f64.load 0
	f64.add 
	local.set 19
	local.get 20
	local.get 1
	i32.const 16
	i32.add 
	f64.load 0
	f64.add 
	local.get 1
	i32.const 48
	i32.add 
	f64.load 0
	f64.add 
	local.set 20
	local.get 21
	local.get 1
	i32.const 8
	i32.add 
	f64.load 0
	f64.add 
	local.get 1
	i32.const 40
	i32.add 
	f64.load 0
	f64.add 
	local.set 21
	local.get 1
	i32.const 64
	i32.add 
	local.tee 1
	local.get 15
	i32.ne 
	br_if 0
	end_loop
	end_block
	local.get 4
	local.get 19
	f64.store 120
	local.get 4
	local.get 20
	f64.store 112
	local.get 4
	local.get 21
	f64.store 104
	local.get 4
	local.get 37
	f64.store 96
	end_block
	local.get 36
	i32.const 3
	i32.shl 
	local.set 36
	block 
	local.get 35
	i32.const 3
	i32.and 
	local.tee 35
	i32.eqz
	br_if 0
	local.get 4
	local.get 16
	local.get 36
	i32.add 
	local.tee 1
	f64.load 0
	local.get 4
	f64.load 96
	f64.add 
	f64.store 96
	local.get 35
	i32.const 1
	i32.eq 
	br_if 0
	local.get 4
	local.get 1
	f64.load 8
	local.get 4
	f64.load 104
	f64.add 
	f64.store 104
	local.get 35
	i32.const 2
	i32.eq 
	br_if 0
	local.get 4
	local.get 1
	f64.load 16
	local.get 4
	f64.load 112
	f64.add 
	f64.store 112
	end_block
	local.get 4
	i32.const 96
	i32.add 
	i32.const 4
	call engine::force::tree_sum::<f64>
	local.set 38
	local.get 4
	i64.const 0
	i64.store 120
	local.get 4
	i64.const 0
	i64.store 112
	local.get 4
	i64.const 0
	i64.store 104
	local.get 4
	i64.const 0
	i64.store 96
	i32.const 8
	local.get 26
	local.get 34
	i32.select
	local.set 16
	block 
	local.get 6
	i32.eqz
	br_if 0
	f64.const 0x0p0
	local.set 19
	f64.const 0x0p0
	local.set 20
	f64.const 0x0p0
	local.set 21
	f64.const 0x0p0
	local.set 37
	local.get 16
	local.set 1
	block 
	local.get 6
	i32.const -32
	i32.add 
	local.tee 15
	i32.const 32
	i32.and 
	br_if 0
	local.get 16
	i32.const 32
	i32.add 
	local.set 1
	local.get 16
	f64.load 24
	f64.const 0x0p0
	f64.add 
	local.set 19
	local.get 16
	f64.load 16
	f64.const 0x0p0
	f64.add 
	local.set 20
	local.get 16
	f64.load 8
	f64.const 0x0p0
	f64.add 
	local.set 21
	local.get 16
	f64.load 0
	f64.const 0x0p0
	f64.add 
	local.set 37
	end_block
	block 
	local.get 15
	i32.eqz
	br_if 0
	local.get 16
	local.get 6
	i32.add 
	local.set 15
	loop 
	local.get 37
	local.get 1
	f64.load 0
	f64.add 
	local.get 1
	i32.const 32
	i32.add 
	f64.load 0
	f64.add 
	local.set 37
	local.get 19
	local.get 1
	i32.const 24
	i32.add 
	f64.load 0
	f64.add 
	local.get 1
	i32.const 56
	i32.add 
	f64.load 0
	f64.add 
	local.set 19
	local.get 20
	local.get 1
	i32.const 16
	i32.add 
	f64.load 0
	f64.add 
	local.get 1
	i32.const 48
	i32.add 
	f64.load 0
	f64.add 
	local.set 20
	local.get 21
	local.get 1
	i32.const 8
	i32.add 
	f64.load 0
	f64.add 
	local.get 1
	i32.const 40
	i32.add 
	f64.load 0
	f64.add 
	local.set 21
	local.get 1
	i32.const 64
	i32.add 
	local.tee 1
	local.get 15
	i32.ne 
	br_if 0
	end_loop
	end_block
	local.get 4
	local.get 19
	f64.store 120
	local.get 4
	local.get 20
	f64.store 112
	local.get 4
	local.get 21
	f64.store 104
	local.get 4
	local.get 37
	f64.store 96
	end_block
	block 
	local.get 35
	i32.eqz
	br_if 0
	local.get 4
	local.get 16
	local.get 36
	i32.add 
	local.tee 1
	f64.load 0
	local.get 4
	f64.load 96
	f64.add 
	f64.store 96
	local.get 35
	i32.const 1
	i32.eq 
	br_if 0
	local.get 4
	local.get 1
	f64.load 8
	local.get 4
	f64.load 104
	f64.add 
	f64.store 104
	local.get 35
	i32.const 2
	i32.eq 
	br_if 0
	local.get 4
	local.get 1
	f64.load 16
	local.get 4
	f64.load 112
	f64.add 
	f64.store 112
	end_block
	local.get 29
	local.get 11
	local.get 18
	i32.select
	local.set 11
	local.get 30
	local.get 8
	local.get 18
	i32.select
	local.set 8
	local.get 31
	local.get 12
	local.get 7
	i32.select
	local.set 12
	local.get 32
	local.get 9
	local.get 7
	i32.select
	local.set 9
	local.get 33
	local.get 2
	local.get 3
	i32.select
	local.set 2
	local.get 0
	local.get 3
	local.get 3
	i32.select
	local.set 3
	local.get 4
	i32.const 96
	i32.add 
	i32.const 4
	call engine::force::tree_sum::<f64>
	local.set 19
	local.get 22
	local.get 28
	local.get 38
	f64.mul 
	local.get 22
	f64.load 0
	f64.add 
	f64.store 0
	local.get 22
	local.get 28
	local.get 19
	f64.mul 
	local.get 22
	f64.load 8
	f64.add 
	f64.store 8
	br 0
	end_loop
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
	local.get 6
	call alloc::raw_vec::handle_error
	unreachable
	end_block
	i32.const 8
	local.get 6
	call alloc::raw_vec::handle_error
	unreachable
	end_function
