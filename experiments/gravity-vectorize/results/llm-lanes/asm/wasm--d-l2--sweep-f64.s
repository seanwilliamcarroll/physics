engine::force::sweep::<f64>:
	.functype	engine::force::sweep::<f64> (i32, i32, f64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) -> ()
	.local  	i32, i32, i32, i32, i32, f64, f64, f64, f64, i32, f64, f64, f64, f64, f64, i32, i32, f64, f64, f64, f64
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
	br 1
	end_block
	local.get 15
	i32.const 4
	i32.shl 
	local.set 24
	local.get 1
	f64.load 16
	local.set 25
	local.get 1
	f64.load 8
	local.set 26
	local.get 1
	f64.load 0
	local.set 27
	i32.const 0
	local.set 15
	f64.const 0x0p0
	local.set 20
	f64.const 0x0p0
	local.set 21
	f64.const 0x0p0
	local.set 23
	f64.const 0x0p0
	local.set 22
	loop 
	local.get 11
	local.get 15
	i32.add 
	local.tee 16
	local.get 16
	f64.load 0
	local.get 9
	local.get 15
	i32.add 
	local.tee 18
	f64.load 0
	local.tee 28
	local.get 3
	local.get 15
	i32.add 
	local.tee 19
	f64.load 0
	local.get 27
	f64.sub 
	local.tee 29
	f64.const 0x0p0
	local.get 7
	local.get 15
	i32.add 
	local.tee 30
	f64.load 0
	local.get 25
	f64.mul 
	local.get 2
	local.get 29
	local.get 29
	f64.mul 
	local.get 5
	local.get 15
	i32.add 
	local.tee 31
	f64.load 0
	local.get 26
	f64.sub 
	local.tee 29
	local.get 29
	f64.mul 
	f64.add 
	f64.add 
	local.tee 32
	local.get 32
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 32
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 32
	f64.mul 
	local.tee 33
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 13
	local.get 15
	i32.add 
	local.tee 17
	local.get 17
	f64.load 0
	local.get 28
	local.get 29
	local.get 32
	f64.mul 
	local.tee 34
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 16
	i32.const 8
	i32.add 
	local.tee 16
	local.get 16
	f64.load 0
	local.get 18
	i32.const 8
	i32.add 
	f64.load 0
	local.tee 28
	local.get 19
	i32.const 8
	i32.add 
	f64.load 0
	local.get 27
	f64.sub 
	local.tee 29
	f64.const 0x0p0
	local.get 30
	i32.const 8
	i32.add 
	f64.load 0
	local.get 25
	f64.mul 
	local.get 2
	local.get 29
	local.get 29
	f64.mul 
	local.get 31
	i32.const 8
	i32.add 
	f64.load 0
	local.get 26
	f64.sub 
	local.tee 29
	local.get 29
	f64.mul 
	f64.add 
	f64.add 
	local.tee 32
	local.get 32
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 32
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 32
	f64.mul 
	local.tee 35
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 17
	i32.const 8
	i32.add 
	local.tee 16
	local.get 16
	f64.load 0
	local.get 28
	local.get 29
	local.get 32
	f64.mul 
	local.tee 29
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 34
	local.get 22
	f64.add 
	local.set 22
	local.get 33
	local.get 23
	f64.add 
	local.set 23
	local.get 29
	local.get 20
	f64.add 
	local.set 20
	local.get 35
	local.get 21
	f64.add 
	local.set 21
	local.get 24
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
	i32.const 1
	i32.and 
	local.tee 15
	local.get 12
	i32.const 1
	i32.and 
	local.tee 16
	local.get 15
	local.get 16
	i32.lt_u
	i32.select
	local.tee 15
	local.get 10
	i32.const 1
	i32.and 
	local.tee 16
	local.get 8
	i32.const 1
	i32.and 
	local.tee 17
	local.get 6
	i32.const 1
	i32.and 
	local.tee 18
	local.get 4
	i32.const 1
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
	i32.eqz
	br_if 0
	local.get 11
	local.get 12
	i32.const 134217726
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	local.tee 15
	local.get 15
	f64.load 0
	local.get 9
	local.get 10
	i32.const 268435454
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	f64.load 0
	local.tee 25
	local.get 3
	local.get 4
	i32.const 268435454
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	f64.load 0
	local.get 1
	f64.load 0
	f64.sub 
	local.tee 29
	f64.const 0x0p0
	local.get 7
	local.get 8
	i32.const 268435454
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	f64.load 0
	local.get 1
	f64.load 16
	f64.mul 
	local.get 2
	local.get 29
	local.get 29
	f64.mul 
	local.get 5
	local.get 6
	i32.const 268435454
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	f64.load 0
	local.get 1
	f64.load 8
	f64.sub 
	local.tee 29
	local.get 29
	f64.mul 
	f64.add 
	f64.add 
	local.tee 32
	local.get 32
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 32
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 32
	f64.mul 
	local.tee 2
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 13
	local.get 14
	i32.const 134217726
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	local.tee 15
	local.get 15
	f64.load 0
	local.get 25
	local.get 29
	local.get 32
	f64.mul 
	local.tee 29
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 22
	local.get 29
	f64.add 
	local.set 22
	local.get 23
	local.get 2
	f64.add 
	local.set 23
	end_block
	local.get 0
	local.get 20
	f64.store 24
	local.get 0
	local.get 22
	f64.store 16
	local.get 0
	local.get 21
	f64.store 8
	local.get 0
	local.get 23
	f64.store 0
	end_function
