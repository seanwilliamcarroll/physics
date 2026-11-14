engine::force::sweep::<f32>:
	.functype	engine::force::sweep::<f32> (i32, i32, f32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) -> ()
	.local  	i32, i32, i32, i32, i32, i32, f32, f32, v128, v128, v128, v128, i32, v128, v128, v128, v128, v128, v128, f32, f32, f32
	block 
	block 
	local.get 14
	i32.const 1
	i32.shr_u
	local.tee 15
	local.get 12
	i32.const 1
	i32.shr_u
	local.tee 16
	local.get 15
	local.get 16
	i32.lt_u
	i32.select
	local.tee 15
	local.get 10
	i32.const 1
	i32.shr_u
	local.tee 16
	local.get 8
	i32.const 1
	i32.shr_u
	local.tee 17
	local.get 6
	i32.const 1
	i32.shr_u
	local.tee 18
	local.get 4
	i32.const 1
	i32.shr_u
	local.tee 19
	local.get 18
	local.get 19
	i32.lt_u
	i32.select
	local.tee 18
	local.get 17
	local.get 18
	i32.lt_u
	i32.select
	local.tee 17
	local.get 16
	local.get 17
	i32.lt_u
	i32.select
	local.tee 16
	local.get 15
	local.get 16
	i32.lt_u
	i32.select
	local.tee 20
	br_if 0
	f32.const 0x0p0
	local.set 21
	i32.const 0
	local.set 15
	i32.const 0
	local.set 16
	f32.const 0x0p0
	local.set 22
	br 1
	end_block
	local.get 1
	v128.load32_splat 8
	local.set 23
	local.get 1
	v128.load32_splat 4
	local.set 24
	local.get 2
	f32x4.splat
	local.set 25
	local.get 1
	v128.load32_splat 0
	local.set 26
	local.get 3
	local.set 17
	local.get 5
	local.set 18
	local.get 7
	local.set 19
	local.get 9
	local.set 27
	local.get 11
	local.set 15
	local.get 13
	local.set 16
	v128.const 0x0p0, 0x0p0, 0x0p0, 0x0p0
	local.tee 28
	local.set 29
	loop 
	local.get 15
	local.get 15
	v128.load64_zero 0:p2align=2
	local.get 27
	v128.load64_zero 0:p2align=2
	local.tee 30
	local.get 17
	v128.load64_zero 0:p2align=2
	local.get 26
	f32x4.sub
	local.tee 31
	local.get 25
	local.get 31
	local.get 31
	f32x4.mul
	local.get 18
	v128.load64_zero 0:p2align=2
	local.get 24
	f32x4.sub
	local.tee 31
	local.get 31
	f32x4.mul
	f32x4.add
	f32x4.add
	local.tee 32
	local.get 28
	f32x4.ne
	local.get 19
	v128.load64_zero 0:p2align=2
	local.get 23
	f32x4.mul
	local.get 32
	local.get 32
	f32x4.sqrt
	f32x4.mul
	f32x4.div
	v128.and
	local.tee 32
	f32x4.mul
	local.tee 33
	f32x4.mul
	f32x4.sub
	v128.store64_lane 0:p2align=2, 0
	local.get 16
	local.get 16
	v128.load64_zero 0:p2align=2
	local.get 30
	local.get 31
	local.get 32
	f32x4.mul
	local.tee 31
	f32x4.mul
	f32x4.sub
	v128.store64_lane 0:p2align=2, 0
	local.get 31
	local.get 33
	i8x16.shuffle 4, 5, 6, 7, 20, 21, 22, 23, 16, 17, 18, 19, 0, 1, 2, 3
	local.get 29
	f32x4.add
	local.set 29
	local.get 17
	i32.const 8
	i32.add 
	local.set 17
	local.get 18
	i32.const 8
	i32.add 
	local.set 18
	local.get 19
	i32.const 8
	i32.add 
	local.set 19
	local.get 27
	i32.const 8
	i32.add 
	local.set 27
	local.get 15
	i32.const 8
	i32.add 
	local.set 15
	local.get 16
	i32.const 8
	i32.add 
	local.set 16
	local.get 20
	i32.const -1
	i32.add 
	local.tee 20
	br_if 0
	end_loop
	local.get 29
	f32x4.extract_lane 3
	local.set 21
	local.get 29
	f32x4.extract_lane 2
	local.set 22
	local.get 29
	i32x4.extract_lane 0
	local.set 15
	local.get 29
	i32x4.extract_lane 1
	local.set 16
	end_block
	block 
	local.get 14
	i32.const 1
	i32.and 
	local.tee 17
	local.get 12
	i32.const 1
	i32.and 
	local.tee 18
	local.get 17
	local.get 18
	i32.lt_u
	i32.select
	local.tee 17
	local.get 10
	i32.const 1
	i32.and 
	local.tee 18
	local.get 8
	i32.const 1
	i32.and 
	local.tee 19
	local.get 6
	i32.const 1
	i32.and 
	local.tee 27
	local.get 4
	i32.const 1
	i32.and 
	local.tee 20
	local.get 27
	local.get 20
	i32.lt_u
	i32.select
	local.tee 27
	local.get 19
	local.get 27
	i32.lt_u
	i32.select
	local.tee 19
	local.get 18
	local.get 19
	i32.lt_u
	i32.select
	local.tee 18
	local.get 17
	local.get 18
	i32.lt_u
	i32.select
	i32.eqz
	br_if 0
	local.get 11
	local.get 12
	i32.const 268435454
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.tee 17
	local.get 17
	f32.load 0
	local.get 9
	local.get 10
	i32.const 536870910
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	f32.load 0
	local.tee 34
	local.get 3
	local.get 4
	i32.const 536870910
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	f32.load 0
	local.get 1
	f32.load 0
	f32.sub 
	local.tee 35
	f32.const 0x0p0
	local.get 7
	local.get 8
	i32.const 536870910
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	f32.load 0
	local.get 1
	f32.load 8
	f32.mul 
	local.get 2
	local.get 35
	local.get 35
	f32.mul 
	local.get 5
	local.get 6
	i32.const 536870910
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	f32.load 0
	local.get 1
	f32.load 4
	f32.sub 
	local.tee 35
	local.get 35
	f32.mul 
	f32.add 
	f32.add 
	local.tee 2
	local.get 2
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 2
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 2
	f32.mul 
	local.tee 36
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 13
	local.get 14
	i32.const 268435454
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.tee 17
	local.get 17
	f32.load 0
	local.get 34
	local.get 35
	local.get 2
	f32.mul 
	local.tee 2
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 21
	local.get 2
	f32.add 
	local.set 21
	local.get 22
	local.get 36
	f32.add 
	local.set 22
	end_block
	local.get 0
	local.get 15
	i32.store 12
	local.get 0
	local.get 21
	f32.store 8
	local.get 0
	local.get 16
	i32.store 4
	local.get 0
	local.get 22
	f32.store 0
	end_function
