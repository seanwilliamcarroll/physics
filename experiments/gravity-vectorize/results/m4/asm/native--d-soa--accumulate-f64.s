<engine::force::PairwiseGravity<f64> as engine::force::Force<f64>>::accumulate:
Lfunc_begin154:
	.cfi_startproc
	.cfi_personality 155, _rust_eh_personality
	.cfi_lsda 16, Lexception46
	sub sp, sp, #448
	.cfi_def_cfa_offset 448
	stp d13, d12, [sp, #304]
	stp d11, d10, [sp, #320]
	stp d9, d8, [sp, #336]
	stp x28, x27, [sp, #352]
	stp x26, x25, [sp, #368]
	stp x24, x23, [sp, #384]
	stp x22, x21, [sp, #400]
	stp x20, x19, [sp, #416]
	stp x29, x30, [sp, #432]
	add x29, sp, #432
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
	ldr x21, [x1, #16]
	lsl x26, x21, #3
	lsr x8, x21, #61
	mov x9, #-7
	movk x9, #32767, lsl #48
	cmp x26, x9
	ccmp x8, #0, #0, lo
	b.eq LBB154_2
	mov x0, #0
	mov x1, x26
	bl alloc::raw_vec::handle_error
LBB154_2:
	mov x28, x3
	mov x24, x2
	str x0, [sp, #48]
	cbz x26, LBB154_8
	mov x19, x1
	mov x0, x26
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB154_63
	mov x25, x0
	mov x0, x26
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB154_64
	mov x22, x0
	mov x0, x26
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB154_65
	mov x20, x0
	mov x0, x26
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB154_66
	mov x23, x0
	mov x1, x19
	b LBB154_9
LBB154_8:
	mov w20, #8
	mov w25, #8
	mov w22, #8
	mov w23, #8
LBB154_9:
	stp x21, x25, [sp, #112]
	stp xzr, x21, [sp, #128]
	stp x22, xzr, [sp, #144]
	stp x21, x20, [sp, #160]
	stp xzr, x21, [sp, #176]
	stp x23, xzr, [sp, #192]
	ldr x8, [x1, #64]
	cmp x8, x21
	csel x27, x8, x21, lo
	str x24, [sp, #56]
	cbz x27, LBB154_25
	str x28, [sp, #88]
	mov x28, #0
	ldr x8, [x1, #8]
	ldr x19, [x1, #56]
	add x22, x8, #8
	fmov d8, #1.00000000
	movi.2d v9, #0000000000000000
	b LBB154_12
LBB154_11:
	add x22, x22, #16
	ldr x23, [sp, #192]
	str d10, [x23, x26, lsl #3]
	add x26, x26, #1
	str x26, [sp, #200]
	mov x28, x20
	cmp x27, x20
	b.eq LBB154_21
LBB154_12:
	ldp d12, d11, [x22, #-8]
	ldr d10, [x19, x28, lsl #3]
	ldr x8, [sp, #112]
	cmp x28, x8
	b.ne LBB154_15
	add x0, sp, #112
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	ldr x25, [sp, #120]
LBB154_15:
	add x20, x28, #1
	str d12, [x25, x28, lsl #3]
	str x20, [sp, #128]
	ldr x21, [sp, #152]
	ldr x8, [sp, #136]
	cmp x21, x8
	b.ne LBB154_17
	add x0, sp, #136
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
LBB154_17:
	ldr x8, [sp, #144]
	mov x24, x8
	str d11, [x8, x21, lsl #3]
	add x8, x21, #1
	str x8, [sp, #96]
	str x8, [sp, #152]
	fdiv d0, d8, d10
	fcmp d10, #0.0
	fcsel d11, d9, d0, eq
	ldr x21, [sp, #176]
	ldr x8, [sp, #160]
	cmp x21, x8
	b.ne LBB154_19
	add x0, sp, #160
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
LBB154_19:
	ldr x8, [sp, #168]
	str x8, [sp, #104]
	str d11, [x8, x21, lsl #3]
	add x21, x21, #1
	str x21, [sp, #176]
	ldr x26, [sp, #200]
	ldr x8, [sp, #184]
	cmp x26, x8
	b.ne LBB154_11
	add x0, sp, #184
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	b LBB154_11
LBB154_21:
	mov x22, x24
	ldr x28, [sp, #88]
	ldr x24, [sp, #56]
	lsl x27, x28, #3
	cbz x28, LBB154_26
LBB154_22:
	mov x0, x27
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB154_67
	mov x19, x0
	cmp x28, #8
	b.hi LBB154_27
	mov x8, #0
	b LBB154_29
LBB154_25:
	stp xzr, x20, [sp, #96]
	mov x21, #0
	mov x26, #0
	mov x20, #0
	lsl x27, x28, #3
	cbnz x28, LBB154_22
LBB154_26:
	mov w8, #8
	str x8, [sp, #88]
	mov w0, #8
	cbnz x20, LBB154_39
	b LBB154_45
LBB154_27:
	ands x8, x28, #0x7
	mov w9, #8
	csel x8, x9, x8, eq
	sub x8, x28, x8
	add x9, x24, #64
	add x10, x19, #32
	mov x11, x8
LBB154_28:
	sub x12, x9, #48
	ldur q0, [x9, #-64]
	ld1.d { v0 }[1], [x12]
	sub x12, x9, #16
	ldur q1, [x9, #-32]
	ld1.d { v1 }[1], [x12]
	add x12, x9, #16
	ldr q2, [x9]
	ld1.d { v2 }[1], [x12]
	add x12, x9, #48
	ldr q3, [x9, #32]
	ld1.d { v3 }[1], [x12]
	stp q0, q1, [x10, #-32]
	stp q2, q3, [x10], #64
	add x9, x9, #128
	subs x11, x11, #8
	b.ne LBB154_28
LBB154_29:
	add x9, x24, x8, lsl #4
LBB154_30:
	ldr d0, [x9], #16
	str d0, [x19, x8, lsl #3]
	add x8, x8, #1
	cmp x28, x8
	b.ne LBB154_30
	mov x0, x27
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB154_68
	cmp x28, #8
	b.hi LBB154_34
	mov x8, #0
	b LBB154_36
LBB154_34:
	ands x8, x28, #0x7
	mov w9, #8
	csel x8, x9, x8, eq
	sub x8, x28, x8
	add x9, x24, #72
	add x10, x0, #32
	mov x11, x8
LBB154_35:
	sub x12, x9, #48
	ldur q0, [x9, #-64]
	ld1.d { v0 }[1], [x12]
	sub x12, x9, #16
	ldur q1, [x9, #-32]
	ld1.d { v1 }[1], [x12]
	add x12, x9, #16
	ldr q2, [x9]
	ld1.d { v2 }[1], [x12]
	add x12, x9, #48
	ldr q3, [x9, #32]
	ld1.d { v3 }[1], [x12]
	stp q0, q1, [x10, #-32]
	stp q2, q3, [x10], #64
	add x9, x9, #128
	subs x11, x11, #8
	b.ne LBB154_35
LBB154_36:
	add x9, x24, x8, lsl #4
	add x9, x9, #8
LBB154_37:
	ldr d0, [x9], #16
	str d0, [x0, x8, lsl #3]
	add x8, x8, #1
	cmp x28, x8
	b.ne LBB154_37
	str x19, [sp, #88]
	cbz x20, LBB154_45
LBB154_39:
	mov x25, #0
	mov x8, #0
	ldr x9, [sp, #120]
	stp x9, x22, [sp, #72]
	ldr x9, [sp, #48]
	ldp d9, d8, [x9]
	str x27, [sp, #64]
LBB154_40:
	ldr x9, [sp, #96]
	add x9, x9, x8
	cbz x9, LBB154_45
	add x10, x21, x8
	cbz x10, LBB154_45
	add x10, x26, x8
	cbz x10, LBB154_45
	cmp x27, x25
	b.eq LBB154_45
	ldr x10, [sp, #72]
	add x10, x10, x25
	add x11, x20, x8
	sub x3, x11, #1
	add x4, x22, x25
	ldr d0, [x4], #8
	sub x5, x9, #1
	ldr d1, [x10]
	sub x19, x8, #1
	ldr x9, [sp, #104]
	add x6, x9, x25
	add x9, x23, x25
	ldr d10, [x9], #8
	ldr d2, [x6], #8
	add x11, x26, x8
	sub x11, x11, #1
	add x8, x28, x8
	sub x8, x8, #1
	add x12, x0, x25
	add x12, x12, #8
	mov x24, x21
	add x21, x0, x25
	mov x27, x28
	ldr x13, [sp, #88]
	add x28, x13, x25
	add x13, x28, #8
	fmul d2, d2, d9
	stp d1, d0, [x29, #-160]
	stur d2, [x29, #-144]
	stp x12, x8, [sp, #32]
	mov x22, x0
	add x0, sp, #208
	sub x1, x29, #160
	add x2, x10, #8
	stp x13, x8, [sp, #16]
	add x7, x19, x24
	stp x9, x11, [sp]
	mov.16b v0, v8
	bl engine::force::sweep::<f64>
	mov x0, x22
	ldp d0, d1, [sp, #208]
	ldp d2, d3, [sp, #224]
	ldp d4, d5, [sp, #240]
	ldp d6, d7, [sp, #256]
	fadd d0, d0, d1
	fadd d1, d2, d3
	fadd d0, d0, d1
	fmul d0, d10, d0
	ldr d1, [x28]
	fadd d0, d0, d1
	str d0, [x28]
	mov x28, x27
	ldr x27, [sp, #64]
	fadd d0, d4, d5
	fadd d1, d6, d7
	fadd d0, d0, d1
	fmul d0, d10, d0
	ldr d1, [x21]
	fadd d0, d0, d1
	str d0, [x21]
	mov x21, x24
	ldr x22, [sp, #80]
	add x25, x25, #8
	mov x8, x19
	cmn x20, x19
	b.ne LBB154_40
LBB154_45:
	ldr x19, [sp, #104]
	cbz x28, LBB154_54
	cmp x28, #4
	b.hs LBB154_48
	mov x8, #0
	ldr x14, [sp, #56]
	ldr x20, [sp, #88]
	b LBB154_51
LBB154_48:
	and x8, x28, #0x7fffffffffffffc
	add x9, x0, #16
	ldr x20, [sp, #88]
	add x10, x20, #16
	ldr x14, [sp, #56]
	add x11, x14, #32
	and x12, x28, #0x7fffffffffffffc
LBB154_49:
	sub x13, x11, #32
	ldp q0, q2, [x10, #-16]
	ldp q1, q3, [x9, #-16]
	st2.2d { v0, v1 }, [x13]
	st2.2d { v2, v3 }, [x11]
	add x9, x9, #32
	add x10, x10, #32
	add x11, x11, #64
	subs x12, x12, #4
	b.ne LBB154_49
	cmp x28, x8
	b.eq LBB154_53
LBB154_51:
	lsl x10, x8, #3
	add x9, x0, x10
	add x10, x20, x10
	add x11, x14, x8, lsl #4
	add x11, x11, #8
	sub x8, x28, x8
LBB154_52:
	ldr d0, [x10], #8
	ldr d1, [x9], #8
	stp d0, d1, [x11, #-8]
	add x11, x11, #16
	subs x8, x8, #1
	b.ne LBB154_52
LBB154_53:
	mov w1, #8
	bl __rustc::__rdl_dealloc
	mov x0, x20
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB154_54:
	ldr x8, [sp, #184]
	cbz x8, LBB154_56
	mov x0, x23
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB154_56:
	ldr x8, [sp, #160]
	cbz x8, LBB154_58
	mov x0, x19
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB154_58:
	ldr x8, [sp, #136]
	cbz x8, LBB154_60
	mov x0, x22
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB154_60:
	ldr x8, [sp, #112]
	cbz x8, LBB154_62
	ldr x0, [sp, #120]
	mov w1, #8
	.cfi_def_cfa wsp, 448
	ldp x29, x30, [sp, #432]
	ldp x20, x19, [sp, #416]
	ldp x22, x21, [sp, #400]
	ldp x24, x23, [sp, #384]
	ldp x26, x25, [sp, #368]
	ldp x28, x27, [sp, #352]
	ldp d9, d8, [sp, #336]
	ldp d11, d10, [sp, #320]
	ldp d13, d12, [sp, #304]
	add sp, sp, #448
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
LBB154_62:
	.cfi_restore_state
	.cfi_remember_state
	.cfi_def_cfa wsp, 448
	ldp x29, x30, [sp, #432]
	ldp x20, x19, [sp, #416]
	ldp x22, x21, [sp, #400]
	ldp x24, x23, [sp, #384]
	ldp x26, x25, [sp, #368]
	ldp x28, x27, [sp, #352]
	ldp d9, d8, [sp, #336]
	ldp d11, d10, [sp, #320]
	ldp d13, d12, [sp, #304]
	add sp, sp, #448
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
LBB154_63:
	.cfi_restore_state
	mov w0, #8
	mov x1, x26
	bl alloc::raw_vec::handle_error
LBB154_64:
	mov w0, #8
	mov x1, x26
	bl alloc::raw_vec::handle_error
	b LBB154_69
LBB154_65:
	mov w0, #8
	mov x1, x26
	bl alloc::raw_vec::handle_error
	b LBB154_69
LBB154_66:
	mov x19, x20
	mov w0, #8
	mov x1, x26
	bl alloc::raw_vec::handle_error
	b LBB154_69
LBB154_67:
	mov w0, #8
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB154_69
LBB154_68:
	mov w0, #8
	mov x1, x27
	bl alloc::raw_vec::handle_error
LBB154_69:
	brk #0x1
	mov x20, x0
	mov x0, x19
	mov w1, #8
	bl __rustc::__rdl_dealloc
	b LBB154_79
	b LBB154_78
	mov x20, x0
	cbz x21, LBB154_88
	mov x0, x19
	mov w1, #8
	bl __rustc::__rdl_dealloc
	b LBB154_75
	mov x20, x0
	cbz x21, LBB154_88
LBB154_75:
	mov x0, x22
	mov w1, #8
	bl __rustc::__rdl_dealloc
	b LBB154_87
	mov x20, x0
	cbnz x21, LBB154_87
	b LBB154_88
LBB154_78:
	mov x20, x0
LBB154_79:
	ldr x8, [sp, #184]
	cbnz x8, LBB154_83
	ldr x8, [sp, #160]
	cbnz x8, LBB154_84
LBB154_81:
	ldr x8, [sp, #136]
	cbnz x8, LBB154_85
LBB154_82:
	ldr x8, [sp, #112]
	cbnz x8, LBB154_86
	b LBB154_88
LBB154_83:
	ldr x0, [sp, #192]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #160]
	cbz x8, LBB154_81
LBB154_84:
	ldr x0, [sp, #168]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #136]
	cbz x8, LBB154_82
LBB154_85:
	ldr x0, [sp, #144]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #112]
	cbz x8, LBB154_88
LBB154_86:
	ldr x25, [sp, #120]
LBB154_87:
	mov x0, x25
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB154_88:
	mov x0, x20
	bl __Unwind_Resume
