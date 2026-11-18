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
	sub rsp, 664
	.cfi_def_cfa_offset 720
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r13, rdi
	lea rax, [rdi + 316]
	mov qword ptr [rsp + 400], rax
	movss xmm4, dword ptr [rdi + 288]
	movss xmm6, dword ptr [rdi + 292]
	movss dword ptr [rsp + 188], xmm6
	mov eax, dword ptr [rdi + 312]
	mov dword ptr [rsp + 536], eax
	mov rax, qword ptr [rdi + 304]
	mov qword ptr [rsp + 528], rax
	movss xmm5, dword ptr [rdi + 316]
	mov rax, qword ptr [rdi + 8]
	mov qword ptr [rsp + 16], rax
	mov rbp, qword ptr [rdi + 16]
	mov rax, qword ptr [rdi + 32]
	mov qword ptr [rsp + 32], rax
	mov rax, qword ptr [rdi + 40]
	mov qword ptr [rsp + 256], rax
	movss xmm0, dword ptr [rip + .LCPI1952_0]
	movaps xmm1, xmm4
	mulss xmm1, xmm0
	movaps xmm2, xmm5
	maxss xmm2, xmm1
	cmpunordss xmm1, xmm1
	movaps xmm3, xmm1
	andnps xmm3, xmm2
	movaps xmmword ptr [rsp + 192], xmm5
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
	movss dword ptr [rsp + 240], xmm1
	movss dword ptr [rdi + 280], xmm1
	movss dword ptr [rsp + 236], xmm4
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
	movss xmm0, dword ptr [rsp + 240]
	mulss xmm0, dword ptr [rsp + 188]
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
	mov rcx, qword ptr [rsp + 32]
	mov r8, qword ptr [rsp + 256]
	call <swarm::grid::Grid>::fill
	mov rsi, r13
	mov r12, qword ptr [r13 + 248]
	mov rax, qword ptr [r13 + 256]
	mov rbp, qword ptr [r13 + 8]
	mov r14, qword ptr [r13 + 16]
	mov qword ptr [r13 + 112], 0
	lea rbx, [r12 + 4*rax]
	lea rax, [r13 + 96]
	mov qword ptr [rsp + 32], rax
	mov r13, r12
	mov qword ptr [rsp + 152], rsi
	jmp .LBB1952_1
.LBB1952_8:
	mov rax, qword ptr [rsi + 104]
	movss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rsi + 112], r15
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
	cmp r15, qword ptr [rsi + 96]
	jne .LBB1952_8
	mov edx, 1
	mov rdi, qword ptr [rsp + 32]
	mov rsi, r15
	movss dword ptr [rsp + 16], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 16]
	mov rsi, qword ptr [rsp + 152]
	jmp .LBB1952_8
.LBB1952_9:
	mov r13, qword ptr [rsi + 32]
	mov r15, qword ptr [rsi + 40]
	mov qword ptr [rsi + 136], 0
	xor r14d, r14d
	lea rax, [rsi + 120]
	mov qword ptr [rsp + 32], rax
	mov rbp, r12
	jmp .LBB1952_10
.LBB1952_17:
	mov rax, qword ptr [rsi + 128]
	movss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rsi + 136], r14
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
	cmp r14, qword ptr [rsi + 120]
	jne .LBB1952_17
	mov edx, 1
	mov rdi, qword ptr [rsp + 32]
	mov rsi, r14
	movss dword ptr [rsp + 16], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 16]
	mov rsi, qword ptr [rsp + 152]
	jmp .LBB1952_17
.LBB1952_18:
	mov r13, qword ptr [rsi + 56]
	mov r15, qword ptr [rsi + 64]
	mov qword ptr [rsi + 160], 0
	xor r14d, r14d
	lea rax, [rsi + 144]
	mov qword ptr [rsp + 32], rax
	mov rbp, r12
	jmp .LBB1952_19
.LBB1952_26:
	mov rax, qword ptr [rsi + 152]
	movss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rsi + 160], r14
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
	cmp r14, qword ptr [rsi + 144]
	jne .LBB1952_26
	mov edx, 1
	mov rdi, qword ptr [rsp + 32]
	mov rsi, r14
	movss dword ptr [rsp + 16], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 16]
	mov rsi, qword ptr [rsp + 152]
	jmp .LBB1952_26
.LBB1952_27:
	mov r13, qword ptr [rsi + 80]
	mov r15, qword ptr [rsi + 88]
	mov qword ptr [rsi + 184], 0
	xor r14d, r14d
	lea rbp, [rsi + 168]
	jmp .LBB1952_28
.LBB1952_35:
	mov rax, qword ptr [rsi + 176]
	movss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rsi + 184], r14
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
	cmp r14, qword ptr [rsi + 168]
	jne .LBB1952_35
	mov edx, 1
	mov rdi, rbp
	mov rsi, r14
	movss dword ptr [rsp + 16], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 16]
	mov rsi, qword ptr [rsp + 152]
	jmp .LBB1952_35
.LBB1952_36:
	movups xmm0, xmmword ptr [rsi + 96]
	mov rax, qword ptr [rsi + 8]
	mov qword ptr [rsp + 376], rax
	movups xmm1, xmmword ptr [rsi]
	movups xmmword ptr [rsi], xmm0
	movups xmmword ptr [rsi + 96], xmm1
	movups xmm0, xmmword ptr [rsi + 112]
	mov rdi, qword ptr [rsi + 112]
	movups xmm1, xmmword ptr [rsi + 16]
	mov r8, qword ptr [rsi + 16]
	movups xmmword ptr [rsi + 16], xmm0
	movups xmmword ptr [rsi + 112], xmm1
	mov rax, qword ptr [rsi + 32]
	movups xmm0, xmmword ptr [rsi + 128]
	mov qword ptr [rsp + 368], rax
	mov qword ptr [rsi + 128], rax
	mov rcx, qword ptr [rsi + 56]
	movups xmm1, xmmword ptr [rsi + 144]
	movupd xmm2, xmmword ptr [rsi + 40]
	mov rax, qword ptr [rsi + 40]
	movups xmmword ptr [rsi + 32], xmm0
	movupd xmmword ptr [rsi + 136], xmm2
	movups xmmword ptr [rsi + 48], xmm1
	mov qword ptr [rsp + 360], rcx
	mov qword ptr [rsi + 152], rcx
	movups xmm0, xmmword ptr [rsi + 64]
	movups xmm1, xmmword ptr [rsi + 160]
	mov rdx, qword ptr [rsi + 64]
	movups xmmword ptr [rsi + 64], xmm1
	movups xmmword ptr [rsi + 160], xmm0
	mov r9, qword ptr [rsi + 80]
	mov rcx, qword ptr [rsi + 176]
	mov qword ptr [rsi + 80], rcx
	mov qword ptr [rsp + 352], r9
	mov qword ptr [rsi + 176], r9
	mov rcx, qword ptr [rsi + 88]
	mov qword ptr [rsi + 88], r14
	mov qword ptr [rsi + 184], rcx
	test rdi, rdi
	je .LBB1952_103
	movss xmm1, dword ptr [rsi + 320]
	cmp rax, r8
	cmovb r8, rax
	mulss xmm1, xmm1
	cmp rdx, r8
	cmovb r8, rdx
	movaps xmm0, xmmword ptr [rsp + 192]
	mulss xmm0, xmm0
	movaps xmmword ptr [rsp + 192], xmm0
	shufps xmm0, xmm0, 0
	movaps xmmword ptr [rsp + 208], xmm1
	shufps xmm1, xmm1, 0
	cmp rcx, r8
	cmovb r8, rcx
	mov qword ptr [rsp + 384], r8
	xor edx, edx
	mov qword ptr [rsp + 392], rdi
	movaps xmmword ptr [rsp + 624], xmm0
	movaps xmmword ptr [rsp + 608], xmm1
	jmp .LBB1952_38
.LBB1952_101:
	mov rsi, qword ptr [rsp + 152]
	mov rdi, qword ptr [rsp + 392]
	.p2align	4
.LBB1952_102:
	inc rdx
	cmp rdx, rdi
	je .LBB1952_103
.LBB1952_38:
	mov rax, qword ptr [rsi + 16]
	mov qword ptr [rsp + 520], rax
	cmp rdx, rax
	jae .LBB1952_102
	mov rax, qword ptr [rsi + 40]
	mov qword ptr [rsp + 512], rax
	cmp rdx, rax
	jae .LBB1952_102
	mov rax, qword ptr [rsi + 64]
	mov rcx, qword ptr [rsi + 88]
	mov qword ptr [rsp + 504], rax
	cmp rdx, rax
	setb al
	mov qword ptr [rsp + 496], rcx
	cmp rdx, rcx
	setb cl
	and cl, al
	cmp cl, 1
	jne .LBB1952_102
	mov rax, qword ptr [rsi + 8]
	mov qword ptr [rsp + 488], rax
	movss xmm2, dword ptr [rax + 4*rdx]
	mov rax, qword ptr [rsi + 32]
	mov rcx, qword ptr [rsi + 56]
	mov qword ptr [rsp + 480], rax
	movss xmm3, dword ptr [rax + 4*rdx]
	movaps xmmword ptr [rsp + 304], xmm3
	mov rax, qword ptr [rsi + 80]
	mov qword ptr [rsp + 472], rcx
	movss xmm0, dword ptr [rcx + 4*rdx]
	mov qword ptr [rsp + 408], rdx
	mov qword ptr [rsp + 464], rax
	movss xmm1, dword ptr [rax + 4*rdx]
	movss dword ptr [rsp + 272], xmm2
	movss dword ptr [rsp + 276], xmm3
	movss dword ptr [rsp + 280], xmm0
	movss dword ptr [rsp + 284], xmm1
	mov r15, qword ptr [rsi + 264]
	mov r14, qword ptr [rsi + 272]
	movss xmm1, dword ptr [rsi + 280]
	movss dword ptr [rsp + 16], xmm1
	movaps xmmword ptr [rsp + 544], xmm2
	movaps xmm0, xmm2
	mulss xmm0, xmm1
	xorps xmm1, xmm1
	maxss xmm0, xmm1
	mov r12, qword ptr [rip + floorf@GOTPCREL]
	call r12
	xorps xmm1, xmm1
	cvtss2sd xmm1, xmm0
	cvttsd2si rax, xmm1
	mov rcx, rax
	sar rcx, 63
	movapd xmm2, xmm1
	movsd xmm3, qword ptr [rip + .LCPI1952_3]
	subsd xmm2, xmm3
	cvttsd2si rbp, xmm2
	and rbp, rcx
	or rbp, rax
	xorpd xmm2, xmm2
	ucomisd xmm1, xmm2
	mov ebx, 0
	cmovb rbp, rbx
	movsd xmm2, qword ptr [rip + .LCPI1952_4]
	ucomisd xmm1, xmm2
	mov r13, -1
	cmova rbp, r13
	mov qword ptr [rsp + 456], r15
	sub r15, 1
	cmovb r15, rbx
	cmp r15, rbp
	cmovb rbp, r15
	movss xmm1, dword ptr [rip + .LCPI1952_5]
	ucomiss xmm0, xmm1
	cmovae rbp, rbx
	movss xmm1, dword ptr [rsp + 16]
	mulss xmm1, dword ptr [rsp + 304]
	xorps xmm0, xmm0
	maxss xmm1, xmm0
	movaps xmm0, xmm1
	call r12
	xorps xmm1, xmm1
	cvtss2sd xmm1, xmm0
	cvttsd2si rcx, xmm1
	mov rdx, rcx
	sar rdx, 63
	movapd xmm2, xmm1
	subsd xmm2, qword ptr [rip + .LCPI1952_3]
	cvttsd2si rsi, xmm2
	and rsi, rdx
	or rsi, rcx
	xorpd xmm2, xmm2
	ucomisd xmm1, xmm2
	cmovb rsi, rbx
	ucomisd xmm1, qword ptr [rip + .LCPI1952_4]
	xorps xmm1, xmm1
	cmova rsi, r13
	sub r14, 1
	cmovb r14, rbx
	cmp r14, rsi
	cmovb rsi, r14
	ucomiss xmm0, dword ptr [rip + .LCPI1952_5]
	cmovae rsi, rbx
	mov rcx, rbp
	sub rcx, 1
	cmovb rcx, rbx
	mov qword ptr [rsp + 440], rcx
	mov rdx, rsi
	sub rdx, 1
	cmovb rdx, rbx
	inc rsi
	cmp r14, rsi
	cmovb rsi, r14
	xorpd xmm2, xmm2
	xorpd xmm3, xmm3
	mov qword ptr [rsp + 448], rsi
	cmp rdx, rsi
	ja .LBB1952_99
	mov rax, rbp
	inc rax
	cmp r15, rax
	cmovb rax, r15
	inc rax
	mov qword ptr [rsp + 424], rax
	mov rcx, qword ptr [rsp + 152]
	mov rax, qword ptr [rcx + 200]
	mov qword ptr [rsp + 416], rax
	mov rdi, qword ptr [rcx + 208]
	movaps xmm0, xmmword ptr [rsp + 304]
	shufps xmm0, xmm0, 0
	movaps xmmword ptr [rsp + 640], xmm0
	movaps xmm0, xmmword ptr [rsp + 544]
	shufps xmm0, xmm0, 0
	movaps xmmword ptr [rsp + 560], xmm0
	xorps xmm7, xmm7
	xorps xmm0, xmm0
	movss dword ptr [rsp + 12], xmm0
	xorps xmm9, xmm9
	xorps xmm11, xmm11
	xorps xmm13, xmm13
	xorps xmm12, xmm12
	xorps xmm4, xmm4
	xorps xmm8, xmm8
	xorps xmm5, xmm5
	xorps xmm6, xmm6
	xorps xmm1, xmm1
	xorps xmm14, xmm14
	xorps xmm0, xmm0
	movaps xmmword ptr [rsp + 32], xmm0
	xorps xmm0, xmm0
	movaps xmmword ptr [rsp + 80], xmm0
	movaps xmmword ptr [rsp + 48], xmm0
	xorps xmm0, xmm0
	movaps xmmword ptr [rsp + 64], xmm0
	mov qword ptr [rsp + 432], rdi
	.p2align	4
.LBB1952_44:
	mov rcx, qword ptr [rsp + 456]
	imul rcx, rdx
	mov rax, qword ptr [rsp + 440]
	lea r8, [rcx + rax]
	cmp r8, rdi
	jae .LBB1952_45
	add rcx, qword ptr [rsp + 424]
	mov ebx, 0
	mov esi, 0
	cmp rcx, rdi
	jae .LBB1952_48
	mov rax, qword ptr [rsp + 416]
	mov esi, dword ptr [rax + 4*r8]
	mov ebx, dword ptr [rax + 4*rcx]
	jmp .LBB1952_48
	.p2align	4
.LBB1952_45:
	xor ebx, ebx
	xor esi, esi
.LBB1952_48:
	movaps xmm0, xmm1
	mov r8, rbx
	sub r8, rsi
	setb r15b
	cmp rbx, qword ptr [rsp + 520]
	seta cl
	or cl, r15b
	mov rax, qword ptr [rsp + 488]
	lea r9, [rax + 4*rsi]
	mov r13, r8
	mov eax, 0
	cmovne r13, rax
	mov ebp, 4
	cmovne r9, rbp
	cmp rbx, qword ptr [rsp + 512]
	seta cl
	or cl, r15b
	mov rcx, r8
	cmovne rcx, rax
	mov rdi, qword ptr [rsp + 480]
	lea r14, [rdi + 4*rsi]
	cmovne r14, rbp
	mov r12, rcx
	shr r12, 3
	cmp rbx, qword ptr [rsp + 504]
	seta r10b
	or r10b, r15b
	mov rdi, qword ptr [rsp + 472]
	lea r10, [rdi + 4*rsi]
	mov rdi, r8
	cmovne rdi, rax
	cmovne r10, rbp
	mov r11, rdi
	shr r11, 3
	cmp rbx, qword ptr [rsp + 496]
	seta bl
	or bl, r15b
	mov rbx, qword ptr [rsp + 464]
	lea r15, [rbx + 4*rsi]
	cmovne r8, rax
	cmovne r15, rbp
	mov rbx, r8
	shr rbx, 3
	mov rsi, r13
	shr rsi, 3
	cmp r12, rsi
	cmovb rsi, r12
	cmp r11, rsi
	cmovb rsi, r11
	cmp rbx, rsi
	cmovb rsi, rbx
	test rsi, rsi
	movaps xmmword ptr [rsp + 256], xmm9
	movaps xmmword ptr [rsp + 240], xmm4
	movaps xmmword ptr [rsp + 336], xmm11
	movaps xmmword ptr [rsp + 320], xmm13
	je .LBB1952_49
	shl rsi, 5
	xor r12d, r12d
	movaps xmm13, xmm0
	movapd xmm15, xmm3
	movapd xmm11, xmm2
	movaps xmm9, xmmword ptr [rsp + 32]
	.p2align	4
.LBB1952_51:
	movaps xmmword ptr [rsp + 32], xmm7
	movaps xmmword ptr [rsp + 16], xmm6
	movaps xmmword ptr [rsp + 112], xmm14
	movaps xmmword ptr [rsp + 160], xmm5
	movaps xmmword ptr [rsp + 128], xmm12
	movaps xmmword ptr [rsp + 96], xmm8
	movups xmm0, xmmword ptr [r9 + r12]
	movaps xmm5, xmmword ptr [rsp + 560]
	subps xmm5, xmm0
	movups xmm3, xmmword ptr [r14 + r12]
	movaps xmm12, xmmword ptr [rsp + 640]
	movaps xmm7, xmm12
	subps xmm7, xmm3
	movaps xmm2, xmm5
	mulps xmm2, xmm5
	movaps xmm6, xmm7
	mulps xmm6, xmm7
	addps xmm6, xmm2
	movaps xmm8, xmm6
	movaps xmm1, xmmword ptr [rsp + 608]
	movaps xmm2, xmm1
	cmpleps xmm2, xmm6
	xorps xmm4, xmm4
	cmpltps xmm4, xmm6
	movaps xmm14, xmmword ptr [rsp + 624]
	cmpltps xmm6, xmm14
	andps xmm6, xmm2
	movups xmm10, xmmword ptr [r9 + r12 + 16]
	movaps xmm2, xmm9
	movaps xmm9, xmmword ptr [rip + .LCPI1952_6]
	andps xmm4, xmm9
	andps xmm4, xmm6
	movups xmm6, xmmword ptr [r14 + r12 + 16]
	cmpltps xmm8, xmm1
	andps xmm8, xmm9
	mulps xmm5, xmm8
	movapd xmm9, xmm11
	movapd xmm11, xmm15
	movaps xmm15, xmm13
	movaps xmm13, xmmword ptr [rsp + 320]
	addps xmm13, xmm5
	movaps xmmword ptr [rsp + 320], xmm13
	movaps xmm13, xmm15
	movapd xmm15, xmm11
	movapd xmm11, xmm9
	movaps xmm9, xmm2
	mulps xmm8, xmm7
	movaps xmm5, xmmword ptr [rsp + 256]
	addps xmm5, xmm8
	movaps xmmword ptr [rsp + 256], xmm5
	mulps xmm0, xmm4
	addps xmm9, xmm0
	mulps xmm3, xmm4
	addps xmm13, xmm3
	movups xmm0, xmmword ptr [r10 + r12]
	mulps xmm0, xmm4
	addps xmm11, xmm0
	movups xmm0, xmmword ptr [r15 + r12]
	mulps xmm0, xmm4
	addps xmm15, xmm0
	movaps xmm0, xmmword ptr [rsp + 240]
	addps xmm0, xmm4
	movaps xmmword ptr [rsp + 240], xmm0
	movaps xmm3, xmmword ptr [rsp + 560]
	subps xmm3, xmm10
	subps xmm12, xmm6
	movaps xmm0, xmm3
	mulps xmm0, xmm3
	movaps xmm5, xmm12
	mulps xmm5, xmm12
	addps xmm5, xmm0
	movaps xmm7, xmm5
	movaps xmm8, xmm1
	cmpleps xmm8, xmm5
	xorps xmm0, xmm0
	cmpltps xmm0, xmm5
	cmpltps xmm5, xmm14
	andps xmm5, xmm8
	movaps xmm2, xmmword ptr [rip + .LCPI1952_6]
	andps xmm0, xmm2
	andps xmm0, xmm5
	cmpltps xmm7, xmm1
	andps xmm7, xmm2
	mulps xmm3, xmm7
	movaps xmm5, xmmword ptr [rsp + 336]
	addps xmm5, xmm3
	movaps xmmword ptr [rsp + 336], xmm5
	mulps xmm7, xmm12
	movaps xmm14, xmmword ptr [rsp + 112]
	movaps xmm1, xmmword ptr [rsp + 32]
	addps xmm1, xmm7
	movaps xmmword ptr [rsp + 32], xmm1
	movaps xmm7, xmmword ptr [rsp + 32]
	movaps xmm12, xmmword ptr [rsp + 128]
	movaps xmm8, xmmword ptr [rsp + 96]
	mulps xmm10, xmm0
	addps xmm14, xmm10
	mulps xmm6, xmm0
	movaps xmm1, xmmword ptr [rsp + 16]
	addps xmm1, xmm6
	movaps xmmword ptr [rsp + 16], xmm1
	movaps xmm6, xmmword ptr [rsp + 16]
	movaps xmm5, xmmword ptr [rsp + 160]
	movups xmm2, xmmword ptr [r10 + r12 + 16]
	mulps xmm2, xmm0
	addps xmm5, xmm2
	movups xmm2, xmmword ptr [r15 + r12 + 16]
	mulps xmm2, xmm0
	addps xmm8, xmm2
	addps xmm12, xmm0
	add r12, 32
	cmp rsi, r12
	jne .LBB1952_51
	jmp .LBB1952_52
	.p2align	4
.LBB1952_49:
	movaps xmm13, xmm0
	movapd xmm15, xmm3
	movapd xmm11, xmm2
	movaps xmm9, xmmword ptr [rsp + 32]
.LBB1952_52:
	movaps xmmword ptr [rsp + 32], xmm9
	movaps xmmword ptr [rsp + 96], xmm11
	movaps xmmword ptr [rsp + 112], xmm15
	movaps xmmword ptr [rsp + 128], xmm13
	movaps xmm1, xmmword ptr [rsp + 240]
	movaps xmm13, xmmword ptr [rsp + 320]
	movaps xmm11, xmmword ptr [rsp + 336]
	movaps xmm9, xmmword ptr [rsp + 256]
	mov r11d, ecx
	and r11d, 7
	mov ebx, edi
	and ebx, 7
	mov r12d, r8d
	and r12d, 7
	mov esi, r13d
	and esi, 7
	cmp r11, rsi
	cmovb rsi, r11
	cmp rbx, rsi
	cmovb rsi, rbx
	cmp r12, rsi
	cmovb rsi, r12
	test rsi, rsi
	je .LBB1952_53
	movaps xmmword ptr [rsp + 160], xmm5
	movaps xmmword ptr [rsp + 16], xmm6
	and r13d, -8
	and ecx, -8
	and edi, -8
	and r8d, -8
	movss xmm0, dword ptr [r9 + 4*r13]
	movss xmm2, dword ptr [r14 + 4*rcx]
	movaps xmm15, xmmword ptr [rsp + 544]
	movaps xmm3, xmm15
	subss xmm3, xmm0
	movaps xmm10, xmmword ptr [rsp + 304]
	movaps xmm4, xmm10
	subss xmm4, xmm2
	movaps xmm6, xmm3
	mulss xmm6, xmm3
	movaps xmm5, xmm4
	mulss xmm5, xmm4
	addss xmm5, xmm6
	movaps xmm6, xmmword ptr [rsp + 208]
	ucomiss xmm6, xmm5
	jbe .LBB1952_56
	movaps xmm0, xmmword ptr [rsp + 80]
	addss xmm0, xmm3
	movaps xmmword ptr [rsp + 80], xmm0
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, xmm4
	movss dword ptr [rsp + 12], xmm0
	jmp .LBB1952_59
	.p2align	4
.LBB1952_56:
	movaps xmm3, xmmword ptr [rsp + 192]
	ucomiss xmm3, xmm5
	jbe .LBB1952_59
	xorps xmm3, xmm3
	ucomiss xmm5, xmm3
	jbe .LBB1952_59
	movss xmm3, dword ptr [r10 + 4*rdi]
	movss xmm4, dword ptr [r15 + 4*r8]
	unpcklps xmm3, xmm4
	unpcklps xmm0, xmm2
	movlhps xmm0, xmm3
	movaps xmm2, xmmword ptr [rsp + 64]
	addps xmm2, xmm0
	movaps xmmword ptr [rsp + 64], xmm2
	movaps xmm0, xmmword ptr [rsp + 48]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movaps xmmword ptr [rsp + 48], xmm0
.LBB1952_59:
	cmp esi, 1
	je .LBB1952_60
	movss xmm0, dword ptr [r9 + 4*r13 + 4]
	movss xmm2, dword ptr [r14 + 4*rcx + 4]
	movaps xmm3, xmm15
	subss xmm3, xmm0
	movaps xmm4, xmm10
	subss xmm4, xmm2
	movaps xmm6, xmm3
	mulss xmm6, xmm3
	movaps xmm5, xmm4
	mulss xmm5, xmm4
	addss xmm5, xmm6
	movaps xmm6, xmmword ptr [rsp + 208]
	ucomiss xmm6, xmm5
	jbe .LBB1952_62
	movaps xmm0, xmmword ptr [rsp + 80]
	addss xmm0, xmm3
	movaps xmmword ptr [rsp + 80], xmm0
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, xmm4
	movss dword ptr [rsp + 12], xmm0
	jmp .LBB1952_66
.LBB1952_62:
	movaps xmm3, xmmword ptr [rsp + 192]
	ucomiss xmm3, xmm5
	jbe .LBB1952_66
	xorps xmm3, xmm3
	ucomiss xmm5, xmm3
	jbe .LBB1952_66
	movss xmm3, dword ptr [r10 + 4*rdi + 4]
	movss xmm4, dword ptr [r15 + 4*r8 + 4]
	unpcklps xmm3, xmm4
	unpcklps xmm0, xmm2
	movlhps xmm0, xmm3
	movaps xmm2, xmmword ptr [rsp + 64]
	addps xmm2, xmm0
	movaps xmmword ptr [rsp + 64], xmm2
	movaps xmm0, xmmword ptr [rsp + 48]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movaps xmmword ptr [rsp + 48], xmm0
.LBB1952_66:
	cmp esi, 2
	je .LBB1952_60
	movss xmm0, dword ptr [r9 + 4*r13 + 8]
	movss xmm2, dword ptr [r14 + 4*rcx + 8]
	movaps xmm3, xmm15
	subss xmm3, xmm0
	movaps xmm4, xmm10
	subss xmm4, xmm2
	movaps xmm6, xmm3
	mulss xmm6, xmm3
	movaps xmm5, xmm4
	mulss xmm5, xmm4
	addss xmm5, xmm6
	movaps xmm6, xmmword ptr [rsp + 208]
	ucomiss xmm6, xmm5
	jbe .LBB1952_68
	movaps xmm0, xmmword ptr [rsp + 80]
	addss xmm0, xmm3
	movaps xmmword ptr [rsp + 80], xmm0
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, xmm4
	movss dword ptr [rsp + 12], xmm0
	jmp .LBB1952_72
.LBB1952_68:
	movaps xmm3, xmmword ptr [rsp + 192]
	ucomiss xmm3, xmm5
	jbe .LBB1952_72
	xorps xmm3, xmm3
	ucomiss xmm5, xmm3
	jbe .LBB1952_72
	movss xmm3, dword ptr [r10 + 4*rdi + 8]
	movss xmm4, dword ptr [r15 + 4*r8 + 8]
	unpcklps xmm3, xmm4
	unpcklps xmm0, xmm2
	movlhps xmm0, xmm3
	movaps xmm2, xmmword ptr [rsp + 64]
	addps xmm2, xmm0
	movaps xmmword ptr [rsp + 64], xmm2
	movaps xmm0, xmmword ptr [rsp + 48]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movaps xmmword ptr [rsp + 48], xmm0
.LBB1952_72:
	cmp esi, 3
	je .LBB1952_60
	movss xmm0, dword ptr [r9 + 4*r13 + 12]
	movss xmm2, dword ptr [r14 + 4*rcx + 12]
	movaps xmm3, xmm15
	subss xmm3, xmm0
	movaps xmm4, xmm10
	subss xmm4, xmm2
	movaps xmm6, xmm3
	mulss xmm6, xmm3
	movaps xmm5, xmm4
	mulss xmm5, xmm4
	addss xmm5, xmm6
	movaps xmm6, xmmword ptr [rsp + 208]
	ucomiss xmm6, xmm5
	jbe .LBB1952_74
	movaps xmm0, xmmword ptr [rsp + 80]
	addss xmm0, xmm3
	movaps xmmword ptr [rsp + 80], xmm0
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, xmm4
	movss dword ptr [rsp + 12], xmm0
	jmp .LBB1952_78
.LBB1952_74:
	movaps xmm3, xmmword ptr [rsp + 192]
	ucomiss xmm3, xmm5
	jbe .LBB1952_78
	xorps xmm3, xmm3
	ucomiss xmm5, xmm3
	jbe .LBB1952_78
	movss xmm3, dword ptr [r10 + 4*rdi + 12]
	movss xmm4, dword ptr [r15 + 4*r8 + 12]
	unpcklps xmm3, xmm4
	unpcklps xmm0, xmm2
	movlhps xmm0, xmm3
	movaps xmm2, xmmword ptr [rsp + 64]
	addps xmm2, xmm0
	movaps xmmword ptr [rsp + 64], xmm2
	movaps xmm0, xmmword ptr [rsp + 48]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movaps xmmword ptr [rsp + 48], xmm0
.LBB1952_78:
	cmp esi, 4
	je .LBB1952_60
	movss xmm0, dword ptr [r9 + 4*r13 + 16]
	movss xmm2, dword ptr [r14 + 4*rcx + 16]
	movaps xmm3, xmm15
	subss xmm3, xmm0
	movaps xmm4, xmm10
	subss xmm4, xmm2
	movaps xmm6, xmm3
	mulss xmm6, xmm3
	movaps xmm5, xmm4
	mulss xmm5, xmm4
	addss xmm5, xmm6
	movaps xmm6, xmmword ptr [rsp + 208]
	ucomiss xmm6, xmm5
	jbe .LBB1952_80
	movaps xmm0, xmmword ptr [rsp + 80]
	addss xmm0, xmm3
	movaps xmmword ptr [rsp + 80], xmm0
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, xmm4
	movss dword ptr [rsp + 12], xmm0
	jmp .LBB1952_84
.LBB1952_80:
	movaps xmm3, xmmword ptr [rsp + 192]
	ucomiss xmm3, xmm5
	jbe .LBB1952_84
	xorps xmm3, xmm3
	ucomiss xmm5, xmm3
	jbe .LBB1952_84
	movss xmm3, dword ptr [r10 + 4*rdi + 16]
	movss xmm4, dword ptr [r15 + 4*r8 + 16]
	unpcklps xmm3, xmm4
	unpcklps xmm0, xmm2
	movlhps xmm0, xmm3
	movaps xmm2, xmmword ptr [rsp + 64]
	addps xmm2, xmm0
	movaps xmmword ptr [rsp + 64], xmm2
	movaps xmm0, xmmword ptr [rsp + 48]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movaps xmmword ptr [rsp + 48], xmm0
.LBB1952_84:
	cmp esi, 5
	je .LBB1952_60
	movss xmm0, dword ptr [r9 + 4*r13 + 20]
	movss xmm2, dword ptr [r14 + 4*rcx + 20]
	movaps xmm3, xmm15
	subss xmm3, xmm0
	movaps xmm4, xmm10
	subss xmm4, xmm2
	movaps xmm6, xmm3
	mulss xmm6, xmm3
	movaps xmm5, xmm4
	mulss xmm5, xmm4
	addss xmm5, xmm6
	movaps xmm6, xmmword ptr [rsp + 208]
	ucomiss xmm6, xmm5
	jbe .LBB1952_86
	movaps xmm0, xmmword ptr [rsp + 80]
	addss xmm0, xmm3
	movaps xmmword ptr [rsp + 80], xmm0
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, xmm4
	movss dword ptr [rsp + 12], xmm0
	jmp .LBB1952_90
.LBB1952_86:
	movaps xmm3, xmmword ptr [rsp + 192]
	ucomiss xmm3, xmm5
	jbe .LBB1952_90
	xorps xmm3, xmm3
	ucomiss xmm5, xmm3
	jbe .LBB1952_90
	movss xmm3, dword ptr [r10 + 4*rdi + 20]
	movss xmm4, dword ptr [r15 + 4*r8 + 20]
	unpcklps xmm3, xmm4
	unpcklps xmm0, xmm2
	movlhps xmm0, xmm3
	movaps xmm2, xmmword ptr [rsp + 64]
	addps xmm2, xmm0
	movaps xmmword ptr [rsp + 64], xmm2
	movaps xmm0, xmmword ptr [rsp + 48]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movaps xmmword ptr [rsp + 48], xmm0
.LBB1952_90:
	cmp esi, 6
	je .LBB1952_60
	movss xmm0, dword ptr [r9 + 4*r13 + 24]
	movss xmm2, dword ptr [r14 + 4*rcx + 24]
	movaps xmm3, xmm15
	subss xmm3, xmm0
	movaps xmm4, xmm10
	subss xmm4, xmm2
	movaps xmm6, xmm3
	mulss xmm6, xmm3
	movaps xmm5, xmm4
	mulss xmm5, xmm4
	addss xmm5, xmm6
	movaps xmm6, xmmword ptr [rsp + 208]
	ucomiss xmm6, xmm5
	jbe .LBB1952_92
	movaps xmm0, xmmword ptr [rsp + 80]
	addss xmm0, xmm3
	movaps xmmword ptr [rsp + 80], xmm0
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, xmm4
	movss dword ptr [rsp + 12], xmm0
	.p2align	4
.LBB1952_60:
	movaps xmm4, xmm1
	movaps xmm6, xmmword ptr [rsp + 16]
	movaps xmm5, xmmword ptr [rsp + 160]
	jmp .LBB1952_54
.LBB1952_92:
	movaps xmm3, xmmword ptr [rsp + 192]
	ucomiss xmm3, xmm5
	movaps xmm6, xmmword ptr [rsp + 16]
	jbe .LBB1952_93
	xorps xmm3, xmm3
	ucomiss xmm5, xmm3
	movaps xmm5, xmmword ptr [rsp + 160]
	jbe .LBB1952_53
	movss xmm3, dword ptr [r10 + 4*rdi + 24]
	movss xmm4, dword ptr [r15 + 4*r8 + 24]
	unpcklps xmm3, xmm4
	unpcklps xmm0, xmm2
	movlhps xmm0, xmm3
	movaps xmm2, xmmword ptr [rsp + 64]
	addps xmm2, xmm0
	movaps xmmword ptr [rsp + 64], xmm2
	movaps xmm0, xmmword ptr [rsp + 48]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movaps xmmword ptr [rsp + 48], xmm0
	.p2align	4
.LBB1952_53:
	movaps xmm4, xmm1
.LBB1952_54:
	movaps xmm1, xmmword ptr [rsp + 128]
	movaps xmm3, xmmword ptr [rsp + 112]
	movaps xmm2, xmmword ptr [rsp + 96]
	cmp rdx, qword ptr [rsp + 448]
	lea rdx, [rdx + 1]
	mov rdi, qword ptr [rsp + 432]
	jne .LBB1952_44
	jmp .LBB1952_98
.LBB1952_93:
	movaps xmm4, xmm1
	movaps xmm5, xmmword ptr [rsp + 160]
	jmp .LBB1952_54
.LBB1952_98:
	movaps xmm15, xmmword ptr [rsp + 32]
	movaps xmm0, xmm15
	unpcklps xmm0, xmm1
	movaps xmm10, xmm1
	unpcklps xmm2, xmm3
	movlhps xmm0, xmm2
	movaps xmm2, xmm1
	shufps xmm2, xmm15, 17
	movaps xmm1, xmm3
	shufps xmm3, xmmword ptr [rsp + 96], 17
	shufps xmm2, xmm3, 34
	addps xmm2, xmm0
	movaps xmm0, xmm15
	unpckhps xmm0, xmm10
	movaps xmm3, xmm1
	movaps xmm15, xmmword ptr [rsp + 96]
	unpckhpd xmm3, xmm15
	shufps xmm0, xmm3, 36
	addps xmm0, xmm2
	shufps xmm10, xmmword ptr [rsp + 32], 51
	shufps xmm1, xmm15, 255
	shufps xmm10, xmm1, 34
	addps xmm10, xmm0
	movaps xmm0, xmm14
	unpcklps xmm0, xmm6
	movaps xmm1, xmm8
	movlhps xmm1, xmm5
	shufps xmm0, xmm1, 36
	addps xmm0, xmm10
	movaps xmm1, xmm6
	shufps xmm1, xmm14, 17
	movaps xmm2, xmm8
	shufps xmm2, xmm5, 85
	shufps xmm1, xmm2, 34
	addps xmm1, xmm0
	movaps xmm0, xmm14
	unpckhps xmm0, xmm6
	movaps xmm2, xmm8
	unpckhpd xmm2, xmm5
	shufps xmm0, xmm2, 36
	addps xmm0, xmm1
	shufps xmm6, xmm14, 51
	shufps xmm8, xmm5, 255
	shufps xmm6, xmm8, 34
	addps xmm6, xmm0
	movaps xmm2, xmmword ptr [rsp + 64]
	addps xmm2, xmm6
	movaps xmm0, xmm4
	unpcklps xmm0, xmm13
	movaps xmm1, xmm13
	shufps xmm1, xmm4, 17
	shufps xmm1, xmm4, 226
	addps xmm1, xmm0
	movaps xmm0, xmm4
	unpckhps xmm0, xmm13
	addps xmm0, xmm1
	shufps xmm13, xmm4, 255
	shufps xmm13, xmm4, 226
	addps xmm13, xmm0
	movaps xmm0, xmm12
	unpcklps xmm0, xmm11
	addps xmm0, xmm13
	movaps xmm1, xmm11
	shufps xmm1, xmm12, 17
	shufps xmm1, xmm12, 226
	addps xmm1, xmm0
	movaps xmm0, xmm12
	unpckhps xmm0, xmm11
	addps xmm0, xmm1
	shufps xmm11, xmm12, 255
	shufps xmm11, xmm12, 226
	addps xmm11, xmm0
	movaps xmm3, xmmword ptr [rsp + 48]
	unpcklps xmm3, xmmword ptr [rsp + 80]
	addps xmm3, xmm11
	movaps xmm0, xmm9
	shufps xmm0, xmm9, 85
	addss xmm0, xmm9
	movaps xmm1, xmm9
	unpckhpd xmm1, xmm9
	addss xmm1, xmm0
	shufps xmm9, xmm9, 255
	addss xmm9, xmm1
	addss xmm9, xmm7
	movaps xmm0, xmm7
	shufps xmm0, xmm7, 85
	addss xmm0, xmm9
	movaps xmm1, xmm7
	unpckhpd xmm1, xmm7
	addss xmm1, xmm0
	shufps xmm7, xmm7, 255
	addss xmm7, xmm1
	movss xmm1, dword ptr [rsp + 12]
	addss xmm1, xmm7
.LBB1952_99:
	movapd xmmword ptr [rsp + 576], xmm2
	movlpd qword ptr [rsp + 592], xmm3
	movss dword ptr [rsp + 600], xmm1
	lea rdi, [rsp + 288]
	mov rsi, qword ptr [rsp + 400]
	movss xmm0, dword ptr [rsp + 236]
	movss xmm1, dword ptr [rsp + 188]
	lea rdx, [rsp + 528]
	lea rcx, [rsp + 272]
	lea r8, [rsp + 576]
	call swarm::rules::finish
	mov rdx, qword ptr [rsp + 408]
	cmp rdx, qword ptr [rsp + 384]
	jae .LBB1952_101
	movss xmm0, dword ptr [rsp + 288]
	movss xmm1, dword ptr [rsp + 292]
	movss xmm2, dword ptr [rsp + 296]
	movss xmm3, dword ptr [rsp + 300]
	mov rax, qword ptr [rsp + 376]
	movss dword ptr [rax + 4*rdx], xmm0
	mov rax, qword ptr [rsp + 368]
	movss dword ptr [rax + 4*rdx], xmm1
	mov rax, qword ptr [rsp + 360]
	movss dword ptr [rax + 4*rdx], xmm2
	mov rax, qword ptr [rsp + 352]
	movss dword ptr [rax + 4*rdx], xmm3
	jmp .LBB1952_101
.LBB1952_103:
	add rsp, 664
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
