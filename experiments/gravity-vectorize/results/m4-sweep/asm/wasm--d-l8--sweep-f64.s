engine::force::sweep::<f64>:
	.functype	engine::force::sweep::<f64> (i32, i32, f64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) -> ()
	.local  	i32, i32, i32, i32, i32, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, i32, f64, f64, f64, i32, f64, f64, f64, f64, i32, f64, i32, f64, f64, f64, f64, f64, i32, f64, f64, f64, f64, f64, i32, f64, f64, f64, f64, f64, i32, f64, f64, f64, f64, f64, i32, f64, f64, f64, f64, f64, i32, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64
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
	f64.const 0x0p0
	local.set 24
	f64.const 0x0p0
	local.set 25
	f64.const 0x0p0
	local.set 26
	f64.const 0x0p0
	local.set 27
	f64.const 0x0p0
	local.set 28
	f64.const 0x0p0
	local.set 29
	f64.const 0x0p0
	local.set 30
	f64.const 0x0p0
	local.set 31
	f64.const 0x0p0
	local.set 32
	f64.const 0x0p0
	local.set 33
	f64.const 0x0p0
	local.set 34
	f64.const 0x0p0
	local.set 35
	br 1
	end_block
	local.get 15
	i32.const 6
	i32.shl 
	local.set 36
	local.get 1
	f64.load 16
	local.set 37
	local.get 1
	f64.load 8
	local.set 38
	local.get 1
	f64.load 0
	local.set 39
	i32.const 0
	local.set 16
	f64.const 0x0p0
	local.set 26
	f64.const 0x0p0
	local.set 25
	f64.const 0x0p0
	local.set 24
	f64.const 0x0p0
	local.set 23
	f64.const 0x0p0
	local.set 22
	f64.const 0x0p0
	local.set 21
	f64.const 0x0p0
	local.set 20
	f64.const 0x0p0
	local.set 33
	f64.const 0x0p0
	local.set 32
	f64.const 0x0p0
	local.set 31
	f64.const 0x0p0
	local.set 30
	f64.const 0x0p0
	local.set 29
	f64.const 0x0p0
	local.set 28
	f64.const 0x0p0
	local.set 27
	f64.const 0x0p0
	local.set 35
	f64.const 0x0p0
	local.set 34
	loop 
	local.get 11
	local.get 16
	i32.add 
	local.tee 15
	i32.const 8
	i32.add 
	local.tee 40
	f64.load 0
	local.set 41
	local.get 9
	local.get 16
	i32.add 
	local.tee 17
	i32.const 8
	i32.add 
	f64.load 0
	local.set 42
	local.get 7
	local.get 16
	i32.add 
	local.tee 18
	i32.const 8
	i32.add 
	f64.load 0
	local.set 43
	local.get 3
	local.get 16
	i32.add 
	local.tee 19
	i32.const 8
	i32.add 
	f64.load 0
	local.set 44
	local.get 5
	local.get 16
	i32.add 
	local.tee 45
	i32.const 8
	i32.add 
	f64.load 0
	local.set 46
	local.get 15
	i32.const 16
	i32.add 
	local.tee 47
	f64.load 0
	local.set 48
	local.get 17
	i32.const 16
	i32.add 
	f64.load 0
	local.set 49
	local.get 18
	i32.const 16
	i32.add 
	f64.load 0
	local.set 50
	local.get 19
	i32.const 16
	i32.add 
	f64.load 0
	local.set 51
	local.get 45
	i32.const 16
	i32.add 
	f64.load 0
	local.set 52
	local.get 15
	i32.const 24
	i32.add 
	local.tee 53
	f64.load 0
	local.set 54
	local.get 17
	i32.const 24
	i32.add 
	f64.load 0
	local.set 55
	local.get 18
	i32.const 24
	i32.add 
	f64.load 0
	local.set 56
	local.get 19
	i32.const 24
	i32.add 
	f64.load 0
	local.set 57
	local.get 45
	i32.const 24
	i32.add 
	f64.load 0
	local.set 58
	local.get 15
	i32.const 32
	i32.add 
	local.tee 59
	f64.load 0
	local.set 60
	local.get 17
	i32.const 32
	i32.add 
	f64.load 0
	local.set 61
	local.get 18
	i32.const 32
	i32.add 
	f64.load 0
	local.set 62
	local.get 19
	i32.const 32
	i32.add 
	f64.load 0
	local.set 63
	local.get 45
	i32.const 32
	i32.add 
	f64.load 0
	local.set 64
	local.get 15
	i32.const 40
	i32.add 
	local.tee 65
	f64.load 0
	local.set 66
	local.get 17
	i32.const 40
	i32.add 
	f64.load 0
	local.set 67
	local.get 18
	i32.const 40
	i32.add 
	f64.load 0
	local.set 68
	local.get 19
	i32.const 40
	i32.add 
	f64.load 0
	local.set 69
	local.get 45
	i32.const 40
	i32.add 
	f64.load 0
	local.set 70
	local.get 15
	i32.const 48
	i32.add 
	local.tee 71
	f64.load 0
	local.set 72
	local.get 17
	i32.const 48
	i32.add 
	f64.load 0
	local.set 73
	local.get 18
	i32.const 48
	i32.add 
	f64.load 0
	local.set 74
	local.get 19
	i32.const 48
	i32.add 
	f64.load 0
	local.set 75
	local.get 45
	i32.const 48
	i32.add 
	f64.load 0
	local.set 76
	local.get 15
	i32.const 56
	i32.add 
	local.tee 77
	f64.load 0
	local.set 78
	local.get 17
	i32.const 56
	i32.add 
	f64.load 0
	local.set 79
	local.get 18
	i32.const 56
	i32.add 
	f64.load 0
	local.set 80
	local.get 19
	i32.const 56
	i32.add 
	f64.load 0
	local.set 81
	local.get 45
	i32.const 56
	i32.add 
	f64.load 0
	local.set 82
	local.get 15
	local.get 15
	f64.load 0
	local.get 19
	f64.load 0
	local.get 39
	f64.sub 
	local.tee 83
	f64.const 0x0p0
	local.get 18
	f64.load 0
	local.get 37
	f64.mul 
	local.get 2
	local.get 83
	local.get 83
	f64.mul 
	local.get 45
	f64.load 0
	local.get 38
	f64.sub 
	local.tee 83
	local.get 83
	f64.mul 
	f64.add 
	f64.add 
	local.tee 84
	local.get 84
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 84
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 84
	f64.mul 
	local.tee 85
	local.get 17
	f64.load 0
	local.tee 86
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 13
	local.get 16
	i32.add 
	local.tee 15
	local.get 15
	f64.load 0
	local.get 86
	local.get 83
	local.get 84
	f64.mul 
	local.tee 87
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 77
	local.get 78
	local.get 79
	local.get 81
	local.get 39
	f64.sub 
	local.tee 83
	f64.const 0x0p0
	local.get 80
	local.get 37
	f64.mul 
	local.get 2
	local.get 83
	local.get 83
	f64.mul 
	local.get 82
	local.get 38
	f64.sub 
	local.tee 83
	local.get 83
	f64.mul 
	f64.add 
	f64.add 
	local.tee 84
	local.get 84
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 84
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 80
	f64.mul 
	local.tee 81
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 71
	local.get 72
	local.get 73
	local.get 75
	local.get 39
	f64.sub 
	local.tee 84
	f64.const 0x0p0
	local.get 74
	local.get 37
	f64.mul 
	local.get 2
	local.get 84
	local.get 84
	f64.mul 
	local.get 76
	local.get 38
	f64.sub 
	local.tee 84
	local.get 84
	f64.mul 
	f64.add 
	f64.add 
	local.tee 74
	local.get 74
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 74
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 75
	f64.mul 
	local.tee 76
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 65
	local.get 66
	local.get 67
	local.get 69
	local.get 39
	f64.sub 
	local.tee 74
	f64.const 0x0p0
	local.get 68
	local.get 37
	f64.mul 
	local.get 2
	local.get 74
	local.get 74
	f64.mul 
	local.get 70
	local.get 38
	f64.sub 
	local.tee 74
	local.get 74
	f64.mul 
	f64.add 
	f64.add 
	local.tee 68
	local.get 68
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 68
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 69
	f64.mul 
	local.tee 70
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 59
	local.get 60
	local.get 61
	local.get 63
	local.get 39
	f64.sub 
	local.tee 68
	f64.const 0x0p0
	local.get 62
	local.get 37
	f64.mul 
	local.get 2
	local.get 68
	local.get 68
	f64.mul 
	local.get 64
	local.get 38
	f64.sub 
	local.tee 68
	local.get 68
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
	local.tee 63
	f64.mul 
	local.tee 64
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 53
	local.get 54
	local.get 55
	local.get 57
	local.get 39
	f64.sub 
	local.tee 62
	f64.const 0x0p0
	local.get 56
	local.get 37
	f64.mul 
	local.get 2
	local.get 62
	local.get 62
	f64.mul 
	local.get 58
	local.get 38
	f64.sub 
	local.tee 62
	local.get 62
	f64.mul 
	f64.add 
	f64.add 
	local.tee 56
	local.get 56
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 56
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 57
	f64.mul 
	local.tee 58
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 47
	local.get 48
	local.get 49
	local.get 51
	local.get 39
	f64.sub 
	local.tee 56
	f64.const 0x0p0
	local.get 50
	local.get 37
	f64.mul 
	local.get 2
	local.get 56
	local.get 56
	f64.mul 
	local.get 52
	local.get 38
	f64.sub 
	local.tee 56
	local.get 56
	f64.mul 
	f64.add 
	f64.add 
	local.tee 50
	local.get 50
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 50
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 51
	f64.mul 
	local.tee 52
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 40
	local.get 41
	local.get 42
	local.get 44
	local.get 39
	f64.sub 
	local.tee 50
	f64.const 0x0p0
	local.get 43
	local.get 37
	f64.mul 
	local.get 2
	local.get 50
	local.get 50
	f64.mul 
	local.get 46
	local.get 38
	f64.sub 
	local.tee 50
	local.get 50
	f64.mul 
	f64.add 
	f64.add 
	local.tee 43
	local.get 43
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 43
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 43
	f64.mul 
	local.tee 44
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 15
	i32.const 8
	i32.add 
	local.tee 17
	local.get 17
	f64.load 0
	local.get 42
	local.get 50
	local.get 43
	f64.mul 
	local.tee 50
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 15
	i32.const 16
	i32.add 
	local.tee 17
	local.get 17
	f64.load 0
	local.get 49
	local.get 56
	local.get 51
	f64.mul 
	local.tee 42
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 15
	i32.const 24
	i32.add 
	local.tee 17
	local.get 17
	f64.load 0
	local.get 55
	local.get 62
	local.get 57
	f64.mul 
	local.tee 49
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 15
	i32.const 32
	i32.add 
	local.tee 17
	local.get 17
	f64.load 0
	local.get 61
	local.get 68
	local.get 63
	f64.mul 
	local.tee 55
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 15
	i32.const 40
	i32.add 
	local.tee 17
	local.get 17
	f64.load 0
	local.get 67
	local.get 74
	local.get 69
	f64.mul 
	local.tee 61
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 15
	i32.const 48
	i32.add 
	local.tee 17
	local.get 17
	f64.load 0
	local.get 73
	local.get 84
	local.get 75
	f64.mul 
	local.tee 67
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 15
	i32.const 56
	i32.add 
	local.tee 15
	local.get 15
	f64.load 0
	local.get 79
	local.get 83
	local.get 80
	f64.mul 
	local.tee 73
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 87
	local.get 34
	f64.add 
	local.set 34
	local.get 85
	local.get 35
	f64.add 
	local.set 35
	local.get 73
	local.get 26
	f64.add 
	local.set 26
	local.get 67
	local.get 25
	f64.add 
	local.set 25
	local.get 61
	local.get 24
	f64.add 
	local.set 24
	local.get 55
	local.get 23
	f64.add 
	local.set 23
	local.get 49
	local.get 22
	f64.add 
	local.set 22
	local.get 42
	local.get 21
	f64.add 
	local.set 21
	local.get 50
	local.get 20
	f64.add 
	local.set 20
	local.get 81
	local.get 33
	f64.add 
	local.set 33
	local.get 76
	local.get 32
	f64.add 
	local.set 32
	local.get 70
	local.get 31
	f64.add 
	local.set 31
	local.get 64
	local.get 30
	f64.add 
	local.set 30
	local.get 58
	local.get 29
	f64.add 
	local.set 29
	local.get 52
	local.get 28
	f64.add 
	local.set 28
	local.get 44
	local.get 27
	f64.add 
	local.set 27
	local.get 36
	local.get 16
	i32.const 64
	i32.add 
	local.tee 16
	i32.ne 
	br_if 0
	end_loop
	end_block
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
	i32.eqz
	br_if 0
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
	local.tee 39
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
	local.tee 49
	f64.sub 
	local.tee 37
	f64.const 0x0p0
	local.get 7
	local.get 8
	i32.const 268435448
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	local.tee 45
	f64.load 0
	local.get 1
	f64.load 16
	local.tee 55
	f64.mul 
	local.get 2
	local.get 37
	local.get 37
	f64.mul 
	local.get 5
	local.get 6
	i32.const 268435448
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	local.tee 40
	f64.load 0
	local.get 1
	f64.load 8
	local.tee 61
	f64.sub 
	local.tee 37
	local.get 37
	f64.mul 
	f64.add 
	f64.add 
	local.tee 38
	local.get 38
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 38
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 38
	f64.mul 
	local.tee 42
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
	local.get 39
	local.get 37
	local.get 38
	f64.mul 
	local.tee 37
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 34
	local.get 37
	f64.add 
	local.set 34
	local.get 35
	local.get 42
	f64.add 
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
	local.tee 39
	local.get 19
	f64.load 8
	local.get 49
	f64.sub 
	local.tee 37
	f64.const 0x0p0
	local.get 45
	f64.load 8
	local.get 55
	f64.mul 
	local.get 2
	local.get 37
	local.get 37
	f64.mul 
	local.get 40
	f64.load 8
	local.get 61
	f64.sub 
	local.tee 37
	local.get 37
	f64.mul 
	f64.add 
	f64.add 
	local.tee 38
	local.get 38
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 38
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 38
	f64.mul 
	local.tee 42
	f64.mul 
	f64.sub 
	f64.store 8
	local.get 16
	local.get 16
	f64.load 8
	local.get 39
	local.get 37
	local.get 38
	f64.mul 
	local.tee 37
	f64.mul 
	f64.sub 
	f64.store 8
	local.get 20
	local.get 37
	f64.add 
	local.set 20
	local.get 27
	local.get 42
	f64.add 
	local.set 27
	local.get 17
	i32.const 2
	i32.eq 
	br_if 0
	local.get 15
	local.get 15
	f64.load 16
	local.get 18
	f64.load 16
	local.tee 39
	local.get 19
	f64.load 16
	local.get 49
	f64.sub 
	local.tee 37
	f64.const 0x0p0
	local.get 45
	f64.load 16
	local.get 55
	f64.mul 
	local.get 2
	local.get 37
	local.get 37
	f64.mul 
	local.get 40
	f64.load 16
	local.get 61
	f64.sub 
	local.tee 37
	local.get 37
	f64.mul 
	f64.add 
	f64.add 
	local.tee 38
	local.get 38
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 38
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 38
	f64.mul 
	local.tee 42
	f64.mul 
	f64.sub 
	f64.store 16
	local.get 16
	local.get 16
	f64.load 16
	local.get 39
	local.get 37
	local.get 38
	f64.mul 
	local.tee 37
	f64.mul 
	f64.sub 
	f64.store 16
	local.get 21
	local.get 37
	f64.add 
	local.set 21
	local.get 28
	local.get 42
	f64.add 
	local.set 28
	local.get 17
	i32.const 3
	i32.eq 
	br_if 0
	local.get 15
	local.get 15
	f64.load 24
	local.get 18
	f64.load 24
	local.tee 39
	local.get 19
	f64.load 24
	local.get 49
	f64.sub 
	local.tee 37
	f64.const 0x0p0
	local.get 45
	f64.load 24
	local.get 55
	f64.mul 
	local.get 2
	local.get 37
	local.get 37
	f64.mul 
	local.get 40
	f64.load 24
	local.get 61
	f64.sub 
	local.tee 37
	local.get 37
	f64.mul 
	f64.add 
	f64.add 
	local.tee 38
	local.get 38
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 38
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 38
	f64.mul 
	local.tee 42
	f64.mul 
	f64.sub 
	f64.store 24
	local.get 16
	local.get 16
	f64.load 24
	local.get 39
	local.get 37
	local.get 38
	f64.mul 
	local.tee 37
	f64.mul 
	f64.sub 
	f64.store 24
	local.get 22
	local.get 37
	f64.add 
	local.set 22
	local.get 29
	local.get 42
	f64.add 
	local.set 29
	local.get 17
	i32.const 4
	i32.eq 
	br_if 0
	local.get 15
	local.get 15
	f64.load 32
	local.get 18
	f64.load 32
	local.tee 39
	local.get 19
	f64.load 32
	local.get 49
	f64.sub 
	local.tee 37
	f64.const 0x0p0
	local.get 45
	f64.load 32
	local.get 55
	f64.mul 
	local.get 2
	local.get 37
	local.get 37
	f64.mul 
	local.get 40
	f64.load 32
	local.get 61
	f64.sub 
	local.tee 37
	local.get 37
	f64.mul 
	f64.add 
	f64.add 
	local.tee 38
	local.get 38
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 38
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 38
	f64.mul 
	local.tee 42
	f64.mul 
	f64.sub 
	f64.store 32
	local.get 16
	local.get 16
	f64.load 32
	local.get 39
	local.get 37
	local.get 38
	f64.mul 
	local.tee 37
	f64.mul 
	f64.sub 
	f64.store 32
	local.get 23
	local.get 37
	f64.add 
	local.set 23
	local.get 30
	local.get 42
	f64.add 
	local.set 30
	local.get 17
	i32.const 5
	i32.eq 
	br_if 0
	local.get 15
	local.get 15
	f64.load 40
	local.get 18
	f64.load 40
	local.tee 39
	local.get 19
	f64.load 40
	local.get 49
	f64.sub 
	local.tee 37
	f64.const 0x0p0
	local.get 45
	f64.load 40
	local.get 55
	f64.mul 
	local.get 2
	local.get 37
	local.get 37
	f64.mul 
	local.get 40
	f64.load 40
	local.get 61
	f64.sub 
	local.tee 37
	local.get 37
	f64.mul 
	f64.add 
	f64.add 
	local.tee 38
	local.get 38
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 38
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 38
	f64.mul 
	local.tee 42
	f64.mul 
	f64.sub 
	f64.store 40
	local.get 16
	local.get 16
	f64.load 40
	local.get 39
	local.get 37
	local.get 38
	f64.mul 
	local.tee 37
	f64.mul 
	f64.sub 
	f64.store 40
	local.get 24
	local.get 37
	f64.add 
	local.set 24
	local.get 31
	local.get 42
	f64.add 
	local.set 31
	local.get 17
	i32.const 6
	i32.eq 
	br_if 0
	local.get 15
	local.get 15
	f64.load 48
	local.get 18
	f64.load 48
	local.tee 38
	local.get 19
	f64.load 48
	local.get 49
	f64.sub 
	local.tee 37
	f64.const 0x0p0
	local.get 45
	f64.load 48
	local.get 55
	f64.mul 
	local.get 2
	local.get 37
	local.get 37
	f64.mul 
	local.get 40
	f64.load 48
	local.get 61
	f64.sub 
	local.tee 37
	local.get 37
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
	local.tee 39
	f64.mul 
	f64.sub 
	f64.store 48
	local.get 16
	local.get 16
	f64.load 48
	local.get 38
	local.get 37
	local.get 2
	f64.mul 
	local.tee 2
	f64.mul 
	f64.sub 
	f64.store 48
	local.get 25
	local.get 2
	f64.add 
	local.set 25
	local.get 32
	local.get 39
	f64.add 
	local.set 32
	end_block
	local.get 0
	local.get 26
	f64.store 120
	local.get 0
	local.get 25
	f64.store 112
	local.get 0
	local.get 24
	f64.store 104
	local.get 0
	local.get 23
	f64.store 96
	local.get 0
	local.get 22
	f64.store 88
	local.get 0
	local.get 21
	f64.store 80
	local.get 0
	local.get 20
	f64.store 72
	local.get 0
	local.get 34
	f64.store 64
	local.get 0
	local.get 33
	f64.store 56
	local.get 0
	local.get 32
	f64.store 48
	local.get 0
	local.get 31
	f64.store 40
	local.get 0
	local.get 30
	f64.store 32
	local.get 0
	local.get 29
	f64.store 24
	local.get 0
	local.get 28
	f64.store 16
	local.get 0
	local.get 27
	f64.store 8
	local.get 0
	local.get 35
	f64.store 0
	end_function
