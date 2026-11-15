engine::force::sweep::<f32>:
	.cfi_startproc
	push rbp
	.cfi_def_cfa_offset 16
	push r15
	.cfi_def_cfa_offset 24
	push r14
	.cfi_def_cfa_offset 32
	push r13
	.cfi_def_cfa_offset 40
	push r12
	.cfi_def_cfa_offset 48
	push rbx
	.cfi_def_cfa_offset 56
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov qword ptr [rsp - 8], rdi
	mov r10, qword ptr [rsp + 80]
	mov rdi, qword ptr [rsp + 64]
	mov r13d, r9d
	and r13d, 1
	mov qword ptr [rsp - 32], r9
	mov rax, r9
	shr rax
	mov ebp, edi
	and ebp, 1
	shr rdi
	mov ebx, r10d
	and ebx, 1
	shr r10
	mov qword ptr [rsp - 16], rcx
	mov r14, rcx
	shr r14
	cmp rax, r14
	cmovb r14, rax
	mov rcx, qword ptr [rsp + 112]
	cmp rdi, r14
	cmovb r14, rdi
	mov rax, qword ptr [rsp + 96]
	cmp r10, r14
	cmovb r14, r10
	shr rax
	mov r10, rcx
	shr r10
	cmp r10, rax
	cmovae r10, rax
	cmp r10, r14
	cmovae r10, r14
	mov r14, qword ptr [rsp + 104]
	mov r15, qword ptr [rsp + 88]
	mov rdi, qword ptr [rsp + 72]
	mov r12, qword ptr [rsp + 56]
	test r10, r10
	mov qword ptr [rsp - 24], rsi
	je .LBB30_1
	vmovsd xmm2, qword ptr [rsi]
	vbroadcastss xmm3, dword ptr [rsi + 8]
	vxorps xmm1, xmm1, xmm1
	xor eax, eax
	vxorps xmm4, xmm4, xmm4
	.p2align	4
.LBB30_3:
	mov r9, qword ptr [rdx + 8*rax]
	mov rcx, qword ptr [r8 + 8*rax]
	vmovsd xmm5, qword ptr [r12 + 8*rax]
	vmulps xmm5, xmm3, xmm5
	vmovd xmm6, r9d
	vpinsrd xmm6, xmm6, ecx, 1
	shr r9, 32
	shr rcx, 32
	vmovd xmm7, r9d
	vpinsrd xmm7, xmm7, ecx, 1
	vsubps xmm6, xmm6, xmm2
	vsubps xmm7, xmm7, xmm2
	vmulps xmm8, xmm6, xmm6
	vmulps xmm9, xmm7, xmm7
	vmovshdup xmm10, xmm9
	vaddss xmm9, xmm9, xmm10
	vmovshdup xmm10, xmm8
	vaddss xmm8, xmm8, xmm10
	vaddss xmm9, xmm9, xmm0
	vaddss xmm8, xmm8, xmm0
	vinsertps xmm10, xmm8, xmm9, 16
	vsqrtps xmm11, xmm10
	vmulps xmm10, xmm10, xmm11
	vmovss xmm11, dword ptr [rdi + 8*rax]
	vdivps xmm5, xmm5, xmm10
	vmovss xmm10, dword ptr [rdi + 8*rax + 4]
	vcmpeqss xmm8, xmm8, xmm4
	vandnps xmm8, xmm8, xmm5
	vmovshdup xmm5, xmm5
	vcmpeqss xmm9, xmm9, xmm4
	vandnps xmm9, xmm9, xmm5
	vmovss xmm12, dword ptr [r15 + 8*rax]
	vbroadcastss xmm5, xmm8
	vmulps xmm5, xmm6, xmm5
	vmovss xmm6, dword ptr [r15 + 8*rax + 4]
	vbroadcastss xmm8, xmm9
	vmulps xmm7, xmm8, xmm7
	vmulss xmm8, xmm11, xmm5
	vsubss xmm8, xmm12, xmm8
	vmulss xmm9, xmm10, xmm7
	vsubss xmm6, xmm6, xmm9
	vmovd ecx, xmm8
	vmovd r9d, xmm6
	vmovshdup xmm6, xmm5
	vmulss xmm6, xmm11, xmm6
	vmovss xmm8, dword ptr [r14 + 8*rax]
	vsubss xmm6, xmm8, xmm6
	vmovshdup xmm8, xmm7
	vmulss xmm8, xmm8, xmm10
	vmovss xmm9, dword ptr [r14 + 8*rax + 4]
	vsubss xmm8, xmm9, xmm8
	vmovd esi, xmm6
	vmovd r11d, xmm8
	vunpcklps xmm5, xmm5, xmm7
	vaddps xmm1, xmm5, xmm1
	shl r9, 32
	or rcx, r9
	mov qword ptr [r15 + 8*rax], rcx
	shl r11, 32
	or rsi, r11
	mov qword ptr [r14 + 8*rax], rsi
	inc rax
	cmp r10, rax
	jne .LBB30_3
	jmp .LBB30_4
.LBB30_1:
	vxorps xmm1, xmm1, xmm1
.LBB30_4:
	mov r9, qword ptr [rsp - 16]
	mov eax, r9d
	and eax, 1
	cmp r13, rax
	cmovb rax, r13
	vshufps xmm2, xmm1, xmm1, 232
	cmp rbp, rax
	cmovb rax, rbp
	cmp rbx, rax
	cmovb rax, rbx
	mov r11, qword ptr [rsp + 96]
	mov ecx, r11d
	and ecx, 1
	mov r10, qword ptr [rsp + 112]
	mov esi, r10d
	and esi, 1
	cmp rsi, rcx
	cmovb rcx, rsi
	cmp rcx, rax
	cmovae rcx, rax
	test rcx, rcx
	je .LBB30_8
	movabs rax, 2305843009213693950
	movabs rcx, 1152921504606846974
	and r9, rax
	mov rsi, qword ptr [rsp - 32]
	and rsi, rax
	mov rbx, qword ptr [rsp + 80]
	and rbx, rax
	and r11, rcx
	and r10, rcx
	vmovss xmm3, dword ptr [rdi + 4*rbx]
	vmovss xmm5, dword ptr [r15 + 4*r11]
	vmovss xmm4, dword ptr [r14 + 4*r10]
	vmovss xmm6, dword ptr [rdx + 4*r9]
	vinsertps xmm6, xmm6, dword ptr [r8 + 4*rsi], 16
	mov rcx, qword ptr [rsp - 24]
	vmovsd xmm7, qword ptr [rcx]
	vsubps xmm6, xmm6, xmm7
	vmulps xmm7, xmm6, xmm6
	vmovshdup xmm8, xmm7
	vaddps xmm7, xmm8, xmm7
	vaddss xmm0, xmm0, xmm7
	vxorps xmm7, xmm7, xmm7
	vucomiss xmm0, xmm7
	jne .LBB30_6
	jnp .LBB30_7
.LBB30_6:
	mov rdx, qword ptr [rsp + 64]
	and rdx, rax
	vmovss xmm7, dword ptr [r12 + 4*rdx]
	vmulss xmm7, xmm7, dword ptr [rcx + 8]
	vsqrtss xmm8, xmm0, xmm0
	vmulss xmm0, xmm8, xmm0
	vdivss xmm7, xmm7, xmm0
.LBB30_7:
	vbroadcastss xmm0, xmm7
	vmulps xmm0, xmm6, xmm0
	vmulss xmm6, xmm3, xmm0
	vsubss xmm5, xmm5, xmm6
	vmovss dword ptr [r15 + 4*r11], xmm5
	vmovshdup xmm5, xmm0
	vmulss xmm3, xmm3, xmm5
	vsubss xmm3, xmm4, xmm3
	vmovss dword ptr [r14 + 4*r10], xmm3
	vaddps xmm2, xmm0, xmm2
.LBB30_8:
	vpmovzxdq xmm0, xmm2
	vpblendd xmm0, xmm0, xmm1, 10
	mov rax, qword ptr [rsp - 8]
	vmovdqu xmmword ptr [rax], xmm0
	pop rbx
	.cfi_def_cfa_offset 48
	pop r12
	.cfi_def_cfa_offset 40
	pop r13
	.cfi_def_cfa_offset 32
	pop r14
	.cfi_def_cfa_offset 24
	pop r15
	.cfi_def_cfa_offset 16
	pop rbp
	.cfi_def_cfa_offset 8
	ret
