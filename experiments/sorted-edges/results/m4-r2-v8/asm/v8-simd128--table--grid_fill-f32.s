<swarm::grid::Grid>::fill:
	.functype	<swarm::grid::Grid>::fill (i32, i32, i32, i32, i32) -> ()
	.local  	i32, i32, i32, i32, i32, i32, i32, i32, i32, f32, f32
	i32.const 0
	local.set 5
	local.get 0
	i32.const 0
	i32.store 8
	block 
	local.get 0
	i32.load 44
	local.get 0
	i32.load 40
	i32.mul 
	local.tee 6
	i32.const 1
	i32.add 
	local.tee 7
	i32.eqz
	br_if 0
	i32.const 0
	local.set 8
	block 
	local.get 7
	local.get 0
	i32.load 0
	i32.le_u
	br_if 0
	local.get 0
	i32.const 0
	local.get 7
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	local.get 0
	i32.load 8
	local.set 8
	end_block
	local.get 0
	i32.load 4
	local.tee 9
	local.get 8
	i32.const 2
	i32.shl 
	i32.add 
	local.set 10
	block 
	block 
	local.get 6
	br_if 0
	local.get 8
	local.set 6
	br 1
	end_block
	block 
	local.get 7
	i32.const 2
	i32.shl 
	i32.const -4
	i32.add 
	local.tee 5
	i32.eqz
	br_if 0
	local.get 10
	i32.const 0
	local.get 5
	memory.fill 0
	end_block
	local.get 8
	local.get 6
	i32.add 
	local.set 6
	local.get 9
	local.get 8
	local.get 7
	i32.add 
	i32.const 2
	i32.shl 
	i32.add 
	i32.const -4
	i32.add 
	local.set 10
	end_block
	local.get 10
	i32.const 0
	i32.store 0
	local.get 6
	i32.const 1
	i32.add 
	local.set 5
	end_block
	local.get 0
	local.get 5
	i32.store 8
	block 
	block 
	local.get 4
	local.get 2
	local.get 4
	local.get 2
	i32.lt_u
	i32.select
	local.tee 11
	br_if 0
	local.get 0
	i32.load 4
	local.set 12
	br 1
	end_block
	local.get 0
	i32.load 44
	local.tee 4
	local.get 4
	i32.const 0
	i32.ne 
	i32.sub 
	local.set 8
	local.get 0
	i32.load 40
	local.tee 13
	local.get 13
	i32.const 0
	i32.ne 
	i32.sub 
	local.set 6
	local.get 0
	i32.load 4
	local.set 12
	local.get 0
	f32.load 36
	local.set 14
	local.get 11
	local.set 10
	local.get 1
	local.set 4
	local.get 3
	local.set 7
	loop 
	block 
	local.get 6
	f32.const 0x0p0
	local.get 4
	f32.load 0
	local.get 14
	f32.mul 
	local.tee 15
	local.get 15
	local.get 15
	f32.ne 
	f32.select
	local.tee 15
	f32.const 0x0p0
	local.get 15
	f32.const 0x0p0
	f32.gt 
	f32.select
	local.tee 15
	f64.promote_f32
	i32.trunc_sat_f64_u
	local.tee 9
	local.get 6
	local.get 9
	i32.lt_u
	i32.select
	i32.const 1
	i32.add 
	i32.const 1
	local.get 15
	f32.const 0x1p32
	f32.lt 
	i32.select
	local.get 8
	f32.const 0x0p0
	local.get 7
	f32.load 0
	local.get 14
	f32.mul 
	local.tee 15
	local.get 15
	local.get 15
	f32.ne 
	f32.select
	local.tee 15
	f32.const 0x0p0
	local.get 15
	f32.const 0x0p0
	f32.gt 
	f32.select
	local.tee 15
	f64.promote_f32
	i32.trunc_sat_f64_u
	local.tee 9
	local.get 8
	local.get 9
	i32.lt_u
	i32.select
	i32.const 0
	local.get 15
	f32.const 0x1p32
	f32.lt 
	i32.select
	local.get 13
	i32.mul 
	i32.add 
	local.tee 9
	local.get 5
	i32.ge_u
	br_if 0
	local.get 12
	local.get 9
	i32.const 2
	i32.shl 
	i32.add 
	local.tee 9
	local.get 9
	i32.load 0
	i32.const 1
	i32.add 
	i32.store 0
	end_block
	local.get 4
	i32.const 4
	i32.add 
	local.set 4
	local.get 7
	i32.const 4
	i32.add 
	local.set 7
	local.get 10
	i32.const -1
	i32.add 
	local.tee 10
	br_if 0
	end_loop
	end_block
	block 
	block 
	local.get 5
	i32.eqz
	br_if 0
	local.get 5
	i32.const 2
	i32.shl 
	local.tee 10
	i32.const -4
	i32.add 
	local.tee 8
	i32.const 2
	i32.shr_u
	i32.const 1
	i32.add 
	local.tee 6
	i32.const 7
	i32.and 
	local.set 9
	i32.const 0
	local.set 7
	local.get 12
	local.set 4
	block 
	block 
	local.get 8
	i32.const 28
	i32.lt_u
	br_if 0
	local.get 6
	i32.const 2147483640
	i32.and 
	local.set 8
	i32.const 0
	local.set 7
	local.get 12
	local.set 4
	loop 
	local.get 4
	local.get 4
	i32.load 0
	local.get 7
	i32.add 
	local.tee 7
	i32.store 0
	local.get 4
	i32.const 4
	i32.add 
	local.tee 6
	local.get 6
	i32.load 0
	local.get 7
	i32.add 
	local.tee 7
	i32.store 0
	local.get 4
	i32.const 8
	i32.add 
	local.tee 6
	local.get 6
	i32.load 0
	local.get 7
	i32.add 
	local.tee 7
	i32.store 0
	local.get 4
	i32.const 12
	i32.add 
	local.tee 6
	local.get 6
	i32.load 0
	local.get 7
	i32.add 
	local.tee 7
	i32.store 0
	local.get 4
	i32.const 16
	i32.add 
	local.tee 6
	local.get 6
	i32.load 0
	local.get 7
	i32.add 
	local.tee 7
	i32.store 0
	local.get 4
	i32.const 20
	i32.add 
	local.tee 6
	local.get 6
	i32.load 0
	local.get 7
	i32.add 
	local.tee 7
	i32.store 0
	local.get 4
	i32.const 24
	i32.add 
	local.tee 6
	local.get 6
	i32.load 0
	local.get 7
	i32.add 
	local.tee 7
	i32.store 0
	local.get 4
	i32.const 28
	i32.add 
	local.tee 6
	local.get 6
	i32.load 0
	local.get 7
	i32.add 
	local.tee 7
	i32.store 0
	local.get 4
	i32.const 32
	i32.add 
	local.set 4
	local.get 8
	i32.const -8
	i32.add 
	local.tee 8
	br_if 0
	end_loop
	local.get 9
	i32.eqz
	br_if 1
	end_block
	local.get 9
	i32.const 2
	i32.shl 
	local.set 8
	loop 
	local.get 4
	local.get 4
	i32.load 0
	local.get 7
	i32.add 
	local.tee 7
	i32.store 0
	local.get 4
	i32.const 4
	i32.add 
	local.set 4
	local.get 8
	i32.const -4
	i32.add 
	local.tee 8
	br_if 0
	end_loop
	end_block
	i32.const 0
	local.set 4
	local.get 0
	i32.const 0
	i32.store 20
	block 
	local.get 5
	local.get 0
	i32.load 12
	i32.le_u
	br_if 0
	local.get 0
	i32.const 12
	i32.add 
	i32.const 0
	local.get 5
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	local.get 0
	i32.load 20
	local.set 4
	end_block
	local.get 10
	i32.eqz
	br_if 1
	local.get 0
	i32.load 16
	local.get 4
	i32.const 2
	i32.shl 
	i32.add 
	local.get 12
	local.get 10
	memory.copy 0, 0
	br 1
	end_block
	i32.const 0
	local.set 4
	end_block
	i32.const 0
	local.set 13
	local.get 0
	i32.const 0
	i32.store 32
	local.get 0
	local.get 4
	local.get 5
	i32.add 
	i32.store 20
	block 
	local.get 2
	i32.eqz
	br_if 0
	i32.const 0
	local.set 4
	block 
	local.get 2
	local.get 0
	i32.load 24
	i32.le_u
	br_if 0
	local.get 0
	i32.const 24
	i32.add 
	i32.const 0
	local.get 2
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	local.get 0
	i32.load 32
	local.set 4
	end_block
	local.get 0
	i32.load 28
	local.tee 8
	local.get 4
	i32.const 2
	i32.shl 
	i32.add 
	local.set 7
	block 
	local.get 2
	i32.const 1
	i32.eq 
	br_if 0
	block 
	local.get 2
	i32.const 2
	i32.shl 
	i32.const -4
	i32.add 
	local.tee 6
	i32.eqz
	br_if 0
	local.get 7
	i32.const 0
	local.get 6
	memory.fill 0
	end_block
	local.get 4
	local.get 2
	i32.add 
	local.tee 7
	i32.const -1
	i32.add 
	local.set 4
	local.get 8
	local.get 7
	i32.const 2
	i32.shl 
	i32.add 
	i32.const -4
	i32.add 
	local.set 7
	end_block
	local.get 7
	i32.const 0
	i32.store 0
	local.get 4
	i32.const 1
	i32.add 
	local.set 13
	end_block
	local.get 0
	local.get 13
	i32.store 32
	block 
	local.get 11
	i32.eqz
	br_if 0
	local.get 0
	i32.load 44
	local.tee 4
	local.get 4
	i32.const 0
	i32.ne 
	i32.sub 
	local.set 7
	local.get 0
	i32.load 40
	local.tee 9
	local.get 9
	i32.const 0
	i32.ne 
	i32.sub 
	local.set 8
	local.get 0
	i32.load 28
	local.set 2
	local.get 0
	i32.load 16
	local.set 12
	local.get 0
	i32.load 20
	local.set 5
	local.get 0
	f32.load 36
	local.set 14
	i32.const 0
	local.set 4
	loop 
	block 
	local.get 7
	f32.const 0x0p0
	local.get 3
	f32.load 0
	local.get 14
	f32.mul 
	local.tee 15
	local.get 15
	local.get 15
	f32.ne 
	f32.select
	local.tee 15
	f32.const 0x0p0
	local.get 15
	f32.const 0x0p0
	f32.gt 
	f32.select
	local.tee 15
	f64.promote_f32
	i32.trunc_sat_f64_u
	local.tee 6
	local.get 7
	local.get 6
	i32.lt_u
	i32.select
	i32.const 0
	local.get 15
	f32.const 0x1p32
	f32.lt 
	i32.select
	local.get 9
	i32.mul 
	local.get 8
	f32.const 0x0p0
	local.get 1
	f32.load 0
	local.get 14
	f32.mul 
	local.tee 15
	local.get 15
	local.get 15
	f32.ne 
	f32.select
	local.tee 15
	f32.const 0x0p0
	local.get 15
	f32.const 0x0p0
	f32.gt 
	f32.select
	local.tee 15
	f64.promote_f32
	i32.trunc_sat_f64_u
	local.tee 6
	local.get 8
	local.get 6
	i32.lt_u
	i32.select
	i32.const 0
	local.get 15
	f32.const 0x1p32
	f32.lt 
	i32.select
	i32.add 
	local.tee 6
	local.get 5
	i32.ge_u
	br_if 0
	block 
	local.get 12
	local.get 6
	i32.const 2
	i32.shl 
	i32.add 
	local.tee 10
	i32.load 0
	local.tee 6
	local.get 13
	i32.ge_u
	br_if 0
	local.get 2
	local.get 6
	i32.const 2
	i32.shl 
	i32.add 
	local.get 4
	i32.store 0
	local.get 10
	i32.load 0
	local.set 6
	end_block
	local.get 10
	local.get 6
	i32.const 1
	i32.add 
	i32.store 0
	end_block
	local.get 1
	i32.const 4
	i32.add 
	local.set 1
	local.get 3
	i32.const 4
	i32.add 
	local.set 3
	local.get 11
	local.get 4
	i32.const 1
	i32.add 
	local.tee 4
	i32.ne 
	br_if 0
	end_loop
	end_block
	end_function
