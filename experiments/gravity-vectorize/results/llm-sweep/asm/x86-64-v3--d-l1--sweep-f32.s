engine::force::sweep::<f32>:
	.cfi_startproc
	mov rax, qword ptr [rsp + 40]
	cmp r8, rdx
	cmovb rdx, r8
	mov r8, qword ptr [rsp + 8]
	cmp r8, rdx
	cmovb rdx, r8
	mov r8, qword ptr [rsp + 24]
	cmp r8, rdx
	cmovb rdx, r8
	mov r8, qword ptr [rsp + 56]
	cmp r8, rax
	cmovb rax, r8
	cmp rax, rdx
	cmovae rax, rdx
	test rax, rax
	je .LBB30_1
	mov rdx, qword ptr [rsp + 48]
	mov r8, qword ptr [rsp + 32]
	mov r10, qword ptr [rsp + 16]
	vmovss xmm1, dword ptr [rdi]
	vmovss xmm2, dword ptr [rdi + 4]
	vmovss xmm3, dword ptr [rdi + 8]
	vxorps xmm4, xmm4, xmm4
	xor edi, edi
	vxorps xmm5, xmm5, xmm5
	vxorps xmm6, xmm6, xmm6
	jmp .LBB30_3
	.p2align	4
.LBB30_5:
	vmulss xmm7, xmm9, xmm7
	vmulss xmm8, xmm8, xmm9
	vmovss xmm9, dword ptr [r8 + 4*rdi]
	vmovss xmm10, dword ptr [r10 + 4*rdi]
	vmulss xmm11, xmm10, xmm7
	vsubss xmm9, xmm9, xmm11
	vmovss dword ptr [r8 + 4*rdi], xmm9
	vmovss xmm9, dword ptr [rdx + 4*rdi]
	vmulss xmm10, xmm10, xmm8
	vsubss xmm9, xmm9, xmm10
	vmovss dword ptr [rdx + 4*rdi], xmm9
	inc rdi
	vaddss xmm5, xmm5, xmm7
	vaddss xmm6, xmm8, xmm6
	cmp rax, rdi
	je .LBB30_6
.LBB30_3:
	vmovss xmm7, dword ptr [rsi + 4*rdi]
	vsubss xmm7, xmm7, xmm1
	vmovss xmm8, dword ptr [rcx + 4*rdi]
	vsubss xmm8, xmm8, xmm2
	vmulss xmm9, xmm7, xmm7
	vmulss xmm10, xmm8, xmm8
	vaddss xmm9, xmm9, xmm10
	vaddss xmm10, xmm9, xmm0
	vucomiss xmm10, xmm4
	vxorps xmm9, xmm9, xmm9
	jne .LBB30_4
	jnp .LBB30_5
.LBB30_4:
	vmulss xmm9, xmm3, dword ptr [r9 + 4*rdi]
	vsqrtss xmm11, xmm10, xmm10
	vmulss xmm10, xmm10, xmm11
	vdivss xmm9, xmm9, xmm10
	jmp .LBB30_5
.LBB30_6:
	vmovd ecx, xmm5
	vmovd eax, xmm6
	shl rax, 32
	or rax, rcx
	ret
.LBB30_1:
	xor eax, eax
	ret
