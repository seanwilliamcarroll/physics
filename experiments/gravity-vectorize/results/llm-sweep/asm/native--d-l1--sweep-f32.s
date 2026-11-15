engine::force::sweep::<f32>:
	.cfi_startproc
	push rbx
	.cfi_def_cfa_offset 16
	.cfi_offset rbx, -16
	mov rbx, qword ptr [rsp + 16]
	mov r11, qword ptr [rsp + 32]
	cmp r8, rdx
	mov r10, qword ptr [rsp + 48]
	mov rax, qword ptr [rsp + 64]
	cmovb rdx, r8
	cmp rbx, rdx
	cmovb rdx, rbx
	cmp r11, rdx
	cmovb rdx, r11
	cmp rax, r10
	cmovb r10, rax
	cmp r10, rdx
	cmovae r10, rdx
	test r10, r10
	je .LBB30_1
	vmovss xmm5, dword ptr [rdi]
	vmovss xmm4, dword ptr [rdi + 4]
	vmovss xmm3, dword ptr [rdi + 8]
	mov rax, qword ptr [rsp + 56]
	mov rdx, qword ptr [rsp + 40]
	mov r8, qword ptr [rsp + 24]
	vxorps xmm2, xmm2, xmm2
	cmp r10, 1
	jne .LBB30_4
	xor edi, edi
	vxorps xmm1, xmm1, xmm1
	vxorps xmm6, xmm6, xmm6
	jmp .LBB30_7
.LBB30_1:
	xor eax, eax
	pop rbx
	.cfi_def_cfa_offset 8
	ret
.LBB30_4:
	.cfi_def_cfa_offset 16
	movabs r11, 1152921504606846974
	vbroadcastss xmm6, xmm5
	vbroadcastss xmm7, xmm0
	vbroadcastss xmm8, xmm4
	vbroadcastss xmm9, xmm3
	vxorps xmm10, xmm10, xmm10
	xor edi, edi
	vxorps xmm1, xmm1, xmm1
	and r11, r10
	.p2align	4
.LBB30_5:
	vmovsd xmm11, qword ptr [rsi + 4*rdi]
	vmovsd xmm12, qword ptr [rcx + 4*rdi]
	vsubps xmm11, xmm11, xmm6
	vsubps xmm12, xmm12, xmm8
	vmulps xmm13, xmm11, xmm11
	vmulps xmm14, xmm12, xmm12
	vaddps xmm13, xmm13, xmm14
	vmovsd xmm14, qword ptr [r9 + 4*rdi]
	vaddps xmm13, xmm13, xmm7
	vsqrtps xmm15, xmm13
	vcmpneqps k1, xmm13, xmm10
	vmulps xmm14, xmm14, xmm9
	vmulps xmm15, xmm13, xmm15
	vdivps xmm13 {k1} {z}, xmm14, xmm15
	vmovsd xmm14, qword ptr [r8 + 4*rdi]
	vmovsd xmm15, qword ptr [rdx + 4*rdi]
	vmulps xmm11, xmm11, xmm13
	vmulps xmm12, xmm12, xmm13
	vmovsd xmm13, qword ptr [rax + 4*rdi]
	vmulps xmm16, xmm14, xmm11
	vmulps xmm14, xmm14, xmm12
	vsubps xmm15, xmm15, xmm16
	vsubps xmm13, xmm13, xmm14
	vinsertps xmm14, xmm11, xmm12, 28
	vinsertps xmm11, xmm12, xmm11, 76
	vaddps xmm1, xmm14, xmm1
	vmovlps qword ptr [rdx + 4*rdi], xmm15
	vmovlps qword ptr [rax + 4*rdi], xmm13
	add rdi, 2
	vaddps xmm1, xmm11, xmm1
	cmp r11, rdi
	jne .LBB30_5
	vmovshdup xmm6, xmm1
	test r10b, 1
	je .LBB30_10
.LBB30_7:
	vmovss xmm7, dword ptr [rsi + 4*rdi]
	vsubss xmm5, xmm7, xmm5
	vmovss xmm7, dword ptr [rcx + 4*rdi]
	vsubss xmm4, xmm7, xmm4
	vmulss xmm7, xmm5, xmm5
	vmulss xmm8, xmm4, xmm4
	vaddss xmm7, xmm8, xmm7
	vaddss xmm0, xmm0, xmm7
	vucomiss xmm0, xmm2
	jne .LBB30_8
	jnp .LBB30_9
.LBB30_8:
	vsqrtss xmm7, xmm0, xmm0
	vmulss xmm2, xmm3, dword ptr [r9 + 4*rdi]
	vmulss xmm0, xmm0, xmm7
	vdivss xmm2, xmm2, xmm0
.LBB30_9:
	vmulss xmm0, xmm5, xmm2
	vmulss xmm2, xmm4, xmm2
	vmovss xmm4, dword ptr [r8 + 4*rdi]
	vmovss xmm3, dword ptr [rdx + 4*rdi]
	vaddss xmm1, xmm1, xmm0
	vaddss xmm6, xmm2, xmm6
	vmulss xmm5, xmm4, xmm0
	vmulss xmm4, xmm4, xmm2
	vsubss xmm3, xmm3, xmm5
	vmovss dword ptr [rdx + 4*rdi], xmm3
	vmovss xmm3, dword ptr [rax + 4*rdi]
	vsubss xmm3, xmm3, xmm4
	vmovss dword ptr [rax + 4*rdi], xmm3
.LBB30_10:
	vmovd eax, xmm6
	vmovd ecx, xmm1
	shl rax, 32
	or rax, rcx
	pop rbx
	.cfi_def_cfa_offset 8
	ret
