<engine::force::PairwiseGravity<f32> as engine::force::Force<f32>>::accumulate:
Lfunc_begin155:
	.cfi_startproc
	.cfi_personality 155, _rust_eh_personality
	.cfi_lsda 16, Lexception47
	sub sp, sp, #416
	.cfi_def_cfa_offset 416
	stp d13, d12, [sp, #272]
	stp d11, d10, [sp, #288]
	stp d9, d8, [sp, #304]
	stp x28, x27, [sp, #320]
	stp x26, x25, [sp, #336]
	stp x24, x23, [sp, #352]
	stp x22, x21, [sp, #368]
	stp x20, x19, [sp, #384]
	stp x29, x30, [sp, #400]
	add x29, sp, #400
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
	lsl x26, x21, #2
	lsr x8, x21, #62
	mov x9, #-3
	movk x9, #32767, lsl #48
	cmp x26, x9
	ccmp x8, #0, #0, lo
	b.eq LBB155_2
	mov x0, #0
	mov x1, x26
	bl alloc::raw_vec::handle_error
LBB155_2:
	mov x28, x3
	mov x24, x2
	str x0, [sp, #56]
	cbz x26, LBB155_8
	mov x19, x1
	mov x0, x26
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB155_73
	mov x25, x0
	mov x0, x26
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB155_74
	mov x22, x0
	mov x0, x26
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB155_75
	mov x20, x0
	mov x0, x26
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB155_76
	mov x23, x0
	mov x1, x19
	b LBB155_9
LBB155_8:
	mov w20, #4
	mov w25, #4
	mov w22, #4
	mov w23, #4
LBB155_9:
	stp x21, x25, [sp, #120]
	stp xzr, x21, [sp, #136]
	stp x22, xzr, [sp, #152]
	stp x21, x20, [sp, #168]
	stp xzr, x21, [sp, #184]
	stp x23, xzr, [sp, #200]
	ldr x8, [x1, #64]
	cmp x8, x21
	csel x27, x8, x21, lo
	str x24, [sp, #64]
	cbz x27, LBB155_25
	str x28, [sp, #96]
	mov x28, #0
	ldr x8, [x1, #8]
	ldr x19, [x1, #56]
	add x22, x8, #4
	fmov s8, #1.00000000
	movi.2d v9, #0000000000000000
	b LBB155_12
LBB155_11:
	add x22, x22, #8
	ldr x23, [sp, #200]
	str s10, [x23, x26, lsl #2]
	add x26, x26, #1
	str x26, [sp, #208]
	mov x28, x20
	cmp x27, x20
	b.eq LBB155_21
LBB155_12:
	ldp s12, s11, [x22, #-4]
	ldr s10, [x19, x28, lsl #2]
	ldr x8, [sp, #120]
	cmp x28, x8
	b.ne LBB155_15
	add x0, sp, #120
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
	ldr x25, [sp, #128]
LBB155_15:
	add x20, x28, #1
	str s12, [x25, x28, lsl #2]
	str x20, [sp, #136]
	ldr x21, [sp, #160]
	ldr x8, [sp, #144]
	cmp x21, x8
	b.ne LBB155_17
	add x0, sp, #144
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
LBB155_17:
	ldr x8, [sp, #152]
	mov x24, x8
	str s11, [x8, x21, lsl #2]
	add x8, x21, #1
	str x8, [sp, #104]
	str x8, [sp, #160]
	fdiv s0, s8, s10
	fcmp s10, #0.0
	fcsel s11, s9, s0, eq
	ldr x21, [sp, #184]
	ldr x8, [sp, #168]
	cmp x21, x8
	b.ne LBB155_19
	add x0, sp, #168
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
LBB155_19:
	ldr x8, [sp, #176]
	str x8, [sp, #112]
	str s11, [x8, x21, lsl #2]
	add x21, x21, #1
	str x21, [sp, #184]
	ldr x26, [sp, #208]
	ldr x8, [sp, #192]
	cmp x26, x8
	b.ne LBB155_11
	add x0, sp, #192
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
	b LBB155_11
LBB155_21:
	mov x22, x24
	ldr x28, [sp, #96]
	ldr x24, [sp, #64]
	lsl x27, x28, #2
	cbz x28, LBB155_26
LBB155_22:
	mov x0, x27
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB155_77
	mov x19, x0
	cmp x28, #4
	b.hi LBB155_27
	mov x8, #0
	b LBB155_34
LBB155_25:
	stp xzr, x20, [sp, #104]
	mov x21, #0
	mov x26, #0
	mov x20, #0
	lsl x27, x28, #2
	cbnz x28, LBB155_22
LBB155_26:
	mov w8, #4
	str x8, [sp, #96]
	mov w0, #4
	cbnz x20, LBB155_49
	b LBB155_55
LBB155_27:
	cmp x28, #17
	b.hs LBB155_29
	mov x8, #0
	b LBB155_32
LBB155_29:
	ands x8, x28, #0xf
	mov w9, #16
	csel x9, x9, x8, eq
	sub x8, x28, x9
	add x10, x24, #64
	add x11, x19, #32
	sub x12, x28, x9
LBB155_30:
	sub x13, x10, #40
	sub x14, x10, #48
	ldur q0, [x10, #-64]
	mov.s v0[1], v0[2]
	ld1.s { v0 }[2], [x14]
	ld1.s { v0 }[3], [x13]
	sub x13, x10, #8
	ldur q1, [x10, #-32]
	mov.s v1[1], v1[2]
	sub x14, x10, #16
	ld1.s { v1 }[2], [x14]
	ld1.s { v1 }[3], [x13]
	add x13, x10, #24
	add x14, x10, #16
	ldr q2, [x10]
	mov.s v2[1], v2[2]
	ld1.s { v2 }[2], [x14]
	ld1.s { v2 }[3], [x13]
	add x13, x10, #56
	ldr q3, [x10, #32]
	mov.s v3[1], v3[2]
	add x14, x10, #48
	ld1.s { v3 }[2], [x14]
	ld1.s { v3 }[3], [x13]
	stp q0, q1, [x11, #-32]
	stp q2, q3, [x11], #64
	add x10, x10, #128
	subs x12, x12, #16
	b.ne LBB155_30
	cmp x9, #5
	b.lo LBB155_34
LBB155_32:
	mov x11, x8
	ands x8, x28, #0x3
	mov w9, #4
	csel x12, x9, x8, eq
	add x9, x19, x11, lsl #2
	add x10, x24, x11, lsl #3
	sub x8, x28, x12
	add x11, x12, x11
	sub x11, x11, x28
LBB155_33:
	add x12, x10, #24
	add x13, x10, #16
	ldr q0, [x10], #32
	mov.s v0[1], v0[2]
	ld1.s { v0 }[2], [x13]
	ld1.s { v0 }[3], [x12]
	str q0, [x9], #16
	adds x11, x11, #4
	b.ne LBB155_33
LBB155_34:
	add x9, x24, x8, lsl #3
LBB155_35:
	ldr s0, [x9], #8
	str s0, [x19, x8, lsl #2]
	add x8, x8, #1
	cmp x28, x8
	b.ne LBB155_35
	mov x0, x27
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB155_78
	cmp x28, #4
	b.hi LBB155_39
	mov x8, #0
	b LBB155_46
LBB155_39:
	cmp x28, #17
	b.hs LBB155_41
	mov x8, #0
	b LBB155_44
LBB155_41:
	ands x8, x28, #0xf
	mov w9, #16
	csel x9, x9, x8, eq
	sub x8, x28, x9
	add x10, x24, #68
	add x11, x0, #32
	sub x12, x28, x9
LBB155_42:
	sub x13, x10, #40
	sub x14, x10, #48
	ldur q0, [x10, #-64]
	mov.s v0[1], v0[2]
	ld1.s { v0 }[2], [x14]
	ld1.s { v0 }[3], [x13]
	sub x13, x10, #8
	ldur q1, [x10, #-32]
	mov.s v1[1], v1[2]
	sub x14, x10, #16
	ld1.s { v1 }[2], [x14]
	ld1.s { v1 }[3], [x13]
	add x13, x10, #24
	add x14, x10, #16
	ldr q2, [x10]
	mov.s v2[1], v2[2]
	ld1.s { v2 }[2], [x14]
	ld1.s { v2 }[3], [x13]
	add x13, x10, #56
	ldr q3, [x10, #32]
	mov.s v3[1], v3[2]
	add x14, x10, #48
	ld1.s { v3 }[2], [x14]
	ld1.s { v3 }[3], [x13]
	stp q0, q1, [x11, #-32]
	stp q2, q3, [x11], #64
	add x10, x10, #128
	subs x12, x12, #16
	b.ne LBB155_42
	cmp x9, #5
	b.lo LBB155_46
LBB155_44:
	mov x10, x8
	ands x8, x28, #0x3
	mov w9, #4
	csel x11, x9, x8, eq
	add x9, x0, x10, lsl #2
	add x12, x24, x10, lsl #3
	sub x8, x28, x11
	add x10, x11, x10
	sub x10, x10, x28
	add x11, x12, #4
LBB155_45:
	add x12, x11, #24
	add x13, x11, #16
	ldr q0, [x11], #32
	mov.s v0[1], v0[2]
	ld1.s { v0 }[2], [x13]
	ld1.s { v0 }[3], [x12]
	str q0, [x9], #16
	adds x10, x10, #4
	b.ne LBB155_45
LBB155_46:
	add x9, x24, x8, lsl #3
	add x9, x9, #4
LBB155_47:
	ldr s0, [x9], #8
	str s0, [x0, x8, lsl #2]
	add x8, x8, #1
	cmp x28, x8
	b.ne LBB155_47
	str x19, [sp, #96]
	cbz x20, LBB155_55
LBB155_49:
	mov x25, #0
	mov x8, #0
	ldr x9, [sp, #128]
	stp x9, x22, [sp, #80]
	ldr x9, [sp, #56]
	ldp s9, s8, [x9]
	str x23, [sp, #72]
LBB155_50:
	ldr x9, [sp, #104]
	add x9, x9, x8
	cbz x9, LBB155_55
	add x10, x21, x8
	cbz x10, LBB155_55
	add x10, x26, x8
	cbz x10, LBB155_55
	cmp x27, x25
	b.eq LBB155_55
	ldr x10, [sp, #80]
	add x10, x10, x25
	add x11, x20, x8
	sub x3, x11, #1
	add x4, x22, x25
	ldr s0, [x4], #4
	sub x5, x9, #1
	ldr s1, [x10]
	sub x19, x8, #1
	ldr x9, [sp, #112]
	add x6, x9, x25
	add x9, x23, x25
	ldr s10, [x9], #4
	ldr s2, [x6], #4
	add x11, x26, x8
	sub x11, x11, #1
	add x8, x28, x8
	sub x8, x8, #1
	add x12, x0, x25
	add x12, x12, #4
	add x23, x0, x25
	mov x24, x27
	mov x27, x28
	ldr x13, [sp, #96]
	add x28, x13, x25
	add x13, x28, #4
	fmul s2, s2, s9
	stp s1, s0, [x29, #-148]
	stur s2, [x29, #-140]
	stp x12, x8, [sp, #32]
	mov x22, x0
	sub x0, x29, #180
	sub x1, x29, #148
	add x2, x10, #4
	stp x13, x8, [sp, #16]
	add x7, x19, x21
	stp x9, x11, [sp]
	mov.16b v0, v8
	bl engine::force::sweep::<f32>
	mov x0, x22
	ldp s0, s1, [x29, #-180]
	ldp s2, s3, [x29, #-172]
	ldp s4, s5, [x29, #-164]
	ldp s6, s7, [x29, #-156]
	fadd s0, s0, s1
	fadd s1, s2, s3
	fadd s0, s0, s1
	fmul s0, s10, s0
	ldr s1, [x28]
	fadd s0, s0, s1
	str s0, [x28]
	mov x28, x27
	mov x27, x24
	fadd s0, s4, s5
	fadd s1, s6, s7
	fadd s0, s0, s1
	fmul s0, s10, s0
	ldr s1, [x23]
	fadd s0, s0, s1
	str s0, [x23]
	ldr x23, [sp, #72]
	ldr x22, [sp, #88]
	add x25, x25, #4
	mov x8, x19
	cmn x20, x19
	b.ne LBB155_50
LBB155_55:
	ldr x19, [sp, #112]
	cbz x28, LBB155_64
	cmp x28, #8
	b.hs LBB155_58
	mov x8, #0
	ldr x14, [sp, #64]
	ldr x20, [sp, #96]
	b LBB155_61
LBB155_58:
	and x8, x28, #0xffffffffffffff8
	add x9, x0, #16
	ldr x20, [sp, #96]
	add x10, x20, #16
	ldr x14, [sp, #64]
	add x11, x14, #32
	and x12, x28, #0xffffffffffffff8
LBB155_59:
	sub x13, x11, #32
	ldp q0, q2, [x10, #-16]
	ldp q1, q3, [x9, #-16]
	st2.4s { v0, v1 }, [x13]
	st2.4s { v2, v3 }, [x11]
	add x9, x9, #32
	add x10, x10, #32
	add x11, x11, #64
	subs x12, x12, #8
	b.ne LBB155_59
	cmp x28, x8
	b.eq LBB155_63
LBB155_61:
	lsl x10, x8, #2
	add x9, x0, x10
	add x10, x20, x10
	add x11, x14, x8, lsl #3
	add x11, x11, #4
	sub x8, x28, x8
LBB155_62:
	ldr s0, [x10], #4
	ldr s1, [x9], #4
	stp s0, s1, [x11, #-4]
	add x11, x11, #8
	subs x8, x8, #1
	b.ne LBB155_62
LBB155_63:
	mov w1, #4
	bl __rustc::__rdl_dealloc
	mov x0, x20
	mov w1, #4
	bl __rustc::__rdl_dealloc
LBB155_64:
	ldr x8, [sp, #192]
	cbz x8, LBB155_66
	mov x0, x23
	mov w1, #4
	bl __rustc::__rdl_dealloc
LBB155_66:
	ldr x8, [sp, #168]
	cbz x8, LBB155_68
	mov x0, x19
	mov w1, #4
	bl __rustc::__rdl_dealloc
LBB155_68:
	ldr x8, [sp, #144]
	cbz x8, LBB155_70
	mov x0, x22
	mov w1, #4
	bl __rustc::__rdl_dealloc
LBB155_70:
	ldr x8, [sp, #120]
	cbz x8, LBB155_72
	ldr x0, [sp, #128]
	mov w1, #4
	.cfi_def_cfa wsp, 416
	ldp x29, x30, [sp, #400]
	ldp x20, x19, [sp, #384]
	ldp x22, x21, [sp, #368]
	ldp x24, x23, [sp, #352]
	ldp x26, x25, [sp, #336]
	ldp x28, x27, [sp, #320]
	ldp d9, d8, [sp, #304]
	ldp d11, d10, [sp, #288]
	ldp d13, d12, [sp, #272]
	add sp, sp, #416
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
LBB155_72:
	.cfi_restore_state
	.cfi_remember_state
	.cfi_def_cfa wsp, 416
	ldp x29, x30, [sp, #400]
	ldp x20, x19, [sp, #384]
	ldp x22, x21, [sp, #368]
	ldp x24, x23, [sp, #352]
	ldp x26, x25, [sp, #336]
	ldp x28, x27, [sp, #320]
	ldp d9, d8, [sp, #304]
	ldp d11, d10, [sp, #288]
	ldp d13, d12, [sp, #272]
	add sp, sp, #416
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
LBB155_73:
	.cfi_restore_state
	mov w0, #4
	mov x1, x26
	bl alloc::raw_vec::handle_error
LBB155_74:
	mov w0, #4
	mov x1, x26
	bl alloc::raw_vec::handle_error
	b LBB155_79
LBB155_75:
	mov w0, #4
	mov x1, x26
	bl alloc::raw_vec::handle_error
	b LBB155_79
LBB155_76:
	mov x19, x20
	mov w0, #4
	mov x1, x26
	bl alloc::raw_vec::handle_error
	b LBB155_79
LBB155_77:
	mov w0, #4
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB155_79
LBB155_78:
	mov w0, #4
	mov x1, x27
	bl alloc::raw_vec::handle_error
LBB155_79:
	brk #0x1
	mov x20, x0
	mov x0, x19
	mov w1, #4
	bl __rustc::__rdl_dealloc
	b LBB155_89
	b LBB155_88
	mov x20, x0
	cbz x21, LBB155_98
	mov x0, x19
	mov w1, #4
	bl __rustc::__rdl_dealloc
	b LBB155_85
	mov x20, x0
	cbz x21, LBB155_98
LBB155_85:
	mov x0, x22
	mov w1, #4
	bl __rustc::__rdl_dealloc
	b LBB155_97
	mov x20, x0
	cbnz x21, LBB155_97
	b LBB155_98
LBB155_88:
	mov x20, x0
LBB155_89:
	ldr x8, [sp, #192]
	cbnz x8, LBB155_93
	ldr x8, [sp, #168]
	cbnz x8, LBB155_94
LBB155_91:
	ldr x8, [sp, #144]
	cbnz x8, LBB155_95
LBB155_92:
	ldr x8, [sp, #120]
	cbnz x8, LBB155_96
	b LBB155_98
LBB155_93:
	ldr x0, [sp, #200]
	mov w1, #4
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #168]
	cbz x8, LBB155_91
LBB155_94:
	ldr x0, [sp, #176]
	mov w1, #4
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #144]
	cbz x8, LBB155_92
LBB155_95:
	ldr x0, [sp, #152]
	mov w1, #4
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #120]
	cbz x8, LBB155_98
LBB155_96:
	ldr x25, [sp, #128]
LBB155_97:
	mov x0, x25
	mov w1, #4
	bl __rustc::__rdl_dealloc
LBB155_98:
	mov x0, x20
	bl __Unwind_Resume
