engine::force::sweep::<f64>:
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
	sub rsp, 696
	.cfi_def_cfa_offset 752
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r14, rcx
	mov r10, rsi
	mov rsi, qword ptr [rsp + 776]
	mov rcx, qword ptr [rsp + 760]
	mov r15d, r9d
	and r15d, 15
	mov qword ptr [rsp + 176], r9
	mov rax, r9
	shr rax, 4
	mov r12d, ecx
	and r12d, 15
	shr rcx, 4
	mov r13d, esi
	and r13d, 15
	shr rsi, 4
	mov qword ptr [rsp - 104], r14
	shr r14, 4
	cmp rax, r14
	cmovb r14, rax
	mov r9, qword ptr [rsp + 808]
	cmp rcx, r14
	cmovb r14, rcx
	mov rbx, qword ptr [rsp + 792]
	cmp rsi, r14
	cmovb r14, rsi
	mov rax, rbx
	shr rax, 4
	mov r11, r9
	shr r11, 4
	cmp r11, rax
	cmovae r11, rax
	cmp r11, r14
	cmovae r11, r14
	mov r14, qword ptr [rsp + 800]
	xorpd xmm1, xmm1
	movupd xmmword ptr [rsp + 296], xmm1
	movupd xmmword ptr [rsp + 280], xmm1
	movupd xmmword ptr [rsp + 264], xmm1
	movupd xmmword ptr [rsp + 248], xmm1
	movupd xmmword ptr [rsp + 232], xmm1
	movupd xmmword ptr [rsp + 216], xmm1
	movupd xmmword ptr [rsp + 200], xmm1
	mov qword ptr [rsp + 312], 0
	movupd xmmword ptr [rsp + 328], xmm1
	movupd xmmword ptr [rsp + 344], xmm1
	movupd xmmword ptr [rsp + 360], xmm1
	movupd xmmword ptr [rsp + 376], xmm1
	movupd xmmword ptr [rsp + 392], xmm1
	movupd xmmword ptr [rsp + 408], xmm1
	movupd xmmword ptr [rsp + 424], xmm1
	mov qword ptr [rsp + 440], 0
	mov rbp, qword ptr [rsp + 784]
	mov rax, qword ptr [rsp + 768]
	mov rsi, qword ptr [rsp + 752]
	test r11, r11
	mov qword ptr [rsp + 184], r10
	je .LBB29_1
	movupd xmm1, xmmword ptr [r10]
	movaps xmmword ptr [rsp + 480], xmm0
	movlhps xmm0, xmm0
	movaps xmmword ptr [rsp + 464], xmm0
	movsd xmm0, qword ptr [r10 + 16]
	movlhps xmm0, xmm0
	movaps xmmword ptr [rsp + 448], xmm0
	movapd xmm0, xmm1
	unpcklpd xmm0, xmm1
	movapd xmmword ptr [rsp + 512], xmm0
	movapd xmmword ptr [rsp + 528], xmm1
	unpckhpd xmm1, xmm1
	movapd xmmword ptr [rsp + 496], xmm1
	shl r11, 7
	xor ecx, ecx
	xorpd xmm0, xmm0
	movapd xmmword ptr [rsp + 80], xmm0
	movapd xmmword ptr [rsp + 64], xmm0
	movapd xmmword ptr [rsp + 48], xmm0
	movapd xmmword ptr [rsp + 32], xmm0
	movapd xmmword ptr [rsp + 16], xmm0
	movapd xmmword ptr [rsp], xmm0
	movapd xmmword ptr [rsp - 16], xmm0
	xorpd xmm4, xmm4
	xorpd xmm1, xmm1
	xorpd xmm11, xmm11
	xorpd xmm2, xmm2
	xorpd xmm5, xmm5
	xorpd xmm9, xmm9
	xorpd xmm3, xmm3
	xorpd xmm6, xmm6
	movapd xmmword ptr [rsp + 96], xmm0
	.p2align	4
.LBB29_3:
	movapd xmmword ptr [rsp + 560], xmm6
	movapd xmmword ptr [rsp + 576], xmm3
	movapd xmmword ptr [rsp + 592], xmm9
	movapd xmmword ptr [rsp + 608], xmm5
	movapd xmmword ptr [rsp + 624], xmm2
	movapd xmmword ptr [rsp + 640], xmm11
	movapd xmmword ptr [rsp + 656], xmm1
	movapd xmmword ptr [rsp + 672], xmm4
	movupd xmm0, xmmword ptr [rdx + rcx + 8]
	movapd xmm5, xmmword ptr [rsp + 512]
	subpd xmm0, xmm5
	movapd xmmword ptr [rsp - 48], xmm0
	movupd xmm15, xmmword ptr [r8 + rcx + 8]
	movupd xmm12, xmmword ptr [r8 + rcx + 24]
	movupd xmm13, xmmword ptr [r8 + rcx + 40]
	movupd xmm14, xmmword ptr [r8 + rcx + 56]
	movapd xmm6, xmmword ptr [rsp + 496]
	subpd xmm15, xmm6
	movapd xmmword ptr [rsp - 32], xmm15
	mulpd xmm0, xmm0
	mulpd xmm15, xmm15
	addpd xmm15, xmm0
	movapd xmm7, xmmword ptr [rsp + 464]
	addpd xmm15, xmm7
	movupd xmm3, xmmword ptr [rsi + rcx + 8]
	movupd xmm2, xmmword ptr [rsi + rcx + 24]
	movupd xmm1, xmmword ptr [rsi + rcx + 40]
	movupd xmm0, xmmword ptr [rsi + rcx + 56]
	movapd xmm8, xmmword ptr [rsp + 448]
	mulpd xmm3, xmm8
	sqrtpd xmm4, xmm15
	mulpd xmm4, xmm15
	divpd xmm3, xmm4
	xorpd xmm4, xmm4
	cmpneqpd xmm15, xmm4
	andpd xmm15, xmm3
	movapd xmmword ptr [rsp + 112], xmm15
	movupd xmm3, xmmword ptr [rdx + rcx + 24]
	subpd xmm3, xmm5
	movapd xmmword ptr [rsp - 128], xmm3
	subpd xmm12, xmm6
	movapd xmmword ptr [rsp - 64], xmm12
	mulpd xmm3, xmm3
	mulpd xmm12, xmm12
	addpd xmm12, xmm3
	addpd xmm12, xmm7
	mulpd xmm2, xmm8
	sqrtpd xmm3, xmm12
	mulpd xmm3, xmm12
	divpd xmm2, xmm3
	cmpneqpd xmm12, xmm4
	andpd xmm12, xmm2
	movupd xmm2, xmmword ptr [rdx + rcx + 40]
	subpd xmm2, xmm5
	movapd xmmword ptr [rsp + 160], xmm2
	subpd xmm13, xmm6
	movapd xmmword ptr [rsp - 80], xmm13
	mulpd xmm2, xmm2
	mulpd xmm13, xmm13
	addpd xmm13, xmm2
	addpd xmm13, xmm7
	mulpd xmm1, xmm8
	sqrtpd xmm2, xmm13
	mulpd xmm2, xmm13
	divpd xmm1, xmm2
	xorpd xmm2, xmm2
	cmpneqpd xmm13, xmm2
	andpd xmm13, xmm1
	movupd xmm1, xmmword ptr [rdx + rcx + 56]
	subpd xmm1, xmm5
	movapd xmmword ptr [rsp + 144], xmm1
	subpd xmm14, xmm6
	movapd xmmword ptr [rsp - 96], xmm14
	mulpd xmm1, xmm1
	mulpd xmm14, xmm14
	addpd xmm14, xmm1
	addpd xmm14, xmm7
	mulpd xmm0, xmm8
	sqrtpd xmm1, xmm14
	mulpd xmm1, xmm14
	divpd xmm0, xmm1
	cmpneqpd xmm14, xmm2
	xorpd xmm3, xmm3
	andpd xmm14, xmm0
	movupd xmm0, xmmword ptr [rdx + rcx + 72]
	subpd xmm0, xmm5
	movapd xmmword ptr [rsp + 128], xmm0
	movupd xmm11, xmmword ptr [r8 + rcx + 72]
	subpd xmm11, xmm6
	mulpd xmm0, xmm0
	movapd xmm10, xmm11
	mulpd xmm10, xmm11
	addpd xmm10, xmm0
	addpd xmm10, xmm7
	movupd xmm0, xmmword ptr [rsi + rcx + 72]
	movapd xmm2, xmm8
	mulpd xmm0, xmm8
	sqrtpd xmm1, xmm10
	mulpd xmm1, xmm10
	divpd xmm0, xmm1
	cmpneqpd xmm10, xmm3
	andpd xmm10, xmm0
	movupd xmm4, xmmword ptr [rdx + rcx + 88]
	subpd xmm4, xmm5
	movupd xmm8, xmmword ptr [r8 + rcx + 88]
	subpd xmm8, xmm6
	movapd xmm0, xmm4
	mulpd xmm0, xmm4
	movapd xmm15, xmm8
	mulpd xmm15, xmm8
	addpd xmm15, xmm0
	addpd xmm15, xmm7
	movapd xmm3, xmm7
	movupd xmm0, xmmword ptr [rsi + rcx + 88]
	mulpd xmm0, xmm2
	sqrtpd xmm7, xmm15
	mulpd xmm7, xmm15
	divpd xmm0, xmm7
	xorpd xmm1, xmm1
	cmpneqpd xmm15, xmm1
	andpd xmm15, xmm0
	movupd xmm1, xmmword ptr [rdx + rcx + 104]
	subpd xmm1, xmm5
	movupd xmm9, xmmword ptr [r8 + rcx + 104]
	subpd xmm9, xmm6
	movapd xmm7, xmm1
	mulpd xmm7, xmm1
	movapd xmm6, xmm9
	mulpd xmm6, xmm9
	addpd xmm6, xmm7
	addpd xmm6, xmm3
	movupd xmm7, xmmword ptr [rsi + rcx + 104]
	mulpd xmm7, xmm2
	sqrtpd xmm5, xmm6
	mulpd xmm5, xmm6
	divpd xmm7, xmm5
	xorpd xmm0, xmm0
	cmpneqpd xmm6, xmm0
	andpd xmm6, xmm7
	movapd xmm2, xmmword ptr [rsp - 48]
	movapd xmm0, xmmword ptr [rsp + 112]
	mulpd xmm2, xmm0
	mulpd xmm0, xmmword ptr [rsp - 32]
	movapd xmmword ptr [rsp + 112], xmm0
	movapd xmm0, xmmword ptr [rsp - 128]
	mulpd xmm0, xmm12
	movapd xmmword ptr [rsp - 128], xmm0
	mulpd xmm12, xmmword ptr [rsp - 64]
	movapd xmm0, xmmword ptr [rsp + 160]
	mulpd xmm0, xmm13
	movapd xmmword ptr [rsp + 160], xmm0
	mulpd xmm13, xmmword ptr [rsp - 80]
	movapd xmm0, xmmword ptr [rsp + 144]
	mulpd xmm0, xmm14
	movapd xmmword ptr [rsp + 144], xmm0
	mulpd xmm14, xmmword ptr [rsp - 96]
	movapd xmm0, xmmword ptr [rsp + 128]
	mulpd xmm0, xmm10
	movapd xmmword ptr [rsp + 128], xmm0
	mulpd xmm10, xmm11
	mulpd xmm4, xmm15
	movapd xmmword ptr [rsp - 48], xmm4
	mulpd xmm1, xmm6
	movapd xmmword ptr [rsp - 32], xmm1
	mulpd xmm15, xmm8
	mulpd xmm6, xmm9
	movsd xmm5, qword ptr [rdx + rcx]
	movhpd xmm5, qword ptr [r8 + rcx]
	movsd xmm4, qword ptr [rdx + rcx + 120]
	movhpd xmm4, qword ptr [r8 + rcx + 120]
	movapd xmm0, xmmword ptr [rsp + 528]
	subpd xmm4, xmm0
	subpd xmm5, xmm0
	movapd xmm3, xmm5
	mulpd xmm3, xmm5
	movapd xmm7, xmm4
	mulpd xmm7, xmm4
	movapd xmm9, xmm7
	unpcklpd xmm9, xmm3
	unpckhpd xmm7, xmm3
	addpd xmm7, xmm9
	addpd xmm7, xmmword ptr [rsp + 464]
	movsd xmm3, qword ptr [rsi + rcx + 120]
	movhpd xmm3, qword ptr [rsi + rcx]
	mulpd xmm3, xmmword ptr [rsp + 448]
	sqrtpd xmm9, xmm7
	mulpd xmm9, xmm7
	divpd xmm3, xmm9
	xorpd xmm0, xmm0
	cmpneqpd xmm7, xmm0
	andpd xmm7, xmm3
	pshufd xmm0, xmm7, 68
	mulpd xmm0, xmm4
	movapd xmm11, xmm0
	movapd xmmword ptr [rsp + 544], xmm0
	pshufd xmm3, xmm7, 238
	mulpd xmm3, xmm5
	movapd xmmword ptr [rsp - 64], xmm3
	unpcklpd xmm3, xmm2
	movupd xmm0, xmmword ptr [rax + rcx]
	movapd xmmword ptr [rsp - 80], xmm0
	mulpd xmm3, xmm0
	movupd xmm5, xmmword ptr [rbp + rcx]
	subpd xmm5, xmm3
	movupd xmmword ptr [rbp + rcx], xmm5
	movapd xmm0, xmmword ptr [rsp + 80]
	addpd xmm0, xmm2
	movapd xmmword ptr [rsp + 80], xmm0
	movapd xmm4, xmmword ptr [rsp - 128]
	shufpd xmm2, xmm4, 1
	movupd xmm0, xmmword ptr [rax + rcx + 16]
	movapd xmmword ptr [rsp - 96], xmm0
	mulpd xmm2, xmm0
	movupd xmm5, xmmword ptr [rbp + rcx + 16]
	subpd xmm5, xmm2
	movupd xmm3, xmmword ptr [rbp + rcx + 32]
	movupd xmm7, xmmword ptr [rbp + rcx + 48]
	movupd xmm1, xmmword ptr [rbp + rcx + 64]
	movupd xmmword ptr [rbp + rcx + 16], xmm5
	movapd xmm0, xmmword ptr [rsp + 64]
	addpd xmm0, xmm4
	movapd xmmword ptr [rsp + 64], xmm0
	movapd xmm0, xmm4
	movapd xmm4, xmmword ptr [rsp + 160]
	shufpd xmm0, xmm4, 1
	movupd xmm8, xmmword ptr [rax + rcx + 32]
	mulpd xmm0, xmm8
	subpd xmm3, xmm0
	movupd xmmword ptr [rbp + rcx + 32], xmm3
	movapd xmm0, xmmword ptr [rsp + 48]
	addpd xmm0, xmm4
	movapd xmmword ptr [rsp + 48], xmm0
	movapd xmm0, xmm4
	movapd xmm3, xmmword ptr [rsp + 144]
	shufpd xmm0, xmm3, 1
	movupd xmm9, xmmword ptr [rax + rcx + 48]
	mulpd xmm0, xmm9
	subpd xmm7, xmm0
	movupd xmmword ptr [rbp + rcx + 48], xmm7
	movapd xmm0, xmmword ptr [rsp + 32]
	addpd xmm0, xmm3
	movapd xmmword ptr [rsp + 32], xmm0
	movapd xmm0, xmm3
	movapd xmm2, xmmword ptr [rsp + 128]
	shufpd xmm0, xmm2, 1
	movupd xmm5, xmmword ptr [rax + rcx + 64]
	mulpd xmm0, xmm5
	subpd xmm1, xmm0
	movupd xmmword ptr [rbp + rcx + 64], xmm1
	movapd xmm0, xmmword ptr [rsp + 16]
	addpd xmm0, xmm2
	movapd xmmword ptr [rsp + 16], xmm0
	movapd xmm0, xmm2
	movapd xmm2, xmmword ptr [rsp - 48]
	shufpd xmm0, xmm2, 1
	movupd xmm1, xmmword ptr [rax + rcx + 80]
	movapd xmmword ptr [rsp - 128], xmm1
	mulpd xmm0, xmm1
	movupd xmm1, xmmword ptr [rbp + rcx + 80]
	subpd xmm1, xmm0
	movupd xmmword ptr [rbp + rcx + 80], xmm1
	movapd xmm0, xmmword ptr [rsp]
	addpd xmm0, xmm2
	movapd xmmword ptr [rsp], xmm0
	movapd xmm1, xmm2
	movapd xmm2, xmmword ptr [rsp - 32]
	shufpd xmm1, xmm2, 1
	movupd xmm3, xmmword ptr [rax + rcx + 96]
	mulpd xmm1, xmm3
	movupd xmm7, xmmword ptr [rbp + rcx + 96]
	subpd xmm7, xmm1
	movupd xmmword ptr [rbp + rcx + 96], xmm7
	movapd xmm0, xmmword ptr [rsp - 16]
	addpd xmm0, xmm2
	movapd xmmword ptr [rsp - 16], xmm0
	movapd xmm1, xmm2
	shufpd xmm1, xmm11, 1
	movupd xmm7, xmmword ptr [rax + rcx + 112]
	mulpd xmm1, xmm7
	movupd xmm4, xmmword ptr [rbp + rcx + 112]
	subpd xmm4, xmm1
	movupd xmmword ptr [rbp + rcx + 112], xmm4
	movapd xmm0, xmmword ptr [rsp + 96]
	movapd xmm1, xmmword ptr [rsp - 64]
	addpd xmm0, xmm1
	movapd xmmword ptr [rsp + 96], xmm0
	movapd xmm11, xmmword ptr [rsp + 112]
	shufpd xmm1, xmm11, 1
	mulpd xmm1, xmmword ptr [rsp - 80]
	movupd xmm4, xmmword ptr [r14 + rcx]
	subpd xmm4, xmm1
	movupd xmm1, xmmword ptr [r14 + rcx + 16]
	movupd xmm0, xmmword ptr [r14 + rcx + 32]
	movupd xmm2, xmmword ptr [r14 + rcx + 48]
	movupd xmmword ptr [r14 + rcx], xmm4
	movapd xmm4, xmmword ptr [rsp + 672]
	addpd xmm4, xmm11
	shufpd xmm11, xmm12, 1
	mulpd xmm11, xmmword ptr [rsp - 96]
	subpd xmm1, xmm11
	movapd xmm11, xmmword ptr [rsp + 640]
	movupd xmmword ptr [r14 + rcx + 16], xmm1
	movapd xmm1, xmmword ptr [rsp + 656]
	addpd xmm1, xmm12
	shufpd xmm12, xmm13, 1
	mulpd xmm12, xmm8
	subpd xmm0, xmm12
	movupd xmmword ptr [r14 + rcx + 32], xmm0
	addpd xmm11, xmm13
	shufpd xmm13, xmm14, 1
	mulpd xmm13, xmm9
	movapd xmm9, xmmword ptr [rsp + 592]
	subpd xmm2, xmm13
	movupd xmmword ptr [r14 + rcx + 48], xmm2
	movapd xmm2, xmmword ptr [rsp + 624]
	addpd xmm2, xmm14
	shufpd xmm14, xmm10, 1
	mulpd xmm14, xmm5
	movapd xmm5, xmmword ptr [rsp + 608]
	movupd xmm0, xmmword ptr [r14 + rcx + 64]
	subpd xmm0, xmm14
	movupd xmmword ptr [r14 + rcx + 64], xmm0
	addpd xmm5, xmm10
	shufpd xmm10, xmm15, 1
	mulpd xmm10, xmmword ptr [rsp - 128]
	movupd xmm0, xmmword ptr [r14 + rcx + 80]
	subpd xmm0, xmm10
	movupd xmmword ptr [r14 + rcx + 80], xmm0
	addpd xmm9, xmm15
	shufpd xmm15, xmm6, 1
	mulpd xmm15, xmm3
	movapd xmm3, xmmword ptr [rsp + 576]
	movupd xmm0, xmmword ptr [r14 + rcx + 96]
	subpd xmm0, xmm15
	movupd xmmword ptr [r14 + rcx + 96], xmm0
	addpd xmm3, xmm6
	movapd xmm8, xmmword ptr [rsp + 544]
	unpckhpd xmm6, xmm8
	mulpd xmm6, xmm7
	movupd xmm0, xmmword ptr [r14 + rcx + 112]
	subpd xmm0, xmm6
	movapd xmm6, xmmword ptr [rsp + 560]
	movupd xmmword ptr [r14 + rcx + 112], xmm0
	addpd xmm6, xmm8
	sub rcx, -128
	cmp r11, rcx
	jne .LBB29_3
	movaps xmm0, xmmword ptr [rsp + 80]
	movups xmmword ptr [rsp + 200], xmm0
	movaps xmm0, xmmword ptr [rsp + 64]
	movups xmmword ptr [rsp + 216], xmm0
	movaps xmm0, xmmword ptr [rsp + 48]
	movups xmmword ptr [rsp + 232], xmm0
	movaps xmm0, xmmword ptr [rsp + 32]
	movups xmmword ptr [rsp + 248], xmm0
	movaps xmm0, xmmword ptr [rsp + 16]
	movups xmmword ptr [rsp + 264], xmm0
	movaps xmm0, xmmword ptr [rsp]
	movups xmmword ptr [rsp + 280], xmm0
	movaps xmm0, xmmword ptr [rsp - 16]
	movups xmmword ptr [rsp + 296], xmm0
	movlpd qword ptr [rsp + 312], xmm6
	movupd xmmword ptr [rsp + 328], xmm4
	movupd xmmword ptr [rsp + 344], xmm1
	movupd xmmword ptr [rsp + 360], xmm11
	movupd xmmword ptr [rsp + 376], xmm2
	movupd xmmword ptr [rsp + 392], xmm5
	movupd xmmword ptr [rsp + 408], xmm9
	movupd xmmword ptr [rsp + 424], xmm3
	movhpd qword ptr [rsp + 440], xmm6
	movapd xmm2, xmmword ptr [rsp + 96]
	movapd xmm1, xmm2
	unpckhpd xmm1, xmm2
	movapd xmm0, xmmword ptr [rsp + 480]
	jmp .LBB29_5
.LBB29_1:
	xorpd xmm1, xmm1
	xorpd xmm2, xmm2
.LBB29_5:
	mov r10, qword ptr [rsp - 104]
	mov r11d, r10d
	and r11d, 15
	cmp r15, r11
	cmovb r11, r15
	cmp r12, r11
	cmovb r11, r12
	movsd qword ptr [rsp + 192], xmm2
	cmp r13, r11
	cmovb r11, r13
	movsd qword ptr [rsp + 320], xmm1
	mov ecx, ebx
	and ecx, 15
	mov r15d, r9d
	and r15d, 15
	cmp r15, rcx
	cmovb rcx, r15
	cmp rcx, r11
	cmovae rcx, r11
	test rcx, rcx
	je .LBB29_10
	movabs r11, 1152921504606846960
	and r10, r11
	mov r12, r10
	mov r10, qword ptr [rsp + 176]
	and r10, r11
	mov r13, qword ptr [rsp + 760]
	mov r15, rdi
	mov rdi, r9
	mov r9, r13
	and r9, r11
	mov r13, qword ptr [rsp + 776]
	and r13, r11
	movabs r11, 576460752303423472
	and rbx, r11
	and rdi, r11
	lea rdx, [rdx + 8*r12]
	lea r8, [r8 + 8*r10]
	lea rsi, [rsi + 8*r9]
	lea rax, [rax + 8*r13]
	lea r10, [rbp + 8*rbx]
	lea r9, [r14 + 8*rdi]
	mov rdi, r15
	mov r11, qword ptr [rsp + 184]
	movsd xmm8, qword ptr [r11]
	movsd xmm1, qword ptr [r11 + 8]
	movsd xmm2, qword ptr [r11 + 16]
	xor r11d, r11d
	jmp .LBB29_7
	.p2align	4
.LBB29_9:
	movsd xmm6, qword ptr [rax + 8*r11]
	mulsd xmm3, xmm5
	mulsd xmm4, xmm5
	movapd xmm5, xmm6
	mulsd xmm5, xmm3
	movsd xmm7, qword ptr [r10 + 8*r11]
	subsd xmm7, xmm5
	movsd qword ptr [r10 + 8*r11], xmm7
	mulsd xmm6, xmm4
	movsd xmm5, qword ptr [r9 + 8*r11]
	subsd xmm5, xmm6
	addsd xmm3, qword ptr [rsp + 8*r11 + 192]
	movsd qword ptr [r9 + 8*r11], xmm5
	movsd qword ptr [rsp + 8*r11 + 192], xmm3
	addsd xmm4, qword ptr [rsp + 8*r11 + 320]
	movsd qword ptr [rsp + 8*r11 + 320], xmm4
	inc r11
	cmp rcx, r11
	je .LBB29_10
.LBB29_7:
	movsd xmm3, qword ptr [rdx + 8*r11]
	subsd xmm3, xmm8
	movsd xmm4, qword ptr [r8 + 8*r11]
	subsd xmm4, xmm1
	movapd xmm5, xmm3
	mulsd xmm5, xmm3
	movapd xmm6, xmm4
	mulsd xmm6, xmm4
	addsd xmm6, xmm5
	addsd xmm6, xmm0
	xorpd xmm5, xmm5
	ucomisd xmm6, xmm5
	jne .LBB29_8
	jnp .LBB29_9
.LBB29_8:
	movsd xmm5, qword ptr [rsi + 8*r11]
	mulsd xmm5, xmm2
	xorps xmm7, xmm7
	sqrtsd xmm7, xmm6
	mulsd xmm7, xmm6
	divsd xmm5, xmm7
	jmp .LBB29_9
.LBB29_10:
	movups xmm0, xmmword ptr [rsp + 304]
	movups xmmword ptr [rdi + 112], xmm0
	movups xmm0, xmmword ptr [rsp + 288]
	movups xmmword ptr [rdi + 96], xmm0
	movups xmm0, xmmword ptr [rsp + 272]
	movups xmmword ptr [rdi + 80], xmm0
	movups xmm0, xmmword ptr [rsp + 256]
	movups xmmword ptr [rdi + 64], xmm0
	movups xmm0, xmmword ptr [rsp + 192]
	movups xmm1, xmmword ptr [rsp + 208]
	movups xmm2, xmmword ptr [rsp + 224]
	movups xmm3, xmmword ptr [rsp + 240]
	movups xmmword ptr [rdi + 48], xmm3
	movups xmmword ptr [rdi + 32], xmm2
	movups xmmword ptr [rdi + 16], xmm1
	movups xmmword ptr [rdi], xmm0
	movups xmm0, xmmword ptr [rsp + 320]
	movups xmm1, xmmword ptr [rsp + 336]
	movups xmm2, xmmword ptr [rsp + 352]
	movups xmm3, xmmword ptr [rsp + 368]
	movups xmmword ptr [rdi + 128], xmm0
	movups xmmword ptr [rdi + 144], xmm1
	movups xmmword ptr [rdi + 160], xmm2
	movups xmmword ptr [rdi + 176], xmm3
	movups xmm0, xmmword ptr [rsp + 384]
	movups xmmword ptr [rdi + 192], xmm0
	movups xmm0, xmmword ptr [rsp + 400]
	movups xmmword ptr [rdi + 208], xmm0
	movups xmm0, xmmword ptr [rsp + 416]
	movups xmmword ptr [rdi + 224], xmm0
	movups xmm0, xmmword ptr [rsp + 432]
	movups xmmword ptr [rdi + 240], xmm0
	add rsp, 696
	.cfi_def_cfa_offset 56
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
