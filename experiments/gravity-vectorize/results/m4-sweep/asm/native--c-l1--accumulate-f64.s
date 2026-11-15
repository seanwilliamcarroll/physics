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
	ldr x19, [x1, #16]
	lsl x27, x19, #3
	lsr x8, x19, #61
	mov x9, #-7
	movk x9, #32767, lsl #48
	cmp x27, x9
	ccmp x8, #0, #0, lo
	b.eq LBB154_2
	mov x0, #0
	mov x1, x27
	bl alloc::raw_vec::handle_error
LBB154_2:
	mov x28, x0
	str x3, [sp, #88]
	str x2, [sp, #112]
	str x19, [sp, #32]
	cbz x27, LBB154_8
	mov x20, x1
	mov x0, x27
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB154_58
	mov x26, x0
	mov x0, x27
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB154_59
	mov x22, x0
	mov x0, x27
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB154_60
	mov x23, x0
	mov x0, x27
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB154_61
	mov x1, x20
	b LBB154_9
LBB154_8:
	mov w23, #8
	mov w26, #8
	mov w22, #8
	mov w0, #8
LBB154_9:
	stp x19, x26, [sp, #120]
	stp xzr, x19, [sp, #136]
	stp x22, xzr, [sp, #152]
	stp x19, x23, [sp, #168]
	stp xzr, x19, [sp, #184]
	stp x0, xzr, [sp, #200]
	ldr x8, [x1, #64]
	cmp x8, x19
	csel x21, x8, x19, lo
	cbz x21, LBB154_24
	str x28, [sp, #80]
	mov x28, #0
	ldr x8, [x1, #8]
	ldr x22, [x1, #56]
	add x23, x8, #8
	fmov d8, #1.00000000
	movi.2d v9, #0000000000000000
	b LBB154_12
LBB154_11:
	add x23, x23, #16
	ldr x0, [sp, #200]
	str d10, [x0, x24, lsl #3]
	add x24, x24, #1
	str x24, [sp, #208]
	mov x28, x19
	cmp x21, x19
	b.eq LBB154_21
LBB154_12:
	ldp d12, d11, [x23, #-8]
	ldr d10, [x22, x28, lsl #3]
	ldr x8, [sp, #120]
	cmp x28, x8
	b.ne LBB154_15
	add x0, sp, #120
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	ldr x26, [sp, #128]
LBB154_15:
	add x19, x28, #1
	str d12, [x26, x28, lsl #3]
	str x19, [sp, #136]
	ldr x20, [sp, #160]
	ldr x8, [sp, #144]
	cmp x20, x8
	b.ne LBB154_17
	add x0, sp, #144
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
LBB154_17:
	ldr x8, [sp, #152]
	str x8, [sp, #104]
	str d11, [x8, x20, lsl #3]
	add x20, x20, #1
	str x20, [sp, #160]
	fdiv d0, d8, d10
	fcmp d10, #0.0
	fcsel d11, d9, d0, eq
	ldr x24, [sp, #184]
	ldr x8, [sp, #168]
	cmp x24, x8
	b.ne LBB154_19
	add x0, sp, #168
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
LBB154_19:
	ldr x8, [sp, #176]
	str x8, [sp, #96]
	str d11, [x8, x24, lsl #3]
	add x25, x24, #1
	str x25, [sp, #184]
	ldr x24, [sp, #208]
	ldr x8, [sp, #192]
	cmp x24, x8
	b.ne LBB154_11
	add x0, sp, #192
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	b LBB154_11
LBB154_21:
	ldr x28, [sp, #80]
	ldr x9, [sp, #32]
	lsr x8, x9, #60
	cbz x8, LBB154_25
LBB154_22:
	mov x26, #0
LBB154_23:
	mov x0, x26
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB154_63
LBB154_24:
	stp x23, x22, [sp, #96]
	mov x25, #0
	mov x20, #0
	mov x19, #0
	mov x24, #0
	ldr x9, [sp, #32]
	lsr x8, x9, #60
	cbnz x8, LBB154_22
LBB154_25:
	ldp d8, d9, [x28]
	cbz x9, LBB154_29
	mov x21, x0
	mov w26, #8
	mov x0, x27
	mov w1, #8
	bl __rustc::__rdl_alloc_zeroed
	str x0, [sp, #24]
	cbz x0, LBB154_23
	mov x0, x27
	mov w1, #8
	bl __rustc::__rdl_alloc_zeroed
	str x0, [sp, #40]
	cbz x0, LBB154_62
	mov x0, x21
	b LBB154_30
LBB154_29:
	mov w8, #8
	str x8, [sp, #24]
	mov w8, #8
	str x8, [sp, #40]
LBB154_30:
	ldr x11, [sp, #128]
	stp x11, x0, [sp, #8]
	mov x8, x0
	ldp x9, x10, [sp, #96]
	ldr x12, [sp, #112]
	ldr x16, [sp, #88]
	b LBB154_33
LBB154_31:
	movi.2d v0, #0000000000000000
	movi.2d v1, #0000000000000000
	ldr x11, [sp, #112]
	ldp x1, x17, [sp, #80]
	ldr x2, [sp, #72]
LBB154_32:
	mov.d v0[1], v1[0]
	ldr q1, [sp, #48]
	fmul.2d v0, v0, v1[0]
	ldr q1, [x11]
	mov x8, x20
	mov x25, x17
	mov x9, x1
	mov x20, x2
	mov x10, x28
	fadd.2d v0, v0, v1
	str q0, [x11]
	mov x19, x23
	mov x11, x21
	mov x16, x22
	mov x12, x26
LBB154_33:
	str x12, [sp, #112]
	add x12, x12, #16
	sub x27, x16, #1
	cmp x16, #0
	csel x22, x22, x27, eq
	csel x26, x26, x12, eq
	add x12, x11, #8
	sub x13, x19, #1
	cmp x19, #0
	csel x23, x23, x13, eq
	csel x21, x21, x12, eq
	add x12, x10, #8
	sub x13, x20, #1
	cmp x20, #0
	csel x2, x2, x13, eq
	csel x28, x28, x12, eq
	add x14, x9, #8
	sub x15, x25, #1
	cmp x25, #0
	csel x17, x17, x15, eq
	csel x1, x1, x14, eq
	cbz x24, LBB154_47
	cbz x16, LBB154_47
	cbz x19, LBB154_47
	cbz x11, LBB154_47
	cbz x20, LBB154_47
	cbz x10, LBB154_47
	cbz x25, LBB154_47
	cbz x9, LBB154_47
	stp x2, x1, [sp, #72]
	str x17, [sp, #88]
	add x20, x8, #8
	sub x24, x24, #1
	ldr d0, [x11]
	ldr d1, [x10]
	ldr d2, [x9]
	ldr d3, [x8]
	str q3, [sp, #48]
	fmul d2, d8, d2
	stp d0, d1, [sp, #216]
	stp d2, d9, [sp, #232]
	stp x21, x23, [x29, #-232]
	stp x12, x13, [x29, #-216]
	stp x14, x15, [x29, #-200]
	stp x20, x24, [x29, #-184]
	ldp x25, x19, [sp, #24]
	stp x25, x19, [x29, #-168]
	ldr x8, [sp, #40]
	stp x8, x19, [x29, #-152]
	add x0, sp, #216
	sub x1, x29, #232
	ldr x8, [sp, #112]
	add x2, x8, #16
	sub x4, x29, #168
	mov x3, x27
	bl engine::force::pass_one::<f64>
	cmp x27, x19
	mov w8, #8
	csel x9, x8, x25, hi
	csel x8, xzr, x27, hi
	cbz x8, LBB154_31
	lsl x8, x8, #3
	movi.2d v0, #0000000000000000
	mov x10, x8
LBB154_43:
	ldr d1, [x9], #8
	fadd d0, d0, d1
	subs x10, x10, #8
	b.ne LBB154_43
	cmp x27, x19
	ldr x9, [sp, #40]
	mov w10, #8
	csel x9, x10, x9, hi
	movi.2d v1, #0000000000000000
	ldp x1, x17, [sp, #80]
	ldr x2, [sp, #72]
LBB154_45:
	ldr d2, [x9], #8
	fadd d1, d1, d2
	subs x8, x8, #8
	b.ne LBB154_45
	ldr x11, [sp, #112]
	b LBB154_32
LBB154_47:
	ldr x8, [sp, #32]
	cbz x8, LBB154_49
	ldr x0, [sp, #40]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	ldr x0, [sp, #24]
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB154_49:
	ldr x8, [sp, #192]
	ldp x20, x19, [sp, #96]
	cbz x8, LBB154_51
	ldr x0, [sp, #16]
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB154_51:
	ldr x8, [sp, #168]
	cbz x8, LBB154_53
	mov x0, x20
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB154_53:
	ldr x8, [sp, #144]
	cbz x8, LBB154_55
	mov x0, x19
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB154_55:
	ldr x8, [sp, #120]
	cbz x8, LBB154_57
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
LBB154_57:
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
LBB154_58:
	.cfi_restore_state
	mov w0, #8
	mov x1, x27
	bl alloc::raw_vec::handle_error
LBB154_59:
	mov w0, #8
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB154_63
LBB154_60:
	mov w0, #8
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB154_63
LBB154_61:
	mov w0, #8
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB154_63
LBB154_62:
	mov w0, #8
	mov x1, x27
	bl alloc::raw_vec::handle_error
LBB154_63:
	brk #0x1
	mov x20, x0
	ldr x0, [sp, #24]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	b LBB154_73
	mov x20, x0
	ldr x8, [sp, #32]
	cbz x8, LBB154_77
	mov x0, x23
	mov w1, #8
	bl __rustc::__rdl_dealloc
	b LBB154_68
	mov x20, x0
	ldr x8, [sp, #32]
	cbz x8, LBB154_77
LBB154_68:
	mov x0, x22
	mov w1, #8
	bl __rustc::__rdl_dealloc
	mov x0, x26
	mov w1, #8
	bl __rustc::__rdl_dealloc
	mov x0, x20
	bl __Unwind_Resume
	mov x20, x0
	ldr x8, [sp, #32]
	cbz x8, LBB154_77
	b LBB154_82
	b LBB154_72
LBB154_72:
	mov x20, x0
LBB154_73:
	ldr x8, [sp, #192]
	cbnz x8, LBB154_78
	ldr x8, [sp, #168]
	cbnz x8, LBB154_79
LBB154_75:
	ldr x8, [sp, #144]
	cbnz x8, LBB154_80
LBB154_76:
	ldr x8, [sp, #120]
	cbnz x8, LBB154_81
LBB154_77:
	mov x0, x20
	bl __Unwind_Resume
LBB154_78:
	ldr x0, [sp, #200]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #168]
	cbz x8, LBB154_75
LBB154_79:
	ldr x0, [sp, #176]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #144]
	cbz x8, LBB154_76
LBB154_80:
	ldr x0, [sp, #152]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #120]
	cbz x8, LBB154_77
LBB154_81:
	ldr x26, [sp, #128]
LBB154_82:
	mov x0, x26
	mov w1, #8
	bl __rustc::__rdl_dealloc
	mov x0, x20
	bl __Unwind_Resume
