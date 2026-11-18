<swarm::flock::Flock>::step_grid:
	.functype	<swarm::flock::Flock>::step_grid (i32) -> ()
	.local  	i32, v128, f32, f32, f32, f32, f32, v128, v128, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, v128, v128, i32, i32, i32, i32, i32, i32, i32, i32, i32, f32, i32, i32, i32, i32, f32, f32, i32, f32, f32, f32, v128, i32, i32, i32, i32, i32, i32, f32, f32, f32, f32, f32, i32, f32, f32, f32
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
	f32x4.ge
	local.get 2
	v128.const 0x1p32, 0x1p32, 0x1p32, 0x1p32
	local.tee 9
	f32x4.lt
	v128.and
	v128.bitselect
	v128.store64_lane 136, 0
	local.get 1
	local.get 0
	i32.load 204
	i32.store 40
	local.get 1
	local.get 0
	i64.load 196:p2align=2
	i64.store 32
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
	block 
	local.get 0
	i32.load 8
	local.tee 10
	i32.eqz
	br_if 0
	local.get 0
	i32.const 160
	i32.add 
	local.set 11
	local.get 0
	i32.load 92
	local.tee 12
	local.get 0
	i32.load 80
	local.tee 13
	local.get 0
	i32.load 68
	local.tee 14
	local.get 0
	i32.load 56
	local.tee 15
	local.get 14
	local.get 15
	i32.lt_u
	i32.select
	local.tee 14
	local.get 13
	local.get 14
	i32.lt_u
	i32.select
	local.tee 13
	local.get 12
	local.get 13
	i32.lt_u
	i32.select
	local.set 16
	local.get 0
	i32.load 20
	local.tee 17
	local.get 0
	i32.load 32
	local.tee 12
	local.get 0
	i32.load 44
	local.tee 13
	local.get 12
	local.get 13
	i32.lt_u
	i32.select
	local.tee 18
	local.get 17
	local.get 18
	i32.lt_u
	i32.select
	local.set 19
	local.get 8
	local.get 0
	v128.load64_zero 136
	local.tee 2
	i8x16.shuffle 0, 1, 2, 3, 16, 17, 18, 19, 0, 1, 2, 3, 0, 1, 2, 3
	local.set 20
	local.get 2
	local.get 8
	i32x4.max_u
	local.get 8
	i32x4.sub
	local.set 21
	local.get 0
	i32.load 88
	local.set 22
	local.get 0
	i32.load 76
	local.set 23
	local.get 0
	i32.load 64
	local.set 24
	local.get 0
	i32.load 52
	local.set 25
	local.get 0
	i32.load 124
	local.set 26
	local.get 0
	i32.load 128
	local.set 27
	local.get 0
	i32.load 100
	local.set 28
	local.get 0
	i32.load 104
	local.set 29
	local.get 0
	i32.load 136
	local.set 30
	local.get 0
	f32.load 132
	local.set 31
	local.get 0
	i32.load 28
	local.set 32
	local.get 0
	i32.load 40
	local.set 33
	local.get 0
	i32.load 16
	local.set 34
	local.get 0
	i32.load 4
	local.set 35
	local.get 0
	f32.load 160
	local.tee 4
	local.get 4
	f32.mul 
	local.set 36
	local.get 0
	f32.load 164
	local.tee 4
	local.get 4
	f32.mul 
	local.set 37
	i32.const 0
	local.set 15
	loop 
	block 
	local.get 15
	local.get 19
	i32.ge_u
	br_if 0
	local.get 35
	local.get 15
	i32.const 2
	i32.shl 
	local.tee 38
	i32.add 
	f32.load 0
	local.set 7
	local.get 34
	local.get 38
	i32.add 
	f32.load 0
	local.set 39
	local.get 32
	local.get 38
	i32.add 
	f32.load 0
	local.set 4
	local.get 1
	local.get 33
	local.get 38
	i32.add 
	f32.load 0
	f32.store 12
	local.get 1
	local.get 4
	f32.store 8
	local.get 1
	local.get 39
	f32.store 4
	local.get 1
	local.get 7
	f32.store 0
	i32.const 0
	local.set 12
	local.get 1
	i32.const 0
	i32.store 72
	local.get 1
	i64.const 0
	i64.store 64
	local.get 1
	v128.const 0, 0
	v128.store 48:p2align=3
	f32.const 0x0p0
	local.set 40
	local.get 20
	local.get 21
	f32.const 0x0p0
	local.get 7
	local.get 31
	f32.mul 
	f32.floor
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
	local.tee 41
	f32x4.splat
	f32.const 0x0p0
	local.get 39
	local.get 31
	f32.mul 
	f32.floor
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
	local.tee 6
	local.get 4
	local.get 4
	i32.reinterpret_f32
	f32.select
	local.get 6
	local.get 6
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 4
	f32x4.replace_lane 1
	local.get 9
	f32x4.lt
	local.get 21
	local.get 0
	i32x4.splat
	local.get 41
	f64.promote_f32
	i32.trunc_sat_f64_u
	i32x4.replace_lane 0
	local.get 4
	f64.promote_f32
	i32.trunc_sat_f64_u
	i32x4.replace_lane 1
	i32x4.min_u
	v128.and
	local.tee 2
	local.get 8
	i32x4.add
	i32x4.min_u
	local.tee 42
	i32x4.mul
	i32x4.extract_lane 1
	local.tee 0
	local.get 2
	i32x4.extract_lane 0
	local.tee 13
	local.get 13
	i32.const 0
	i32.ne 
	i32.sub 
	local.tee 43
	i32.add 
	local.tee 13
	local.get 29
	i32.lt_u
	local.get 0
	local.get 20
	local.get 42
	i32x4.add
	i32x4.extract_lane 0
	local.tee 44
	i32.add 
	local.tee 0
	local.get 29
	i32.lt_u
	i32.and 
	local.set 45
	local.get 2
	i32x4.extract_lane 1
	local.tee 14
	local.get 14
	i32.const 0
	i32.ne 
	i32.sub 
	local.set 14
	local.get 28
	local.get 0
	i32.const 2
	i32.shl 
	i32.add 
	local.set 46
	local.get 28
	local.get 13
	i32.const 2
	i32.shl 
	i32.add 
	local.set 47
	local.get 42
	i32x4.extract_lane 1
	local.set 48
	f32.const 0x0p0
	local.set 41
	f32.const 0x0p0
	local.set 49
	f32.const 0x0p0
	local.set 50
	f32.const 0x0p0
	local.set 51
	f32.const 0x0p0
	local.set 52
	f32.const 0x0p0
	local.set 53
	i32.const 0
	local.set 13
	block 
	loop 
	block 
	block 
	block 
	local.get 12
	i32.eqz
	br_if 0
	local.get 12
	local.get 54
	i32.ne 
	br_if 1
	end_block
	i32.const 1
	local.set 0
	br 1
	end_block
	i32.const 0
	local.set 0
	end_block
	block 
	block 
	loop 
	block 
	block 
	block 
	local.get 0
	br_table {0, 1, 1}
	end_block
	local.get 12
	local.tee 0
	i32.const 4
	i32.add 
	local.set 12
	block 
	local.get 0
	i32.load 0
	local.tee 0
	local.get 15
	i32.eq 
	br_if 0
	local.get 0
	local.get 10
	i32.ge_u
	br_if 0
	local.get 0
	local.get 17
	i32.ge_u
	br_if 0
	local.get 0
	local.get 18
	i32.lt_u
	br_if 4
	end_block
	local.get 12
	local.get 54
	i32.ne 
	br_if 1
	i32.const 1
	local.set 0
	br 2
	end_block
	local.get 13
	i32.const 255
	i32.and 
	br_if 5
	local.get 14
	local.get 48
	i32.gt_u
	br_if 3
	block 
	block 
	loop 
	block 
	block 
	local.get 14
	local.get 48
	i32.ge_u
	br_if 0
	loop 
	local.get 14
	local.tee 0
	i32.const 1
	i32.add 
	local.set 14
	block 
	local.get 0
	local.get 30
	i32.mul 
	local.tee 0
	local.get 43
	i32.add 
	local.tee 12
	local.get 29
	i32.ge_u
	br_if 0
	local.get 0
	local.get 44
	i32.add 
	local.tee 0
	local.get 29
	i32.ge_u
	br_if 0
	local.get 28
	local.get 0
	i32.const 2
	i32.shl 
	i32.add 
	i32.load 0
	local.tee 0
	local.get 28
	local.get 12
	i32.const 2
	i32.shl 
	i32.add 
	i32.load 0
	local.tee 13
	i32.lt_u
	br_if 0
	local.get 0
	local.get 27
	i32.gt_u
	br_if 0
	local.get 0
	local.get 13
	i32.eq 
	br_if 0
	local.get 26
	local.get 13
	i32.const 2
	i32.shl 
	i32.add 
	local.tee 12
	local.get 0
	local.get 13
	i32.sub 
	i32.const 2
	i32.shl 
	local.tee 13
	i32.add 
	local.set 54
	loop 
	local.get 12
	local.tee 0
	i32.const 4
	i32.add 
	local.set 12
	block 
	local.get 0
	i32.load 0
	local.tee 0
	local.get 15
	i32.eq 
	br_if 0
	local.get 0
	local.get 10
	i32.ge_u
	br_if 0
	local.get 0
	local.get 17
	i32.ge_u
	br_if 0
	local.get 0
	local.get 18
	i32.lt_u
	br_if 5
	end_block
	local.get 13
	i32.const -4
	i32.add 
	local.tee 13
	br_if 0
	end_loop
	end_block
	local.get 14
	local.get 48
	i32.ne 
	br_if 0
	end_loop
	local.get 48
	local.set 14
	end_block
	local.get 1
	local.get 40
	f32.store 72
	local.get 1
	local.get 41
	f32.store 68
	local.get 1
	local.get 49
	f32.store 64
	local.get 1
	local.get 50
	f32.store 60
	local.get 1
	local.get 51
	f32.store 56
	local.get 1
	local.get 52
	f32.store 52
	local.get 1
	local.get 53
	f32.store 48
	local.get 45
	i32.eqz
	br_if 9
	local.get 46
	i32.load 0
	local.tee 0
	local.get 47
	i32.load 0
	local.tee 13
	i32.lt_u
	br_if 9
	local.get 0
	local.get 27
	i32.gt_u
	br_if 9
	local.get 0
	local.get 13
	i32.eq 
	br_if 9
	local.get 26
	local.get 13
	i32.const 2
	i32.shl 
	i32.add 
	local.tee 12
	local.get 0
	local.get 13
	i32.sub 
	i32.const 2
	i32.shl 
	local.tee 13
	i32.add 
	local.set 54
	block 
	loop 
	local.get 12
	local.tee 0
	i32.const 4
	i32.add 
	local.set 12
	block 
	local.get 0
	i32.load 0
	local.tee 0
	local.get 15
	i32.eq 
	br_if 0
	local.get 0
	local.get 10
	i32.ge_u
	br_if 0
	local.get 0
	local.get 17
	i32.ge_u
	br_if 0
	local.get 0
	local.get 18
	i32.lt_u
	br_if 2
	end_block
	local.get 13
	i32.const -4
	i32.add 
	local.tee 13
	br_if 0
	br 11
	end_loop
	end_block
	local.get 7
	local.get 35
	local.get 0
	i32.const 2
	i32.shl 
	local.tee 0
	i32.add 
	f32.load 0
	local.tee 55
	f32.sub 
	local.tee 4
	local.get 4
	f32.mul 
	local.get 39
	local.get 34
	local.get 0
	i32.add 
	f32.load 0
	local.tee 56
	f32.sub 
	local.tee 6
	local.get 6
	f32.mul 
	f32.add 
	local.tee 57
	local.get 37
	f32.lt 
	br_if 2
	local.get 57
	local.get 36
	f32.lt 
	i32.eqz
	br_if 3
	local.get 57
	f32.const 0x0p0
	f32.gt 
	i32.eqz
	br_if 3
	local.get 32
	local.get 0
	i32.add 
	f32.load 0
	local.set 4
	local.get 33
	local.get 0
	i32.add 
	f32.load 0
	local.set 6
	local.get 1
	local.get 49
	f32.const 0x1p0
	f32.add 
	local.tee 49
	f32.store 64
	local.get 1
	local.get 50
	local.get 6
	f32.add 
	local.tee 50
	f32.store 60
	local.get 1
	local.get 51
	local.get 4
	f32.add 
	local.tee 51
	f32.store 56
	local.get 1
	local.get 52
	local.get 56
	f32.add 
	local.tee 52
	f32.store 52
	local.get 1
	local.get 53
	local.get 55
	f32.add 
	local.tee 53
	f32.store 48
	br 3
	end_block
	block 
	block 
	local.get 7
	local.get 35
	local.get 0
	i32.const 2
	i32.shl 
	local.tee 0
	i32.add 
	f32.load 0
	local.tee 55
	f32.sub 
	local.tee 4
	local.get 4
	f32.mul 
	local.get 39
	local.get 34
	local.get 0
	i32.add 
	f32.load 0
	local.tee 56
	f32.sub 
	local.tee 6
	local.get 6
	f32.mul 
	f32.add 
	local.tee 57
	local.get 37
	f32.lt 
	i32.eqz
	br_if 0
	local.get 40
	local.get 6
	f32.add 
	local.set 40
	local.get 41
	local.get 4
	f32.add 
	local.set 41
	br 1
	end_block
	local.get 57
	local.get 36
	f32.lt 
	i32.eqz
	br_if 0
	local.get 57
	f32.const 0x0p0
	f32.gt 
	i32.eqz
	br_if 0
	local.get 49
	f32.const 0x1p0
	f32.add 
	local.set 49
	local.get 50
	local.get 33
	local.get 0
	i32.add 
	f32.load 0
	f32.add 
	local.set 50
	local.get 51
	local.get 32
	local.get 0
	i32.add 
	f32.load 0
	f32.add 
	local.set 51
	local.get 52
	local.get 56
	f32.add 
	local.set 52
	local.get 53
	local.get 55
	f32.add 
	local.set 53
	end_block
	block 
	local.get 12
	local.get 54
	i32.eq 
	br_if 0
	local.get 1
	local.get 40
	f32.store 72
	local.get 1
	local.get 41
	f32.store 68
	local.get 1
	local.get 49
	f32.store 64
	local.get 1
	local.get 50
	f32.store 60
	local.get 1
	local.get 51
	f32.store 56
	local.get 1
	local.get 52
	f32.store 52
	local.get 1
	local.get 53
	f32.store 48
	i32.const 0
	local.set 13
	br 4
	end_block
	local.get 14
	local.get 48
	i32.gt_u
	br_if 6
	br 0
	end_loop
	end_block
	local.get 1
	local.get 40
	local.get 6
	f32.add 
	local.tee 40
	f32.store 72
	local.get 1
	local.get 41
	local.get 4
	f32.add 
	local.tee 41
	f32.store 68
	end_block
	i32.const 1
	local.set 13
	local.get 12
	local.get 54
	i32.eq 
	br_if 5
	end_block
	i32.const 0
	local.set 0
	br 0
	end_loop
	end_block
	block 
	local.get 7
	local.get 35
	local.get 0
	i32.const 2
	i32.shl 
	local.tee 0
	i32.add 
	f32.load 0
	local.tee 55
	f32.sub 
	local.tee 4
	local.get 4
	f32.mul 
	local.get 39
	local.get 34
	local.get 0
	i32.add 
	f32.load 0
	local.tee 56
	f32.sub 
	local.tee 6
	local.get 6
	f32.mul 
	f32.add 
	local.tee 57
	local.get 37
	f32.lt 
	br_if 0
	local.get 57
	local.get 36
	f32.lt 
	i32.eqz
	br_if 2
	local.get 57
	f32.const 0x0p0
	f32.gt 
	i32.eqz
	br_if 2
	local.get 32
	local.get 0
	i32.add 
	f32.load 0
	local.set 4
	local.get 33
	local.get 0
	i32.add 
	f32.load 0
	local.set 6
	local.get 1
	local.get 49
	f32.const 0x1p0
	f32.add 
	local.tee 49
	f32.store 64
	local.get 1
	local.get 50
	local.get 6
	f32.add 
	local.tee 50
	f32.store 60
	local.get 1
	local.get 51
	local.get 4
	f32.add 
	local.tee 51
	f32.store 56
	local.get 1
	local.get 52
	local.get 56
	f32.add 
	local.tee 52
	f32.store 52
	local.get 1
	local.get 53
	local.get 55
	f32.add 
	local.tee 53
	f32.store 48
	br 2
	end_block
	local.get 1
	local.get 40
	local.get 6
	f32.add 
	local.tee 40
	f32.store 72
	local.get 1
	local.get 41
	local.get 4
	f32.add 
	local.tee 41
	f32.store 68
	br 1
	end_block
	end_loop
	local.get 1
	local.get 40
	f32.store 72
	local.get 1
	local.get 41
	f32.store 68
	local.get 1
	local.get 49
	f32.store 64
	local.get 1
	local.get 50
	f32.store 60
	local.get 1
	local.get 51
	f32.store 56
	local.get 1
	local.get 52
	f32.store 52
	local.get 1
	local.get 53
	f32.store 48
	end_block
	local.get 1
	i32.const 16
	i32.add 
	local.get 11
	local.get 5
	local.get 3
	local.get 1
	i32.const 32
	i32.add 
	local.get 1
	local.get 1
	i32.const 48
	i32.add 
	call swarm::rules::finish
	local.get 15
	local.get 16
	i32.ge_u
	br_if 0
	local.get 25
	local.get 38
	i32.add 
	local.get 1
	f32.load 16
	f32.store 0
	local.get 24
	local.get 38
	i32.add 
	local.get 1
	f32.load 20
	f32.store 0
	local.get 23
	local.get 38
	i32.add 
	local.get 1
	f32.load 24
	f32.store 0
	local.get 22
	local.get 38
	i32.add 
	local.get 1
	f32.load 28
	f32.store 0
	end_block
	local.get 15
	i32.const 1
	i32.add 
	local.tee 15
	local.get 10
	i32.ne 
	br_if 0
	end_loop
	end_block
	local.get 1
	i32.const 80
	i32.add 
	global.set __stack_pointer
	end_function
