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
	ldr x20, [x1, #16]
	lsl x24, x20, #3
	lsr x8, x20, #61
	mov x9, #-7
	movk x9, #32767, lsl #48
	cmp x24, x9
	ccmp x8, #0, #0, lo
	b.eq LBB156_2
	mov x0, #0
	mov x1, x24
	bl alloc::raw_vec::handle_error
LBB156_2:
	mov x21, x2
	mov x25, x0
	str x3, [sp, #112]
	str x20, [sp, #24]
	cbz x24, LBB156_8
	mov x19, x1
	mov x0, x24
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB156_63
	mov x23, x0
	mov x0, x24
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB156_64
	mov x22, x0
	mov x0, x24
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB156_65
	mov x26, x0
	mov x0, x24
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB156_66
	mov x1, x19
	b LBB156_9
LBB156_8:
	mov w26, #8
	mov w23, #8
	mov w22, #8
	mov w0, #8
LBB156_9:
	str x25, [sp, #104]
	stp x20, x23, [sp, #128]
	stp xzr, x20, [sp, #144]
	stp x22, xzr, [sp, #160]
	stp x20, x26, [sp, #176]
	stp xzr, x20, [sp, #192]
	stp x0, xzr, [sp, #208]
	ldr x8, [x1, #64]
	cmp x8, x20
	csel x20, x8, x20, lo
	cbz x20, LBB156_24
	stp x24, x21, [sp, #88]
	mov x21, #0
	ldr x8, [x1, #8]
	ldr x9, [x1, #56]
	str x9, [sp, #120]
	add x24, x8, #8
	fmov d8, #1.00000000
	movi.2d v9, #0000000000000000
	b LBB156_12
LBB156_11:
	add x24, x24, #16
	ldr x0, [sp, #208]
	str d10, [x0, x21, lsl #3]
	add x28, x21, #1
	str x28, [sp, #216]
	mov x21, x27
	cmp x20, x27
	b.eq LBB156_21
LBB156_12:
	ldp d12, d11, [x24, #-8]
	ldp x9, x8, [sp, #120]
	ldr d10, [x9, x21, lsl #3]
	cmp x21, x8
	mov x8, x23
	b.ne LBB156_15
	add x0, sp, #128
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	ldr x8, [sp, #136]
LBB156_15:
	add x27, x21, #1
	mov x23, x8
	str d12, [x8, x21, lsl #3]
	str x27, [sp, #144]
	ldr x19, [sp, #168]
	ldr x8, [sp, #152]
	cmp x19, x8
	b.ne LBB156_17
	add x0, sp, #152
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
LBB156_17:
	ldr x8, [sp, #160]
	mov x25, x8
	str d11, [x8, x19, lsl #3]
	add x19, x19, #1
	str x19, [sp, #168]
	fdiv d0, d8, d10
	fcmp d10, #0.0
	fcsel d11, d9, d0, eq
	ldr x21, [sp, #192]
	ldr x8, [sp, #176]
	cmp x21, x8
	b.ne LBB156_19
	add x0, sp, #176
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
LBB156_19:
	ldr x26, [sp, #184]
	str d11, [x26, x21, lsl #3]
	add x22, x21, #1
	str x22, [sp, #192]
	ldr x21, [sp, #216]
	ldr x8, [sp, #200]
	cmp x21, x8
	b.ne LBB156_11
	add x0, sp, #200
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	b LBB156_11
LBB156_21:
	ldp x24, x21, [sp, #88]
	ldr x9, [sp, #24]
	lsr x8, x9, #60
	cbz x8, LBB156_25
LBB156_22:
	mov x25, #0
LBB156_23:
	mov x0, x25
	mov x1, x24
	bl alloc::raw_vec::handle_error
	b LBB156_68
LBB156_24:
	mov x25, x22
	mov x22, #0
	mov x19, #0
	mov x27, #0
	mov x28, #0
	ldr x9, [sp, #24]
	lsr x8, x9, #60
	cbnz x8, LBB156_22
LBB156_25:
	mov x23, x25
	ldr x8, [sp, #104]
	ldp d8, d9, [x8]
	cbz x9, LBB156_29
	mov x20, x0
	mov w25, #8
	mov x0, x24
	mov w1, #8
	bl __rustc::__rdl_alloc_zeroed
	str x0, [sp, #16]
	cbz x0, LBB156_23
	mov x0, x24
	mov w1, #8
	bl __rustc::__rdl_alloc_zeroed
	str x0, [sp, #120]
	cbz x0, LBB156_67
	mov x0, x20
	b LBB156_30
LBB156_29:
	mov w8, #8
	str x8, [sp, #16]
	mov w8, #8
	str x8, [sp, #120]
LBB156_30:
	ldr x8, [sp, #136]
	str x0, [sp, #8]
	mov x9, x0
	ldr x14, [sp, #112]
	b LBB156_32
LBB156_31:
	sub x0, x29, #240
	mov w1, #2
	bl engine::force::tree_sum::<f64>
	ldr q1, [sp, #32]
	mov.d v1[1], v0[0]
	ldr q0, [sp, #48]
	fmul.2d v0, v1, v0[0]
	ldr q1, [x27]
	mov x9, x19
	ldp x16, x15, [sp, #104]
	mov x22, x15
	mov x26, x16
	ldp x1, x17, [sp, #88]
	mov x19, x17
	mov x23, x1
	fadd.2d v0, v0, v1
	str q0, [x27]
	mov x27, x25
	mov x8, x20
	ldp x3, x2, [sp, #72]
	mov x14, x2
	mov x21, x3
LBB156_32:
	add x10, x21, #16
	sub x24, x14, #1
	cmp x14, #0
	csel x2, x2, x24, eq
	csel x3, x3, x10, eq
	add x10, x8, #8
	sub x11, x27, #1
	cmp x27, #0
	csel x25, x25, x11, eq
	csel x20, x20, x10, eq
	add x10, x23, #8
	sub x11, x19, #1
	cmp x19, #0
	csel x17, x17, x11, eq
	csel x1, x1, x10, eq
	add x12, x26, #8
	sub x13, x22, #1
	cmp x22, #0
	csel x15, x15, x13, eq
	csel x16, x16, x12, eq
	cbz x28, LBB156_52
	cbz x14, LBB156_52
	cbz x27, LBB156_52
	cbz x8, LBB156_52
	cbz x19, LBB156_52
	cbz x23, LBB156_52
	cbz x22, LBB156_52
	cbz x26, LBB156_52
	stp x3, x2, [sp, #72]
	stp x1, x17, [sp, #88]
	stp x16, x15, [sp, #104]
	add x19, x9, #8
	sub x28, x28, #1
	ldr d0, [x8]
	ldr d1, [x23]
	ldr d2, [x26]
	ldr d3, [x9]
	str q3, [sp, #48]
	fmul d2, d8, d2
	stp d0, d1, [sp, #224]
	stp d2, d9, [sp, #240]
	stp x20, x25, [x29, #-240]
	stp x10, x11, [x29, #-224]
	stp x12, x13, [x29, #-208]
	stp x19, x28, [x29, #-192]
	ldp x22, x26, [sp, #16]
	stp x22, x26, [x29, #-168]
	ldr x8, [sp, #120]
	stp x8, x26, [x29, #-152]
	add x0, sp, #224
	sub x1, x29, #240
	mov x27, x21
	add x2, x21, #16
	sub x4, x29, #168
	mov x3, x24
	bl engine::force::pass_one::<f64>
	cmp x24, x26
	mov w8, #8
	csel x8, x8, x22, hi
	csel x21, xzr, x24, hi
	stp xzr, xzr, [x29, #-240]
	lsl x9, x21, #3
	ands x22, x9, #0x3ffffffffffffff0
	b.eq LBB156_49
	movi.2d v0, #0000000000000000
	mov x9, x22
	mov x10, x8
LBB156_42:
	ldr q1, [x10], #16
	fadd.2d v0, v0, v1
	subs x9, x9, #16
	b.ne LBB156_42
	stur q0, [x29, #-240]
	and x23, x21, #0x7fffffffffffffe
	tbz w21, #0, LBB156_45
LBB156_44:
	ldr d1, [x8, x23, lsl #3]
	fadd d0, d0, d1
	stur d0, [x29, #-240]
LBB156_45:
	sub x0, x29, #240
	mov w1, #2
	bl engine::force::tree_sum::<f64>
	str q0, [sp, #32]
	cmp x24, x26
	ldr x8, [sp, #120]
	mov w9, #8
	csel x8, x9, x8, hi
	stp xzr, xzr, [x29, #-240]
	cbz x22, LBB156_50
	movi.2d v0, #0000000000000000
	mov x9, x8
LBB156_47:
	ldr q1, [x9], #16
	fadd.2d v0, v0, v1
	subs x22, x22, #16
	b.ne LBB156_47
	stur q0, [x29, #-240]
	tbz w21, #0, LBB156_31
	b LBB156_51
LBB156_49:
	movi.2d v0, #0000000000000000
	and x23, x21, #0x7fffffffffffffe
	tbnz w21, #0, LBB156_44
	b LBB156_45
LBB156_50:
	movi.2d v0, #0000000000000000
	tbz w21, #0, LBB156_31
LBB156_51:
	ldr d1, [x8, x23, lsl #3]
	fadd d0, d0, d1
	stur d0, [x29, #-240]
	b LBB156_31
LBB156_52:
	ldr x8, [sp, #24]
	cbz x8, LBB156_54
	ldr x0, [sp, #120]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	ldr x0, [sp, #16]
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB156_54:
	ldr x8, [sp, #200]
	cbz x8, LBB156_56
	ldr x0, [sp, #8]
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB156_56:
	ldr x8, [sp, #176]
	cbz x8, LBB156_58
	ldr x0, [sp, #184]
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB156_58:
	ldr x8, [sp, #152]
	cbz x8, LBB156_60
	ldr x0, [sp, #160]
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB156_60:
	ldr x8, [sp, #128]
	cbz x8, LBB156_62
	ldr x0, [sp, #136]
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB156_62:
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
LBB156_63:
	.cfi_restore_state
	mov w0, #8
	mov x1, x24
	bl alloc::raw_vec::handle_error
LBB156_64:
	mov w0, #8
	mov x1, x24
	bl alloc::raw_vec::handle_error
	b LBB156_68
LBB156_65:
	mov w0, #8
	mov x1, x24
	bl alloc::raw_vec::handle_error
	b LBB156_68
LBB156_66:
	mov w0, #8
	mov x1, x24
	bl alloc::raw_vec::handle_error
	b LBB156_68
LBB156_67:
	mov w0, #8
	mov x1, x24
	bl alloc::raw_vec::handle_error
LBB156_68:
	brk #0x1
	mov x19, x0
	ldr x0, [sp, #16]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	b LBB156_78
	mov x19, x0
	ldr x8, [sp, #24]
	cbz x8, LBB156_82
	mov x0, x26
	mov w1, #8
	bl __rustc::__rdl_dealloc
	b LBB156_73
	mov x19, x0
	ldr x8, [sp, #24]
	cbz x8, LBB156_82
LBB156_73:
	mov x0, x22
	mov w1, #8
	bl __rustc::__rdl_dealloc
	mov x0, x23
	mov w1, #8
	bl __rustc::__rdl_dealloc
	mov x0, x19
	bl __Unwind_Resume
	mov x19, x0
	ldr x8, [sp, #24]
	mov x0, x23
	cbz x8, LBB156_82
	b LBB156_87
	b LBB156_77
LBB156_77:
	mov x19, x0
LBB156_78:
	ldr x8, [sp, #200]
	cbnz x8, LBB156_83
	ldr x8, [sp, #176]
	cbnz x8, LBB156_84
LBB156_80:
	ldr x8, [sp, #152]
	cbnz x8, LBB156_85
LBB156_81:
	ldr x8, [sp, #128]
	cbnz x8, LBB156_86
LBB156_82:
	mov x0, x19
	bl __Unwind_Resume
LBB156_83:
	ldr x0, [sp, #208]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #176]
	cbz x8, LBB156_80
LBB156_84:
	ldr x0, [sp, #184]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #152]
	cbz x8, LBB156_81
LBB156_85:
	ldr x0, [sp, #160]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #128]
	cbz x8, LBB156_82
LBB156_86:
	ldr x0, [sp, #136]
LBB156_87:
	mov w1, #8
	bl __rustc::__rdl_dealloc
	mov x0, x19
	bl __Unwind_Resume
