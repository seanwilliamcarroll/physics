<swarm::flock::Flock>::step_sorted:
	.functype	<swarm::flock::Flock>::step_sorted (i32) -> ()
	.local  	i32, v128, f32, f32, f32, f32, f32, f32, v128, v128, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, f32, f32, v128, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, f32, i32, f32, i32, i32, i32, i32, i32, i32, v128, v128, i32, i32, f32, f32, f32, v128, i32, i32, i32, i32, i32, i32, i32, i32, i32, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, v128, f32
	global.get __stack_pointer
	i32.const 80
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
	local.tee 8
	local.get 8
	local.get 6
	local.get 6
	local.get 6
	f32.ne 
	f32.select
	local.tee 6
	local.get 8
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
	local.tee 9
	f32x4.extract_lane 0
	f64.promote_f32
	i32.trunc_sat_f64_u
	i32x4.splat
	local.get 9
	f32x4.extract_lane 1
	f64.promote_f32
	i32.trunc_sat_f64_u
	i32x4.replace_lane 1
	v128.const 1, 1, 1, 1
	local.tee 2
	i32x4.max_u
	local.get 2
	local.get 9
	v128.const 0x0p0, 0x0p0, 0x0p0, 0x0p0
	local.tee 10
	f32x4.ge
	local.get 9
	v128.const 0x1p32, 0x1p32, 0x1p32, 0x1p32
	f32x4.lt
	v128.and
	v128.bitselect
	v128.store64_lane 136, 0
	local.get 1
	local.get 0
	i32.load 204
	i32.store 72
	local.get 1
	local.get 0
	i64.load 196:p2align=2
	i64.store 64
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
	local.set 11
	local.get 0
	i32.const 0
	i32.store 56
	local.get 0
	i32.const 160
	i32.add 
	local.set 12
	local.get 0
	i32.load 124
	local.tee 13
	local.get 0
	i32.load 128
	i32.const 2
	i32.shl 
	i32.add 
	local.set 14
	local.get 0
	i32.load 8
	local.set 15
	local.get 0
	i32.load 4
	local.set 16
	local.get 0
	i32.const 48
	i32.add 
	local.set 17
	local.get 13
	local.set 18
	loop 
	block 
	block 
	local.get 18
	local.get 14
	i32.ne 
	br_if 0
	i32.const 0
	local.set 19
	local.get 14
	local.set 18
	br 1
	end_block
	local.get 18
	i32.load 0
	local.set 19
	local.get 18
	i32.const 4
	i32.add 
	local.tee 20
	local.set 18
	local.get 19
	local.get 15
	i32.ge_u
	br_if 1
	local.get 16
	local.get 19
	i32.const 2
	i32.shl 
	i32.add 
	f32.load 0
	local.set 4
	i32.const 1
	local.set 19
	local.get 20
	local.set 18
	end_block
	block 
	local.get 19
	i32.const 1
	i32.ne 
	br_if 0
	block 
	local.get 11
	local.get 0
	i32.load 48
	i32.ne 
	br_if 0
	local.get 17
	local.get 11
	i32.const 1
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	end_block
	local.get 0
	local.get 11
	i32.const 1
	i32.add 
	local.tee 19
	i32.store 56
	local.get 0
	i32.load 52
	local.get 11
	i32.const 2
	i32.shl 
	i32.add 
	local.get 4
	f32.store 0
	local.get 19
	local.set 11
	br 1
	end_block
	end_loop
	i32.const 0
	local.set 11
	local.get 0
	i32.const 0
	i32.store 68
	local.get 0
	i32.load 20
	local.set 15
	local.get 0
	i32.load 16
	local.set 16
	local.get 0
	i32.const 60
	i32.add 
	local.set 17
	local.get 13
	local.set 18
	loop 
	block 
	block 
	local.get 18
	local.get 14
	i32.ne 
	br_if 0
	i32.const 0
	local.set 19
	local.get 14
	local.set 18
	br 1
	end_block
	local.get 18
	i32.load 0
	local.set 19
	local.get 18
	i32.const 4
	i32.add 
	local.tee 20
	local.set 18
	local.get 19
	local.get 15
	i32.ge_u
	br_if 1
	local.get 16
	local.get 19
	i32.const 2
	i32.shl 
	i32.add 
	f32.load 0
	local.set 4
	i32.const 1
	local.set 19
	local.get 20
	local.set 18
	end_block
	block 
	local.get 19
	i32.const 1
	i32.ne 
	br_if 0
	block 
	local.get 11
	local.get 0
	i32.load 60
	i32.ne 
	br_if 0
	local.get 17
	local.get 11
	i32.const 1
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	end_block
	local.get 0
	local.get 11
	i32.const 1
	i32.add 
	local.tee 19
	i32.store 68
	local.get 0
	i32.load 64
	local.get 11
	i32.const 2
	i32.shl 
	i32.add 
	local.get 4
	f32.store 0
	local.get 19
	local.set 11
	br 1
	end_block
	end_loop
	i32.const 0
	local.set 11
	local.get 0
	i32.const 0
	i32.store 80
	local.get 0
	i32.load 32
	local.set 15
	local.get 0
	i32.load 28
	local.set 16
	local.get 0
	i32.const 72
	i32.add 
	local.set 17
	local.get 13
	local.set 18
	loop 
	block 
	block 
	local.get 18
	local.get 14
	i32.ne 
	br_if 0
	i32.const 0
	local.set 19
	local.get 14
	local.set 18
	br 1
	end_block
	local.get 18
	i32.load 0
	local.set 19
	local.get 18
	i32.const 4
	i32.add 
	local.tee 20
	local.set 18
	local.get 19
	local.get 15
	i32.ge_u
	br_if 1
	local.get 16
	local.get 19
	i32.const 2
	i32.shl 
	i32.add 
	f32.load 0
	local.set 4
	i32.const 1
	local.set 19
	local.get 20
	local.set 18
	end_block
	block 
	local.get 19
	i32.const 1
	i32.ne 
	br_if 0
	block 
	local.get 11
	local.get 0
	i32.load 72
	i32.ne 
	br_if 0
	local.get 17
	local.get 11
	i32.const 1
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	end_block
	local.get 0
	local.get 11
	i32.const 1
	i32.add 
	local.tee 19
	i32.store 80
	local.get 0
	i32.load 76
	local.get 11
	i32.const 2
	i32.shl 
	i32.add 
	local.get 4
	f32.store 0
	local.get 19
	local.set 11
	br 1
	end_block
	end_loop
	i32.const 0
	local.set 15
	local.get 0
	i32.const 0
	i32.store 92
	local.get 0
	i32.load 44
	local.set 20
	local.get 0
	i32.load 40
	local.set 11
	local.get 0
	i32.const 84
	i32.add 
	local.set 16
	loop 
	block 
	block 
	local.get 13
	local.get 14
	i32.ne 
	br_if 0
	i32.const 0
	local.set 18
	local.get 14
	local.set 13
	br 1
	end_block
	local.get 13
	i32.load 0
	local.set 18
	local.get 13
	i32.const 4
	i32.add 
	local.tee 19
	local.set 13
	local.get 18
	local.get 20
	i32.ge_u
	br_if 1
	local.get 11
	local.get 18
	i32.const 2
	i32.shl 
	i32.add 
	f32.load 0
	local.set 4
	i32.const 1
	local.set 18
	local.get 19
	local.set 13
	end_block
	block 
	local.get 18
	i32.const 1
	i32.ne 
	br_if 0
	block 
	local.get 15
	local.get 0
	i32.load 84
	i32.ne 
	br_if 0
	local.get 16
	local.get 15
	i32.const 1
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	end_block
	local.get 0
	local.get 15
	i32.const 1
	i32.add 
	local.tee 18
	i32.store 92
	local.get 0
	i32.load 88
	local.get 15
	i32.const 2
	i32.shl 
	i32.add 
	local.get 4
	f32.store 0
	local.get 18
	local.set 15
	br 1
	end_block
	end_loop
	local.get 0
	i32.load 56
	local.set 21
	local.get 0
	v128.load 48:p2align=3
	local.set 9
	local.get 0
	local.get 0
	v128.load 0:p2align=3
	v128.store 48:p2align=3
	local.get 0
	local.get 9
	v128.store 0:p2align=3
	local.get 0
	v128.load 64:p2align=3
	local.set 9
	local.get 0
	local.get 0
	v128.load 16:p2align=3
	v128.store 64:p2align=3
	local.get 0
	local.get 9
	v128.store 16:p2align=3
	local.get 0
	i64.load 80
	local.set 22
	local.get 0
	i32.load 88
	local.set 14
	local.get 0
	local.get 0
	v128.load 32:p2align=3
	v128.store 80:p2align=3
	local.get 0
	local.get 14
	i32.store 40
	local.get 0
	local.get 15
	i32.store 44
	local.get 0
	local.get 22
	i64.store 32
	block 
	local.get 21
	i32.eqz
	br_if 0
	local.get 0
	i32.load 92
	local.tee 14
	local.get 0
	i32.load 80
	local.tee 13
	local.get 0
	i32.load 68
	local.tee 18
	local.get 0
	i32.load 56
	local.tee 19
	local.get 18
	local.get 19
	i32.lt_u
	i32.select
	local.tee 18
	local.get 13
	local.get 18
	i32.lt_u
	i32.select
	local.tee 13
	local.get 14
	local.get 13
	i32.lt_u
	i32.select
	local.set 23
	local.get 0
	f32.load 164
	local.tee 4
	local.get 4
	f32.mul 
	local.tee 24
	f32x4.splat
	local.set 9
	local.get 7
	local.get 7
	f32.mul 
	local.tee 25
	f32x4.splat
	local.set 26
	local.get 0
	i32.load 88
	local.set 27
	local.get 0
	i32.load 76
	local.set 28
	local.get 0
	i32.load 64
	local.set 29
	local.get 0
	i32.load 52
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
	local.set 38
	local.get 0
	i32.load 16
	local.tee 39
	local.get 37
	i32.add 
	f32.load 0
	local.set 40
	local.get 0
	i32.load 28
	local.tee 41
	local.get 37
	i32.add 
	f32.load 0
	local.set 4
	local.get 1
	local.get 0
	i32.load 40
	local.tee 42
	local.get 37
	i32.add 
	f32.load 0
	f32.store 12
	local.get 1
	local.get 4
	f32.store 8
	local.get 1
	local.get 40
	f32.store 4
	local.get 1
	local.get 38
	f32.store 0
	local.get 1
	i64.const 0
	i64.store 32
	local.get 1
	v128.const 0, 0
	v128.store 16
	local.get 0
	f32.load 132
	local.set 7
	local.get 1
	i32.const 0
	i32.store 40
	block 
	local.get 0
	i32.load 140
	local.tee 14
	local.get 14
	i32.const 0
	i32.ne 
	i32.sub 
	local.tee 14
	f32.const 0x0p0
	local.get 40
	local.get 7
	f32.mul 
	local.tee 4
	local.get 4
	local.get 4
	f32.ne 
	f32.select
	local.tee 4
	f32.const 0x0p0
	local.get 4
	f32.const 0x0p0
	f32.gt 
	f32.select
	local.tee 4
	f64.promote_f32
	i32.trunc_sat_f64_u
	local.tee 13
	local.get 14
	local.get 13
	i32.lt_u
	i32.select
	i32.const 0
	local.get 4
	f32.const 0x1p32
	f32.lt 
	i32.select
	local.tee 13
	local.get 13
	i32.const 0
	i32.ne 
	i32.sub 
	local.tee 19
	local.get 14
	local.get 13
	i32.const 1
	i32.add 
	local.tee 13
	local.get 14
	local.get 13
	i32.lt_u
	i32.select
	local.tee 43
	i32.gt_u
	br_if 0
	local.get 0
	i32.load 136
	local.tee 44
	local.get 44
	i32.const 0
	i32.ne 
	i32.sub 
	local.tee 14
	f32.const 0x0p0
	local.get 38
	local.get 7
	f32.mul 
	local.tee 4
	local.get 4
	local.get 4
	f32.ne 
	f32.select
	local.tee 4
	f32.const 0x0p0
	local.get 4
	f32.const 0x0p0
	f32.gt 
	f32.select
	local.tee 4
	f64.promote_f32
	i32.trunc_sat_f64_u
	local.tee 13
	local.get 14
	local.get 13
	i32.lt_u
	i32.select
	i32.const 0
	local.get 4
	f32.const 0x1p32
	f32.lt 
	i32.select
	local.tee 13
	local.get 13
	i32.const 0
	i32.ne 
	i32.sub 
	local.set 45
	local.get 14
	local.get 13
	i32.const 1
	i32.add 
	local.tee 13
	local.get 14
	local.get 13
	i32.lt_u
	i32.select
	i32.const 1
	i32.add 
	local.set 46
	local.get 38
	f32x4.splat
	local.set 47
	local.get 40
	f32x4.splat
	local.set 48
	local.get 0
	i32.load 100
	local.set 49
	local.get 0
	i32.load 104
	local.set 50
	f32.const 0x0p0
	local.set 51
	f32.const 0x0p0
	local.set 52
	f32.const 0x0p0
	local.set 53
	local.get 10
	local.set 54
	loop 
	i32.const 0
	local.set 18
	i32.const 0
	local.set 14
	i32.const 0
	local.set 13
	block 
	local.get 19
	local.tee 55
	local.get 44
	i32.mul 
	local.tee 19
	local.get 45
	i32.add 
	local.tee 20
	local.get 50
	i32.ge_u
	br_if 0
	i32.const 0
	local.set 14
	i32.const 0
	local.set 13
	local.get 46
	local.get 19
	i32.add 
	local.tee 19
	local.get 50
	i32.ge_u
	br_if 0
	local.get 49
	local.get 19
	i32.const 2
	i32.shl 
	i32.add 
	i32.load 0
	local.set 14
	local.get 49
	local.get 20
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
	local.tee 15
	i32.add 
	local.set 56
	i32.const 0
	local.get 14
	local.get 13
	i32.sub 
	local.tee 16
	local.get 14
	local.get 32
	i32.gt_u
	local.get 14
	local.get 13
	i32.lt_u
	local.tee 57
	i32.or 
	local.tee 58
	i32.select
	local.set 59
	i32.const 4
	local.set 20
	i32.const 4
	local.set 17
	i32.const 0
	local.set 60
	i32.const 4
	local.set 19
	i32.const 0
	local.set 13
	i32.const 4
	local.set 61
	i32.const 0
	local.set 62
	i32.const 4
	local.set 11
	i32.const 0
	local.set 63
	block 
	local.get 57
	br_if 0
	i32.const 4
	local.set 11
	i32.const 0
	local.set 63
	i32.const 4
	local.get 41
	local.get 15
	i32.add 
	local.get 14
	local.get 34
	i32.gt_u
	local.tee 13
	i32.select
	local.tee 17
	i32.const 0
	local.get 16
	local.get 13
	i32.select
	local.tee 13
	i32.const 536870896
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.set 20
	i32.const 4
	local.get 39
	local.get 15
	i32.add 
	local.get 14
	local.get 33
	i32.gt_u
	local.tee 18
	i32.select
	local.tee 61
	i32.const 0
	local.get 16
	local.get 18
	i32.select
	local.tee 60
	i32.const 536870896
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.set 19
	local.get 13
	i32.const 4
	i32.shr_u
	local.set 18
	local.get 13
	i32.const 15
	i32.and 
	local.set 62
	local.get 60
	i32.const 4
	i32.shr_u
	local.set 13
	local.get 60
	i32.const 15
	i32.and 
	local.set 60
	local.get 14
	local.get 35
	i32.gt_u
	br_if 0
	local.get 42
	local.get 15
	i32.add 
	local.set 11
	local.get 16
	local.set 63
	end_block
	i32.const 4
	local.get 56
	local.get 58
	i32.select
	local.set 16
	block 
	block 
	local.get 63
	i32.const 4
	i32.shr_u
	local.tee 14
	local.get 18
	local.get 13
	local.get 59
	i32.const 4
	i32.shr_u
	local.tee 15
	local.get 13
	local.get 15
	i32.lt_u
	i32.select
	local.tee 13
	local.get 18
	local.get 13
	i32.lt_u
	i32.select
	local.tee 13
	local.get 14
	local.get 13
	i32.lt_u
	i32.select
	local.tee 15
	br_if 0
	v128.const 0x0p0, 0x0p0, 0x0p0, 0x0p0
	local.tee 64
	local.set 65
	local.get 64
	local.set 66
	local.get 64
	local.set 67
	local.get 64
	local.set 68
	local.get 64
	local.set 69
	local.get 64
	local.set 70
	local.get 64
	local.set 71
	local.get 64
	local.set 72
	local.get 64
	local.set 73
	local.get 64
	local.set 74
	local.get 64
	local.set 75
	local.get 64
	local.set 76
	local.get 64
	local.set 77
	local.get 64
	local.set 78
	local.get 64
	local.set 79
	local.get 64
	local.set 80
	local.get 64
	local.set 81
	local.get 64
	local.set 82
	local.get 64
	local.set 83
	local.get 64
	local.set 84
	local.get 64
	local.set 85
	local.get 64
	local.set 86
	local.get 64
	local.set 87
	local.get 64
	local.set 88
	local.get 64
	local.set 89
	local.get 64
	local.set 90
	local.get 64
	local.set 91
	br 1
	end_block
	i32.const 0
	local.set 14
	v128.const 0x0p0, 0x0p0, 0x0p0, 0x0p0
	local.tee 92
	local.set 64
	local.get 92
	local.set 65
	local.get 92
	local.set 66
	local.get 92
	local.set 67
	local.get 92
	local.set 68
	local.get 92
	local.set 69
	local.get 92
	local.set 70
	local.get 92
	local.set 71
	local.get 92
	local.set 72
	local.get 92
	local.set 73
	local.get 92
	local.set 74
	local.get 92
	local.set 75
	local.get 92
	local.set 76
	local.get 92
	local.set 77
	local.get 92
	local.set 78
	local.get 92
	local.set 79
	local.get 92
	local.set 80
	local.get 92
	local.set 81
	local.get 92
	local.set 82
	local.get 92
	local.set 83
	local.get 92
	local.set 84
	local.get 92
	local.set 85
	local.get 92
	local.set 86
	local.get 92
	local.set 87
	local.get 92
	local.set 88
	local.get 92
	local.set 89
	local.get 92
	local.set 90
	local.get 92
	local.set 91
	loop 
	local.get 47
	local.get 16
	local.get 14
	i32.add 
	local.tee 13
	v128.load 0:p2align=2
	local.tee 93
	f32x4.sub
	local.tee 94
	local.get 94
	f32x4.mul
	local.get 48
	local.get 61
	local.get 14
	i32.add 
	local.tee 18
	v128.load 0:p2align=2
	local.tee 95
	f32x4.sub
	local.tee 96
	local.get 96
	f32x4.mul
	f32x4.add
	local.tee 97
	local.get 9
	f32x4.ge
	local.get 97
	local.get 26
	f32x4.lt
	v128.and
	local.get 97
	local.get 92
	f32x4.gt
	local.get 2
	v128.and
	f32x4.convert_i32x4_s
	v128.and
	local.tee 98
	local.get 75
	f32x4.add
	local.set 75
	local.get 47
	local.get 13
	i32.const 48
	i32.add 
	v128.load 0:p2align=2
	local.tee 99
	f32x4.sub
	local.tee 100
	local.get 100
	f32x4.mul
	local.get 48
	local.get 18
	i32.const 48
	i32.add 
	v128.load 0:p2align=2
	local.tee 101
	f32x4.sub
	local.tee 102
	local.get 102
	f32x4.mul
	f32x4.add
	local.tee 103
	local.get 9
	f32x4.ge
	local.get 103
	local.get 26
	f32x4.lt
	v128.and
	local.get 103
	local.get 92
	f32x4.gt
	local.get 2
	v128.and
	f32x4.convert_i32x4_s
	v128.and
	local.tee 104
	local.get 72
	f32x4.add
	local.set 72
	local.get 47
	local.get 13
	i32.const 32
	i32.add 
	v128.load 0:p2align=2
	local.tee 105
	f32x4.sub
	local.tee 106
	local.get 106
	f32x4.mul
	local.get 48
	local.get 18
	i32.const 32
	i32.add 
	v128.load 0:p2align=2
	local.tee 107
	f32x4.sub
	local.tee 108
	local.get 108
	f32x4.mul
	f32x4.add
	local.tee 109
	local.get 9
	f32x4.ge
	local.get 109
	local.get 26
	f32x4.lt
	v128.and
	local.get 109
	local.get 92
	f32x4.gt
	local.get 2
	v128.and
	f32x4.convert_i32x4_s
	v128.and
	local.tee 110
	local.get 73
	f32x4.add
	local.set 73
	local.get 47
	local.get 13
	i32.const 16
	i32.add 
	v128.load 0:p2align=2
	local.tee 111
	f32x4.sub
	local.tee 112
	local.get 112
	f32x4.mul
	local.get 48
	local.get 18
	i32.const 16
	i32.add 
	v128.load 0:p2align=2
	local.tee 113
	f32x4.sub
	local.tee 114
	local.get 114
	f32x4.mul
	f32x4.add
	local.tee 115
	local.get 9
	f32x4.ge
	local.get 115
	local.get 26
	f32x4.lt
	v128.and
	local.get 115
	local.get 92
	f32x4.gt
	local.get 2
	v128.and
	f32x4.convert_i32x4_s
	v128.and
	local.tee 116
	local.get 74
	f32x4.add
	local.set 74
	local.get 11
	local.get 14
	i32.add 
	local.tee 13
	v128.load 0:p2align=2
	local.get 98
	f32x4.mul
	local.get 79
	f32x4.add
	local.set 79
	local.get 17
	local.get 14
	i32.add 
	local.tee 18
	v128.load 0:p2align=2
	local.get 98
	f32x4.mul
	local.get 83
	f32x4.add
	local.set 83
	local.get 95
	local.get 98
	f32x4.mul
	local.get 87
	f32x4.add
	local.set 87
	local.get 91
	local.get 93
	local.get 98
	f32x4.mul
	f32x4.add
	local.set 91
	local.get 13
	i32.const 48
	i32.add 
	v128.load 0:p2align=2
	local.get 104
	f32x4.mul
	local.get 76
	f32x4.add
	local.set 76
	local.get 18
	i32.const 48
	i32.add 
	v128.load 0:p2align=2
	local.get 104
	f32x4.mul
	local.get 80
	f32x4.add
	local.set 80
	local.get 101
	local.get 104
	f32x4.mul
	local.get 84
	f32x4.add
	local.set 84
	local.get 88
	local.get 99
	local.get 104
	f32x4.mul
	f32x4.add
	local.set 88
	local.get 13
	i32.const 32
	i32.add 
	v128.load 0:p2align=2
	local.get 110
	f32x4.mul
	local.get 77
	f32x4.add
	local.set 77
	local.get 18
	i32.const 32
	i32.add 
	v128.load 0:p2align=2
	local.get 110
	f32x4.mul
	local.get 81
	f32x4.add
	local.set 81
	local.get 107
	local.get 110
	f32x4.mul
	local.get 85
	f32x4.add
	local.set 85
	local.get 89
	local.get 105
	local.get 110
	f32x4.mul
	f32x4.add
	local.set 89
	local.get 13
	i32.const 16
	i32.add 
	v128.load 0:p2align=2
	local.get 116
	f32x4.mul
	local.get 78
	f32x4.add
	local.set 78
	local.get 18
	i32.const 16
	i32.add 
	v128.load 0:p2align=2
	local.get 116
	f32x4.mul
	local.get 82
	f32x4.add
	local.set 82
	local.get 113
	local.get 116
	f32x4.mul
	local.get 86
	f32x4.add
	local.set 86
	local.get 90
	local.get 111
	local.get 116
	f32x4.mul
	f32x4.add
	local.set 90
	local.get 67
	local.get 96
	local.get 97
	local.get 9
	f32x4.lt
	local.get 2
	v128.and
	f32x4.convert_i32x4_s
	local.tee 98
	f32x4.mul
	f32x4.add
	local.set 67
	local.get 71
	local.get 94
	local.get 98
	f32x4.mul
	f32x4.add
	local.set 71
	local.get 64
	local.get 102
	local.get 103
	local.get 9
	f32x4.lt
	local.get 2
	v128.and
	f32x4.convert_i32x4_s
	local.tee 98
	f32x4.mul
	f32x4.add
	local.set 64
	local.get 68
	local.get 100
	local.get 98
	f32x4.mul
	f32x4.add
	local.set 68
	local.get 65
	local.get 108
	local.get 109
	local.get 9
	f32x4.lt
	local.get 2
	v128.and
	f32x4.convert_i32x4_s
	local.tee 98
	f32x4.mul
	f32x4.add
	local.set 65
	local.get 69
	local.get 106
	local.get 98
	f32x4.mul
	f32x4.add
	local.set 69
	local.get 66
	local.get 114
	local.get 115
	local.get 9
	f32x4.lt
	local.get 2
	v128.and
	f32x4.convert_i32x4_s
	local.tee 98
	f32x4.mul
	f32x4.add
	local.set 66
	local.get 70
	local.get 112
	local.get 98
	f32x4.mul
	f32x4.add
	local.set 70
	local.get 14
	i32.const 64
	i32.add 
	local.set 14
	local.get 15
	i32.const -1
	i32.add 
	local.tee 15
	br_if 0
	end_loop
	end_block
	local.get 54
	local.get 91
	f32x4.extract_lane 0
	local.get 91
	f32x4.extract_lane 1
	f32.add 
	local.get 91
	f32x4.extract_lane 2
	f32.add 
	local.get 91
	f32x4.extract_lane 3
	f32.add 
	local.get 90
	f32x4.extract_lane 0
	f32.add 
	local.get 90
	f32x4.extract_lane 1
	f32.add 
	local.get 90
	f32x4.extract_lane 2
	f32.add 
	local.get 90
	f32x4.extract_lane 3
	f32.add 
	local.get 89
	f32x4.extract_lane 0
	f32.add 
	local.get 89
	f32x4.extract_lane 1
	f32.add 
	local.get 89
	f32x4.extract_lane 2
	f32.add 
	local.get 89
	f32x4.extract_lane 3
	f32.add 
	local.get 88
	f32x4.extract_lane 0
	f32.add 
	local.get 88
	f32x4.extract_lane 1
	f32.add 
	local.get 88
	f32x4.extract_lane 2
	f32.add 
	local.get 88
	f32x4.extract_lane 3
	f32.add 
	f32x4.splat
	local.get 87
	f32x4.extract_lane 0
	local.get 87
	f32x4.extract_lane 1
	f32.add 
	local.get 87
	f32x4.extract_lane 2
	f32.add 
	local.get 87
	f32x4.extract_lane 3
	f32.add 
	local.get 86
	f32x4.extract_lane 0
	f32.add 
	local.get 86
	f32x4.extract_lane 1
	f32.add 
	local.get 86
	f32x4.extract_lane 2
	f32.add 
	local.get 86
	f32x4.extract_lane 3
	f32.add 
	local.get 85
	f32x4.extract_lane 0
	f32.add 
	local.get 85
	f32x4.extract_lane 1
	f32.add 
	local.get 85
	f32x4.extract_lane 2
	f32.add 
	local.get 85
	f32x4.extract_lane 3
	f32.add 
	local.get 84
	f32x4.extract_lane 0
	f32.add 
	local.get 84
	f32x4.extract_lane 1
	f32.add 
	local.get 84
	f32x4.extract_lane 2
	f32.add 
	local.get 84
	f32x4.extract_lane 3
	f32.add 
	f32x4.replace_lane 1
	local.get 83
	f32x4.extract_lane 0
	local.get 83
	f32x4.extract_lane 1
	f32.add 
	local.get 83
	f32x4.extract_lane 2
	f32.add 
	local.get 83
	f32x4.extract_lane 3
	f32.add 
	local.get 82
	f32x4.extract_lane 0
	f32.add 
	local.get 82
	f32x4.extract_lane 1
	f32.add 
	local.get 82
	f32x4.extract_lane 2
	f32.add 
	local.get 82
	f32x4.extract_lane 3
	f32.add 
	local.get 81
	f32x4.extract_lane 0
	f32.add 
	local.get 81
	f32x4.extract_lane 1
	f32.add 
	local.get 81
	f32x4.extract_lane 2
	f32.add 
	local.get 81
	f32x4.extract_lane 3
	f32.add 
	local.get 80
	f32x4.extract_lane 0
	f32.add 
	local.get 80
	f32x4.extract_lane 1
	f32.add 
	local.get 80
	f32x4.extract_lane 2
	f32.add 
	local.get 80
	f32x4.extract_lane 3
	f32.add 
	f32x4.replace_lane 2
	local.get 79
	f32x4.extract_lane 0
	local.get 79
	f32x4.extract_lane 1
	f32.add 
	local.get 79
	f32x4.extract_lane 2
	f32.add 
	local.get 79
	f32x4.extract_lane 3
	f32.add 
	local.get 78
	f32x4.extract_lane 0
	f32.add 
	local.get 78
	f32x4.extract_lane 1
	f32.add 
	local.get 78
	f32x4.extract_lane 2
	f32.add 
	local.get 78
	f32x4.extract_lane 3
	f32.add 
	local.get 77
	f32x4.extract_lane 0
	f32.add 
	local.get 77
	f32x4.extract_lane 1
	f32.add 
	local.get 77
	f32x4.extract_lane 2
	f32.add 
	local.get 77
	f32x4.extract_lane 3
	f32.add 
	local.get 76
	f32x4.extract_lane 0
	f32.add 
	local.get 76
	f32x4.extract_lane 1
	f32.add 
	local.get 76
	f32x4.extract_lane 2
	f32.add 
	local.get 76
	f32x4.extract_lane 3
	f32.add 
	f32x4.replace_lane 3
	f32x4.add
	local.set 54
	local.get 51
	local.get 67
	f32x4.extract_lane 0
	local.get 67
	f32x4.extract_lane 1
	f32.add 
	local.get 67
	f32x4.extract_lane 2
	f32.add 
	local.get 67
	f32x4.extract_lane 3
	f32.add 
	local.get 66
	f32x4.extract_lane 0
	f32.add 
	local.get 66
	f32x4.extract_lane 1
	f32.add 
	local.get 66
	f32x4.extract_lane 2
	f32.add 
	local.get 66
	f32x4.extract_lane 3
	f32.add 
	local.get 65
	f32x4.extract_lane 0
	f32.add 
	local.get 65
	f32x4.extract_lane 1
	f32.add 
	local.get 65
	f32x4.extract_lane 2
	f32.add 
	local.get 65
	f32x4.extract_lane 3
	f32.add 
	local.get 64
	f32x4.extract_lane 0
	f32.add 
	local.get 64
	f32x4.extract_lane 1
	f32.add 
	local.get 64
	f32x4.extract_lane 2
	f32.add 
	local.get 64
	f32x4.extract_lane 3
	f32.add 
	f32.add 
	local.set 51
	local.get 52
	local.get 71
	f32x4.extract_lane 0
	local.get 71
	f32x4.extract_lane 1
	f32.add 
	local.get 71
	f32x4.extract_lane 2
	f32.add 
	local.get 71
	f32x4.extract_lane 3
	f32.add 
	local.get 70
	f32x4.extract_lane 0
	f32.add 
	local.get 70
	f32x4.extract_lane 1
	f32.add 
	local.get 70
	f32x4.extract_lane 2
	f32.add 
	local.get 70
	f32x4.extract_lane 3
	f32.add 
	local.get 69
	f32x4.extract_lane 0
	f32.add 
	local.get 69
	f32x4.extract_lane 1
	f32.add 
	local.get 69
	f32x4.extract_lane 2
	f32.add 
	local.get 69
	f32x4.extract_lane 3
	f32.add 
	local.get 68
	f32x4.extract_lane 0
	f32.add 
	local.get 68
	f32x4.extract_lane 1
	f32.add 
	local.get 68
	f32x4.extract_lane 2
	f32.add 
	local.get 68
	f32x4.extract_lane 3
	f32.add 
	f32.add 
	local.set 52
	local.get 53
	local.get 75
	f32x4.extract_lane 0
	local.get 75
	f32x4.extract_lane 1
	f32.add 
	local.get 75
	f32x4.extract_lane 2
	f32.add 
	local.get 75
	f32x4.extract_lane 3
	f32.add 
	local.get 74
	f32x4.extract_lane 0
	f32.add 
	local.get 74
	f32x4.extract_lane 1
	f32.add 
	local.get 74
	f32x4.extract_lane 2
	f32.add 
	local.get 74
	f32x4.extract_lane 3
	f32.add 
	local.get 73
	f32x4.extract_lane 0
	f32.add 
	local.get 73
	f32x4.extract_lane 1
	f32.add 
	local.get 73
	f32x4.extract_lane 2
	f32.add 
	local.get 73
	f32x4.extract_lane 3
	f32.add 
	local.get 72
	f32x4.extract_lane 0
	f32.add 
	local.get 72
	f32x4.extract_lane 1
	f32.add 
	local.get 72
	f32x4.extract_lane 2
	f32.add 
	local.get 72
	f32x4.extract_lane 3
	f32.add 
	f32.add 
	local.set 53
	block 
	local.get 63
	i32.const 15
	i32.and 
	local.tee 14
	local.get 62
	local.get 60
	local.get 59
	i32.const 15
	i32.and 
	local.tee 13
	local.get 60
	local.get 13
	i32.lt_u
	i32.select
	local.tee 13
	local.get 62
	local.get 13
	i32.lt_u
	i32.select
	local.tee 13
	local.get 14
	local.get 13
	i32.lt_u
	i32.select
	local.tee 18
	i32.eqz
	br_if 0
	local.get 16
	local.get 59
	i32.const 536870896
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.set 14
	local.get 11
	local.get 63
	i32.const 536870896
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.set 13
	loop 
	block 
	block 
	local.get 38
	local.get 14
	f32.load 0
	local.tee 8
	f32.sub 
	local.tee 4
	local.get 4
	f32.mul 
	local.get 40
	local.get 19
	f32.load 0
	local.tee 117
	f32.sub 
	local.tee 7
	local.get 7
	f32.mul 
	f32.add 
	local.tee 6
	local.get 24
	f32.lt 
	br_if 0
	local.get 6
	local.get 25
	f32.lt 
	i32.eqz
	br_if 1
	local.get 6
	f32.const 0x0p0
	f32.gt 
	i32.eqz
	br_if 1
	local.get 53
	f32.const 0x1p0
	f32.add 
	local.set 53
	local.get 54
	local.get 8
	f32x4.splat
	local.get 117
	f32x4.replace_lane 1
	local.get 20
	f32.load 0
	f32x4.replace_lane 2
	local.get 13
	f32.load 0
	f32x4.replace_lane 3
	f32x4.add
	local.set 54
	br 1
	end_block
	local.get 51
	local.get 7
	f32.add 
	local.set 51
	local.get 52
	local.get 4
	f32.add 
	local.set 52
	end_block
	local.get 14
	i32.const 4
	i32.add 
	local.set 14
	local.get 19
	i32.const 4
	i32.add 
	local.set 19
	local.get 20
	i32.const 4
	i32.add 
	local.set 20
	local.get 13
	i32.const 4
	i32.add 
	local.set 13
	local.get 18
	i32.const -1
	i32.add 
	local.tee 18
	br_if 0
	end_loop
	end_block
	local.get 55
	i32.const 1
	i32.add 
	local.set 19
	local.get 55
	local.get 43
	i32.ne 
	br_if 0
	end_loop
	local.get 1
	local.get 51
	f32.store 40
	local.get 1
	local.get 52
	f32.store 36
	local.get 1
	local.get 53
	f32.store 32
	local.get 1
	local.get 54
	v128.store 16
	end_block
	local.get 1
	i32.const 48
	i32.add 
	local.get 12
	local.get 5
	local.get 3
	local.get 1
	i32.const 64
	i32.add 
	local.get 1
	local.get 1
	i32.const 16
	i32.add 
	call swarm::rules::finish
	local.get 31
	local.get 23
	i32.ge_u
	br_if 0
	local.get 30
	local.get 37
	i32.add 
	local.get 1
	f32.load 48
	f32.store 0
	local.get 29
	local.get 37
	i32.add 
	local.get 1
	f32.load 52
	f32.store 0
	local.get 28
	local.get 37
	i32.add 
	local.get 1
	f32.load 56
	f32.store 0
	local.get 27
	local.get 37
	i32.add 
	local.get 1
	f32.load 60
	f32.store 0
	end_block
	local.get 31
	i32.const 1
	i32.add 
	local.tee 31
	local.get 21
	i32.ne 
	br_if 0
	end_loop
	end_block
	local.get 1
	i32.const 80
	i32.add 
	global.set __stack_pointer
	end_function
