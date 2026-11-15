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
	sub sp, sp, #368
	ldr x24, [x1, #16]
	lsl x26, x24, #2
	lsr x8, x24, #62
	mov x9, #-3
	movk x9, #32767, lsl #48
	cmp x26, x9
	ccmp x8, #0, #0, lo
	b.eq LBB152_2
	bl alloc::raw_vec::capacity_overflow
LBB152_2:
	mov x27, x2
	str x24, [sp, #120]
	str x3, [sp, #104]
	cbz x26, LBB152_8
	mov x28, x0
	mov x19, x1
	mov x0, x26
	bl _malloc
	cbz x0, LBB152_75
	mov x23, x0
	mov x0, x26
	bl _malloc
	cbz x0, LBB152_76
	mov x21, x0
	mov x0, x26
	bl _malloc
	cbz x0, LBB152_77
	mov x25, x0
	mov x0, x26
	bl _malloc
	cbz x0, LBB152_78
	mov x22, x0
	mov x1, x19
	mov x0, x28
	b LBB152_9
LBB152_8:
	mov w25, #4
	mov w23, #4
	mov w21, #4
	mov w22, #4
LBB152_9:
	str x0, [sp, #112]
	stp x24, x23, [sp, #144]
	stp xzr, x24, [sp, #160]
	stp x21, xzr, [sp, #176]
	stp x24, x25, [sp, #192]
	stp xzr, x24, [sp, #208]
	stp x22, xzr, [sp, #224]
	ldr x8, [x1, #64]
	cmp x8, x24
	csel x20, x8, x24, lo
	cbz x20, LBB152_24
	stp x26, x27, [sp, #88]
	mov x24, #0
	ldr x8, [x1, #8]
	ldr x27, [x1, #56]
	add x26, x8, #4
	fmov s8, #1.00000000
	movi.2d v9, #0000000000000000
	b LBB152_12
LBB152_11:
	add x26, x26, #8
	ldr x22, [sp, #224]
	str s10, [x22, x24, lsl #2]
	add x25, x24, #1
	str x25, [sp, #232]
	mov x24, x21
	cmp x20, x21
	b.eq LBB152_21
LBB152_12:
	ldp s12, s11, [x26, #-4]
	ldr s10, [x27, x24, lsl #2]
	ldr x8, [sp, #144]
	cmp x24, x8
	b.ne LBB152_15
	add x0, sp, #144
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
	ldr x23, [sp, #152]
LBB152_15:
	add x21, x24, #1
	str s12, [x23, x24, lsl #2]
	str x21, [sp, #160]
	ldr x19, [sp, #184]
	ldr x8, [sp, #168]
	cmp x19, x8
	b.ne LBB152_17
	add x0, sp, #168
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
LBB152_17:
	ldr x8, [sp, #176]
	str x8, [sp, #136]
	str s11, [x8, x19, lsl #2]
	add x28, x19, #1
	str x28, [sp, #184]
	fdiv s0, s8, s10
	fcmp s10, #0.0
	fcsel s11, s9, s0, eq
	ldr x19, [sp, #208]
	ldr x8, [sp, #192]
	cmp x19, x8
	b.ne LBB152_19
	add x0, sp, #192
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
LBB152_19:
	ldr x8, [sp, #200]
	str x8, [sp, #128]
	str s11, [x8, x19, lsl #2]
	add x19, x19, #1
	str x19, [sp, #208]
	ldr x24, [sp, #232]
	ldr x8, [sp, #216]
	cmp x24, x8
	b.ne LBB152_11
	add x0, sp, #216
	bl <alloc::raw_vec::RawVec<f32>>::grow_one
	b LBB152_11
LBB152_21:
	ldr x24, [sp, #120]
	ldp x26, x27, [sp, #88]
	lsr x8, x24, #61
	cbz x8, LBB152_25
LBB152_22:
	mov x0, #0
LBB152_23:
	mov x1, x26
	bl alloc::raw_vec::handle_error
	b LBB152_79
LBB152_24:
	stp x25, x21, [sp, #128]
	mov x25, #0
	mov x19, #0
	mov x28, #0
	mov x21, #0
	lsr x8, x24, #61
	cbnz x8, LBB152_22
LBB152_25:
	ldr x8, [sp, #112]
	ldp s8, s9, [x8]
	cbz x24, LBB152_29
	mov x0, x26
	mov w1, #1
	bl _calloc
	str x0, [sp, #16]
	cbz x0, LBB152_80
	mov x0, x26
	mov w1, #1
	bl _calloc
	str x0, [sp, #112]
	cbnz x0, LBB152_30
	mov w0, #4
	mov x1, x26
	bl alloc::raw_vec::handle_error
	b LBB152_79
LBB152_29:
	mov w8, #4
	str x8, [sp, #16]
	mov w8, #4
	str x8, [sp, #112]
LBB152_30:
	ldr x23, [sp, #152]
	mov x11, x22
	ldp x8, x9, [sp, #128]
	str x23, [sp, #8]
	ldr x3, [sp, #104]
	b LBB152_32
LBB152_31:
	sub x0, x29, #240
	mov w1, #8
	bl engine::force::tree_sum::<f32>
	ldr q1, [sp, #32]
	mov.s v1[1], v0[0]
	ldr q0, [sp, #48]
	fmul.2s v0, v1, v0[0]
	ldr d1, [x20]
	ldp x0, x17, [sp, #96]
	mov x19, x17
	mov x8, x0
	fadd.2s v0, v0, v1
	str d0, [x20]
	ldp x2, x1, [sp, #80]
	mov x28, x1
	mov x9, x2
	ldr x4, [sp, #24]
	mov x3, x4
	mov x27, x24
	ldr x11, [sp, #72]
LBB152_32:
	mov x10, x23
	mov x16, x21
	mov x20, x27
	add x12, x27, #8
	sub x27, x3, #1
	cmp x3, #0
	csel x4, x4, x27, eq
	csel x24, x24, x12, eq
	add x12, x23, #4
	sub x13, x21, #1
	cmp x21, #0
	csel x21, x21, x13, eq
	csel x23, x23, x12, eq
	add x12, x9, #4
	sub x13, x28, #1
	cmp x28, #0
	csel x1, x1, x13, eq
	csel x2, x2, x12, eq
	add x14, x8, #4
	sub x15, x19, #1
	cmp x19, #0
	csel x17, x17, x15, eq
	csel x0, x0, x14, eq
	cbz x25, LBB152_64
	cbz x3, LBB152_64
	cbz x16, LBB152_64
	cbz x10, LBB152_64
	cbz x28, LBB152_64
	cbz x9, LBB152_64
	cbz x19, LBB152_64
	cbz x8, LBB152_64
	str x4, [sp, #24]
	stp x2, x1, [sp, #80]
	stp x0, x17, [sp, #96]
	add x16, x11, #4
	ldr s0, [x10]
	sub x25, x25, #1
	ldr s1, [x9]
	ldr s2, [x8]
	ldr s3, [x11]
	str q3, [sp, #48]
	fmul s2, s8, s2
	stp s0, s1, [sp, #240]
	stp s2, s9, [sp, #248]
	stp x23, x21, [x29, #-240]
	stp x12, x13, [x29, #-224]
	stp x14, x15, [x29, #-208]
	str x16, [sp, #72]
	stp x16, x25, [x29, #-192]
	ldr x28, [sp, #16]
	ldp x8, x19, [sp, #112]
	stp x28, x19, [x29, #-168]
	stp x8, x19, [x29, #-152]
	add x0, sp, #240
	sub x1, x29, #240
	add x2, x20, #8
	sub x4, x29, #168
	mov x3, x27
	bl engine::force::pass_one::<f32>
	cmp x27, x19
	mov w8, #4
	csel x8, x8, x28, hi
	csel x9, xzr, x27, hi
	movi.2d v0, #0000000000000000
	stp q0, q0, [x29, #-240]
	lsl x10, x9, #2
	ands x28, x10, #0x3fffffffffffffe0
	b.eq LBB152_44
	add x10, x8, x28
	mov x11, x8
	movi.2d v1, #0000000000000000
LBB152_42:
	ldp q2, q3, [x11], #32
	fadd.4s v0, v0, v2
	fadd.4s v1, v1, v3
	cmp x11, x10
	b.ne LBB152_42
	stp q0, q1, [x29, #-240]
LBB152_44:
	and x26, x9, #0xffffffffffffff8
	and x19, x9, #0x7
	cbz x19, LBB152_52
	add x8, x8, x26, lsl #2
	ldr s0, [x8]
	ldur s1, [x29, #-240]
	fadd s0, s0, s1
	stur s0, [x29, #-240]
	cmp x19, #1
	b.eq LBB152_52
	ldr s0, [x8, #4]
	ldur s1, [x29, #-236]
	fadd s0, s0, s1
	stur s0, [x29, #-236]
	cmp x19, #2
	b.eq LBB152_52
	ldr s0, [x8, #8]
	ldur s1, [x29, #-232]
	fadd s0, s0, s1
	stur s0, [x29, #-232]
	cmp x19, #3
	b.eq LBB152_52
	ldr s0, [x8, #12]
	ldur s1, [x29, #-228]
	fadd s0, s0, s1
	stur s0, [x29, #-228]
	cmp x19, #4
	b.eq LBB152_52
	ldr s0, [x8, #16]
	ldur s1, [x29, #-224]
	fadd s0, s0, s1
	stur s0, [x29, #-224]
	cmp x19, #5
	b.eq LBB152_52
	ldr s0, [x8, #20]
	ldur s1, [x29, #-220]
	fadd s0, s0, s1
	stur s0, [x29, #-220]
	cmp x19, #6
	b.eq LBB152_52
	ldr s0, [x8, #24]
	ldur s1, [x29, #-216]
	fadd s0, s0, s1
	stur s0, [x29, #-216]
LBB152_52:
	sub x0, x29, #240
	mov w1, #8
	bl engine::force::tree_sum::<f32>
	str q0, [sp, #32]
	ldp x8, x9, [sp, #112]
	cmp x27, x9
	mov w9, #4
	csel x8, x9, x8, hi
	movi.2d v0, #0000000000000000
	stp q0, q0, [x29, #-240]
	cbz x28, LBB152_56
	add x9, x8, x28
	mov x10, x8
	movi.2d v1, #0000000000000000
LBB152_54:
	ldp q2, q3, [x10], #32
	fadd.4s v0, v0, v2
	fadd.4s v1, v1, v3
	cmp x10, x9
	b.ne LBB152_54
	stp q0, q1, [x29, #-240]
LBB152_56:
	cbz x19, LBB152_31
	add x8, x8, x26, lsl #2
	ldr s0, [x8]
	ldur s1, [x29, #-240]
	fadd s0, s0, s1
	stur s0, [x29, #-240]
	cmp x19, #1
	b.eq LBB152_31
	ldr s0, [x8, #4]
	ldur s1, [x29, #-236]
	fadd s0, s0, s1
	stur s0, [x29, #-236]
	cmp x19, #2
	b.eq LBB152_31
	ldr s0, [x8, #8]
	ldur s1, [x29, #-232]
	fadd s0, s0, s1
	stur s0, [x29, #-232]
	cmp x19, #3
	b.eq LBB152_31
	ldr s0, [x8, #12]
	ldur s1, [x29, #-228]
	fadd s0, s0, s1
	stur s0, [x29, #-228]
	cmp x19, #4
	b.eq LBB152_31
	ldr s0, [x8, #16]
	ldur s1, [x29, #-224]
	fadd s0, s0, s1
	stur s0, [x29, #-224]
	cmp x19, #5
	b.eq LBB152_31
	ldr s0, [x8, #20]
	ldur s1, [x29, #-220]
	fadd s0, s0, s1
	stur s0, [x29, #-220]
	cmp x19, #6
	b.eq LBB152_31
	ldr s0, [x8, #24]
	ldur s1, [x29, #-216]
	fadd s0, s0, s1
	stur s0, [x29, #-216]
	b LBB152_31
LBB152_64:
	ldr x8, [sp, #120]
	cbz x8, LBB152_66
	ldr x0, [sp, #112]
	bl _free
	ldr x0, [sp, #16]
	bl _free
LBB152_66:
	ldr x8, [sp, #216]
	ldp x20, x19, [sp, #128]
	cbz x8, LBB152_68
	mov x0, x22
	bl _free
LBB152_68:
	ldr x8, [sp, #192]
	cbz x8, LBB152_70
	mov x0, x20
	bl _free
LBB152_70:
	ldr x8, [sp, #168]
	cbz x8, LBB152_72
	mov x0, x19
	bl _free
LBB152_72:
	ldr x8, [sp, #144]
	cbz x8, LBB152_74
	ldr x0, [sp, #8]
	bl _free
LBB152_74:
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
LBB152_75:
	.cfi_restore_state
	mov w0, #4
	mov x1, x26
	bl alloc::raw_vec::handle_error
LBB152_76:
	mov w0, #4
	mov x1, x26
	bl alloc::raw_vec::handle_error
	b LBB152_79
LBB152_77:
	mov w0, #4
	mov x1, x26
	bl alloc::raw_vec::handle_error
	b LBB152_79
LBB152_78:
	mov w0, #4
	mov x1, x26
	bl alloc::raw_vec::handle_error
LBB152_79:
	brk #0x1
LBB152_80:
	mov w0, #4
	b LBB152_23
	mov x19, x0
	ldr x0, [sp, #16]
	bl _free
	b LBB152_90
	mov x19, x0
	ldr x8, [sp, #120]
	cbz x8, LBB152_94
	mov x0, x25
	bl _free
	b LBB152_85
	mov x19, x0
	ldr x8, [sp, #120]
	cbz x8, LBB152_94
LBB152_85:
	mov x0, x21
	bl _free
	mov x0, x23
	bl _free
	mov x0, x19
	bl __Unwind_Resume
	mov x19, x0
	ldr x8, [sp, #120]
	cbz x8, LBB152_94
	b LBB152_99
	b LBB152_89
LBB152_89:
	mov x19, x0
LBB152_90:
	ldr x8, [sp, #216]
	cbnz x8, LBB152_95
	ldr x8, [sp, #192]
	cbnz x8, LBB152_96
LBB152_92:
	ldr x8, [sp, #168]
	cbnz x8, LBB152_97
LBB152_93:
	ldr x8, [sp, #144]
	cbnz x8, LBB152_98
LBB152_94:
	mov x0, x19
	bl __Unwind_Resume
LBB152_95:
	ldr x0, [sp, #224]
	bl _free
	ldr x8, [sp, #192]
	cbz x8, LBB152_92
LBB152_96:
	ldr x0, [sp, #200]
	bl _free
	ldr x8, [sp, #168]
	cbz x8, LBB152_93
LBB152_97:
	ldr x0, [sp, #176]
	bl _free
	ldr x8, [sp, #144]
	cbz x8, LBB152_94
LBB152_98:
	ldr x23, [sp, #152]
LBB152_99:
	mov x0, x23
	bl _free
	mov x0, x19
	bl __Unwind_Resume
