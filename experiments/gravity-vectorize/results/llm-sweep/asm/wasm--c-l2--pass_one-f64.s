engine::force::pass_one::<f64>:
	.functype	engine::force::pass_one::<f64> (i32, i32, i32, i32, i32) -> ()
	.local  	i32, i32, i32, i32, i32, f64, f64, f64, f64, f64, f64, f64, f64
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
	local.tee 8
	i32.eqz
	br_if 0
	local.get 4
	i32.load 8
	local.set 3
	local.get 4
	i32.load 0
	local.set 4
	local.get 1
	i32.load 24
	local.set 5
	local.get 1
	i32.load 16
	local.set 6
	local.get 1
	i32.load 8
	local.set 7
	local.get 1
	i32.load 0
	local.set 1
	local.get 0
	f64.load 24
	local.set 10
	local.get 0
	f64.load 16
	local.set 11
	local.get 0
	f64.load 8
	local.set 12
	local.get 0
	f64.load 0
	local.set 13
	loop 
	local.get 5
	f64.load 0
	local.set 14
	local.get 4
	local.get 1
	f64.load 0
	local.get 13
	f64.sub 
	local.tee 15
	f64.const 0x0p0
	local.get 11
	local.get 6
	f64.load 0
	f64.mul 
	local.get 10
	local.get 15
	local.get 15
	f64.mul 
	local.get 7
	f64.load 0
	local.get 12
	f64.sub 
	local.tee 15
	local.get 15
	f64.mul 
	f64.add 
	f64.add 
	local.tee 16
	local.get 16
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 16
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 16
	f64.mul 
	local.tee 17
	f64.store 0
	local.get 3
	local.get 15
	local.get 16
	f64.mul 
	local.tee 15
	f64.store 0
	local.get 2
	local.get 2
	f64.load 0
	local.get 14
	local.get 17
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 2
	i32.const 8
	i32.add 
	local.tee 0
	local.get 0
	f64.load 0
	local.get 14
	local.get 15
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 2
	i32.const 16
	i32.add 
	local.set 2
	local.get 1
	i32.const 8
	i32.add 
	local.set 1
	local.get 7
	i32.const 8
	i32.add 
	local.set 7
	local.get 6
	i32.const 8
	i32.add 
	local.set 6
	local.get 5
	i32.const 8
	i32.add 
	local.set 5
	local.get 4
	i32.const 8
	i32.add 
	local.set 4
	local.get 3
	i32.const 8
	i32.add 
	local.set 3
	local.get 8
	i32.const -1
	i32.add 
	local.tee 8
	br_if 0
	end_loop
	end_block
	end_function
