<swarm::flock::Flock>::step_sorted:
	.functype	<swarm::flock::Flock>::step_sorted (i32) -> ()
	.local  	i32, v128, f32, f32, f32, f32, f32, v128, v128, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, f32, v128, v128, i32, i32, i32, i32, i32, i32, i32, i32, i32, f32, i32, i32, f32, f32, i32, v128, i32, i32, i32, v128, v128, i32, i32, f32, f32, i32, i32, i32, i32, i32, i32, i32, i32, i32, v128, v128, v128, v128, v128, v128, f32, f32, f32
	global.get __stack_pointer
	i32.const 320
	i32.sub 
	local.tee 1
	global.set __stack_pointer
	local.get 0
	f32.const 0x1p0
	local.get 0
	v128.load64_zero 144
	local.tee 2
	f32x4.extract_lane 1
	local.tee 3
	f32.const 0x1p-10
	f32.mul 
	local.tee 4
	local.get 2
	f32x4.extract_lane 0
	local.tee 5
	f32.const 0x1p-10
	f32.mul 
	local.tee 6
	local.get 0
	f32.load 160
	local.tee 7
	local.get 7
	local.get 7
	f32.ne 
	f32.select
	local.tee 7
	local.get 7
	local.get 6
	local.get 6
	local.get 6
	f32.ne 
	f32.select
	local.tee 6
	local.get 7
	local.get 6
	f32.gt 
	f32.select
	local.tee 6
	local.get 6
	local.get 6
	f32.ne 
	f32.select
	local.tee 6
	local.get 6
	local.get 4
	local.get 4
	local.get 4
	f32.ne 
	f32.select
	local.tee 4
	local.get 6
	local.get 4
	f32.gt 
	f32.select
	f32.const 0x1.004p0
	f32.mul 
	f32.div 
	local.tee 4
	f32.store 132
	local.get 0
	local.get 2
	local.get 4
	f32x4.splat
	f32x4.mul
	f32x4.ceil
	local.tee 2
	f32x4.extract_lane 0
	f64.promote_f32
	i32.trunc_sat_f64_u
	i32x4.splat
	local.get 2
	f32x4.extract_lane 1
	f64.promote_f32
	i32.trunc_sat_f64_u
	i32x4.replace_lane 1
	v128.const 1, 1, 1, 1
	local.tee 8
	i32x4.max_u
	local.get 8
	local.get 2
	v128.const 0x0p0, 0x0p0, 0x0p0, 0x0p0
	local.tee 9
	f32x4.ge
	local.get 2
	v128.const 0x1p32, 0x1p32, 0x1p32, 0x1p32
	f32x4.lt
	v128.and
	v128.bitselect
	v128.store64_lane 136, 0
	local.get 1
	local.get 0
	i32.load 204
	i32.store 56
	local.get 1
	local.get 0
	i64.load 196:p2align=2
	i64.store 48
	local.get 0
	i32.const 96
	i32.add 
	local.get 0
	i32.load 4
	local.get 0
	i32.load 8
	local.get 0
	i32.load 16
	local.get 0
	i32.load 20
	call <swarm::grid::Grid>::fill
	i32.const 0
	local.set 10
	local.get 0
	i32.const 0
	i32.store 56
	local.get 0
	i32.const 160
	i32.add 
	local.set 11
	local.get 0
	i32.load 124
	local.tee 12
	local.get 0
	i32.load 128
	i32.const 2
	i32.shl 
	i32.add 
	local.set 13
	local.get 0
	i32.load 8
	local.set 14
	local.get 0
	i32.load 4
	local.set 15
	local.get 0
	i32.const 48
	i32.add 
	local.set 16
	local.get 12
	local.set 17
	loop 
	block 
	block 
	local.get 17
	local.get 13
	i32.ne 
	br_if 0
	i32.const 0
	local.set 18
	local.get 13
	local.set 17
	br 1
	end_block
	local.get 17
	i32.load 0
	local.set 18
	local.get 17
	i32.const 4
	i32.add 
	local.tee 19
	local.set 17
	local.get 18
	local.get 14
	i32.ge_u
	br_if 1
	local.get 15
	local.get 18
	i32.const 2
	i32.shl 
	i32.add 
	f32.load 0
	local.set 4
	i32.const 1
	local.set 18
	local.get 19
	local.set 17
	end_block
	block 
	local.get 18
	i32.const 1
	i32.ne 
	br_if 0
	block 
	local.get 10
	local.get 0
	i32.load 48
	i32.ne 
	br_if 0
	local.get 16
	local.get 10
	i32.const 1
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	end_block
	local.get 0
	local.get 10
	i32.const 1
	i32.add 
	local.tee 18
	i32.store 56
	local.get 0
	i32.load 52
	local.get 10
	i32.const 2
	i32.shl 
	i32.add 
	local.get 4
	f32.store 0
	local.get 18
	local.set 10
	br 1
	end_block
	end_loop
	i32.const 0
	local.set 10
	local.get 0
	i32.const 0
	i32.store 68
	local.get 0
	i32.load 20
	local.set 14
	local.get 0
	i32.load 16
	local.set 15
	local.get 0
	i32.const 60
	i32.add 
	local.set 16
	local.get 12
	local.set 17
	loop 
	block 
	block 
	local.get 17
	local.get 13
	i32.ne 
	br_if 0
	i32.const 0
	local.set 18
	local.get 13
	local.set 17
	br 1
	end_block
	local.get 17
	i32.load 0
	local.set 18
	local.get 17
	i32.const 4
	i32.add 
	local.tee 19
	local.set 17
	local.get 18
	local.get 14
	i32.ge_u
	br_if 1
	local.get 15
	local.get 18
	i32.const 2
	i32.shl 
	i32.add 
	f32.load 0
	local.set 4
	i32.const 1
	local.set 18
	local.get 19
	local.set 17
	end_block
	block 
	local.get 18
	i32.const 1
	i32.ne 
	br_if 0
	block 
	local.get 10
	local.get 0
	i32.load 60
	i32.ne 
	br_if 0
	local.get 16
	local.get 10
	i32.const 1
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	end_block
	local.get 0
	local.get 10
	i32.const 1
	i32.add 
	local.tee 18
	i32.store 68
	local.get 0
	i32.load 64
	local.get 10
	i32.const 2
	i32.shl 
	i32.add 
	local.get 4
	f32.store 0
	local.get 18
	local.set 10
	br 1
	end_block
	end_loop
	i32.const 0
	local.set 10
	local.get 0
	i32.const 0
	i32.store 80
	local.get 0
	i32.load 32
	local.set 14
	local.get 0
	i32.load 28
	local.set 15
	local.get 0
	i32.const 72
	i32.add 
	local.set 16
	local.get 12
	local.set 17
	loop 
	block 
	block 
	local.get 17
	local.get 13
	i32.ne 
	br_if 0
	i32.const 0
	local.set 18
	local.get 13
	local.set 17
	br 1
	end_block
	local.get 17
	i32.load 0
	local.set 18
	local.get 17
	i32.const 4
	i32.add 
	local.tee 19
	local.set 17
	local.get 18
	local.get 14
	i32.ge_u
	br_if 1
	local.get 15
	local.get 18
	i32.const 2
	i32.shl 
	i32.add 
	f32.load 0
	local.set 4
	i32.const 1
	local.set 18
	local.get 19
	local.set 17
	end_block
	block 
	local.get 18
	i32.const 1
	i32.ne 
	br_if 0
	block 
	local.get 10
	local.get 0
	i32.load 72
	i32.ne 
	br_if 0
	local.get 16
	local.get 10
	i32.const 1
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	end_block
	local.get 0
	local.get 10
	i32.const 1
	i32.add 
	local.tee 18
	i32.store 80
	local.get 0
	i32.load 76
	local.get 10
	i32.const 2
	i32.shl 
	i32.add 
	local.get 4
	f32.store 0
	local.get 18
	local.set 10
	br 1
	end_block
	end_loop
	i32.const 0
	local.set 14
	local.get 0
	i32.const 0
	i32.store 92
	local.get 0
	i32.load 44
	local.set 19
	local.get 0
	i32.load 40
	local.set 10
	local.get 0
	i32.const 84
	i32.add 
	local.set 15
	loop 
	block 
	block 
	local.get 12
	local.get 13
	i32.ne 
	br_if 0
	i32.const 0
	local.set 17
	local.get 13
	local.set 12
	br 1
	end_block
	local.get 12
	i32.load 0
	local.set 17
	local.get 12
	i32.const 4
	i32.add 
	local.tee 18
	local.set 12
	local.get 17
	local.get 19
	i32.ge_u
	br_if 1
	local.get 10
	local.get 17
	i32.const 2
	i32.shl 
	i32.add 
	f32.load 0
	local.set 4
	i32.const 1
	local.set 17
	local.get 18
	local.set 12
	end_block
	block 
	local.get 17
	i32.const 1
	i32.ne 
	br_if 0
	block 
	local.get 14
	local.get 0
	i32.load 84
	i32.ne 
	br_if 0
	local.get 15
	local.get 14
	i32.const 1
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	end_block
	local.get 0
	local.get 14
	i32.const 1
	i32.add 
	local.tee 17
	i32.store 92
	local.get 0
	i32.load 88
	local.get 14
	i32.const 2
	i32.shl 
	i32.add 
	local.get 4
	f32.store 0
	local.get 17
	local.set 14
	br 1
	end_block
	end_loop
	local.get 0
	i32.load 56
	local.set 20
	local.get 0
	v128.load 48:p2align=3
	local.set 2
	local.get 0
	local.get 0
	v128.load 0:p2align=3
	v128.store 48:p2align=3
	local.get 0
	local.get 2
	v128.store 0:p2align=3
	local.get 0
	v128.load 64:p2align=3
	local.set 2
	local.get 0
	local.get 0
	v128.load 16:p2align=3
	v128.store 64:p2align=3
	local.get 0
	local.get 2
	v128.store 16:p2align=3
	local.get 0
	i64.load 80
	local.set 21
	local.get 0
	i32.load 88
	local.set 13
	local.get 0
	local.get 0
	v128.load 32:p2align=3
	v128.store 80:p2align=3
	local.get 0
	i32.load 44
	local.set 18
	local.get 0
	local.get 14
	i32.store 44
	local.get 0
	local.get 13
	i32.store 40
	local.get 0
	local.get 21
	i64.store 32
	block 
	local.get 20
	i32.eqz
	br_if 0
	local.get 0
	i32.load 80
	local.tee 13
	local.get 0
	i32.load 68
	local.tee 12
	local.get 0
	i32.load 56
	local.tee 17
	local.get 12
	local.get 17
	i32.lt_u
	i32.select
	local.tee 12
	local.get 13
	local.get 12
	i32.lt_u
	i32.select
	local.set 22
	local.get 0
	i32.load 88
	local.set 23
	local.get 0
	i32.load 76
	local.set 24
	local.get 0
	i32.load 64
	local.set 25
	local.get 0
	i32.load 52
	local.set 26
	local.get 0
	i32.load 92
	local.set 27
	local.get 0
	f32.load 160
	local.tee 4
	local.get 4
	f32.mul 
	local.tee 28
	f32x4.splat
	local.set 29
	local.get 0
	f32.load 164
	local.tee 4
	local.get 4
	f32.mul 
	local.tee 7
	f32x4.splat
	local.set 30
	i32.const 0
	local.set 31
	loop 
	block 
	local.get 31
	local.get 0
	i32.load 8
	local.tee 32
	i32.ge_u
	br_if 0
	local.get 31
	local.get 0
	i32.load 20
	local.tee 33
	i32.ge_u
	br_if 0
	local.get 31
	local.get 0
	i32.load 32
	local.tee 34
	i32.ge_u
	br_if 0
	local.get 31
	local.get 0
	i32.load 44
	local.tee 35
	i32.ge_u
	br_if 0
	local.get 0
	i32.load 4
	local.tee 36
	local.get 31
	i32.const 2
	i32.shl 
	local.tee 37
	i32.add 
	f32.load 0
	local.set 6
	local.get 0
	i32.load 16
	local.tee 38
	local.get 37
	i32.add 
	f32.load 0
	local.set 4
	local.get 0
	i32.load 28
	local.tee 39
	local.get 37
	i32.add 
	f32.load 0
	local.set 40
	local.get 1
	local.get 0
	i32.load 40
	local.tee 41
	local.get 37
	i32.add 
	f32.load 0
	f32.store 12
	local.get 1
	local.get 40
	f32.store 8
	local.get 1
	local.get 4
	f32.store 4
	local.get 1
	local.get 6
	f32.store 0
	local.get 1
	i32.const 0
	i32.store 40
	local.get 1
	i64.const 0
	i64.store 32
	local.get 1
	v128.const 0, 0
	v128.store 16
	local.get 0
	i32.load 136
	local.set 42
	local.get 0
	i32.load 140
	local.set 13
	local.get 0
	f32.load 132
	local.set 43
	local.get 1
	i32.const 64
	i32.add 
	i32.const 0
	i32.const 224
	memory.fill 0
	f32.const 0x0p0
	local.set 44
	block 
	block 
	local.get 13
	local.get 13
	i32.const 0
	i32.ne 
	i32.sub 
	local.tee 13
	f32.const 0x0p0
	local.get 4
	local.get 43
	f32.mul 
	local.tee 40
	local.get 40
	local.get 40
	f32.ne 
	f32.select
	local.tee 40
	f32.const 0x0p0
	local.get 40
	f32.const 0x0p0
	f32.gt 
	f32.select
	local.tee 40
	f64.promote_f32
	i32.trunc_sat_f64_u
	local.tee 12
	local.get 13
	local.get 12
	i32.lt_u
	i32.select
	i32.const 0
	local.get 40
	f32.const 0x1p32
	f32.lt 
	i32.select
	local.tee 17
	local.get 17
	i32.const 0
	i32.ne 
	i32.sub 
	local.tee 12
	local.get 13
	local.get 17
	i32.const 1
	i32.add 
	local.tee 17
	local.get 13
	local.get 17
	i32.lt_u
	i32.select
	local.tee 45
	i32.le_u
	br_if 0
	local.get 9
	local.set 2
	local.get 9
	local.set 46
	br 1
	end_block
	local.get 42
	local.get 42
	i32.const 0
	i32.ne 
	i32.sub 
	local.tee 13
	f32.const 0x0p0
	local.get 6
	local.get 43
	f32.mul 
	local.tee 40
	local.get 40
	local.get 40
	f32.ne 
	f32.select
	local.tee 40
	f32.const 0x0p0
	local.get 40
	f32.const 0x0p0
	f32.gt 
	f32.select
	local.tee 40
	f64.promote_f32
	i32.trunc_sat_f64_u
	local.tee 17
	local.get 13
	local.get 17
	i32.lt_u
	i32.select
	i32.const 0
	local.get 40
	f32.const 0x1p32
	f32.lt 
	i32.select
	local.tee 17
	local.get 17
	i32.const 0
	i32.ne 
	i32.sub 
	local.set 47
	local.get 33
	local.get 34
	local.get 35
	local.get 34
	local.get 35
	i32.lt_u
	i32.select
	local.tee 18
	local.get 33
	local.get 18
	i32.lt_u
	i32.select
	local.set 48
	local.get 13
	local.get 17
	i32.const 1
	i32.add 
	local.tee 17
	local.get 13
	local.get 17
	i32.lt_u
	i32.select
	i32.const 1
	i32.add 
	local.set 49
	local.get 4
	f32x4.splat
	local.set 50
	local.get 6
	f32x4.splat
	local.set 51
	local.get 0
	i32.load 100
	local.set 52
	local.get 0
	i32.load 104
	local.set 53
	v128.const 0x0p0, 0x0p0, 0x0p0, 0x0p0
	local.set 46
	f32.const 0x0p0
	local.set 44
	f32.const 0x0p0
	local.set 54
	f32.const 0x0p0
	local.set 55
	loop 
	i32.const 0
	local.set 56
	i32.const 0
	local.set 14
	i32.const 0
	local.set 13
	block 
	local.get 42
	local.get 12
	local.tee 57
	i32.mul 
	local.tee 12
	local.get 47
	i32.add 
	local.tee 17
	local.get 53
	i32.ge_u
	br_if 0
	i32.const 0
	local.set 14
	i32.const 0
	local.set 13
	local.get 49
	local.get 12
	i32.add 
	local.tee 12
	local.get 53
	i32.ge_u
	br_if 0
	local.get 52
	local.get 12
	i32.const 2
	i32.shl 
	i32.add 
	i32.load 0
	local.set 14
	local.get 52
	local.get 17
	i32.const 2
	i32.shl 
	i32.add 
	i32.load 0
	local.set 13
	end_block
	local.get 36
	local.get 13
	i32.const 2
	i32.shl 
	local.tee 19
	i32.add 
	local.set 58
	i32.const 0
	local.get 14
	local.get 13
	i32.sub 
	local.tee 15
	local.get 14
	local.get 32
	i32.gt_u
	local.get 14
	local.get 13
	i32.lt_u
	local.tee 59
	i32.or 
	local.tee 60
	i32.select
	local.set 16
	i32.const 4
	local.set 61
	i32.const 0
	local.set 17
	i32.const 4
	local.set 13
	i32.const 0
	local.set 62
	i32.const 4
	local.set 63
	i32.const 0
	local.set 18
	i32.const 4
	local.set 12
	i32.const 4
	local.set 64
	i32.const 0
	local.set 10
	block 
	local.get 59
	br_if 0
	i32.const 4
	local.set 64
	i32.const 0
	local.set 10
	i32.const 4
	local.get 39
	local.get 19
	i32.add 
	local.get 14
	local.get 34
	i32.gt_u
	local.tee 12
	i32.select
	local.tee 13
	i32.const 0
	local.get 15
	local.get 12
	i32.select
	local.tee 18
	i32.const 536870904
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.set 61
	i32.const 4
	local.get 38
	local.get 19
	i32.add 
	local.get 14
	local.get 33
	i32.gt_u
	local.tee 17
	i32.select
	local.tee 12
	i32.const 0
	local.get 15
	local.get 17
	i32.select
	local.tee 62
	i32.const 536870904
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.set 63
	local.get 18
	i32.const 3
	i32.shr_u
	local.set 17
	local.get 18
	i32.const 7
	i32.and 
	local.set 56
	local.get 62
	i32.const 3
	i32.shr_u
	local.set 18
	local.get 62
	i32.const 7
	i32.and 
	local.set 62
	local.get 14
	local.get 35
	i32.gt_u
	br_if 0
	local.get 41
	local.get 19
	i32.add 
	local.set 64
	local.get 15
	local.set 10
	end_block
	i32.const 4
	local.get 58
	local.get 60
	i32.select
	local.set 58
	local.get 16
	i32.const 7
	i32.and 
	local.set 15
	block 
	local.get 10
	i32.const 3
	i32.shr_u
	local.tee 19
	local.get 17
	local.get 18
	local.get 16
	i32.const 3
	i32.shr_u
	local.tee 59
	local.get 18
	local.get 59
	i32.lt_u
	i32.select
	local.tee 18
	local.get 17
	local.get 18
	i32.lt_u
	i32.select
	local.tee 17
	local.get 19
	local.get 17
	i32.lt_u
	i32.select
	local.tee 19
	i32.eqz
	br_if 0
	local.get 58
	local.set 17
	local.get 64
	local.set 18
	loop 
	local.get 1
	i32.const 64
	i32.add 
	local.get 7
	local.get 28
	local.get 6
	local.get 4
	local.get 17
	local.get 12
	local.get 13
	local.get 18
	call <swarm::rules::lanes::Lanes<8>>::add
	local.get 17
	i32.const 32
	i32.add 
	local.set 17
	local.get 12
	i32.const 32
	i32.add 
	local.set 12
	local.get 13
	i32.const 32
	i32.add 
	local.set 13
	local.get 18
	i32.const 32
	i32.add 
	local.set 18
	local.get 19
	i32.const -1
	i32.add 
	local.tee 19
	br_if 0
	end_loop
	end_block
	block 
	block 
	local.get 15
	i32.eqz
	br_if 0
	i32.const 0
	local.get 14
	i32.const -8
	i32.add 
	local.tee 13
	local.get 13
	local.get 14
	i32.gt_u
	i32.select
	local.tee 13
	i32.const 8
	i32.add 
	local.tee 12
	local.get 32
	i32.gt_u
	br_if 0
	local.get 12
	local.get 48
	i32.gt_u
	br_if 0
	local.get 36
	local.get 13
	i32.const 2
	i32.shl 
	local.tee 12
	i32.add 
	local.set 17
	local.get 38
	local.get 12
	i32.add 
	local.set 18
	local.get 41
	local.get 12
	i32.add 
	local.set 19
	local.get 39
	local.get 12
	i32.add 
	local.set 12
	block 
	block 
	local.get 14
	local.get 13
	i32.sub 
	local.tee 13
	i32.const 8
	i32.ne 
	br_if 0
	local.get 15
	i32.const 2
	i32.shl 
	local.tee 14
	i32.const swarm::rules::lanes::STEPS+224
	i32.add 
	local.set 13
	local.get 14
	f32.load swarm::rules::lanes::STEPS+228
	local.set 40
	local.get 14
	f32.load swarm::rules::lanes::STEPS+224
	local.set 43
	br 1
	end_block
	local.get 1
	f32.const 0x1p0
	f32.const 0x0p0
	local.get 13
	local.get 15
	i32.eq 
	f32.select
	local.tee 43
	f32.store 288
	local.get 1
	local.get 13
	i32.const 7
	i32.gt_u
	local.get 13
	local.get 15
	i32.sub 
	local.tee 14
	i32.const 8
	i32.lt_u
	i32.and 
	f32.convert_i32_u
	f32.store 316
	local.get 1
	local.get 13
	i32.const 6
	i32.gt_u
	local.get 14
	i32.const 7
	i32.lt_u
	i32.and 
	f32.convert_i32_u
	f32.store 312
	local.get 1
	local.get 13
	i32.const 5
	i32.gt_u
	local.get 14
	i32.const 6
	i32.lt_u
	i32.and 
	f32.convert_i32_u
	f32.store 308
	local.get 1
	local.get 13
	i32x4.splat
	v128.const 1, 2, 3, 4
	i32x4.gt_u
	local.get 14
	i32x4.splat
	v128.const 2, 3, 4, 5
	i32x4.lt_u
	v128.and
	local.get 8
	v128.and
	f32x4.convert_i32x4_s
	local.tee 2
	v128.store 292:p2align=2
	local.get 2
	f32x4.extract_lane 0
	local.set 40
	local.get 1
	i32.const 288
	i32.add 
	local.set 13
	end_block
	local.get 1
	local.get 1
	v128.load 224
	local.get 51
	local.get 17
	v128.load 0:p2align=2
	local.tee 65
	f32x4.sub
	local.tee 2
	local.get 43
	f32x4.splat
	local.get 40
	f32x4.replace_lane 1
	local.get 13
	v128.load64_zero 8:p2align=2
	i8x16.shuffle 0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23
	local.tee 66
	local.get 2
	local.get 2
	f32x4.mul
	local.get 50
	local.get 18
	v128.load 0:p2align=2
	local.tee 67
	f32x4.sub
	local.tee 68
	local.get 68
	f32x4.mul
	f32x4.add
	local.tee 2
	local.get 30
	f32x4.lt
	local.get 8
	v128.and
	f32x4.convert_i32x4_s
	f32x4.mul
	local.tee 69
	f32x4.mul
	f32x4.add
	v128.store 224
	local.get 1
	local.get 1
	v128.load 256
	local.get 68
	local.get 69
	f32x4.mul
	f32x4.add
	v128.store 256
	local.get 1
	local.get 66
	local.get 2
	local.get 30
	f32x4.ge
	local.get 2
	local.get 29
	f32x4.lt
	v128.and
	local.get 2
	v128.const 0x0p0, 0x0p0, 0x0p0, 0x0p0
	local.tee 69
	f32x4.gt
	local.get 8
	v128.and
	f32x4.convert_i32x4_s
	v128.and
	f32x4.mul
	local.tee 2
	local.get 1
	v128.load 192
	f32x4.add
	v128.store 192
	local.get 1
	local.get 1
	v128.load 64
	local.get 65
	local.get 2
	f32x4.mul
	f32x4.add
	v128.store 64
	local.get 1
	local.get 67
	local.get 2
	f32x4.mul
	local.get 1
	v128.load 96
	f32x4.add
	v128.store 96
	local.get 1
	local.get 12
	v128.load 0:p2align=2
	local.get 2
	f32x4.mul
	local.get 1
	v128.load 128
	f32x4.add
	v128.store 128
	local.get 1
	local.get 19
	v128.load 0:p2align=2
	local.get 2
	f32x4.mul
	local.get 1
	v128.load 160
	f32x4.add
	v128.store 160
	local.get 1
	local.get 1
	v128.load 240
	local.get 51
	local.get 17
	v128.load 16:p2align=2
	local.tee 65
	f32x4.sub
	local.tee 2
	local.get 13
	v128.load 16:p2align=2
	local.tee 66
	local.get 2
	local.get 2
	f32x4.mul
	local.get 50
	local.get 18
	v128.load 16:p2align=2
	local.tee 67
	f32x4.sub
	local.tee 68
	local.get 68
	f32x4.mul
	f32x4.add
	local.tee 2
	local.get 30
	f32x4.lt
	local.get 8
	v128.and
	f32x4.convert_i32x4_s
	f32x4.mul
	local.tee 70
	f32x4.mul
	f32x4.add
	v128.store 240
	local.get 1
	local.get 1
	v128.load 272
	local.get 68
	local.get 70
	f32x4.mul
	f32x4.add
	v128.store 272
	local.get 1
	local.get 1
	v128.load 80
	local.get 65
	local.get 66
	local.get 2
	local.get 30
	f32x4.ge
	local.get 2
	local.get 29
	f32x4.lt
	v128.and
	local.get 2
	local.get 69
	f32x4.gt
	local.get 8
	v128.and
	f32x4.convert_i32x4_s
	v128.and
	f32x4.mul
	local.tee 2
	f32x4.mul
	f32x4.add
	v128.store 80
	local.get 1
	local.get 67
	local.get 2
	f32x4.mul
	local.get 1
	v128.load 112
	f32x4.add
	v128.store 112
	local.get 1
	local.get 12
	v128.load 16:p2align=2
	local.get 2
	f32x4.mul
	local.get 1
	v128.load 144
	f32x4.add
	v128.store 144
	local.get 1
	local.get 19
	v128.load 16:p2align=2
	local.get 2
	f32x4.mul
	local.get 1
	v128.load 176
	f32x4.add
	v128.store 176
	local.get 1
	local.get 2
	local.get 1
	v128.load 208
	f32x4.add
	v128.store 208
	br 1
	end_block
	local.get 10
	i32.const 7
	i32.and 
	local.tee 13
	local.get 56
	local.get 62
	local.get 15
	local.get 62
	local.get 15
	i32.lt_u
	i32.select
	local.tee 12
	local.get 56
	local.get 12
	i32.lt_u
	i32.select
	local.tee 12
	local.get 13
	local.get 12
	i32.lt_u
	i32.select
	local.tee 13
	i32.eqz
	br_if 0
	local.get 64
	local.get 10
	i32.const 536870904
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.set 17
	block 
	block 
	local.get 6
	local.get 58
	local.get 16
	i32.const 536870904
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.tee 12
	f32.load 0
	local.tee 71
	f32.sub 
	local.tee 40
	local.get 40
	f32.mul 
	local.get 4
	local.get 63
	f32.load 0
	local.tee 72
	f32.sub 
	local.tee 43
	local.get 43
	f32.mul 
	f32.add 
	local.tee 73
	local.get 7
	f32.lt 
	br_if 0
	local.get 73
	local.get 28
	f32.lt 
	i32.eqz
	br_if 1
	local.get 73
	f32.const 0x0p0
	f32.gt 
	i32.eqz
	br_if 1
	local.get 55
	f32.const 0x1p0
	f32.add 
	local.set 55
	local.get 46
	local.get 71
	f32x4.splat
	local.get 72
	f32x4.replace_lane 1
	local.get 61
	f32.load 0
	f32x4.replace_lane 2
	local.get 17
	f32.load 0
	f32x4.replace_lane 3
	f32x4.add
	local.set 46
	br 1
	end_block
	local.get 44
	local.get 43
	f32.add 
	local.set 44
	local.get 54
	local.get 40
	f32.add 
	local.set 54
	end_block
	local.get 13
	i32.const 1
	i32.eq 
	br_if 0
	block 
	block 
	local.get 6
	local.get 12
	f32.load 4
	local.tee 71
	f32.sub 
	local.tee 40
	local.get 40
	f32.mul 
	local.get 4
	local.get 63
	f32.load 4
	local.tee 72
	f32.sub 
	local.tee 43
	local.get 43
	f32.mul 
	f32.add 
	local.tee 73
	local.get 7
	f32.lt 
	br_if 0
	local.get 73
	local.get 28
	f32.lt 
	i32.eqz
	br_if 1
	local.get 73
	f32.const 0x0p0
	f32.gt 
	i32.eqz
	br_if 1
	local.get 55
	f32.const 0x1p0
	f32.add 
	local.set 55
	local.get 46
	local.get 71
	f32x4.splat
	local.get 72
	f32x4.replace_lane 1
	local.get 61
	f32.load 4
	f32x4.replace_lane 2
	local.get 17
	f32.load 4
	f32x4.replace_lane 3
	f32x4.add
	local.set 46
	br 1
	end_block
	local.get 44
	local.get 43
	f32.add 
	local.set 44
	local.get 54
	local.get 40
	f32.add 
	local.set 54
	end_block
	local.get 13
	i32.const 2
	i32.eq 
	br_if 0
	block 
	block 
	local.get 6
	local.get 12
	f32.load 8
	local.tee 71
	f32.sub 
	local.tee 40
	local.get 40
	f32.mul 
	local.get 4
	local.get 63
	f32.load 8
	local.tee 72
	f32.sub 
	local.tee 43
	local.get 43
	f32.mul 
	f32.add 
	local.tee 73
	local.get 7
	f32.lt 
	br_if 0
	local.get 73
	local.get 28
	f32.lt 
	i32.eqz
	br_if 1
	local.get 73
	f32.const 0x0p0
	f32.gt 
	i32.eqz
	br_if 1
	local.get 55
	f32.const 0x1p0
	f32.add 
	local.set 55
	local.get 46
	local.get 71
	f32x4.splat
	local.get 72
	f32x4.replace_lane 1
	local.get 61
	f32.load 8
	f32x4.replace_lane 2
	local.get 17
	f32.load 8
	f32x4.replace_lane 3
	f32x4.add
	local.set 46
	br 1
	end_block
	local.get 44
	local.get 43
	f32.add 
	local.set 44
	local.get 54
	local.get 40
	f32.add 
	local.set 54
	end_block
	local.get 13
	i32.const 3
	i32.eq 
	br_if 0
	block 
	block 
	local.get 6
	local.get 12
	f32.load 12
	local.tee 71
	f32.sub 
	local.tee 40
	local.get 40
	f32.mul 
	local.get 4
	local.get 63
	f32.load 12
	local.tee 72
	f32.sub 
	local.tee 43
	local.get 43
	f32.mul 
	f32.add 
	local.tee 73
	local.get 7
	f32.lt 
	br_if 0
	local.get 73
	local.get 28
	f32.lt 
	i32.eqz
	br_if 1
	local.get 73
	f32.const 0x0p0
	f32.gt 
	i32.eqz
	br_if 1
	local.get 55
	f32.const 0x1p0
	f32.add 
	local.set 55
	local.get 46
	local.get 71
	f32x4.splat
	local.get 72
	f32x4.replace_lane 1
	local.get 61
	f32.load 12
	f32x4.replace_lane 2
	local.get 17
	f32.load 12
	f32x4.replace_lane 3
	f32x4.add
	local.set 46
	br 1
	end_block
	local.get 44
	local.get 43
	f32.add 
	local.set 44
	local.get 54
	local.get 40
	f32.add 
	local.set 54
	end_block
	local.get 13
	i32.const 4
	i32.eq 
	br_if 0
	block 
	block 
	local.get 6
	local.get 12
	f32.load 16
	local.tee 71
	f32.sub 
	local.tee 40
	local.get 40
	f32.mul 
	local.get 4
	local.get 63
	f32.load 16
	local.tee 72
	f32.sub 
	local.tee 43
	local.get 43
	f32.mul 
	f32.add 
	local.tee 73
	local.get 7
	f32.lt 
	br_if 0
	local.get 73
	local.get 28
	f32.lt 
	i32.eqz
	br_if 1
	local.get 73
	f32.const 0x0p0
	f32.gt 
	i32.eqz
	br_if 1
	local.get 55
	f32.const 0x1p0
	f32.add 
	local.set 55
	local.get 46
	local.get 71
	f32x4.splat
	local.get 72
	f32x4.replace_lane 1
	local.get 61
	f32.load 16
	f32x4.replace_lane 2
	local.get 17
	f32.load 16
	f32x4.replace_lane 3
	f32x4.add
	local.set 46
	br 1
	end_block
	local.get 44
	local.get 43
	f32.add 
	local.set 44
	local.get 54
	local.get 40
	f32.add 
	local.set 54
	end_block
	local.get 13
	i32.const 5
	i32.eq 
	br_if 0
	block 
	block 
	local.get 6
	local.get 12
	f32.load 20
	local.tee 71
	f32.sub 
	local.tee 40
	local.get 40
	f32.mul 
	local.get 4
	local.get 63
	f32.load 20
	local.tee 72
	f32.sub 
	local.tee 43
	local.get 43
	f32.mul 
	f32.add 
	local.tee 73
	local.get 7
	f32.lt 
	br_if 0
	local.get 73
	local.get 28
	f32.lt 
	i32.eqz
	br_if 1
	local.get 73
	f32.const 0x0p0
	f32.gt 
	i32.eqz
	br_if 1
	local.get 55
	f32.const 0x1p0
	f32.add 
	local.set 55
	local.get 46
	local.get 71
	f32x4.splat
	local.get 72
	f32x4.replace_lane 1
	local.get 61
	f32.load 20
	f32x4.replace_lane 2
	local.get 17
	f32.load 20
	f32x4.replace_lane 3
	f32x4.add
	local.set 46
	br 1
	end_block
	local.get 44
	local.get 43
	f32.add 
	local.set 44
	local.get 54
	local.get 40
	f32.add 
	local.set 54
	end_block
	local.get 13
	i32.const 6
	i32.eq 
	br_if 0
	block 
	local.get 6
	local.get 12
	f32.load 24
	local.tee 71
	f32.sub 
	local.tee 40
	local.get 40
	f32.mul 
	local.get 4
	local.get 63
	f32.load 24
	local.tee 72
	f32.sub 
	local.tee 43
	local.get 43
	f32.mul 
	f32.add 
	local.tee 73
	local.get 7
	f32.lt 
	br_if 0
	local.get 73
	local.get 28
	f32.lt 
	i32.eqz
	br_if 1
	local.get 73
	f32.const 0x0p0
	f32.gt 
	i32.eqz
	br_if 1
	local.get 55
	f32.const 0x1p0
	f32.add 
	local.set 55
	local.get 46
	local.get 71
	f32x4.splat
	local.get 72
	f32x4.replace_lane 1
	local.get 61
	f32.load 24
	f32x4.replace_lane 2
	local.get 17
	f32.load 24
	f32x4.replace_lane 3
	f32x4.add
	local.set 46
	br 1
	end_block
	local.get 44
	local.get 43
	f32.add 
	local.set 44
	local.get 54
	local.get 40
	f32.add 
	local.set 54
	end_block
	local.get 57
	i32.const 1
	i32.add 
	local.set 12
	local.get 57
	local.get 45
	i32.ne 
	br_if 0
	end_loop
	local.get 1
	local.get 54
	f32.store 36
	local.get 1
	local.get 55
	f32.store 32
	local.get 1
	v128.load 160
	local.set 2
	local.get 1
	v128.load 128
	local.set 68
	local.get 1
	v128.load 96
	local.set 50
	local.get 1
	v128.load 64
	local.set 51
	local.get 1
	v128.load 176
	local.set 65
	local.get 1
	v128.load 144
	local.set 66
	local.get 1
	v128.load 112
	local.set 67
	local.get 1
	v128.load 80
	local.set 69
	local.get 1
	local.get 46
	v128.store 16
	local.get 51
	local.get 50
	i8x16.shuffle 0, 1, 2, 3, 16, 17, 18, 19, 0, 1, 2, 3, 0, 1, 2, 3
	local.get 68
	local.get 2
	i8x16.shuffle 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 16, 17, 18, 19
	i8x16.shuffle 0, 1, 2, 3, 4, 5, 6, 7, 24, 25, 26, 27, 28, 29, 30, 31
	local.get 51
	local.get 50
	i8x16.shuffle 4, 5, 6, 7, 20, 21, 22, 23, 0, 1, 2, 3, 0, 1, 2, 3
	local.get 68
	local.get 2
	i8x16.shuffle 0, 1, 2, 3, 0, 1, 2, 3, 4, 5, 6, 7, 20, 21, 22, 23
	i8x16.shuffle 0, 1, 2, 3, 4, 5, 6, 7, 24, 25, 26, 27, 28, 29, 30, 31
	f32x4.add
	local.get 51
	local.get 50
	i8x16.shuffle 8, 9, 10, 11, 24, 25, 26, 27, 0, 1, 2, 3, 0, 1, 2, 3
	local.get 68
	local.get 2
	i8x16.shuffle 0, 1, 2, 3, 0, 1, 2, 3, 8, 9, 10, 11, 24, 25, 26, 27
	i8x16.shuffle 0, 1, 2, 3, 4, 5, 6, 7, 24, 25, 26, 27, 28, 29, 30, 31
	f32x4.add
	local.get 51
	local.get 50
	i8x16.shuffle 12, 13, 14, 15, 28, 29, 30, 31, 0, 1, 2, 3, 0, 1, 2, 3
	local.get 68
	local.get 2
	i8x16.shuffle 0, 1, 2, 3, 0, 1, 2, 3, 12, 13, 14, 15, 28, 29, 30, 31
	i8x16.shuffle 0, 1, 2, 3, 4, 5, 6, 7, 24, 25, 26, 27, 28, 29, 30, 31
	f32x4.add
	local.get 69
	local.get 67
	i8x16.shuffle 0, 1, 2, 3, 16, 17, 18, 19, 0, 1, 2, 3, 0, 1, 2, 3
	local.get 66
	local.get 65
	i8x16.shuffle 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 16, 17, 18, 19
	i8x16.shuffle 0, 1, 2, 3, 4, 5, 6, 7, 24, 25, 26, 27, 28, 29, 30, 31
	f32x4.add
	local.get 69
	local.get 67
	i8x16.shuffle 4, 5, 6, 7, 20, 21, 22, 23, 0, 1, 2, 3, 0, 1, 2, 3
	local.get 66
	local.get 65
	i8x16.shuffle 0, 1, 2, 3, 0, 1, 2, 3, 4, 5, 6, 7, 20, 21, 22, 23
	i8x16.shuffle 0, 1, 2, 3, 4, 5, 6, 7, 24, 25, 26, 27, 28, 29, 30, 31
	f32x4.add
	local.get 69
	local.get 67
	i8x16.shuffle 8, 9, 10, 11, 24, 25, 26, 27, 0, 1, 2, 3, 0, 1, 2, 3
	local.get 66
	local.get 65
	i8x16.shuffle 0, 1, 2, 3, 0, 1, 2, 3, 8, 9, 10, 11, 24, 25, 26, 27
	i8x16.shuffle 0, 1, 2, 3, 4, 5, 6, 7, 24, 25, 26, 27, 28, 29, 30, 31
	f32x4.add
	local.get 69
	local.get 67
	i8x16.shuffle 12, 13, 14, 15, 28, 29, 30, 31, 0, 1, 2, 3, 0, 1, 2, 3
	local.get 66
	local.get 65
	i8x16.shuffle 0, 1, 2, 3, 0, 1, 2, 3, 12, 13, 14, 15, 28, 29, 30, 31
	i8x16.shuffle 0, 1, 2, 3, 4, 5, 6, 7, 24, 25, 26, 27, 28, 29, 30, 31
	f32x4.add
	local.get 46
	f32x4.add
	local.set 2
	local.get 1
	v128.load 192
	local.tee 46
	local.get 1
	v128.load 224
	local.tee 68
	i8x16.shuffle 0, 1, 2, 3, 16, 17, 18, 19, 0, 1, 2, 3, 0, 1, 2, 3
	local.get 46
	local.get 68
	i8x16.shuffle 4, 5, 6, 7, 20, 21, 22, 23, 0, 1, 2, 3, 0, 1, 2, 3
	f32x4.add
	local.get 46
	local.get 68
	i8x16.shuffle 8, 9, 10, 11, 24, 25, 26, 27, 0, 1, 2, 3, 0, 1, 2, 3
	f32x4.add
	local.get 46
	local.get 68
	i8x16.shuffle 12, 13, 14, 15, 28, 29, 30, 31, 0, 1, 2, 3, 0, 1, 2, 3
	f32x4.add
	local.get 1
	v128.load 208
	local.tee 46
	local.get 1
	v128.load 240
	local.tee 68
	i8x16.shuffle 0, 1, 2, 3, 16, 17, 18, 19, 0, 1, 2, 3, 0, 1, 2, 3
	f32x4.add
	local.get 46
	local.get 68
	i8x16.shuffle 4, 5, 6, 7, 20, 21, 22, 23, 0, 1, 2, 3, 0, 1, 2, 3
	f32x4.add
	local.get 46
	local.get 68
	i8x16.shuffle 8, 9, 10, 11, 24, 25, 26, 27, 0, 1, 2, 3, 0, 1, 2, 3
	f32x4.add
	local.get 46
	local.get 68
	i8x16.shuffle 12, 13, 14, 15, 28, 29, 30, 31, 0, 1, 2, 3, 0, 1, 2, 3
	f32x4.add
	local.get 1
	v128.load 32
	f32x4.add
	local.set 46
	local.get 1
	f32.load 260
	local.set 4
	local.get 1
	f32.load 256
	local.set 6
	local.get 1
	f32.load 264
	local.set 40
	local.get 1
	f32.load 268
	local.set 43
	local.get 1
	f32.load 272
	local.set 54
	local.get 1
	f32.load 276
	local.set 73
	local.get 1
	f32.load 280
	local.set 71
	local.get 1
	f32.load 284
	local.set 72
	local.get 1
	local.get 44
	f32.store 40
	local.get 72
	local.get 71
	local.get 73
	local.get 54
	local.get 43
	local.get 40
	local.get 6
	local.get 4
	f32.add 
	f32.add 
	f32.add 
	f32.add 
	f32.add 
	f32.add 
	f32.add 
	local.get 44
	f32.add 
	local.set 44
	local.get 27
	local.set 18
	end_block
	local.get 1
	local.get 44
	f32.store 40
	local.get 1
	local.get 46
	v128.store64_lane 32, 0
	local.get 1
	local.get 2
	v128.store 16
	local.get 1
	i32.const 64
	i32.add 
	local.get 11
	local.get 5
	local.get 3
	local.get 1
	i32.const 48
	i32.add 
	local.get 1
	local.get 1
	i32.const 16
	i32.add 
	call swarm::rules::finish
	local.get 31
	local.get 18
	i32.ge_u
	br_if 0
	local.get 31
	local.get 22
	i32.ge_u
	br_if 0
	local.get 26
	local.get 37
	i32.add 
	local.get 1
	f32.load 64
	f32.store 0
	local.get 25
	local.get 37
	i32.add 
	local.get 1
	f32.load 68
	f32.store 0
	local.get 24
	local.get 37
	i32.add 
	local.get 1
	f32.load 72
	f32.store 0
	local.get 23
	local.get 37
	i32.add 
	local.get 1
	f32.load 76
	f32.store 0
	end_block
	local.get 31
	i32.const 1
	i32.add 
	local.tee 31
	local.get 20
	i32.ne 
	br_if 0
	end_loop
	end_block
	local.get 1
	i32.const 320
	i32.add 
	global.set __stack_pointer
	end_function
