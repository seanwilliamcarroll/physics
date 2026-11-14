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
	mov r11, qword ptr [rsp + 80]
	mov qword ptr [rsp - 8], rdi
	mov rdi, qword ptr [rsp + 64]
	mov r13d, r9d
	mov rax, r9
	mov qword ptr [rsp - 32], r9
	mov r9, rcx
	shr rax
	shr r9
	mov qword ptr [rsp - 16], rcx
	and r13d, 1
	mov rcx, qword ptr [rsp + 112]
	mov r15, qword ptr [rsp + 88]
	mov r12, qword ptr [rsp + 56]
	mov qword ptr [rsp - 24], rsi
	mov ebp, edi
	mov r10, rdi
	mov ebx, r11d
	mov r14, r11
	and ebp, 1
	shr r10
	and ebx, 1
	shr r14
	cmp rax, r9
	mov r11, qword ptr [rsp + 96]
	mov rdi, qword ptr [rsp + 72]
	cmovb r9, rax
	cmp r10, r9
	cmovb r9, r10
	mov r10, rcx
	cmp r14, r9
	cmovb r9, r14
	mov rax, r11
	shr rax
	shr r10
	mov r14, qword ptr [rsp + 104]
	cmp r10, rax
	cmovae r10, rax
	cmp r10, r9
	cmovae r10, r9
	test r10, r10
	je .LBB30_1
	vmovsd xmm2, qword ptr [rsi]
	vmovss xmm3, dword ptr [rsi + 8]
	vpxor xmm1, xmm1, xmm1
	xor eax, eax
	jmp .LBB30_3
	.p2align	4
.LBB30_7:
	vmovss xmm9, dword ptr [rdi + 8*rax + 4]
	vbroadcastss xmm5, xmm5
	vmovss xmm8, dword ptr [rdi + 8*rax]
	vmovss xmm11, dword ptr [r15 + 8*rax + 4]
	vbroadcastss xmm6, xmm6
	vmovss xmm10, dword ptr [r15 + 8*rax]
	vmovss xmm13, dword ptr [r14 + 8*rax + 4]
	vmovss xmm12, dword ptr [r14 + 8*rax]
	vmulps xmm5, xmm7, xmm5
	vmulps xmm4, xmm4, xmm6
	vmulss xmm7, xmm9, xmm5
	vmulss xmm6, xmm8, xmm4
	vsubss xmm7, xmm11, xmm7
	vsubss xmm6, xmm10, xmm6
	vmovd r9d, xmm7
	vmovshdup xmm7, xmm5
	vmovd ecx, xmm6
	vmovshdup xmm6, xmm4
	vmulss xmm7, xmm9, xmm7
	vmulss xmm6, xmm8, xmm6
	shl r9, 32
	or rcx, r9
	mov qword ptr [r15 + 8*rax], rcx
	vsubss xmm7, xmm13, xmm7
	vsubss xmm6, xmm12, xmm6
	vmovd r9d, xmm7
	vpshufd xmm7, xmm1, 232
	vpsrlq xmm1, xmm1, 32
	vmovd ecx, xmm6
	vpshufd xmm1, xmm1, 232
	vaddps xmm4, xmm4, xmm7
	shl r9, 32
	vaddps xmm1, xmm5, xmm1
	or rcx, r9
	mov qword ptr [r14 + 8*rax], rcx
	inc rax
	vunpcklps xmm1, xmm4, xmm1
	cmp r10, rax
	je .LBB30_8
.LBB30_3:
	mov r9, qword ptr [rdx + 8*rax]
	mov rcx, qword ptr [r8 + 8*rax]
	vmovd xmm4, r9d
	vpinsrd xmm4, xmm4, ecx, 1
	vsubps xmm4, xmm4, xmm2
	vmulps xmm5, xmm4, xmm4
	vmovshdup xmm6, xmm5
	vaddps xmm5, xmm5, xmm6
	vxorps xmm6, xmm6, xmm6
	vaddss xmm7, xmm0, xmm5
	vxorps xmm5, xmm5, xmm5
	vucomiss xmm7, xmm5
	jne .LBB30_4
	jnp .LBB30_5
.LBB30_4:
	vsqrtss xmm8, xmm7, xmm7
	vmulss xmm6, xmm3, dword ptr [r12 + 8*rax]
	vmulss xmm7, xmm8, xmm7
	vdivss xmm6, xmm6, xmm7
.LBB30_5:
	shr r9, 32
	shr rcx, 32
	vmovd xmm7, r9d
	vpinsrd xmm7, xmm7, ecx, 1
	vsubps xmm7, xmm7, xmm2
	vmulps xmm8, xmm7, xmm7
	vmovshdup xmm9, xmm8
	vaddss xmm8, xmm8, xmm9
	vaddss xmm8, xmm8, xmm0
	vucomiss xmm8, xmm5
	jne .LBB30_6
	jnp .LBB30_7
.LBB30_6:
	vsqrtss xmm9, xmm8, xmm8
	vmulss xmm5, xmm3, dword ptr [r12 + 8*rax + 4]
	vmulss xmm8, xmm8, xmm9
	vdivss xmm5, xmm5, xmm8
	jmp .LBB30_7
.LBB30_1:
	vpxor xmm1, xmm1, xmm1
.LBB30_8:
	mov r10, qword ptr [rsp - 16]
	mov ecx, r11d
	vpshufd xmm2, xmm1, 232
	mov eax, r10d
	and eax, 1
	cmp r13, rax
	cmovb rax, r13
	cmp rbp, rax
	cmovb rax, rbp
	cmp rbx, rax
	cmovb rax, rbx
	mov rbx, qword ptr [rsp + 112]
	and ecx, 1
	mov r9d, ebx
	and r9d, 1
	cmp r9, rcx
	cmovb rcx, r9
	cmp rcx, rax
	cmovae rcx, rax
	test rcx, rcx
	je .LBB30_12
	movabs rcx, 1152921504606846974
	mov rsi, qword ptr [rsp - 32]
	movabs rax, 2305843009213693950
	mov r9, qword ptr [rsp + 80]
	and r11, rcx
	and rbx, rcx
	mov rcx, qword ptr [rsp - 24]
	and r10, rax
	vmovss xmm7, dword ptr [rdx + 4*r10]
	vmovss xmm5, dword ptr [r15 + 4*r11]
	vmovss xmm4, dword ptr [r14 + 4*rbx]
	and rsi, rax
	and r9, rax
	vmovsd xmm6, qword ptr [rcx]
	vinsertps xmm7, xmm7, dword ptr [r8 + 4*rsi], 16
	vmovss xmm3, dword ptr [rdi + 4*r9]
	vsubps xmm6, xmm7, xmm6
	vmulps xmm7, xmm6, xmm6
	vmovshdup xmm8, xmm7
	vaddps xmm7, xmm8, xmm7
	vaddss xmm0, xmm0, xmm7
	vxorps xmm7, xmm7, xmm7
	vucomiss xmm0, xmm7
	jne .LBB30_10
	jnp .LBB30_11
.LBB30_10:
	vsqrtss xmm8, xmm0, xmm0
	mov rdx, qword ptr [rsp + 64]
	and rdx, rax
	vmovss xmm7, dword ptr [r12 + 4*rdx]
	vmulss xmm7, xmm7, dword ptr [rcx + 8]
	vmulss xmm0, xmm8, xmm0
	vdivss xmm7, xmm7, xmm0
.LBB30_11:
	vbroadcastss xmm0, xmm7
	vmulps xmm0, xmm6, xmm0
	vmulss xmm6, xmm3, xmm0
	vaddps xmm2, xmm0, xmm2
	vsubss xmm5, xmm5, xmm6
	vmovss dword ptr [r15 + 4*r11], xmm5
	vmovshdup xmm5, xmm0
	vmulss xmm3, xmm3, xmm5
	vsubss xmm3, xmm4, xmm3
	vmovss dword ptr [r14 + 4*rbx], xmm3
.LBB30_12:
	vpmovsxbd xmm0, dword ptr [rip + .LCPI30_1]
	mov rax, qword ptr [rsp - 8]
	vpermi2d xmm0, xmm2, xmm1
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
