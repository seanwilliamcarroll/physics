engine::force::sweep::<f32>:
	.functype	engine::force::sweep::<f32> (i32, i32, f32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) -> ()
	.local  	i32, i32, i32, i32, i32, f32, f32, f32, f32, f32, f32, f32, f32, i32, f32, f32, f32, i32, f32, f32, f32, f32, i32, f32, i32, f32, f32, f32, f32, f32, i32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32
	block 
	block 
	local.get 14
	i32.const 2
	i32.shr_u
	local.tee 15
	local.get 12
	i32.const 2
	i32.shr_u
	local.tee 16
	local.get 15
	local.get 16
	i32.lt_u
	i32.select
	local.tee 15
	local.get 10
	i32.const 2
	i32.shr_u
	local.tee 16
	local.get 8
	i32.const 2
	i32.shr_u
	local.tee 17
	local.get 6
	i32.const 2
	i32.shr_u
	local.tee 18
	local.get 4
	i32.const 2
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
	f32.const 0x0p0
	local.set 20
	f32.const 0x0p0
	local.set 21
	f32.const 0x0p0
	local.set 22
	f32.const 0x0p0
	local.set 23
	f32.const 0x0p0
	local.set 24
	f32.const 0x0p0
	local.set 25
	f32.const 0x0p0
	local.set 26
	f32.const 0x0p0
	local.set 27
	br 1
	end_block
	local.get 15
	i32.const 4
	i32.shl 
	local.set 28
	local.get 1
	f32.load 8
	local.set 29
	local.get 1
	f32.load 4
	local.set 30
	local.get 1
	f32.load 0
	local.set 31
	i32.const 0
	local.set 15
	f32.const 0x0p0
	local.set 22
	f32.const 0x0p0
	local.set 21
	f32.const 0x0p0
	local.set 20
	f32.const 0x0p0
	local.set 25
	f32.const 0x0p0
	local.set 24
	f32.const 0x0p0
	local.set 23
	f32.const 0x0p0
	local.set 27
	f32.const 0x0p0
	local.set 26
	loop 
	local.get 11
	local.get 15
	i32.add 
	local.tee 16
	i32.const 4
	i32.add 
	local.tee 32
	f32.load 0
	local.set 33
	local.get 9
	local.get 15
	i32.add 
	local.tee 17
	i32.const 4
	i32.add 
	f32.load 0
	local.set 34
	local.get 7
	local.get 15
	i32.add 
	local.tee 18
	i32.const 4
	i32.add 
	f32.load 0
	local.set 35
	local.get 3
	local.get 15
	i32.add 
	local.tee 19
	i32.const 4
	i32.add 
	f32.load 0
	local.set 36
	local.get 5
	local.get 15
	i32.add 
	local.tee 37
	i32.const 4
	i32.add 
	f32.load 0
	local.set 38
	local.get 16
	i32.const 8
	i32.add 
	local.tee 39
	f32.load 0
	local.set 40
	local.get 17
	i32.const 8
	i32.add 
	f32.load 0
	local.set 41
	local.get 18
	i32.const 8
	i32.add 
	f32.load 0
	local.set 42
	local.get 19
	i32.const 8
	i32.add 
	f32.load 0
	local.set 43
	local.get 37
	i32.const 8
	i32.add 
	f32.load 0
	local.set 44
	local.get 16
	i32.const 12
	i32.add 
	local.tee 45
	f32.load 0
	local.set 46
	local.get 17
	i32.const 12
	i32.add 
	f32.load 0
	local.set 47
	local.get 18
	i32.const 12
	i32.add 
	f32.load 0
	local.set 48
	local.get 19
	i32.const 12
	i32.add 
	f32.load 0
	local.set 49
	local.get 37
	i32.const 12
	i32.add 
	f32.load 0
	local.set 50
	local.get 16
	local.get 16
	f32.load 0
	local.get 19
	f32.load 0
	local.get 31
	f32.sub 
	local.tee 51
	f32.const 0x0p0
	local.get 18
	f32.load 0
	local.get 29
	f32.mul 
	local.get 2
	local.get 51
	local.get 51
	f32.mul 
	local.get 37
	f32.load 0
	local.get 30
	f32.sub 
	local.tee 51
	local.get 51
	f32.mul 
	f32.add 
	f32.add 
	local.tee 52
	local.get 52
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 52
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 52
	f32.mul 
	local.tee 53
	local.get 17
	f32.load 0
	local.tee 54
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 13
	local.get 15
	i32.add 
	local.tee 16
	local.get 16
	f32.load 0
	local.get 54
	local.get 51
	local.get 52
	f32.mul 
	local.tee 55
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 45
	local.get 46
	local.get 47
	local.get 49
	local.get 31
	f32.sub 
	local.tee 51
	f32.const 0x0p0
	local.get 48
	local.get 29
	f32.mul 
	local.get 2
	local.get 51
	local.get 51
	f32.mul 
	local.get 50
	local.get 30
	f32.sub 
	local.tee 51
	local.get 51
	f32.mul 
	f32.add 
	f32.add 
	local.tee 52
	local.get 52
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 52
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 48
	f32.mul 
	local.tee 49
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 39
	local.get 40
	local.get 41
	local.get 43
	local.get 31
	f32.sub 
	local.tee 52
	f32.const 0x0p0
	local.get 42
	local.get 29
	f32.mul 
	local.get 2
	local.get 52
	local.get 52
	f32.mul 
	local.get 44
	local.get 30
	f32.sub 
	local.tee 52
	local.get 52
	f32.mul 
	f32.add 
	f32.add 
	local.tee 42
	local.get 42
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 42
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 43
	f32.mul 
	local.tee 44
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 32
	local.get 33
	local.get 34
	local.get 36
	local.get 31
	f32.sub 
	local.tee 42
	f32.const 0x0p0
	local.get 35
	local.get 29
	f32.mul 
	local.get 2
	local.get 42
	local.get 42
	f32.mul 
	local.get 38
	local.get 30
	f32.sub 
	local.tee 42
	local.get 42
	f32.mul 
	f32.add 
	f32.add 
	local.tee 35
	local.get 35
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 35
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 35
	f32.mul 
	local.tee 36
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 16
	i32.const 4
	i32.add 
	local.tee 17
	local.get 17
	f32.load 0
	local.get 34
	local.get 42
	local.get 35
	f32.mul 
	local.tee 42
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 16
	i32.const 8
	i32.add 
	local.tee 17
	local.get 17
	f32.load 0
	local.get 41
	local.get 52
	local.get 43
	f32.mul 
	local.tee 34
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 16
	i32.const 12
	i32.add 
	local.tee 16
	local.get 16
	f32.load 0
	local.get 47
	local.get 51
	local.get 48
	f32.mul 
	local.tee 41
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 55
	local.get 26
	f32.add 
	local.set 26
	local.get 53
	local.get 27
	f32.add 
	local.set 27
	local.get 41
	local.get 22
	f32.add 
	local.set 22
	local.get 34
	local.get 21
	f32.add 
	local.set 21
	local.get 42
	local.get 20
	f32.add 
	local.set 20
	local.get 49
	local.get 25
	f32.add 
	local.set 25
	local.get 44
	local.get 24
	f32.add 
	local.set 24
	local.get 36
	local.get 23
	f32.add 
	local.set 23
	local.get 28
	local.get 15
	i32.const 16
	i32.add 
	local.tee 15
	i32.ne 
	br_if 0
	end_loop
	end_block
	block 
	local.get 14
	i32.const 3
	i32.and 
	local.tee 15
	local.get 12
	i32.const 3
	i32.and 
	local.tee 16
	local.get 15
	local.get 16
	i32.lt_u
	i32.select
	local.tee 15
	local.get 10
	i32.const 3
	i32.and 
	local.tee 16
	local.get 8
	i32.const 3
	i32.and 
	local.tee 17
	local.get 6
	i32.const 3
	i32.and 
	local.tee 18
	local.get 4
	i32.const 3
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
	i32.const 268435452
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.tee 15
	local.get 15
	f32.load 0
	local.get 9
	local.get 10
	i32.const 536870908
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.tee 18
	f32.load 0
	local.tee 31
	local.get 3
	local.get 4
	i32.const 536870908
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.tee 19
	f32.load 0
	local.get 1
	f32.load 0
	local.tee 41
	f32.sub 
	local.tee 29
	f32.const 0x0p0
	local.get 7
	local.get 8
	i32.const 536870908
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.tee 37
	f32.load 0
	local.get 1
	f32.load 8
	local.tee 47
	f32.mul 
	local.get 2
	local.get 29
	local.get 29
	f32.mul 
	local.get 5
	local.get 6
	i32.const 536870908
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.tee 32
	f32.load 0
	local.get 1
	f32.load 4
	local.tee 51
	f32.sub 
	local.tee 29
	local.get 29
	f32.mul 
	f32.add 
	f32.add 
	local.tee 30
	local.get 30
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 30
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 30
	f32.mul 
	local.tee 34
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 13
	local.get 14
	i32.const 268435452
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.tee 16
	local.get 16
	f32.load 0
	local.get 31
	local.get 29
	local.get 30
	f32.mul 
	local.tee 29
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 26
	local.get 29
	f32.add 
	local.set 26
	local.get 27
	local.get 34
	f32.add 
	local.set 27
	local.get 17
	i32.const 1
	i32.eq 
	br_if 0
	local.get 15
	local.get 15
	f32.load 4
	local.get 18
	f32.load 4
	local.tee 31
	local.get 19
	f32.load 4
	local.get 41
	f32.sub 
	local.tee 29
	f32.const 0x0p0
	local.get 37
	f32.load 4
	local.get 47
	f32.mul 
	local.get 2
	local.get 29
	local.get 29
	f32.mul 
	local.get 32
	f32.load 4
	local.get 51
	f32.sub 
	local.tee 29
	local.get 29
	f32.mul 
	f32.add 
	f32.add 
	local.tee 30
	local.get 30
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 30
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 30
	f32.mul 
	local.tee 34
	f32.mul 
	f32.sub 
	f32.store 4
	local.get 16
	local.get 16
	f32.load 4
	local.get 31
	local.get 29
	local.get 30
	f32.mul 
	local.tee 29
	f32.mul 
	f32.sub 
	f32.store 4
	local.get 20
	local.get 29
	f32.add 
	local.set 20
	local.get 23
	local.get 34
	f32.add 
	local.set 23
	local.get 17
	i32.const 2
	i32.eq 
	br_if 0
	local.get 15
	local.get 15
	f32.load 8
	local.get 18
	f32.load 8
	local.tee 30
	local.get 19
	f32.load 8
	local.get 41
	f32.sub 
	local.tee 29
	f32.const 0x0p0
	local.get 37
	f32.load 8
	local.get 47
	f32.mul 
	local.get 2
	local.get 29
	local.get 29
	f32.mul 
	local.get 32
	f32.load 8
	local.get 51
	f32.sub 
	local.tee 29
	local.get 29
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
	local.tee 31
	f32.mul 
	f32.sub 
	f32.store 8
	local.get 16
	local.get 16
	f32.load 8
	local.get 30
	local.get 29
	local.get 2
	f32.mul 
	local.tee 2
	f32.mul 
	f32.sub 
	f32.store 8
	local.get 21
	local.get 2
	f32.add 
	local.set 21
	local.get 24
	local.get 31
	f32.add 
	local.set 24
	end_block
	local.get 0
	local.get 22
	f32.store 28
	local.get 0
	local.get 21
	f32.store 24
	local.get 0
	local.get 20
	f32.store 20
	local.get 0
	local.get 26
	f32.store 16
	local.get 0
	local.get 25
	f32.store 12
	local.get 0
	local.get 24
	f32.store 8
	local.get 0
	local.get 23
	f32.store 4
	local.get 0
	local.get 27
	f32.store 0
	end_function
