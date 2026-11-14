engine::force::sweep::<f32>:
	.functype	engine::force::sweep::<f32> (i32, i32, f32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) -> ()
	.local  	i32, i32, v128, i32, i32, i32, i32, i32, f32, f32, i32, v128, f32, v128, f32, v128, f32, v128, f32, f32, v128, v128, v128, v128, v128, v128, v128, v128, f32, f32, f32, v128, v128, v128, v128, v128, f32, f32, f32, v128, v128, v128, i32, v128, v128, v128, v128, v128, v128, v128, v128, f32
	i32.const 0
	local.set 15
	global.get __stack_pointer
	i32.const 128
	i32.sub 
	local.tee 16
	i32.const 0
	i32.store 60
	local.get 16
	i64.const 0
	i64.store 52:p2align=2
	local.get 16
	v128.const 0, 0
	local.tee 17
	v128.store 36:p2align=2
	local.get 16
	local.get 17
	v128.store 20:p2align=2
	local.get 16
	local.get 17
	v128.store 4:p2align=2
	local.get 16
	i64.const 0
	i64.store 68:p2align=2
	local.get 16
	local.get 17
	v128.store 76:p2align=2
	local.get 16
	local.get 17
	v128.store 92:p2align=2
	local.get 16
	local.get 17
	v128.store 108:p2align=2
	local.get 16
	i32.const 0
	i32.store 124
	block 
	block 
	local.get 14
	i32.const 4
	i32.shr_u
	local.tee 18
	local.get 12
	i32.const 4
	i32.shr_u
	local.tee 19
	local.get 18
	local.get 19
	i32.lt_u
	i32.select
	local.tee 18
	local.get 10
	i32.const 4
	i32.shr_u
	local.tee 19
	local.get 8
	i32.const 4
	i32.shr_u
	local.tee 20
	local.get 6
	i32.const 4
	i32.shr_u
	local.tee 21
	local.get 4
	i32.const 4
	i32.shr_u
	local.tee 22
	local.get 21
	local.get 22
	i32.lt_u
	i32.select
	local.tee 21
	local.get 20
	local.get 21
	i32.lt_u
	i32.select
	local.tee 20
	local.get 19
	local.get 20
	i32.lt_u
	i32.select
	local.tee 19
	local.get 18
	local.get 19
	i32.lt_u
	i32.select
	local.tee 18
	br_if 0
	f32.const 0x0p0
	local.set 23
	f32.const 0x0p0
	local.set 24
	br 1
	end_block
	local.get 18
	i32.const 6
	i32.shl 
	local.set 25
	local.get 2
	f32x4.splat
	local.set 26
	local.get 1
	f32.load 8
	local.tee 27
	f32x4.splat
	local.set 28
	local.get 1
	f32.load 4
	local.tee 29
	f32x4.splat
	local.set 30
	local.get 1
	f32.load 0
	local.tee 31
	f32x4.splat
	local.set 32
	f32.const 0x0p0
	local.set 33
	f32.const 0x0p0
	local.set 34
	f32.const 0x0p0
	local.set 24
	f32.const 0x0p0
	local.set 23
	v128.const 0x0p0, 0x0p0, 0x0p0, 0x0p0
	local.tee 17
	local.set 35
	local.get 17
	local.set 36
	local.get 17
	local.set 37
	local.get 17
	local.set 38
	local.get 17
	local.set 39
	local.get 17
	local.set 40
	local.get 17
	local.set 41
	local.get 17
	local.set 42
	loop 
	local.get 7
	local.get 15
	i32.add 
	local.tee 18
	i32.const 60
	i32.add 
	f32.load 0
	local.set 43
	local.get 3
	local.get 15
	i32.add 
	local.tee 19
	i32.const 60
	i32.add 
	f32.load 0
	local.set 44
	local.get 5
	local.get 15
	i32.add 
	local.tee 20
	i32.const 60
	i32.add 
	f32.load 0
	local.set 45
	local.get 18
	i32.const 52
	i32.add 
	v128.load64_zero 0:p2align=2
	local.set 46
	local.get 19
	i32.const 52
	i32.add 
	v128.load64_zero 0:p2align=2
	local.set 47
	local.get 20
	i32.const 52
	i32.add 
	v128.load64_zero 0:p2align=2
	local.set 48
	local.get 11
	local.get 15
	i32.add 
	local.tee 21
	v128.load 0:p2align=2
	local.set 49
	local.get 9
	local.get 15
	i32.add 
	local.tee 22
	v128.load 0:p2align=2
	local.set 50
	local.get 18
	f32.load 0
	local.set 51
	local.get 19
	f32.load 0
	local.set 52
	local.get 20
	f32.load 0
	local.set 53
	local.get 18
	i32.const 36
	i32.add 
	v128.load 0:p2align=2
	local.set 54
	local.get 19
	i32.const 36
	i32.add 
	v128.load 0:p2align=2
	local.set 55
	local.get 20
	i32.const 36
	i32.add 
	v128.load 0:p2align=2
	local.set 56
	local.get 21
	i32.const 16
	i32.add 
	local.tee 57
	local.get 57
	v128.load 0:p2align=2
	local.get 19
	i32.const 4
	i32.add 
	v128.load 0:p2align=2
	local.get 32
	f32x4.sub
	local.tee 58
	local.get 26
	local.get 58
	local.get 58
	f32x4.mul
	local.get 20
	i32.const 4
	i32.add 
	v128.load 0:p2align=2
	local.get 30
	f32x4.sub
	local.tee 58
	local.get 58
	f32x4.mul
	f32x4.add
	f32x4.add
	local.tee 59
	local.get 17
	f32x4.ne
	local.get 18
	i32.const 4
	i32.add 
	v128.load 0:p2align=2
	local.get 28
	f32x4.mul
	local.get 59
	local.get 59
	f32x4.sqrt
	f32x4.mul
	f32x4.div
	v128.and
	local.tee 60
	f32x4.mul
	local.tee 59
	local.get 19
	i32.const 20
	i32.add 
	v128.load 0:p2align=2
	local.get 32
	f32x4.sub
	local.tee 61
	local.get 26
	local.get 61
	local.get 61
	f32x4.mul
	local.get 20
	i32.const 20
	i32.add 
	v128.load 0:p2align=2
	local.get 30
	f32x4.sub
	local.tee 61
	local.get 61
	f32x4.mul
	f32x4.add
	f32x4.add
	local.tee 62
	local.get 17
	f32x4.ne
	local.get 18
	i32.const 20
	i32.add 
	v128.load 0:p2align=2
	local.get 28
	f32x4.mul
	local.get 62
	local.get 62
	f32x4.sqrt
	f32x4.mul
	f32x4.div
	v128.and
	local.tee 63
	f32x4.mul
	local.tee 62
	i8x16.shuffle 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27
	local.get 22
	i32.const 16
	i32.add 
	v128.load 0:p2align=2
	local.tee 64
	f32x4.mul
	f32x4.sub
	v128.store 0:p2align=2
	local.get 21
	i32.const 32
	i32.add 
	local.tee 18
	local.get 18
	v128.load 0:p2align=2
	local.get 62
	local.get 55
	local.get 32
	f32x4.sub
	local.tee 55
	local.get 26
	local.get 55
	local.get 55
	f32x4.mul
	local.get 56
	local.get 30
	f32x4.sub
	local.tee 55
	local.get 55
	f32x4.mul
	f32x4.add
	f32x4.add
	local.tee 56
	local.get 17
	f32x4.ne
	local.get 54
	local.get 28
	f32x4.mul
	local.get 56
	local.get 56
	f32x4.sqrt
	f32x4.mul
	f32x4.div
	v128.and
	local.tee 54
	f32x4.mul
	local.tee 56
	i8x16.shuffle 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27
	local.get 22
	i32.const 32
	i32.add 
	v128.load 0:p2align=2
	local.tee 65
	f32x4.mul
	f32x4.sub
	v128.store 0:p2align=2
	local.get 13
	local.get 15
	i32.add 
	local.tee 18
	i32.const 16
	i32.add 
	local.tee 19
	local.get 19
	v128.load 0:p2align=2
	local.get 64
	local.get 58
	local.get 60
	f32x4.mul
	local.tee 58
	local.get 61
	local.get 63
	f32x4.mul
	local.tee 61
	i8x16.shuffle 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27
	f32x4.mul
	f32x4.sub
	v128.store 0:p2align=2
	local.get 18
	i32.const 32
	i32.add 
	local.tee 19
	local.get 19
	v128.load 0:p2align=2
	local.get 65
	local.get 61
	local.get 55
	local.get 54
	f32x4.mul
	local.tee 55
	i8x16.shuffle 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27
	f32x4.mul
	f32x4.sub
	v128.store 0:p2align=2
	local.get 21
	local.get 49
	local.get 50
	local.get 59
	local.get 17
	i8x16.shuffle 0, 1, 2, 3, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
	local.get 52
	local.get 31
	f32.sub 
	local.tee 52
	f32.const 0x0p0
	local.get 51
	local.get 27
	f32.mul 
	local.get 2
	local.get 52
	local.get 52
	f32.mul 
	local.get 53
	local.get 29
	f32.sub 
	local.tee 52
	local.get 52
	f32.mul 
	f32.add 
	f32.add 
	local.tee 51
	local.get 51
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 51
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 53
	f32.mul 
	local.tee 66
	f32x4.replace_lane 0
	f32x4.mul
	f32x4.sub
	v128.store 0:p2align=2
	local.get 21
	i32.const 48
	i32.add 
	local.tee 19
	local.get 19
	v128.load 0:p2align=2
	local.get 56
	local.get 47
	local.get 32
	f32x4.sub
	local.tee 47
	local.get 26
	local.get 47
	local.get 47
	f32x4.mul
	local.get 48
	local.get 30
	f32x4.sub
	local.tee 47
	local.get 47
	f32x4.mul
	f32x4.add
	f32x4.add
	local.tee 48
	local.get 17
	f32x4.ne
	local.get 46
	local.get 28
	f32x4.mul
	local.get 48
	local.get 48
	f32x4.sqrt
	f32x4.mul
	f32x4.div
	v128.and
	local.tee 48
	f32x4.mul
	local.tee 46
	i8x16.shuffle 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 0, 1, 2, 3
	local.get 44
	local.get 31
	f32.sub 
	local.tee 51
	f32.const 0x0p0
	local.get 43
	local.get 27
	f32.mul 
	local.get 2
	local.get 51
	local.get 51
	f32.mul 
	local.get 45
	local.get 29
	f32.sub 
	local.tee 51
	local.get 51
	f32.mul 
	f32.add 
	f32.add 
	local.tee 43
	local.get 43
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 43
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 43
	f32.mul 
	local.tee 44
	f32x4.replace_lane 3
	local.get 22
	i32.const 48
	i32.add 
	v128.load 0:p2align=2
	local.tee 49
	f32x4.mul
	f32x4.sub
	v128.store 0:p2align=2
	local.get 18
	local.get 18
	v128.load 0:p2align=2
	local.get 50
	local.get 58
	local.get 17
	i8x16.shuffle 0, 1, 2, 3, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
	local.get 52
	local.get 53
	f32.mul 
	local.tee 52
	f32x4.replace_lane 0
	f32x4.mul
	f32x4.sub
	v128.store 0:p2align=2
	local.get 18
	i32.const 48
	i32.add 
	local.tee 18
	local.get 18
	v128.load 0:p2align=2
	local.get 49
	local.get 55
	local.get 47
	local.get 48
	f32x4.mul
	local.tee 50
	i8x16.shuffle 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 0, 1, 2, 3
	local.get 51
	local.get 43
	f32.mul 
	local.tee 51
	f32x4.replace_lane 3
	f32x4.mul
	f32x4.sub
	v128.store 0:p2align=2
	local.get 52
	local.get 23
	f32.add 
	local.set 23
	local.get 66
	local.get 24
	f32.add 
	local.set 24
	local.get 51
	local.get 33
	f32.add 
	local.set 33
	local.get 44
	local.get 34
	f32.add 
	local.set 34
	local.get 50
	local.get 42
	f32x4.add
	local.set 42
	local.get 55
	local.get 41
	f32x4.add
	local.set 41
	local.get 61
	local.get 40
	f32x4.add
	local.set 40
	local.get 58
	local.get 39
	f32x4.add
	local.set 39
	local.get 46
	local.get 38
	f32x4.add
	local.set 38
	local.get 56
	local.get 37
	f32x4.add
	local.set 37
	local.get 62
	local.get 36
	f32x4.add
	local.set 36
	local.get 59
	local.get 35
	f32x4.add
	local.set 35
	local.get 25
	local.get 15
	i32.const 64
	i32.add 
	local.tee 15
	i32.ne 
	br_if 0
	end_loop
	local.get 16
	local.get 34
	f32.store 60
	local.get 16
	local.get 38
	v128.store64_lane 52:p2align=2, 0
	local.get 16
	local.get 37
	v128.store 36:p2align=2
	local.get 16
	local.get 36
	v128.store 20:p2align=2
	local.get 16
	local.get 35
	v128.store 4:p2align=2
	local.get 16
	local.get 33
	f32.store 124
	local.get 16
	local.get 42
	v128.store64_lane 116:p2align=2, 0
	local.get 16
	local.get 41
	v128.store 100:p2align=2
	local.get 16
	local.get 40
	v128.store 84:p2align=2
	local.get 16
	local.get 39
	v128.store 68:p2align=2
	end_block
	local.get 16
	local.get 23
	f32.store 64
	local.get 16
	local.get 24
	f32.store 0
	block 
	local.get 14
	i32.const 15
	i32.and 
	local.tee 15
	local.get 12
	i32.const 15
	i32.and 
	local.tee 18
	local.get 15
	local.get 18
	i32.lt_u
	i32.select
	local.tee 15
	local.get 10
	i32.const 15
	i32.and 
	local.tee 18
	local.get 8
	i32.const 15
	i32.and 
	local.tee 19
	local.get 6
	i32.const 15
	i32.and 
	local.tee 20
	local.get 4
	i32.const 15
	i32.and 
	local.tee 21
	local.get 20
	local.get 21
	i32.lt_u
	i32.select
	local.tee 20
	local.get 19
	local.get 20
	i32.lt_u
	i32.select
	local.tee 19
	local.get 18
	local.get 19
	i32.lt_u
	i32.select
	local.tee 18
	local.get 15
	local.get 18
	i32.lt_u
	i32.select
	local.tee 25
	i32.eqz
	br_if 0
	local.get 13
	local.get 14
	i32.const 268435440
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.set 15
	local.get 11
	local.get 12
	i32.const 268435440
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.set 18
	local.get 9
	local.get 10
	i32.const 536870896
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.set 21
	local.get 7
	local.get 8
	i32.const 536870896
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.set 22
	local.get 5
	local.get 6
	i32.const 536870896
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.set 57
	local.get 3
	local.get 4
	i32.const 536870896
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.set 13
	local.get 1
	f32.load 8
	local.set 23
	local.get 1
	f32.load 4
	local.set 24
	local.get 1
	f32.load 0
	local.set 33
	local.get 16
	i32.const 64
	i32.add 
	local.set 19
	local.get 16
	local.set 20
	loop 
	local.get 20
	local.get 20
	f32.load 0
	local.get 13
	f32.load 0
	local.get 33
	f32.sub 
	local.tee 52
	f32.const 0x0p0
	local.get 22
	f32.load 0
	local.get 23
	f32.mul 
	local.get 2
	local.get 52
	local.get 52
	f32.mul 
	local.get 57
	f32.load 0
	local.get 24
	f32.sub 
	local.tee 52
	local.get 52
	f32.mul 
	f32.add 
	f32.add 
	local.tee 51
	local.get 51
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 51
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 51
	f32.mul 
	local.tee 43
	f32.add 
	f32.store 0
	local.get 19
	local.get 19
	f32.load 0
	local.get 52
	local.get 51
	f32.mul 
	local.tee 52
	f32.add 
	f32.store 0
	local.get 18
	local.get 18
	f32.load 0
	local.get 21
	f32.load 0
	local.tee 51
	local.get 43
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 15
	local.get 15
	f32.load 0
	local.get 51
	local.get 52
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 20
	i32.const 4
	i32.add 
	local.set 20
	local.get 19
	i32.const 4
	i32.add 
	local.set 19
	local.get 13
	i32.const 4
	i32.add 
	local.set 13
	local.get 57
	i32.const 4
	i32.add 
	local.set 57
	local.get 22
	i32.const 4
	i32.add 
	local.set 22
	local.get 21
	i32.const 4
	i32.add 
	local.set 21
	local.get 18
	i32.const 4
	i32.add 
	local.set 18
	local.get 15
	i32.const 4
	i32.add 
	local.set 15
	local.get 25
	i32.const -1
	i32.add 
	local.tee 25
	br_if 0
	end_loop
	end_block
	local.get 0
	local.get 16
	v128.load 48:p2align=2
	v128.store 48:p2align=2
	local.get 0
	local.get 16
	v128.load 32:p2align=2
	v128.store 32:p2align=2
	local.get 0
	local.get 16
	v128.load 16:p2align=2
	v128.store 16:p2align=2
	local.get 0
	local.get 16
	v128.load 0:p2align=2
	v128.store 0:p2align=2
	local.get 0
	local.get 16
	v128.load 64:p2align=2
	v128.store 64:p2align=2
	local.get 0
	local.get 16
	v128.load 80:p2align=2
	v128.store 80:p2align=2
	local.get 0
	local.get 16
	v128.load 96:p2align=2
	v128.store 96:p2align=2
	local.get 0
	local.get 16
	v128.load 112:p2align=2
	v128.store 112:p2align=2
	end_function
