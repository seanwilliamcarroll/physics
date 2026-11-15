engine::force::sweep::<f64>:
	.cfi_startproc
	mov rax, qword ptr [rsp + 48]
	cmp r9, rcx
	cmovb rcx, r9
	mov r9, qword ptr [rsp + 16]
	cmp r9, rcx
	cmovb rcx, r9
	mov r9, qword ptr [rsp + 32]
	cmp r9, rcx
	cmovb rcx, r9
	mov r9, qword ptr [rsp + 64]
	cmp r9, rax
	cmovb rax, r9
	cmp rax, rcx
	cmovae rax, rcx
	test rax, rax
	je .LBB29_1
	mov rcx, qword ptr [rsp + 56]
	mov r9, qword ptr [rsp + 40]
	mov r10, qword ptr [rsp + 24]
	mov r11, qword ptr [rsp + 8]
	vmovsd xmm1, qword ptr [rsi]
	vmovsd xmm3, qword ptr [rsi + 8]
	vmovsd xmm4, qword ptr [rsi + 16]
	vxorpd xmm6, xmm6, xmm6
	xor esi, esi
	vxorpd xmm5, xmm5, xmm5
	vxorpd xmm2, xmm2, xmm2
	jmp .LBB29_3
	.p2align	4
.LBB29_5:
	vmulsd xmm7, xmm9, xmm7
	vmulsd xmm8, xmm8, xmm9
	vmovsd xmm9, qword ptr [r9 + 8*rsi]
	vmovsd xmm10, qword ptr [r10 + 8*rsi]
	vmulsd xmm11, xmm10, xmm7
	vsubsd xmm9, xmm9, xmm11
	vmovsd qword ptr [r9 + 8*rsi], xmm9
	vmovsd xmm9, qword ptr [rcx + 8*rsi]
	vmulsd xmm10, xmm10, xmm8
	vsubsd xmm9, xmm9, xmm10
	vmovsd qword ptr [rcx + 8*rsi], xmm9
	inc rsi
	vaddsd xmm5, xmm5, xmm7
	vaddsd xmm2, xmm8, xmm2
	cmp rax, rsi
	je .LBB29_6
.LBB29_3:
	vmovsd xmm7, qword ptr [rdx + 8*rsi]
	vsubsd xmm7, xmm7, xmm1
	vmovsd xmm8, qword ptr [r8 + 8*rsi]
	vsubsd xmm8, xmm8, xmm3
	vmulsd xmm9, xmm7, xmm7
	vmulsd xmm10, xmm8, xmm8
	vaddsd xmm9, xmm9, xmm10
	vaddsd xmm10, xmm9, xmm0
	vucomisd xmm10, xmm6
	vxorpd xmm9, xmm9, xmm9
	jne .LBB29_4
	jnp .LBB29_5
.LBB29_4:
	vmulsd xmm9, xmm4, qword ptr [r11 + 8*rsi]
	vsqrtsd xmm11, xmm10, xmm10
	vmulsd xmm10, xmm10, xmm11
	vdivsd xmm9, xmm9, xmm10
	jmp .LBB29_5
.LBB29_1:
	vxorpd xmm2, xmm2, xmm2
	vxorpd xmm5, xmm5, xmm5
.LBB29_6:
	vmovsd qword ptr [rdi], xmm5
	vmovsd qword ptr [rdi + 8], xmm2
	ret
