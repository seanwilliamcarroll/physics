<engine::force::PairwiseGravity<f32> as engine::force::Force<f32>>::accumulate:
	.functype	<engine::force::PairwiseGravity<f32> as engine::force::Force<f32>>::accumulate (i32, i32, i32, i32) -> ()
	.local  	i32, i32, i32, i32, i32, i32, i32, i32, i32, v128, v128, v128, v128, i64, f32, f32, f32, f32
	block 
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
	local.tee 4
	i32.const 2147483645
	i32.ge_u
	br_if 0
	local.get 1
	i32.load 28
	local.set 7
	local.get 1
	i32.load 4
	local.set 8
	block 
	block 
	local.get 4
	br_if 0
	i32.const 4
	local.set 9
	i32.const 0
	local.set 10
	br 1
	end_block
	local.get 6
	local.set 10
	local.get 4
	call malloc
	local.tee 9
	i32.eqz
	br_if 2
	end_block
	block 
	local.get 6
	i32.eqz
	br_if 0
	i32.const 0
	local.set 11
	block 
	local.get 6
	i32.const 8
	i32.lt_u
	br_if 0
	local.get 9
	local.get 8
	local.get 6
	i32.const 3
	i32.shl 
	i32.add 
	i32.lt_u
	local.get 8
	local.get 9
	local.get 4
	i32.add 
	local.tee 1
	i32.lt_u
	i32.and 
	br_if 0
	local.get 9
	local.get 7
	local.get 6
	i32.const 2
	i32.shl 
	i32.add 
	i32.lt_u
	local.get 7
	local.get 1
	i32.lt_u
	i32.and 
	br_if 0
	local.get 8
	local.set 4
	local.get 7
	local.set 5
	local.get 9
	local.set 1
	local.get 6
	i32.const 268435452
	i32.and 
	local.tee 11
	local.set 12
	loop 
	local.get 4
	v128.load 0:p2align=2
	local.set 13
	local.get 1
	local.get 4
	v128.load 16:p2align=2
	local.tee 14
	local.get 5
	v128.load 0:p2align=2
	local.tee 15
	v128.const 0x0p0, 0x0p0, 0x0p0, 0x0p0
	f32x4.ne
	v128.const 0x1p0, 0x1p0, 0x1p0, 0x1p0
	local.get 15
	f32x4.div
	v128.and
	local.tee 16
	i8x16.shuffle 0, 1, 2, 3, 4, 5, 6, 7, 24, 25, 26, 27, 0, 1, 2, 3
	local.get 15
	i8x16.shuffle 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 24, 25, 26, 27
	v128.store 32:p2align=2
	local.get 1
	local.get 14
	local.get 16
	i8x16.shuffle 8, 9, 10, 11, 12, 13, 14, 15, 28, 29, 30, 31, 0, 1, 2, 3
	local.get 15
	i8x16.shuffle 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 28, 29, 30, 31
	v128.store 48:p2align=2
	local.get 1
	local.get 13
	local.get 16
	i8x16.shuffle 0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 0, 1, 2, 3
	local.get 15
	i8x16.shuffle 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 16, 17, 18, 19
	v128.store 0:p2align=2
	local.get 1
	local.get 13
	local.get 16
	i8x16.shuffle 8, 9, 10, 11, 12, 13, 14, 15, 20, 21, 22, 23, 0, 1, 2, 3
	local.get 15
	i8x16.shuffle 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 20, 21, 22, 23
	v128.store 16:p2align=2
	local.get 4
	i32.const 32
	i32.add 
	local.set 4
	local.get 5
	i32.const 16
	i32.add 
	local.set 5
	local.get 1
	i32.const 64
	i32.add 
	local.set 1
	local.get 12
	i32.const -4
	i32.add 
	local.tee 12
	br_if 0
	end_loop
	local.get 6
	local.get 11
	i32.eq 
	br_if 1
	end_block
	local.get 6
	local.get 11
	i32.sub 
	local.set 12
	local.get 8
	local.get 11
	i32.const 3
	i32.shl 
	i32.add 
	local.set 4
	local.get 7
	local.get 11
	i32.const 2
	i32.shl 
	i32.add 
	local.set 5
	local.get 9
	local.get 11
	i32.const 4
	i32.shl 
	i32.add 
	local.set 1
	loop 
	local.get 4
	i64.load 0:p2align=2
	local.set 17
	local.get 1
	i32.const 12
	i32.add 
	local.get 5
	f32.load 0
	local.tee 18
	f32.store 0
	local.get 1
	local.get 17
	i64.store 0:p2align=2
	local.get 1
	i32.const 8
	i32.add 
	f32.const 0x0p0
	f32.const 0x1p0
	local.get 18
	f32.div 
	local.get 18
	f32.const 0x0p0
	f32.eq 
	f32.select
	f32.store 0
	local.get 4
	i32.const 8
	i32.add 
	local.set 4
	local.get 5
	i32.const 4
	i32.add 
	local.set 5
	local.get 1
	i32.const 16
	i32.add 
	local.set 1
	local.get 12
	i32.const -1
	i32.add 
	local.tee 12
	br_if 0
	end_loop
	end_block
	local.get 3
	i32.eqz
	br_if 2
	local.get 6
	i32.const 268435455
	i32.add 
	local.set 11
	local.get 3
	i32.const 536870911
	i32.add 
	local.set 8
	local.get 9
	i32.const 16
	i32.add 
	local.set 7
	local.get 0
	f32.load 0
	local.set 19
	local.get 0
	f32.load 4
	local.set 20
	local.get 9
	local.set 0
	loop 
	local.get 6
	i32.eqz
	br_if 3
	local.get 2
	v128.load64_zero 0:p2align=2
	local.set 16
	block 
	local.get 6
	i32.const -1
	i32.add 
	local.tee 6
	i32.const 268435455
	i32.and 
	local.tee 1
	local.get 3
	i32.const -1
	i32.add 
	i32.const 536870911
	i32.and 
	local.tee 4
	local.get 1
	local.get 4
	i32.lt_u
	i32.select
	i32.eqz
	br_if 0
	local.get 8
	i32.const 536870911
	i32.and 
	local.tee 1
	local.get 11
	i32.const 268435455
	i32.and 
	local.tee 4
	local.get 1
	local.get 4
	i32.lt_u
	i32.select
	i32.const 3
	i32.shl 
	local.set 12
	local.get 0
	v128.load64_zero 0:p2align=2
	local.set 13
	local.get 0
	f32.load 8
	local.get 19
	f32.mul 
	local.set 21
	local.get 0
	v128.load32_splat 12
	local.set 14
	i32.const 0
	local.set 4
	local.get 7
	local.set 1
	loop 
	local.get 2
	local.get 4
	i32.add 
	i32.const 8
	i32.add 
	local.tee 5
	local.get 5
	v128.load64_zero 0:p2align=2
	local.get 1
	i32.const 12
	i32.add 
	v128.load32_splat 0
	local.get 1
	v128.load64_zero 0:p2align=2
	local.get 13
	f32x4.sub
	local.tee 15
	f32.const 0x0p0
	local.get 1
	i32.const 8
	i32.add 
	f32.load 0
	local.get 21
	f32.mul 
	local.get 15
	local.get 15
	f32x4.mul
	local.tee 15
	f32x4.extract_lane 0
	local.get 15
	f32x4.extract_lane 1
	f32.add 
	local.get 20
	f32.add 
	local.tee 18
	local.get 18
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 18
	f32.const 0x0p0
	f32.eq 
	f32.select
	f32x4.splat
	f32x4.mul
	local.tee 15
	f32x4.mul
	f32x4.sub
	v128.store64_lane 0:p2align=2, 0
	local.get 16
	local.get 14
	local.get 15
	f32x4.mul
	f32x4.add
	local.set 16
	local.get 1
	i32.const 16
	i32.add 
	local.set 1
	local.get 12
	local.get 4
	i32.const 8
	i32.add 
	local.tee 4
	i32.ne 
	br_if 0
	end_loop
	end_block
	local.get 0
	i32.const 16
	i32.add 
	local.set 0
	local.get 2
	local.get 16
	v128.store64_lane 0:p2align=2, 0
	local.get 11
	i32.const 268435455
	i32.add 
	local.set 11
	local.get 8
	i32.const 536870911
	i32.add 
	local.set 8
	local.get 7
	i32.const 16
	i32.add 
	local.set 7
	local.get 2
	i32.const 8
	i32.add 
	local.set 2
	local.get 3
	i32.const -1
	i32.add 
	local.tee 3
	br_if 0
	br 3
	end_loop
	end_block
	call alloc::raw_vec::capacity_overflow
	unreachable
	end_block
	i32.const 4
	local.get 4
	call alloc::raw_vec::handle_error
	unreachable
	end_block
	block 
	local.get 10
	i32.eqz
	br_if 0
	local.get 9
	call free
	end_block
	end_function
