engine::force::sweep::<f64>:
	.functype	engine::force::sweep::<f64> (i32, i32, f64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) -> ()
	.local  	i32, i32, i32, i32, i32, f64, f64, f64, f64, v128, v128, v128, v128, v128, v128, i32, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, i32, v128, i32, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, f64, f64, f64, f64, f64, f64, f64, f64, f64
	block 
	block 
	local.get 14
	i32.const 3
	i32.shr_u
	local.tee 15
	local.get 12
	i32.const 3
	i32.shr_u
	local.tee 16
	local.get 15
	local.get 16
	i32.lt_u
	i32.select
	local.tee 15
	local.get 10
	i32.const 3
	i32.shr_u
	local.tee 16
	local.get 8
	i32.const 3
	i32.shr_u
	local.tee 17
	local.get 6
	i32.const 3
	i32.shr_u
	local.tee 18
	local.get 4
	i32.const 3
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
	local.tee 15
	br_if 0
	f64.const 0x0p0
	local.set 20
	f64.const 0x0p0
	local.set 21
	f64.const 0x0p0
	local.set 22
	f64.const 0x0p0
	local.set 23
	v128.const 0x0p0, 0x0p0
	local.tee 24
	local.set 25
	local.get 24
	local.set 26
	local.get 24
	local.set 27
	local.get 24
	local.set 28
	local.get 24
	local.set 29
	br 1
	end_block
	local.get 15
	i32.const 6
	i32.shl 
	local.set 30
	local.get 1
	v128.load64_splat 16
	local.set 31
	local.get 1
	v128.load64_splat 8
	local.set 32
	local.get 2
	f64x2.splat
	local.set 33
	local.get 1
	v128.load64_splat 0
	local.set 34
	i32.const 0
	local.set 15
	v128.const 0x0p0, 0x0p0
	local.tee 35
	local.set 24
	local.get 35
	local.set 25
	local.get 35
	local.set 26
	local.get 35
	local.set 27
	local.get 35
	local.set 28
	local.get 35
	local.set 29
	local.get 35
	local.set 36
	local.get 35
	local.set 37
	loop 
	local.get 11
	local.get 15
	i32.add 
	local.tee 16
	local.get 16
	v128.load 0:p2align=3
	local.get 3
	local.get 15
	i32.add 
	local.tee 17
	v128.load 0:p2align=3
	local.get 34
	f64x2.sub
	local.tee 38
	local.get 33
	local.get 38
	local.get 38
	f64x2.mul
	local.get 5
	local.get 15
	i32.add 
	local.tee 18
	v128.load 0:p2align=3
	local.get 32
	f64x2.sub
	local.tee 38
	local.get 38
	f64x2.mul
	f64x2.add
	f64x2.add
	local.tee 39
	local.get 35
	f64x2.ne
	local.get 7
	local.get 15
	i32.add 
	local.tee 19
	v128.load 0:p2align=3
	local.get 31
	f64x2.mul
	local.get 39
	local.get 39
	f64x2.sqrt
	f64x2.mul
	f64x2.div
	v128.and
	local.tee 40
	f64x2.mul
	local.tee 41
	local.get 9
	local.get 15
	i32.add 
	local.tee 42
	v128.load 0:p2align=3
	local.tee 43
	f64x2.mul
	f64x2.sub
	v128.store 0:p2align=3
	local.get 16
	i32.const 16
	i32.add 
	local.tee 44
	local.get 44
	v128.load 0:p2align=3
	local.get 17
	v128.load 16:p2align=3
	local.get 34
	f64x2.sub
	local.tee 39
	local.get 33
	local.get 39
	local.get 39
	f64x2.mul
	local.get 18
	v128.load 16:p2align=3
	local.get 32
	f64x2.sub
	local.tee 39
	local.get 39
	f64x2.mul
	f64x2.add
	f64x2.add
	local.tee 45
	local.get 35
	f64x2.ne
	local.get 19
	v128.load 16:p2align=3
	local.get 31
	f64x2.mul
	local.get 45
	local.get 45
	f64x2.sqrt
	f64x2.mul
	f64x2.div
	v128.and
	local.tee 46
	f64x2.mul
	local.tee 47
	local.get 42
	i32.const 16
	i32.add 
	v128.load 0:p2align=3
	local.tee 48
	f64x2.mul
	f64x2.sub
	v128.store 0:p2align=3
	local.get 16
	i32.const 32
	i32.add 
	local.tee 44
	local.get 44
	v128.load 0:p2align=3
	local.get 17
	i32.const 32
	i32.add 
	v128.load 0:p2align=3
	local.get 34
	f64x2.sub
	local.tee 45
	local.get 33
	local.get 45
	local.get 45
	f64x2.mul
	local.get 18
	i32.const 32
	i32.add 
	v128.load 0:p2align=3
	local.get 32
	f64x2.sub
	local.tee 45
	local.get 45
	f64x2.mul
	f64x2.add
	f64x2.add
	local.tee 49
	local.get 35
	f64x2.ne
	local.get 19
	i32.const 32
	i32.add 
	v128.load 0:p2align=3
	local.get 31
	f64x2.mul
	local.get 49
	local.get 49
	f64x2.sqrt
	f64x2.mul
	f64x2.div
	v128.and
	local.tee 50
	f64x2.mul
	local.tee 51
	local.get 42
	i32.const 32
	i32.add 
	v128.load 0:p2align=3
	local.tee 52
	f64x2.mul
	f64x2.sub
	v128.store 0:p2align=3
	local.get 16
	i32.const 48
	i32.add 
	local.tee 16
	local.get 16
	v128.load 0:p2align=3
	local.get 17
	i32.const 48
	i32.add 
	v128.load 0:p2align=3
	local.get 34
	f64x2.sub
	local.tee 49
	local.get 33
	local.get 49
	local.get 49
	f64x2.mul
	local.get 18
	i32.const 48
	i32.add 
	v128.load 0:p2align=3
	local.get 32
	f64x2.sub
	local.tee 49
	local.get 49
	f64x2.mul
	f64x2.add
	f64x2.add
	local.tee 53
	local.get 35
	f64x2.ne
	local.get 19
	i32.const 48
	i32.add 
	v128.load 0:p2align=3
	local.get 31
	f64x2.mul
	local.get 53
	local.get 53
	f64x2.sqrt
	f64x2.mul
	f64x2.div
	v128.and
	local.tee 53
	f64x2.mul
	local.tee 54
	local.get 42
	i32.const 48
	i32.add 
	v128.load 0:p2align=3
	local.tee 55
	f64x2.mul
	f64x2.sub
	v128.store 0:p2align=3
	local.get 13
	local.get 15
	i32.add 
	local.tee 16
	local.get 16
	v128.load 0:p2align=3
	local.get 43
	local.get 38
	local.get 40
	f64x2.mul
	local.tee 38
	f64x2.mul
	f64x2.sub
	v128.store 0:p2align=3
	local.get 16
	i32.const 16
	i32.add 
	local.tee 17
	local.get 17
	v128.load 0:p2align=3
	local.get 48
	local.get 39
	local.get 46
	f64x2.mul
	local.tee 39
	f64x2.mul
	f64x2.sub
	v128.store 0:p2align=3
	local.get 16
	i32.const 32
	i32.add 
	local.tee 17
	local.get 17
	v128.load 0:p2align=3
	local.get 52
	local.get 45
	local.get 50
	f64x2.mul
	local.tee 45
	f64x2.mul
	f64x2.sub
	v128.store 0:p2align=3
	local.get 16
	i32.const 48
	i32.add 
	local.tee 16
	local.get 16
	v128.load 0:p2align=3
	local.get 55
	local.get 49
	local.get 53
	f64x2.mul
	local.tee 49
	f64x2.mul
	f64x2.sub
	v128.store 0:p2align=3
	local.get 39
	local.get 29
	f64x2.add
	local.set 29
	local.get 38
	local.get 28
	f64x2.add
	local.set 28
	local.get 47
	local.get 26
	f64x2.add
	local.set 26
	local.get 41
	local.get 25
	f64x2.add
	local.set 25
	local.get 54
	local.get 37
	f64x2.add
	local.set 37
	local.get 49
	local.get 36
	f64x2.add
	local.set 36
	local.get 45
	local.get 27
	f64x2.add
	local.set 27
	local.get 51
	local.get 24
	f64x2.add
	local.set 24
	local.get 30
	local.get 15
	i32.const 64
	i32.add 
	local.tee 15
	i32.ne 
	br_if 0
	end_loop
	local.get 36
	f64x2.extract_lane 1
	local.set 21
	local.get 36
	f64x2.extract_lane 0
	local.set 20
	local.get 37
	f64x2.extract_lane 1
	local.set 23
	local.get 37
	f64x2.extract_lane 0
	local.set 22
	end_block
	block 
	block 
	local.get 14
	i32.const 7
	i32.and 
	local.tee 15
	local.get 12
	i32.const 7
	i32.and 
	local.tee 16
	local.get 15
	local.get 16
	i32.lt_u
	i32.select
	local.tee 15
	local.get 10
	i32.const 7
	i32.and 
	local.tee 16
	local.get 8
	i32.const 7
	i32.and 
	local.tee 17
	local.get 6
	i32.const 7
	i32.and 
	local.tee 18
	local.get 4
	i32.const 7
	i32.and 
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
	local.tee 17
	br_if 0
	local.get 25
	local.set 35
	local.get 28
	local.set 31
	br 1
	end_block
	local.get 11
	local.get 12
	i32.const 134217720
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	local.tee 15
	local.get 15
	f64.load 0
	local.get 9
	local.get 10
	i32.const 268435448
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	local.tee 18
	f64.load 0
	local.tee 56
	local.get 3
	local.get 4
	i32.const 268435448
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	local.tee 19
	f64.load 0
	local.get 1
	f64.load 0
	local.tee 57
	f64.sub 
	local.tee 58
	f64.const 0x0p0
	local.get 7
	local.get 8
	i32.const 268435448
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	local.tee 42
	f64.load 0
	local.get 1
	f64.load 16
	local.tee 59
	f64.mul 
	local.get 2
	local.get 58
	local.get 58
	f64.mul 
	local.get 5
	local.get 6
	i32.const 268435448
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	local.tee 44
	f64.load 0
	local.get 1
	f64.load 8
	local.tee 60
	f64.sub 
	local.tee 58
	local.get 58
	f64.mul 
	f64.add 
	f64.add 
	local.tee 61
	local.get 61
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 61
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 61
	f64.mul 
	local.tee 62
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 13
	local.get 14
	i32.const 134217720
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	local.tee 16
	local.get 16
	f64.load 0
	local.get 56
	local.get 58
	local.get 61
	f64.mul 
	local.tee 58
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 28
	v128.const -0x0p0, -0x0p0
	local.tee 35
	local.get 58
	f64x2.replace_lane 0
	f64x2.add
	local.set 31
	local.get 25
	local.get 35
	local.get 62
	f64x2.replace_lane 0
	f64x2.add
	local.set 35
	local.get 17
	i32.const 1
	i32.eq 
	br_if 0
	local.get 15
	local.get 15
	f64.load 8
	local.get 18
	f64.load 8
	local.tee 56
	local.get 19
	f64.load 8
	local.get 57
	f64.sub 
	local.tee 58
	f64.const 0x0p0
	local.get 42
	f64.load 8
	local.get 59
	f64.mul 
	local.get 2
	local.get 58
	local.get 58
	f64.mul 
	local.get 44
	f64.load 8
	local.get 60
	f64.sub 
	local.tee 58
	local.get 58
	f64.mul 
	f64.add 
	f64.add 
	local.tee 61
	local.get 61
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 61
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 61
	f64.mul 
	local.tee 62
	f64.mul 
	f64.sub 
	f64.store 8
	local.get 16
	local.get 16
	f64.load 8
	local.get 56
	local.get 58
	local.get 61
	f64.mul 
	local.tee 58
	f64.mul 
	f64.sub 
	f64.store 8
	local.get 31
	local.get 28
	f64x2.extract_lane 1
	local.get 58
	f64.add 
	f64x2.replace_lane 1
	local.set 31
	local.get 35
	local.get 25
	f64x2.extract_lane 1
	local.get 62
	f64.add 
	f64x2.replace_lane 1
	local.set 35
	local.get 17
	i32.const 2
	i32.eq 
	br_if 0
	local.get 15
	local.get 15
	f64.load 16
	local.get 18
	f64.load 16
	local.tee 56
	local.get 19
	f64.load 16
	local.get 57
	f64.sub 
	local.tee 58
	f64.const 0x0p0
	local.get 42
	f64.load 16
	local.get 59
	f64.mul 
	local.get 2
	local.get 58
	local.get 58
	f64.mul 
	local.get 44
	f64.load 16
	local.get 60
	f64.sub 
	local.tee 58
	local.get 58
	f64.mul 
	f64.add 
	f64.add 
	local.tee 61
	local.get 61
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 61
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 61
	f64.mul 
	local.tee 62
	f64.mul 
	f64.sub 
	f64.store 16
	local.get 16
	local.get 16
	f64.load 16
	local.get 56
	local.get 58
	local.get 61
	f64.mul 
	local.tee 58
	f64.mul 
	f64.sub 
	f64.store 16
	local.get 29
	f64x2.extract_lane 0
	local.get 58
	f64.add 
	local.set 58
	local.get 26
	f64x2.extract_lane 0
	local.get 62
	f64.add 
	local.set 61
	block 
	local.get 17
	i32.const 3
	i32.ne 
	br_if 0
	local.get 29
	local.get 58
	f64x2.replace_lane 0
	local.set 29
	local.get 26
	local.get 61
	f64x2.replace_lane 0
	local.set 26
	br 1
	end_block
	local.get 15
	local.get 15
	f64.load 24
	local.get 18
	f64.load 24
	local.tee 63
	local.get 19
	f64.load 24
	local.get 57
	f64.sub 
	local.tee 56
	f64.const 0x0p0
	local.get 42
	f64.load 24
	local.get 59
	f64.mul 
	local.get 2
	local.get 56
	local.get 56
	f64.mul 
	local.get 44
	f64.load 24
	local.get 60
	f64.sub 
	local.tee 56
	local.get 56
	f64.mul 
	f64.add 
	f64.add 
	local.tee 62
	local.get 62
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 62
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 62
	f64.mul 
	local.tee 64
	f64.mul 
	f64.sub 
	f64.store 24
	local.get 16
	local.get 16
	f64.load 24
	local.get 63
	local.get 56
	local.get 62
	f64.mul 
	local.tee 56
	f64.mul 
	f64.sub 
	f64.store 24
	local.get 29
	local.get 58
	f64x2.replace_lane 0
	local.get 29
	f64x2.extract_lane 1
	local.get 56
	f64.add 
	f64x2.replace_lane 1
	local.set 29
	local.get 26
	local.get 61
	f64x2.replace_lane 0
	local.get 26
	f64x2.extract_lane 1
	local.get 64
	f64.add 
	f64x2.replace_lane 1
	local.set 26
	local.get 17
	i32.const 4
	i32.eq 
	br_if 0
	local.get 15
	local.get 15
	f64.load 32
	local.get 18
	f64.load 32
	local.tee 56
	local.get 19
	f64.load 32
	local.get 57
	f64.sub 
	local.tee 58
	f64.const 0x0p0
	local.get 42
	f64.load 32
	local.get 59
	f64.mul 
	local.get 2
	local.get 58
	local.get 58
	f64.mul 
	local.get 44
	f64.load 32
	local.get 60
	f64.sub 
	local.tee 58
	local.get 58
	f64.mul 
	f64.add 
	f64.add 
	local.tee 61
	local.get 61
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 61
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 61
	f64.mul 
	local.tee 62
	f64.mul 
	f64.sub 
	f64.store 32
	local.get 16
	local.get 16
	f64.load 32
	local.get 56
	local.get 58
	local.get 61
	f64.mul 
	local.tee 58
	f64.mul 
	f64.sub 
	f64.store 32
	local.get 27
	local.get 27
	f64x2.extract_lane 0
	local.get 58
	f64.add 
	f64x2.replace_lane 0
	local.set 32
	local.get 24
	local.get 24
	f64x2.extract_lane 0
	local.get 62
	f64.add 
	f64x2.replace_lane 0
	local.set 33
	block 
	local.get 17
	i32.const 5
	i32.ne 
	br_if 0
	local.get 33
	local.set 24
	local.get 32
	local.set 27
	br 1
	end_block
	local.get 15
	local.get 15
	f64.load 40
	local.get 18
	f64.load 40
	local.tee 56
	local.get 19
	f64.load 40
	local.get 57
	f64.sub 
	local.tee 58
	f64.const 0x0p0
	local.get 42
	f64.load 40
	local.get 59
	f64.mul 
	local.get 2
	local.get 58
	local.get 58
	f64.mul 
	local.get 44
	f64.load 40
	local.get 60
	f64.sub 
	local.tee 58
	local.get 58
	f64.mul 
	f64.add 
	f64.add 
	local.tee 61
	local.get 61
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 61
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 61
	f64.mul 
	local.tee 62
	f64.mul 
	f64.sub 
	f64.store 40
	local.get 16
	local.get 16
	f64.load 40
	local.get 56
	local.get 58
	local.get 61
	f64.mul 
	local.tee 58
	f64.mul 
	f64.sub 
	f64.store 40
	local.get 32
	local.get 27
	f64x2.extract_lane 1
	local.get 58
	f64.add 
	f64x2.replace_lane 1
	local.set 27
	local.get 33
	local.get 24
	f64x2.extract_lane 1
	local.get 62
	f64.add 
	f64x2.replace_lane 1
	local.set 24
	local.get 17
	i32.const 6
	i32.eq 
	br_if 0
	local.get 15
	local.get 15
	f64.load 48
	local.get 18
	f64.load 48
	local.tee 61
	local.get 19
	f64.load 48
	local.get 57
	f64.sub 
	local.tee 58
	f64.const 0x0p0
	local.get 42
	f64.load 48
	local.get 59
	f64.mul 
	local.get 2
	local.get 58
	local.get 58
	f64.mul 
	local.get 44
	f64.load 48
	local.get 60
	f64.sub 
	local.tee 58
	local.get 58
	f64.mul 
	f64.add 
	f64.add 
	local.tee 2
	local.get 2
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 2
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 2
	f64.mul 
	local.tee 56
	f64.mul 
	f64.sub 
	f64.store 48
	local.get 16
	local.get 16
	f64.load 48
	local.get 61
	local.get 58
	local.get 2
	f64.mul 
	local.tee 2
	f64.mul 
	f64.sub 
	f64.store 48
	local.get 20
	local.get 2
	f64.add 
	local.set 20
	local.get 22
	local.get 56
	f64.add 
	local.set 22
	end_block
	local.get 0
	local.get 31
	v128.store 64:p2align=3
	local.get 0
	local.get 35
	v128.store 0:p2align=3
	local.get 0
	local.get 21
	f64.store 120
	local.get 0
	local.get 20
	f64.store 112
	local.get 0
	local.get 27
	v128.store 96:p2align=3
	local.get 0
	local.get 23
	f64.store 56
	local.get 0
	local.get 22
	f64.store 48
	local.get 0
	local.get 24
	v128.store 32:p2align=3
	local.get 0
	local.get 29
	v128.store 80:p2align=3
	local.get 0
	local.get 26
	v128.store 16:p2align=3
	end_function
