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
	sub rsp, 792
	.cfi_def_cfa_offset 848
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r13, rdi
	lea rax, [rdi + 316]
	mov qword ptr [rsp + 552], rax
	movss xmm5, dword ptr [rdi + 288]
	movss xmm6, dword ptr [rdi + 292]
	movss dword ptr [rsp + 172], xmm6
	mov eax, dword ptr [rdi + 312]
	mov dword ptr [rsp + 632], eax
	mov rax, qword ptr [rdi + 304]
	mov qword ptr [rsp + 624], rax
	movss xmm0, dword ptr [rdi + 316]
	mov rax, qword ptr [rdi + 8]
	mov qword ptr [rsp + 32], rax
	mov rbp, qword ptr [rdi + 16]
	mov rax, qword ptr [rdi + 32]
	mov qword ptr [rsp + 128], rax
	mov rax, qword ptr [rdi + 40]
	mov qword ptr [rsp + 64], rax
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
	movss dword ptr [rsp + 144], xmm1
	movss dword ptr [rdi + 280], xmm1
	movss dword ptr [rsp + 252], xmm5
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
	movss xmm0, dword ptr [rsp + 144]
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
	mov rsi, qword ptr [rsp + 32]
	mov rdx, rbp
	mov rcx, qword ptr [rsp + 128]
	mov r8, qword ptr [rsp + 64]
	call <swarm::grid::Grid>::fill
	mov rcx, r13
	mov r12, qword ptr [r13 + 248]
	mov rax, qword ptr [r13 + 256]
	mov rbp, qword ptr [r13 + 8]
	mov r14, qword ptr [r13 + 16]
	mov qword ptr [r13 + 112], 0
	lea rbx, [r12 + 4*rax]
	lea rax, [r13 + 96]
	mov qword ptr [rsp + 128], rax
	mov r13, r12
	mov qword ptr [rsp + 56], rcx
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
	mov rdi, qword ptr [rsp + 128]
	mov rsi, r15
	movss dword ptr [rsp + 32], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 32]
	mov rcx, qword ptr [rsp + 56]
	jmp .LBB1952_8
.LBB1952_9:
	mov r13, qword ptr [rcx + 32]
	mov r15, qword ptr [rcx + 40]
	mov qword ptr [rcx + 136], 0
	xor r14d, r14d
	lea rax, [rcx + 120]
	mov qword ptr [rsp + 128], rax
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
	mov rdi, qword ptr [rsp + 128]
	mov rsi, r14
	movss dword ptr [rsp + 32], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 32]
	mov rcx, qword ptr [rsp + 56]
	jmp .LBB1952_17
.LBB1952_18:
	mov r13, qword ptr [rcx + 56]
	mov r15, qword ptr [rcx + 64]
	mov qword ptr [rcx + 160], 0
	xor r14d, r14d
	lea rax, [rcx + 144]
	mov qword ptr [rsp + 128], rax
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
	mov rdi, qword ptr [rsp + 128]
	mov rsi, r14
	movss dword ptr [rsp + 32], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 32]
	mov rcx, qword ptr [rsp + 56]
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
	movss dword ptr [rsp + 32], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 32]
	mov rcx, qword ptr [rsp + 56]
	jmp .LBB1952_35
.LBB1952_36:
	movups xmm0, xmmword ptr [rcx + 96]
	mov rax, qword ptr [rcx + 8]
	mov qword ptr [rsp + 528], rax
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
	mov qword ptr [rsp + 520], rax
	mov qword ptr [rcx + 128], rax
	mov rdx, qword ptr [rcx + 56]
	movups xmm1, xmmword ptr [rcx + 144]
	movups xmm2, xmmword ptr [rcx + 40]
	mov rax, qword ptr [rcx + 40]
	movups xmmword ptr [rcx + 32], xmm0
	movups xmmword ptr [rcx + 136], xmm2
	movups xmmword ptr [rcx + 48], xmm1
	mov qword ptr [rsp + 512], rdx
	mov qword ptr [rcx + 152], rdx
	movups xmm0, xmmword ptr [rcx + 64]
	movups xmm1, xmmword ptr [rcx + 160]
	mov rsi, rcx
	mov rcx, qword ptr [rcx + 64]
	movups xmmword ptr [rsi + 64], xmm1
	movups xmmword ptr [rsi + 160], xmm0
	mov r9, qword ptr [rsi + 80]
	mov rdx, qword ptr [rsi + 176]
	mov qword ptr [rsi + 80], rdx
	mov qword ptr [rsp + 504], r9
	mov qword ptr [rsi + 176], r9
	mov rdx, qword ptr [rsi + 88]
	mov qword ptr [rsi + 88], r14
	mov qword ptr [rsi + 184], rdx
	test rdi, rdi
	je .LBB1952_67
	mov rsi, qword ptr [rsp + 56]
	movss xmm0, dword ptr [rsi + 316]
	movss xmm1, dword ptr [rsi + 320]
	mulss xmm1, xmm1
	cmp rax, r8
	cmovb r8, rax
	mulss xmm0, xmm0
	cmp rcx, r8
	cmovb r8, rcx
	movaps xmmword ptr [rsp + 208], xmm0
	shufps xmm0, xmm0, 0
	movaps xmmword ptr [rsp + 224], xmm1
	shufps xmm1, xmm1, 0
	cmp rdx, r8
	cmovb r8, rdx
	mov qword ptr [rsp + 536], r8
	xor esi, esi
	mov qword ptr [rsp + 544], rdi
	movaps xmmword ptr [rsp + 656], xmm0
	movaps xmmword ptr [rsp + 640], xmm1
	jmp .LBB1952_38
.LBB1952_65:
	mov rdi, qword ptr [rsp + 544]
	.p2align	4
.LBB1952_66:
	inc rsi
	cmp rsi, rdi
	je .LBB1952_67
.LBB1952_38:
	mov rax, qword ptr [rsp + 56]
	mov r12, qword ptr [rax + 16]
	cmp rsi, r12
	jae .LBB1952_66
	mov rcx, qword ptr [rax + 40]
	mov qword ptr [rsp + 408], rcx
	cmp rsi, rcx
	jae .LBB1952_66
	mov rcx, qword ptr [rax + 64]
	mov rax, qword ptr [rax + 88]
	mov qword ptr [rsp + 368], rcx
	cmp rsi, rcx
	setb cl
	mov qword ptr [rsp + 360], rax
	cmp rsi, rax
	setb dl
	and dl, cl
	mov rax, qword ptr [rsp + 56]
	cmp dl, 1
	jne .LBB1952_66
	mov rcx, qword ptr [rax + 8]
	mov qword ptr [rsp + 400], rcx
	movss xmm9, dword ptr [rcx + 4*rsi]
	mov rcx, qword ptr [rax + 32]
	mov r8, qword ptr [rax + 56]
	mov qword ptr [rsp + 392], rcx
	movss xmm10, dword ptr [rcx + 4*rsi]
	mov r9, qword ptr [rax + 80]
	movss xmm1, dword ptr [rax + 280]
	movaps xmm2, xmm9
	mulss xmm2, xmm1
	xorps xmm8, xmm8
	maxss xmm2, xmm8
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
	mov qword ptr [rsp + 384], r8
	movss xmm3, dword ptr [r8 + 4*rsi]
	mov qword ptr [rsp + 560], rsi
	mov qword ptr [rsp + 376], r9
	movss xmm0, dword ptr [r9 + 4*rsi]
	movss dword ptr [rsp + 432], xmm9
	movss dword ptr [rsp + 436], xmm10
	mov rcx, qword ptr [rax + 264]
	mov r8, -1
	cmova r10, r8
	mov qword ptr [rsp + 616], rcx
	sub rcx, 1
	cmovb rcx, rdi
	movss dword ptr [rsp + 440], xmm3
	cmp rcx, r10
	cmovb r10, rcx
	movss xmm6, dword ptr [rip + .LCPI1952_5]
	ucomiss xmm2, xmm6
	cmovae r10, rdi
	mulss xmm1, xmm10
	maxss xmm1, xmm8
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
	movss dword ptr [rsp + 444], xmm0
	cmova r9, r8
	mov rdx, qword ptr [rax + 272]
	sub rdx, 1
	cmovb rdx, rdi
	xorps xmm0, xmm0
	movups xmmword ptr [rsp + 316], xmm0
	cmp rdx, r9
	cmovb r9, rdx
	ucomiss xmm1, xmm6
	cmovae r9, rdi
	mov rax, r10
	sub rax, 1
	cmovb rax, rdi
	mov qword ptr [rsp + 600], rax
	mov r13, r9
	sub r13, 1
	cmovb r13, rdi
	inc r9
	cmp rdx, r9
	cmovb r9, rdx
	movaps xmmword ptr [rsp + 304], xmm0
	xorpd xmm3, xmm3
	mov qword ptr [rsp + 608], r9
	cmp r13, r9
	ja .LBB1952_63
	inc r10
	cmp rcx, r10
	cmovb r10, rcx
	mov rax, qword ptr [rsp + 368]
	mov rcx, qword ptr [rsp + 360]
	cmp rax, rcx
	cmovb rcx, rax
	inc r10
	mov qword ptr [rsp + 584], r10
	mov rax, qword ptr [rsp + 408]
	cmp rax, rcx
	cmovb rcx, rax
	mov qword ptr [rsp + 568], rcx
	mov rax, qword ptr [rsp + 56]
	mov rcx, qword ptr [rax + 200]
	mov qword ptr [rsp + 576], rcx
	mov rdi, qword ptr [rax + 208]
	movaps xmm0, xmm9
	unpcklps xmm0, xmm10
	movaps xmmword ptr [rsp + 256], xmm0
	movaps xmmword ptr [rsp + 688], xmm10
	movaps xmm8, xmm10
	shufps xmm8, xmm10, 0
	movaps xmmword ptr [rsp + 704], xmm9
	shufps xmm9, xmm9, 0
	movaps xmmword ptr [rsp + 416], xmm9
	xorps xmm0, xmm0
	movaps xmmword ptr [rsp + 336], xmm0
	xorps xmm0, xmm0
	movss dword ptr [rsp + 12], xmm0
	xorps xmm9, xmm9
	xorps xmm0, xmm0
	movaps xmmword ptr [rsp + 32], xmm0
	xorps xmm10, xmm10
	xorps xmm6, xmm6
	xorps xmm11, xmm11
	xorpd xmm7, xmm7
	xorps xmm12, xmm12
	xorps xmm1, xmm1
	movaps xmmword ptr [rsp + 192], xmm0
	xorps xmm15, xmm15
	xorpd xmm4, xmm4
	xorpd xmm5, xmm5
	movaps xmmword ptr [rsp + 80], xmm0
	movaps xmmword ptr [rsp + 176], xmm0
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 592], r12
	movaps xmmword ptr [rsp + 672], xmm8
	.p2align	4
.LBB1952_43:
	mov rcx, qword ptr [rsp + 616]
	imul rcx, r13
	mov rax, qword ptr [rsp + 600]
	lea rsi, [rcx + rax]
	cmp rsi, rdi
	mov qword ptr [rsp + 16], r13
	movaps xmm13, xmm1
	movaps xmm0, xmm15
	movaps xmm2, xmm12
	jae .LBB1952_44
	add rcx, qword ptr [rsp + 584]
	mov ebp, 0
	mov edx, 0
	cmp rcx, rdi
	jae .LBB1952_47
	mov rax, qword ptr [rsp + 576]
	mov edx, dword ptr [rax + 4*rsi]
	mov ebp, dword ptr [rax + 4*rcx]
	jmp .LBB1952_47
	.p2align	4
.LBB1952_44:
	xor ebp, ebp
	xor edx, edx
.LBB1952_47:
	mov r11, rbp
	sub r11, rdx
	setb r10b
	cmp rbp, r12
	seta cl
	or cl, r10b
	mov rax, qword ptr [rsp + 400]
	lea rdi, [rax + 4*rdx]
	mov r14, r11
	mov r12d, 0
	cmovne r14, r12
	mov eax, 4
	cmovne rdi, rax
	cmp rbp, qword ptr [rsp + 408]
	seta cl
	or cl, r10b
	mov rcx, r11
	cmovne rcx, r12
	mov rsi, qword ptr [rsp + 392]
	lea rsi, [rsi + 4*rdx]
	cmovne rsi, rax
	mov rbx, rcx
	shr rbx, 3
	cmp rbp, qword ptr [rsp + 368]
	seta r8b
	or r8b, r10b
	mov r8, qword ptr [rsp + 384]
	lea r8, [r8 + 4*rdx]
	mov r13, r11
	cmovne r13, r12
	cmovne r8, rax
	mov r9, r13
	shr r9, 3
	cmp rbp, qword ptr [rsp + 360]
	seta r15b
	or r15b, r10b
	mov r10, qword ptr [rsp + 376]
	lea r15, [r10 + 4*rdx]
	cmovne r11, r12
	cmovne r15, rax
	mov r10, r11
	shr r10, 3
	mov rdx, r14
	shr rdx, 3
	cmp rbx, rdx
	cmovb rdx, rbx
	cmp r9, rdx
	cmovb rdx, r9
	cmp r10, rdx
	cmovb rdx, r10
	test rdx, rdx
	movaps xmmword ptr [rsp + 128], xmm11
	movaps xmmword ptr [rsp + 96], xmm9
	movaps xmmword ptr [rsp + 480], xmm0
	movapd xmmword ptr [rsp + 144], xmm3
	movaps xmmword ptr [rsp + 64], xmm13
	movapd xmmword ptr [rsp + 112], xmm5
	je .LBB1952_48
	shl rdx, 5
	xor r10d, r10d
	movaps xmm11, xmmword ptr [rsp + 192]
	movaps xmm3, xmm10
	movaps xmm9, xmm2
	movaps xmm5, xmmword ptr [rsp + 32]
	.p2align	4
.LBB1952_50:
	movapd xmmword ptr [rsp + 448], xmm4
	movaps xmmword ptr [rsp + 32], xmm5
	movapd xmmword ptr [rsp + 464], xmm7
	movaps xmmword ptr [rsp + 192], xmm6
	movups xmm0, xmmword ptr [rdi + r10]
	movaps xmm13, xmmword ptr [rsp + 416]
	movaps xmm5, xmm13
	subps xmm5, xmm0
	movups xmm1, xmmword ptr [rsi + r10]
	movaps xmm14, xmmword ptr [rsp + 672]
	movaps xmm6, xmm14
	subps xmm6, xmm1
	movaps xmm4, xmm5
	mulps xmm4, xmm5
	movaps xmm10, xmm6
	mulps xmm10, xmm6
	addps xmm10, xmm4
	movaps xmm8, xmm10
	movaps xmm15, xmmword ptr [rsp + 640]
	movaps xmm7, xmm15
	cmpleps xmm7, xmm10
	xorps xmm4, xmm4
	cmpltps xmm4, xmm10
	movaps xmm12, xmmword ptr [rsp + 656]
	cmpltps xmm10, xmm12
	andps xmm10, xmm7
	movups xmm7, xmmword ptr [rdi + r10 + 16]
	movaps xmm2, xmmword ptr [rip + .LCPI1952_6]
	andps xmm4, xmm2
	andps xmm4, xmm10
	movups xmm10, xmmword ptr [rsi + r10 + 16]
	cmpltps xmm8, xmm15
	andps xmm8, xmm2
	mulps xmm5, xmm8
	addps xmm3, xmm5
	mulps xmm8, xmm6
	movaps xmm2, xmmword ptr [rsp + 96]
	addps xmm2, xmm8
	movaps xmmword ptr [rsp + 96], xmm2
	mulps xmm0, xmm4
	movaps xmm2, xmmword ptr [rsp + 112]
	addps xmm2, xmm0
	movaps xmmword ptr [rsp + 112], xmm2
	mulps xmm1, xmm4
	movaps xmm0, xmmword ptr [rsp + 480]
	addps xmm0, xmm1
	movaps xmmword ptr [rsp + 480], xmm0
	movups xmm0, xmmword ptr [r8 + r10]
	mulps xmm0, xmm4
	movaps xmm1, xmmword ptr [rsp + 64]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 64], xmm1
	movups xmm0, xmmword ptr [r15 + r10]
	mulps xmm0, xmm4
	movaps xmm1, xmmword ptr [rsp + 144]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 144], xmm1
	movaps xmm0, xmmword ptr [rsp + 128]
	addps xmm0, xmm4
	movaps xmmword ptr [rsp + 128], xmm0
	subps xmm13, xmm7
	subps xmm14, xmm10
	movaps xmm0, xmm13
	mulps xmm0, xmm13
	movaps xmm5, xmm14
	mulps xmm5, xmm14
	addps xmm5, xmm0
	movaps xmm6, xmm5
	movaps xmm8, xmm15
	cmpleps xmm8, xmm5
	xorps xmm0, xmm0
	cmpltps xmm0, xmm5
	cmpltps xmm5, xmm12
	andps xmm5, xmm8
	movaps xmm2, xmm9
	movaps xmm9, xmm11
	movaps xmm11, xmm3
	movaps xmm3, xmmword ptr [rsp + 32]
	movaps xmm8, xmmword ptr [rsp + 192]
	movaps xmm12, xmmword ptr [rip + .LCPI1952_6]
	andps xmm0, xmm12
	andps xmm0, xmm5
	movaps xmm5, xmm3
	movaps xmm3, xmm11
	movaps xmm11, xmm9
	movaps xmm9, xmm2
	cmpltps xmm6, xmm15
	andps xmm6, xmm12
	mulps xmm13, xmm6
	addps xmm5, xmm13
	mulps xmm6, xmm14
	movaps xmm4, xmmword ptr [rsp + 448]
	movaps xmm1, xmmword ptr [rsp + 336]
	addps xmm1, xmm6
	movaps xmmword ptr [rsp + 336], xmm1
	mulps xmm7, xmm0
	addps xmm4, xmm7
	movaps xmm7, xmmword ptr [rsp + 464]
	mulps xmm10, xmm0
	addps xmm11, xmm10
	movups xmm1, xmmword ptr [r8 + r10 + 16]
	mulps xmm1, xmm0
	addps xmm9, xmm1
	movups xmm1, xmmword ptr [r15 + r10 + 16]
	mulps xmm1, xmm0
	addps xmm7, xmm1
	addps xmm8, xmm0
	movaps xmm6, xmm8
	add r10, 32
	cmp rdx, r10
	jne .LBB1952_50
	jmp .LBB1952_51
	.p2align	4
.LBB1952_48:
	movaps xmm11, xmmword ptr [rsp + 192]
	movaps xmm3, xmm10
	movaps xmm9, xmm2
	movaps xmm5, xmmword ptr [rsp + 32]
.LBB1952_51:
	movaps xmmword ptr [rsp + 32], xmm5
	movaps xmm5, xmmword ptr [rsp + 480]
	movaps xmm2, xmm9
	movaps xmm0, xmmword ptr [rsp + 128]
	movaps xmmword ptr [rsp + 192], xmm11
	mov r10d, r14d
	and r10d, 7
	mov r9, rbp
	sub r9, 8
	mov edx, 0
	cmovae rdx, r9
	test r10, r10
	mov r12, qword ptr [rsp + 592]
	je .LBB1952_68
	lea rbx, [rdx + 8]
	cmp rbx, r12
	ja .LBB1952_68
	cmp rbx, qword ptr [rsp + 568]
	jbe .LBB1952_54
	.p2align	4
.LBB1952_68:
	mov edx, ecx
	and edx, 7
	mov r9d, r13d
	and r9d, 7
	mov ebx, r11d
	and ebx, 7
	cmp rdx, r10
	cmovb r10, rdx
	cmp r9, r10
	cmovb r10, r9
	cmp rbx, r10
	cmovb r10, rbx
	test r10, r10
	movaps xmm10, xmm3
	movaps xmm11, xmm0
	movaps xmm12, xmm2
	movaps xmm15, xmm5
	je .LBB1952_69
	movaps xmm13, xmm4
	and r14d, -8
	and ecx, -8
	and r13d, -8
	and r11d, -8
	movss xmm0, dword ptr [rdi + 4*r14]
	movss xmm1, dword ptr [rsi + 4*rcx]
	unpcklps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 256]
	subps xmm1, xmm0
	movaps xmm5, xmm1
	mulps xmm5, xmm1
	movaps xmm4, xmm5
	shufps xmm4, xmm5, 85
	addss xmm4, xmm5
	movaps xmm5, xmmword ptr [rsp + 224]
	ucomiss xmm5, xmm4
	jbe .LBB1952_73
	movaps xmm0, xmmword ptr [rsp + 176]
	shufps xmm0, xmm0, 235
	movaps xmm9, xmm0
	addps xmm9, xmm1
	movaps xmm0, xmm9
	shufps xmm0, xmm9, 17
	movaps xmmword ptr [rsp + 176], xmm0
	jmp .LBB1952_76
	.p2align	4
.LBB1952_69:
	movaps xmm9, xmmword ptr [rsp + 96]
	jmp .LBB1952_70
	.p2align	4
.LBB1952_73:
	movaps xmm9, xmmword ptr [rsp + 176]
	shufps xmm9, xmm9, 235
	movaps xmm1, xmmword ptr [rsp + 208]
	ucomiss xmm1, xmm4
	jbe .LBB1952_76
	xorps xmm1, xmm1
	ucomiss xmm4, xmm1
	jbe .LBB1952_76
	movss xmm1, dword ptr [r8 + 4*r13]
	movss xmm4, dword ptr [r15 + 4*r11]
	unpcklps xmm1, xmm4
	movlhps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 80]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 80], xmm1
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movss dword ptr [rsp + 12], xmm0
.LBB1952_76:
	cmp r10d, 1
	jne .LBB1952_78
	movaps xmm9, xmmword ptr [rsp + 96]
	movaps xmm4, xmm13
.LBB1952_70:
	movaps xmm3, xmmword ptr [rsp + 144]
	jmp .LBB1952_71
	.p2align	4
.LBB1952_78:
	movaps xmm3, xmm7
	movss xmm0, dword ptr [rdi + 4*r14 + 4]
	movss xmm1, dword ptr [rsi + 4*rcx + 4]
	movaps xmm4, xmmword ptr [rsp + 704]
	subss xmm4, xmm0
	movaps xmm5, xmmword ptr [rsp + 688]
	subss xmm5, xmm1
	movaps xmm7, xmm4
	mulss xmm7, xmm4
	movaps xmm2, xmm5
	mulss xmm2, xmm5
	addss xmm2, xmm7
	movaps xmm7, xmmword ptr [rsp + 224]
	ucomiss xmm7, xmm2
	jbe .LBB1952_79
	unpcklps xmm4, xmm5
	addps xmm9, xmm4
	movaps xmm0, xmm9
	shufps xmm0, xmm9, 17
	movaps xmmword ptr [rsp + 176], xmm0
.LBB1952_83:
	movaps xmm7, xmm3
	jmp .LBB1952_84
.LBB1952_54:
	movaps xmm13, xmm7
	sub rbp, rdx
	cmp rbp, 8
	movaps xmm11, xmm2
	movaps xmmword ptr [rsp + 448], xmm4
	jne .LBB1952_56
	lea rax, [rip + swarm::rules::lanes::STEPS]
	lea rcx, [rax + 4*r10]
	add rcx, 224
	mov r9, qword ptr [rsp + 16]
	movaps xmm9, xmmword ptr [rsp + 416]
	jmp .LBB1952_59
.LBB1952_79:
	movaps xmm4, xmmword ptr [rsp + 208]
	ucomiss xmm4, xmm2
	jbe .LBB1952_83
	xorps xmm4, xmm4
	ucomiss xmm2, xmm4
	movaps xmm7, xmm3
	jbe .LBB1952_84
	movss xmm4, dword ptr [r8 + 4*r13 + 4]
	movss xmm5, dword ptr [r15 + 4*r11 + 4]
	unpcklps xmm4, xmm5
	unpcklps xmm0, xmm1
	movlhps xmm0, xmm4
	movaps xmm1, xmmword ptr [rsp + 80]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 80], xmm1
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movss dword ptr [rsp + 12], xmm0
.LBB1952_84:
	movaps xmm3, xmmword ptr [rsp + 144]
	cmp r10d, 2
	je .LBB1952_85
	movss xmm0, dword ptr [rdi + 4*r14 + 8]
	movss xmm1, dword ptr [rsi + 4*rcx + 8]
	unpcklps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 256]
	subps xmm1, xmm0
	movaps xmm5, xmm1
	mulps xmm5, xmm1
	movaps xmm4, xmm5
	shufps xmm4, xmm5, 85
	addss xmm4, xmm5
	movaps xmm5, xmmword ptr [rsp + 224]
	ucomiss xmm5, xmm4
	jbe .LBB1952_87
	addps xmm9, xmm1
	movaps xmm0, xmm9
	shufps xmm0, xmm9, 17
	movaps xmmword ptr [rsp + 176], xmm0
	jmp .LBB1952_91
.LBB1952_56:
	mov rcx, rbp
	movss xmm7, dword ptr [rip + .LCPI1952_2]
	sub rcx, r10
	mov r9, qword ptr [rsp + 16]
	movaps xmm9, xmmword ptr [rsp + 416]
	je .LBB1952_58
	xorps xmm7, xmm7
.LBB1952_58:
	cmp rcx, 2
	setb al
	cmp rbp, 2
	setae sil
	and sil, al
	movzx eax, sil
	xorps xmm10, xmm10
	cvtsi2ss xmm10, eax
	cmp rcx, 3
	setb al
	cmp rbp, 3
	setae sil
	and sil, al
	movzx eax, sil
	xorps xmm0, xmm0
	cvtsi2ss xmm0, eax
	cmp rcx, 4
	setb al
	cmp rbp, 4
	setae sil
	and sil, al
	movzx eax, sil
	xorps xmm1, xmm1
	cvtsi2ss xmm1, eax
	cmp rcx, 5
	setb al
	cmp rbp, 5
	setae sil
	and sil, al
	movzx eax, sil
	cvtsi2ss xmm4, eax
	cmp rcx, 6
	setb al
	cmp rbp, 6
	setae sil
	and sil, al
	movzx eax, sil
	cvtsi2ss xmm15, eax
	cmp rcx, 7
	setb al
	cmp rbp, 7
	setae sil
	and sil, al
	movzx eax, sil
	cvtsi2ss xmm2, eax
	cmp rcx, 8
	setb al
	cmp rbp, 8
	setae cl
	and cl, al
	movzx eax, cl
	cvtsi2ss xmm8, eax
	movss dword ptr [rsp + 272], xmm7
	movss dword ptr [rsp + 276], xmm10
	movss dword ptr [rsp + 280], xmm0
	movss dword ptr [rsp + 284], xmm1
	movss dword ptr [rsp + 288], xmm4
	movss dword ptr [rsp + 292], xmm15
	movss dword ptr [rsp + 296], xmm2
	movss dword ptr [rsp + 300], xmm8
	lea rcx, [rsp + 272]
.LBB1952_59:
	movups xmm14, xmmword ptr [rcx + 16]
	mov rax, qword ptr [rsp + 400]
	movups xmm0, xmmword ptr [rax + 4*rdx + 16]
	movaps xmmword ptr [rsp + 736], xmm0
	movaps xmm1, xmm9
	subps xmm1, xmm0
	movaps xmmword ptr [rsp + 768], xmm1
	mulps xmm1, xmm1
	mov rsi, qword ptr [rsp + 392]
	movups xmm0, xmmword ptr [rsi + 4*rdx + 16]
	movaps xmm12, xmmword ptr [rsp + 672]
	movaps xmm10, xmm12
	subps xmm10, xmm0
	movaps xmm7, xmm10
	mulps xmm7, xmm10
	addps xmm7, xmm1
	movaps xmm9, xmmword ptr [rsp + 640]
	movaps xmm1, xmm9
	cmpleps xmm1, xmm7
	movaps xmm4, xmm7
	movaps xmm15, xmmword ptr [rsp + 656]
	cmpltps xmm4, xmm15
	andps xmm4, xmm1
	xorps xmm1, xmm1
	cmpltps xmm1, xmm7
	movaps xmm8, xmmword ptr [rip + .LCPI1952_6]
	andps xmm1, xmm8
	andps xmm1, xmm4
	mulps xmm1, xmm14
	mov r8, qword ptr [rsp + 376]
	movups xmm4, xmmword ptr [r8 + 4*rdx + 16]
	mulps xmm4, xmm1
	addps xmm13, xmm4
	movaps xmmword ptr [rsp + 464], xmm13
	mov rdi, qword ptr [rsp + 384]
	movups xmm4, xmmword ptr [rdi + 4*rdx + 16]
	mulps xmm4, xmm1
	addps xmm11, xmm4
	movaps xmmword ptr [rsp + 752], xmm11
	movups xmm11, xmmword ptr [rcx]
	mulps xmm0, xmm1
	movaps xmm4, xmmword ptr [rsp + 192]
	addps xmm4, xmm0
	movaps xmmword ptr [rsp + 192], xmm4
	movups xmm2, xmmword ptr [rax + 4*rdx]
	movaps xmmword ptr [rsp + 720], xmm2
	addps xmm6, xmm1
	mulps xmm1, xmmword ptr [rsp + 736]
	movups xmm13, xmmword ptr [rsi + 4*rdx]
	movaps xmm4, xmmword ptr [rsp + 448]
	addps xmm4, xmm1
	cmpltps xmm7, xmm9
	andps xmm7, xmm8
	mulps xmm7, xmm14
	mulps xmm10, xmm7
	movaps xmm0, xmmword ptr [rsp + 336]
	addps xmm0, xmm10
	movaps xmmword ptr [rsp + 336], xmm0
	mulps xmm7, xmmword ptr [rsp + 768]
	movaps xmm0, xmmword ptr [rsp + 32]
	addps xmm0, xmm7
	movaps xmmword ptr [rsp + 32], xmm0
	movaps xmm14, xmmword ptr [rsp + 416]
	subps xmm14, xmm2
	movaps xmm0, xmm14
	mulps xmm0, xmm14
	movaps xmm7, xmm12
	subps xmm7, xmm13
	movaps xmm10, xmm7
	mulps xmm10, xmm7
	addps xmm10, xmm0
	movaps xmm0, xmm9
	cmpleps xmm0, xmm10
	movaps xmm1, xmm10
	cmpltps xmm1, xmm15
	andps xmm1, xmm0
	xorps xmm0, xmm0
	cmpltps xmm0, xmm10
	andps xmm0, xmm8
	andps xmm0, xmm1
	movups xmm1, xmmword ptr [r8 + 4*rdx]
	mulps xmm0, xmm11
	movaps xmm2, xmm11
	mulps xmm1, xmm0
	movaps xmm12, xmmword ptr [rsp + 144]
	addps xmm12, xmm1
	movups xmm1, xmmword ptr [rdi + 4*rdx]
	mulps xmm1, xmm0
	movaps xmm15, xmmword ptr [rsp + 64]
	addps xmm15, xmm1
	movaps xmm1, xmm15
	mulps xmm13, xmm0
	movaps xmm15, xmm5
	addps xmm15, xmm13
	movaps xmm11, xmmword ptr [rsp + 128]
	addps xmm11, xmm0
	mulps xmm0, xmmword ptr [rsp + 720]
	movaps xmm5, xmmword ptr [rsp + 112]
	addps xmm5, xmm0
	cmpltps xmm10, xmm9
	andps xmm10, xmm8
	mulps xmm10, xmm2
	mulps xmm7, xmm10
	movaps xmm9, xmmword ptr [rsp + 96]
	addps xmm9, xmm7
	movaps xmm7, xmmword ptr [rsp + 464]
	mulps xmm10, xmm14
	addps xmm3, xmm10
	movaps xmm10, xmm3
	movaps xmm3, xmm12
	movaps xmm12, xmmword ptr [rsp + 752]
	jmp .LBB1952_60
.LBB1952_87:
	movaps xmm1, xmmword ptr [rsp + 208]
	ucomiss xmm1, xmm4
	jbe .LBB1952_91
	xorps xmm1, xmm1
	ucomiss xmm4, xmm1
	jbe .LBB1952_91
	movss xmm1, dword ptr [r8 + 4*r13 + 8]
	movss xmm4, dword ptr [r15 + 4*r11 + 8]
	unpcklps xmm1, xmm4
	movlhps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 80]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 80], xmm1
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movss dword ptr [rsp + 12], xmm0
.LBB1952_91:
	cmp r10d, 3
	je .LBB1952_85
	movss xmm0, dword ptr [rdi + 4*r14 + 12]
	movss xmm1, dword ptr [rsi + 4*rcx + 12]
	unpcklps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 256]
	subps xmm1, xmm0
	movaps xmm5, xmm1
	mulps xmm5, xmm1
	movaps xmm4, xmm5
	shufps xmm4, xmm5, 85
	addss xmm4, xmm5
	movaps xmm5, xmmword ptr [rsp + 224]
	ucomiss xmm5, xmm4
	jbe .LBB1952_93
	addps xmm9, xmm1
	movaps xmm0, xmm9
	shufps xmm0, xmm9, 17
	movaps xmmword ptr [rsp + 176], xmm0
	jmp .LBB1952_97
.LBB1952_93:
	movaps xmm1, xmmword ptr [rsp + 208]
	ucomiss xmm1, xmm4
	jbe .LBB1952_97
	xorps xmm1, xmm1
	ucomiss xmm4, xmm1
	jbe .LBB1952_97
	movss xmm1, dword ptr [r8 + 4*r13 + 12]
	movss xmm4, dword ptr [r15 + 4*r11 + 12]
	unpcklps xmm1, xmm4
	movlhps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 80]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 80], xmm1
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movss dword ptr [rsp + 12], xmm0
.LBB1952_97:
	cmp r10d, 4
	je .LBB1952_85
	movss xmm0, dword ptr [rdi + 4*r14 + 16]
	movss xmm1, dword ptr [rsi + 4*rcx + 16]
	unpcklps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 256]
	subps xmm1, xmm0
	movaps xmm5, xmm1
	mulps xmm5, xmm1
	movaps xmm4, xmm5
	shufps xmm4, xmm5, 85
	addss xmm4, xmm5
	movaps xmm5, xmmword ptr [rsp + 224]
	ucomiss xmm5, xmm4
	jbe .LBB1952_99
	addps xmm9, xmm1
	movaps xmm0, xmm9
	shufps xmm0, xmm9, 17
	movaps xmmword ptr [rsp + 176], xmm0
	jmp .LBB1952_103
.LBB1952_99:
	movaps xmm1, xmmword ptr [rsp + 208]
	ucomiss xmm1, xmm4
	jbe .LBB1952_103
	xorps xmm1, xmm1
	ucomiss xmm4, xmm1
	jbe .LBB1952_103
	movss xmm1, dword ptr [r8 + 4*r13 + 16]
	movss xmm4, dword ptr [r15 + 4*r11 + 16]
	unpcklps xmm1, xmm4
	movlhps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 80]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 80], xmm1
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movss dword ptr [rsp + 12], xmm0
.LBB1952_103:
	cmp r10d, 5
	je .LBB1952_85
	movss xmm0, dword ptr [rdi + 4*r14 + 20]
	movss xmm1, dword ptr [rsi + 4*rcx + 20]
	unpcklps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 256]
	subps xmm1, xmm0
	movaps xmm5, xmm1
	mulps xmm5, xmm1
	movaps xmm4, xmm5
	shufps xmm4, xmm5, 85
	addss xmm4, xmm5
	movaps xmm5, xmmword ptr [rsp + 224]
	ucomiss xmm5, xmm4
	jbe .LBB1952_105
	addps xmm9, xmm1
	movaps xmm0, xmm9
	shufps xmm0, xmm9, 17
	movaps xmmword ptr [rsp + 176], xmm0
	jmp .LBB1952_109
.LBB1952_105:
	movaps xmm1, xmmword ptr [rsp + 208]
	ucomiss xmm1, xmm4
	jbe .LBB1952_109
	xorps xmm1, xmm1
	ucomiss xmm4, xmm1
	jbe .LBB1952_109
	movss xmm1, dword ptr [r8 + 4*r13 + 20]
	movss xmm4, dword ptr [r15 + 4*r11 + 20]
	unpcklps xmm1, xmm4
	movlhps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 80]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 80], xmm1
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movss dword ptr [rsp + 12], xmm0
.LBB1952_109:
	cmp r10d, 6
	je .LBB1952_85
	movss xmm0, dword ptr [rdi + 4*r14 + 24]
	movss xmm1, dword ptr [rsi + 4*rcx + 24]
	unpcklps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 256]
	subps xmm1, xmm0
	movaps xmm5, xmm1
	mulps xmm5, xmm1
	movaps xmm4, xmm5
	shufps xmm4, xmm5, 85
	addss xmm4, xmm5
	movaps xmm5, xmmword ptr [rsp + 224]
	ucomiss xmm5, xmm4
	jbe .LBB1952_111
	addps xmm9, xmm1
	shufps xmm9, xmm9, 17
	movaps xmmword ptr [rsp + 176], xmm9
	.p2align	4
.LBB1952_85:
	movaps xmm9, xmmword ptr [rsp + 96]
	movaps xmm4, xmm13
.LBB1952_71:
	movaps xmm1, xmmword ptr [rsp + 64]
	mov r9, qword ptr [rsp + 16]
	movaps xmm5, xmmword ptr [rsp + 112]
.LBB1952_60:
	mov rdi, qword ptr [rsp + 24]
	cmp r9, qword ptr [rsp + 608]
	lea r13, [r9 + 1]
	jne .LBB1952_43
	jmp .LBB1952_62
.LBB1952_111:
	movaps xmm1, xmmword ptr [rsp + 208]
	ucomiss xmm1, xmm4
	movaps xmm9, xmmword ptr [rsp + 96]
	movaps xmm5, xmmword ptr [rsp + 112]
	mov rdi, qword ptr [rsp + 24]
	jbe .LBB1952_112
	xorps xmm1, xmm1
	ucomiss xmm4, xmm1
	jbe .LBB1952_112
	movss xmm1, dword ptr [r8 + 4*r13 + 24]
	movss xmm4, dword ptr [r15 + 4*r11 + 24]
	unpcklps xmm1, xmm4
	movlhps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 80]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 80], xmm1
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movss dword ptr [rsp + 12], xmm0
.LBB1952_112:
	movaps xmm4, xmm13
	movaps xmm1, xmmword ptr [rsp + 64]
	mov r9, qword ptr [rsp + 16]
	cmp r9, qword ptr [rsp + 608]
	lea r13, [r9 + 1]
	jne .LBB1952_43
.LBB1952_62:
	movaps xmm14, xmm12
	movaps xmm12, xmm5
	movaps xmm5, xmmword ptr [rsp + 80]
	movaps xmmword ptr [rsp + 304], xmm5
	movss xmm0, dword ptr [rsp + 12]
	movss dword ptr [rsp + 320], xmm0
	movaps xmm13, xmm11
	movaps xmm11, xmmword ptr [rsp + 176]
	movaps xmm0, xmm11
	shufps xmm0, xmm11, 85
	movss dword ptr [rsp + 324], xmm0
	movaps xmm0, xmm12
	unpcklps xmm0, xmm15
	movaps xmm2, xmm1
	unpcklps xmm1, xmm3
	movlhps xmm0, xmm1
	movaps xmm1, xmm15
	shufps xmm1, xmm12, 17
	movaps xmm8, xmm4
	movaps xmm4, xmm3
	shufps xmm4, xmm2, 17
	shufps xmm1, xmm4, 34
	addps xmm1, xmm0
	movaps xmm0, xmm12
	unpckhps xmm0, xmm15
	movaps xmm4, xmm3
	unpckhpd xmm4, xmm2
	shufps xmm0, xmm4, 36
	addps xmm0, xmm1
	shufps xmm15, xmm12, 51
	shufps xmm3, xmm2, 255
	shufps xmm15, xmm3, 34
	addps xmm15, xmm0
	movaps xmm0, xmm8
	movaps xmm3, xmmword ptr [rsp + 192]
	unpcklps xmm0, xmm3
	movaps xmm1, xmm7
	movlhps xmm1, xmm14
	shufps xmm0, xmm1, 36
	addps xmm0, xmm15
	movaps xmm1, xmm3
	shufps xmm1, xmm8, 17
	movaps xmm2, xmm7
	shufps xmm2, xmm14, 85
	shufps xmm1, xmm2, 34
	addps xmm1, xmm0
	movaps xmm0, xmm8
	unpckhps xmm0, xmm3
	movaps xmm2, xmm7
	unpckhpd xmm2, xmm14
	shufps xmm0, xmm2, 36
	addps xmm0, xmm1
	shufps xmm3, xmm8, 51
	shufps xmm7, xmm14, 255
	shufps xmm3, xmm7, 34
	addps xmm3, xmm0
	movaps xmm0, xmm13
	unpcklps xmm0, xmm10
	movaps xmm1, xmm10
	shufps xmm1, xmm13, 17
	shufps xmm1, xmm13, 226
	addps xmm1, xmm0
	movaps xmm0, xmm13
	unpckhps xmm0, xmm10
	addps xmm0, xmm1
	shufps xmm10, xmm13, 255
	shufps xmm10, xmm13, 226
	addps xmm10, xmm0
	movaps xmm0, xmm6
	movaps xmm2, xmmword ptr [rsp + 32]
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
	movss dword ptr [rsp + 328], xmm11
	addps xmm2, xmm0
	movsd xmm0, qword ptr [rsp + 320]
	addps xmm0, xmm2
	addps xmm3, xmm5
	movaps xmm1, xmm9
	shufps xmm1, xmm9, 85
	addss xmm1, xmm9
	movaps xmm2, xmm9
	unpckhpd xmm2, xmm9
	addss xmm2, xmm1
	shufps xmm9, xmm9, 255
	addss xmm9, xmm2
	movaps xmm8, xmmword ptr [rsp + 336]
	addss xmm9, xmm8
	movaps xmm1, xmm8
	shufps xmm1, xmm8, 85
	addss xmm1, xmm9
	movaps xmm2, xmm8
	unpckhpd xmm2, xmm8
	addss xmm2, xmm1
	shufps xmm8, xmm8, 255
	addss xmm8, xmm2
	addss xmm8, xmm11
.LBB1952_63:
	movapd xmmword ptr [rsp + 304], xmm3
	movlps qword ptr [rsp + 320], xmm0
	movss dword ptr [rsp + 328], xmm8
	lea rdi, [rsp + 272]
	mov rsi, qword ptr [rsp + 552]
	movss xmm0, dword ptr [rsp + 252]
	movss xmm1, dword ptr [rsp + 172]
	lea rdx, [rsp + 624]
	lea rcx, [rsp + 432]
	lea r8, [rsp + 304]
	call swarm::rules::finish
	mov rsi, qword ptr [rsp + 560]
	cmp rsi, qword ptr [rsp + 536]
	jae .LBB1952_65
	movss xmm0, dword ptr [rsp + 272]
	movss xmm1, dword ptr [rsp + 276]
	movss xmm2, dword ptr [rsp + 280]
	movss xmm3, dword ptr [rsp + 284]
	mov rax, qword ptr [rsp + 528]
	movss dword ptr [rax + 4*rsi], xmm0
	mov rax, qword ptr [rsp + 520]
	movss dword ptr [rax + 4*rsi], xmm1
	mov rax, qword ptr [rsp + 512]
	movss dword ptr [rax + 4*rsi], xmm2
	mov rax, qword ptr [rsp + 504]
	movss dword ptr [rax + 4*rsi], xmm3
	jmp .LBB1952_65
.LBB1952_67:
	add rsp, 792
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
