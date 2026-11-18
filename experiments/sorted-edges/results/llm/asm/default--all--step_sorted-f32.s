<swarm::flock::Flock>::step_sorted:
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
	sub rsp, 776
	.cfi_def_cfa_offset 832
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r13, rdi
	lea rax, [rdi + 316]
	mov qword ptr [rsp + 568], rax
	movss xmm4, dword ptr [rdi + 288]
	movss xmm6, dword ptr [rdi + 292]
	movss dword ptr [rsp + 172], xmm6
	mov eax, dword ptr [rdi + 312]
	mov dword ptr [rsp + 664], eax
	mov rax, qword ptr [rdi + 304]
	mov qword ptr [rsp + 656], rax
	movss xmm5, dword ptr [rdi + 316]
	mov rax, qword ptr [rdi + 8]
	mov qword ptr [rsp + 96], rax
	mov rbp, qword ptr [rdi + 16]
	mov rax, qword ptr [rdi + 32]
	mov qword ptr [rsp + 144], rax
	mov rax, qword ptr [rdi + 40]
	mov qword ptr [rsp + 240], rax
	movss xmm0, dword ptr [rip + .LCPI1952_0]
	movaps xmm1, xmm4
	mulss xmm1, xmm0
	movaps xmm2, xmm5
	maxss xmm2, xmm1
	cmpunordss xmm1, xmm1
	movaps xmm3, xmm1
	andnps xmm3, xmm2
	movaps xmmword ptr [rsp + 176], xmm5
	andps xmm1, xmm5
	orps xmm1, xmm3
	mulss xmm0, xmm6
	movaps xmm2, xmm0
	cmpunordss xmm2, xmm0
	movaps xmm3, xmm2
	andps xmm3, xmm1
	maxss xmm1, xmm0
	andnps xmm2, xmm1
	orps xmm2, xmm3
	mulss xmm2, dword ptr [rip + .LCPI1952_1]
	movss xmm1, dword ptr [rip + .LCPI1952_2]
	divss xmm1, xmm2
	movss dword ptr [rsp + 112], xmm1
	movss dword ptr [rdi + 280], xmm1
	movss dword ptr [rsp + 268], xmm4
	movaps xmm0, xmm4
	mulss xmm0, xmm1
	mov rbx, qword ptr [rip + ceilf@GOTPCREL]
	call rbx
	xorps xmm1, xmm1
	cvtss2sd xmm1, xmm0
	cvttsd2si rax, xmm1
	mov rcx, rax
	sar rcx, 63
	movapd xmm2, xmm1
	subsd xmm2, qword ptr [rip + .LCPI1952_3]
	cvttsd2si rdx, xmm2
	and rdx, rcx
	or rdx, rax
	xor r15d, r15d
	xorpd xmm2, xmm2
	ucomisd xmm1, xmm2
	cmovb rdx, r15
	ucomisd xmm1, qword ptr [rip + .LCPI1952_4]
	mov r12, -1
	cmova rdx, r12
	cmp rdx, 1
	adc rdx, 0
	movss xmm1, dword ptr [rip + .LCPI1952_5]
	ucomiss xmm1, xmm0
	mov r14d, 1
	cmovbe rdx, r14
	xorps xmm1, xmm1
	ucomiss xmm0, xmm1
	cmovb rdx, r14
	mov qword ptr [r13 + 264], rdx
	movss xmm0, dword ptr [rsp + 112]
	mulss xmm0, dword ptr [rsp + 172]
	call rbx
	xorps xmm1, xmm1
	cvtss2sd xmm1, xmm0
	cvttsd2si rax, xmm1
	mov rcx, rax
	sar rcx, 63
	movapd xmm2, xmm1
	subsd xmm2, qword ptr [rip + .LCPI1952_3]
	cvttsd2si rdx, xmm2
	and rdx, rcx
	or rdx, rax
	xorpd xmm2, xmm2
	ucomisd xmm1, xmm2
	cmovb rdx, r15
	ucomisd xmm1, qword ptr [rip + .LCPI1952_4]
	cmova rdx, r12
	cmp rdx, 1
	adc rdx, 0
	movss xmm1, dword ptr [rip + .LCPI1952_5]
	ucomiss xmm1, xmm0
	cmovbe rdx, r14
	xorps xmm1, xmm1
	ucomiss xmm0, xmm1
	cmovb rdx, r14
	mov qword ptr [r13 + 272], rdx
	lea rdi, [r13 + 192]
	mov rsi, qword ptr [rsp + 96]
	mov rdx, rbp
	mov rcx, qword ptr [rsp + 144]
	mov r8, qword ptr [rsp + 240]
	call <swarm::grid::Grid>::fill
	mov rcx, r13
	mov r12, qword ptr [r13 + 248]
	mov rax, qword ptr [r13 + 256]
	mov rbp, qword ptr [r13 + 8]
	mov r14, qword ptr [r13 + 16]
	mov qword ptr [r13 + 112], 0
	lea rbx, [r12 + 4*rax]
	lea rax, [r13 + 96]
	mov qword ptr [rsp + 144], rax
	mov r13, r12
	mov qword ptr [rsp + 40], rcx
	jmp .LBB1952_2
.LBB1952_5:
	xor eax, eax
	mov r13, rbx
	cmp eax, 1
	jne .LBB1952_8
.LBB1952_6:
	cmp r15, qword ptr [rcx + 96]
	je .LBB1952_7
.LBB1952_1:
	mov rax, qword ptr [rcx + 104]
	movss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rcx + 112], r15
	.p2align	4
.LBB1952_2:
	cmp r13, rbx
	je .LBB1952_5
	mov eax, dword ptr [r13]
	add r13, 4
	cmp r14, rax
	jbe .LBB1952_2
	movss xmm0, dword ptr [rbp + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1952_6
	jmp .LBB1952_8
.LBB1952_7:
	mov edx, 1
	mov rdi, qword ptr [rsp + 144]
	mov rsi, r15
	movss dword ptr [rsp + 96], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 96]
	mov rcx, qword ptr [rsp + 40]
	jmp .LBB1952_1
.LBB1952_8:
	mov r13, qword ptr [rcx + 32]
	mov r15, qword ptr [rcx + 40]
	mov qword ptr [rcx + 136], 0
	xor r14d, r14d
	lea rax, [rcx + 120]
	mov qword ptr [rsp + 144], rax
	mov rbp, r12
	jmp .LBB1952_10
.LBB1952_13:
	xor eax, eax
	mov rbp, rbx
	cmp eax, 1
	jne .LBB1952_16
.LBB1952_14:
	cmp r14, qword ptr [rcx + 120]
	je .LBB1952_15
.LBB1952_9:
	mov rax, qword ptr [rcx + 128]
	movss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rcx + 136], r14
	.p2align	4
.LBB1952_10:
	cmp rbp, rbx
	je .LBB1952_13
	mov eax, dword ptr [rbp]
	add rbp, 4
	cmp r15, rax
	jbe .LBB1952_10
	movss xmm0, dword ptr [r13 + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1952_14
	jmp .LBB1952_16
.LBB1952_15:
	mov edx, 1
	mov rdi, qword ptr [rsp + 144]
	mov rsi, r14
	movss dword ptr [rsp + 96], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 96]
	mov rcx, qword ptr [rsp + 40]
	jmp .LBB1952_9
.LBB1952_16:
	mov r13, qword ptr [rcx + 56]
	mov r15, qword ptr [rcx + 64]
	mov qword ptr [rcx + 160], 0
	xor r14d, r14d
	lea rax, [rcx + 144]
	mov qword ptr [rsp + 144], rax
	mov rbp, r12
	jmp .LBB1952_18
.LBB1952_21:
	xor eax, eax
	mov rbp, rbx
	cmp eax, 1
	jne .LBB1952_24
.LBB1952_22:
	cmp r14, qword ptr [rcx + 144]
	je .LBB1952_23
.LBB1952_17:
	mov rax, qword ptr [rcx + 152]
	movss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rcx + 160], r14
	.p2align	4
.LBB1952_18:
	cmp rbp, rbx
	je .LBB1952_21
	mov eax, dword ptr [rbp]
	add rbp, 4
	cmp r15, rax
	jbe .LBB1952_18
	movss xmm0, dword ptr [r13 + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1952_22
	jmp .LBB1952_24
.LBB1952_23:
	mov edx, 1
	mov rdi, qword ptr [rsp + 144]
	mov rsi, r14
	movss dword ptr [rsp + 96], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 96]
	mov rcx, qword ptr [rsp + 40]
	jmp .LBB1952_17
.LBB1952_24:
	mov r13, qword ptr [rcx + 80]
	mov r15, qword ptr [rcx + 88]
	mov qword ptr [rcx + 184], 0
	xor r14d, r14d
	lea rbp, [rcx + 168]
	jmp .LBB1952_26
.LBB1952_29:
	xor eax, eax
	mov r12, rbx
	cmp eax, 1
	jne .LBB1952_32
.LBB1952_30:
	cmp r14, qword ptr [rcx + 168]
	je .LBB1952_31
.LBB1952_25:
	mov rax, qword ptr [rcx + 176]
	movss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rcx + 184], r14
	.p2align	4
.LBB1952_26:
	cmp r12, rbx
	je .LBB1952_29
	mov eax, dword ptr [r12]
	add r12, 4
	cmp r15, rax
	jbe .LBB1952_26
	movss xmm0, dword ptr [r13 + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1952_30
	jmp .LBB1952_32
.LBB1952_31:
	mov edx, 1
	mov rdi, rbp
	mov rsi, r14
	movss dword ptr [rsp + 96], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 96]
	mov rcx, qword ptr [rsp + 40]
	jmp .LBB1952_25
.LBB1952_32:
	movups xmm0, xmmword ptr [rcx + 96]
	mov rax, qword ptr [rcx + 8]
	mov qword ptr [rsp + 544], rax
	movups xmm1, xmmword ptr [rcx]
	movups xmmword ptr [rcx], xmm0
	movups xmmword ptr [rcx + 96], xmm1
	movups xmm0, xmmword ptr [rcx + 112]
	mov rdi, qword ptr [rcx + 112]
	movups xmm1, xmmword ptr [rcx + 16]
	mov r8, qword ptr [rcx + 16]
	movups xmmword ptr [rcx + 16], xmm0
	movups xmmword ptr [rcx + 112], xmm1
	mov rax, qword ptr [rcx + 32]
	movups xmm0, xmmword ptr [rcx + 128]
	mov qword ptr [rsp + 536], rax
	mov qword ptr [rcx + 128], rax
	mov rdx, qword ptr [rcx + 56]
	movups xmm1, xmmword ptr [rcx + 144]
	movups xmm2, xmmword ptr [rcx + 40]
	mov rax, qword ptr [rcx + 40]
	movups xmmword ptr [rcx + 32], xmm0
	movups xmmword ptr [rcx + 136], xmm2
	movups xmmword ptr [rcx + 48], xmm1
	mov qword ptr [rsp + 528], rdx
	mov qword ptr [rcx + 152], rdx
	movups xmm0, xmmword ptr [rcx + 64]
	movups xmm1, xmmword ptr [rcx + 160]
	mov rdx, qword ptr [rcx + 64]
	movups xmmword ptr [rcx + 64], xmm1
	movups xmmword ptr [rcx + 160], xmm0
	mov r9, qword ptr [rcx + 80]
	mov rsi, rcx
	mov rcx, qword ptr [rcx + 176]
	mov qword ptr [rsi + 80], rcx
	mov qword ptr [rsp + 520], r9
	mov qword ptr [rsi + 176], r9
	mov rcx, qword ptr [rsi + 88]
	mov qword ptr [rsi + 88], r14
	mov qword ptr [rsi + 184], rcx
	test rdi, rdi
	je .LBB1952_105
	mov rsi, qword ptr [rsp + 40]
	movss xmm1, dword ptr [rsi + 320]
	cmp rax, r8
	cmovb r8, rax
	mulss xmm1, xmm1
	cmp rdx, r8
	cmovb r8, rdx
	movaps xmm0, xmmword ptr [rsp + 176]
	mulss xmm0, xmm0
	movaps xmmword ptr [rsp + 176], xmm0
	shufps xmm0, xmm0, 0
	movaps xmmword ptr [rsp + 192], xmm1
	shufps xmm1, xmm1, 0
	cmp rcx, r8
	cmovb r8, rcx
	mov qword ptr [rsp + 552], r8
	xor esi, esi
	mov qword ptr [rsp + 560], rdi
	movaps xmmword ptr [rsp + 448], xmm0
	movaps xmmword ptr [rsp + 672], xmm1
	jmp .LBB1952_36
.LBB1952_34:
	mov rdi, qword ptr [rsp + 560]
	.p2align	4
.LBB1952_35:
	inc rsi
	cmp rsi, rdi
	je .LBB1952_105
.LBB1952_36:
	mov rax, qword ptr [rsp + 40]
	mov rbp, qword ptr [rax + 16]
	cmp rsi, rbp
	jae .LBB1952_35
	mov rcx, qword ptr [rax + 40]
	mov qword ptr [rsp + 360], rcx
	cmp rsi, rcx
	jae .LBB1952_35
	mov rcx, qword ptr [rax + 64]
	mov rax, qword ptr [rax + 88]
	mov qword ptr [rsp + 352], rcx
	cmp rsi, rcx
	setb cl
	mov qword ptr [rsp + 344], rax
	cmp rsi, rax
	setb dl
	and dl, cl
	mov rax, qword ptr [rsp + 40]
	cmp dl, 1
	jne .LBB1952_35
	mov rcx, qword ptr [rax + 8]
	mov qword ptr [rsp + 392], rcx
	movss xmm9, dword ptr [rcx + 4*rsi]
	mov rcx, qword ptr [rax + 32]
	mov rdx, qword ptr [rax + 56]
	mov qword ptr [rsp + 384], rcx
	movss xmm10, dword ptr [rcx + 4*rsi]
	mov r9, qword ptr [rax + 80]
	movss xmm0, dword ptr [rax + 280]
	movaps xmm2, xmm9
	mulss xmm2, xmm0
	xorps xmm8, xmm8
	maxss xmm2, xmm8
	xorps xmm3, xmm3
	cvtss2sd xmm3, xmm2
	movaps xmm1, xmm3
	movsd xmm4, qword ptr [rip + .LCPI1952_3]
	subsd xmm1, xmm4
	cvttsd2si r10, xmm1
	mov qword ptr [rsp + 376], rdx
	movss xmm1, dword ptr [rdx + 4*rsi]
	mov r11, qword ptr [rax + 264]
	cvttsd2si rcx, xmm3
	mov rdx, rcx
	sar rdx, 63
	and r10, rdx
	or r10, rcx
	xorpd xmm7, xmm7
	ucomisd xmm3, xmm7
	mov edi, 0
	cmovb r10, rdi
	movsd xmm5, qword ptr [rip + .LCPI1952_4]
	ucomisd xmm3, xmm5
	mov r8, -1
	cmova r10, r8
	mov qword ptr [rsp + 640], r11
	mov rcx, r11
	sub rcx, 1
	cmovb rcx, rdi
	cmp rcx, r10
	cmovb r10, rcx
	movss xmm6, dword ptr [rip + .LCPI1952_5]
	ucomiss xmm2, xmm6
	mulss xmm0, xmm10
	maxss xmm0, xmm8
	xorps xmm3, xmm3
	cvtss2sd xmm3, xmm0
	movaps xmm2, xmm3
	subsd xmm2, xmm4
	cvttsd2si r11, xmm2
	mov qword ptr [rsp + 576], rsi
	mov qword ptr [rsp + 368], r9
	movss xmm2, dword ptr [r9 + 4*rsi]
	movss dword ptr [rsp + 416], xmm9
	cmovae r10, rdi
	cvttsd2si rdx, xmm3
	mov rsi, rdx
	sar rsi, 63
	and r11, rsi
	or r11, rdx
	ucomisd xmm3, xmm7
	cmovb r11, rdi
	ucomisd xmm3, xmm5
	movss dword ptr [rsp + 420], xmm10
	cmova r11, r8
	mov rdx, qword ptr [rax + 272]
	sub rdx, 1
	cmovb rdx, rdi
	movss dword ptr [rsp + 424], xmm1
	cmp rdx, r11
	cmovb r11, rdx
	ucomiss xmm0, xmm6
	cmovae r11, rdi
	mov rax, r10
	sub rax, 1
	cmovb rax, rdi
	mov qword ptr [rsp + 624], rax
	mov r12, r11
	sub r12, 1
	cmovb r12, rdi
	inc r11
	cmp rdx, r11
	cmovb r11, rdx
	movss dword ptr [rsp + 428], xmm2
	xorps xmm2, xmm2
	xorps xmm3, xmm3
	mov qword ptr [rsp + 632], r11
	cmp r12, r11
	ja .LBB1952_103
	inc r10
	cmp rcx, r10
	cmovb r10, rcx
	mov rax, qword ptr [rsp + 352]
	mov rcx, qword ptr [rsp + 344]
	cmp rax, rcx
	cmovb rcx, rax
	inc r10
	mov qword ptr [rsp + 600], r10
	mov rax, qword ptr [rsp + 360]
	cmp rax, rcx
	cmovb rcx, rax
	mov qword ptr [rsp + 584], rcx
	mov rax, qword ptr [rsp + 40]
	mov rcx, qword ptr [rax + 200]
	mov qword ptr [rsp + 592], rcx
	mov rdi, qword ptr [rax + 208]
	movaps xmmword ptr [rsp + 208], xmm10
	movaps xmm3, xmm10
	shufps xmm3, xmm10, 0
	movaps xmmword ptr [rsp + 224], xmm9
	shufps xmm9, xmm9, 0
	movaps xmmword ptr [rsp + 464], xmm9
	xorpd xmm4, xmm4
	xorps xmm0, xmm0
	movss dword ptr [rsp + 12], xmm0
	xorps xmm9, xmm9
	xorps xmm14, xmm14
	xorpd xmm5, xmm5
	xorps xmm11, xmm11
	xorps xmm13, xmm13
	xorps xmm10, xmm10
	xorps xmm15, xmm15
	xorps xmm8, xmm8
	xorps xmm12, xmm12
	xorps xmm6, xmm6
	xorpd xmm7, xmm7
	xorps xmm1, xmm1
	movaps xmmword ptr [rsp + 80], xmm0
	movaps xmmword ptr [rsp + 48], xmm0
	xorps xmm0, xmm0
	movaps xmmword ptr [rsp + 64], xmm0
	mov qword ptr [rsp + 608], rdi
	mov qword ptr [rsp + 616], rbp
	movaps xmmword ptr [rsp + 480], xmm3
	jmp .LBB1952_46
	.p2align	4
.LBB1952_57:
	add r9, rdx
	mov rax, r13
	sub rax, r9
	movq xmm0, rax
	pshufd xmm1, xmm0, 68
	movdqa xmm0, xmmword ptr [rip + .LCPI1952_7]
	movaps xmmword ptr [rsp + 288], xmm8
	movdqa xmm8, xmm0
	pxor xmm1, xmm0
	pshufd xmm3, xmm1, 160
	movdqa xmmword ptr [rsp + 720], xmm3
	movdqa xmm0, xmm3
	pcmpgtd xmm0, xmmword ptr [rip + .LCPI1952_8]
	pshufd xmm1, xmm1, 245
	pcmpeqd xmm1, xmm8
	movdqa xmmword ptr [rsp + 496], xmm1
	pandn xmm0, xmm1
	pcmpgtd xmm3, xmmword ptr [rip + .LCPI1952_9]
	pandn xmm3, xmm1
	movdqa xmm1, xmm3
	shufps xmm1, xmm0, 136
	sub r13, rdx
	movaps xmmword ptr [rsp + 304], xmm6
	movq xmm6, r13
	pshufd xmm5, xmm6, 68
	pxor xmm5, xmm8
	movdqa xmm6, xmm5
	pcmpgtd xmm6, xmmword ptr [rip + .LCPI1952_10]
	pshufd xmm7, xmm6, 160
	pshufd xmm9, xmm5, 245
	pcmpeqd xmm9, xmm8
	movdqa xmmword ptr [rsp + 752], xmm9
	pand xmm7, xmm9
	pshufd xmm8, xmm6, 245
	por xmm8, xmm7
	movdqa xmm6, xmm5
	pcmpgtd xmm6, xmmword ptr [rip + .LCPI1952_11]
	pshufd xmm7, xmm6, 160
	pand xmm7, xmm9
	pshufd xmm6, xmm6, 245
	por xmm6, xmm7
	pand xmm3, xmm6
	shufps xmm6, xmm8, 136
	andps xmm6, xmm1
	andps xmm8, xmm0
	shufps xmm3, xmm8, 136
	mov rax, qword ptr [rsp + 392]
	movups xmm13, xmmword ptr [rax + 4*rdx + 16]
	movaps xmm7, xmmword ptr [rsp + 464]
	subps xmm7, xmm13
	movaps xmmword ptr [rsp + 736], xmm7
	mulps xmm7, xmm7
	mov rcx, qword ptr [rsp + 384]
	movups xmm1, xmmword ptr [rcx + 4*rdx + 16]
	movaps xmm2, xmmword ptr [rsp + 480]
	subps xmm2, xmm1
	movaps xmm0, xmm2
	mulps xmm0, xmm2
	addps xmm0, xmm7
	movaps xmmword ptr [rsp + 272], xmm14
	movaps xmm9, xmmword ptr [rsp + 672]
	movaps xmm7, xmm9
	cmpleps xmm7, xmm0
	movaps xmm8, xmm0
	movaps xmm15, xmm10
	cmpltps xmm8, xmmword ptr [rsp + 448]
	andps xmm8, xmm7
	xorps xmm7, xmm7
	cmpltps xmm7, xmm0
	andps xmm7, xmm6
	andps xmm7, xmm8
	movaps xmm12, xmmword ptr [rip + .LCPI1952_6]
	andps xmm7, xmm12
	mov rdi, qword ptr [rsp + 368]
	movups xmm6, xmmword ptr [rdi + 4*rdx + 16]
	mulps xmm6, xmm7
	addps xmm15, xmm6
	mov rsi, qword ptr [rsp + 376]
	movups xmm6, xmmword ptr [rsi + 4*rdx + 16]
	mulps xmm6, xmm7
	movaps xmm8, xmmword ptr [rsp + 288]
	addps xmm8, xmm6
	movaps xmmword ptr [rsp + 288], xmm8
	mulps xmm1, xmm7
	movaps xmm6, xmmword ptr [rsp + 304]
	addps xmm6, xmm1
	movaps xmmword ptr [rsp + 304], xmm6
	addps xmm11, xmm7
	mulps xmm7, xmm13
	movaps xmm1, xmmword ptr [rsp + 96]
	addps xmm1, xmm7
	movaps xmmword ptr [rsp + 96], xmm1
	movups xmm14, xmmword ptr [rax + 4*rdx]
	cmpltps xmm0, xmm9
	andps xmm3, xmm12
	andps xmm3, xmm0
	movups xmm10, xmmword ptr [rcx + 4*rdx]
	mulps xmm2, xmm3
	addps xmm4, xmm2
	mulps xmm3, xmmword ptr [rsp + 736]
	movaps xmm0, xmmword ptr [rsp + 272]
	addps xmm0, xmm3
	movaps xmmword ptr [rsp + 272], xmm0
	movdqa xmm2, xmmword ptr [rsp + 720]
	movdqa xmm0, xmm2
	pcmpgtd xmm0, xmmword ptr [rip + .LCPI1952_12]
	movdqa xmm1, xmmword ptr [rsp + 496]
	pandn xmm0, xmm1
	pcmpgtd xmm2, xmmword ptr [rip + .LCPI1952_13]
	pandn xmm2, xmm1
	movdqa xmm1, xmm2
	shufps xmm1, xmm0, 136
	movdqa xmm3, xmm5
	pcmpgtd xmm3, xmmword ptr [rip + .LCPI1952_14]
	pshufd xmm6, xmm3, 160
	movdqa xmm7, xmmword ptr [rsp + 752]
	pand xmm6, xmm7
	pshufd xmm3, xmm3, 245
	por xmm3, xmm6
	pcmpgtd xmm5, xmmword ptr [rip + .LCPI1952_15]
	pshufd xmm6, xmm5, 160
	pand xmm6, xmm7
	pshufd xmm7, xmm5, 245
	por xmm7, xmm6
	pand xmm2, xmm7
	shufps xmm7, xmm3, 136
	andps xmm7, xmm1
	andps xmm3, xmm0
	shufps xmm2, xmm3, 136
	movaps xmm5, xmmword ptr [rsp + 464]
	subps xmm5, xmm14
	movaps xmm6, xmm5
	mulps xmm6, xmm5
	movaps xmm3, xmmword ptr [rsp + 480]
	movaps xmm0, xmm10
	subps xmm3, xmm10
	movaps xmm1, xmm3
	mulps xmm1, xmm3
	addps xmm1, xmm6
	movaps xmm6, xmm9
	cmpleps xmm6, xmm1
	movaps xmm8, xmm1
	cmpltps xmm8, xmmword ptr [rsp + 448]
	movaps xmm10, xmm15
	andps xmm8, xmm6
	xorps xmm6, xmm6
	cmpltps xmm6, xmm1
	andps xmm6, xmm7
	andps xmm6, xmm8
	movaps xmm8, xmmword ptr [rsp + 288]
	movups xmm7, xmmword ptr [rdi + 4*rdx]
	andps xmm6, xmm12
	mulps xmm7, xmm6
	movaps xmm15, xmmword ptr [rsp + 128]
	addps xmm15, xmm7
	movups xmm7, xmmword ptr [rsi + 4*rdx]
	mulps xmm7, xmm6
	movaps xmm13, xmmword ptr [rsp + 144]
	addps xmm13, xmm7
	movaps xmmword ptr [rsp + 144], xmm13
	movaps xmm7, xmm0
	mulps xmm7, xmm6
	movaps xmm0, xmmword ptr [rsp + 320]
	addps xmm0, xmm7
	movaps xmm13, xmmword ptr [rsp + 112]
	addps xmm13, xmm6
	mulps xmm6, xmm14
	movaps xmm7, xmmword ptr [rsp + 16]
	addps xmm7, xmm6
	movaps xmm6, xmmword ptr [rsp + 304]
	cmpltps xmm1, xmm9
	movaps xmm14, xmmword ptr [rsp + 272]
	andps xmm2, xmm12
	andps xmm2, xmm1
	movaps xmm1, xmm7
	mulps xmm3, xmm2
	movaps xmm9, xmmword ptr [rsp + 400]
	addps xmm9, xmm3
	mulps xmm2, xmm5
	movaps xmm5, xmmword ptr [rsp + 240]
	addps xmm5, xmm2
	movaps xmm2, xmm0
.LBB1952_45:
	mov rax, qword ptr [rsp + 648]
	cmp rax, qword ptr [rsp + 632]
	lea r12, [rax + 1]
	movaps xmm7, xmmword ptr [rsp + 96]
	movaps xmm12, xmmword ptr [rsp + 144]
	mov rdi, qword ptr [rsp + 608]
	je .LBB1952_102
.LBB1952_46:
	movaps xmm3, xmm1
	mov rcx, qword ptr [rsp + 640]
	imul rcx, r12
	mov rax, qword ptr [rsp + 624]
	lea rsi, [rcx + rax]
	cmp rsi, rdi
	mov qword ptr [rsp + 648], r12
	movaps xmm1, xmm12
	jae .LBB1952_49
	add rcx, qword ptr [rsp + 600]
	mov r13d, 0
	mov edx, 0
	cmp rcx, rdi
	jae .LBB1952_50
	mov rax, qword ptr [rsp + 592]
	mov edx, dword ptr [rax + 4*rsi]
	mov r13d, dword ptr [rax + 4*rcx]
	jmp .LBB1952_50
	.p2align	4
.LBB1952_49:
	xor r13d, r13d
	xor edx, edx
.LBB1952_50:
	mov r11, r13
	sub r11, rdx
	setb r9b
	cmp r13, rbp
	seta cl
	or cl, r9b
	mov rax, qword ptr [rsp + 392]
	lea rcx, [rax + 4*rdx]
	mov r14, r11
	mov ebp, 0
	cmovne r14, rbp
	mov eax, 4
	cmovne rcx, rax
	cmp r13, qword ptr [rsp + 360]
	seta sil
	or sil, r9b
	mov r10, r11
	cmovne r10, rbp
	mov rsi, qword ptr [rsp + 384]
	lea rsi, [rsi + 4*rdx]
	cmovne rsi, rax
	mov rbx, r10
	shr rbx, 3
	cmp r13, qword ptr [rsp + 352]
	seta dil
	or dil, r9b
	mov rdi, qword ptr [rsp + 376]
	lea rdi, [rdi + 4*rdx]
	mov r12, r11
	cmovne r12, rbp
	cmovne rdi, rax
	mov r8, r12
	shr r8, 3
	cmp r13, qword ptr [rsp + 344]
	seta r15b
	or r15b, r9b
	mov r9, qword ptr [rsp + 368]
	lea r15, [r9 + 4*rdx]
	cmovne r11, rbp
	cmovne r15, rax
	mov r9, r11
	shr r9, 3
	mov rdx, r14
	shr rdx, 3
	cmp rbx, rdx
	cmovb rdx, rbx
	cmp r8, rdx
	cmovb rdx, r8
	cmp r9, rdx
	cmovb rdx, r9
	test rdx, rdx
	movaps xmmword ptr [rsp + 112], xmm13
	movapd xmmword ptr [rsp + 240], xmm5
	movaps xmmword ptr [rsp + 400], xmm9
	movaps xmmword ptr [rsp + 320], xmm2
	movaps xmmword ptr [rsp + 128], xmm15
	movaps xmmword ptr [rsp + 144], xmm1
	je .LBB1952_53
	shl rdx, 5
	xor r9d, r9d
	movaps xmm2, xmm3
	.p2align	4
.LBB1952_52:
	movapd xmmword ptr [rsp + 96], xmm7
	movaps xmmword ptr [rsp + 272], xmm14
	movaps xmmword ptr [rsp + 288], xmm8
	movaps xmmword ptr [rsp + 304], xmm6
	movaps xmmword ptr [rsp + 496], xmm10
	movaps xmmword ptr [rsp + 16], xmm11
	movups xmm1, xmmword ptr [rcx + r9]
	movaps xmm12, xmmword ptr [rsp + 464]
	movaps xmm8, xmm12
	subps xmm8, xmm1
	movups xmm6, xmmword ptr [rsi + r9]
	movaps xmm9, xmmword ptr [rsp + 480]
	movaps xmm11, xmm9
	subps xmm11, xmm6
	movaps xmm0, xmm8
	mulps xmm0, xmm8
	movaps xmm10, xmm11
	mulps xmm10, xmm11
	addps xmm10, xmm0
	movaps xmm14, xmm10
	movaps xmm15, xmmword ptr [rsp + 672]
	movaps xmm0, xmm15
	cmpleps xmm0, xmm10
	xorpd xmm7, xmm7
	cmpltps xmm7, xmm10
	movaps xmm13, xmmword ptr [rsp + 448]
	cmpltps xmm10, xmm13
	andps xmm10, xmm0
	movups xmm3, xmmword ptr [rcx + r9 + 16]
	movaps xmm0, xmmword ptr [rip + .LCPI1952_6]
	andps xmm7, xmm0
	andps xmm7, xmm10
	movups xmm5, xmmword ptr [rsi + r9 + 16]
	cmpltps xmm14, xmm15
	andps xmm14, xmm0
	mulps xmm8, xmm14
	movaps xmm10, xmmword ptr [rsp + 240]
	addps xmm10, xmm8
	movaps xmmword ptr [rsp + 240], xmm10
	mulps xmm14, xmm11
	movaps xmm8, xmmword ptr [rsp + 400]
	addps xmm8, xmm14
	movaps xmmword ptr [rsp + 400], xmm8
	mulps xmm1, xmm7
	addps xmm2, xmm1
	mulps xmm6, xmm7
	movaps xmm1, xmmword ptr [rsp + 320]
	addps xmm1, xmm6
	movaps xmmword ptr [rsp + 320], xmm1
	movups xmm1, xmmword ptr [rdi + r9]
	mulps xmm1, xmm7
	movaps xmm0, xmmword ptr [rsp + 144]
	addps xmm0, xmm1
	movaps xmmword ptr [rsp + 144], xmm0
	movups xmm1, xmmword ptr [r15 + r9]
	mulps xmm1, xmm7
	movaps xmm6, xmmword ptr [rsp + 128]
	addps xmm6, xmm1
	movaps xmmword ptr [rsp + 128], xmm6
	movaps xmm1, xmmword ptr [rsp + 112]
	addps xmm1, xmm7
	movaps xmmword ptr [rsp + 112], xmm1
	subps xmm12, xmm3
	movaps xmm7, xmm9
	subps xmm7, xmm5
	movaps xmm1, xmm12
	mulps xmm1, xmm12
	movaps xmm8, xmm7
	mulps xmm8, xmm7
	addps xmm8, xmm1
	movaps xmm10, xmm8
	movaps xmm11, xmm15
	cmpleps xmm11, xmm8
	xorps xmm1, xmm1
	cmpltps xmm1, xmm8
	cmpltps xmm8, xmm13
	andps xmm8, xmm11
	movaps xmm14, xmmword ptr [rsp + 272]
	movaps xmm11, xmmword ptr [rsp + 16]
	movaps xmm9, xmmword ptr [rip + .LCPI1952_6]
	andps xmm1, xmm9
	andps xmm1, xmm8
	movaps xmm8, xmmword ptr [rsp + 288]
	cmpltps xmm10, xmm15
	andps xmm10, xmm9
	mulps xmm12, xmm10
	addps xmm14, xmm12
	movaps xmm6, xmmword ptr [rsp + 304]
	mulps xmm10, xmm7
	movaps xmm7, xmmword ptr [rsp + 96]
	addps xmm4, xmm10
	movaps xmm10, xmmword ptr [rsp + 496]
	mulps xmm3, xmm1
	addps xmm7, xmm3
	mulps xmm5, xmm1
	addps xmm6, xmm5
	movups xmm0, xmmword ptr [rdi + r9 + 16]
	mulps xmm0, xmm1
	addps xmm8, xmm0
	movups xmm0, xmmword ptr [r15 + r9 + 16]
	mulps xmm0, xmm1
	addps xmm10, xmm0
	addps xmm11, xmm1
	add r9, 32
	cmp rdx, r9
	jne .LBB1952_52
	jmp .LBB1952_54
	.p2align	4
.LBB1952_53:
	movaps xmm2, xmm3
.LBB1952_54:
	movaps xmmword ptr [rsp + 16], xmm2
	movaps xmmword ptr [rsp + 96], xmm7
	mov r9d, r14d
	and r9d, 7
	mov r8, r13
	sub r8, 8
	mov edx, 0
	cmovae rdx, r8
	test r9, r9
	mov rbp, qword ptr [rsp + 616]
	je .LBB1952_58
	lea rbx, [rdx + 8]
	cmp rbx, rbp
	ja .LBB1952_58
	cmp rbx, qword ptr [rsp + 584]
	jbe .LBB1952_57
.LBB1952_58:
	mov edx, r10d
	and edx, 7
	mov r8d, r12d
	and r8d, 7
	mov ebx, r11d
	and ebx, 7
	cmp rdx, r9
	cmovb r9, rdx
	cmp r8, r9
	cmovb r9, r8
	cmp rbx, r9
	cmovb r9, rbx
	test r9, r9
	movaps xmm9, xmmword ptr [rsp + 400]
	je .LBB1952_61
	movaps xmm15, xmm8
	movaps xmm12, xmm6
	and r14d, -8
	and r10d, -8
	and r12d, -8
	and r11d, -8
	movss xmm0, dword ptr [rcx + 4*r14]
	movss xmm1, dword ptr [rsi + 4*r10]
	movaps xmm3, xmmword ptr [rsp + 224]
	subss xmm3, xmm0
	movaps xmm6, xmmword ptr [rsp + 208]
	subss xmm6, xmm1
	movaps xmm8, xmm3
	mulss xmm8, xmm3
	movaps xmm7, xmm6
	mulss xmm7, xmm6
	addss xmm7, xmm8
	movaps xmm8, xmmword ptr [rsp + 192]
	ucomiss xmm8, xmm7
	movaps xmm5, xmmword ptr [rsp + 240]
	movaps xmm2, xmmword ptr [rsp + 320]
	jbe .LBB1952_62
	movaps xmm0, xmmword ptr [rsp + 80]
	addss xmm0, xmm3
	movaps xmmword ptr [rsp + 80], xmm0
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, xmm6
	movss dword ptr [rsp + 12], xmm0
	jmp .LBB1952_65
	.p2align	4
.LBB1952_61:
	movaps xmm5, xmmword ptr [rsp + 240]
	movaps xmm13, xmmword ptr [rsp + 112]
	movaps xmm2, xmmword ptr [rsp + 320]
	jmp .LBB1952_43
	.p2align	4
.LBB1952_62:
	movaps xmm3, xmmword ptr [rsp + 176]
	ucomiss xmm3, xmm7
	jbe .LBB1952_65
	xorps xmm3, xmm3
	ucomiss xmm7, xmm3
	jbe .LBB1952_65
	movss xmm3, dword ptr [rdi + 4*r12]
	movss xmm6, dword ptr [r15 + 4*r11]
	unpcklps xmm3, xmm6
	unpcklps xmm0, xmm1
	movlhps xmm0, xmm3
	movaps xmm1, xmmword ptr [rsp + 64]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 64], xmm1
	movaps xmm0, xmmword ptr [rsp + 48]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movaps xmmword ptr [rsp + 48], xmm0
.LBB1952_65:
	cmp r9d, 1
	je .LBB1952_42
	movss xmm0, dword ptr [rcx + 4*r14 + 4]
	movss xmm1, dword ptr [rsi + 4*r10 + 4]
	movaps xmm3, xmmword ptr [rsp + 224]
	subss xmm3, xmm0
	movaps xmm6, xmmword ptr [rsp + 208]
	subss xmm6, xmm1
	movaps xmm8, xmm3
	mulss xmm8, xmm3
	movaps xmm7, xmm6
	mulss xmm7, xmm6
	addss xmm7, xmm8
	movaps xmm8, xmmword ptr [rsp + 192]
	ucomiss xmm8, xmm7
	jbe .LBB1952_68
	movaps xmm0, xmmword ptr [rsp + 80]
	addss xmm0, xmm3
	movaps xmmword ptr [rsp + 80], xmm0
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, xmm6
	movss dword ptr [rsp + 12], xmm0
	jmp .LBB1952_71
.LBB1952_68:
	movaps xmm3, xmmword ptr [rsp + 176]
	ucomiss xmm3, xmm7
	jbe .LBB1952_71
	xorps xmm3, xmm3
	ucomiss xmm7, xmm3
	jbe .LBB1952_71
	movss xmm3, dword ptr [rdi + 4*r12 + 4]
	movss xmm6, dword ptr [r15 + 4*r11 + 4]
	unpcklps xmm3, xmm6
	unpcklps xmm0, xmm1
	movlhps xmm0, xmm3
	movaps xmm1, xmmword ptr [rsp + 64]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 64], xmm1
	movaps xmm0, xmmword ptr [rsp + 48]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movaps xmmword ptr [rsp + 48], xmm0
.LBB1952_71:
	cmp r9d, 2
	je .LBB1952_42
	movss xmm0, dword ptr [rcx + 4*r14 + 8]
	movss xmm1, dword ptr [rsi + 4*r10 + 8]
	movaps xmm3, xmmword ptr [rsp + 224]
	subss xmm3, xmm0
	movaps xmm6, xmmword ptr [rsp + 208]
	subss xmm6, xmm1
	movaps xmm8, xmm3
	mulss xmm8, xmm3
	movaps xmm7, xmm6
	mulss xmm7, xmm6
	addss xmm7, xmm8
	movaps xmm8, xmmword ptr [rsp + 192]
	ucomiss xmm8, xmm7
	jbe .LBB1952_74
	movaps xmm0, xmmword ptr [rsp + 80]
	addss xmm0, xmm3
	movaps xmmword ptr [rsp + 80], xmm0
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, xmm6
	movss dword ptr [rsp + 12], xmm0
	jmp .LBB1952_77
.LBB1952_74:
	movaps xmm3, xmmword ptr [rsp + 176]
	ucomiss xmm3, xmm7
	jbe .LBB1952_77
	xorps xmm3, xmm3
	ucomiss xmm7, xmm3
	jbe .LBB1952_77
	movss xmm3, dword ptr [rdi + 4*r12 + 8]
	movss xmm6, dword ptr [r15 + 4*r11 + 8]
	unpcklps xmm3, xmm6
	unpcklps xmm0, xmm1
	movlhps xmm0, xmm3
	movaps xmm1, xmmword ptr [rsp + 64]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 64], xmm1
	movaps xmm0, xmmword ptr [rsp + 48]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movaps xmmword ptr [rsp + 48], xmm0
.LBB1952_77:
	cmp r9d, 3
	je .LBB1952_42
	movss xmm0, dword ptr [rcx + 4*r14 + 12]
	movss xmm1, dword ptr [rsi + 4*r10 + 12]
	movaps xmm3, xmmword ptr [rsp + 224]
	subss xmm3, xmm0
	movaps xmm6, xmmword ptr [rsp + 208]
	subss xmm6, xmm1
	movaps xmm8, xmm3
	mulss xmm8, xmm3
	movaps xmm7, xmm6
	mulss xmm7, xmm6
	addss xmm7, xmm8
	movaps xmm8, xmmword ptr [rsp + 192]
	ucomiss xmm8, xmm7
	jbe .LBB1952_80
	movaps xmm0, xmmword ptr [rsp + 80]
	addss xmm0, xmm3
	movaps xmmword ptr [rsp + 80], xmm0
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, xmm6
	movss dword ptr [rsp + 12], xmm0
	jmp .LBB1952_83
.LBB1952_80:
	movaps xmm3, xmmword ptr [rsp + 176]
	ucomiss xmm3, xmm7
	jbe .LBB1952_83
	xorps xmm3, xmm3
	ucomiss xmm7, xmm3
	jbe .LBB1952_83
	movss xmm3, dword ptr [rdi + 4*r12 + 12]
	movss xmm6, dword ptr [r15 + 4*r11 + 12]
	unpcklps xmm3, xmm6
	unpcklps xmm0, xmm1
	movlhps xmm0, xmm3
	movaps xmm1, xmmword ptr [rsp + 64]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 64], xmm1
	movaps xmm0, xmmword ptr [rsp + 48]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movaps xmmword ptr [rsp + 48], xmm0
.LBB1952_83:
	cmp r9d, 4
	je .LBB1952_42
	movss xmm0, dword ptr [rcx + 4*r14 + 16]
	movss xmm1, dword ptr [rsi + 4*r10 + 16]
	movaps xmm3, xmmword ptr [rsp + 224]
	subss xmm3, xmm0
	movaps xmm6, xmmword ptr [rsp + 208]
	subss xmm6, xmm1
	movaps xmm8, xmm3
	mulss xmm8, xmm3
	movaps xmm7, xmm6
	mulss xmm7, xmm6
	addss xmm7, xmm8
	movaps xmm8, xmmword ptr [rsp + 192]
	ucomiss xmm8, xmm7
	jbe .LBB1952_86
	movaps xmm0, xmmword ptr [rsp + 80]
	addss xmm0, xmm3
	movaps xmmword ptr [rsp + 80], xmm0
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, xmm6
	movss dword ptr [rsp + 12], xmm0
	jmp .LBB1952_89
.LBB1952_86:
	movaps xmm3, xmmword ptr [rsp + 176]
	ucomiss xmm3, xmm7
	jbe .LBB1952_89
	xorps xmm3, xmm3
	ucomiss xmm7, xmm3
	jbe .LBB1952_89
	movss xmm3, dword ptr [rdi + 4*r12 + 16]
	movss xmm6, dword ptr [r15 + 4*r11 + 16]
	unpcklps xmm3, xmm6
	unpcklps xmm0, xmm1
	movlhps xmm0, xmm3
	movaps xmm1, xmmword ptr [rsp + 64]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 64], xmm1
	movaps xmm0, xmmword ptr [rsp + 48]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movaps xmmword ptr [rsp + 48], xmm0
.LBB1952_89:
	cmp r9d, 5
	je .LBB1952_42
	movss xmm0, dword ptr [rcx + 4*r14 + 20]
	movss xmm1, dword ptr [rsi + 4*r10 + 20]
	movaps xmm3, xmmword ptr [rsp + 224]
	subss xmm3, xmm0
	movaps xmm6, xmmword ptr [rsp + 208]
	subss xmm6, xmm1
	movaps xmm8, xmm3
	mulss xmm8, xmm3
	movaps xmm7, xmm6
	mulss xmm7, xmm6
	addss xmm7, xmm8
	movaps xmm8, xmmword ptr [rsp + 192]
	ucomiss xmm8, xmm7
	jbe .LBB1952_92
	movaps xmm0, xmmword ptr [rsp + 80]
	addss xmm0, xmm3
	movaps xmmword ptr [rsp + 80], xmm0
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, xmm6
	movss dword ptr [rsp + 12], xmm0
	jmp .LBB1952_95
.LBB1952_92:
	movaps xmm3, xmmword ptr [rsp + 176]
	ucomiss xmm3, xmm7
	jbe .LBB1952_95
	xorps xmm3, xmm3
	ucomiss xmm7, xmm3
	jbe .LBB1952_95
	movss xmm3, dword ptr [rdi + 4*r12 + 20]
	movss xmm6, dword ptr [r15 + 4*r11 + 20]
	unpcklps xmm3, xmm6
	unpcklps xmm0, xmm1
	movlhps xmm0, xmm3
	movaps xmm1, xmmword ptr [rsp + 64]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 64], xmm1
	movaps xmm0, xmmword ptr [rsp + 48]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movaps xmmword ptr [rsp + 48], xmm0
.LBB1952_95:
	cmp r9d, 6
	je .LBB1952_42
	movss xmm0, dword ptr [rcx + 4*r14 + 24]
	movss xmm1, dword ptr [rsi + 4*r10 + 24]
	movaps xmm3, xmmword ptr [rsp + 224]
	subss xmm3, xmm0
	movaps xmm6, xmmword ptr [rsp + 208]
	subss xmm6, xmm1
	movaps xmm8, xmm3
	mulss xmm8, xmm3
	movaps xmm7, xmm6
	mulss xmm7, xmm6
	addss xmm7, xmm8
	movaps xmm8, xmmword ptr [rsp + 192]
	ucomiss xmm8, xmm7
	jbe .LBB1952_97
	movaps xmm0, xmmword ptr [rsp + 80]
	addss xmm0, xmm3
	movaps xmmword ptr [rsp + 80], xmm0
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, xmm6
	movss dword ptr [rsp + 12], xmm0
	.p2align	4
.LBB1952_42:
	movaps xmm13, xmmword ptr [rsp + 112]
	movaps xmm6, xmm12
	movaps xmm8, xmm15
.LBB1952_43:
	movaps xmm15, xmmword ptr [rsp + 128]
.LBB1952_44:
	movaps xmm1, xmmword ptr [rsp + 16]
	jmp .LBB1952_45
.LBB1952_97:
	movaps xmm3, xmmword ptr [rsp + 176]
	ucomiss xmm3, xmm7
	movaps xmm13, xmmword ptr [rsp + 112]
	movaps xmm8, xmm15
	jbe .LBB1952_101
	xorps xmm3, xmm3
	ucomiss xmm7, xmm3
	movaps xmm15, xmmword ptr [rsp + 128]
	jbe .LBB1952_100
	movss xmm3, dword ptr [rdi + 4*r12 + 24]
	movss xmm6, dword ptr [r15 + 4*r11 + 24]
	unpcklps xmm3, xmm6
	unpcklps xmm0, xmm1
	movlhps xmm0, xmm3
	movaps xmm1, xmmword ptr [rsp + 64]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 64], xmm1
	movaps xmm0, xmmword ptr [rsp + 48]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movaps xmmword ptr [rsp + 48], xmm0
.LBB1952_100:
	movaps xmm6, xmm12
	jmp .LBB1952_44
.LBB1952_101:
	movaps xmm6, xmm12
	jmp .LBB1952_43
.LBB1952_102:
	movaps xmm0, xmm1
	unpcklps xmm0, xmm2
	movaps xmm3, xmm1
	movaps xmmword ptr [rsp + 16], xmm1
	movaps xmm1, xmm12
	unpcklps xmm1, xmm15
	movlhps xmm0, xmm1
	movaps xmm1, xmm2
	shufps xmm1, xmm3, 17
	movaps xmm3, xmm15
	shufps xmm3, xmm12, 17
	shufps xmm1, xmm3, 34
	addps xmm1, xmm0
	movaps xmm0, xmmword ptr [rsp + 16]
	unpckhps xmm0, xmm2
	movaps xmm3, xmm15
	unpckhpd xmm3, xmm12
	shufps xmm0, xmm3, 36
	addps xmm0, xmm1
	shufps xmm2, xmmword ptr [rsp + 16], 51
	shufps xmm15, xmm12, 255
	shufps xmm2, xmm15, 34
	addps xmm2, xmm0
	movaps xmm0, xmm7
	unpcklps xmm0, xmm6
	movaps xmm1, xmm10
	movlhps xmm1, xmm8
	shufps xmm0, xmm1, 36
	addps xmm0, xmm2
	movaps xmm1, xmm6
	shufps xmm1, xmm7, 17
	movaps xmm2, xmm10
	shufps xmm2, xmm8, 85
	shufps xmm1, xmm2, 34
	addps xmm1, xmm0
	movaps xmm0, xmm7
	unpckhps xmm0, xmm6
	movaps xmm2, xmm10
	unpckhpd xmm2, xmm8
	shufps xmm0, xmm2, 36
	addps xmm0, xmm1
	shufps xmm6, xmm7, 51
	shufps xmm10, xmm8, 255
	shufps xmm6, xmm10, 34
	addps xmm6, xmm0
	movaps xmm2, xmmword ptr [rsp + 64]
	addps xmm2, xmm6
	movaps xmm0, xmm13
	unpcklps xmm0, xmm5
	movaps xmm1, xmm5
	shufps xmm1, xmm13, 17
	shufps xmm1, xmm13, 226
	addps xmm1, xmm0
	movaps xmm0, xmm13
	unpckhps xmm0, xmm5
	addps xmm0, xmm1
	shufps xmm5, xmm13, 255
	shufps xmm5, xmm13, 226
	addps xmm5, xmm0
	movaps xmm0, xmm11
	unpcklps xmm0, xmm14
	addps xmm0, xmm5
	movaps xmm1, xmm14
	shufps xmm1, xmm11, 17
	shufps xmm1, xmm11, 226
	addps xmm1, xmm0
	movaps xmm0, xmm11
	unpckhps xmm0, xmm14
	addps xmm0, xmm1
	shufps xmm14, xmm11, 255
	shufps xmm14, xmm11, 226
	addps xmm14, xmm0
	movaps xmm3, xmmword ptr [rsp + 48]
	unpcklps xmm3, xmmword ptr [rsp + 80]
	addps xmm3, xmm14
	movaps xmm0, xmm9
	shufps xmm0, xmm9, 85
	addss xmm0, xmm9
	movaps xmm1, xmm9
	unpckhpd xmm1, xmm9
	addss xmm1, xmm0
	shufps xmm9, xmm9, 255
	addss xmm9, xmm1
	addss xmm9, xmm4
	movaps xmm0, xmm4
	shufps xmm0, xmm4, 85
	addss xmm0, xmm9
	movaps xmm1, xmm4
	unpckhpd xmm1, xmm4
	addss xmm1, xmm0
	shufps xmm4, xmm4, 255
	addss xmm4, xmm1
	movss xmm8, dword ptr [rsp + 12]
	addss xmm8, xmm4
.LBB1952_103:
	movaps xmmword ptr [rsp + 688], xmm2
	movlps qword ptr [rsp + 704], xmm3
	movss dword ptr [rsp + 712], xmm8
	lea rdi, [rsp + 432]
	mov rsi, qword ptr [rsp + 568]
	movss xmm0, dword ptr [rsp + 268]
	movss xmm1, dword ptr [rsp + 172]
	lea rdx, [rsp + 656]
	lea rcx, [rsp + 416]
	lea r8, [rsp + 688]
	call swarm::rules::finish
	mov rsi, qword ptr [rsp + 576]
	cmp rsi, qword ptr [rsp + 552]
	jae .LBB1952_34
	movss xmm0, dword ptr [rsp + 432]
	movss xmm1, dword ptr [rsp + 436]
	movss xmm2, dword ptr [rsp + 440]
	movss xmm3, dword ptr [rsp + 444]
	mov rax, qword ptr [rsp + 544]
	movss dword ptr [rax + 4*rsi], xmm0
	mov rax, qword ptr [rsp + 536]
	movss dword ptr [rax + 4*rsi], xmm1
	mov rax, qword ptr [rsp + 528]
	movss dword ptr [rax + 4*rsi], xmm2
	mov rax, qword ptr [rsp + 520]
	movss dword ptr [rax + 4*rsi], xmm3
	jmp .LBB1952_34
.LBB1952_105:
	add rsp, 776
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
