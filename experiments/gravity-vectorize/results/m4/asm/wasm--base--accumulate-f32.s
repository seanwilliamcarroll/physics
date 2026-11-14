<engine::force::PairwiseGravity<f32> as engine::force::Force<f32>>::accumulate:
	.functype	<engine::force::PairwiseGravity<f32> as engine::force::Force<f32>>::accumulate (i32, i32, i32, i32) -> ()
	.local  	i32, i32, i32, i32, i32, i32, i64, f32, i32, i32, f32, f32, i32, i32, i32, f32, f32, f32, f32, f32, f32, i32, f32, f32, f32
	block 
	block 
	local.get 1
	i32.load 32
	local.tee 4
	local.get 1
	i32.load 8
	local.tee 5
	local.get 4
	local.get 5
	i32.lt_u
	i32.select
	local.tee 6
	i32.const 268435455
	i32.gt_u
	br_if 0
	local.get 6
	i32.const 4
	i32.shl 
	local.tee 7
	i32.const 2147483645
	i32.ge_u
	br_if 0
	local.get 1
	i32.load 28
	local.set 4
	local.get 1
	i32.load 4
	local.set 5
	block 
	block 
	block 
	local.get 7
	br_if 0
	i32.const 4
	local.set 8
	i32.const 0
	local.set 9
	br 1
	end_block
	local.get 6
	local.set 9
	local.get 7
	call malloc
	local.tee 8
	i32.eqz
	br_if 1
	end_block
	block 
	local.get 6
	i32.eqz
	br_if 0
	local.get 6
	local.set 7
	local.get 8
	local.set 1
	loop 
	local.get 5
	i64.load 0:p2align=2
	local.set 10
	local.get 1
	i32.const 12
	i32.add 
	local.get 4
	f32.load 0
	local.tee 11
	f32.store 0
	local.get 1
	local.get 10
	i64.store 0:p2align=2
	local.get 1
	i32.const 8
	i32.add 
	f32.const 0x0p0
	f32.const 0x1p0
	local.get 11
	f32.div 
	local.get 11
	f32.const 0x0p0
	f32.eq 
	f32.select
	f32.store 0
	local.get 5
	i32.const 8
	i32.add 
	local.set 5
	local.get 4
	i32.const 4
	i32.add 
	local.set 4
	local.get 1
	i32.const 16
	i32.add 
	local.set 1
	local.get 7
	i32.const -1
	i32.add 
	local.tee 7
	br_if 0
	end_loop
	end_block
	local.get 3
	i32.eqz
	br_if 2
	local.get 6
	i32.const 268435455
	i32.add 
	local.set 12
	local.get 3
	i32.const 536870911
	i32.add 
	local.set 13
	local.get 0
	f32.load 0
	local.set 14
	local.get 0
	f32.load 4
	local.set 15
	local.get 8
	local.set 0
	loop 
	local.get 6
	i32.eqz
	br_if 3
	local.get 13
	i32.const 536870911
	i32.and 
	local.tee 1
	local.get 12
	i32.const 268435455
	i32.and 
	local.tee 4
	local.get 1
	local.get 4
	i32.lt_u
	i32.select
	local.set 16
	local.get 3
	i32.const -1
	i32.add 
	local.set 3
	local.get 2
	i32.const 8
	i32.add 
	local.set 17
	local.get 0
	i32.const 16
	i32.add 
	local.set 18
	local.get 0
	f32.load 8
	local.get 14
	f32.mul 
	local.set 19
	local.get 2
	f32.load 4
	local.set 20
	local.get 2
	f32.load 0
	local.set 21
	local.get 0
	f32.load 12
	local.set 22
	local.get 0
	f32.load 4
	local.set 23
	local.get 0
	f32.load 0
	local.set 24
	i32.const 0
	local.set 4
	loop 
	local.get 4
	i32.const 4
	i32.shl 
	local.set 1
	local.get 4
	i32.const -1
	i32.add 
	local.set 5
	i32.const 0
	local.get 4
	local.get 16
	local.get 4
	local.get 16
	i32.gt_u
	i32.select
	i32.sub 
	local.set 25
	block 
	loop 
	local.get 25
	local.get 5
	local.tee 7
	i32.add 
	i32.const -1
	i32.eq 
	br_if 1
	local.get 0
	local.get 1
	i32.add 
	local.set 4
	local.get 7
	i32.const 1
	i32.add 
	local.set 5
	local.get 1
	i32.const 16
	i32.add 
	local.set 1
	local.get 15
	local.get 4
	i32.const 16
	i32.add 
	f32.load 0
	local.get 24
	f32.sub 
	local.tee 11
	local.get 11
	f32.mul 
	local.get 4
	i32.const 20
	i32.add 
	f32.load 0
	local.get 23
	f32.sub 
	local.tee 26
	local.get 26
	f32.mul 
	f32.add 
	f32.add 
	local.tee 27
	f32.const 0x0p0
	f32.eq 
	br_if 0
	end_loop
	local.get 7
	i32.const 2
	i32.add 
	local.set 4
	local.get 17
	local.get 5
	i32.const 3
	i32.shl 
	i32.add 
	local.tee 5
	local.get 5
	f32.load 0
	local.get 0
	local.get 1
	i32.add 
	local.tee 1
	f32.load 12
	local.tee 28
	local.get 11
	local.get 1
	f32.load 8
	local.get 19
	f32.mul 
	local.get 27
	local.get 27
	f32.sqrt
	f32.mul 
	f32.div 
	local.tee 27
	f32.mul 
	local.tee 11
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 5
	local.get 5
	f32.load 4
	local.get 28
	local.get 26
	local.get 27
	f32.mul 
	local.tee 26
	f32.mul 
	f32.sub 
	f32.store 4
	local.get 20
	local.get 22
	local.get 26
	f32.mul 
	f32.add 
	local.set 20
	local.get 21
	local.get 22
	local.get 11
	f32.mul 
	f32.add 
	local.set 21
	br 1
	end_block
	end_loop
	local.get 2
	local.get 20
	f32.store 4
	local.get 2
	local.get 21
	f32.store 0
	local.get 12
	i32.const 268435455
	i32.add 
	local.set 12
	local.get 13
	i32.const 536870911
	i32.add 
	local.set 13
	local.get 6
	i32.const -1
	i32.add 
	local.set 6
	local.get 17
	local.set 2
	local.get 18
	local.set 0
	local.get 3
	br_if 0
	br 3
	end_loop
	end_block
	i32.const 4
	local.get 7
	call alloc::raw_vec::handle_error
	unreachable
	end_block
	call alloc::raw_vec::capacity_overflow
	unreachable
	end_block
	block 
	local.get 9
	i32.eqz
	br_if 0
	local.get 8
	call free
	end_block
	end_function
