<engine::force::PairwiseGravity<f32> as engine::force::Force<f32>>::accumulate:
Lfunc_begin157:
	.cfi_startproc
	.cfi_personality 155, _rust_eh_personality
	.cfi_lsda 16, Lexception47
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
	ldr x23, [x1, #16]
	lsl x26, x23, #2
	lsr x8, x23, #62
	mov x9, #-3
	movk x9, #32767, lsl #48
	cmp x26, x9
	ccmp x8, #0, #0, lo
	b.eq LBB157_2
	mov x0, #0
	mov x1, x26
	bl alloc::raw_vec::handle_error
LBB157_2:
	str x23, [sp, #112]
	stp x3, x2, [sp, #88]
	cbz x26, LBB157_8
	mov x22, x0
	mov x19, x1
	mov x0, x26
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB157_75
	mov x21, x0
	mov x0, x26
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB157_76
	mov x27, x0
	mov x0, x26
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB157_77
	mov x20, x0
	mov x0, x26
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB157_78
	mov x11, x0
	mov x1, x19
	mov x0, x22
	b LBB157_9
LBB157_8:
	mov w20, #4
	mov w21, #4
	mov w27, #4
	mov w11, #4
LBB157_9:
	stp x23, x21, [sp, #128]
	stp xzr, x23, [sp, #144]
	stp x27, xzr, [sp, #160]
	stp x23, x20, [sp, #176]
	stp xzr, x23, [sp, #192]
	stp x11, xzr, [sp, #208]
	ldr x8, [x1, #64]
	cmp x8, x23
	csel x19, x8, x23, lo
	cbz x19, LBB157_24
	str x0, [sp, #80]
	str x26, [sp, #104]
	mov x23, #0
	ldr x8, [x1, #8]
	ldr x24, [x1, #56]
	add x26, x8, #4
	fmov s8, #1.00000000
	movi.2d v9, #0000000000000000
	b LBB157_12
LBB157_11:
	add x26, x26, #8
	ldr x11, [sp, #208]
	str s10, [x11, x23, lsl #2]
	add x25, x23, #1
	str x25, [sp, #216]
	mov x23, x22
	cmp x19, x22
	b.eq LBB157_21
LBB157_12:
	ldp s12, s11, [x26, #-4]
	ldr s10, [x24, x23, lsl #2]
	ldr x8, [sp, #128]
	cmp x23, x8
	mov x8, x21
	b.ne LBB157_15
	add x0, sp, #128
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
	ldr x8, [sp, #136]
LBB157_15:
	add x22, x23, #1
	mov x21, x8
	str s12, [x8, x23, lsl #2]
	str x22, [sp, #144]
	ldr x20, [sp, #168]
	ldr x8, [sp, #152]
	cmp x20, x8
	b.ne LBB157_17
	add x0, sp, #152
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
LBB157_17:
	ldr x8, [sp, #160]
	mov x27, x8
	str s11, [x8, x20, lsl #2]
	add x28, x20, #1
	str x28, [sp, #168]
	fdiv s0, s8, s10
	fcmp s10, #0.0
	fcsel s11, s9, s0, eq
	ldr x20, [sp, #192]
	ldr x8, [sp, #176]
	cmp x20, x8
	b.ne LBB157_19
	add x0, sp, #176
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
LBB157_19:
	ldr x8, [sp, #184]
	str x8, [sp, #120]
	str s11, [x8, x20, lsl #2]
	add x20, x20, #1
	str x20, [sp, #192]
	ldr x23, [sp, #216]
	ldr x8, [sp, #200]
	cmp x23, x8
	b.ne LBB157_11
	add x0, sp, #200
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
	b LBB157_11
LBB157_21:
	ldp x26, x23, [sp, #104]
	ldr x0, [sp, #80]
	lsr x8, x23, #61
	cbz x8, LBB157_25
LBB157_22:
	mov x24, #0
LBB157_23:
	mov x0, x24
	mov x1, x26
	bl alloc::raw_vec::handle_error
	b LBB157_80
LBB157_24:
	str x20, [sp, #120]
	mov x25, #0
	mov x20, #0
	mov x28, #0
	mov x22, #0
	lsr x8, x23, #61
	cbnz x8, LBB157_22
LBB157_25:
	ldp s8, s9, [x0]
	cbz x23, LBB157_29
	mov x19, x11
	mov w24, #4
	mov x0, x26
	mov w1, #4
	bl __rustc::__rdl_alloc_zeroed
	str x0, [sp, #24]
	cbz x0, LBB157_23
	mov x0, x26
	mov w1, #4
	bl __rustc::__rdl_alloc_zeroed
	str x0, [sp, #104]
	cbz x0, LBB157_79
	mov x11, x19
	b LBB157_30
LBB157_29:
	mov w8, #4
	str x8, [sp, #24]
	mov w8, #4
	str x8, [sp, #104]
LBB157_30:
	ldr x24, [sp, #136]
	stp x11, x24, [sp]
	ldr x8, [sp, #120]
	str x27, [sp, #16]
	mov x9, x27
	ldp x13, x12, [sp, #88]
	b LBB157_32
LBB157_31:
	add x0, sp, #240
	mov w1, #8
	bl engine::force::tree_sum::<f32>
	ldr q1, [sp, #32]
	mov.s v1[1], v0[0]
	ldr q0, [sp, #48]
	fmul.2s v0, v1, v0[0]
	ldr d1, [x19]
	ldp x1, x0, [sp, #88]
	mov x20, x0
	mov x8, x1
	fadd.2s v0, v0, v1
	str d0, [x19]
	ldp x3, x2, [sp, #72]
	mov x28, x2
	mov x9, x3
	mov x13, x26
	mov x12, x23
	ldr x11, [sp, #64]
LBB157_32:
	mov x10, x24
	mov x16, x22
	mov x19, x12
	add x12, x12, #8
	mov x17, x13
	sub x27, x13, #1
	cmp x13, #0
	csel x26, x26, x27, eq
	csel x23, x23, x12, eq
	add x12, x24, #4
	sub x13, x22, #1
	cmp x22, #0
	csel x22, x22, x13, eq
	csel x24, x24, x12, eq
	add x12, x9, #4
	sub x13, x28, #1
	cmp x28, #0
	csel x2, x2, x13, eq
	csel x3, x3, x12, eq
	add x14, x8, #4
	sub x15, x20, #1
	cmp x20, #0
	csel x0, x0, x15, eq
	csel x1, x1, x14, eq
	cbz x25, LBB157_64
	cbz x17, LBB157_64
	cbz x16, LBB157_64
	cbz x10, LBB157_64
	cbz x28, LBB157_64
	cbz x9, LBB157_64
	cbz x20, LBB157_64
	cbz x8, LBB157_64
	stp x3, x2, [sp, #72]
	stp x1, x0, [sp, #88]
	add x16, x11, #4
	ldr s0, [x10]
	sub x25, x25, #1
	ldr s1, [x9]
	ldr s2, [x8]
	ldr s3, [x11]
	str q3, [sp, #48]
	fmul s2, s8, s2
	stp s0, s1, [sp, #224]
	stp s2, s9, [sp, #232]
	stp x24, x22, [sp, #240]
	stp x12, x13, [sp, #256]
	stp x14, x15, [sp, #272]
	str x16, [sp, #64]
	stp x16, x25, [sp, #288]
	ldr x28, [sp, #24]
	ldp x8, x20, [sp, #104]
	stp x28, x20, [x29, #-168]
	stp x8, x20, [x29, #-152]
	add x0, sp, #224
	add x1, sp, #240
	add x2, x19, #8
	sub x4, x29, #168
	mov x3, x27
	bl engine::force::pass_one::<f32>
	cmp x27, x20
	mov w8, #4
	csel x8, x8, x28, hi
	csel x9, xzr, x27, hi
	movi.2d v0, #0000000000000000
	stp q0, q0, [sp, #240]
	lsl x10, x9, #2
	ands x28, x10, #0x3fffffffffffffe0
	b.eq LBB157_44
	add x10, x8, x28
	mov x11, x8
	movi.2d v1, #0000000000000000
LBB157_42:
	ldp q2, q3, [x11], #32
	fadd.4s v0, v0, v2
	fadd.4s v1, v1, v3
	cmp x11, x10
	b.ne LBB157_42
	stp q0, q1, [sp, #240]
LBB157_44:
	and x21, x9, #0xffffffffffffff8
	and x20, x9, #0x7
	cbz x20, LBB157_52
	add x8, x8, x21, lsl #2
	ldr s0, [x8]
	ldr s1, [sp, #240]
	fadd s0, s0, s1
	str s0, [sp, #240]
	cmp x20, #1
	b.eq LBB157_52
	ldr s0, [x8, #4]
	ldr s1, [sp, #244]
	fadd s0, s0, s1
	str s0, [sp, #244]
	cmp x20, #2
	b.eq LBB157_52
	ldr s0, [x8, #8]
	ldr s1, [sp, #248]
	fadd s0, s0, s1
	str s0, [sp, #248]
	cmp x20, #3
	b.eq LBB157_52
	ldr s0, [x8, #12]
	ldr s1, [sp, #252]
	fadd s0, s0, s1
	str s0, [sp, #252]
	cmp x20, #4
	b.eq LBB157_52
	ldr s0, [x8, #16]
	ldr s1, [sp, #256]
	fadd s0, s0, s1
	str s0, [sp, #256]
	cmp x20, #5
	b.eq LBB157_52
	ldr s0, [x8, #20]
	ldr s1, [sp, #260]
	fadd s0, s0, s1
	str s0, [sp, #260]
	cmp x20, #6
	b.eq LBB157_52
	ldr s0, [x8, #24]
	ldr s1, [sp, #264]
	fadd s0, s0, s1
	str s0, [sp, #264]
LBB157_52:
	add x0, sp, #240
	mov w1, #8
	bl engine::force::tree_sum::<f32>
	str q0, [sp, #32]
	ldp x8, x9, [sp, #104]
	cmp x27, x9
	mov w9, #4
	csel x8, x9, x8, hi
	movi.2d v0, #0000000000000000
	stp q0, q0, [sp, #240]
	cbz x28, LBB157_56
	add x9, x8, x28
	mov x10, x8
	movi.2d v1, #0000000000000000
LBB157_54:
	ldp q2, q3, [x10], #32
	fadd.4s v0, v0, v2
	fadd.4s v1, v1, v3
	cmp x10, x9
	b.ne LBB157_54
	stp q0, q1, [sp, #240]
LBB157_56:
	cbz x20, LBB157_31
	add x8, x8, x21, lsl #2
	ldr s0, [x8]
	ldr s1, [sp, #240]
	fadd s0, s0, s1
	str s0, [sp, #240]
	cmp x20, #1
	b.eq LBB157_31
	ldr s0, [x8, #4]
	ldr s1, [sp, #244]
	fadd s0, s0, s1
	str s0, [sp, #244]
	cmp x20, #2
	b.eq LBB157_31
	ldr s0, [x8, #8]
	ldr s1, [sp, #248]
	fadd s0, s0, s1
	str s0, [sp, #248]
	cmp x20, #3
	b.eq LBB157_31
	ldr s0, [x8, #12]
	ldr s1, [sp, #252]
	fadd s0, s0, s1
	str s0, [sp, #252]
	cmp x20, #4
	b.eq LBB157_31
	ldr s0, [x8, #16]
	ldr s1, [sp, #256]
	fadd s0, s0, s1
	str s0, [sp, #256]
	cmp x20, #5
	b.eq LBB157_31
	ldr s0, [x8, #20]
	ldr s1, [sp, #260]
	fadd s0, s0, s1
	str s0, [sp, #260]
	cmp x20, #6
	b.eq LBB157_31
	ldr s0, [x8, #24]
	ldr s1, [sp, #264]
	fadd s0, s0, s1
	str s0, [sp, #264]
	b LBB157_31
LBB157_64:
	ldr x8, [sp, #112]
	cbz x8, LBB157_66
	ldr x0, [sp, #104]
	mov w1, #4
	bl __rustc::__rdl_dealloc
	ldr x0, [sp, #24]
	mov w1, #4
	bl __rustc::__rdl_dealloc
LBB157_66:
	ldr x8, [sp, #200]
	ldr x19, [sp, #16]
	ldr x20, [sp, #120]
	cbz x8, LBB157_68
	ldr x0, [sp]
	mov w1, #4
	bl __rustc::__rdl_dealloc
LBB157_68:
	ldr x8, [sp, #176]
	cbz x8, LBB157_70
	mov x0, x20
	mov w1, #4
	bl __rustc::__rdl_dealloc
LBB157_70:
	ldr x8, [sp, #152]
	cbz x8, LBB157_72
	mov x0, x19
	mov w1, #4
	bl __rustc::__rdl_dealloc
LBB157_72:
	ldr x8, [sp, #128]
	cbz x8, LBB157_74
	ldr x0, [sp, #8]
	mov w1, #4
	bl __rustc::__rdl_dealloc
LBB157_74:
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
LBB157_75:
	.cfi_restore_state
	mov w0, #4
	mov x1, x26
	bl alloc::raw_vec::handle_error
LBB157_76:
	mov w0, #4
	mov x1, x26
	bl alloc::raw_vec::handle_error
	b LBB157_80
LBB157_77:
	mov w0, #4
	mov x1, x26
	bl alloc::raw_vec::handle_error
	b LBB157_80
LBB157_78:
	mov x19, x20
	mov w0, #4
	mov x1, x26
	bl alloc::raw_vec::handle_error
	b LBB157_80
LBB157_79:
	mov w0, #4
	mov x1, x26
	bl alloc::raw_vec::handle_error
LBB157_80:
	brk #0x1
	mov x20, x0
	ldr x0, [sp, #24]
	mov w1, #4
	bl __rustc::__rdl_dealloc
	b LBB157_90
	mov x20, x0
	ldr x8, [sp, #112]
	cbz x8, LBB157_94
	mov x0, x19
	mov w1, #4
	bl __rustc::__rdl_dealloc
	b LBB157_85
	mov x20, x0
	ldr x8, [sp, #112]
	cbz x8, LBB157_94
LBB157_85:
	mov x0, x27
	mov w1, #4
	bl __rustc::__rdl_dealloc
	mov x0, x21
	mov w1, #4
	bl __rustc::__rdl_dealloc
	mov x0, x20
	bl __Unwind_Resume
	mov x20, x0
	ldr x8, [sp, #112]
	mov x0, x21
	cbz x8, LBB157_94
	b LBB157_99
	b LBB157_89
LBB157_89:
	mov x20, x0
LBB157_90:
	ldr x8, [sp, #200]
	cbnz x8, LBB157_95
	ldr x8, [sp, #176]
	cbnz x8, LBB157_96
LBB157_92:
	ldr x8, [sp, #152]
	cbnz x8, LBB157_97
LBB157_93:
	ldr x8, [sp, #128]
	cbnz x8, LBB157_98
LBB157_94:
	mov x0, x20
	bl __Unwind_Resume
LBB157_95:
	ldr x0, [sp, #208]
	mov w1, #4
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #176]
	cbz x8, LBB157_92
LBB157_96:
	ldr x0, [sp, #184]
	mov w1, #4
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #152]
	cbz x8, LBB157_93
LBB157_97:
	ldr x0, [sp, #160]
	mov w1, #4
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #128]
	cbz x8, LBB157_94
LBB157_98:
	ldr x0, [sp, #136]
LBB157_99:
	mov w1, #4
	bl __rustc::__rdl_dealloc
	mov x0, x20
	bl __Unwind_Resume
