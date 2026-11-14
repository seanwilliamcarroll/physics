engine::force::sweep::<f64>:
	.functype	engine::force::sweep::<f64> (i32, i32, f64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) -> ()
	.local  	i32, i32, i32, i32, i32, i32, i32, f64, f64, i32, v128, f64, v128, f64, v128, f64, v128, f64, f64, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, i32, f64, f64, f64, f64, f64, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, f64, f64, f64, f64, f64, v128, v128, v128, v128, v128, v128, v128, v128
	global.get __stack_pointer
	i32.const 256
	i32.sub 
	local.tee 15
	global.set __stack_pointer
	i32.const 0
	local.set 16
	local.get 15
	i32.const 8
	i32.add 
	i32.const 0
	i32.const 120
	memory.fill 0
	local.get 15
	i32.const 128
	i32.add 
	i32.const 8
	i32.add 
	i32.const 0
	i32.const 120
	memory.fill 0
	block 
	block 
	local.get 14
	i32.const 4
	i32.shr_u
	local.tee 17
	local.get 12
	i32.const 4
	i32.shr_u
	local.tee 18
	local.get 17
	local.get 18
	i32.lt_u
	i32.select
	local.tee 17
	local.get 10
	i32.const 4
	i32.shr_u
	local.tee 18
	local.get 8
	i32.const 4
	i32.shr_u
	local.tee 19
	local.get 6
	i32.const 4
	i32.shr_u
	local.tee 20
	local.get 4
	i32.const 4
	i32.shr_u
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
	local.get 17
	local.get 18
	i32.lt_u
	i32.select
	local.tee 17
	br_if 0
	f64.const 0x0p0
	local.set 22
	f64.const 0x0p0
	local.set 23
	br 1
	end_block
	local.get 17
	i32.const 7
	i32.shl 
	local.set 24
	local.get 2
	f64x2.splat
	local.set 25
	local.get 1
	f64.load 16
	local.tee 26
	f64x2.splat
	local.set 27
	local.get 1
	f64.load 8
	local.tee 28
	f64x2.splat
	local.set 29
	local.get 1
	f64.load 0
	local.tee 30
	f64x2.splat
	local.set 31
	f64.const 0x0p0
	local.set 32
	f64.const 0x0p0
	local.set 33
	f64.const 0x0p0
	local.set 23
	f64.const 0x0p0
	local.set 22
	v128.const 0x0p0, 0x0p0
	local.tee 34
	local.set 35
	local.get 34
	local.set 36
	local.get 34
	local.set 37
	local.get 34
	local.set 38
	local.get 34
	local.set 39
	local.get 34
	local.set 40
	local.get 34
	local.set 41
	local.get 34
	local.set 42
	local.get 34
	local.set 43
	local.get 34
	local.set 44
	local.get 34
	local.set 45
	local.get 34
	local.set 46
	local.get 34
	local.set 47
	local.get 34
	local.set 48
	loop 
	local.get 7
	local.get 16
	i32.add 
	local.tee 18
	i32.const 104
	i32.add 
	v128.load 0:p2align=3
	local.set 49
	local.get 3
	local.get 16
	i32.add 
	local.tee 19
	i32.const 104
	i32.add 
	v128.load 0:p2align=3
	local.set 50
	local.get 5
	local.get 16
	i32.add 
	local.tee 20
	i32.const 104
	i32.add 
	v128.load 0:p2align=3
	local.set 51
	local.get 11
	local.get 16
	i32.add 
	local.tee 17
	i32.const 120
	i32.add 
	local.tee 52
	f64.load 0
	local.set 53
	local.get 9
	local.get 16
	i32.add 
	local.tee 21
	i32.const 120
	i32.add 
	f64.load 0
	local.set 54
	local.get 18
	i32.const 120
	i32.add 
	f64.load 0
	local.set 55
	local.get 19
	i32.const 120
	i32.add 
	f64.load 0
	local.set 56
	local.get 20
	i32.const 120
	i32.add 
	f64.load 0
	local.set 57
	local.get 18
	i32.const 88
	i32.add 
	v128.load 0:p2align=3
	local.set 58
	local.get 19
	i32.const 88
	i32.add 
	v128.load 0:p2align=3
	local.set 59
	local.get 20
	i32.const 88
	i32.add 
	v128.load 0:p2align=3
	local.set 60
	local.get 18
	i32.const 72
	i32.add 
	v128.load 0:p2align=3
	local.set 61
	local.get 19
	i32.const 72
	i32.add 
	v128.load 0:p2align=3
	local.set 62
	local.get 20
	i32.const 72
	i32.add 
	v128.load 0:p2align=3
	local.set 63
	local.get 18
	i32.const 56
	i32.add 
	v128.load 0:p2align=3
	local.set 64
	local.get 19
	i32.const 56
	i32.add 
	v128.load 0:p2align=3
	local.set 65
	local.get 20
	i32.const 56
	i32.add 
	v128.load 0:p2align=3
	local.set 66
	local.get 18
	i32.const 40
	i32.add 
	v128.load 0:p2align=3
	local.set 67
	local.get 19
	i32.const 40
	i32.add 
	v128.load 0:p2align=3
	local.set 68
	local.get 20
	i32.const 40
	i32.add 
	v128.load 0:p2align=3
	local.set 69
	local.get 18
	i32.const 24
	i32.add 
	v128.load 0:p2align=3
	local.set 70
	local.get 19
	i32.const 24
	i32.add 
	v128.load 0:p2align=3
	local.set 71
	local.get 20
	i32.const 24
	i32.add 
	v128.load 0:p2align=3
	local.set 72
	local.get 18
	i32.const 8
	i32.add 
	v128.load 0:p2align=3
	local.set 73
	local.get 19
	i32.const 8
	i32.add 
	v128.load 0:p2align=3
	local.set 74
	local.get 20
	i32.const 8
	i32.add 
	v128.load 0:p2align=3
	local.set 75
	local.get 17
	local.get 17
	f64.load 0
	local.get 19
	f64.load 0
	local.get 30
	f64.sub 
	local.tee 76
	f64.const 0x0p0
	local.get 18
	f64.load 0
	local.get 26
	f64.mul 
	local.get 2
	local.get 76
	local.get 76
	f64.mul 
	local.get 20
	f64.load 0
	local.get 28
	f64.sub 
	local.tee 76
	local.get 76
	f64.mul 
	f64.add 
	f64.add 
	local.tee 77
	local.get 77
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 77
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 78
	f64.mul 
	local.tee 79
	local.get 21
	f64.load 0
	local.tee 80
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 17
	i32.const 8
	i32.add 
	local.tee 18
	local.get 18
	v128.load 0:p2align=3
	local.get 74
	local.get 31
	f64x2.sub
	local.tee 74
	local.get 25
	local.get 74
	local.get 74
	f64x2.mul
	local.get 75
	local.get 29
	f64x2.sub
	local.tee 74
	local.get 74
	f64x2.mul
	f64x2.add
	f64x2.add
	local.tee 75
	local.get 34
	f64x2.ne
	local.get 73
	local.get 27
	f64x2.mul
	local.get 75
	local.get 75
	f64x2.sqrt
	f64x2.mul
	f64x2.div
	v128.and
	local.tee 73
	f64x2.mul
	local.tee 81
	local.get 21
	i32.const 8
	i32.add 
	v128.load 0:p2align=3
	local.tee 82
	f64x2.mul
	f64x2.sub
	v128.store 0:p2align=3
	local.get 17
	i32.const 24
	i32.add 
	local.tee 18
	local.get 18
	v128.load 0:p2align=3
	local.get 71
	local.get 31
	f64x2.sub
	local.tee 75
	local.get 25
	local.get 75
	local.get 75
	f64x2.mul
	local.get 72
	local.get 29
	f64x2.sub
	local.tee 75
	local.get 75
	f64x2.mul
	f64x2.add
	f64x2.add
	local.tee 71
	local.get 34
	f64x2.ne
	local.get 70
	local.get 27
	f64x2.mul
	local.get 71
	local.get 71
	f64x2.sqrt
	f64x2.mul
	f64x2.div
	v128.and
	local.tee 70
	f64x2.mul
	local.tee 72
	local.get 21
	i32.const 24
	i32.add 
	v128.load 0:p2align=3
	local.tee 83
	f64x2.mul
	f64x2.sub
	v128.store 0:p2align=3
	local.get 17
	i32.const 40
	i32.add 
	local.tee 18
	local.get 18
	v128.load 0:p2align=3
	local.get 68
	local.get 31
	f64x2.sub
	local.tee 71
	local.get 25
	local.get 71
	local.get 71
	f64x2.mul
	local.get 69
	local.get 29
	f64x2.sub
	local.tee 71
	local.get 71
	f64x2.mul
	f64x2.add
	f64x2.add
	local.tee 68
	local.get 34
	f64x2.ne
	local.get 67
	local.get 27
	f64x2.mul
	local.get 68
	local.get 68
	f64x2.sqrt
	f64x2.mul
	f64x2.div
	v128.and
	local.tee 67
	f64x2.mul
	local.tee 69
	local.get 21
	i32.const 40
	i32.add 
	v128.load 0:p2align=3
	local.tee 84
	f64x2.mul
	f64x2.sub
	v128.store 0:p2align=3
	local.get 17
	i32.const 56
	i32.add 
	local.tee 18
	local.get 18
	v128.load 0:p2align=3
	local.get 65
	local.get 31
	f64x2.sub
	local.tee 68
	local.get 25
	local.get 68
	local.get 68
	f64x2.mul
	local.get 66
	local.get 29
	f64x2.sub
	local.tee 68
	local.get 68
	f64x2.mul
	f64x2.add
	f64x2.add
	local.tee 65
	local.get 34
	f64x2.ne
	local.get 64
	local.get 27
	f64x2.mul
	local.get 65
	local.get 65
	f64x2.sqrt
	f64x2.mul
	f64x2.div
	v128.and
	local.tee 64
	f64x2.mul
	local.tee 66
	local.get 21
	i32.const 56
	i32.add 
	v128.load 0:p2align=3
	local.tee 85
	f64x2.mul
	f64x2.sub
	v128.store 0:p2align=3
	local.get 17
	i32.const 72
	i32.add 
	local.tee 18
	local.get 18
	v128.load 0:p2align=3
	local.get 62
	local.get 31
	f64x2.sub
	local.tee 65
	local.get 25
	local.get 65
	local.get 65
	f64x2.mul
	local.get 63
	local.get 29
	f64x2.sub
	local.tee 65
	local.get 65
	f64x2.mul
	f64x2.add
	f64x2.add
	local.tee 62
	local.get 34
	f64x2.ne
	local.get 61
	local.get 27
	f64x2.mul
	local.get 62
	local.get 62
	f64x2.sqrt
	f64x2.mul
	f64x2.div
	v128.and
	local.tee 61
	f64x2.mul
	local.tee 63
	local.get 21
	i32.const 72
	i32.add 
	v128.load 0:p2align=3
	local.tee 86
	f64x2.mul
	f64x2.sub
	v128.store 0:p2align=3
	local.get 17
	i32.const 88
	i32.add 
	local.tee 18
	local.get 18
	v128.load 0:p2align=3
	local.get 59
	local.get 31
	f64x2.sub
	local.tee 62
	local.get 25
	local.get 62
	local.get 62
	f64x2.mul
	local.get 60
	local.get 29
	f64x2.sub
	local.tee 62
	local.get 62
	f64x2.mul
	f64x2.add
	f64x2.add
	local.tee 59
	local.get 34
	f64x2.ne
	local.get 58
	local.get 27
	f64x2.mul
	local.get 59
	local.get 59
	f64x2.sqrt
	f64x2.mul
	f64x2.div
	v128.and
	local.tee 58
	f64x2.mul
	local.tee 60
	local.get 21
	i32.const 88
	i32.add 
	v128.load 0:p2align=3
	local.tee 87
	f64x2.mul
	f64x2.sub
	v128.store 0:p2align=3
	local.get 17
	i32.const 104
	i32.add 
	local.tee 17
	v128.load 0:p2align=3
	local.set 88
	local.get 21
	i32.const 104
	i32.add 
	v128.load 0:p2align=3
	local.set 59
	local.get 52
	local.get 53
	local.get 54
	local.get 56
	local.get 30
	f64.sub 
	local.tee 77
	f64.const 0x0p0
	local.get 55
	local.get 26
	f64.mul 
	local.get 2
	local.get 77
	local.get 77
	f64.mul 
	local.get 57
	local.get 28
	f64.sub 
	local.tee 77
	local.get 77
	f64.mul 
	f64.add 
	f64.add 
	local.tee 55
	local.get 55
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 55
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 55
	f64.mul 
	local.tee 56
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 17
	local.get 88
	local.get 59
	local.get 50
	local.get 31
	f64x2.sub
	local.tee 50
	local.get 25
	local.get 50
	local.get 50
	f64x2.mul
	local.get 51
	local.get 29
	f64x2.sub
	local.tee 50
	local.get 50
	f64x2.mul
	f64x2.add
	f64x2.add
	local.tee 51
	local.get 34
	f64x2.ne
	local.get 49
	local.get 27
	f64x2.mul
	local.get 51
	local.get 51
	f64x2.sqrt
	f64x2.mul
	f64x2.div
	v128.and
	local.tee 51
	f64x2.mul
	local.tee 49
	f64x2.mul
	f64x2.sub
	v128.store 0:p2align=3
	local.get 13
	local.get 16
	i32.add 
	local.tee 17
	i32.const 120
	i32.add 
	local.tee 18
	f64.load 0
	local.set 53
	local.get 17
	local.get 17
	f64.load 0
	local.get 80
	local.get 76
	local.get 78
	f64.mul 
	local.tee 76
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 17
	i32.const 8
	i32.add 
	local.tee 19
	local.get 19
	v128.load 0:p2align=3
	local.get 82
	local.get 74
	local.get 73
	f64x2.mul
	local.tee 74
	f64x2.mul
	f64x2.sub
	v128.store 0:p2align=3
	local.get 17
	i32.const 24
	i32.add 
	local.tee 19
	local.get 19
	v128.load 0:p2align=3
	local.get 83
	local.get 75
	local.get 70
	f64x2.mul
	local.tee 75
	f64x2.mul
	f64x2.sub
	v128.store 0:p2align=3
	local.get 17
	i32.const 40
	i32.add 
	local.tee 19
	local.get 19
	v128.load 0:p2align=3
	local.get 84
	local.get 71
	local.get 67
	f64x2.mul
	local.tee 71
	f64x2.mul
	f64x2.sub
	v128.store 0:p2align=3
	local.get 17
	i32.const 56
	i32.add 
	local.tee 19
	local.get 19
	v128.load 0:p2align=3
	local.get 85
	local.get 68
	local.get 64
	f64x2.mul
	local.tee 68
	f64x2.mul
	f64x2.sub
	v128.store 0:p2align=3
	local.get 17
	i32.const 72
	i32.add 
	local.tee 19
	local.get 19
	v128.load 0:p2align=3
	local.get 86
	local.get 65
	local.get 61
	f64x2.mul
	local.tee 65
	f64x2.mul
	f64x2.sub
	v128.store 0:p2align=3
	local.get 17
	i32.const 88
	i32.add 
	local.tee 19
	local.get 19
	v128.load 0:p2align=3
	local.get 87
	local.get 62
	local.get 58
	f64x2.mul
	local.tee 62
	f64x2.mul
	f64x2.sub
	v128.store 0:p2align=3
	local.get 17
	i32.const 104
	i32.add 
	local.tee 17
	v128.load 0:p2align=3
	local.set 58
	local.get 18
	local.get 53
	local.get 54
	local.get 77
	local.get 55
	f64.mul 
	local.tee 77
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 17
	local.get 58
	local.get 59
	local.get 50
	local.get 51
	f64x2.mul
	local.tee 50
	f64x2.mul
	f64x2.sub
	v128.store 0:p2align=3
	local.get 76
	local.get 22
	f64.add 
	local.set 22
	local.get 79
	local.get 23
	f64.add 
	local.set 23
	local.get 77
	local.get 32
	f64.add 
	local.set 32
	local.get 56
	local.get 33
	f64.add 
	local.set 33
	local.get 50
	local.get 48
	f64x2.add
	local.set 48
	local.get 62
	local.get 47
	f64x2.add
	local.set 47
	local.get 65
	local.get 46
	f64x2.add
	local.set 46
	local.get 68
	local.get 45
	f64x2.add
	local.set 45
	local.get 71
	local.get 44
	f64x2.add
	local.set 44
	local.get 75
	local.get 43
	f64x2.add
	local.set 43
	local.get 74
	local.get 42
	f64x2.add
	local.set 42
	local.get 49
	local.get 41
	f64x2.add
	local.set 41
	local.get 60
	local.get 40
	f64x2.add
	local.set 40
	local.get 63
	local.get 39
	f64x2.add
	local.set 39
	local.get 66
	local.get 38
	f64x2.add
	local.set 38
	local.get 69
	local.get 37
	f64x2.add
	local.set 37
	local.get 72
	local.get 36
	f64x2.add
	local.set 36
	local.get 81
	local.get 35
	f64x2.add
	local.set 35
	local.get 24
	local.get 16
	i32.const 128
	i32.add 
	local.tee 16
	i32.ne 
	br_if 0
	end_loop
	local.get 15
	local.get 33
	f64.store 120
	local.get 15
	local.get 41
	v128.store 104:p2align=3
	local.get 15
	local.get 40
	v128.store 88:p2align=3
	local.get 15
	local.get 39
	v128.store 72:p2align=3
	local.get 15
	local.get 38
	v128.store 56:p2align=3
	local.get 15
	local.get 37
	v128.store 40:p2align=3
	local.get 15
	local.get 36
	v128.store 24:p2align=3
	local.get 15
	local.get 35
	v128.store 8:p2align=3
	local.get 15
	local.get 32
	f64.store 248
	local.get 15
	local.get 48
	v128.store 232:p2align=3
	local.get 15
	local.get 47
	v128.store 216:p2align=3
	local.get 15
	local.get 46
	v128.store 200:p2align=3
	local.get 15
	local.get 45
	v128.store 184:p2align=3
	local.get 15
	local.get 44
	v128.store 168:p2align=3
	local.get 15
	local.get 43
	v128.store 152:p2align=3
	local.get 15
	local.get 42
	v128.store 136:p2align=3
	end_block
	local.get 15
	local.get 22
	f64.store 128
	local.get 15
	local.get 23
	f64.store 0
	block 
	local.get 14
	i32.const 15
	i32.and 
	local.tee 17
	local.get 12
	i32.const 15
	i32.and 
	local.tee 18
	local.get 17
	local.get 18
	i32.lt_u
	i32.select
	local.tee 17
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
	local.get 17
	local.get 18
	i32.lt_u
	i32.select
	local.tee 24
	i32.eqz
	br_if 0
	local.get 13
	local.get 14
	i32.const 134217712
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	local.set 17
	local.get 11
	local.get 12
	i32.const 134217712
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	local.set 18
	local.get 9
	local.get 10
	i32.const 268435440
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	local.set 21
	local.get 7
	local.get 8
	i32.const 268435440
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	local.set 16
	local.get 5
	local.get 6
	i32.const 268435440
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	local.set 52
	local.get 3
	local.get 4
	i32.const 268435440
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	local.set 13
	local.get 1
	f64.load 16
	local.set 55
	local.get 1
	f64.load 8
	local.set 22
	local.get 1
	f64.load 0
	local.set 23
	local.get 15
	i32.const 128
	i32.add 
	local.set 19
	local.get 15
	local.set 20
	loop 
	local.get 20
	local.get 20
	f64.load 0
	local.get 13
	f64.load 0
	local.get 23
	f64.sub 
	local.tee 54
	f64.const 0x0p0
	local.get 16
	f64.load 0
	local.get 55
	f64.mul 
	local.get 2
	local.get 54
	local.get 54
	f64.mul 
	local.get 52
	f64.load 0
	local.get 22
	f64.sub 
	local.tee 54
	local.get 54
	f64.mul 
	f64.add 
	f64.add 
	local.tee 76
	local.get 76
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 76
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 76
	f64.mul 
	local.tee 77
	f64.add 
	f64.store 0
	local.get 19
	local.get 19
	f64.load 0
	local.get 54
	local.get 76
	f64.mul 
	local.tee 54
	f64.add 
	f64.store 0
	local.get 18
	local.get 18
	f64.load 0
	local.get 21
	f64.load 0
	local.tee 76
	local.get 77
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 17
	local.get 17
	f64.load 0
	local.get 76
	local.get 54
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 20
	i32.const 8
	i32.add 
	local.set 20
	local.get 19
	i32.const 8
	i32.add 
	local.set 19
	local.get 13
	i32.const 8
	i32.add 
	local.set 13
	local.get 52
	i32.const 8
	i32.add 
	local.set 52
	local.get 16
	i32.const 8
	i32.add 
	local.set 16
	local.get 21
	i32.const 8
	i32.add 
	local.set 21
	local.get 18
	i32.const 8
	i32.add 
	local.set 18
	local.get 17
	i32.const 8
	i32.add 
	local.set 17
	local.get 24
	i32.const -1
	i32.add 
	local.tee 24
	br_if 0
	end_loop
	end_block
	local.get 0
	local.get 15
	i32.const 128
	memory.copy 0, 0
	local.get 0
	i32.const 128
	i32.add 
	local.get 15
	i32.const 128
	i32.add 
	i32.const 128
	memory.copy 0, 0
	local.get 15
	i32.const 256
	i32.add 
	global.set __stack_pointer
	end_function
