engine::force::pass_one::<f32>:
	.functype	engine::force::pass_one::<f32> (i32, i32, i32, i32, i32) -> ()
	.local  	i32, i32, i32, i32, i32, i32, f32, f32, f32, f32, i32, v128, v128, v128, v128, v128, v128, i32, i32, i32, i32, i32, v128, v128, v128, f32, f32, f32, f32
	block 
	local.get 4
	i32.load 12
	local.tee 5
	local.get 4
	i32.load 4
	local.tee 6
	local.get 5
	local.get 6
	i32.lt_u
	i32.select
	local.tee 5
	local.get 1
	i32.load 28
	local.tee 6
	local.get 1
	i32.load 20
	local.tee 7
	local.get 1
	i32.load 12
	local.tee 8
	local.get 1
	i32.load 4
	local.tee 9
	local.get 8
	local.get 9
	i32.lt_u
	i32.select
	local.tee 8
	local.get 7
	local.get 8
	i32.lt_u
	i32.select
	local.tee 7
	local.get 6
	local.get 7
	i32.lt_u
	i32.select
	local.tee 6
	local.get 3
	local.get 6
	local.get 3
	i32.lt_u
	i32.select
	local.tee 3
	local.get 5
	local.get 3
	i32.lt_u
	i32.select
	local.tee 10
	i32.eqz
	br_if 0
	local.get 4
	i32.load 8
	local.set 5
	local.get 4
	i32.load 0
	local.set 3
	local.get 1
	i32.load 24
	local.set 9
	local.get 1
	i32.load 16
	local.set 6
	local.get 1
	i32.load 8
	local.set 7
	local.get 1
	i32.load 0
	local.set 8
	local.get 0
	f32.load 12
	local.set 11
	local.get 0
	f32.load 8
	local.set 12
	local.get 0
	f32.load 4
	local.set 13
	local.get 0
	f32.load 0
	local.set 14
	i32.const 0
	local.set 15
	block 
	local.get 10
	i32.const 8
	i32.lt_u
	br_if 0
	local.get 3
	local.get 5
	i32.sub 
	i32x4.splat
	local.get 8
	local.get 3
	i32.sub 
	i32x4.replace_lane 1
	local.get 7
	local.get 3
	i32.sub 
	i32x4.replace_lane 2
	local.get 6
	local.get 3
	i32.sub 
	i32x4.replace_lane 3
	v128.const -16, -16, -16, -16
	local.tee 16
	i32x4.gt_u
	v128.const 65535, 65535, 65535, 65535
	local.tee 17
	v128.and
	local.get 9
	local.get 3
	i32.sub 
	i32x4.splat
	local.get 8
	local.get 5
	i32.sub 
	i32x4.replace_lane 1
	local.get 7
	local.get 5
	i32.sub 
	i32x4.replace_lane 2
	local.get 6
	local.get 5
	i32.sub 
	i32x4.replace_lane 3
	local.get 16
	i32x4.gt_u
	local.get 17
	v128.and
	i16x8.narrow_i32x4_u
	v128.any_true
	br_if 0
	local.get 9
	local.get 5
	i32.sub 
	i32.const -16
	i32.gt_u
	br_if 0
	local.get 12
	f32x4.splat
	local.set 18
	local.get 11
	f32x4.splat
	local.set 19
	local.get 13
	f32x4.splat
	local.set 20
	local.get 14
	f32x4.splat
	local.set 21
	local.get 2
	local.set 1
	local.get 8
	local.set 4
	local.get 7
	local.set 0
	local.get 6
	local.set 22
	local.get 9
	local.set 23
	local.get 3
	local.set 24
	local.get 5
	local.set 25
	local.get 10
	i32.const 268435452
	i32.and 
	local.tee 15
	local.set 26
	loop 
	local.get 23
	v128.load 0:p2align=2
	local.set 16
	local.get 24
	local.get 4
	v128.load 0:p2align=2
	local.get 21
	f32x4.sub
	local.tee 17
	local.get 19
	local.get 17
	local.get 17
	f32x4.mul
	local.get 0
	v128.load 0:p2align=2
	local.get 20
	f32x4.sub
	local.tee 17
	local.get 17
	f32x4.mul
	f32x4.add
	f32x4.add
	local.tee 27
	v128.const 0x0p0, 0x0p0, 0x0p0, 0x0p0
	f32x4.ne
	local.get 18
	local.get 22
	v128.load 0:p2align=2
	f32x4.mul
	local.get 27
	local.get 27
	f32x4.sqrt
	f32x4.mul
	f32x4.div
	v128.and
	local.tee 27
	f32x4.mul
	local.tee 28
	v128.store 0:p2align=2
	local.get 25
	local.get 17
	local.get 27
	f32x4.mul
	local.tee 17
	v128.store 0:p2align=2
	local.get 1
	local.get 1
	v128.load 0:p2align=2
	local.tee 27
	local.get 1
	v128.load 16:p2align=2
	local.tee 29
	i8x16.shuffle 0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27
	local.get 16
	local.get 28
	f32x4.mul
	f32x4.sub
	local.tee 28
	local.get 27
	local.get 29
	i8x16.shuffle 4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 28, 29, 30, 31
	local.get 16
	local.get 17
	f32x4.mul
	f32x4.sub
	local.tee 16
	i8x16.shuffle 0, 1, 2, 3, 16, 17, 18, 19, 4, 5, 6, 7, 20, 21, 22, 23
	v128.store 0:p2align=2
	local.get 1
	local.get 28
	local.get 16
	i8x16.shuffle 8, 9, 10, 11, 24, 25, 26, 27, 12, 13, 14, 15, 28, 29, 30, 31
	v128.store 16:p2align=2
	local.get 1
	i32.const 32
	i32.add 
	local.set 1
	local.get 4
	i32.const 16
	i32.add 
	local.set 4
	local.get 0
	i32.const 16
	i32.add 
	local.set 0
	local.get 22
	i32.const 16
	i32.add 
	local.set 22
	local.get 23
	i32.const 16
	i32.add 
	local.set 23
	local.get 24
	i32.const 16
	i32.add 
	local.set 24
	local.get 25
	i32.const 16
	i32.add 
	local.set 25
	local.get 26
	i32.const -4
	i32.add 
	local.tee 26
	br_if 0
	end_loop
	local.get 10
	local.get 15
	i32.eq 
	br_if 1
	end_block
	local.get 10
	local.get 15
	i32.sub 
	local.set 0
	local.get 15
	i32.const 2
	i32.shl 
	local.set 1
	local.get 2
	local.get 15
	i32.const 3
	i32.shl 
	i32.add 
	local.set 4
	loop 
	local.get 9
	local.get 1
	i32.add 
	f32.load 0
	local.set 30
	local.get 3
	local.get 1
	i32.add 
	local.get 8
	local.get 1
	i32.add 
	f32.load 0
	local.get 14
	f32.sub 
	local.tee 31
	f32.const 0x0p0
	local.get 12
	local.get 6
	local.get 1
	i32.add 
	f32.load 0
	f32.mul 
	local.get 11
	local.get 31
	local.get 31
	f32.mul 
	local.get 7
	local.get 1
	i32.add 
	f32.load 0
	local.get 13
	f32.sub 
	local.tee 31
	local.get 31
	f32.mul 
	f32.add 
	f32.add 
	local.tee 32
	local.get 32
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 32
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 32
	f32.mul 
	local.tee 33
	f32.store 0
	local.get 5
	local.get 1
	i32.add 
	local.get 31
	local.get 32
	f32.mul 
	local.tee 31
	f32.store 0
	local.get 4
	local.get 4
	f32.load 0
	local.get 30
	local.get 33
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 4
	i32.const 4
	i32.add 
	local.tee 22
	local.get 22
	f32.load 0
	local.get 30
	local.get 31
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 4
	i32.const 8
	i32.add 
	local.set 4
	local.get 8
	i32.const 4
	i32.add 
	local.set 8
	local.get 7
	i32.const 4
	i32.add 
	local.set 7
	local.get 6
	i32.const 4
	i32.add 
	local.set 6
	local.get 9
	i32.const 4
	i32.add 
	local.set 9
	local.get 3
	i32.const 4
	i32.add 
	local.set 3
	local.get 5
	i32.const 4
	i32.add 
	local.set 5
	local.get 0
	i32.const -1
	i32.add 
	local.tee 0
	br_if 0
	end_loop
	end_block
	end_function
