engine::force::sweep::<f64>:
	.functype	engine::force::sweep::<f64> (i32, i32, f64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) -> ()
	.local  	f64, f64, f64, f64, f64, f64, f64, f64, f64
	block 
	block 
	local.get 14
	local.get 12
	local.get 14
	local.get 12
	i32.lt_u
	i32.select
	local.tee 12
	local.get 10
	local.get 8
	local.get 6
	local.get 4
	local.get 6
	local.get 4
	i32.lt_u
	i32.select
	local.tee 4
	local.get 8
	local.get 4
	i32.lt_u
	i32.select
	local.tee 4
	local.get 10
	local.get 4
	i32.lt_u
	i32.select
	local.tee 4
	local.get 12
	local.get 4
	i32.lt_u
	i32.select
	local.tee 4
	br_if 0
	f64.const 0x0p0
	local.set 15
	f64.const 0x0p0
	local.set 16
	br 1
	end_block
	local.get 1
	f64.load 16
	local.set 17
	local.get 1
	f64.load 8
	local.set 18
	local.get 1
	f64.load 0
	local.set 19
	f64.const 0x0p0
	local.set 16
	f64.const 0x0p0
	local.set 15
	loop 
	local.get 11
	local.get 11
	f64.load 0
	local.get 9
	f64.load 0
	local.tee 20
	local.get 3
	f64.load 0
	local.get 19
	f64.sub 
	local.tee 21
	f64.const 0x0p0
	local.get 7
	f64.load 0
	local.get 17
	f64.mul 
	local.get 2
	local.get 21
	local.get 21
	f64.mul 
	local.get 5
	f64.load 0
	local.get 18
	f64.sub 
	local.tee 21
	local.get 21
	f64.mul 
	f64.add 
	f64.add 
	local.tee 22
	local.get 22
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 22
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 22
	f64.mul 
	local.tee 23
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 13
	local.get 13
	f64.load 0
	local.get 20
	local.get 21
	local.get 22
	f64.mul 
	local.tee 21
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 21
	local.get 15
	f64.add 
	local.set 15
	local.get 16
	local.get 23
	f64.add 
	local.set 16
	local.get 3
	i32.const 8
	i32.add 
	local.set 3
	local.get 5
	i32.const 8
	i32.add 
	local.set 5
	local.get 7
	i32.const 8
	i32.add 
	local.set 7
	local.get 9
	i32.const 8
	i32.add 
	local.set 9
	local.get 11
	i32.const 8
	i32.add 
	local.set 11
	local.get 13
	i32.const 8
	i32.add 
	local.set 13
	local.get 4
	i32.const -1
	i32.add 
	local.tee 4
	br_if 0
	end_loop
	end_block
	local.get 0
	local.get 15
	f64.store 8
	local.get 0
	local.get 16
	f64.store 0
	end_function
