<engine::force::PairwiseGravity<f32> as engine::force::Force<f32>>::accumulate:
Lfunc_begin157:
	.cfi_startproc
	.cfi_personality 155, _rust_eh_personality
	.cfi_lsda 16, Lexception47
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
	ldr x4, [x1, #16]
	lsl x21, x4, #2
	lsr x8, x4, #62
	mov x9, #-3
	movk x9, #32767, lsl #48
	cmp x21, x9
	ccmp x8, #0, #0, lo
	b.eq LBB157_2
	mov x0, #0
	mov x1, x21
	bl alloc::raw_vec::handle_error
LBB157_2:
	mov x27, x0
	stp x3, x2, [sp, #104]
	str x4, [sp, #128]
	cbz x21, LBB157_8
	mov x23, x4
	mov x19, x1
	mov x0, x21
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB157_67
	mov x25, x0
	mov x0, x21
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB157_68
	mov x20, x0
	mov x0, x21
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB157_69
	mov x22, x0
	mov x0, x21
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB157_70
	mov x1, x19
	mov x4, x23
	b LBB157_9
LBB157_8:
	mov w22, #4
	mov w25, #4
	mov w20, #4
	mov w0, #4
LBB157_9:
	stp x4, x25, [sp, #144]
	stp xzr, x4, [sp, #160]
	stp x20, xzr, [sp, #176]
	stp x4, x22, [sp, #192]
	stp xzr, x4, [sp, #208]
	stp x0, xzr, [sp, #224]
	ldr x8, [x1, #64]
	cmp x8, x4
	csel x19, x8, x4, lo
	cbz x19, LBB157_24
	str x27, [sp, #96]
	str x21, [sp, #120]
	mov x23, #0
	ldr x8, [x1, #8]
	ldr x21, [x1, #56]
	add x22, x8, #4
	fmov s8, #1.00000000
	movi.2d v9, #0000000000000000
	b LBB157_12
LBB157_11:
	add x22, x22, #8
	ldr x0, [sp, #224]
	str s10, [x0, x23, lsl #2]
	add x26, x23, #1
	str x26, [sp, #232]
	mov x23, x24
	cmp x19, x24
	b.eq LBB157_21
LBB157_12:
	ldp s12, s11, [x22, #-4]
	ldr s10, [x21, x23, lsl #2]
	ldr x8, [sp, #144]
	cmp x23, x8
	b.ne LBB157_15
	add x0, sp, #144
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
	ldr x25, [sp, #152]
LBB157_15:
	add x24, x23, #1
	str s12, [x25, x23, lsl #2]
	str x24, [sp, #160]
	ldr x20, [sp, #184]
	ldr x8, [sp, #168]
	cmp x20, x8
	b.ne LBB157_17
	add x0, sp, #168
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
LBB157_17:
	ldr x8, [sp, #176]
	str x8, [sp, #136]
	str s11, [x8, x20, lsl #2]
	add x20, x20, #1
	str x20, [sp, #184]
	fdiv s0, s8, s10
	fcmp s10, #0.0
	fcsel s11, s9, s0, eq
	ldr x23, [sp, #208]
	ldr x8, [sp, #192]
	cmp x23, x8
	b.ne LBB157_19
	add x0, sp, #192
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
LBB157_19:
	ldr x8, [sp, #200]
	mov x27, x8
	str s11, [x8, x23, lsl #2]
	add x28, x23, #1
	str x28, [sp, #208]
	ldr x23, [sp, #232]
	ldr x8, [sp, #216]
	cmp x23, x8
	b.ne LBB157_11
	add x0, sp, #216
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
	b LBB157_11
LBB157_21:
	ldp x21, x4, [sp, #120]
	mov x22, x27
	ldr x27, [sp, #96]
	lsr x8, x4, #61
	cbz x8, LBB157_25
LBB157_22:
	mov x25, #0
LBB157_23:
	mov x0, x25
	mov x1, x21
	bl alloc::raw_vec::handle_error
	b LBB157_72
LBB157_24:
	str x20, [sp, #136]
	mov x26, #0
	mov x28, #0
	mov x20, #0
	mov x24, #0
	lsr x8, x4, #61
	cbnz x8, LBB157_22
LBB157_25:
	ldp s8, s9, [x27]
	cbz x4, LBB157_29
	mov x23, x4
	mov x19, x0
	mov w25, #4
	mov x0, x21
	mov w1, #4
	bl __rustc::__rdl_alloc_zeroed
	str x0, [sp, #32]
	cbz x0, LBB157_23
	mov x0, x21
	mov w1, #4
	bl __rustc::__rdl_alloc_zeroed
	str x0, [sp, #120]
	cbz x0, LBB157_71
	mov x0, x19
	mov x4, x23
	b LBB157_30
LBB157_29:
	mov w8, #4
	str x8, [sp, #32]
	mov w8, #4
	str x8, [sp, #120]
LBB157_30:
	ldr x25, [sp, #152]
	stp x0, x22, [sp, #16]
	mov x11, x0
	mov x8, x22
	ldr x9, [sp, #136]
	str x25, [sp, #8]
	ldp x17, x12, [sp, #104]
	b LBB157_32
LBB157_31:
	sub x0, x29, #240
	mov w1, #4
	bl engine::force::tree_sum::<f32>
	ldr q1, [sp, #48]
	mov.s v1[1], v0[0]
	ldr q0, [sp, #64]
	fmul.2s v0, v1, v0[0]
	ldr d1, [x22]
	ldp x2, x1, [sp, #104]
	mov x28, x1
	mov x8, x2
	fadd.2s v0, v0, v1
	str d0, [x22]
	ldp x11, x3, [sp, #88]
	mov x20, x3
	ldr x5, [sp, #40]
	mov x9, x5
	mov x17, x23
	mov x12, x21
	ldr x4, [sp, #128]
LBB157_32:
	mov x10, x25
	mov x16, x24
	mov x22, x12
	add x12, x12, #8
	sub x27, x17, #1
	cmp x17, #0
	csel x23, x23, x27, eq
	csel x21, x21, x12, eq
	add x12, x25, #4
	sub x13, x24, #1
	cmp x24, #0
	csel x24, x24, x13, eq
	csel x25, x25, x12, eq
	add x12, x9, #4
	sub x13, x20, #1
	cmp x20, #0
	csel x3, x3, x13, eq
	csel x5, x5, x12, eq
	add x14, x8, #4
	sub x15, x28, #1
	cmp x28, #0
	csel x1, x1, x15, eq
	csel x2, x2, x14, eq
	cbz x26, LBB157_56
	cbz x17, LBB157_56
	cbz x16, LBB157_56
	cbz x10, LBB157_56
	cbz x20, LBB157_56
	cbz x9, LBB157_56
	cbz x28, LBB157_56
	cbz x8, LBB157_56
	str x5, [sp, #40]
	stp x3, x2, [sp, #96]
	str x1, [sp, #112]
	add x16, x11, #4
	ldr s0, [x10]
	sub x26, x26, #1
	ldr s1, [x9]
	ldr s2, [x8]
	ldr s3, [x11]
	str q3, [sp, #64]
	fmul s2, s8, s2
	stp s0, s1, [sp, #240]
	stp s2, s9, [sp, #248]
	stp x25, x24, [x29, #-240]
	stp x12, x13, [x29, #-224]
	stp x14, x15, [x29, #-208]
	str x16, [sp, #88]
	stp x16, x26, [x29, #-192]
	ldr x20, [sp, #32]
	stp x20, x4, [x29, #-168]
	ldr x8, [sp, #120]
	stp x8, x4, [x29, #-152]
	add x0, sp, #240
	sub x1, x29, #240
	add x2, x22, #8
	mov x28, x4
	sub x4, x29, #168
	mov x3, x27
	bl engine::force::pass_one::<f32>
	cmp x27, x28
	mov w8, #4
	csel x8, x8, x20, hi
	csel x9, xzr, x27, hi
	stp xzr, xzr, [x29, #-240]
	lsl x10, x9, #2
	ands x20, x10, #0x3ffffffffffffff0
	b.eq LBB157_44
	movi.2d v0, #0000000000000000
	mov x10, x20
	mov x11, x8
LBB157_42:
	ldr q1, [x11], #16
	fadd.4s v0, v0, v1
	subs x10, x10, #16
	b.ne LBB157_42
	stur q0, [x29, #-240]
LBB157_44:
	and x19, x9, #0xffffffffffffffc
	and x28, x9, #0x3
	cbz x28, LBB157_48
	add x8, x8, x19, lsl #2
	ldr s0, [x8]
	ldur s1, [x29, #-240]
	fadd s0, s0, s1
	stur s0, [x29, #-240]
	cmp x28, #1
	b.eq LBB157_48
	ldr s0, [x8, #4]
	ldur s1, [x29, #-236]
	fadd s0, s0, s1
	stur s0, [x29, #-236]
	cmp x28, #2
	b.eq LBB157_48
	ldr s0, [x8, #8]
	ldur s1, [x29, #-232]
	fadd s0, s0, s1
	stur s0, [x29, #-232]
LBB157_48:
	sub x0, x29, #240
	mov w1, #4
	bl engine::force::tree_sum::<f32>
	str q0, [sp, #48]
	ldp x8, x9, [sp, #120]
	cmp x27, x9
	mov w9, #4
	csel x8, x9, x8, hi
	stp xzr, xzr, [x29, #-240]
	cbz x20, LBB157_52
	movi.2d v0, #0000000000000000
	mov x9, x8
LBB157_50:
	ldr q1, [x9], #16
	fadd.4s v0, v0, v1
	subs x20, x20, #16
	b.ne LBB157_50
	stur q0, [x29, #-240]
LBB157_52:
	cbz x28, LBB157_31
	add x8, x8, x19, lsl #2
	ldr s0, [x8]
	ldur s1, [x29, #-240]
	fadd s0, s0, s1
	stur s0, [x29, #-240]
	cmp x28, #1
	b.eq LBB157_31
	ldr s0, [x8, #4]
	ldur s1, [x29, #-236]
	fadd s0, s0, s1
	stur s0, [x29, #-236]
	cmp x28, #2
	b.eq LBB157_31
	ldr s0, [x8, #8]
	ldur s1, [x29, #-232]
	fadd s0, s0, s1
	stur s0, [x29, #-232]
	b LBB157_31
LBB157_56:
	cbz x4, LBB157_58
	ldr x0, [sp, #120]
	mov w1, #4
	bl __rustc::__rdl_dealloc
	ldr x0, [sp, #32]
	mov w1, #4
	bl __rustc::__rdl_dealloc
LBB157_58:
	ldr x8, [sp, #216]
	ldr x19, [sp, #136]
	ldr x20, [sp, #24]
	cbz x8, LBB157_60
	ldr x0, [sp, #16]
	mov w1, #4
	bl __rustc::__rdl_dealloc
LBB157_60:
	ldr x8, [sp, #192]
	cbz x8, LBB157_62
	mov x0, x20
	mov w1, #4
	bl __rustc::__rdl_dealloc
LBB157_62:
	ldr x8, [sp, #168]
	cbz x8, LBB157_64
	mov x0, x19
	mov w1, #4
	bl __rustc::__rdl_dealloc
LBB157_64:
	ldr x8, [sp, #144]
	cbz x8, LBB157_66
	ldr x0, [sp, #8]
	mov w1, #4
	bl __rustc::__rdl_dealloc
LBB157_66:
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
LBB157_67:
	.cfi_restore_state
	mov w0, #4
	mov x1, x21
	bl alloc::raw_vec::handle_error
LBB157_68:
	mov w0, #4
	mov x1, x21
	bl alloc::raw_vec::handle_error
	b LBB157_72
LBB157_69:
	mov x19, x20
	mov w0, #4
	mov x1, x21
	bl alloc::raw_vec::handle_error
	b LBB157_72
LBB157_70:
	mov x19, x20
	mov w0, #4
	mov x1, x21
	bl alloc::raw_vec::handle_error
	b LBB157_72
LBB157_71:
	mov w0, #4
	mov x1, x21
	bl alloc::raw_vec::handle_error
LBB157_72:
	brk #0x1
	mov x20, x0
	ldr x0, [sp, #32]
	mov w1, #4
	bl __rustc::__rdl_dealloc
	b LBB157_82
	mov x20, x0
	ldr x8, [sp, #128]
	cbz x8, LBB157_86
	mov x0, x22
	mov w1, #4
	bl __rustc::__rdl_dealloc
	b LBB157_77
	mov x20, x0
	ldr x8, [sp, #128]
	cbz x8, LBB157_86
LBB157_77:
	mov x0, x19
	mov w1, #4
	bl __rustc::__rdl_dealloc
	mov x0, x25
	mov w1, #4
	bl __rustc::__rdl_dealloc
	mov x0, x20
	bl __Unwind_Resume
	mov x20, x0
	ldr x8, [sp, #128]
	cbz x8, LBB157_86
	b LBB157_91
	b LBB157_81
LBB157_81:
	mov x20, x0
LBB157_82:
	ldr x8, [sp, #216]
	cbnz x8, LBB157_87
	ldr x8, [sp, #192]
	cbnz x8, LBB157_88
LBB157_84:
	ldr x8, [sp, #168]
	cbnz x8, LBB157_89
LBB157_85:
	ldr x8, [sp, #144]
	cbnz x8, LBB157_90
LBB157_86:
	mov x0, x20
	bl __Unwind_Resume
LBB157_87:
	ldr x0, [sp, #224]
	mov w1, #4
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #192]
	cbz x8, LBB157_84
LBB157_88:
	ldr x0, [sp, #200]
	mov w1, #4
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #168]
	cbz x8, LBB157_85
LBB157_89:
	ldr x0, [sp, #176]
	mov w1, #4
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #144]
	cbz x8, LBB157_86
LBB157_90:
	ldr x25, [sp, #152]
LBB157_91:
	mov x0, x25
	mov w1, #4
	bl __rustc::__rdl_dealloc
	mov x0, x20
	bl __Unwind_Resume
