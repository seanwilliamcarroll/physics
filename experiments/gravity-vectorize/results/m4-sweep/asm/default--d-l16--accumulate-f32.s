<engine::force::PairwiseGravity<f32> as engine::force::Force<f32>>::accumulate:
Lfunc_begin152:
	.cfi_startproc
	.cfi_personality 155, _rust_eh_personality
	.cfi_lsda 16, Lexception50
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
	sub sp, sp, #480
	ldr x20, [x1, #16]
	lsl x26, x20, #2
	lsr x8, x20, #62
	mov x9, #-3
	movk x9, #32767, lsl #48
	cmp x26, x9
	ccmp x8, #0, #0, lo
	b.eq LBB152_2
	bl alloc::raw_vec::capacity_overflow
LBB152_2:
	mov x28, x3
	mov x22, x2
	str x0, [sp, #56]
	cbz x26, LBB152_8
	mov x19, x1
	mov x0, x26
	bl _malloc
	cbz x0, LBB152_73
	mov x24, x0
	mov x0, x26
	bl _malloc
	cbz x0, LBB152_74
	mov x23, x0
	mov x0, x26
	bl _malloc
	cbz x0, LBB152_75
	mov x25, x0
	mov x0, x26
	bl _malloc
	cbz x0, LBB152_76
	mov x21, x0
	mov x1, x19
	b LBB152_9
LBB152_8:
	mov w25, #4
	mov w24, #4
	mov w23, #4
	mov w21, #4
LBB152_9:
	stp x20, x24, [sp, #112]
	stp xzr, x20, [sp, #128]
	stp x23, xzr, [sp, #144]
	stp x20, x25, [sp, #160]
	stp xzr, x20, [sp, #176]
	stp x21, xzr, [sp, #192]
	ldr x8, [x1, #64]
	cmp x8, x20
	csel x27, x8, x20, lo
	str x22, [sp, #64]
	cbz x27, LBB152_25
	str x28, [sp, #88]
	mov x28, #0
	ldr x8, [x1, #8]
	ldr x22, [x1, #56]
	add x19, x8, #4
	fmov s8, #1.00000000
	movi.2d v9, #0000000000000000
	b LBB152_12
LBB152_11:
	add x19, x19, #8
	ldr x21, [sp, #192]
	str s10, [x21, x26, lsl #2]
	add x26, x26, #1
	str x26, [sp, #200]
	mov x28, x23
	cmp x27, x23
	b.eq LBB152_21
LBB152_12:
	ldp s12, s11, [x19, #-4]
	ldr s10, [x22, x28, lsl #2]
	ldr x8, [sp, #112]
	cmp x28, x8
	b.ne LBB152_15
	add x0, sp, #112
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
	ldr x24, [sp, #120]
LBB152_15:
	add x23, x28, #1
	str s12, [x24, x28, lsl #2]
	str x23, [sp, #128]
	ldr x20, [sp, #152]
	ldr x8, [sp, #136]
	cmp x20, x8
	b.ne LBB152_17
	add x0, sp, #136
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
LBB152_17:
	ldr x8, [sp, #144]
	str x8, [sp, #104]
	str s11, [x8, x20, lsl #2]
	add x25, x20, #1
	str x25, [sp, #152]
	fdiv s0, s8, s10
	fcmp s10, #0.0
	fcsel s11, s9, s0, eq
	ldr x20, [sp, #176]
	ldr x8, [sp, #160]
	cmp x20, x8
	b.ne LBB152_19
	add x0, sp, #160
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
LBB152_19:
	ldr x8, [sp, #168]
	str x8, [sp, #96]
	str s11, [x8, x20, lsl #2]
	add x20, x20, #1
	str x20, [sp, #176]
	ldr x26, [sp, #200]
	ldr x8, [sp, #184]
	cmp x26, x8
	b.ne LBB152_11
	add x0, sp, #184
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
	b LBB152_11
LBB152_21:
	ldr x28, [sp, #88]
	ldr x22, [sp, #64]
	lsl x19, x28, #2
	cbz x28, LBB152_26
LBB152_22:
	mov x0, x19
	bl _malloc
	cbz x0, LBB152_77
	mov x27, x0
	cmp x28, #4
	b.hi LBB152_27
	mov x8, #0
	b LBB152_34
LBB152_25:
	stp x25, x23, [sp, #96]
	mov x25, #0
	mov x20, #0
	mov x26, #0
	mov x23, #0
	lsl x19, x28, #2
	cbnz x28, LBB152_22
LBB152_26:
	mov w27, #4
	mov w0, #4
	b LBB152_48
LBB152_27:
	cmp x28, #17
	b.hs LBB152_29
	mov x8, #0
	b LBB152_32
LBB152_29:
	ands x8, x28, #0xf
	mov w9, #16
	csel x9, x9, x8, eq
	sub x8, x28, x9
	add x10, x22, #64
	add x11, x27, #32
	sub x12, x28, x9
LBB152_30:
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
	b.ne LBB152_30
	cmp x9, #5
	b.lo LBB152_34
LBB152_32:
	mov x11, x8
	ands x8, x28, #0x3
	mov w9, #4
	csel x12, x9, x8, eq
	add x9, x27, x11, lsl #2
	add x10, x22, x11, lsl #3
	sub x8, x28, x12
	add x11, x12, x11
	sub x11, x11, x28
LBB152_33:
	add x12, x10, #24
	add x13, x10, #16
	ldr q0, [x10], #32
	mov.s v0[1], v0[2]
	ld1.s { v0 }[2], [x13]
	ld1.s { v0 }[3], [x12]
	str q0, [x9], #16
	adds x11, x11, #4
	b.ne LBB152_33
LBB152_34:
	add x9, x22, x8, lsl #3
LBB152_35:
	ldr s0, [x9], #8
	str s0, [x27, x8, lsl #2]
	add x8, x8, #1
	cmp x28, x8
	b.ne LBB152_35
	mov x0, x19
	bl _malloc
	cbz x0, LBB152_78
	cmp x28, #4
	b.hi LBB152_39
	mov x8, #0
	b LBB152_46
LBB152_39:
	cmp x28, #17
	b.hs LBB152_41
	mov x8, #0
	b LBB152_44
LBB152_41:
	ands x8, x28, #0xf
	mov w9, #16
	csel x9, x9, x8, eq
	sub x8, x28, x9
	add x10, x22, #68
	add x11, x0, #32
	sub x12, x28, x9
LBB152_42:
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
	b.ne LBB152_42
	cmp x9, #5
	b.lo LBB152_46
LBB152_44:
	mov x10, x8
	ands x8, x28, #0x3
	mov w9, #4
	csel x11, x9, x8, eq
	add x9, x0, x10, lsl #2
	add x12, x22, x10, lsl #3
	sub x8, x28, x11
	add x10, x11, x10
	sub x10, x10, x28
	add x11, x12, #4
LBB152_45:
	add x12, x11, #24
	add x13, x11, #16
	ldr q0, [x11], #32
	mov.s v0[1], v0[2]
	ld1.s { v0 }[2], [x13]
	ld1.s { v0 }[3], [x12]
	str q0, [x9], #16
	adds x10, x10, #4
	b.ne LBB152_45
LBB152_46:
	add x9, x22, x8, lsl #3
	add x9, x9, #4
LBB152_47:
	ldr s0, [x9], #8
	str s0, [x0, x8, lsl #2]
	add x8, x8, #1
	cmp x28, x8
	b.ne LBB152_47
LBB152_48:
	cbz x23, LBB152_55
	mov x24, #0
	mov x8, #0
	ldr x9, [sp, #120]
	stp x9, x0, [sp, #72]
	ldr x9, [sp, #56]
	ldp s9, s8, [x9]
	str x19, [sp, #88]
LBB152_50:
	add x9, x25, x8
	cbz x9, LBB152_55
	add x10, x20, x8
	cbz x10, LBB152_55
	add x10, x26, x8
	cbz x10, LBB152_55
	cmp x19, x24
	b.eq LBB152_55
	ldr x10, [sp, #72]
	add x10, x10, x24
	add x11, x23, x8
	sub x3, x11, #1
	ldr x11, [sp, #104]
	add x4, x11, x24
	ldr s0, [x4], #4
	sub x5, x9, #1
	ldr s1, [x10]
	sub x19, x8, #1
	ldr x9, [sp, #96]
	add x6, x9, x24
	add x9, x21, x24
	ldr s10, [x9], #4
	ldr s2, [x6], #4
	add x11, x26, x8
	sub x11, x11, #1
	add x8, x28, x8
	sub x8, x8, #1
	add x12, x0, x24
	add x12, x12, #4
	add x22, x0, x24
	add x13, x27, x24
	add x13, x13, #4
	fmul s2, s2, s9
	stp s1, s0, [x29, #-208]
	stur s2, [x29, #-200]
	stp x12, x8, [sp, #32]
	add x0, sp, #272
	sub x1, x29, #208
	add x2, x10, #4
	stp x13, x8, [sp, #16]
	add x7, x19, x20
	stp x9, x11, [sp]
	mov.16b v0, v8
	bl engine::force::sweep::<f32>
	ldp q0, q1, [sp, #272]
	stp q0, q1, [x29, #-208]
	ldp q0, q1, [sp, #304]
	stp q0, q1, [x29, #-176]
	add x8, sp, #272
	ldp q0, q1, [x8, #64]
	stp q0, q1, [sp, #208]
	ldp q0, q1, [x8, #96]
	stp q0, q1, [sp, #240]
	sub x0, x29, #208
	mov w1, #16
	bl engine::force::tree_sum::<f32>
	fmul s0, s10, s0
	add x8, x27, x24
	ldr s1, [x8]
	fadd s0, s0, s1
	str s0, [x8]
	ldp q0, q1, [sp, #208]
	stp q0, q1, [sp, #272]
	ldp q0, q1, [sp, #240]
	stp q0, q1, [sp, #304]
	add x0, sp, #272
	mov w1, #16
	bl engine::force::tree_sum::<f32>
	fmul s0, s10, s0
	ldr s1, [x22]
	fadd s0, s0, s1
	str s0, [x22]
	add x24, x24, #4
	mov x8, x19
	cmn x23, x19
	ldp x0, x19, [sp, #80]
	b.ne LBB152_50
LBB152_55:
	cbz x28, LBB152_64
	cmp x28, #8
	b.hs LBB152_58
	mov x8, #0
	ldr x14, [sp, #64]
	b LBB152_61
LBB152_58:
	and x8, x28, #0xffffffffffffff8
	add x9, x0, #16
	add x10, x27, #16
	ldr x14, [sp, #64]
	add x11, x14, #32
	and x12, x28, #0xffffffffffffff8
LBB152_59:
	sub x13, x11, #32
	ldp q0, q2, [x10, #-16]
	ldp q1, q3, [x9, #-16]
	st2.4s { v0, v1 }, [x13]
	st2.4s { v2, v3 }, [x11]
	add x9, x9, #32
	add x10, x10, #32
	add x11, x11, #64
	subs x12, x12, #8
	b.ne LBB152_59
	cmp x28, x8
	b.eq LBB152_63
LBB152_61:
	lsl x10, x8, #2
	add x9, x0, x10
	add x10, x27, x10
	add x11, x14, x8, lsl #3
	add x11, x11, #4
	sub x8, x28, x8
LBB152_62:
	ldr s0, [x10], #4
	ldr s1, [x9], #4
	stp s0, s1, [x11, #-4]
	add x11, x11, #8
	subs x8, x8, #1
	b.ne LBB152_62
LBB152_63:
	bl _free
	mov x0, x27
	bl _free
LBB152_64:
	ldr x8, [sp, #184]
	cbz x8, LBB152_66
	mov x0, x21
	bl _free
LBB152_66:
	ldr x8, [sp, #160]
	cbz x8, LBB152_68
	ldr x0, [sp, #168]
	bl _free
LBB152_68:
	ldr x8, [sp, #136]
	cbz x8, LBB152_70
	ldr x0, [sp, #144]
	bl _free
LBB152_70:
	ldr x8, [sp, #112]
	cbz x8, LBB152_72
	ldr x0, [sp, #120]
	bl _free
LBB152_72:
	add sp, sp, #480
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
LBB152_73:
	.cfi_restore_state
	mov w0, #4
	mov x1, x26
	bl alloc::raw_vec::handle_error
LBB152_74:
	mov w0, #4
	mov x1, x26
	bl alloc::raw_vec::handle_error
	b LBB152_79
LBB152_75:
	mov w0, #4
	mov x1, x26
	bl alloc::raw_vec::handle_error
	b LBB152_79
LBB152_76:
	mov w0, #4
	mov x1, x26
	bl alloc::raw_vec::handle_error
	b LBB152_79
LBB152_77:
	mov w0, #4
	mov x1, x19
	bl alloc::raw_vec::handle_error
	b LBB152_79
LBB152_78:
	mov w0, #4
	mov x1, x19
	bl alloc::raw_vec::handle_error
LBB152_79:
	brk #0x1
	mov x19, x0
	mov x0, x27
	bl _free
	b LBB152_89
	b LBB152_88
	mov x19, x0
	cbz x20, LBB152_98
	mov x0, x25
	bl _free
	b LBB152_85
	mov x19, x0
	cbz x20, LBB152_98
LBB152_85:
	mov x0, x23
	bl _free
	b LBB152_97
	mov x19, x0
	cbnz x20, LBB152_97
	b LBB152_98
LBB152_88:
	mov x19, x0
LBB152_89:
	ldr x8, [sp, #184]
	cbnz x8, LBB152_93
	ldr x8, [sp, #160]
	cbnz x8, LBB152_94
LBB152_91:
	ldr x8, [sp, #136]
	cbnz x8, LBB152_95
LBB152_92:
	ldr x8, [sp, #112]
	cbnz x8, LBB152_96
	b LBB152_98
LBB152_93:
	ldr x0, [sp, #192]
	bl _free
	ldr x8, [sp, #160]
	cbz x8, LBB152_91
LBB152_94:
	ldr x0, [sp, #168]
	bl _free
	ldr x8, [sp, #136]
	cbz x8, LBB152_92
LBB152_95:
	ldr x0, [sp, #144]
	bl _free
	ldr x8, [sp, #112]
	cbz x8, LBB152_98
LBB152_96:
	ldr x24, [sp, #120]
LBB152_97:
	mov x0, x24
	bl _free
LBB152_98:
	mov x0, x19
	bl __Unwind_Resume
