<engine::force::PairwiseGravity<f64> as engine::force::Force<f64>>::accumulate:
	.functype	<engine::force::PairwiseGravity<f64> as engine::force::Force<f64>>::accumulate (i32, i32, i32, i32) -> ()
	.local  	i32, i32, i32, i32, i32, i32, v128, f64, i32, i32, f64, f64, i32, i32, i32, f64, v128, v128, v128, i32, v128
	block 
	block 
	local.get 1
	i32.load 40
	local.tee 4
	local.get 1
	i32.load 16
	local.tee 5
	local.get 4
	local.get 5
	i32.lt_u
	i32.select
	local.tee 6
	i32.const 134217727
	i32.gt_u
	br_if 0
	local.get 6
	i32.const 5
	i32.shl 
	local.tee 7
	i32.const 2147483641
	i32.ge_u
	br_if 0
	local.get 1
	i32.load 36
	local.set 4
	local.get 1
	i32.load 12
	local.set 5
	block 
	block 
	block 
	local.get 7
	br_if 0
	i32.const 8
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
	v128.load 0:p2align=3
	local.set 10
	local.get 1
	i32.const 24
	i32.add 
	local.get 4
	f64.load 0
	local.tee 11
	f64.store 0
	local.get 1
	local.get 10
	v128.store 0:p2align=3
	local.get 1
	i32.const 16
	i32.add 
	f64.const 0x0p0
	f64.const 0x1p0
	local.get 11
	f64.div 
	local.get 11
	f64.const 0x0p0
	f64.eq 
	f64.select
	f64.store 0
	local.get 5
	i32.const 16
	i32.add 
	local.set 5
	local.get 4
	i32.const 8
	i32.add 
	local.set 4
	local.get 1
	i32.const 32
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
	i32.const 134217727
	i32.add 
	local.set 12
	local.get 3
	i32.const 268435455
	i32.add 
	local.set 13
	local.get 0
	f64.load 0
	local.set 14
	local.get 0
	f64.load 8
	local.set 15
	local.get 8
	local.set 0
	loop 
	local.get 6
	i32.eqz
	br_if 3
	local.get 13
	i32.const 268435455
	i32.and 
	local.tee 1
	local.get 12
	i32.const 134217727
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
	i32.const 16
	i32.add 
	local.set 17
	local.get 0
	i32.const 32
	i32.add 
	local.set 18
	local.get 0
	f64.load 16
	local.get 14
	f64.mul 
	local.set 19
	local.get 0
	v128.load64_splat 24
	local.set 20
	local.get 2
	v128.load 0:p2align=3
	local.set 21
	local.get 0
	v128.load 0:p2align=3
	local.set 22
	i32.const 0
	local.set 4
	loop 
	local.get 4
	local.get 16
	local.get 4
	local.get 16
	i32.gt_u
	i32.select
	local.set 23
	local.get 4
	i32.const 5
	i32.shl 
	local.set 1
	block 
	loop 
	local.get 23
	local.get 4
	local.tee 5
	i32.eq 
	br_if 1
	local.get 0
	local.get 1
	i32.add 
	local.set 7
	local.get 5
	i32.const 1
	i32.add 
	local.set 4
	local.get 1
	i32.const 32
	i32.add 
	local.set 1
	local.get 15
	local.get 7
	i32.const 32
	i32.add 
	v128.load 0:p2align=3
	local.get 22
	f64x2.sub
	local.tee 10
	local.get 10
	f64x2.mul
	local.tee 24
	f64x2.extract_lane 0
	local.get 24
	f64x2.extract_lane 1
	f64.add 
	f64.add 
	local.tee 11
	f64.const 0x0p0
	f64.eq 
	br_if 0
	end_loop
	local.get 17
	local.get 5
	i32.const 4
	i32.shl 
	i32.add 
	local.tee 5
	local.get 5
	v128.load 0:p2align=3
	local.get 0
	local.get 1
	i32.add 
	local.tee 1
	v128.load64_splat 24
	local.get 10
	local.get 1
	f64.load 16
	local.get 19
	f64.mul 
	local.get 11
	local.get 11
	f64.sqrt
	f64.mul 
	f64.div 
	f64x2.splat
	f64x2.mul
	local.tee 10
	f64x2.mul
	f64x2.sub
	v128.store 0:p2align=3
	local.get 21
	local.get 20
	local.get 10
	f64x2.mul
	f64x2.add
	local.set 21
	br 1
	end_block
	end_loop
	local.get 2
	local.get 21
	v128.store 0:p2align=3
	local.get 12
	i32.const 134217727
	i32.add 
	local.set 12
	local.get 13
	i32.const 268435455
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
	i32.const 8
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
