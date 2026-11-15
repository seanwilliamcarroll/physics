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
	movss xmm1, dword ptr [rdi]
	movss xmm2, dword ptr [rdi + 4]
	movss xmm3, dword ptr [rdi + 8]
	xorps xmm4, xmm4
	xor edi, edi
	xorps xmm5, xmm5
	xorps xmm6, xmm6
	jmp .LBB30_3
	.p2align	4
.LBB30_5:
	mulss xmm7, xmm9
	mulss xmm8, xmm9
	movss xmm9, dword ptr [r8 + 4*rdi]
	movss xmm10, dword ptr [r10 + 4*rdi]
	movaps xmm11, xmm10
	mulss xmm11, xmm7
	subss xmm9, xmm11
	movss dword ptr [r8 + 4*rdi], xmm9
	movss xmm9, dword ptr [rdx + 4*rdi]
	mulss xmm10, xmm8
	subss xmm9, xmm10
	movss dword ptr [rdx + 4*rdi], xmm9
	inc rdi
	addss xmm5, xmm7
	addss xmm6, xmm8
	cmp rax, rdi
	je .LBB30_6
.LBB30_3:
	movss xmm7, dword ptr [rsi + 4*rdi]
	subss xmm7, xmm1
	movss xmm8, dword ptr [rcx + 4*rdi]
	subss xmm8, xmm2
	movaps xmm9, xmm7
	mulss xmm9, xmm7
	movaps xmm10, xmm8
	mulss xmm10, xmm8
	addss xmm10, xmm9
	addss xmm10, xmm0
	ucomiss xmm10, xmm4
	xorps xmm9, xmm9
	jne .LBB30_4
	jnp .LBB30_5
.LBB30_4:
	movss xmm9, dword ptr [r9 + 4*rdi]
	mulss xmm9, xmm3
	xorps xmm11, xmm11
	sqrtss xmm11, xmm10
	mulss xmm11, xmm10
	divss xmm9, xmm11
	jmp .LBB30_5
.LBB30_6:
	movd ecx, xmm5
	movd eax, xmm6
	shl rax, 32
	or rax, rcx
	ret
.LBB30_1:
	xor eax, eax
	ret
