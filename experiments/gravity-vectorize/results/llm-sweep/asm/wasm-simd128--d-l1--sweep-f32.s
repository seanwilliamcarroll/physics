engine::force::sweep::<f32>:
	.functype	engine::force::sweep::<f32> (i32, i32, f32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) -> ()
	.local  	f32, f32, f32, f32, f32, f32, f32, f32, f32
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
	f32.const 0x0p0
	local.set 15
	f32.const 0x0p0
	local.set 16
	br 1
	end_block
	local.get 1
	f32.load 8
	local.set 17
	local.get 1
	f32.load 4
	local.set 18
	local.get 1
	f32.load 0
	local.set 19
	f32.const 0x0p0
	local.set 16
	f32.const 0x0p0
	local.set 15
	loop 
	local.get 11
	local.get 11
	f32.load 0
	local.get 9
	f32.load 0
	local.tee 20
	local.get 3
	f32.load 0
	local.get 19
	f32.sub 
	local.tee 21
	f32.const 0x0p0
	local.get 7
	f32.load 0
	local.get 17
	f32.mul 
	local.get 2
	local.get 21
	local.get 21
	f32.mul 
	local.get 5
	f32.load 0
	local.get 18
	f32.sub 
	local.tee 21
	local.get 21
	f32.mul 
	f32.add 
	f32.add 
	local.tee 22
	local.get 22
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 22
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 22
	f32.mul 
	local.tee 23
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 13
	local.get 13
	f32.load 0
	local.get 20
	local.get 21
	local.get 22
	f32.mul 
	local.tee 21
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 21
	local.get 15
	f32.add 
	local.set 15
	local.get 16
	local.get 23
	f32.add 
	local.set 16
	local.get 3
	i32.const 4
	i32.add 
	local.set 3
	local.get 5
	i32.const 4
	i32.add 
	local.set 5
	local.get 7
	i32.const 4
	i32.add 
	local.set 7
	local.get 9
	i32.const 4
	i32.add 
	local.set 9
	local.get 11
	i32.const 4
	i32.add 
	local.set 11
	local.get 13
	i32.const 4
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
	f32.store 4
	local.get 0
	local.get 16
	f32.store 0
	end_function
