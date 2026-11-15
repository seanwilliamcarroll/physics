<engine::force::PairwiseGravity<f64> as engine::force::Force<f64>>::accumulate:
Lfunc_begin151:
	.cfi_startproc
	.cfi_personality 155, _rust_eh_personality
	.cfi_lsda 16, Lexception49
	stp d13, d12, [sp, #-144]!
	.cfi_def_cfa_offset 144
	stp d11, d10, [sp, #16]
	stp d9, d8, [sp, #32]
	stp x28, x27, [sp, #48]
	stp x26, x25, [sp, #64]
	stp x24, x23, [sp, #80]
	stp x22, x21, [sp, #96]
	stp x20, x19, [sp, #112]
	stp x29, x30, [sp, #128]
	add x29, sp, #128
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	.cfi_offset b10, -120
	.cfi_offset b11, -128
	.cfi_offset b12, -136
	.cfi_offset b13, -144
	.cfi_remember_state
	sub sp, sp, #368
	ldr x28, [x1, #16]
	lsl x20, x28, #3
	lsr x8, x28, #61
	mov x9, #-7
	movk x9, #32767, lsl #48
	cmp x20, x9
	ccmp x8, #0, #0, lo
	b.eq LBB151_2
	bl alloc::raw_vec::capacity_overflow
LBB151_2:
	stp x3, x0, [sp, #96]
	str x20, [sp, #112]
	cbz x20, LBB151_8
	mov x24, x2
	mov x19, x1
	mov x0, x20
	bl _malloc
	cbz x0, LBB151_67
	mov x25, x0
	mov x0, x20
	bl _malloc
	cbz x0, LBB151_68
	mov x23, x0
	mov x0, x20
	bl _malloc
	cbz x0, LBB151_69
	mov x26, x0
	mov x0, x20
	bl _malloc
	cbz x0, LBB151_70
	mov x1, x19
	mov x2, x24
	b LBB151_9
LBB151_8:
	mov w26, #8
	mov w25, #8
	mov w23, #8
	mov w0, #8
LBB151_9:
	stp x28, x25, [sp, #128]
	stp xzr, x28, [sp, #144]
	stp x23, xzr, [sp, #160]
	stp x28, x26, [sp, #176]
	stp xzr, x28, [sp, #192]
	stp x0, xzr, [sp, #208]
	ldr x8, [x1, #64]
	cmp x8, x28
	csel x22, x8, x28, lo
	str x28, [sp, #24]
	cbz x22, LBB151_24
	str x2, [sp, #88]
	mov x28, #0
	ldr x8, [x1, #8]
	ldr x9, [x1, #56]
	str x9, [sp, #120]
	add x21, x8, #8
	fmov d8, #1.00000000
	movi.2d v9, #0000000000000000
	b LBB151_12
LBB151_11:
	add x21, x21, #16
	ldr x0, [sp, #208]
	str d10, [x0, x24, lsl #3]
	add x24, x24, #1
	str x24, [sp, #216]
	mov x28, x20
	cmp x22, x20
	b.eq LBB151_21
LBB151_12:
	ldp d12, d11, [x21, #-8]
	ldp x9, x8, [sp, #120]
	ldr d10, [x9, x28, lsl #3]
	cmp x28, x8
	mov x8, x25
	b.ne LBB151_15
	add x0, sp, #128
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	ldr x8, [sp, #136]
LBB151_15:
	add x20, x28, #1
	mov x25, x8
	str d12, [x8, x28, lsl #3]
	str x20, [sp, #144]
	ldr x19, [sp, #168]
	ldr x8, [sp, #152]
	cmp x19, x8
	b.ne LBB151_17
	add x0, sp, #152
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
LBB151_17:
	ldr x23, [sp, #160]
	str d11, [x23, x19, lsl #3]
	add x27, x19, #1
	str x27, [sp, #168]
	fdiv d0, d8, d10
	fcmp d10, #0.0
	fcsel d11, d9, d0, eq
	ldr x19, [sp, #192]
	ldr x8, [sp, #176]
	cmp x19, x8
	b.ne LBB151_19
	add x0, sp, #176
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
LBB151_19:
	ldr x26, [sp, #184]
	str d11, [x26, x19, lsl #3]
	add x19, x19, #1
	str x19, [sp, #192]
	ldr x24, [sp, #216]
	ldr x8, [sp, #200]
	cmp x24, x8
	b.ne LBB151_11
	add x0, sp, #200
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	b LBB151_11
LBB151_21:
	ldr x28, [sp, #24]
	ldr x2, [sp, #88]
	lsr x8, x28, #60
	ldr x22, [sp, #112]
	cbz x8, LBB151_25
LBB151_22:
	mov x0, #0
LBB151_23:
	mov x1, x22
	bl alloc::raw_vec::handle_error
	b LBB151_73
LBB151_24:
	mov x19, #0
	mov x27, #0
	mov x20, #0
	mov x24, #0
	lsr x8, x28, #60
	ldr x22, [sp, #112]
	cbnz x8, LBB151_22
LBB151_25:
	ldr x8, [sp, #104]
	ldp d8, d9, [x8]
	cbz x28, LBB151_29
	mov x25, x2
	mov x21, x0
	mov x0, x22
	mov w1, #1
	bl _calloc
	str x0, [sp, #16]
	cbz x0, LBB151_71
	mov x0, x22
	mov w1, #1
	bl _calloc
	str x0, [sp, #120]
	cbz x0, LBB151_72
	mov x0, x21
	mov x2, x25
	b LBB151_30
LBB151_29:
	mov w8, #8
	str x8, [sp, #16]
	mov w8, #8
	str x8, [sp, #120]
LBB151_30:
	ldr x21, [sp, #136]
	str x0, [sp, #8]
	mov x9, x0
	ldr x15, [sp, #96]
	b LBB151_32
LBB151_31:
	sub x0, x29, #240
	mov w1, #4
	bl engine::force::tree_sum::<f64>
	ldr q1, [sp, #32]
	mov.d v1[1], v0[0]
	ldr q0, [sp, #48]
	fmul.2d v0, v1, v0[0]
	ldr q1, [x28]
	ldp x17, x16, [sp, #104]
	mov x19, x16
	mov x26, x17
	fadd.2d v0, v0, v1
	str q0, [x28]
	ldp x4, x1, [sp, #88]
	mov x27, x1
	mov x23, x4
	ldp x9, x3, [sp, #72]
	mov x15, x3
	mov x2, x22
LBB151_32:
	mov x8, x21
	mov x14, x20
	add x10, x2, #16
	sub x25, x15, #1
	cmp x15, #0
	csel x3, x3, x25, eq
	csel x22, x22, x10, eq
	add x10, x21, #8
	sub x11, x20, #1
	cmp x20, #0
	csel x20, x20, x11, eq
	csel x21, x21, x10, eq
	add x10, x23, #8
	sub x11, x27, #1
	cmp x27, #0
	csel x1, x1, x11, eq
	csel x4, x4, x10, eq
	add x12, x26, #8
	sub x13, x19, #1
	cmp x19, #0
	csel x16, x16, x13, eq
	csel x17, x17, x12, eq
	cbz x24, LBB151_56
	cbz x15, LBB151_56
	cbz x14, LBB151_56
	cbz x8, LBB151_56
	cbz x27, LBB151_56
	cbz x23, LBB151_56
	cbz x19, LBB151_56
	cbz x26, LBB151_56
	mov x28, x2
	stp x3, x4, [sp, #80]
	stp x1, x17, [sp, #96]
	str x16, [sp, #112]
	add x14, x9, #8
	sub x24, x24, #1
	ldr d0, [x8]
	ldr d1, [x23]
	ldr d2, [x26]
	ldr d3, [x9]
	str q3, [sp, #48]
	fmul d2, d8, d2
	stp d0, d1, [sp, #224]
	stp d2, d9, [sp, #240]
	stp x21, x20, [x29, #-240]
	stp x10, x11, [x29, #-224]
	stp x12, x13, [x29, #-208]
	str x14, [sp, #72]
	stp x14, x24, [x29, #-192]
	ldp x19, x27, [sp, #16]
	stp x19, x27, [x29, #-168]
	ldr x8, [sp, #120]
	stp x8, x27, [x29, #-152]
	add x0, sp, #224
	sub x1, x29, #240
	add x2, x2, #16
	sub x4, x29, #168
	mov x3, x25
	bl engine::force::pass_one::<f64>
	cmp x25, x27
	mov w8, #8
	csel x8, x8, x19, hi
	csel x9, xzr, x25, hi
	movi.2d v0, #0000000000000000
	stp q0, q0, [x29, #-240]
	lsl x10, x9, #3
	ands x23, x10, #0x3fffffffffffffe0
	b.eq LBB151_44
	add x10, x8, x23
	mov x11, x8
	movi.2d v1, #0000000000000000
LBB151_42:
	ldp q2, q3, [x11], #32
	fadd.2d v0, v0, v2
	fadd.2d v1, v1, v3
	cmp x11, x10
	b.ne LBB151_42
	stp q0, q1, [x29, #-240]
LBB151_44:
	and x26, x9, #0x7fffffffffffffc
	and x19, x9, #0x3
	cbz x19, LBB151_48
	add x8, x8, x26, lsl #3
	ldr d0, [x8]
	ldur d1, [x29, #-240]
	fadd d0, d0, d1
	stur d0, [x29, #-240]
	cmp x19, #1
	b.eq LBB151_48
	ldr d0, [x8, #8]
	ldur d1, [x29, #-232]
	fadd d0, d0, d1
	stur d0, [x29, #-232]
	cmp x19, #2
	b.eq LBB151_48
	ldr d0, [x8, #16]
	ldur d1, [x29, #-224]
	fadd d0, d0, d1
	stur d0, [x29, #-224]
LBB151_48:
	sub x0, x29, #240
	mov w1, #4
	bl engine::force::tree_sum::<f64>
	str q0, [sp, #32]
	cmp x25, x27
	ldr x8, [sp, #120]
	mov w9, #8
	csel x8, x9, x8, hi
	movi.2d v0, #0000000000000000
	stp q0, q0, [x29, #-240]
	cbz x23, LBB151_52
	add x9, x8, x23
	mov x10, x8
	movi.2d v1, #0000000000000000
LBB151_50:
	ldp q2, q3, [x10], #32
	fadd.2d v0, v0, v2
	fadd.2d v1, v1, v3
	cmp x10, x9
	b.ne LBB151_50
	stp q0, q1, [x29, #-240]
LBB151_52:
	cbz x19, LBB151_31
	add x8, x8, x26, lsl #3
	ldr d0, [x8]
	ldur d1, [x29, #-240]
	fadd d0, d0, d1
	stur d0, [x29, #-240]
	cmp x19, #1
	b.eq LBB151_31
	ldr d0, [x8, #8]
	ldur d1, [x29, #-232]
	fadd d0, d0, d1
	stur d0, [x29, #-232]
	cmp x19, #2
	b.eq LBB151_31
	ldr d0, [x8, #16]
	ldur d1, [x29, #-224]
	fadd d0, d0, d1
	stur d0, [x29, #-224]
	b LBB151_31
LBB151_56:
	ldr x8, [sp, #24]
	cbz x8, LBB151_58
	ldr x0, [sp, #120]
	bl _free
	ldr x0, [sp, #16]
	bl _free
LBB151_58:
	ldr x8, [sp, #200]
	cbz x8, LBB151_60
	ldr x0, [sp, #8]
	bl _free
LBB151_60:
	ldr x8, [sp, #176]
	cbz x8, LBB151_62
	ldr x0, [sp, #184]
	bl _free
LBB151_62:
	ldr x8, [sp, #152]
	cbz x8, LBB151_64
	ldr x0, [sp, #160]
	bl _free
LBB151_64:
	ldr x8, [sp, #128]
	cbz x8, LBB151_66
	ldr x0, [sp, #136]
	bl _free
LBB151_66:
	add sp, sp, #368
	.cfi_def_cfa wsp, 144
	ldp x29, x30, [sp, #128]
	ldp x20, x19, [sp, #112]
	ldp x22, x21, [sp, #96]
	ldp x24, x23, [sp, #80]
	ldp x26, x25, [sp, #64]
	ldp x28, x27, [sp, #48]
	ldp d9, d8, [sp, #32]
	ldp d11, d10, [sp, #16]
	ldp d13, d12, [sp], #144
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	.cfi_restore w23
	.cfi_restore w24
	.cfi_restore w25
	.cfi_restore w26
	.cfi_restore w27
	.cfi_restore w28
	.cfi_restore b8
	.cfi_restore b9
	.cfi_restore b10
	.cfi_restore b11
	.cfi_restore b12
	.cfi_restore b13
	ret
LBB151_67:
	.cfi_restore_state
	mov w0, #8
	mov x1, x20
	bl alloc::raw_vec::handle_error
LBB151_68:
	mov w0, #8
	mov x1, x20
	bl alloc::raw_vec::handle_error
	b LBB151_73
LBB151_69:
	mov w0, #8
	mov x1, x20
	bl alloc::raw_vec::handle_error
	b LBB151_73
LBB151_70:
	mov w0, #8
	mov x1, x20
	bl alloc::raw_vec::handle_error
	b LBB151_73
LBB151_71:
	mov w0, #8
	b LBB151_23
LBB151_72:
	mov w0, #8
	mov x1, x22
	bl alloc::raw_vec::handle_error
LBB151_73:
	brk #0x1
	mov x19, x0
	ldr x0, [sp, #16]
	bl _free
	b LBB151_83
	mov x19, x0
	cbz x28, LBB151_87
	mov x0, x26
	bl _free
	b LBB151_78
	mov x19, x0
	cbz x28, LBB151_87
LBB151_78:
	mov x0, x23
	bl _free
	mov x0, x25
	bl _free
	mov x0, x19
	bl __Unwind_Resume
	mov x19, x0
	mov x0, x25
	cbz x28, LBB151_87
	b LBB151_92
	b LBB151_82
LBB151_82:
	mov x19, x0
LBB151_83:
	ldr x8, [sp, #200]
	cbnz x8, LBB151_88
	ldr x8, [sp, #176]
	cbnz x8, LBB151_89
LBB151_85:
	ldr x8, [sp, #152]
	cbnz x8, LBB151_90
LBB151_86:
	ldr x8, [sp, #128]
	cbnz x8, LBB151_91
LBB151_87:
	mov x0, x19
	bl __Unwind_Resume
LBB151_88:
	ldr x0, [sp, #208]
	bl _free
	ldr x8, [sp, #176]
	cbz x8, LBB151_85
LBB151_89:
	ldr x0, [sp, #184]
	bl _free
	ldr x8, [sp, #152]
	cbz x8, LBB151_86
LBB151_90:
	ldr x0, [sp, #160]
	bl _free
	ldr x8, [sp, #128]
	cbz x8, LBB151_87
LBB151_91:
	ldr x0, [sp, #136]
LBB151_92:
	bl _free
	mov x0, x19
	bl __Unwind_Resume
