<engine::force::PairwiseGravity<f32> as engine::force::Force<f32>>::accumulate:
Lfunc_begin152:
	.cfi_startproc
	.cfi_personality 155, _rust_eh_personality
	.cfi_lsda 16, Lexception50
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
	ldr x22, [x1, #16]
	lsl x27, x22, #2
	lsr x8, x22, #62
	mov x9, #-3
	movk x9, #32767, lsl #48
	cmp x27, x9
	ccmp x8, #0, #0, lo
	b.eq LBB152_2
	bl alloc::raw_vec::capacity_overflow
LBB152_2:
	mov x21, x0
	stp x3, x2, [sp, #88]
	str x22, [sp, #112]
	cbz x27, LBB152_8
	mov x20, x1
	mov x0, x27
	bl _malloc
	cbz x0, LBB152_63
	mov x19, x0
	mov x0, x27
	bl _malloc
	cbz x0, LBB152_64
	mov x23, x0
	mov x0, x27
	bl _malloc
	cbz x0, LBB152_65
	mov x24, x0
	mov x0, x27
	bl _malloc
	cbz x0, LBB152_66
	mov x1, x20
	b LBB152_9
LBB152_8:
	mov w24, #4
	mov w19, #4
	mov w23, #4
	mov w0, #4
LBB152_9:
	str x21, [sp, #104]
	stp x22, x19, [sp, #136]
	stp xzr, x22, [sp, #152]
	stp x23, xzr, [sp, #168]
	stp x22, x24, [sp, #184]
	stp xzr, x22, [sp, #200]
	stp x0, xzr, [sp, #216]
	ldr x8, [x1, #64]
	cmp x8, x22
	csel x21, x8, x22, lo
	cbz x21, LBB152_24
	mov x20, #0
	ldr x8, [x1, #8]
	ldr x22, [x1, #56]
	add x23, x8, #4
	fmov s8, #1.00000000
	movi.2d v9, #0000000000000000
	b LBB152_12
LBB152_11:
	add x23, x23, #8
	ldr x0, [sp, #216]
	str s10, [x0, x20, lsl #2]
	add x25, x20, #1
	str x25, [sp, #224]
	mov x20, x24
	cmp x21, x24
	b.eq LBB152_21
LBB152_12:
	ldp s12, s11, [x23, #-4]
	ldr s10, [x22, x20, lsl #2]
	ldr x8, [sp, #136]
	cmp x20, x8
	b.ne LBB152_15
	add x0, sp, #136
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
	ldr x19, [sp, #144]
LBB152_15:
	add x24, x20, #1
	str s12, [x19, x20, lsl #2]
	str x24, [sp, #152]
	ldr x20, [sp, #176]
	ldr x8, [sp, #160]
	cmp x20, x8
	b.ne LBB152_17
	add x0, sp, #160
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
LBB152_17:
	ldr x8, [sp, #168]
	str x8, [sp, #128]
	str s11, [x8, x20, lsl #2]
	add x28, x20, #1
	str x28, [sp, #176]
	fdiv s0, s8, s10
	fcmp s10, #0.0
	fcsel s11, s9, s0, eq
	ldr x20, [sp, #200]
	ldr x8, [sp, #184]
	cmp x20, x8
	b.ne LBB152_19
	add x0, sp, #184
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
LBB152_19:
	ldr x8, [sp, #192]
	str x8, [sp, #120]
	str s11, [x8, x20, lsl #2]
	add x26, x20, #1
	str x26, [sp, #200]
	ldr x20, [sp, #224]
	ldr x8, [sp, #208]
	cmp x20, x8
	b.ne LBB152_11
	add x0, sp, #208
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
	b LBB152_11
LBB152_21:
	ldr x22, [sp, #112]
	lsr x8, x22, #61
	cbz x8, LBB152_25
LBB152_22:
	mov x0, #0
LBB152_23:
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB152_69
LBB152_24:
	stp x24, x23, [sp, #120]
	mov x25, #0
	mov x26, #0
	mov x28, #0
	mov x24, #0
	lsr x8, x22, #61
	cbnz x8, LBB152_22
LBB152_25:
	ldr x8, [sp, #104]
	ldp s8, s9, [x8]
	cbz x22, LBB152_29
	mov x19, x0
	mov x0, x27
	mov w1, #1
	bl _calloc
	str x0, [sp, #24]
	cbz x0, LBB152_67
	mov x0, x27
	mov w1, #1
	bl _calloc
	str x0, [sp, #104]
	cbz x0, LBB152_68
	mov x0, x19
	b LBB152_30
LBB152_29:
	mov w8, #4
	str x8, [sp, #24]
	mov w8, #4
	str x8, [sp, #104]
LBB152_30:
	ldr x11, [sp, #144]
	stp x11, x0, [sp, #8]
	mov x8, x0
	ldp x9, x10, [sp, #120]
	ldp x16, x12, [sp, #88]
	b LBB152_32
LBB152_31:
	sub x0, x29, #232
	mov w1, #2
	bl engine::force::tree_sum::<f32>
	ldr q1, [sp, #32]
	mov.s v1[1], v0[0]
	ldr q0, [sp, #48]
	fmul.2s v0, v1, v0[0]
	ldr d1, [x19]
	ldp x8, x3, [sp, #64]
	ldp x1, x17, [sp, #88]
	mov x26, x17
	mov x9, x1
	ldr x2, [sp, #80]
	mov x28, x2
	mov x10, x3
	fadd.2s v0, v0, v1
	str d0, [x19]
	mov x24, x20
	mov x11, x21
	mov x16, x23
	mov x12, x22
LBB152_32:
	mov x19, x12
	add x12, x12, #8
	sub x27, x16, #1
	cmp x16, #0
	csel x23, x23, x27, eq
	csel x22, x22, x12, eq
	add x12, x11, #4
	sub x13, x24, #1
	cmp x24, #0
	csel x20, x20, x13, eq
	csel x21, x21, x12, eq
	add x12, x10, #4
	sub x13, x28, #1
	cmp x28, #0
	csel x2, x2, x13, eq
	csel x3, x3, x12, eq
	add x14, x9, #4
	sub x15, x26, #1
	cmp x26, #0
	csel x17, x17, x15, eq
	csel x1, x1, x14, eq
	cbz x25, LBB152_52
	cbz x16, LBB152_52
	cbz x24, LBB152_52
	cbz x11, LBB152_52
	cbz x28, LBB152_52
	cbz x10, LBB152_52
	cbz x26, LBB152_52
	cbz x9, LBB152_52
	stp x3, x2, [sp, #72]
	stp x1, x17, [sp, #88]
	add x16, x8, #4
	ldr s0, [x11]
	sub x25, x25, #1
	ldr s1, [x10]
	ldr s2, [x9]
	ldr s3, [x8]
	str q3, [sp, #48]
	fmul s2, s8, s2
	stp s0, s1, [sp, #232]
	stp s2, s9, [sp, #240]
	stp x21, x20, [x29, #-232]
	stp x12, x13, [x29, #-216]
	stp x14, x15, [x29, #-200]
	str x16, [sp, #64]
	stp x16, x25, [x29, #-184]
	ldr x26, [sp, #24]
	ldp x8, x24, [sp, #104]
	stp x26, x24, [x29, #-168]
	stp x8, x24, [x29, #-152]
	add x0, sp, #232
	sub x1, x29, #232
	add x2, x19, #8
	sub x4, x29, #168
	mov x3, x27
	bl engine::force::pass_one::<f32>
	cmp x27, x24
	mov w8, #4
	csel x8, x8, x26, hi
	csel x26, xzr, x27, hi
	stur xzr, [x29, #-232]
	lsl x9, x26, #2
	ands x28, x9, #0x3ffffffffffffff8
	b.eq LBB152_49
	movi d0, #0000000000000000
	mov x9, x28
	mov x10, x8
LBB152_42:
	ldr d1, [x10], #8
	fadd.2s v0, v0, v1
	subs x9, x9, #8
	b.ne LBB152_42
	stur d0, [x29, #-232]
	and x24, x26, #0xffffffffffffffe
	tbz w26, #0, LBB152_45
LBB152_44:
	ldr s1, [x8, x24, lsl #2]
	fadd s0, s0, s1
	stur s0, [x29, #-232]
LBB152_45:
	sub x0, x29, #232
	mov w1, #2
	bl engine::force::tree_sum::<f32>
	str q0, [sp, #32]
	ldp x8, x9, [sp, #104]
	cmp x27, x9
	mov w9, #4
	csel x8, x9, x8, hi
	stur xzr, [x29, #-232]
	cbz x28, LBB152_50
	movi d0, #0000000000000000
	mov x9, x8
LBB152_47:
	ldr d1, [x9], #8
	fadd.2s v0, v0, v1
	subs x28, x28, #8
	b.ne LBB152_47
	stur d0, [x29, #-232]
	tbz w26, #0, LBB152_31
	b LBB152_51
LBB152_49:
	movi.2d v0, #0000000000000000
	and x24, x26, #0xffffffffffffffe
	tbnz w26, #0, LBB152_44
	b LBB152_45
LBB152_50:
	movi.2d v0, #0000000000000000
	tbz w26, #0, LBB152_31
LBB152_51:
	ldr s1, [x8, x24, lsl #2]
	fadd s0, s0, s1
	stur s0, [x29, #-232]
	b LBB152_31
LBB152_52:
	ldr x8, [sp, #112]
	cbz x8, LBB152_54
	ldr x0, [sp, #104]
	bl _free
	ldr x0, [sp, #24]
	bl _free
LBB152_54:
	ldr x8, [sp, #208]
	ldp x20, x19, [sp, #120]
	cbz x8, LBB152_56
	ldr x0, [sp, #16]
	bl _free
LBB152_56:
	ldr x8, [sp, #184]
	cbz x8, LBB152_58
	mov x0, x20
	bl _free
LBB152_58:
	ldr x8, [sp, #160]
	cbz x8, LBB152_60
	mov x0, x19
	bl _free
LBB152_60:
	ldr x8, [sp, #136]
	cbz x8, LBB152_62
	ldr x0, [sp, #8]
	bl _free
LBB152_62:
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
LBB152_63:
	.cfi_restore_state
	mov w0, #4
	mov x1, x27
	bl alloc::raw_vec::handle_error
LBB152_64:
	mov w0, #4
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB152_69
LBB152_65:
	mov w0, #4
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB152_69
LBB152_66:
	mov w0, #4
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB152_69
LBB152_67:
	mov w0, #4
	b LBB152_23
LBB152_68:
	mov w0, #4
	mov x1, x27
	bl alloc::raw_vec::handle_error
LBB152_69:
	brk #0x1
	mov x20, x0
	ldr x0, [sp, #24]
	bl _free
	b LBB152_79
	mov x20, x0
	ldr x8, [sp, #112]
	cbz x8, LBB152_83
	mov x0, x24
	bl _free
	b LBB152_74
	mov x20, x0
	ldr x8, [sp, #112]
	cbz x8, LBB152_83
LBB152_74:
	mov x0, x23
	bl _free
	mov x0, x19
	bl _free
	mov x0, x20
	bl __Unwind_Resume
	mov x20, x0
	ldr x8, [sp, #112]
	cbz x8, LBB152_83
	b LBB152_88
	b LBB152_78
LBB152_78:
	mov x20, x0
LBB152_79:
	ldr x8, [sp, #208]
	cbnz x8, LBB152_84
	ldr x8, [sp, #184]
	cbnz x8, LBB152_85
LBB152_81:
	ldr x8, [sp, #160]
	cbnz x8, LBB152_86
LBB152_82:
	ldr x8, [sp, #136]
	cbnz x8, LBB152_87
LBB152_83:
	mov x0, x20
	bl __Unwind_Resume
LBB152_84:
	ldr x0, [sp, #216]
	bl _free
	ldr x8, [sp, #184]
	cbz x8, LBB152_81
LBB152_85:
	ldr x0, [sp, #192]
	bl _free
	ldr x8, [sp, #160]
	cbz x8, LBB152_82
LBB152_86:
	ldr x0, [sp, #168]
	bl _free
	ldr x8, [sp, #136]
	cbz x8, LBB152_83
LBB152_87:
	ldr x19, [sp, #144]
LBB152_88:
	mov x0, x19
	bl _free
	mov x0, x20
	bl __Unwind_Resume
