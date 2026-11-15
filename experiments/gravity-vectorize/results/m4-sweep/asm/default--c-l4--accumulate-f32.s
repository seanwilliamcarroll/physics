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
	ldr x21, [x1, #16]
	lsl x26, x21, #2
	lsr x8, x21, #62
	mov x9, #-3
	movk x9, #32767, lsl #48
	cmp x26, x9
	ccmp x8, #0, #0, lo
	b.eq LBB152_2
	bl alloc::raw_vec::capacity_overflow
LBB152_2:
	stp x2, x21, [sp, #96]
	stp x3, x26, [sp, #80]
	cbz x26, LBB152_8
	mov x28, x0
	mov x19, x1
	mov x0, x26
	bl _malloc
	cbz x0, LBB152_67
	mov x27, x0
	mov x0, x26
	bl _malloc
	cbz x0, LBB152_68
	mov x24, x0
	mov x0, x26
	bl _malloc
	cbz x0, LBB152_69
	mov x25, x0
	mov x0, x26
	bl _malloc
	cbz x0, LBB152_70
	mov x22, x0
	mov x1, x19
	mov x9, x27
	mov x0, x28
	b LBB152_9
LBB152_8:
	mov w25, #4
	mov w9, #4
	mov w24, #4
	mov w22, #4
LBB152_9:
	str x0, [sp, #72]
	stp x21, x9, [sp, #128]
	stp xzr, x21, [sp, #144]
	stp x24, xzr, [sp, #160]
	stp x21, x25, [sp, #176]
	stp xzr, x21, [sp, #192]
	stp x22, xzr, [sp, #208]
	ldr x8, [x1, #64]
	cmp x8, x21
	csel x27, x8, x21, lo
	cbz x27, LBB152_24
	mov x21, x9
	mov x25, #0
	ldr x8, [x1, #8]
	ldr x9, [x1, #56]
	str x9, [sp, #112]
	add x24, x8, #4
	fmov s8, #1.00000000
	movi.2d v9, #0000000000000000
	b LBB152_12
LBB152_11:
	add x24, x24, #8
	ldr x22, [sp, #208]
	str s10, [x22, x25, lsl #2]
	add x26, x25, #1
	str x26, [sp, #216]
	mov x25, x20
	cmp x27, x20
	b.eq LBB152_21
LBB152_12:
	ldp s12, s11, [x24, #-4]
	ldr x8, [sp, #112]
	ldr s10, [x8, x25, lsl #2]
	ldr x8, [sp, #128]
	cmp x25, x8
	mov x8, x21
	b.ne LBB152_15
	add x0, sp, #128
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
	ldr x8, [sp, #136]
LBB152_15:
	add x20, x25, #1
	mov x21, x8
	str s12, [x8, x25, lsl #2]
	str x20, [sp, #144]
	ldr x19, [sp, #168]
	ldr x8, [sp, #152]
	cmp x19, x8
	b.ne LBB152_17
	add x0, sp, #152
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
LBB152_17:
	ldr x8, [sp, #160]
	str x8, [sp, #120]
	str s11, [x8, x19, lsl #2]
	add x19, x19, #1
	str x19, [sp, #168]
	fdiv s0, s8, s10
	fcmp s10, #0.0
	fcsel s11, s9, s0, eq
	ldr x22, [sp, #192]
	ldr x8, [sp, #176]
	cmp x22, x8
	b.ne LBB152_19
	add x0, sp, #176
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
LBB152_19:
	ldr x8, [sp, #184]
	mov x23, x8
	str s11, [x8, x22, lsl #2]
	add x28, x22, #1
	str x28, [sp, #192]
	ldr x25, [sp, #216]
	ldr x8, [sp, #200]
	cmp x25, x8
	b.ne LBB152_11
	add x0, sp, #200
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
	b LBB152_11
LBB152_21:
	ldp x27, x21, [sp, #96]
	mov x25, x23
	lsr x8, x21, #61
	cbz x8, LBB152_25
LBB152_22:
	mov x0, #0
LBB152_23:
	ldr x1, [sp, #88]
	bl alloc::raw_vec::handle_error
	b LBB152_71
LBB152_24:
	str x24, [sp, #120]
	mov x26, #0
	mov x28, #0
	mov x19, #0
	mov x20, #0
	lsr x8, x21, #61
	ldr x27, [sp, #96]
	cbnz x8, LBB152_22
LBB152_25:
	ldr x8, [sp, #72]
	ldp s8, s9, [x8]
	cbz x21, LBB152_29
	ldr x21, [sp, #88]
	mov x0, x21
	mov w1, #1
	bl _calloc
	str x0, [sp, #16]
	cbz x0, LBB152_72
	mov x0, x21
	mov w1, #1
	bl _calloc
	str x0, [sp, #112]
	cbnz x0, LBB152_30
	mov w0, #4
	mov x1, x21
	bl alloc::raw_vec::handle_error
	b LBB152_71
LBB152_29:
	mov w8, #4
	str x8, [sp, #16]
	mov w8, #4
	str x8, [sp, #112]
LBB152_30:
	ldr x23, [sp, #136]
	mov x11, x22
	stp x23, x25, [sp]
	mov x8, x25
	ldr x9, [sp, #120]
	ldr x17, [sp, #80]
	b LBB152_32
LBB152_31:
	add x0, sp, #240
	mov w1, #4
	bl engine::force::tree_sum::<f32>
	ldr q1, [sp, #32]
	mov.s v1[1], v0[0]
	ldr q0, [sp, #48]
	fmul.2s v0, v1, v0[0]
	ldr d1, [x25]
	ldp x1, x0, [sp, #88]
	mov x28, x0
	mov x8, x1
	fadd.2s v0, v0, v1
	str d0, [x25]
	ldp x3, x2, [sp, #72]
	mov x19, x2
	mov x9, x3
	ldr x4, [sp, #24]
	mov x17, x4
	mov x27, x21
	ldr x11, [sp, #64]
LBB152_32:
	mov x10, x23
	mov x16, x20
	mov x25, x27
	add x12, x27, #8
	sub x27, x17, #1
	cmp x17, #0
	csel x4, x4, x27, eq
	csel x21, x21, x12, eq
	add x12, x23, #4
	sub x13, x20, #1
	cmp x20, #0
	csel x20, x20, x13, eq
	csel x23, x23, x12, eq
	add x12, x9, #4
	sub x13, x19, #1
	cmp x19, #0
	csel x2, x2, x13, eq
	csel x3, x3, x12, eq
	add x14, x8, #4
	sub x15, x28, #1
	cmp x28, #0
	csel x0, x0, x15, eq
	csel x1, x1, x14, eq
	cbz x26, LBB152_56
	cbz x17, LBB152_56
	cbz x16, LBB152_56
	cbz x10, LBB152_56
	cbz x19, LBB152_56
	cbz x9, LBB152_56
	cbz x28, LBB152_56
	cbz x8, LBB152_56
	str x4, [sp, #24]
	stp x3, x2, [sp, #72]
	stp x1, x0, [sp, #88]
	add x16, x11, #4
	ldr s0, [x10]
	sub x26, x26, #1
	ldr s1, [x9]
	ldr s2, [x8]
	ldr s3, [x11]
	str q3, [sp, #48]
	fmul s2, s8, s2
	stp s0, s1, [sp, #224]
	stp s2, s9, [sp, #232]
	stp x23, x20, [sp, #240]
	stp x12, x13, [sp, #256]
	stp x14, x15, [sp, #272]
	str x16, [sp, #64]
	stp x16, x26, [sp, #288]
	ldr x28, [sp, #16]
	ldp x19, x8, [sp, #104]
	stp x28, x19, [x29, #-168]
	stp x8, x19, [x29, #-152]
	add x0, sp, #224
	add x1, sp, #240
	add x2, x25, #8
	sub x4, x29, #168
	mov x3, x27
	bl engine::force::pass_one::<f32>
	cmp x27, x19
	mov w8, #4
	csel x8, x8, x28, hi
	csel x9, xzr, x27, hi
	stp xzr, xzr, [sp, #240]
	lsl x10, x9, #2
	ands x19, x10, #0x3ffffffffffffff0
	b.eq LBB152_44
	movi.2d v0, #0000000000000000
	mov x10, x19
	mov x11, x8
LBB152_42:
	ldr q1, [x11], #16
	fadd.4s v0, v0, v1
	subs x10, x10, #16
	b.ne LBB152_42
	str q0, [sp, #240]
LBB152_44:
	and x24, x9, #0xffffffffffffffc
	and x28, x9, #0x3
	cbz x28, LBB152_48
	add x8, x8, x24, lsl #2
	ldr s0, [x8]
	ldr s1, [sp, #240]
	fadd s0, s0, s1
	str s0, [sp, #240]
	cmp x28, #1
	b.eq LBB152_48
	ldr s0, [x8, #4]
	ldr s1, [sp, #244]
	fadd s0, s0, s1
	str s0, [sp, #244]
	cmp x28, #2
	b.eq LBB152_48
	ldr s0, [x8, #8]
	ldr s1, [sp, #248]
	fadd s0, s0, s1
	str s0, [sp, #248]
LBB152_48:
	add x0, sp, #240
	mov w1, #4
	bl engine::force::tree_sum::<f32>
	str q0, [sp, #32]
	ldp x9, x8, [sp, #104]
	cmp x27, x9
	mov w9, #4
	csel x8, x9, x8, hi
	stp xzr, xzr, [sp, #240]
	cbz x19, LBB152_52
	movi.2d v0, #0000000000000000
	mov x9, x8
LBB152_50:
	ldr q1, [x9], #16
	fadd.4s v0, v0, v1
	subs x19, x19, #16
	b.ne LBB152_50
	str q0, [sp, #240]
LBB152_52:
	cbz x28, LBB152_31
	add x8, x8, x24, lsl #2
	ldr s0, [x8]
	ldr s1, [sp, #240]
	fadd s0, s0, s1
	str s0, [sp, #240]
	cmp x28, #1
	b.eq LBB152_31
	ldr s0, [x8, #4]
	ldr s1, [sp, #244]
	fadd s0, s0, s1
	str s0, [sp, #244]
	cmp x28, #2
	b.eq LBB152_31
	ldr s0, [x8, #8]
	ldr s1, [sp, #248]
	fadd s0, s0, s1
	str s0, [sp, #248]
	b LBB152_31
LBB152_56:
	ldr x8, [sp, #104]
	cbz x8, LBB152_58
	ldr x0, [sp, #112]
	bl _free
	ldr x0, [sp, #16]
	bl _free
LBB152_58:
	ldr x8, [sp, #200]
	ldr x19, [sp, #120]
	ldr x20, [sp, #8]
	cbz x8, LBB152_60
	mov x0, x22
	bl _free
LBB152_60:
	ldr x8, [sp, #176]
	cbz x8, LBB152_62
	mov x0, x20
	bl _free
LBB152_62:
	ldr x8, [sp, #152]
	cbz x8, LBB152_64
	mov x0, x19
	bl _free
LBB152_64:
	ldr x8, [sp, #128]
	cbz x8, LBB152_66
	ldr x0, [sp]
	bl _free
LBB152_66:
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
LBB152_67:
	.cfi_restore_state
	mov w0, #4
	mov x1, x26
	bl alloc::raw_vec::handle_error
LBB152_68:
	mov w0, #4
	mov x1, x26
	bl alloc::raw_vec::handle_error
	b LBB152_71
LBB152_69:
	mov w0, #4
	mov x1, x26
	bl alloc::raw_vec::handle_error
	b LBB152_71
LBB152_70:
	mov w0, #4
	mov x1, x26
	bl alloc::raw_vec::handle_error
LBB152_71:
	brk #0x1
LBB152_72:
	mov w0, #4
	b LBB152_23
	mov x19, x0
	ldr x0, [sp, #16]
	bl _free
	b LBB152_82
	mov x19, x0
	ldr x8, [sp, #104]
	cbz x8, LBB152_86
	mov x0, x25
	bl _free
	b LBB152_77
	mov x19, x0
	ldr x8, [sp, #104]
	cbz x8, LBB152_86
LBB152_77:
	mov x0, x24
	bl _free
	mov x0, x27
	bl _free
	mov x0, x19
	bl __Unwind_Resume
	mov x19, x0
	ldr x8, [sp, #104]
	mov x0, x27
	cbz x8, LBB152_86
	b LBB152_91
	b LBB152_81
LBB152_81:
	mov x19, x0
LBB152_82:
	ldr x8, [sp, #200]
	cbnz x8, LBB152_87
	ldr x8, [sp, #176]
	cbnz x8, LBB152_88
LBB152_84:
	ldr x8, [sp, #152]
	cbnz x8, LBB152_89
LBB152_85:
	ldr x8, [sp, #128]
	cbnz x8, LBB152_90
LBB152_86:
	mov x0, x19
	bl __Unwind_Resume
LBB152_87:
	ldr x0, [sp, #208]
	bl _free
	ldr x8, [sp, #176]
	cbz x8, LBB152_84
LBB152_88:
	ldr x0, [sp, #184]
	bl _free
	ldr x8, [sp, #152]
	cbz x8, LBB152_85
LBB152_89:
	ldr x0, [sp, #160]
	bl _free
	ldr x8, [sp, #128]
	cbz x8, LBB152_86
LBB152_90:
	ldr x0, [sp, #136]
LBB152_91:
	bl _free
	mov x0, x19
	bl __Unwind_Resume
