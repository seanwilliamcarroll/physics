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
	movsd xmm1, qword ptr [rsi]
	movsd xmm3, qword ptr [rsi + 8]
	movsd xmm4, qword ptr [rsi + 16]
	xorpd xmm6, xmm6
	xor esi, esi
	xorpd xmm5, xmm5
	xorpd xmm2, xmm2
	jmp .LBB29_3
	.p2align	4
.LBB29_5:
	mulsd xmm7, xmm9
	mulsd xmm8, xmm9
	movsd xmm9, qword ptr [r9 + 8*rsi]
	movsd xmm10, qword ptr [r10 + 8*rsi]
	movapd xmm11, xmm10
	mulsd xmm11, xmm7
	subsd xmm9, xmm11
	movsd qword ptr [r9 + 8*rsi], xmm9
	movsd xmm9, qword ptr [rcx + 8*rsi]
	mulsd xmm10, xmm8
	subsd xmm9, xmm10
	movsd qword ptr [rcx + 8*rsi], xmm9
	inc rsi
	addsd xmm5, xmm7
	addsd xmm2, xmm8
	cmp rax, rsi
	je .LBB29_6
.LBB29_3:
	movsd xmm7, qword ptr [rdx + 8*rsi]
	subsd xmm7, xmm1
	movsd xmm8, qword ptr [r8 + 8*rsi]
	subsd xmm8, xmm3
	movapd xmm9, xmm7
	mulsd xmm9, xmm7
	movapd xmm10, xmm8
	mulsd xmm10, xmm8
	addsd xmm10, xmm9
	addsd xmm10, xmm0
	ucomisd xmm10, xmm6
	xorpd xmm9, xmm9
	jne .LBB29_4
	jnp .LBB29_5
.LBB29_4:
	movsd xmm9, qword ptr [r11 + 8*rsi]
	mulsd xmm9, xmm4
	xorps xmm11, xmm11
	sqrtsd xmm11, xmm10
	mulsd xmm11, xmm10
	divsd xmm9, xmm11
	jmp .LBB29_5
.LBB29_1:
	xorpd xmm2, xmm2
	xorpd xmm5, xmm5
.LBB29_6:
	movsd qword ptr [rdi], xmm5
	movsd qword ptr [rdi + 8], xmm2
	ret
