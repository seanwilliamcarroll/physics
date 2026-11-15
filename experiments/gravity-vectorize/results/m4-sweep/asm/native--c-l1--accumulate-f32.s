<engine::force::PairwiseGravity<f32> as engine::force::Force<f32>>::accumulate:
Lfunc_begin155:
	.cfi_startproc
	.cfi_personality 155, _rust_eh_personality
	.cfi_lsda 16, Lexception47
	sub sp, sp, #480
	.cfi_def_cfa_offset 480
	stp d13, d12, [sp, #336]
	stp d11, d10, [sp, #352]
	stp d9, d8, [sp, #368]
	stp x28, x27, [sp, #384]
	stp x26, x25, [sp, #400]
	stp x24, x23, [sp, #416]
	stp x22, x21, [sp, #432]
	stp x20, x19, [sp, #448]
	stp x29, x30, [sp, #464]
	add x29, sp, #464
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
	lsl x27, x20, #2
	lsr x8, x20, #62
	mov x9, #-3
	movk x9, #32767, lsl #48
	cmp x27, x9
	ccmp x8, #0, #0, lo
	b.eq LBB155_2
	mov x0, #0
	mov x1, x27
	bl alloc::raw_vec::handle_error
LBB155_2:
	mov x24, x0
	str x3, [sp, #88]
	str x2, [sp, #112]
	str x20, [sp, #32]
	cbz x27, LBB155_8
	mov x19, x1
	mov x0, x27
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB155_58
	mov x21, x0
	mov x0, x27
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB155_59
	mov x22, x0
	mov x0, x27
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB155_60
	mov x23, x0
	mov x0, x27
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB155_61
	mov x1, x19
	b LBB155_9
LBB155_8:
	mov w23, #4
	mov w21, #4
	mov w22, #4
	mov w0, #4
LBB155_9:
	str x24, [sp, #80]
	stp x20, x21, [sp, #120]
	stp xzr, x20, [sp, #136]
	stp x22, xzr, [sp, #152]
	stp x20, x23, [sp, #168]
	stp xzr, x20, [sp, #184]
	stp x0, xzr, [sp, #200]
	ldr x8, [x1, #64]
	cmp x8, x20
	csel x26, x8, x20, lo
	cbz x26, LBB155_21
	mov x19, #0
	ldr x8, [x1, #8]
	ldr x22, [x1, #56]
	add x23, x8, #4
	fmov s8, #1.00000000
	movi.2d v9, #0000000000000000
	b LBB155_12
LBB155_11:
	add x23, x23, #8
	ldr x0, [sp, #200]
	str s10, [x0, x19, lsl #2]
	add x24, x19, #1
	str x24, [sp, #208]
	mov x19, x20
	cmp x26, x20
	b.eq LBB155_22
LBB155_12:
	ldp s12, s11, [x23, #-4]
	ldr s10, [x22, x19, lsl #2]
	ldr x8, [sp, #120]
	cmp x19, x8
	b.ne LBB155_15
	add x0, sp, #120
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
	ldr x21, [sp, #128]
LBB155_15:
	add x20, x19, #1
	str s12, [x21, x19, lsl #2]
	str x20, [sp, #136]
	ldr x19, [sp, #160]
	ldr x8, [sp, #144]
	cmp x19, x8
	b.ne LBB155_17
	add x0, sp, #144
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
LBB155_17:
	ldr x8, [sp, #152]
	str x8, [sp, #104]
	str s11, [x8, x19, lsl #2]
	add x28, x19, #1
	str x28, [sp, #160]
	fdiv s0, s8, s10
	fcmp s10, #0.0
	fcsel s11, s9, s0, eq
	ldr x19, [sp, #184]
	ldr x8, [sp, #168]
	cmp x19, x8
	b.ne LBB155_19
	add x0, sp, #168
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
LBB155_19:
	ldr x8, [sp, #176]
	str x8, [sp, #96]
	str s11, [x8, x19, lsl #2]
	add x25, x19, #1
	str x25, [sp, #184]
	ldr x19, [sp, #208]
	ldr x8, [sp, #192]
	cmp x19, x8
	b.ne LBB155_11
	add x0, sp, #192
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
	b LBB155_11
LBB155_21:
	stp x23, x22, [sp, #96]
	mov x24, #0
	mov x25, #0
	mov x28, #0
	mov x20, #0
LBB155_22:
	ldr x9, [sp, #32]
	lsr x8, x9, #61
	cbz x8, LBB155_25
	mov x26, #0
LBB155_24:
	mov x0, x26
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB155_63
LBB155_25:
	ldr x8, [sp, #80]
	ldp s8, s9, [x8]
	cbz x9, LBB155_29
	mov x19, x0
	mov w26, #4
	mov x0, x27
	mov w1, #4
	bl __rustc::__rdl_alloc_zeroed
	str x0, [sp, #24]
	cbz x0, LBB155_24
	mov x0, x27
	mov w1, #4
	bl __rustc::__rdl_alloc_zeroed
	str x0, [sp, #40]
	cbz x0, LBB155_62
	mov x0, x19
	b LBB155_30
LBB155_29:
	mov w8, #4
	str x8, [sp, #24]
	mov w8, #4
	str x8, [sp, #40]
LBB155_30:
	ldr x11, [sp, #128]
	stp x11, x0, [sp, #8]
	mov x8, x0
	ldp x9, x10, [sp, #96]
	ldr x12, [sp, #112]
	ldr x16, [sp, #88]
	b LBB155_33
LBB155_31:
	movi.2d v0, #0000000000000000
	movi.2d v1, #0000000000000000
	ldr x11, [sp, #112]
	ldp x1, x17, [sp, #80]
	ldr x2, [sp, #72]
LBB155_32:
	mov.s v0[1], v1[0]
	ldr q1, [sp, #48]
	fmul.2s v0, v0, v1[0]
	ldr d1, [x11]
	mov x8, x20
	mov x25, x17
	mov x9, x1
	mov x28, x2
	mov x10, x19
	fadd.2s v0, v0, v1
	str d0, [x11]
	mov x20, x23
	mov x11, x21
	mov x16, x22
	mov x12, x26
LBB155_33:
	str x12, [sp, #112]
	add x12, x12, #8
	sub x27, x16, #1
	cmp x16, #0
	csel x22, x22, x27, eq
	csel x26, x26, x12, eq
	add x12, x11, #4
	sub x13, x20, #1
	cmp x20, #0
	csel x23, x23, x13, eq
	csel x21, x21, x12, eq
	add x12, x10, #4
	sub x13, x28, #1
	cmp x28, #0
	csel x2, x2, x13, eq
	csel x19, x19, x12, eq
	add x14, x9, #4
	sub x15, x25, #1
	cmp x25, #0
	csel x17, x17, x15, eq
	csel x1, x1, x14, eq
	cbz x24, LBB155_47
	cbz x16, LBB155_47
	cbz x20, LBB155_47
	cbz x11, LBB155_47
	cbz x28, LBB155_47
	cbz x10, LBB155_47
	cbz x25, LBB155_47
	cbz x9, LBB155_47
	stp x2, x1, [sp, #72]
	str x17, [sp, #88]
	add x20, x8, #4
	ldr s0, [x11]
	sub x24, x24, #1
	ldr s1, [x10]
	ldr s2, [x9]
	ldr s3, [x8]
	str q3, [sp, #48]
	fmul s2, s8, s2
	stp s0, s1, [sp, #216]
	stp s2, s9, [sp, #224]
	stp x21, x23, [sp, #232]
	stp x12, x13, [sp, #248]
	stp x14, x15, [sp, #264]
	stp x20, x24, [sp, #280]
	ldp x28, x25, [sp, #24]
	stp x28, x25, [x29, #-168]
	ldr x8, [sp, #40]
	stp x8, x25, [x29, #-152]
	add x0, sp, #216
	add x1, sp, #232
	ldr x8, [sp, #112]
	add x2, x8, #8
	sub x4, x29, #168
	mov x3, x27
	bl engine::force::pass_one::<f32>
	cmp x27, x25
	mov w8, #4
	csel x9, x8, x28, hi
	csel x8, xzr, x27, hi
	cbz x8, LBB155_31
	lsl x8, x8, #2
	movi.2d v0, #0000000000000000
	mov x10, x8
LBB155_43:
	ldr s1, [x9], #4
	fadd s0, s0, s1
	subs x10, x10, #4
	b.ne LBB155_43
	cmp x27, x25
	ldr x9, [sp, #40]
	mov w10, #4
	csel x9, x10, x9, hi
	movi.2d v1, #0000000000000000
	ldp x1, x17, [sp, #80]
	ldr x2, [sp, #72]
LBB155_45:
	ldr s2, [x9], #4
	fadd s1, s1, s2
	subs x8, x8, #4
	b.ne LBB155_45
	ldr x11, [sp, #112]
	b LBB155_32
LBB155_47:
	ldr x8, [sp, #32]
	cbz x8, LBB155_49
	ldr x0, [sp, #40]
	mov w1, #4
	bl __rustc::__rdl_dealloc
	ldr x0, [sp, #24]
	mov w1, #4
	bl __rustc::__rdl_dealloc
LBB155_49:
	ldr x8, [sp, #192]
	ldp x20, x19, [sp, #96]
	cbz x8, LBB155_51
	ldr x0, [sp, #16]
	mov w1, #4
	bl __rustc::__rdl_dealloc
LBB155_51:
	ldr x8, [sp, #168]
	cbz x8, LBB155_53
	mov x0, x20
	mov w1, #4
	bl __rustc::__rdl_dealloc
LBB155_53:
	ldr x8, [sp, #144]
	cbz x8, LBB155_55
	mov x0, x19
	mov w1, #4
	bl __rustc::__rdl_dealloc
LBB155_55:
	ldr x8, [sp, #120]
	cbz x8, LBB155_57
	ldr x0, [sp, #8]
	mov w1, #4
	.cfi_def_cfa wsp, 480
	ldp x29, x30, [sp, #464]
	ldp x20, x19, [sp, #448]
	ldp x22, x21, [sp, #432]
	ldp x24, x23, [sp, #416]
	ldp x26, x25, [sp, #400]
	ldp x28, x27, [sp, #384]
	ldp d9, d8, [sp, #368]
	ldp d11, d10, [sp, #352]
	ldp d13, d12, [sp, #336]
	add sp, sp, #480
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
LBB155_57:
	.cfi_restore_state
	.cfi_remember_state
	.cfi_def_cfa wsp, 480
	ldp x29, x30, [sp, #464]
	ldp x20, x19, [sp, #448]
	ldp x22, x21, [sp, #432]
	ldp x24, x23, [sp, #416]
	ldp x26, x25, [sp, #400]
	ldp x28, x27, [sp, #384]
	ldp d9, d8, [sp, #368]
	ldp d11, d10, [sp, #352]
	ldp d13, d12, [sp, #336]
	add sp, sp, #480
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
LBB155_58:
	.cfi_restore_state
	mov w0, #4
	mov x1, x27
	bl alloc::raw_vec::handle_error
LBB155_59:
	mov w0, #4
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB155_63
LBB155_60:
	mov w0, #4
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB155_63
LBB155_61:
	mov w0, #4
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB155_63
LBB155_62:
	mov w0, #4
	mov x1, x27
	bl alloc::raw_vec::handle_error
LBB155_63:
	brk #0x1
	mov x20, x0
	ldr x0, [sp, #24]
	mov w1, #4
	bl __rustc::__rdl_dealloc
	b LBB155_73
	mov x20, x0
	ldr x8, [sp, #32]
	cbz x8, LBB155_77
	mov x0, x23
	mov w1, #4
	bl __rustc::__rdl_dealloc
	b LBB155_68
	mov x20, x0
	ldr x8, [sp, #32]
	cbz x8, LBB155_77
LBB155_68:
	mov x0, x22
	mov w1, #4
	bl __rustc::__rdl_dealloc
	mov x0, x21
	mov w1, #4
	bl __rustc::__rdl_dealloc
	mov x0, x20
	bl __Unwind_Resume
	mov x20, x0
	ldr x8, [sp, #32]
	cbz x8, LBB155_77
	b LBB155_82
	b LBB155_72
LBB155_72:
	mov x20, x0
LBB155_73:
	ldr x8, [sp, #192]
	cbnz x8, LBB155_78
	ldr x8, [sp, #168]
	cbnz x8, LBB155_79
LBB155_75:
	ldr x8, [sp, #144]
	cbnz x8, LBB155_80
LBB155_76:
	ldr x8, [sp, #120]
	cbnz x8, LBB155_81
LBB155_77:
	mov x0, x20
	bl __Unwind_Resume
LBB155_78:
	ldr x0, [sp, #200]
	mov w1, #4
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #168]
	cbz x8, LBB155_75
LBB155_79:
	ldr x0, [sp, #176]
	mov w1, #4
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #144]
	cbz x8, LBB155_76
LBB155_80:
	ldr x0, [sp, #152]
	mov w1, #4
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #120]
	cbz x8, LBB155_77
LBB155_81:
	ldr x21, [sp, #128]
LBB155_82:
	mov x0, x21
	mov w1, #4
	bl __rustc::__rdl_dealloc
	mov x0, x20
	bl __Unwind_Resume
