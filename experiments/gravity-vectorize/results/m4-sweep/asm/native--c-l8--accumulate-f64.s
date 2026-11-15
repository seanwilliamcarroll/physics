<engine::force::PairwiseGravity<f64> as engine::force::Force<f64>>::accumulate:
Lfunc_begin156:
	.cfi_startproc
	.cfi_personality 155, _rust_eh_personality
	.cfi_lsda 16, Lexception46
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
	b.eq LBB156_2
	mov x0, #0
	mov x1, x20
	bl alloc::raw_vec::handle_error
LBB156_2:
	mov x22, x0
	stp x3, x20, [sp, #104]
	cbz x20, LBB156_8
	mov x23, x2
	mov x19, x1
	mov x0, x20
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB156_75
	mov x25, x0
	mov x0, x20
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB156_76
	mov x24, x0
	mov x0, x20
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB156_77
	mov x26, x0
	mov x0, x20
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB156_78
	mov x1, x19
	mov x2, x23
	b LBB156_9
LBB156_8:
	mov w26, #8
	mov w25, #8
	mov w24, #8
	mov w0, #8
LBB156_9:
	str x22, [sp, #96]
	stp x28, x25, [sp, #128]
	stp xzr, x28, [sp, #144]
	stp x24, xzr, [sp, #160]
	stp x28, x26, [sp, #176]
	stp xzr, x28, [sp, #192]
	stp x0, xzr, [sp, #208]
	ldr x8, [x1, #64]
	cmp x8, x28
	csel x23, x8, x28, lo
	str x28, [sp, #24]
	cbz x23, LBB156_24
	str x2, [sp, #88]
	mov x28, #0
	ldr x8, [x1, #8]
	ldr x9, [x1, #56]
	str x9, [sp, #120]
	add x21, x8, #8
	fmov d8, #1.00000000
	movi.2d v9, #0000000000000000
	b LBB156_12
LBB156_11:
	add x21, x21, #16
	ldr x0, [sp, #208]
	str d10, [x0, x22, lsl #3]
	add x22, x22, #1
	str x22, [sp, #216]
	mov x28, x20
	cmp x23, x20
	b.eq LBB156_21
LBB156_12:
	ldp d12, d11, [x21, #-8]
	ldp x9, x8, [sp, #120]
	ldr d10, [x9, x28, lsl #3]
	cmp x28, x8
	mov x8, x25
	b.ne LBB156_15
	add x0, sp, #128
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	ldr x8, [sp, #136]
LBB156_15:
	add x20, x28, #1
	mov x25, x8
	str d12, [x8, x28, lsl #3]
	str x20, [sp, #144]
	ldr x19, [sp, #168]
	ldr x8, [sp, #152]
	cmp x19, x8
	b.ne LBB156_17
	add x0, sp, #152
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
LBB156_17:
	ldr x24, [sp, #160]
	str d11, [x24, x19, lsl #3]
	add x19, x19, #1
	str x19, [sp, #168]
	fdiv d0, d8, d10
	fcmp d10, #0.0
	fcsel d11, d9, d0, eq
	ldr x22, [sp, #192]
	ldr x8, [sp, #176]
	cmp x22, x8
	b.ne LBB156_19
	add x0, sp, #176
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
LBB156_19:
	ldr x26, [sp, #184]
	str d11, [x26, x22, lsl #3]
	add x27, x22, #1
	str x27, [sp, #192]
	ldr x22, [sp, #216]
	ldr x8, [sp, #200]
	cmp x22, x8
	b.ne LBB156_11
	add x0, sp, #200
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	b LBB156_11
LBB156_21:
	ldr x28, [sp, #24]
	ldr x2, [sp, #88]
	lsr x8, x28, #60
	cbz x8, LBB156_25
LBB156_22:
	mov x21, #0
	ldr x28, [sp, #112]
LBB156_23:
	mov x0, x21
	mov x1, x28
	bl alloc::raw_vec::handle_error
	b LBB156_80
LBB156_24:
	mov x27, #0
	mov x19, #0
	mov x20, #0
	mov x22, #0
	lsr x8, x28, #60
	cbnz x8, LBB156_22
LBB156_25:
	ldr x8, [sp, #96]
	ldp d8, d9, [x8]
	cbz x28, LBB156_29
	mov x25, x2
	mov x23, x0
	mov w21, #8
	ldr x28, [sp, #112]
	mov x0, x28
	mov w1, #8
	bl __rustc::__rdl_alloc_zeroed
	str x0, [sp, #16]
	cbz x0, LBB156_23
	mov x0, x28
	mov w1, #8
	bl __rustc::__rdl_alloc_zeroed
	str x0, [sp, #120]
	cbz x0, LBB156_79
	mov x0, x23
	mov x2, x25
	b LBB156_30
LBB156_29:
	mov w8, #8
	str x8, [sp, #16]
	mov w8, #8
	str x8, [sp, #120]
LBB156_30:
	ldr x21, [sp, #136]
	str x0, [sp, #8]
	mov x9, x0
	ldr x0, [sp, #104]
	b LBB156_32
LBB156_31:
	sub x0, x29, #208
	mov w1, #8
	bl engine::force::tree_sum::<f64>
	ldr q1, [sp, #32]
	mov.d v1[1], v0[0]
	ldr q0, [sp, #48]
	fmul.2d v0, v1, v0[0]
	ldr q1, [x28]
	ldp x16, x15, [sp, #104]
	mov x27, x15
	mov x26, x16
	fadd.2d v0, v0, v1
	str q0, [x28]
	ldp x1, x17, [sp, #88]
	mov x19, x17
	mov x24, x1
	ldp x9, x3, [sp, #72]
	mov x0, x3
	mov x2, x23
LBB156_32:
	mov x8, x21
	mov x14, x20
	add x10, x2, #16
	sub x25, x0, #1
	cmp x0, #0
	csel x3, x3, x25, eq
	csel x23, x23, x10, eq
	add x10, x21, #8
	sub x11, x20, #1
	cmp x20, #0
	csel x20, x20, x11, eq
	csel x21, x21, x10, eq
	add x10, x24, #8
	sub x11, x19, #1
	cmp x19, #0
	csel x17, x17, x11, eq
	csel x1, x1, x10, eq
	add x12, x26, #8
	sub x13, x27, #1
	cmp x27, #0
	csel x15, x15, x13, eq
	csel x16, x16, x12, eq
	cbz x22, LBB156_64
	cbz x0, LBB156_64
	cbz x14, LBB156_64
	cbz x8, LBB156_64
	cbz x19, LBB156_64
	cbz x24, LBB156_64
	cbz x27, LBB156_64
	cbz x26, LBB156_64
	mov x28, x2
	stp x3, x1, [sp, #80]
	stp x17, x16, [sp, #96]
	str x15, [sp, #112]
	add x14, x9, #8
	sub x22, x22, #1
	ldr d0, [x8]
	ldr d1, [x24]
	ldr d2, [x26]
	ldr d3, [x9]
	str q3, [sp, #48]
	fmul d2, d8, d2
	stp d0, d1, [sp, #224]
	stp d2, d9, [sp, #240]
	stp x21, x20, [x29, #-208]
	stp x10, x11, [x29, #-192]
	stp x12, x13, [x29, #-176]
	str x14, [sp, #72]
	stp x14, x22, [x29, #-160]
	ldp x19, x27, [sp, #16]
	stp x19, x27, [x29, #-240]
	ldr x8, [sp, #120]
	stp x8, x27, [x29, #-224]
	add x0, sp, #224
	sub x1, x29, #208
	add x2, x2, #16
	sub x4, x29, #240
	mov x3, x25
	bl engine::force::pass_one::<f64>
	cmp x25, x27
	mov w8, #8
	csel x8, x8, x19, hi
	csel x9, xzr, x25, hi
	movi.2d v0, #0000000000000000
	stp q0, q0, [x29, #-176]
	stp q0, q0, [x29, #-208]
	lsl x10, x9, #3
	ands x24, x10, #0x3fffffffffffffc0
	b.eq LBB156_44
	add x10, x8, x24
	mov x11, x8
	movi.2d v1, #0000000000000000
	movi.2d v2, #0000000000000000
	movi.2d v3, #0000000000000000
LBB156_42:
	ldp q4, q5, [x11]
	fadd.2d v0, v0, v4
	fadd.2d v1, v1, v5
	ldp q4, q5, [x11, #32]
	fadd.2d v2, v2, v4
	fadd.2d v3, v3, v5
	add x11, x11, #64
	cmp x11, x10
	b.ne LBB156_42
	stp q0, q1, [x29, #-208]
	stp q2, q3, [x29, #-176]
LBB156_44:
	and x26, x9, #0x7fffffffffffff8
	and x19, x9, #0x7
	cbz x19, LBB156_52
	add x8, x8, x26, lsl #3
	ldr d0, [x8]
	ldur d1, [x29, #-208]
	fadd d0, d0, d1
	stur d0, [x29, #-208]
	cmp x19, #1
	b.eq LBB156_52
	ldr d0, [x8, #8]
	ldur d1, [x29, #-200]
	fadd d0, d0, d1
	stur d0, [x29, #-200]
	cmp x19, #2
	b.eq LBB156_52
	ldr d0, [x8, #16]
	ldur d1, [x29, #-192]
	fadd d0, d0, d1
	stur d0, [x29, #-192]
	cmp x19, #3
	b.eq LBB156_52
	ldr d0, [x8, #24]
	ldur d1, [x29, #-184]
	fadd d0, d0, d1
	stur d0, [x29, #-184]
	cmp x19, #4
	b.eq LBB156_52
	ldr d0, [x8, #32]
	ldur d1, [x29, #-176]
	fadd d0, d0, d1
	stur d0, [x29, #-176]
	cmp x19, #5
	b.eq LBB156_52
	ldr d0, [x8, #40]
	ldur d1, [x29, #-168]
	fadd d0, d0, d1
	stur d0, [x29, #-168]
	cmp x19, #6
	b.eq LBB156_52
	ldr d0, [x8, #48]
	ldur d1, [x29, #-160]
	fadd d0, d0, d1
	stur d0, [x29, #-160]
LBB156_52:
	sub x0, x29, #208
	mov w1, #8
	bl engine::force::tree_sum::<f64>
	str q0, [sp, #32]
	cmp x25, x27
	ldr x8, [sp, #120]
	mov w9, #8
	csel x8, x9, x8, hi
	movi.2d v0, #0000000000000000
	stp q0, q0, [x29, #-176]
	stp q0, q0, [x29, #-208]
	cbz x24, LBB156_56
	add x9, x8, x24
	mov x10, x8
	movi.2d v1, #0000000000000000
	movi.2d v2, #0000000000000000
	movi.2d v3, #0000000000000000
LBB156_54:
	ldp q4, q5, [x10]
	fadd.2d v0, v0, v4
	fadd.2d v1, v1, v5
	ldp q4, q5, [x10, #32]
	fadd.2d v2, v2, v4
	fadd.2d v3, v3, v5
	add x10, x10, #64
	cmp x10, x9
	b.ne LBB156_54
	stp q0, q1, [x29, #-208]
	stp q2, q3, [x29, #-176]
LBB156_56:
	cbz x19, LBB156_31
	add x8, x8, x26, lsl #3
	ldr d0, [x8]
	ldur d1, [x29, #-208]
	fadd d0, d0, d1
	stur d0, [x29, #-208]
	cmp x19, #1
	b.eq LBB156_31
	ldr d0, [x8, #8]
	ldur d1, [x29, #-200]
	fadd d0, d0, d1
	stur d0, [x29, #-200]
	cmp x19, #2
	b.eq LBB156_31
	ldr d0, [x8, #16]
	ldur d1, [x29, #-192]
	fadd d0, d0, d1
	stur d0, [x29, #-192]
	cmp x19, #3
	b.eq LBB156_31
	ldr d0, [x8, #24]
	ldur d1, [x29, #-184]
	fadd d0, d0, d1
	stur d0, [x29, #-184]
	cmp x19, #4
	b.eq LBB156_31
	ldr d0, [x8, #32]
	ldur d1, [x29, #-176]
	fadd d0, d0, d1
	stur d0, [x29, #-176]
	cmp x19, #5
	b.eq LBB156_31
	ldr d0, [x8, #40]
	ldur d1, [x29, #-168]
	fadd d0, d0, d1
	stur d0, [x29, #-168]
	cmp x19, #6
	b.eq LBB156_31
	ldr d0, [x8, #48]
	ldur d1, [x29, #-160]
	fadd d0, d0, d1
	stur d0, [x29, #-160]
	b LBB156_31
LBB156_64:
	ldr x8, [sp, #24]
	cbz x8, LBB156_66
	ldr x0, [sp, #120]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	ldr x0, [sp, #16]
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB156_66:
	ldr x8, [sp, #200]
	cbz x8, LBB156_68
	ldr x0, [sp, #8]
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB156_68:
	ldr x8, [sp, #176]
	cbz x8, LBB156_70
	ldr x0, [sp, #184]
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB156_70:
	ldr x8, [sp, #152]
	cbz x8, LBB156_72
	ldr x0, [sp, #160]
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB156_72:
	ldr x8, [sp, #128]
	cbz x8, LBB156_74
	ldr x0, [sp, #136]
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB156_74:
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
LBB156_75:
	.cfi_restore_state
	mov w0, #8
	mov x1, x20
	bl alloc::raw_vec::handle_error
LBB156_76:
	mov w0, #8
	mov x1, x20
	bl alloc::raw_vec::handle_error
	b LBB156_80
LBB156_77:
	mov w0, #8
	mov x1, x20
	bl alloc::raw_vec::handle_error
	b LBB156_80
LBB156_78:
	mov w0, #8
	mov x1, x20
	bl alloc::raw_vec::handle_error
	b LBB156_80
LBB156_79:
	mov w0, #8
	mov x1, x28
	bl alloc::raw_vec::handle_error
LBB156_80:
	brk #0x1
	mov x19, x0
	ldr x0, [sp, #16]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	b LBB156_90
	mov x19, x0
	cbz x28, LBB156_94
	mov x0, x26
	mov w1, #8
	bl __rustc::__rdl_dealloc
	b LBB156_85
	mov x19, x0
	cbz x28, LBB156_94
LBB156_85:
	mov x0, x24
	mov w1, #8
	bl __rustc::__rdl_dealloc
	mov x0, x25
	mov w1, #8
	bl __rustc::__rdl_dealloc
	mov x0, x19
	bl __Unwind_Resume
	mov x19, x0
	mov x0, x25
	cbz x28, LBB156_94
	b LBB156_99
	b LBB156_89
LBB156_89:
	mov x19, x0
LBB156_90:
	ldr x8, [sp, #200]
	cbnz x8, LBB156_95
	ldr x8, [sp, #176]
	cbnz x8, LBB156_96
LBB156_92:
	ldr x8, [sp, #152]
	cbnz x8, LBB156_97
LBB156_93:
	ldr x8, [sp, #128]
	cbnz x8, LBB156_98
LBB156_94:
	mov x0, x19
	bl __Unwind_Resume
LBB156_95:
	ldr x0, [sp, #208]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #176]
	cbz x8, LBB156_92
LBB156_96:
	ldr x0, [sp, #184]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #152]
	cbz x8, LBB156_93
LBB156_97:
	ldr x0, [sp, #160]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #128]
	cbz x8, LBB156_94
LBB156_98:
	ldr x0, [sp, #136]
LBB156_99:
	mov w1, #8
	bl __rustc::__rdl_dealloc
	mov x0, x19
	bl __Unwind_Resume
