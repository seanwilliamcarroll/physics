engine::force::pass_one::<f32>:
	.cfi_startproc
	mov rax, qword ptr [rsi + 8]
	mov r9, qword ptr [rsi + 24]
	mov r10, qword ptr [rsi + 40]
	cmp r9, rax
	cmovb rax, r9
	mov r9, qword ptr [rsi + 56]
	cmp r10, rax
	cmovb rax, r10
	mov r10, qword ptr [r8 + 8]
	cmp r9, rax
	cmovb rax, r9
	mov r9, qword ptr [r8 + 24]
	cmp r9, r10
	cmovb r10, r9
	cmp rax, rcx
	cmovae rax, rcx
	cmp r10, rax
	cmovb rax, r10
	test rax, rax
	je .LBB32_9
	push r14
	.cfi_def_cfa_offset 16
	push rbx
	.cfi_def_cfa_offset 24
	.cfi_offset rbx, -24
	.cfi_offset r14, -16
	vmovss xmm0, dword ptr [rdi]
	vmovss xmm1, dword ptr [rdi + 4]
	vmovss xmm2, dword ptr [rdi + 8]
	vmovss xmm3, dword ptr [rdi + 12]
	mov rcx, qword ptr [rsi]
	mov rdi, qword ptr [rsi + 16]
	mov r9, qword ptr [rsi + 32]
	mov rsi, qword ptr [rsi + 48]
	mov r10, qword ptr [r8]
	mov r8, qword ptr [r8 + 16]
	cmp rax, 16
	jb .LBB32_2
	vmovq xmm4, r9
	vmovq xmm5, rdi
	vpunpcklqdq xmm4, xmm5, xmm4
	vmovq xmm5, rcx
	vmovq xmm6, r10
	vpbroadcastq xmm6, xmm6
	vpunpcklqdq xmm7, xmm6, xmm5
	vinserti128 ymm7, ymm7, xmm4, 1
	vmovq xmm8, rsi
	vpunpcklqdq xmm5, xmm8, xmm5
	vinserti128 ymm4, ymm5, xmm4, 1
	vmovq xmm5, r8
	vpbroadcastq xmm5, xmm5
	vpunpcklqdq xmm8, xmm6, xmm5
	vinserti128 ymm8, ymm8, xmm5, 1
	vpsubq ymm4, ymm4, ymm8
	vpunpcklqdq xmm5, xmm5, xmm6
	vinserti128 ymm5, ymm5, xmm6, 1
	vpsubq ymm5, ymm7, ymm5
	mov r11, rsi
	sub r11, r8
	cmp r11, -31
	setae r11b
	vpbroadcastq ymm6, qword ptr [rip + .LCPI32_0]
	vpxor ymm4, ymm4, ymm6
	vpbroadcastq ymm7, qword ptr [rip + .LCPI32_1]
	vpcmpgtq ymm4, ymm4, ymm7
	vpxor ymm5, ymm5, ymm6
	vpcmpgtq ymm5, ymm5, ymm7
	vpackssdw ymm4, ymm5, ymm4
	vtestps ymm4, ymm4
	setne bl
	or bl, r11b
	je .LBB32_5
.LBB32_2:
	xor r11d, r11d
.LBB32_10:
	lea r8, [r8 + 4*r11]
	lea r10, [r10 + 4*r11]
	lea rsi, [rsi + 4*r11]
	lea r9, [r9 + 4*r11]
	lea rdi, [rdi + 4*r11]
	lea rcx, [rcx + 4*r11]
	lea rdx, [rdx + 8*r11]
	add rdx, 4
	sub rax, r11
	xor r11d, r11d
	jmp .LBB32_12
	.p2align	4
.LBB32_11:
	vmovss xmm7, dword ptr [rsi + 4*r11]
	vmulss xmm4, xmm4, xmm6
	vmulss xmm5, xmm5, xmm6
	vmulss xmm6, xmm7, xmm4
	vmovss xmm8, dword ptr [rdx + 8*r11 - 4]
	vsubss xmm6, xmm8, xmm6
	vmovss xmm8, dword ptr [rdx + 8*r11]
	vmovss dword ptr [rdx + 8*r11 - 4], xmm6
	vmulss xmm6, xmm7, xmm5
	vsubss xmm6, xmm8, xmm6
	vmovss dword ptr [rdx + 8*r11], xmm6
	vmovss dword ptr [r10 + 4*r11], xmm4
	vmovss dword ptr [r8 + 4*r11], xmm5
	inc r11
	cmp rax, r11
	je .LBB32_8
.LBB32_12:
	vmovss xmm4, dword ptr [rcx + 4*r11]
	vmovss xmm5, dword ptr [rdi + 4*r11]
	vsubss xmm4, xmm4, xmm0
	vsubss xmm5, xmm5, xmm1
	vmulss xmm6, xmm4, xmm4
	vmulss xmm7, xmm5, xmm5
	vaddss xmm6, xmm6, xmm7
	vaddss xmm7, xmm3, xmm6
	vxorps xmm6, xmm6, xmm6
	vucomiss xmm7, xmm6
	jne .LBB32_13
	jnp .LBB32_11
.LBB32_13:
	vmulss xmm6, xmm2, dword ptr [r9 + 4*r11]
	vsqrtss xmm8, xmm7, xmm7
	vmulss xmm7, xmm8, xmm7
	vdivss xmm6, xmm6, xmm7
	jmp .LBB32_11
.LBB32_5:
	movabs r11, 1152921504606846968
	and r11, rax
	vbroadcastss ymm4, xmm0
	vbroadcastss ymm5, xmm1
	vbroadcastss ymm6, xmm3
	vbroadcastss ymm7, xmm2
	lea rbx, [4*rax]
	and rbx, -32
	xor r14d, r14d
	vpxor xmm8, xmm8, xmm8
	.p2align	4
.LBB32_6:
	vmovups ymm9, ymmword ptr [rcx + r14]
	vsubps ymm9, ymm9, ymm4
	vmovups ymm10, ymmword ptr [rdi + r14]
	vsubps ymm10, ymm10, ymm5
	vmovups ymm11, ymmword ptr [rsi + r14]
	vmulps ymm12, ymm9, ymm9
	vmulps ymm13, ymm10, ymm10
	vaddps ymm12, ymm12, ymm13
	vmulps ymm13, ymm7, ymmword ptr [r9 + r14]
	vaddps ymm12, ymm12, ymm6
	vsqrtps ymm14, ymm12
	vmulps ymm14, ymm12, ymm14
	vdivps ymm13, ymm13, ymm14
	vcmpneqps ymm12, ymm12, ymm8
	vandps ymm12, ymm12, ymm13
	vmulps ymm9, ymm9, ymm12
	vmulps ymm10, ymm10, ymm12
	vmulps ymm12, ymm11, ymm9
	vmovups ymm13, ymmword ptr [rdx + 2*r14]
	vmovups ymm14, ymmword ptr [rdx + 2*r14 + 32]
	vshufps ymm15, ymm13, ymm14, 136
	vpermpd ymm15, ymm15, 216
	vsubps ymm12, ymm15, ymm12
	vshufps ymm13, ymm13, ymm14, 221
	vpermpd ymm13, ymm13, 216
	vmulps ymm11, ymm11, ymm10
	vsubps ymm11, ymm13, ymm11
	vunpckhps ymm13, ymm12, ymm11
	vunpcklps ymm11, ymm12, ymm11
	vperm2f128 ymm12, ymm11, ymm13, 49
	vinsertf128 ymm11, ymm11, xmm13, 1
	vmovups ymmword ptr [rdx + 2*r14], ymm11
	vmovups ymmword ptr [rdx + 2*r14 + 32], ymm12
	vmovups ymmword ptr [r10 + r14], ymm9
	vmovups ymmword ptr [r8 + r14], ymm10
	add r14, 32
	cmp rbx, r14
	jne .LBB32_6
	cmp rax, r11
	jne .LBB32_10
.LBB32_8:
	pop rbx
	.cfi_def_cfa_offset 16
	pop r14
	.cfi_def_cfa_offset 8
	.cfi_restore rbx
	.cfi_restore r14
.LBB32_9:
	vzeroupper
	ret
