engine::force::pass_one::<f32>:
	.cfi_startproc
	push r15
	.cfi_def_cfa_offset 16
	push r14
	.cfi_def_cfa_offset 24
	push rbx
	.cfi_def_cfa_offset 32
	.cfi_offset rbx, -32
	.cfi_offset r14, -24
	.cfi_offset r15, -16
	mov rax, qword ptr [rsi + 8]
	mov r9, qword ptr [rsi + 24]
	mov r10, qword ptr [rsi + 40]
	mov r11, qword ptr [rsi + 56]
	mov rbx, qword ptr [r8 + 8]
	mov r14, qword ptr [r8 + 24]
	cmp r9, rax
	cmovb rax, r9
	cmp r10, rax
	cmovb rax, r10
	cmp r11, rax
	cmovb rax, r11
	cmp r14, rbx
	cmovb rbx, r14
	cmp rax, rcx
	cmovae rax, rcx
	cmp rbx, rax
	cmovb rax, rbx
	test rax, rax
	je .LBB30_19
	vmovss xmm0, dword ptr [rdi]
	vmovss xmm1, dword ptr [rdi + 4]
	vmovss xmm2, dword ptr [rdi + 8]
	vmovss xmm3, dword ptr [rdi + 12]
	mov r10, qword ptr [r8]
	mov rcx, qword ptr [rsi]
	mov rdi, qword ptr [rsi + 16]
	mov r9, qword ptr [rsi + 32]
	mov rsi, qword ptr [rsi + 48]
	mov r8, qword ptr [r8 + 16]
	cmp rax, 4
	jb .LBB30_2
	vmovdqa64 zmm7, zmmword ptr [rip + .LCPI30_0]
	vmovq xmm4, r9
	vmovq xmm5, rdi
	vmovq xmm6, r10
	vmovq xmm8, rsi
	mov r11, rsi
	sub r11, r8
	vpunpcklqdq xmm4, xmm5, xmm4
	vmovq xmm5, rcx
	cmp r11, -63
	vpunpcklqdq xmm5, xmm6, xmm5
	setae r11b
	vinserti128 ymm4, ymm5, xmm4, 1
	vmovq xmm5, r8
	vinserti32x4 zmm4, zmm4, xmm8, 2
	vpermq zmm4, zmm7, zmm4
	vmovdqa64 zmm7, zmmword ptr [rip + .LCPI30_1]
	vpermi2q zmm7, zmm6, zmm5
	vpsubq zmm4, zmm4, zmm7
	vpcmpnleuq k0, zmm4, qword ptr [rip + .LCPI30_2]{1to8}
	kortestb k0, k0
	setne bl
	or bl, r11b
	je .LBB30_5
.LBB30_2:
	xor r11d, r11d
.LBB30_14:
	lea rbx, [r11 + 1]
	test al, 1
	je .LBB30_18
	vmovss xmm5, dword ptr [rcx + 4*r11]
	vmovss xmm6, dword ptr [rdi + 4*r11]
	vmovss xmm4, dword ptr [rsi + 4*r11]
	vsubss xmm5, xmm5, xmm0
	vsubss xmm6, xmm6, xmm1
	vmulss xmm7, xmm5, xmm5
	vmulss xmm8, xmm6, xmm6
	vaddss xmm7, xmm8, xmm7
	vaddss xmm8, xmm3, xmm7
	vxorps xmm7, xmm7, xmm7
	vucomiss xmm8, xmm7
	jne .LBB30_16
	jnp .LBB30_17
.LBB30_16:
	vsqrtss xmm9, xmm8, xmm8
	vmulss xmm7, xmm2, dword ptr [r9 + 4*r11]
	vmulss xmm8, xmm8, xmm9
	vdivss xmm7, xmm7, xmm8
.LBB30_17:
	vmovss xmm8, dword ptr [rdx + 8*r11]
	vmovss xmm9, dword ptr [rdx + 8*r11 + 4]
	vmulss xmm5, xmm5, xmm7
	vmulss xmm6, xmm6, xmm7
	vmulss xmm7, xmm4, xmm5
	vmulss xmm4, xmm4, xmm6
	vsubss xmm7, xmm8, xmm7
	vsubss xmm4, xmm9, xmm4
	vmovss dword ptr [rdx + 8*r11], xmm7
	vmovss dword ptr [rdx + 8*r11 + 4], xmm4
	vmovss dword ptr [r10 + 4*r11], xmm5
	vmovss dword ptr [r8 + 4*r11], xmm6
	mov r11, rbx
.LBB30_18:
	cmp rax, rbx
	jne .LBB30_20
.LBB30_19:
	pop rbx
	.cfi_def_cfa_offset 24
	pop r14
	.cfi_def_cfa_offset 16
	pop r15
	.cfi_def_cfa_offset 8
	vzeroupper
	ret
.LBB30_20:
	.cfi_def_cfa_offset 32
	lea r8, [r8 + 4*r11 + 4]
	lea r10, [r10 + 4*r11 + 4]
	lea rsi, [rsi + 4*r11 + 4]
	lea r9, [r9 + 4*r11 + 4]
	lea rdi, [rdi + 4*r11 + 4]
	lea rcx, [rcx + 4*r11 + 4]
	lea rdx, [rdx + 8*r11]
	sub rax, r11
	xor r11d, r11d
	jmp .LBB30_22
	.p2align	4
.LBB30_21:
	vmovss xmm10, dword ptr [rsi + 4*r11]
	vmulss xmm8, xmm8, xmm4
	vinsertps xmm5, xmm5, xmm6, 16
	vmovups xmm6, xmmword ptr [rdx + 8*r11]
	vmulss xmm4, xmm9, xmm4
	vinsertps xmm5, xmm5, xmm8, 32
	vinsertps xmm5, xmm5, xmm4, 48
	vshufps xmm7, xmm7, xmm10, 0
	vmulps xmm5, xmm7, xmm5
	vsubps xmm5, xmm6, xmm5
	vmovups xmmword ptr [rdx + 8*r11], xmm5
	vmovss dword ptr [r10 + 4*r11], xmm8
	vmovss dword ptr [r8 + 4*r11], xmm4
	add r11, 2
	cmp rax, r11
	je .LBB30_19
.LBB30_22:
	vmovss xmm6, dword ptr [rdi + 4*r11 - 4]
	vmovss xmm4, dword ptr [rcx + 4*r11 - 4]
	vxorps xmm8, xmm8, xmm8
	vsubss xmm5, xmm4, xmm0
	vsubss xmm6, xmm6, xmm1
	vmulss xmm4, xmm5, xmm5
	vmulss xmm7, xmm6, xmm6
	vaddss xmm4, xmm4, xmm7
	vaddss xmm7, xmm3, xmm4
	vxorps xmm4, xmm4, xmm4
	vucomiss xmm7, xmm4
	jne .LBB30_23
	jnp .LBB30_24
.LBB30_23:
	vsqrtss xmm9, xmm7, xmm7
	vmulss xmm8, xmm2, dword ptr [r9 + 4*r11 - 4]
	vmulss xmm7, xmm9, xmm7
	vdivss xmm8, xmm8, xmm7
.LBB30_24:
	vmulss xmm5, xmm8, xmm5
	vmulss xmm6, xmm8, xmm6
	vmovss xmm7, dword ptr [rsi + 4*r11 - 4]
	vmovss dword ptr [r10 + 4*r11 - 4], xmm5
	vmovss dword ptr [r8 + 4*r11 - 4], xmm6
	vmovss xmm8, dword ptr [rcx + 4*r11]
	vmovss xmm9, dword ptr [rdi + 4*r11]
	vsubss xmm8, xmm8, xmm0
	vsubss xmm9, xmm9, xmm1
	vmulss xmm10, xmm8, xmm8
	vmulss xmm11, xmm9, xmm9
	vaddss xmm10, xmm10, xmm11
	vaddss xmm10, xmm10, xmm3
	vucomiss xmm10, xmm4
	jne .LBB30_25
	jnp .LBB30_21
.LBB30_25:
	vsqrtss xmm11, xmm10, xmm10
	vmulss xmm4, xmm2, dword ptr [r9 + 4*r11]
	vmulss xmm10, xmm10, xmm11
	vdivss xmm4, xmm4, xmm10
	jmp .LBB30_21
.LBB30_5:
	movabs rbx, 1152921504606846960
	cmp rax, 16
	jae .LBB30_7
	xor r11d, r11d
	jmp .LBB30_11
.LBB30_7:
	vmovaps zmm9, zmmword ptr [rip + .LCPI30_3]
	vmovaps zmm10, zmmword ptr [rip + .LCPI30_4]
	vmovaps zmm11, zmmword ptr [rip + .LCPI30_5]
	vmovaps zmm12, zmmword ptr [rip + .LCPI30_6]
	mov r14, rax
	shr r14, 4
	vbroadcastss zmm4, xmm0
	vbroadcastss zmm5, xmm1
	vbroadcastss zmm6, xmm3
	vbroadcastss zmm7, xmm2
	mov r11, rax
	and r11, rbx
	xor r15d, r15d
	vpxor xmm8, xmm8, xmm8
	shl r14, 6
	.p2align	4
.LBB30_8:
	vmovups zmm13, zmmword ptr [rcx + r15]
	vmovups zmm14, zmmword ptr [rdi + r15]
	vmovups zmm15, zmmword ptr [rsi + r15]
	vsubps zmm13, zmm13, zmm4
	vsubps zmm14, zmm14, zmm5
	vmulps zmm16, zmm13, zmm13
	vmulps zmm17, zmm14, zmm14
	vaddps zmm16, zmm16, zmm17
	vmulps zmm17, zmm7, zmmword ptr [r9 + r15]
	vaddps zmm16, zmm6, zmm16
	vsqrtps zmm18, zmm16
	vcmpneqps k1, zmm16, zmm8
	vmulps zmm18, zmm16, zmm18
	vdivps zmm16 {k1} {z}, zmm17, zmm18
	vmovups zmm17, zmmword ptr [rdx + 2*r15]
	vmovups zmm18, zmmword ptr [rdx + 2*r15 + 64]
	vmovaps zmm19, zmm17
	vpermt2ps zmm19, zmm9, zmm18
	vpermt2ps zmm17, zmm10, zmm18
	vmulps zmm13, zmm13, zmm16
	vmulps zmm14, zmm14, zmm16
	vmulps zmm16, zmm15, zmm13
	vmulps zmm15, zmm15, zmm14
	vsubps zmm16, zmm19, zmm16
	vsubps zmm15, zmm17, zmm15
	vmovaps zmm17, zmm16
	vpermt2ps zmm17, zmm11, zmm15
	vpermt2ps zmm16, zmm12, zmm15
	vmovups zmmword ptr [rdx + 2*r15], zmm16
	vmovups zmmword ptr [rdx + 2*r15 + 64], zmm17
	vmovups zmmword ptr [r10 + r15], zmm13
	vmovups zmmword ptr [r8 + r15], zmm14
	add r15, 64
	cmp r14, r15
	jne .LBB30_8
	cmp rax, r11
	je .LBB30_19
	test al, 12
	je .LBB30_14
.LBB30_11:
	vmovaps ymm9, ymmword ptr [rip + .LCPI30_7]
	vmovdqa ymm10, ymmword ptr [rip + .LCPI30_8]
	add rbx, 12
	vbroadcastss xmm4, xmm0
	vbroadcastss xmm5, xmm1
	vbroadcastss xmm6, xmm3
	vbroadcastss xmm7, xmm2
	mov r14, r11
	vxorps xmm8, xmm8, xmm8
	mov r11, rbx
	and r11, rax
	.p2align	4
.LBB30_12:
	vmovups xmm11, xmmword ptr [rcx + 4*r14]
	vmovups xmm12, xmmword ptr [rdi + 4*r14]
	vsubps xmm11, xmm11, xmm4
	vsubps xmm12, xmm12, xmm5
	vmulps xmm13, xmm11, xmm11
	vmulps xmm14, xmm12, xmm12
	vaddps xmm13, xmm13, xmm14
	vmulps xmm14, xmm7, xmmword ptr [r9 + 4*r14]
	vaddps xmm13, xmm13, xmm6
	vsqrtps xmm15, xmm13
	vcmpneqps k1, xmm13, xmm8
	vmulps xmm15, xmm13, xmm15
	vdivps xmm13 {k1} {z}, xmm14, xmm15
	vbroadcastf128 ymm14, xmmword ptr [rsi + 4*r14]
	vmovups ymm15, ymmword ptr [rdx + 8*r14]
	vpermd ymm14, ymm10, ymm14
	vmulps xmm11, xmm11, xmm13
	vmulps xmm12, xmm12, xmm13
	vmovaps ymm13, ymm11
	vpermt2ps ymm13, ymm9, ymm12
	vmulps ymm13, ymm14, ymm13
	vsubps ymm13, ymm15, ymm13
	vmovups ymmword ptr [rdx + 8*r14], ymm13
	vmovups xmmword ptr [r10 + 4*r14], xmm11
	vmovups xmmword ptr [r8 + 4*r14], xmm12
	add r14, 4
	cmp r11, r14
	jne .LBB30_12
	cmp rax, r11
	je .LBB30_19
	jmp .LBB30_14
