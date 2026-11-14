<engine::force::PairwiseGravity<f32> as engine::force::Force<f32>>::accumulate:
Lfunc_begin150:
	.cfi_startproc
	.cfi_personality 155, _rust_eh_personality
	.cfi_lsda 16, Lexception50
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
	b.eq LBB150_2
	bl alloc::raw_vec::capacity_overflow
LBB150_2:
	str x20, [sp, #24]
	stp x27, x2, [sp, #88]
	str x3, [sp, #80]
	cbz x27, LBB150_8
	mov x28, x0
	mov x19, x1
	mov x0, x27
	bl _malloc
	cbz x0, LBB150_66
	mov x23, x0
	mov x0, x27
	bl _malloc
	cbz x0, LBB150_67
	mov x24, x0
	mov x0, x27
	bl _malloc
	cbz x0, LBB150_68
	mov x25, x0
	mov x0, x27
	bl _malloc
	cbz x0, LBB150_69
	mov x22, x0
	mov x1, x19
	mov x0, x28
	b LBB150_9
LBB150_8:
	mov w25, #4
	mov w23, #4
	mov w24, #4
	mov w22, #4
LBB150_9:
	str x0, [sp, #72]
	stp x20, x23, [sp, #120]
	stp xzr, x20, [sp, #136]
	stp x24, xzr, [sp, #152]
	stp x20, x25, [sp, #168]
	stp xzr, x20, [sp, #184]
	stp x22, xzr, [sp, #200]
	ldr x8, [x1, #64]
	cmp x8, x20
	csel x27, x8, x20, lo
	cbz x27, LBB150_21
	mov x24, #0
	ldr x8, [x1, #8]
	ldr x21, [x1, #56]
	add x25, x8, #4
	fmov s8, #1.00000000
	movi.2d v9, #0000000000000000
	b LBB150_12
LBB150_11:
	add x25, x25, #8
	ldr x22, [sp, #200]
	str s10, [x22, x24, lsl #2]
	add x26, x24, #1
	str x26, [sp, #208]
	mov x24, x20
	cmp x27, x20
	b.eq LBB150_22
LBB150_12:
	ldp s12, s11, [x25, #-4]
	ldr s10, [x21, x24, lsl #2]
	ldr x8, [sp, #120]
	cmp x24, x8
	b.ne LBB150_15
	add x0, sp, #120
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
	ldr x23, [sp, #128]
LBB150_15:
	add x20, x24, #1
	str s12, [x23, x24, lsl #2]
	str x20, [sp, #136]
	ldr x19, [sp, #160]
	ldr x8, [sp, #144]
	cmp x19, x8
	b.ne LBB150_17
	add x0, sp, #144
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
LBB150_17:
	ldr x8, [sp, #152]
	str x8, [sp, #112]
	str s11, [x8, x19, lsl #2]
	add x19, x19, #1
	str x19, [sp, #160]
	fdiv s0, s8, s10
	fcmp s10, #0.0
	fcsel s11, s9, s0, eq
	ldr x22, [sp, #184]
	ldr x8, [sp, #168]
	cmp x22, x8
	b.ne LBB150_19
	add x0, sp, #168
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
LBB150_19:
	ldr x8, [sp, #176]
	str x8, [sp, #104]
	str s11, [x8, x22, lsl #2]
	add x28, x22, #1
	str x28, [sp, #184]
	ldr x24, [sp, #208]
	ldr x8, [sp, #192]
	cmp x24, x8
	b.ne LBB150_11
	add x0, sp, #192
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
	b LBB150_11
LBB150_21:
	stp x25, x24, [sp, #104]
	mov x26, #0
	mov x28, #0
	mov x19, #0
	mov x20, #0
LBB150_22:
	ldr x9, [sp, #24]
	lsr x8, x9, #61
	ldr x27, [sp, #96]
	cbz x8, LBB150_25
	mov x0, #0
LBB150_24:
	ldr x1, [sp, #88]
	bl alloc::raw_vec::handle_error
	b LBB150_70
LBB150_25:
	ldr x8, [sp, #72]
	ldp s8, s9, [x8]
	cbz x9, LBB150_29
	ldr x21, [sp, #88]
	mov x0, x21
	mov w1, #1
	bl _calloc
	str x0, [sp, #16]
	cbz x0, LBB150_71
	mov x0, x21
	mov w1, #1
	bl _calloc
	cbnz x0, LBB150_30
	mov w0, #4
	mov x1, x21
	bl alloc::raw_vec::handle_error
	b LBB150_70
LBB150_29:
	mov w8, #4
	str x8, [sp, #16]
	mov w0, #4
LBB150_30:
	ldr x23, [sp, #128]
	mov x11, x22
	ldp x8, x9, [sp, #104]
	str x23, [sp, #8]
	ldr x17, [sp, #80]
	b LBB150_33
LBB150_31:
	ldr x11, [sp, #96]
LBB150_32:
	fadd s2, s3, s2
	fadd s0, s0, s1
	fadd s0, s0, s2
	fadd s1, s7, s6
	fadd s2, s4, s5
	fadd s1, s2, s1
	mov.s v0[1], v1[0]
	ldr q1, [sp, #32]
	fmul.2s v0, v0, v1[0]
	ldr d1, [x24]
	mov x28, x1
	mov x8, x2
	fadd.2s v0, v0, v1
	str d0, [x24]
	mov x19, x3
	mov x9, x4
	mov x17, x5
	mov x27, x21
LBB150_33:
	mov x10, x23
	mov x16, x20
	mov x24, x27
	add x12, x27, #8
	sub x27, x17, #1
	cmp x17, #0
	csel x5, x5, x27, eq
	csel x21, x21, x12, eq
	add x12, x23, #4
	sub x13, x20, #1
	cmp x20, #0
	csel x20, x20, x13, eq
	csel x23, x23, x12, eq
	add x12, x9, #4
	sub x13, x19, #1
	cmp x19, #0
	csel x3, x3, x13, eq
	csel x4, x4, x12, eq
	add x14, x8, #4
	sub x15, x28, #1
	cmp x28, #0
	csel x1, x1, x15, eq
	csel x2, x2, x14, eq
	cbz x26, LBB150_55
	cbz x17, LBB150_55
	cbz x16, LBB150_55
	cbz x10, LBB150_55
	cbz x19, LBB150_55
	cbz x9, LBB150_55
	cbz x28, LBB150_55
	cbz x8, LBB150_55
	stp x5, x4, [sp, #56]
	stp x3, x2, [sp, #72]
	add x16, x11, #4
	ldr s0, [x10]
	sub x26, x26, #1
	ldr s1, [x9]
	ldr s2, [x8]
	ldr s3, [x11]
	str q3, [sp, #32]
	fmul s2, s8, s2
	stp s0, s1, [sp, #216]
	stp s2, s9, [sp, #224]
	stp x23, x20, [sp, #232]
	stp x12, x13, [sp, #248]
	stp x14, x15, [sp, #264]
	stp x1, x16, [sp, #88]
	stp x16, x26, [sp, #280]
	ldp x28, x19, [sp, #16]
	stp x28, x19, [x29, #-168]
	mov x25, x0
	stp x0, x19, [x29, #-152]
	add x0, sp, #216
	add x1, sp, #232
	add x2, x24, #8
	sub x4, x29, #168
	mov x3, x27
	bl engine::force::pass_one::<f32>
	mov w13, #4
	cmp x27, x19
	csel x11, x13, x28, hi
	csel x9, xzr, x27, hi
	lsl x8, x9, #2
	movi.2d v0, #0000000000000000
	ands x8, x8, #0x3ffffffffffffff0
	b.eq LBB150_44
	mov x10, x8
	mov x12, x11
LBB150_43:
	ldr q1, [x12], #16
	ext.16b v1, v1, v1, #12
	fadd.4s v0, v0, v1
	subs x10, x10, #16
	b.ne LBB150_43
LBB150_44:
	and x10, x9, #0xffffffffffffffc
	mov s2, v0[1]
	mov s3, v0[2]
	mov s1, v0[3]
	and x9, x9, #0x3
	mov x0, x25
	ldp x2, x1, [sp, #80]
	ldp x4, x3, [sp, #64]
	ldr x5, [sp, #56]
	cbz x9, LBB150_48
	add x11, x11, x10, lsl #2
	ldr s4, [x11]
	fadd s2, s4, s2
	cmp x9, #1
	b.eq LBB150_48
	ldr s4, [x11, #4]
	fadd s3, s4, s3
	cmp x9, #2
	b.eq LBB150_48
	ldr s4, [x11, #8]
	fadd s1, s4, s1
LBB150_48:
	cmp x27, x19
	csel x11, x13, x0, hi
	movi.2d v4, #0000000000000000
	cbz x8, LBB150_51
	mov x12, x11
LBB150_50:
	ldr q5, [x12], #16
	ext.16b v5, v5, v5, #12
	fadd.4s v4, v4, v5
	subs x8, x8, #16
	b.ne LBB150_50
LBB150_51:
	mov s6, v4[1]
	mov s7, v4[2]
	mov s5, v4[3]
	cbz x9, LBB150_31
	add x8, x11, x10, lsl #2
	ldr s16, [x8]
	fadd s6, s16, s6
	cmp x9, #1
	b.eq LBB150_31
	ldr s16, [x8, #4]
	fadd s7, s16, s7
	cmp x9, #2
	ldr x11, [sp, #96]
	b.eq LBB150_32
	ldr s16, [x8, #8]
	fadd s5, s16, s5
	b LBB150_32
LBB150_55:
	ldr x8, [sp, #24]
	cbz x8, LBB150_57
	bl _free
	ldr x0, [sp, #16]
	bl _free
LBB150_57:
	ldr x8, [sp, #192]
	ldp x20, x19, [sp, #104]
	cbz x8, LBB150_59
	mov x0, x22
	bl _free
LBB150_59:
	ldr x8, [sp, #168]
	cbz x8, LBB150_61
	mov x0, x20
	bl _free
LBB150_61:
	ldr x8, [sp, #144]
	cbz x8, LBB150_63
	mov x0, x19
	bl _free
LBB150_63:
	ldr x8, [sp, #120]
	cbz x8, LBB150_65
	ldr x0, [sp, #8]
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
	b _free
LBB150_65:
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
LBB150_66:
	.cfi_restore_state
	mov w0, #4
	mov x1, x27
	bl alloc::raw_vec::handle_error
LBB150_67:
	mov w0, #4
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB150_70
LBB150_68:
	mov w0, #4
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB150_70
LBB150_69:
	mov w0, #4
	mov x1, x27
	bl alloc::raw_vec::handle_error
LBB150_70:
	brk #0x1
LBB150_71:
	mov w0, #4
	b LBB150_24
	mov x19, x0
	ldr x0, [sp, #16]
	bl _free
	b LBB150_81
	mov x19, x0
	ldr x8, [sp, #24]
	cbz x8, LBB150_85
	mov x0, x25
	bl _free
	mov x0, x24
	bl _free
	mov x0, x23
	bl _free
	mov x0, x19
	bl __Unwind_Resume
	mov x19, x0
	ldr x8, [sp, #24]
	cbz x8, LBB150_85
	mov x0, x24
	bl _free
	mov x0, x23
	bl _free
	mov x0, x19
	bl __Unwind_Resume
	mov x19, x0
	ldr x8, [sp, #24]
	cbz x8, LBB150_85
	b LBB150_90
	b LBB150_80
LBB150_80:
	mov x19, x0
LBB150_81:
	ldr x8, [sp, #192]
	cbnz x8, LBB150_86
	ldr x8, [sp, #168]
	cbnz x8, LBB150_87
LBB150_83:
	ldr x8, [sp, #144]
	cbnz x8, LBB150_88
LBB150_84:
	ldr x8, [sp, #120]
	cbnz x8, LBB150_89
LBB150_85:
	mov x0, x19
	bl __Unwind_Resume
LBB150_86:
	ldr x0, [sp, #200]
	bl _free
	ldr x8, [sp, #168]
	cbz x8, LBB150_83
LBB150_87:
	ldr x0, [sp, #176]
	bl _free
	ldr x8, [sp, #144]
	cbz x8, LBB150_84
LBB150_88:
	ldr x0, [sp, #152]
	bl _free
	ldr x8, [sp, #120]
	cbz x8, LBB150_85
LBB150_89:
	ldr x23, [sp, #128]
LBB150_90:
	mov x0, x23
	bl _free
	mov x0, x19
	bl __Unwind_Resume
