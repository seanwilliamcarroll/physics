<engine::force::PairwiseGravity<f64> as engine::force::Force<f64>>::accumulate:
Lfunc_begin154:
	.cfi_startproc
	.cfi_personality 155, _rust_eh_personality
	.cfi_lsda 16, Lexception46
	sub sp, sp, #496
	.cfi_def_cfa_offset 496
	stp d13, d12, [sp, #352]
	stp d11, d10, [sp, #368]
	stp d9, d8, [sp, #384]
	stp x28, x27, [sp, #400]
	stp x26, x25, [sp, #416]
	stp x24, x23, [sp, #432]
	stp x22, x21, [sp, #448]
	stp x20, x19, [sp, #464]
	stp x29, x30, [sp, #480]
	add x29, sp, #480
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
	ldr x20, [x1, #16]
	lsl x27, x20, #3
	lsr x8, x20, #61
	mov x9, #-7
	movk x9, #32767, lsl #48
	cmp x27, x9
	ccmp x8, #0, #0, lo
	b.eq LBB154_2
	mov x0, #0
	mov x1, x27
	bl alloc::raw_vec::handle_error
LBB154_2:
	str x20, [sp, #24]
	str x27, [sp, #88]
	cbz x27, LBB154_8
	mov x28, x0
	mov x26, x3
	mov x24, x2
	mov x19, x1
	mov x0, x27
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB154_68
	mov x23, x0
	mov x0, x27
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB154_69
	mov x21, x0
	mov x0, x27
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB154_70
	mov x25, x0
	mov x0, x27
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB154_71
	mov x22, x0
	mov x1, x19
	mov x2, x24
	mov x3, x26
	mov x0, x28
	b LBB154_9
LBB154_8:
	mov w25, #8
	mov w23, #8
	mov w21, #8
	mov w22, #8
LBB154_9:
	str x0, [sp, #80]
	str x2, [sp, #96]
	stp x20, x23, [sp, #120]
	stp xzr, x20, [sp, #136]
	stp x21, xzr, [sp, #152]
	stp x20, x25, [sp, #168]
	stp xzr, x20, [sp, #184]
	stp x22, xzr, [sp, #200]
	ldr x8, [x1, #64]
	cmp x8, x20
	csel x27, x8, x20, lo
	cbz x27, LBB154_24
	str x3, [sp, #72]
	mov x24, #0
	ldr x8, [x1, #8]
	ldr x21, [x1, #56]
	add x26, x8, #8
	fmov d8, #1.00000000
	movi.2d v9, #0000000000000000
	b LBB154_12
LBB154_11:
	add x26, x26, #16
	ldr x22, [sp, #200]
	str d10, [x22, x24, lsl #3]
	add x25, x24, #1
	str x25, [sp, #208]
	mov x24, x19
	cmp x27, x19
	b.eq LBB154_21
LBB154_12:
	ldp d12, d11, [x26, #-8]
	ldr d10, [x21, x24, lsl #3]
	ldr x8, [sp, #120]
	cmp x24, x8
	b.ne LBB154_15
	add x0, sp, #120
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	ldr x23, [sp, #128]
LBB154_15:
	add x19, x24, #1
	str d12, [x23, x24, lsl #3]
	str x19, [sp, #136]
	ldr x20, [sp, #160]
	ldr x8, [sp, #144]
	cmp x20, x8
	b.ne LBB154_17
	add x0, sp, #144
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
LBB154_17:
	ldr x8, [sp, #152]
	str x8, [sp, #112]
	str d11, [x8, x20, lsl #3]
	add x28, x20, #1
	str x28, [sp, #160]
	fdiv d0, d8, d10
	fcmp d10, #0.0
	fcsel d11, d9, d0, eq
	ldr x20, [sp, #184]
	ldr x8, [sp, #168]
	cmp x20, x8
	b.ne LBB154_19
	add x0, sp, #168
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
LBB154_19:
	ldr x8, [sp, #176]
	str x8, [sp, #104]
	str d11, [x8, x20, lsl #3]
	add x20, x20, #1
	str x20, [sp, #184]
	ldr x24, [sp, #208]
	ldr x8, [sp, #192]
	cmp x24, x8
	b.ne LBB154_11
	add x0, sp, #192
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	b LBB154_11
LBB154_21:
	ldr x3, [sp, #72]
	ldr x9, [sp, #24]
	lsr x8, x9, #60
	ldr x24, [sp, #88]
	cbz x8, LBB154_25
LBB154_22:
	mov x23, #0
LBB154_23:
	mov x0, x23
	mov x1, x24
	bl alloc::raw_vec::handle_error
	b LBB154_73
LBB154_24:
	stp x25, x21, [sp, #104]
	mov x20, #0
	mov x28, #0
	mov x19, #0
	mov x25, #0
	ldr x9, [sp, #24]
	lsr x8, x9, #60
	ldr x24, [sp, #88]
	cbnz x8, LBB154_22
LBB154_25:
	ldr x8, [sp, #80]
	ldp d8, d9, [x8]
	cbz x9, LBB154_29
	mov x21, x3
	mov w23, #8
	mov x0, x24
	mov w1, #8
	bl __rustc::__rdl_alloc_zeroed
	str x0, [sp, #16]
	cbz x0, LBB154_23
	mov x0, x24
	mov w1, #8
	bl __rustc::__rdl_alloc_zeroed
	cbz x0, LBB154_72
	mov x3, x21
	b LBB154_30
LBB154_29:
	mov w8, #8
	str x8, [sp, #16]
	mov w0, #8
LBB154_30:
	ldr x23, [sp, #128]
	mov x11, x22
	ldp x8, x9, [sp, #104]
	str x23, [sp, #8]
	ldr x12, [sp, #96]
	b LBB154_33
LBB154_31:
	ldr x11, [sp, #88]
LBB154_32:
	fadd d2, d2, d3
	fadd d0, d0, d1
	fadd d0, d0, d2
	fadd d1, d6, d7
	fadd d2, d4, d5
	fadd d1, d2, d1
	mov.d v0[1], v1[0]
	ldr q1, [sp, #32]
	fmul.2d v0, v0, v1[0]
	ldr x9, [sp, #96]
	ldr q1, [x9]
	mov x20, x1
	mov x8, x2
	fadd.2d v0, v0, v1
	str q0, [x9]
	mov x28, x4
	mov x9, x5
	mov x3, x26
	mov x12, x21
LBB154_33:
	mov x10, x23
	mov x16, x19
	mov x17, x12
	add x12, x12, #16
	sub x27, x3, #1
	cmp x3, #0
	csel x26, x26, x27, eq
	csel x21, x21, x12, eq
	add x12, x23, #8
	sub x13, x19, #1
	cmp x19, #0
	csel x19, x19, x13, eq
	csel x23, x23, x12, eq
	add x12, x9, #8
	sub x13, x28, #1
	cmp x28, #0
	csel x4, x4, x13, eq
	csel x5, x5, x12, eq
	add x14, x8, #8
	sub x15, x20, #1
	cmp x20, #0
	csel x1, x1, x15, eq
	csel x2, x2, x14, eq
	cbz x25, LBB154_57
	cbz x3, LBB154_57
	cbz x16, LBB154_57
	cbz x10, LBB154_57
	cbz x28, LBB154_57
	cbz x9, LBB154_57
	cbz x20, LBB154_57
	cbz x8, LBB154_57
	stp x5, x4, [sp, #56]
	stp x2, x1, [sp, #72]
	add x16, x11, #8
	sub x25, x25, #1
	ldr d0, [x10]
	ldr d1, [x9]
	ldr d2, [x8]
	ldr d3, [x11]
	str q3, [sp, #32]
	fmul d2, d8, d2
	stp d0, d1, [sp, #216]
	stp d2, d9, [sp, #232]
	stp x23, x19, [x29, #-232]
	stp x12, x13, [x29, #-216]
	stp x14, x15, [x29, #-200]
	stp x16, x17, [sp, #88]
	stp x16, x25, [x29, #-184]
	ldp x28, x20, [sp, #16]
	stp x28, x20, [x29, #-168]
	mov x24, x0
	stp x0, x20, [x29, #-152]
	add x0, sp, #216
	sub x1, x29, #232
	add x2, x17, #16
	sub x4, x29, #168
	mov x3, x27
	bl engine::force::pass_one::<f64>
	mov w13, #8
	cmp x27, x20
	csel x11, x13, x28, hi
	csel x8, xzr, x27, hi
	lsl x9, x8, #3
	ands x9, x9, #0x3fffffffffffffe0
	b.eq LBB154_45
	add x10, x11, x9
	movi.2d v0, #0000000000000000
	movi.2d v1, #0000000000000000
	movi.2d v2, #0000000000000000
	mov x12, x11
	movi.2d v3, #0000000000000000
LBB154_43:
	ldp d4, d5, [x12]
	fadd d3, d3, d4
	fadd d2, d2, d5
	ldp d4, d5, [x12, #16]
	fadd d1, d1, d4
	fadd d0, d0, d5
	add x12, x12, #32
	cmp x12, x10
	b.ne LBB154_43
	and x10, x8, #0x7fffffffffffffc
	and x8, x8, #0x3
	mov x0, x24
	ldp x2, x1, [sp, #72]
	ldp x5, x4, [sp, #56]
	cbnz x8, LBB154_46
	b LBB154_49
LBB154_45:
	movi.2d v0, #0000000000000000
	movi.2d v1, #0000000000000000
	movi.2d v2, #0000000000000000
	movi.2d v3, #0000000000000000
	and x10, x8, #0x7fffffffffffffc
	and x8, x8, #0x3
	mov x0, x24
	ldp x2, x1, [sp, #72]
	ldp x5, x4, [sp, #56]
	cbz x8, LBB154_49
LBB154_46:
	add x11, x11, x10, lsl #3
	ldr d4, [x11]
	fadd d3, d4, d3
	cmp x8, #1
	b.eq LBB154_49
	ldr d4, [x11, #8]
	fadd d2, d4, d2
	cmp x8, #2
	b.eq LBB154_49
	ldr d4, [x11, #16]
	fadd d1, d4, d1
LBB154_49:
	cmp x27, x20
	csel x11, x13, x0, hi
	cbz x9, LBB154_53
	add x9, x11, x9
	movi.2d v4, #0000000000000000
	movi.2d v5, #0000000000000000
	movi.2d v6, #0000000000000000
	mov x12, x11
	movi.2d v7, #0000000000000000
LBB154_51:
	ldp d16, d17, [x12]
	fadd d7, d7, d16
	fadd d6, d6, d17
	ldp d16, d17, [x12, #16]
	fadd d5, d5, d16
	fadd d4, d4, d17
	add x12, x12, #32
	cmp x12, x9
	b.ne LBB154_51
	cbnz x8, LBB154_54
	b LBB154_31
LBB154_53:
	movi.2d v4, #0000000000000000
	movi.2d v5, #0000000000000000
	movi.2d v6, #0000000000000000
	movi.2d v7, #0000000000000000
	cbz x8, LBB154_31
LBB154_54:
	add x9, x11, x10, lsl #3
	ldr d16, [x9]
	fadd d7, d16, d7
	cmp x8, #1
	b.eq LBB154_31
	ldr d16, [x9, #8]
	fadd d6, d16, d6
	cmp x8, #2
	ldr x11, [sp, #88]
	b.eq LBB154_32
	ldr d16, [x9, #16]
	fadd d5, d16, d5
	b LBB154_32
LBB154_57:
	ldr x8, [sp, #24]
	cbz x8, LBB154_59
	mov w1, #8
	bl __rustc::__rdl_dealloc
	ldr x0, [sp, #16]
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB154_59:
	ldr x8, [sp, #192]
	ldp x20, x19, [sp, #104]
	cbz x8, LBB154_61
	mov x0, x22
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB154_61:
	ldr x8, [sp, #168]
	cbz x8, LBB154_63
	mov x0, x20
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB154_63:
	ldr x8, [sp, #144]
	cbz x8, LBB154_65
	mov x0, x19
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB154_65:
	ldr x8, [sp, #120]
	cbz x8, LBB154_67
	ldr x0, [sp, #8]
	mov w1, #8
	.cfi_def_cfa wsp, 496
	ldp x29, x30, [sp, #480]
	ldp x20, x19, [sp, #464]
	ldp x22, x21, [sp, #448]
	ldp x24, x23, [sp, #432]
	ldp x26, x25, [sp, #416]
	ldp x28, x27, [sp, #400]
	ldp d9, d8, [sp, #384]
	ldp d11, d10, [sp, #368]
	ldp d13, d12, [sp, #352]
	add sp, sp, #496
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
	b __rustc::__rdl_dealloc
LBB154_67:
	.cfi_restore_state
	.cfi_remember_state
	.cfi_def_cfa wsp, 496
	ldp x29, x30, [sp, #480]
	ldp x20, x19, [sp, #464]
	ldp x22, x21, [sp, #448]
	ldp x24, x23, [sp, #432]
	ldp x26, x25, [sp, #416]
	ldp x28, x27, [sp, #400]
	ldp d9, d8, [sp, #384]
	ldp d11, d10, [sp, #368]
	ldp d13, d12, [sp, #352]
	add sp, sp, #496
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
LBB154_68:
	.cfi_restore_state
	mov w0, #8
	mov x1, x27
	bl alloc::raw_vec::handle_error
LBB154_69:
	mov w0, #8
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB154_73
LBB154_70:
	mov w0, #8
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB154_73
LBB154_71:
	mov w0, #8
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB154_73
LBB154_72:
	mov w0, #8
	mov x1, x24
	bl alloc::raw_vec::handle_error
LBB154_73:
	brk #0x1
	mov x20, x0
	ldr x0, [sp, #16]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	b LBB154_83
	mov x20, x0
	ldr x8, [sp, #24]
	cbz x8, LBB154_87
	mov x0, x25
	mov w1, #8
	bl __rustc::__rdl_dealloc
	b LBB154_78
	mov x20, x0
	ldr x8, [sp, #24]
	cbz x8, LBB154_87
LBB154_78:
	mov x0, x21
	mov w1, #8
	bl __rustc::__rdl_dealloc
	mov x0, x23
	mov w1, #8
	bl __rustc::__rdl_dealloc
	mov x0, x20
	bl __Unwind_Resume
	mov x20, x0
	ldr x8, [sp, #24]
	cbz x8, LBB154_87
	b LBB154_92
	b LBB154_82
LBB154_82:
	mov x20, x0
LBB154_83:
	ldr x8, [sp, #192]
	cbnz x8, LBB154_88
	ldr x8, [sp, #168]
	cbnz x8, LBB154_89
LBB154_85:
	ldr x8, [sp, #144]
	cbnz x8, LBB154_90
LBB154_86:
	ldr x8, [sp, #120]
	cbnz x8, LBB154_91
LBB154_87:
	mov x0, x20
	bl __Unwind_Resume
LBB154_88:
	ldr x0, [sp, #200]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #168]
	cbz x8, LBB154_85
LBB154_89:
	ldr x0, [sp, #176]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #144]
	cbz x8, LBB154_86
LBB154_90:
	ldr x0, [sp, #152]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #120]
	cbz x8, LBB154_87
LBB154_91:
	ldr x23, [sp, #128]
LBB154_92:
	mov x0, x23
	mov w1, #8
	bl __rustc::__rdl_dealloc
	mov x0, x20
	bl __Unwind_Resume
