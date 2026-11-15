<engine::force::PairwiseGravity<f32> as engine::force::Force<f32>>::accumulate:
Lfunc_begin159:
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
	ldr x10, [x1, #16]
	lsl x27, x10, #2
	lsr x8, x10, #62
	mov x9, #-3
	movk x9, #32767, lsl #48
	cmp x27, x9
	ccmp x8, #0, #0, lo
	b.eq LBB159_2
	mov x0, #0
	mov x1, x27
	bl alloc::raw_vec::handle_error
LBB159_2:
	mov x24, x3
	mov x23, x0
	str x2, [sp, #112]
	cbz x27, LBB159_8
	mov x22, x10
	mov x19, x1
	mov x0, x27
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB159_51
	mov x25, x0
	mov x0, x27
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB159_52
	mov x20, x0
	mov x0, x27
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB159_53
	mov x21, x0
	mov x0, x27
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB159_54
	mov x1, x19
	mov x10, x22
	b LBB159_9
LBB159_8:
	mov w21, #4
	mov w25, #4
	mov w20, #4
	mov w0, #4
LBB159_9:
	str x23, [sp, #104]
	stp x10, x25, [sp, #136]
	stp xzr, x10, [sp, #152]
	stp x20, xzr, [sp, #168]
	stp x10, x21, [sp, #184]
	stp xzr, x10, [sp, #200]
	stp x0, xzr, [sp, #216]
	ldr x8, [x1, #64]
	cmp x8, x10
	csel x19, x8, x10, lo
	str x10, [sp, #40]
	cbz x19, LBB159_24
	str x24, [sp, #96]
	mov x24, #0
	ldr x8, [x1, #8]
	ldr x20, [x1, #56]
	add x21, x8, #4
	fmov s8, #1.00000000
	movi.2d v9, #0000000000000000
	b LBB159_12
LBB159_11:
	add x21, x21, #8
	ldr x0, [sp, #216]
	str s10, [x0, x23, lsl #2]
	add x23, x23, #1
	str x23, [sp, #224]
	mov x24, x22
	cmp x19, x22
	b.eq LBB159_21
LBB159_12:
	ldp s12, s11, [x21, #-4]
	ldr s10, [x20, x24, lsl #2]
	ldr x8, [sp, #136]
	cmp x24, x8
	b.ne LBB159_15
	add x0, sp, #136
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
	ldr x25, [sp, #144]
LBB159_15:
	add x22, x24, #1
	str s12, [x25, x24, lsl #2]
	str x22, [sp, #152]
	ldr x23, [sp, #176]
	ldr x8, [sp, #160]
	cmp x23, x8
	b.ne LBB159_17
	add x0, sp, #160
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
LBB159_17:
	ldr x8, [sp, #168]
	str x8, [sp, #128]
	str s11, [x8, x23, lsl #2]
	add x28, x23, #1
	str x28, [sp, #176]
	fdiv s0, s8, s10
	fcmp s10, #0.0
	fcsel s11, s9, s0, eq
	ldr x23, [sp, #200]
	ldr x8, [sp, #184]
	cmp x23, x8
	b.ne LBB159_19
	add x0, sp, #184
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
LBB159_19:
	ldr x8, [sp, #192]
	str x8, [sp, #120]
	str s11, [x8, x23, lsl #2]
	add x26, x23, #1
	str x26, [sp, #200]
	ldr x23, [sp, #224]
	ldr x8, [sp, #208]
	cmp x23, x8
	b.ne LBB159_11
	add x0, sp, #208
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
	b LBB159_11
LBB159_21:
	ldr x10, [sp, #40]
	ldr x24, [sp, #96]
	lsr x8, x10, #61
	cbz x8, LBB159_25
LBB159_22:
	mov x25, #0
LBB159_23:
	mov x0, x25
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB159_56
LBB159_24:
	stp x21, x20, [sp, #120]
	mov x23, #0
	mov x26, #0
	mov x28, #0
	mov x22, #0
	lsr x8, x10, #61
	cbnz x8, LBB159_22
LBB159_25:
	ldr x8, [sp, #104]
	ldp s8, s9, [x8]
	cbz x10, LBB159_29
	mov x19, x0
	mov w25, #4
	mov x0, x27
	mov w1, #4
	bl __rustc::__rdl_alloc_zeroed
	str x0, [sp, #32]
	cbz x0, LBB159_23
	mov x0, x27
	mov w1, #4
	bl __rustc::__rdl_alloc_zeroed
	str x0, [sp, #24]
	cbz x0, LBB159_55
	mov x0, x19
	b LBB159_30
LBB159_29:
	mov w8, #4
	str x8, [sp, #32]
	mov w8, #4
	str x8, [sp, #24]
LBB159_30:
	sub x25, x23, #1
	str x0, [sp, #16]
	add x21, x0, #4
	ldr x10, [sp, #144]
	ldp x8, x9, [sp, #120]
	str x10, [sp, #8]
	ldr x11, [sp, #112]
LBB159_31:
	mov x15, x11
	add x11, x11, #8
	sub x27, x24, #1
	cmp x24, #0
	csel x19, x19, x27, eq
	csel x23, x23, x11, eq
	add x11, x10, #4
	sub x12, x22, #1
	cmp x22, #0
	csel x4, x4, x12, eq
	csel x20, x20, x11, eq
	add x11, x9, #4
	sub x12, x28, #1
	cmp x28, #0
	csel x2, x2, x12, eq
	csel x3, x3, x11, eq
	add x13, x8, #4
	sub x14, x26, #1
	cmp x26, #0
	csel x0, x0, x14, eq
	csel x1, x1, x13, eq
	cmn x25, #1
	b.eq LBB159_40
	cbz x24, LBB159_40
	cbz x22, LBB159_40
	cbz x10, LBB159_40
	cbz x28, LBB159_40
	cbz x9, LBB159_40
	cbz x26, LBB159_40
	cbz x8, LBB159_40
	ldr s0, [x10]
	ldr s1, [x9]
	ldr s2, [x8]
	ldur s3, [x21, #-4]
	str q3, [sp, #64]
	fmul s2, s8, s2
	stp s0, s1, [sp, #232]
	stp s2, s9, [sp, #240]
	stp x20, x4, [x29, #-232]
	stp x11, x12, [x29, #-216]
	stp x13, x14, [x29, #-200]
	stp x21, x25, [x29, #-184]
	ldp x26, x22, [sp, #32]
	stp x26, x22, [x29, #-168]
	ldr x28, [sp, #24]
	stp x28, x22, [x29, #-152]
	stp x1, x0, [sp, #104]
	add x0, sp, #232
	sub x1, x29, #232
	mov x24, x15
	stp x4, x2, [sp, #88]
	add x2, x15, #8
	sub x4, x29, #168
	str x3, [sp, #80]
	mov x3, x27
	bl engine::force::pass_one::<f32>
	cmp x27, x22
	mov w8, #4
	csel x0, x8, x26, hi
	csel x22, xzr, x27, hi
	csel x27, x8, x28, hi
	mov x1, x22
	bl engine::force::lane_sum::<f32>
	str q0, [sp, #48]
	mov x0, x27
	mov x1, x22
	bl engine::force::lane_sum::<f32>
	ldp x3, x4, [sp, #80]
	ldp x2, x1, [sp, #96]
	ldr x0, [sp, #112]
	ldr q1, [sp, #48]
	mov.s v1[1], v0[0]
	ldr q0, [sp, #64]
	fmul.2s v0, v1, v0[0]
	ldr d1, [x24]
	sub x25, x25, #1
	add x21, x21, #4
	mov x26, x0
	mov x8, x1
	mov x28, x2
	mov x9, x3
	fadd.2s v0, v0, v1
	str d0, [x24]
	mov x22, x4
	mov x10, x20
	mov x24, x19
	mov x11, x23
	b LBB159_31
LBB159_40:
	ldr x8, [sp, #40]
	cbz x8, LBB159_42
	ldr x0, [sp, #24]
	mov w1, #4
	bl __rustc::__rdl_dealloc
	ldr x0, [sp, #32]
	mov w1, #4
	bl __rustc::__rdl_dealloc
LBB159_42:
	ldr x8, [sp, #208]
	ldp x20, x19, [sp, #120]
	cbz x8, LBB159_44
	ldr x0, [sp, #16]
	mov w1, #4
	bl __rustc::__rdl_dealloc
LBB159_44:
	ldr x8, [sp, #184]
	cbz x8, LBB159_46
	mov x0, x20
	mov w1, #4
	bl __rustc::__rdl_dealloc
LBB159_46:
	ldr x8, [sp, #160]
	cbz x8, LBB159_48
	mov x0, x19
	mov w1, #4
	bl __rustc::__rdl_dealloc
LBB159_48:
	ldr x8, [sp, #136]
	cbz x8, LBB159_50
	ldr x0, [sp, #8]
	mov w1, #4
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
LBB159_50:
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
LBB159_51:
	.cfi_restore_state
	mov w0, #4
	mov x1, x27
	bl alloc::raw_vec::handle_error
LBB159_52:
	mov x24, x22
	mov w0, #4
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB159_56
LBB159_53:
	mov x19, x20
	mov x24, x22
	mov w0, #4
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB159_56
LBB159_54:
	mov x19, x20
	mov x24, x22
	mov w0, #4
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB159_56
LBB159_55:
	mov w0, #4
	mov x1, x27
	bl alloc::raw_vec::handle_error
LBB159_56:
	brk #0x1
	mov x20, x0
	ldr x0, [sp, #32]
	mov w1, #4
	bl __rustc::__rdl_dealloc
	b LBB159_66
	mov x20, x0
	cbz x24, LBB159_70
	mov x0, x21
	mov w1, #4
	bl __rustc::__rdl_dealloc
	b LBB159_61
	mov x20, x0
	cbz x24, LBB159_70
LBB159_61:
	mov x0, x19
	mov w1, #4
	bl __rustc::__rdl_dealloc
	mov x0, x25
	mov w1, #4
	bl __rustc::__rdl_dealloc
	mov x0, x20
	bl __Unwind_Resume
	mov x20, x0
	cbz x24, LBB159_70
	b LBB159_75
	b LBB159_65
LBB159_65:
	mov x20, x0
LBB159_66:
	ldr x8, [sp, #208]
	cbnz x8, LBB159_71
	ldr x8, [sp, #184]
	cbnz x8, LBB159_72
LBB159_68:
	ldr x8, [sp, #160]
	cbnz x8, LBB159_73
LBB159_69:
	ldr x8, [sp, #136]
	cbnz x8, LBB159_74
LBB159_70:
	mov x0, x20
	bl __Unwind_Resume
LBB159_71:
	ldr x0, [sp, #216]
	mov w1, #4
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #184]
	cbz x8, LBB159_68
LBB159_72:
	ldr x0, [sp, #192]
	mov w1, #4
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #160]
	cbz x8, LBB159_69
LBB159_73:
	ldr x0, [sp, #168]
	mov w1, #4
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #136]
	cbz x8, LBB159_70
LBB159_74:
	ldr x25, [sp, #144]
LBB159_75:
	mov x0, x25
	mov w1, #4
	bl __rustc::__rdl_dealloc
	mov x0, x20
	bl __Unwind_Resume
