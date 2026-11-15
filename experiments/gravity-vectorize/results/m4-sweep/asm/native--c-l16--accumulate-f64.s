<engine::force::PairwiseGravity<f64> as engine::force::Force<f64>>::accumulate:
Lfunc_begin158:
	.cfi_startproc
	.cfi_personality 155, _rust_eh_personality
	.cfi_lsda 16, Lexception46
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
	ldr x10, [x1, #16]
	lsl x27, x10, #3
	lsr x8, x10, #61
	mov x9, #-7
	movk x9, #32767, lsl #48
	cmp x27, x9
	ccmp x8, #0, #0, lo
	b.eq LBB158_2
	mov x0, #0
	mov x1, x27
	bl alloc::raw_vec::handle_error
LBB158_2:
	mov x24, x3
	mov x23, x0
	str x2, [sp, #112]
	cbz x27, LBB158_8
	mov x22, x10
	mov x19, x1
	mov x0, x27
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB158_51
	mov x25, x0
	mov x0, x27
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB158_52
	mov x20, x0
	mov x0, x27
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB158_53
	mov x21, x0
	mov x0, x27
	mov w1, #8
	bl __rustc::__rdl_alloc
	cbz x0, LBB158_54
	mov x1, x19
	mov x10, x22
	b LBB158_9
LBB158_8:
	mov w21, #8
	mov w25, #8
	mov w20, #8
	mov w0, #8
LBB158_9:
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
	cbz x19, LBB158_24
	str x24, [sp, #96]
	mov x24, #0
	ldr x8, [x1, #8]
	ldr x20, [x1, #56]
	add x21, x8, #8
	fmov d8, #1.00000000
	movi.2d v9, #0000000000000000
	b LBB158_12
LBB158_11:
	add x21, x21, #16
	ldr x0, [sp, #216]
	str d10, [x0, x23, lsl #3]
	add x23, x23, #1
	str x23, [sp, #224]
	mov x24, x22
	cmp x19, x22
	b.eq LBB158_21
LBB158_12:
	ldp d12, d11, [x21, #-8]
	ldr d10, [x20, x24, lsl #3]
	ldr x8, [sp, #136]
	cmp x24, x8
	b.ne LBB158_15
	add x0, sp, #136
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	ldr x25, [sp, #144]
LBB158_15:
	add x22, x24, #1
	str d12, [x25, x24, lsl #3]
	str x22, [sp, #152]
	ldr x23, [sp, #176]
	ldr x8, [sp, #160]
	cmp x23, x8
	b.ne LBB158_17
	add x0, sp, #160
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
LBB158_17:
	ldr x8, [sp, #168]
	str x8, [sp, #128]
	str d11, [x8, x23, lsl #3]
	add x28, x23, #1
	str x28, [sp, #176]
	fdiv d0, d8, d10
	fcmp d10, #0.0
	fcsel d11, d9, d0, eq
	ldr x23, [sp, #200]
	ldr x8, [sp, #184]
	cmp x23, x8
	b.ne LBB158_19
	add x0, sp, #184
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
LBB158_19:
	ldr x8, [sp, #192]
	str x8, [sp, #120]
	str d11, [x8, x23, lsl #3]
	add x26, x23, #1
	str x26, [sp, #200]
	ldr x23, [sp, #224]
	ldr x8, [sp, #208]
	cmp x23, x8
	b.ne LBB158_11
	add x0, sp, #208
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	b LBB158_11
LBB158_21:
	ldr x10, [sp, #40]
	ldr x24, [sp, #96]
	lsr x8, x10, #60
	cbz x8, LBB158_25
LBB158_22:
	mov x25, #0
LBB158_23:
	mov x0, x25
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB158_56
LBB158_24:
	stp x21, x20, [sp, #120]
	mov x26, #0
	mov x28, #0
	mov x22, #0
	mov x23, #0
	lsr x8, x10, #60
	cbnz x8, LBB158_22
LBB158_25:
	ldr x8, [sp, #104]
	ldp d8, d9, [x8]
	cbz x10, LBB158_29
	mov x19, x0
	mov w25, #8
	mov x0, x27
	mov w1, #8
	bl __rustc::__rdl_alloc_zeroed
	str x0, [sp, #32]
	cbz x0, LBB158_23
	mov x0, x27
	mov w1, #8
	bl __rustc::__rdl_alloc_zeroed
	str x0, [sp, #24]
	cbz x0, LBB158_55
	mov x0, x19
	b LBB158_30
LBB158_29:
	mov w8, #8
	str x8, [sp, #32]
	mov w8, #8
	str x8, [sp, #24]
LBB158_30:
	sub x25, x23, #1
	str x0, [sp, #16]
	add x21, x0, #8
	ldr x10, [sp, #144]
	ldp x8, x9, [sp, #120]
	str x10, [sp, #8]
	ldr x11, [sp, #112]
LBB158_31:
	mov x15, x11
	add x11, x11, #16
	sub x27, x24, #1
	cmp x24, #0
	csel x19, x19, x27, eq
	csel x23, x23, x11, eq
	add x11, x10, #8
	sub x12, x22, #1
	cmp x22, #0
	csel x4, x4, x12, eq
	csel x20, x20, x11, eq
	add x11, x9, #8
	sub x12, x28, #1
	cmp x28, #0
	csel x2, x2, x12, eq
	csel x3, x3, x11, eq
	add x13, x8, #8
	sub x14, x26, #1
	cmp x26, #0
	csel x0, x0, x14, eq
	csel x1, x1, x13, eq
	cmn x25, #1
	b.eq LBB158_40
	cbz x24, LBB158_40
	cbz x22, LBB158_40
	cbz x10, LBB158_40
	cbz x28, LBB158_40
	cbz x9, LBB158_40
	cbz x26, LBB158_40
	cbz x8, LBB158_40
	ldr d0, [x10]
	ldr d1, [x9]
	ldr d2, [x8]
	ldur d3, [x21, #-8]
	str q3, [sp, #64]
	fmul d2, d8, d2
	stp d0, d1, [sp, #232]
	stp d2, d9, [sp, #248]
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
	add x2, x15, #16
	sub x4, x29, #168
	str x3, [sp, #80]
	mov x3, x27
	bl engine::force::pass_one::<f64>
	cmp x27, x22
	mov w8, #8
	csel x0, x8, x26, hi
	csel x22, xzr, x27, hi
	csel x27, x8, x28, hi
	mov x1, x22
	bl engine::force::lane_sum::<f64>
	str q0, [sp, #48]
	mov x0, x27
	mov x1, x22
	bl engine::force::lane_sum::<f64>
	ldp x3, x4, [sp, #80]
	ldp x2, x1, [sp, #96]
	ldr x0, [sp, #112]
	ldr q1, [sp, #48]
	mov.d v1[1], v0[0]
	ldr q0, [sp, #64]
	fmul.2d v0, v1, v0[0]
	ldr q1, [x24]
	sub x25, x25, #1
	add x21, x21, #8
	mov x26, x0
	mov x8, x1
	mov x28, x2
	mov x9, x3
	fadd.2d v0, v0, v1
	str q0, [x24]
	mov x22, x4
	mov x10, x20
	mov x24, x19
	mov x11, x23
	b LBB158_31
LBB158_40:
	ldr x8, [sp, #40]
	cbz x8, LBB158_42
	ldr x0, [sp, #24]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	ldr x0, [sp, #32]
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB158_42:
	ldr x8, [sp, #208]
	ldp x20, x19, [sp, #120]
	cbz x8, LBB158_44
	ldr x0, [sp, #16]
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB158_44:
	ldr x8, [sp, #184]
	cbz x8, LBB158_46
	mov x0, x20
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB158_46:
	ldr x8, [sp, #160]
	cbz x8, LBB158_48
	mov x0, x19
	mov w1, #8
	bl __rustc::__rdl_dealloc
LBB158_48:
	ldr x8, [sp, #136]
	cbz x8, LBB158_50
	ldr x0, [sp, #8]
	mov w1, #8
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
	b __rustc::__rdl_dealloc
LBB158_50:
	.cfi_restore_state
	.cfi_remember_state
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
LBB158_51:
	.cfi_restore_state
	mov w0, #8
	mov x1, x27
	bl alloc::raw_vec::handle_error
LBB158_52:
	mov x24, x22
	mov w0, #8
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB158_56
LBB158_53:
	mov x19, x20
	mov x24, x22
	mov w0, #8
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB158_56
LBB158_54:
	mov x19, x20
	mov x24, x22
	mov w0, #8
	mov x1, x27
	bl alloc::raw_vec::handle_error
	b LBB158_56
LBB158_55:
	mov w0, #8
	mov x1, x27
	bl alloc::raw_vec::handle_error
LBB158_56:
	brk #0x1
	mov x20, x0
	ldr x0, [sp, #32]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	b LBB158_66
	mov x20, x0
	cbz x24, LBB158_70
	mov x0, x21
	mov w1, #8
	bl __rustc::__rdl_dealloc
	b LBB158_61
	mov x20, x0
	cbz x24, LBB158_70
LBB158_61:
	mov x0, x19
	mov w1, #8
	bl __rustc::__rdl_dealloc
	mov x0, x25
	mov w1, #8
	bl __rustc::__rdl_dealloc
	mov x0, x20
	bl __Unwind_Resume
	mov x20, x0
	cbz x24, LBB158_70
	b LBB158_75
	b LBB158_65
LBB158_65:
	mov x20, x0
LBB158_66:
	ldr x8, [sp, #208]
	cbnz x8, LBB158_71
	ldr x8, [sp, #184]
	cbnz x8, LBB158_72
LBB158_68:
	ldr x8, [sp, #160]
	cbnz x8, LBB158_73
LBB158_69:
	ldr x8, [sp, #136]
	cbnz x8, LBB158_74
LBB158_70:
	mov x0, x20
	bl __Unwind_Resume
LBB158_71:
	ldr x0, [sp, #216]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #184]
	cbz x8, LBB158_68
LBB158_72:
	ldr x0, [sp, #192]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #160]
	cbz x8, LBB158_69
LBB158_73:
	ldr x0, [sp, #168]
	mov w1, #8
	bl __rustc::__rdl_dealloc
	ldr x8, [sp, #136]
	cbz x8, LBB158_70
LBB158_74:
	ldr x25, [sp, #144]
LBB158_75:
	mov x0, x25
	mov w1, #8
	bl __rustc::__rdl_dealloc
	mov x0, x20
	bl __Unwind_Resume
