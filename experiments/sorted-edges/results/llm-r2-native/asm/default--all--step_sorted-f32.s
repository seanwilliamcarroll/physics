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
	sub rsp, 728
	.cfi_def_cfa_offset 784
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r13, rdi
	lea rax, [rdi + 316]
	mov qword ptr [rsp + 496], rax
	movss xmm5, dword ptr [rdi + 288]
	movss xmm6, dword ptr [rdi + 292]
	movss dword ptr [rsp + 140], xmm6
	mov eax, dword ptr [rdi + 312]
	mov dword ptr [rsp + 584], eax
	mov rax, qword ptr [rdi + 304]
	mov qword ptr [rsp + 576], rax
	movss xmm0, dword ptr [rdi + 316]
	mov rax, qword ptr [rdi + 8]
	mov qword ptr [rsp + 16], rax
	mov rbp, qword ptr [rdi + 16]
	mov rax, qword ptr [rdi + 32]
	mov qword ptr [rsp + 112], rax
	mov rax, qword ptr [rdi + 40]
	mov qword ptr [rsp + 208], rax
	movss xmm1, dword ptr [rip + .LCPI1952_0]
	movaps xmm2, xmm5
	mulss xmm2, xmm1
	movaps xmm3, xmm0
	maxss xmm3, xmm2
	cmpunordss xmm2, xmm2
	movaps xmm4, xmm2
	andnps xmm4, xmm3
	andps xmm2, xmm0
	orps xmm2, xmm4
	mulss xmm1, xmm6
	movaps xmm0, xmm1
	cmpunordss xmm0, xmm1
	movaps xmm3, xmm0
	andps xmm3, xmm2
	maxss xmm2, xmm1
	andnps xmm0, xmm2
	orps xmm0, xmm3
	mulss xmm0, dword ptr [rip + .LCPI1952_1]
	movss xmm1, dword ptr [rip + .LCPI1952_2]
	divss xmm1, xmm0
	movss dword ptr [rsp + 80], xmm1
	movss dword ptr [rdi + 280], xmm1
	movss dword ptr [rsp + 236], xmm5
	movaps xmm0, xmm5
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
	movss xmm0, dword ptr [rsp + 80]
	mulss xmm0, dword ptr [rsp + 140]
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
	mov rsi, qword ptr [rsp + 16]
	mov rdx, rbp
	mov rcx, qword ptr [rsp + 112]
	mov r8, qword ptr [rsp + 208]
	call <swarm::grid::Grid>::fill
	mov rcx, r13
	mov r12, qword ptr [r13 + 248]
	mov rax, qword ptr [r13 + 256]
	mov rbp, qword ptr [r13 + 8]
	mov r14, qword ptr [r13 + 16]
	mov qword ptr [r13 + 112], 0
	lea rbx, [r12 + 4*rax]
	lea rax, [r13 + 96]
	mov qword ptr [rsp + 112], rax
	mov r13, r12
	mov qword ptr [rsp + 40], rcx
	jmp .LBB1952_1
.LBB1952_8:
	mov rax, qword ptr [rcx + 104]
	movss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rcx + 112], r15
	.p2align	4
.LBB1952_1:
	cmp r13, rbx
	je .LBB1952_2
	mov eax, dword ptr [r13]
	add r13, 4
	cmp r14, rax
	jbe .LBB1952_1
	movss xmm0, dword ptr [rbp + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1952_6
	jmp .LBB1952_9
.LBB1952_2:
	xor eax, eax
	mov r13, rbx
	cmp eax, 1
	jne .LBB1952_9
.LBB1952_6:
	cmp r15, qword ptr [rcx + 96]
	jne .LBB1952_8
	mov edx, 1
	mov rdi, qword ptr [rsp + 112]
	mov rsi, r15
	movss dword ptr [rsp + 16], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 16]
	mov rcx, qword ptr [rsp + 40]
	jmp .LBB1952_8
.LBB1952_9:
	mov r13, qword ptr [rcx + 32]
	mov r15, qword ptr [rcx + 40]
	mov qword ptr [rcx + 136], 0
	xor r14d, r14d
	lea rax, [rcx + 120]
	mov qword ptr [rsp + 112], rax
	mov rbp, r12
	jmp .LBB1952_10
.LBB1952_17:
	mov rax, qword ptr [rcx + 128]
	movss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rcx + 136], r14
	.p2align	4
.LBB1952_10:
	cmp rbp, rbx
	je .LBB1952_11
	mov eax, dword ptr [rbp]
	add rbp, 4
	cmp r15, rax
	jbe .LBB1952_10
	movss xmm0, dword ptr [r13 + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1952_15
	jmp .LBB1952_18
.LBB1952_11:
	xor eax, eax
	mov rbp, rbx
	cmp eax, 1
	jne .LBB1952_18
.LBB1952_15:
	cmp r14, qword ptr [rcx + 120]
	jne .LBB1952_17
	mov edx, 1
	mov rdi, qword ptr [rsp + 112]
	mov rsi, r14
	movss dword ptr [rsp + 16], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 16]
	mov rcx, qword ptr [rsp + 40]
	jmp .LBB1952_17
.LBB1952_18:
	mov r13, qword ptr [rcx + 56]
	mov r15, qword ptr [rcx + 64]
	mov qword ptr [rcx + 160], 0
	xor r14d, r14d
	lea rax, [rcx + 144]
	mov qword ptr [rsp + 112], rax
	mov rbp, r12
	jmp .LBB1952_19
.LBB1952_26:
	mov rax, qword ptr [rcx + 152]
	movss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rcx + 160], r14
	.p2align	4
.LBB1952_19:
	cmp rbp, rbx
	je .LBB1952_20
	mov eax, dword ptr [rbp]
	add rbp, 4
	cmp r15, rax
	jbe .LBB1952_19
	movss xmm0, dword ptr [r13 + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1952_24
	jmp .LBB1952_27
.LBB1952_20:
	xor eax, eax
	mov rbp, rbx
	cmp eax, 1
	jne .LBB1952_27
.LBB1952_24:
	cmp r14, qword ptr [rcx + 144]
	jne .LBB1952_26
	mov edx, 1
	mov rdi, qword ptr [rsp + 112]
	mov rsi, r14
	movss dword ptr [rsp + 16], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 16]
	mov rcx, qword ptr [rsp + 40]
	jmp .LBB1952_26
.LBB1952_27:
	mov r13, qword ptr [rcx + 80]
	mov r15, qword ptr [rcx + 88]
	mov qword ptr [rcx + 184], 0
	xor r14d, r14d
	lea rbp, [rcx + 168]
	jmp .LBB1952_28
.LBB1952_35:
	mov rax, qword ptr [rcx + 176]
	movss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rcx + 184], r14
	.p2align	4
.LBB1952_28:
	cmp r12, rbx
	je .LBB1952_29
	mov eax, dword ptr [r12]
	add r12, 4
	cmp r15, rax
	jbe .LBB1952_28
	movss xmm0, dword ptr [r13 + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1952_33
	jmp .LBB1952_36
.LBB1952_29:
	xor eax, eax
	mov r12, rbx
	cmp eax, 1
	jne .LBB1952_36
.LBB1952_33:
	cmp r14, qword ptr [rcx + 168]
	jne .LBB1952_35
	mov edx, 1
	mov rdi, rbp
	mov rsi, r14
	movss dword ptr [rsp + 16], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 16]
	mov rcx, qword ptr [rsp + 40]
	jmp .LBB1952_35
.LBB1952_36:
	movups xmm0, xmmword ptr [rcx + 96]
	mov rax, qword ptr [rcx + 8]
	mov qword ptr [rsp + 472], rax
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
	mov qword ptr [rsp + 464], rax
	mov qword ptr [rcx + 128], rax
	mov rdx, qword ptr [rcx + 56]
	movups xmm1, xmmword ptr [rcx + 144]
	movups xmm2, xmmword ptr [rcx + 40]
	mov rax, qword ptr [rcx + 40]
	movups xmmword ptr [rcx + 32], xmm0
	movups xmmword ptr [rcx + 136], xmm2
	movups xmmword ptr [rcx + 48], xmm1
	mov qword ptr [rsp + 456], rdx
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
	mov qword ptr [rsp + 448], r9
	mov qword ptr [rsi + 176], r9
	mov rcx, qword ptr [rsi + 88]
	mov qword ptr [rsi + 88], r14
	mov qword ptr [rsi + 184], rcx
	test rdi, rdi
	je .LBB1952_63
	mov rsi, qword ptr [rsp + 40]
	movss xmm0, dword ptr [rsi + 316]
	movss xmm1, dword ptr [rsi + 320]
	cmp rax, r8
	cmovb r8, rax
	mulss xmm1, xmm1
	cmp rdx, r8
	cmovb r8, rdx
	mulss xmm0, xmm0
	movaps xmmword ptr [rsp + 176], xmm0
	shufps xmm0, xmm0, 0
	movaps xmmword ptr [rsp + 192], xmm1
	shufps xmm1, xmm1, 0
	cmp rcx, r8
	cmovb r8, rcx
	mov qword ptr [rsp + 480], r8
	xor esi, esi
	mov qword ptr [rsp + 488], rdi
	movaps xmmword ptr [rsp + 608], xmm0
	movaps xmmword ptr [rsp + 592], xmm1
	jmp .LBB1952_38
.LBB1952_61:
	mov rdi, qword ptr [rsp + 488]
	.p2align	4
.LBB1952_62:
	inc rsi
	cmp rsi, rdi
	je .LBB1952_63
.LBB1952_38:
	mov rax, qword ptr [rsp + 40]
	mov rbp, qword ptr [rax + 16]
	cmp rsi, rbp
	jae .LBB1952_62
	mov rcx, qword ptr [rax + 40]
	mov qword ptr [rsp + 376], rcx
	cmp rsi, rcx
	jae .LBB1952_62
	mov rcx, qword ptr [rax + 64]
	mov rax, qword ptr [rax + 88]
	mov qword ptr [rsp + 368], rcx
	cmp rsi, rcx
	setb cl
	mov qword ptr [rsp + 360], rax
	cmp rsi, rax
	setb dl
	and dl, cl
	mov rax, qword ptr [rsp + 40]
	cmp dl, 1
	jne .LBB1952_62
	mov rcx, qword ptr [rax + 8]
	mov qword ptr [rsp + 408], rcx
	movss xmm9, dword ptr [rcx + 4*rsi]
	mov rcx, qword ptr [rax + 32]
	mov r8, qword ptr [rax + 56]
	mov qword ptr [rsp + 400], rcx
	movss xmm10, dword ptr [rcx + 4*rsi]
	mov r9, qword ptr [rax + 80]
	movss xmm1, dword ptr [rax + 280]
	movaps xmm2, xmm9
	mulss xmm2, xmm1
	xorps xmm12, xmm12
	maxss xmm2, xmm12
	xorps xmm0, xmm0
	cvtss2sd xmm0, xmm2
	cvttsd2si rcx, xmm0
	mov rdx, rcx
	sar rdx, 63
	movapd xmm3, xmm0
	movsd xmm4, qword ptr [rip + .LCPI1952_3]
	subsd xmm3, xmm4
	cvttsd2si r10, xmm3
	and r10, rdx
	or r10, rcx
	xorpd xmm7, xmm7
	ucomisd xmm0, xmm7
	mov edi, 0
	cmovb r10, rdi
	movsd xmm5, qword ptr [rip + .LCPI1952_4]
	ucomisd xmm0, xmm5
	mov qword ptr [rsp + 392], r8
	movss xmm3, dword ptr [r8 + 4*rsi]
	mov qword ptr [rsp + 504], rsi
	mov qword ptr [rsp + 384], r9
	movss xmm0, dword ptr [r9 + 4*rsi]
	movss dword ptr [rsp + 416], xmm9
	movss dword ptr [rsp + 420], xmm10
	mov rcx, qword ptr [rax + 264]
	mov r8, -1
	cmova r10, r8
	mov qword ptr [rsp + 568], rcx
	sub rcx, 1
	cmovb rcx, rdi
	movss dword ptr [rsp + 424], xmm3
	cmp rcx, r10
	cmovb r10, rcx
	movss xmm6, dword ptr [rip + .LCPI1952_5]
	ucomiss xmm2, xmm6
	cmovae r10, rdi
	mulss xmm1, xmm10
	maxss xmm1, xmm12
	xorps xmm2, xmm2
	cvtss2sd xmm2, xmm1
	cvttsd2si rdx, xmm2
	mov rsi, rdx
	sar rsi, 63
	movapd xmm3, xmm2
	subsd xmm3, xmm4
	cvttsd2si r9, xmm3
	and r9, rsi
	or r9, rdx
	ucomisd xmm2, xmm7
	cmovb r9, rdi
	ucomisd xmm2, xmm5
	movss dword ptr [rsp + 428], xmm0
	cmova r9, r8
	mov rdx, qword ptr [rax + 272]
	sub rdx, 1
	cmovb rdx, rdi
	xorps xmm0, xmm0
	movups xmmword ptr [rsp + 268], xmm0
	cmp rdx, r9
	cmovb r9, rdx
	ucomiss xmm1, xmm6
	cmovae r9, rdi
	mov rax, r10
	sub rax, 1
	cmovb rax, rdi
	mov qword ptr [rsp + 552], rax
	mov r12, r9
	sub r12, 1
	cmovb r12, rdi
	inc r9
	cmp rdx, r9
	cmovb r9, rdx
	movaps xmmword ptr [rsp + 256], xmm0
	xorpd xmm3, xmm3
	mov qword ptr [rsp + 560], r9
	cmp r12, r9
	ja .LBB1952_59
	inc r10
	cmp rcx, r10
	cmovb r10, rcx
	mov rax, qword ptr [rsp + 368]
	mov rcx, qword ptr [rsp + 360]
	cmp rax, rcx
	cmovb rcx, rax
	inc r10
	mov qword ptr [rsp + 528], r10
	mov rax, qword ptr [rsp + 376]
	cmp rax, rcx
	cmovb rcx, rax
	mov qword ptr [rsp + 512], rcx
	mov rax, qword ptr [rsp + 40]
	mov rcx, qword ptr [rax + 200]
	mov qword ptr [rsp + 520], rcx
	mov rdi, qword ptr [rax + 208]
	movaps xmm0, xmm9
	unpcklps xmm0, xmm10
	movaps xmmword ptr [rsp + 240], xmm0
	movaps xmmword ptr [rsp + 656], xmm10
	shufps xmm10, xmm10, 0
	movaps xmmword ptr [rsp + 640], xmm10
	movaps xmmword ptr [rsp + 672], xmm9
	movaps xmm5, xmm9
	shufps xmm5, xmm9, 0
	xorps xmm0, xmm0
	movaps xmmword ptr [rsp + 160], xmm0
	xorps xmm0, xmm0
	movss dword ptr [rsp + 4], xmm0
	xorps xmm8, xmm8
	xorps xmm0, xmm0
	movaps xmmword ptr [rsp + 16], xmm0
	xorps xmm10, xmm10
	xorps xmm6, xmm6
	xorps xmm12, xmm12
	xorpd xmm7, xmm7
	xorps xmm9, xmm9
	xorps xmm14, xmm14
	xorps xmm1, xmm1
	movaps xmmword ptr [rsp + 320], xmm0
	xorps xmm15, xmm15
	xorpd xmm4, xmm4
	xorps xmm13, xmm13
	movaps xmmword ptr [rsp + 48], xmm0
	movaps xmmword ptr [rsp + 144], xmm0
	mov qword ptr [rsp + 536], rdi
	mov qword ptr [rsp + 544], rbp
	movaps xmmword ptr [rsp + 624], xmm5
	jmp .LBB1952_43
	.p2align	4
.LBB1952_56:
	cmp rcx, 2
	setb al
	cmp r13, 2
	setae sil
	and sil, al
	movzx eax, sil
	xorps xmm0, xmm0
	cvtsi2ss xmm0, eax
	cmp rcx, 3
	setb al
	cmp r13, 3
	setae sil
	and sil, al
	movzx eax, sil
	xorps xmm1, xmm1
	cvtsi2ss xmm1, eax
	cmp rcx, 4
	setb al
	cmp r13, 4
	setae sil
	and sil, al
	movzx eax, sil
	cvtsi2ss xmm4, eax
	unpcklps xmm3, xmm0
	unpcklps xmm1, xmm4
	cmp rcx, 5
	setb al
	cmp r13, 5
	setae sil
	and sil, al
	movzx eax, sil
	cvtsi2ss xmm15, eax
	cmp rcx, 6
	setb al
	cmp r13, 6
	setae sil
	and sil, al
	movzx eax, sil
	xorps xmm0, xmm0
	cvtsi2ss xmm0, eax
	movlhps xmm3, xmm1
	movaps xmmword ptr [rsp + 704], xmm3
	unpcklps xmm15, xmm0
	cmp rcx, 7
	setb al
	cmp r13, 7
	setae sil
	and sil, al
	movzx eax, sil
	xorps xmm0, xmm0
	cvtsi2ss xmm0, eax
	cmp rcx, 8
	setb al
	cmp r13, 8
	setae cl
	and cl, al
	movzx eax, cl
	xorps xmm1, xmm1
	cvtsi2ss xmm1, eax
	unpcklps xmm0, xmm1
	movlhps xmm15, xmm0
	mov rax, qword ptr [rsp + 408]
	movups xmm5, xmmword ptr [rax + 4*rdx + 16]
	movaps xmm3, xmmword ptr [rsp + 624]
	movaps xmm0, xmm3
	subps xmm0, xmm5
	movaps xmmword ptr [rsp + 688], xmm0
	movaps xmm1, xmm0
	mulps xmm1, xmm0
	mov rcx, qword ptr [rsp + 400]
	movups xmm0, xmmword ptr [rcx + 4*rdx + 16]
	movaps xmm10, xmm14
	subps xmm10, xmm0
	movaps xmm7, xmm10
	mulps xmm7, xmm10
	addps xmm7, xmm1
	movaps xmm2, xmmword ptr [rsp + 592]
	movaps xmm1, xmm2
	cmpleps xmm1, xmm7
	movaps xmm4, xmm7
	movaps xmm9, xmmword ptr [rsp + 608]
	cmpltps xmm4, xmm9
	andps xmm4, xmm1
	xorps xmm1, xmm1
	cmpltps xmm1, xmm7
	movaps xmm8, xmmword ptr [rip + .LCPI1952_6]
	andps xmm1, xmm8
	andps xmm1, xmm4
	mulps xmm1, xmm15
	mov rdi, qword ptr [rsp + 384]
	movups xmm4, xmmword ptr [rdi + 4*rdx + 16]
	mulps xmm4, xmm1
	addps xmm12, xmm4
	mov rsi, qword ptr [rsp + 392]
	movups xmm4, xmmword ptr [rsi + 4*rdx + 16]
	mulps xmm4, xmm1
	addps xmm11, xmm4
	mulps xmm0, xmm1
	movaps xmm4, xmmword ptr [rsp + 320]
	addps xmm4, xmm0
	movaps xmmword ptr [rsp + 320], xmm4
	movups xmm13, xmmword ptr [rax + 4*rdx]
	addps xmm6, xmm1
	mulps xmm1, xmm5
	movups xmm5, xmmword ptr [rcx + 4*rdx]
	movaps xmm4, xmmword ptr [rsp + 304]
	addps xmm4, xmm1
	cmpltps xmm7, xmm2
	andps xmm7, xmm8
	mulps xmm7, xmm15
	mulps xmm10, xmm7
	movaps xmm0, xmmword ptr [rsp + 160]
	addps xmm0, xmm10
	movaps xmmword ptr [rsp + 160], xmm0
	mulps xmm7, xmmword ptr [rsp + 688]
	movaps xmm0, xmmword ptr [rsp + 16]
	addps xmm0, xmm7
	movaps xmmword ptr [rsp + 16], xmm0
	subps xmm3, xmm13
	movaps xmmword ptr [rsp + 304], xmm3
	mulps xmm3, xmm3
	movaps xmm7, xmm14
	subps xmm7, xmm5
	movaps xmm10, xmm7
	mulps xmm10, xmm7
	addps xmm10, xmm3
	movaps xmm0, xmm2
	cmpleps xmm0, xmm10
	movaps xmm1, xmm10
	cmpltps xmm1, xmm9
	andps xmm1, xmm0
	xorps xmm0, xmm0
	cmpltps xmm0, xmm10
	andps xmm0, xmm8
	andps xmm0, xmm1
	movups xmm1, xmmword ptr [rdi + 4*rdx]
	movaps xmm3, xmmword ptr [rsp + 704]
	mulps xmm0, xmm3
	mulps xmm1, xmm0
	movaps xmm9, xmmword ptr [rsp + 80]
	addps xmm9, xmm1
	movups xmm1, xmmword ptr [rsi + 4*rdx]
	mulps xmm1, xmm0
	movaps xmm15, xmmword ptr [rsp + 64]
	addps xmm15, xmm1
	movaps xmm1, xmm15
	mulps xmm5, xmm0
	movaps xmm15, xmmword ptr [rsp + 208]
	addps xmm15, xmm5
	movaps xmm14, xmmword ptr [rsp + 112]
	addps xmm14, xmm0
	mulps xmm0, xmm13
	movaps xmm13, xmmword ptr [rsp + 336]
	addps xmm13, xmm0
	cmpltps xmm10, xmm2
	andps xmm10, xmm8
	mulps xmm10, xmm3
	mulps xmm7, xmm10
	movaps xmm8, xmmword ptr [rsp + 96]
	addps xmm8, xmm7
	movaps xmm7, xmm12
	movaps xmm12, xmm14
	movaps xmm14, xmm11
	mulps xmm10, xmmword ptr [rsp + 304]
	movaps xmm3, xmmword ptr [rsp + 288]
	addps xmm3, xmm10
	movaps xmm10, xmm3
.LBB1952_57:
	cmp r8, qword ptr [rsp + 560]
	lea r12, [r8 + 1]
	mov rdi, qword ptr [rsp + 536]
	je .LBB1952_58
.LBB1952_43:
	mov rcx, qword ptr [rsp + 568]
	imul rcx, r12
	mov rax, qword ptr [rsp + 552]
	lea rsi, [rcx + rax]
	cmp rsi, rdi
	mov qword ptr [rsp + 8], r12
	movaps xmm0, xmm15
	movaps xmm2, xmm14
	jae .LBB1952_44
	add rcx, qword ptr [rsp + 528]
	mov r13d, 0
	mov edx, 0
	cmp rcx, rdi
	jae .LBB1952_47
	mov rax, qword ptr [rsp + 520]
	mov edx, dword ptr [rax + 4*rsi]
	mov r13d, dword ptr [rax + 4*rcx]
	jmp .LBB1952_47
	.p2align	4
.LBB1952_44:
	xor r13d, r13d
	xor edx, edx
.LBB1952_47:
	mov r11, r13
	sub r11, rdx
	setb r9b
	cmp r13, rbp
	seta cl
	or cl, r9b
	mov rax, qword ptr [rsp + 408]
	lea rcx, [rax + 4*rdx]
	mov r14, r11
	mov ebp, 0
	cmovne r14, rbp
	mov eax, 4
	cmovne rcx, rax
	cmp r13, qword ptr [rsp + 376]
	seta sil
	or sil, r9b
	mov r10, r11
	cmovne r10, rbp
	mov rsi, qword ptr [rsp + 400]
	lea rsi, [rsi + 4*rdx]
	cmovne rsi, rax
	mov rbx, r10
	shr rbx, 3
	cmp r13, qword ptr [rsp + 368]
	seta dil
	or dil, r9b
	mov rdi, qword ptr [rsp + 392]
	lea rdi, [rdi + 4*rdx]
	mov r12, r11
	cmovne r12, rbp
	cmovne rdi, rax
	mov r8, r12
	shr r8, 3
	cmp r13, qword ptr [rsp + 360]
	seta r15b
	or r15b, r9b
	mov r9, qword ptr [rsp + 384]
	lea r15, [r9 + 4*rdx]
	cmovne r11, rbp
	cmovne r15, rax
	mov rdx, r11
	shr rdx, 3
	mov r9, r14
	shr r9, 3
	cmp rbx, r9
	cmovb r9, rbx
	cmp r8, r9
	cmovb r9, r8
	cmp rdx, r9
	cmovb r9, rdx
	test r9, r9
	movaps xmmword ptr [rsp + 112], xmm12
	movaps xmmword ptr [rsp + 96], xmm8
	movaps xmmword ptr [rsp + 208], xmm0
	movaps xmmword ptr [rsp + 80], xmm9
	movaps xmmword ptr [rsp + 64], xmm1
	movaps xmmword ptr [rsp + 336], xmm13
	je .LBB1952_48
	shl r9, 5
	xor edx, edx
	movaps xmm3, xmmword ptr [rsp + 160]
	movaps xmm12, xmm10
	movaps xmm9, xmm2
	movaps xmm5, xmmword ptr [rsp + 16]
	.p2align	4
.LBB1952_50:
	movapd xmmword ptr [rsp + 304], xmm4
	movaps xmmword ptr [rsp + 16], xmm5
	movapd xmmword ptr [rsp + 288], xmm7
	movaps xmmword ptr [rsp + 160], xmm6
	movups xmm0, xmmword ptr [rcx + rdx]
	movaps xmm14, xmmword ptr [rsp + 624]
	movaps xmm5, xmm14
	subps xmm5, xmm0
	movups xmm1, xmmword ptr [rsi + rdx]
	movaps xmm13, xmmword ptr [rsp + 640]
	movaps xmm6, xmm13
	subps xmm6, xmm1
	movaps xmm4, xmm5
	mulps xmm4, xmm5
	movaps xmm10, xmm6
	mulps xmm10, xmm6
	addps xmm10, xmm4
	movaps xmm8, xmm10
	movaps xmm11, xmmword ptr [rsp + 592]
	movaps xmm7, xmm11
	cmpleps xmm7, xmm10
	xorps xmm4, xmm4
	cmpltps xmm4, xmm10
	movaps xmm15, xmmword ptr [rsp + 608]
	cmpltps xmm10, xmm15
	andps xmm10, xmm7
	movups xmm7, xmmword ptr [rcx + rdx + 16]
	movaps xmm2, xmmword ptr [rip + .LCPI1952_6]
	andps xmm4, xmm2
	andps xmm4, xmm10
	movups xmm10, xmmword ptr [rsi + rdx + 16]
	cmpltps xmm8, xmm11
	andps xmm8, xmm2
	mulps xmm5, xmm8
	addps xmm12, xmm5
	mulps xmm8, xmm6
	movaps xmm2, xmmword ptr [rsp + 96]
	addps xmm2, xmm8
	movaps xmmword ptr [rsp + 96], xmm2
	mulps xmm0, xmm4
	movaps xmm2, xmmword ptr [rsp + 336]
	addps xmm2, xmm0
	movaps xmmword ptr [rsp + 336], xmm2
	mulps xmm1, xmm4
	movaps xmm0, xmmword ptr [rsp + 208]
	addps xmm0, xmm1
	movaps xmmword ptr [rsp + 208], xmm0
	movups xmm0, xmmword ptr [rdi + rdx]
	mulps xmm0, xmm4
	movaps xmm1, xmmword ptr [rsp + 64]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 64], xmm1
	movups xmm0, xmmword ptr [r15 + rdx]
	mulps xmm0, xmm4
	movaps xmm1, xmmword ptr [rsp + 80]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 80], xmm1
	movaps xmm0, xmmword ptr [rsp + 112]
	addps xmm0, xmm4
	movaps xmmword ptr [rsp + 112], xmm0
	subps xmm14, xmm7
	movaps xmm4, xmm13
	subps xmm4, xmm10
	movaps xmm0, xmm14
	mulps xmm0, xmm14
	movaps xmm5, xmm4
	mulps xmm5, xmm4
	addps xmm5, xmm0
	movaps xmm6, xmm5
	movaps xmm8, xmm11
	cmpleps xmm8, xmm5
	xorps xmm0, xmm0
	cmpltps xmm0, xmm5
	cmpltps xmm5, xmm15
	andps xmm5, xmm8
	movaps xmm2, xmm9
	movaps xmm9, xmm12
	movaps xmm12, xmm3
	movaps xmm3, xmmword ptr [rsp + 16]
	movaps xmm8, xmmword ptr [rsp + 160]
	movaps xmm13, xmmword ptr [rip + .LCPI1952_6]
	andps xmm0, xmm13
	andps xmm0, xmm5
	movaps xmm5, xmm3
	movaps xmm3, xmm12
	movaps xmm12, xmm9
	movaps xmm9, xmm2
	cmpltps xmm6, xmm11
	andps xmm6, xmm13
	mulps xmm14, xmm6
	addps xmm5, xmm14
	mulps xmm6, xmm4
	movaps xmm4, xmmword ptr [rsp + 304]
	addps xmm3, xmm6
	mulps xmm7, xmm0
	addps xmm4, xmm7
	movaps xmm7, xmmword ptr [rsp + 288]
	mulps xmm10, xmm0
	movaps xmm1, xmmword ptr [rsp + 320]
	addps xmm1, xmm10
	movaps xmmword ptr [rsp + 320], xmm1
	movups xmm1, xmmword ptr [rdi + rdx + 16]
	mulps xmm1, xmm0
	addps xmm9, xmm1
	movups xmm1, xmmword ptr [r15 + rdx + 16]
	mulps xmm1, xmm0
	addps xmm7, xmm1
	addps xmm8, xmm0
	movaps xmm6, xmm8
	add rdx, 32
	cmp r9, rdx
	jne .LBB1952_50
	jmp .LBB1952_51
	.p2align	4
.LBB1952_48:
	movaps xmm3, xmmword ptr [rsp + 160]
	movaps xmm12, xmm10
	movaps xmm9, xmm2
	movaps xmm5, xmmword ptr [rsp + 16]
.LBB1952_51:
	movaps xmmword ptr [rsp + 288], xmm12
	movaps xmm11, xmm9
	movaps xmm0, xmmword ptr [rsp + 112]
	movaps xmmword ptr [rsp + 160], xmm3
	mov r9d, r14d
	and r9d, 7
	mov r8, r13
	sub r8, 8
	mov edx, 0
	cmovae rdx, r8
	test r9, r9
	mov rbp, qword ptr [rsp + 544]
	movaps xmmword ptr [rsp + 16], xmm5
	je .LBB1952_64
	lea rbx, [rdx + 8]
	cmp rbx, rbp
	ja .LBB1952_64
	cmp rbx, qword ptr [rsp + 512]
	ja .LBB1952_64
	movaps xmmword ptr [rsp + 304], xmm4
	movaps xmm12, xmm7
	sub r13, rdx
	mov rcx, r13
	movss xmm3, dword ptr [rip + .LCPI1952_2]
	sub rcx, r9
	mov r8, qword ptr [rsp + 8]
	movaps xmm14, xmmword ptr [rsp + 640]
	je .LBB1952_56
	xorps xmm3, xmm3
	jmp .LBB1952_56
	.p2align	4
.LBB1952_64:
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
	movaps xmm12, xmm0
	movaps xmm14, xmm11
	je .LBB1952_65
	movaps xmm11, xmm4
	and r14d, -8
	and r10d, -8
	and r12d, -8
	and r11d, -8
	movss xmm0, dword ptr [rcx + 4*r14]
	movss xmm1, dword ptr [rsi + 4*r10]
	unpcklps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 240]
	subps xmm1, xmm0
	movaps xmm5, xmm1
	mulps xmm5, xmm1
	movaps xmm4, xmm5
	shufps xmm4, xmm5, 85
	addss xmm4, xmm5
	movaps xmm5, xmmword ptr [rsp + 192]
	ucomiss xmm5, xmm4
	movaps xmm10, xmmword ptr [rsp + 288]
	movaps xmm15, xmmword ptr [rsp + 208]
	movaps xmm13, xmmword ptr [rsp + 336]
	jbe .LBB1952_67
	movaps xmm0, xmmword ptr [rsp + 144]
	shufps xmm0, xmm0, 235
	movaps xmm9, xmm0
	addps xmm9, xmm1
	movaps xmm0, xmm9
	shufps xmm0, xmm9, 17
	movaps xmmword ptr [rsp + 144], xmm0
	jmp .LBB1952_70
	.p2align	4
.LBB1952_65:
	movaps xmm8, xmmword ptr [rsp + 96]
	movaps xmm10, xmmword ptr [rsp + 288]
	movaps xmm15, xmmword ptr [rsp + 208]
	movaps xmm9, xmmword ptr [rsp + 80]
	movaps xmm1, xmmword ptr [rsp + 64]
	mov r8, qword ptr [rsp + 8]
	movaps xmm13, xmmword ptr [rsp + 336]
	jmp .LBB1952_57
	.p2align	4
.LBB1952_67:
	movaps xmm9, xmmword ptr [rsp + 144]
	shufps xmm9, xmm9, 235
	movaps xmm1, xmmword ptr [rsp + 176]
	ucomiss xmm1, xmm4
	jbe .LBB1952_70
	xorps xmm1, xmm1
	ucomiss xmm4, xmm1
	jbe .LBB1952_70
	movss xmm1, dword ptr [rdi + 4*r12]
	movss xmm4, dword ptr [r15 + 4*r11]
	unpcklps xmm1, xmm4
	movlhps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 48]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 48], xmm1
	movss xmm0, dword ptr [rsp + 4]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movss dword ptr [rsp + 4], xmm0
.LBB1952_70:
	cmp r9d, 1
	je .LBB1952_71
	movaps xmm3, xmm7
	movss xmm0, dword ptr [rcx + 4*r14 + 4]
	movss xmm1, dword ptr [rsi + 4*r10 + 4]
	movaps xmm4, xmmword ptr [rsp + 672]
	subss xmm4, xmm0
	movaps xmm5, xmmword ptr [rsp + 656]
	subss xmm5, xmm1
	movaps xmm7, xmm4
	mulss xmm7, xmm4
	movaps xmm2, xmm5
	mulss xmm2, xmm5
	addss xmm2, xmm7
	movaps xmm7, xmmword ptr [rsp + 192]
	ucomiss xmm7, xmm2
	jbe .LBB1952_73
	unpcklps xmm4, xmm5
	addps xmm9, xmm4
	movaps xmm0, xmm9
	shufps xmm0, xmm9, 17
	movaps xmmword ptr [rsp + 144], xmm0
.LBB1952_77:
	movaps xmm7, xmm3
	jmp .LBB1952_78
.LBB1952_73:
	movaps xmm4, xmmword ptr [rsp + 176]
	ucomiss xmm4, xmm2
	jbe .LBB1952_77
	xorps xmm4, xmm4
	ucomiss xmm2, xmm4
	movaps xmm7, xmm3
	jbe .LBB1952_78
	movss xmm4, dword ptr [rdi + 4*r12 + 4]
	movss xmm5, dword ptr [r15 + 4*r11 + 4]
	unpcklps xmm4, xmm5
	unpcklps xmm0, xmm1
	movlhps xmm0, xmm4
	movaps xmm1, xmmword ptr [rsp + 48]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 48], xmm1
	movss xmm0, dword ptr [rsp + 4]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movss dword ptr [rsp + 4], xmm0
.LBB1952_78:
	cmp r9d, 2
	je .LBB1952_71
	movss xmm0, dword ptr [rcx + 4*r14 + 8]
	movss xmm1, dword ptr [rsi + 4*r10 + 8]
	unpcklps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 240]
	subps xmm1, xmm0
	movaps xmm5, xmm1
	mulps xmm5, xmm1
	movaps xmm4, xmm5
	shufps xmm4, xmm5, 85
	addss xmm4, xmm5
	movaps xmm5, xmmword ptr [rsp + 192]
	ucomiss xmm5, xmm4
	jbe .LBB1952_80
	addps xmm9, xmm1
	movaps xmm0, xmm9
	shufps xmm0, xmm9, 17
	movaps xmmword ptr [rsp + 144], xmm0
	jmp .LBB1952_84
.LBB1952_80:
	movaps xmm1, xmmword ptr [rsp + 176]
	ucomiss xmm1, xmm4
	jbe .LBB1952_84
	xorps xmm1, xmm1
	ucomiss xmm4, xmm1
	jbe .LBB1952_84
	movss xmm1, dword ptr [rdi + 4*r12 + 8]
	movss xmm4, dword ptr [r15 + 4*r11 + 8]
	unpcklps xmm1, xmm4
	movlhps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 48]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 48], xmm1
	movss xmm0, dword ptr [rsp + 4]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movss dword ptr [rsp + 4], xmm0
.LBB1952_84:
	cmp r9d, 3
	je .LBB1952_71
	movss xmm0, dword ptr [rcx + 4*r14 + 12]
	movss xmm1, dword ptr [rsi + 4*r10 + 12]
	unpcklps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 240]
	subps xmm1, xmm0
	movaps xmm5, xmm1
	mulps xmm5, xmm1
	movaps xmm4, xmm5
	shufps xmm4, xmm5, 85
	addss xmm4, xmm5
	movaps xmm5, xmmword ptr [rsp + 192]
	ucomiss xmm5, xmm4
	jbe .LBB1952_86
	addps xmm9, xmm1
	movaps xmm0, xmm9
	shufps xmm0, xmm9, 17
	movaps xmmword ptr [rsp + 144], xmm0
	jmp .LBB1952_90
.LBB1952_86:
	movaps xmm1, xmmword ptr [rsp + 176]
	ucomiss xmm1, xmm4
	jbe .LBB1952_90
	xorps xmm1, xmm1
	ucomiss xmm4, xmm1
	jbe .LBB1952_90
	movss xmm1, dword ptr [rdi + 4*r12 + 12]
	movss xmm4, dword ptr [r15 + 4*r11 + 12]
	unpcklps xmm1, xmm4
	movlhps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 48]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 48], xmm1
	movss xmm0, dword ptr [rsp + 4]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movss dword ptr [rsp + 4], xmm0
.LBB1952_90:
	cmp r9d, 4
	je .LBB1952_71
	movss xmm0, dword ptr [rcx + 4*r14 + 16]
	movss xmm1, dword ptr [rsi + 4*r10 + 16]
	unpcklps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 240]
	subps xmm1, xmm0
	movaps xmm5, xmm1
	mulps xmm5, xmm1
	movaps xmm4, xmm5
	shufps xmm4, xmm5, 85
	addss xmm4, xmm5
	movaps xmm5, xmmword ptr [rsp + 192]
	ucomiss xmm5, xmm4
	jbe .LBB1952_92
	addps xmm9, xmm1
	movaps xmm0, xmm9
	shufps xmm0, xmm9, 17
	movaps xmmword ptr [rsp + 144], xmm0
	jmp .LBB1952_96
.LBB1952_92:
	movaps xmm1, xmmword ptr [rsp + 176]
	ucomiss xmm1, xmm4
	jbe .LBB1952_96
	xorps xmm1, xmm1
	ucomiss xmm4, xmm1
	jbe .LBB1952_96
	movss xmm1, dword ptr [rdi + 4*r12 + 16]
	movss xmm4, dword ptr [r15 + 4*r11 + 16]
	unpcklps xmm1, xmm4
	movlhps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 48]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 48], xmm1
	movss xmm0, dword ptr [rsp + 4]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movss dword ptr [rsp + 4], xmm0
.LBB1952_96:
	cmp r9d, 5
	je .LBB1952_71
	movss xmm0, dword ptr [rcx + 4*r14 + 20]
	movss xmm1, dword ptr [rsi + 4*r10 + 20]
	unpcklps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 240]
	subps xmm1, xmm0
	movaps xmm5, xmm1
	mulps xmm5, xmm1
	movaps xmm4, xmm5
	shufps xmm4, xmm5, 85
	addss xmm4, xmm5
	movaps xmm5, xmmword ptr [rsp + 192]
	ucomiss xmm5, xmm4
	jbe .LBB1952_98
	addps xmm9, xmm1
	movaps xmm0, xmm9
	shufps xmm0, xmm9, 17
	movaps xmmword ptr [rsp + 144], xmm0
	jmp .LBB1952_102
.LBB1952_98:
	movaps xmm1, xmmword ptr [rsp + 176]
	ucomiss xmm1, xmm4
	jbe .LBB1952_102
	xorps xmm1, xmm1
	ucomiss xmm4, xmm1
	jbe .LBB1952_102
	movss xmm1, dword ptr [rdi + 4*r12 + 20]
	movss xmm4, dword ptr [r15 + 4*r11 + 20]
	unpcklps xmm1, xmm4
	movlhps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 48]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 48], xmm1
	movss xmm0, dword ptr [rsp + 4]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movss dword ptr [rsp + 4], xmm0
.LBB1952_102:
	cmp r9d, 6
	je .LBB1952_71
	movss xmm0, dword ptr [rcx + 4*r14 + 24]
	movss xmm1, dword ptr [rsi + 4*r10 + 24]
	unpcklps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 240]
	subps xmm1, xmm0
	movaps xmm5, xmm1
	mulps xmm5, xmm1
	movaps xmm4, xmm5
	shufps xmm4, xmm5, 85
	addss xmm4, xmm5
	movaps xmm5, xmmword ptr [rsp + 192]
	ucomiss xmm5, xmm4
	jbe .LBB1952_104
	addps xmm9, xmm1
	shufps xmm9, xmm9, 17
	movaps xmmword ptr [rsp + 144], xmm9
	.p2align	4
.LBB1952_71:
	movaps xmm8, xmmword ptr [rsp + 96]
	movaps xmm4, xmm11
	movaps xmm9, xmmword ptr [rsp + 80]
.LBB1952_106:
	movaps xmm1, xmmword ptr [rsp + 64]
	mov r8, qword ptr [rsp + 8]
	jmp .LBB1952_57
.LBB1952_104:
	movaps xmm1, xmmword ptr [rsp + 176]
	ucomiss xmm1, xmm4
	movaps xmm8, xmmword ptr [rsp + 96]
	movaps xmm9, xmmword ptr [rsp + 80]
	jbe .LBB1952_105
	xorps xmm1, xmm1
	ucomiss xmm4, xmm1
	jbe .LBB1952_105
	movss xmm1, dword ptr [rdi + 4*r12 + 24]
	movss xmm4, dword ptr [r15 + 4*r11 + 24]
	unpcklps xmm1, xmm4
	movlhps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 48]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 48], xmm1
	movss xmm0, dword ptr [rsp + 4]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movss dword ptr [rsp + 4], xmm0
.LBB1952_105:
	movaps xmm4, xmm11
	jmp .LBB1952_106
.LBB1952_58:
	movaps xmm2, xmm9
	movaps xmm5, xmmword ptr [rsp + 48]
	movaps xmmword ptr [rsp + 256], xmm5
	movss xmm0, dword ptr [rsp + 4]
	movss dword ptr [rsp + 272], xmm0
	movaps xmm11, xmmword ptr [rsp + 144]
	movaps xmm0, xmm11
	shufps xmm0, xmm11, 85
	movss dword ptr [rsp + 276], xmm0
	movaps xmm0, xmm13
	unpcklps xmm0, xmm15
	movaps xmm3, xmm1
	unpcklps xmm1, xmm9
	movlhps xmm0, xmm1
	movaps xmm1, xmm15
	shufps xmm1, xmm13, 17
	movaps xmm9, xmm4
	movaps xmm4, xmm2
	shufps xmm4, xmm3, 17
	shufps xmm1, xmm4, 34
	addps xmm1, xmm0
	movaps xmm0, xmm13
	unpckhps xmm0, xmm15
	movaps xmm4, xmm2
	unpckhpd xmm4, xmm3
	shufps xmm0, xmm4, 36
	addps xmm0, xmm1
	shufps xmm15, xmm13, 51
	shufps xmm2, xmm3, 255
	shufps xmm15, xmm2, 34
	addps xmm15, xmm0
	movaps xmm0, xmm9
	movaps xmm3, xmmword ptr [rsp + 320]
	unpcklps xmm0, xmm3
	movaps xmm1, xmm7
	movlhps xmm1, xmm14
	shufps xmm0, xmm1, 36
	addps xmm0, xmm15
	movaps xmm1, xmm3
	shufps xmm1, xmm9, 17
	movaps xmm2, xmm7
	shufps xmm2, xmm14, 85
	shufps xmm1, xmm2, 34
	addps xmm1, xmm0
	movaps xmm0, xmm9
	unpckhps xmm0, xmm3
	movaps xmm2, xmm7
	unpckhpd xmm2, xmm14
	shufps xmm0, xmm2, 36
	addps xmm0, xmm1
	shufps xmm3, xmm9, 51
	shufps xmm7, xmm14, 255
	shufps xmm3, xmm7, 34
	addps xmm3, xmm0
	movaps xmm0, xmm12
	unpcklps xmm0, xmm10
	movaps xmm1, xmm10
	shufps xmm1, xmm12, 17
	shufps xmm1, xmm12, 226
	addps xmm1, xmm0
	movaps xmm0, xmm12
	unpckhps xmm0, xmm10
	addps xmm0, xmm1
	shufps xmm10, xmm12, 255
	shufps xmm10, xmm12, 226
	addps xmm10, xmm0
	movaps xmm0, xmm6
	movaps xmm2, xmmword ptr [rsp + 16]
	unpcklps xmm0, xmm2
	addps xmm0, xmm10
	movaps xmm1, xmm2
	shufps xmm1, xmm6, 17
	shufps xmm1, xmm6, 226
	addps xmm1, xmm0
	movaps xmm0, xmm6
	unpckhps xmm0, xmm2
	addps xmm0, xmm1
	shufps xmm2, xmm6, 255
	shufps xmm2, xmm6, 226
	movss dword ptr [rsp + 280], xmm11
	addps xmm2, xmm0
	movsd xmm0, qword ptr [rsp + 272]
	addps xmm0, xmm2
	addps xmm3, xmm5
	movaps xmm1, xmm8
	shufps xmm1, xmm8, 85
	addss xmm1, xmm8
	movaps xmm2, xmm8
	unpckhpd xmm2, xmm8
	addss xmm2, xmm1
	shufps xmm8, xmm8, 255
	addss xmm8, xmm2
	movaps xmm12, xmmword ptr [rsp + 160]
	addss xmm8, xmm12
	movaps xmm1, xmm12
	shufps xmm1, xmm12, 85
	addss xmm1, xmm8
	movaps xmm2, xmm12
	unpckhpd xmm2, xmm12
	addss xmm2, xmm1
	shufps xmm12, xmm12, 255
	addss xmm12, xmm2
	addss xmm12, xmm11
.LBB1952_59:
	movapd xmmword ptr [rsp + 256], xmm3
	movlps qword ptr [rsp + 272], xmm0
	movss dword ptr [rsp + 280], xmm12
	lea rdi, [rsp + 432]
	mov rsi, qword ptr [rsp + 496]
	movss xmm0, dword ptr [rsp + 236]
	movss xmm1, dword ptr [rsp + 140]
	lea rdx, [rsp + 576]
	lea rcx, [rsp + 416]
	lea r8, [rsp + 256]
	call swarm::rules::finish
	mov rsi, qword ptr [rsp + 504]
	cmp rsi, qword ptr [rsp + 480]
	jae .LBB1952_61
	movss xmm0, dword ptr [rsp + 432]
	movss xmm1, dword ptr [rsp + 436]
	movss xmm2, dword ptr [rsp + 440]
	movss xmm3, dword ptr [rsp + 444]
	mov rax, qword ptr [rsp + 472]
	movss dword ptr [rax + 4*rsi], xmm0
	mov rax, qword ptr [rsp + 464]
	movss dword ptr [rax + 4*rsi], xmm1
	mov rax, qword ptr [rsp + 456]
	movss dword ptr [rax + 4*rsi], xmm2
	mov rax, qword ptr [rsp + 448]
	movss dword ptr [rax + 4*rsi], xmm3
	jmp .LBB1952_61
.LBB1952_63:
	add rsp, 728
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
