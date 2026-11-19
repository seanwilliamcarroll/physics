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
	sub rsp, 648
	.cfi_def_cfa_offset 704
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r13, rdi
	lea rax, [rdi + 316]
	mov qword ptr [rsp + 272], rax
	movss xmm5, dword ptr [rdi + 288]
	movss xmm6, dword ptr [rdi + 292]
	movss dword ptr [rsp + 76], xmm6
	mov eax, dword ptr [rdi + 312]
	mov dword ptr [rsp + 408], eax
	mov rax, qword ptr [rdi + 304]
	mov qword ptr [rsp + 400], rax
	movss xmm0, dword ptr [rdi + 316]
	mov rax, qword ptr [rdi + 8]
	mov qword ptr [rsp + 16], rax
	mov rbp, qword ptr [rdi + 16]
	mov rax, qword ptr [rdi + 32]
	mov qword ptr [rsp + 48], rax
	mov rax, qword ptr [rdi + 40]
	mov qword ptr [rsp + 128], rax
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
	movss dword ptr [rsp + 160], xmm1
	movss dword ptr [rdi + 280], xmm1
	movss dword ptr [rsp + 120], xmm5
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
	movss xmm0, dword ptr [rsp + 160]
	mulss xmm0, dword ptr [rsp + 76]
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
	mov rcx, qword ptr [rsp + 48]
	mov r8, qword ptr [rsp + 128]
	call <swarm::grid::Grid>::fill
	mov rsi, r13
	mov r12, qword ptr [r13 + 248]
	mov rax, qword ptr [r13 + 256]
	mov rbp, qword ptr [r13 + 8]
	mov r14, qword ptr [r13 + 16]
	mov qword ptr [r13 + 112], 0
	lea rbx, [r12 + 4*rax]
	lea rax, [r13 + 96]
	mov qword ptr [rsp + 48], rax
	mov r13, r12
	mov qword ptr [rsp + 40], rsi
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
	mov rdi, qword ptr [rsp + 48]
	mov rsi, r15
	movss dword ptr [rsp + 16], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 16]
	mov rsi, qword ptr [rsp + 40]
	jmp .LBB1952_8
.LBB1952_9:
	mov r13, qword ptr [rsi + 32]
	mov r15, qword ptr [rsi + 40]
	mov qword ptr [rsi + 136], 0
	xor r14d, r14d
	lea rax, [rsi + 120]
	mov qword ptr [rsp + 48], rax
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
	mov rdi, qword ptr [rsp + 48]
	mov rsi, r14
	movss dword ptr [rsp + 16], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 16]
	mov rsi, qword ptr [rsp + 40]
	jmp .LBB1952_17
.LBB1952_18:
	mov r13, qword ptr [rsi + 56]
	mov r15, qword ptr [rsi + 64]
	mov qword ptr [rsi + 160], 0
	xor r14d, r14d
	lea rax, [rsi + 144]
	mov qword ptr [rsp + 48], rax
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
	mov rdi, qword ptr [rsp + 48]
	mov rsi, r14
	movss dword ptr [rsp + 16], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 16]
	mov rsi, qword ptr [rsp + 40]
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
	mov rsi, qword ptr [rsp + 40]
	jmp .LBB1952_35
.LBB1952_36:
	movups xmm0, xmmword ptr [rsi + 96]
	mov rax, qword ptr [rsi + 8]
	mov qword ptr [rsp + 248], rax
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
	mov qword ptr [rsp + 240], rax
	mov qword ptr [rsi + 128], rax
	mov rcx, qword ptr [rsi + 56]
	movups xmm1, xmmword ptr [rsi + 144]
	movupd xmm2, xmmword ptr [rsi + 40]
	mov rax, qword ptr [rsi + 40]
	movups xmmword ptr [rsi + 32], xmm0
	movupd xmmword ptr [rsi + 136], xmm2
	movups xmmword ptr [rsi + 48], xmm1
	mov qword ptr [rsp + 232], rcx
	mov qword ptr [rsi + 152], rcx
	movups xmm0, xmmword ptr [rsi + 64]
	movups xmm1, xmmword ptr [rsi + 160]
	mov rcx, qword ptr [rsi + 64]
	movups xmmword ptr [rsi + 64], xmm1
	movups xmmword ptr [rsi + 160], xmm0
	mov r9, qword ptr [rsi + 80]
	mov rdx, qword ptr [rsi + 176]
	mov qword ptr [rsi + 80], rdx
	mov qword ptr [rsp + 224], r9
	mov qword ptr [rsi + 176], r9
	mov rdx, qword ptr [rsi + 88]
	mov qword ptr [rsi + 88], r14
	mov qword ptr [rsi + 184], rdx
	test rdi, rdi
	je .LBB1952_100
	movss xmm0, dword ptr [rsi + 316]
	movss xmm1, dword ptr [rsi + 320]
	mulss xmm1, xmm1
	cmp rax, r8
	cmovb r8, rax
	mulss xmm0, xmm0
	cmp rcx, r8
	cmovb r8, rcx
	movaps xmmword ptr [rsp + 80], xmm0
	shufps xmm0, xmm0, 0
	movaps xmmword ptr [rsp + 96], xmm1
	shufps xmm1, xmm1, 0
	cmp rdx, r8
	cmovb r8, rdx
	mov qword ptr [rsp + 256], r8
	xor edx, edx
	mov qword ptr [rsp + 264], rdi
	movaps xmmword ptr [rsp + 160], xmm0
	movaps xmmword ptr [rsp + 496], xmm1
	jmp .LBB1952_38
.LBB1952_98:
	mov rsi, qword ptr [rsp + 40]
	mov rdi, qword ptr [rsp + 264]
	.p2align	4
.LBB1952_99:
	inc rdx
	cmp rdx, rdi
	je .LBB1952_100
.LBB1952_38:
	mov rax, qword ptr [rsi + 16]
	mov qword ptr [rsp + 384], rax
	cmp rdx, rax
	jae .LBB1952_99
	mov rax, qword ptr [rsi + 40]
	mov qword ptr [rsp + 376], rax
	cmp rdx, rax
	jae .LBB1952_99
	mov rax, qword ptr [rsi + 64]
	mov rcx, qword ptr [rsi + 88]
	mov qword ptr [rsp + 368], rax
	cmp rdx, rax
	setb al
	mov qword ptr [rsp + 360], rcx
	cmp rdx, rcx
	setb cl
	and cl, al
	cmp cl, 1
	jne .LBB1952_99
	mov rax, qword ptr [rsi + 8]
	mov qword ptr [rsp + 352], rax
	movss xmm2, dword ptr [rax + 4*rdx]
	mov rax, qword ptr [rsi + 32]
	mov rcx, qword ptr [rsi + 56]
	mov qword ptr [rsp + 344], rax
	movss xmm3, dword ptr [rax + 4*rdx]
	movaps xmmword ptr [rsp + 144], xmm3
	mov rax, qword ptr [rsi + 80]
	mov qword ptr [rsp + 336], rcx
	movss xmm0, dword ptr [rcx + 4*rdx]
	mov qword ptr [rsp + 280], rdx
	mov qword ptr [rsp + 328], rax
	movss xmm1, dword ptr [rax + 4*rdx]
	movss dword ptr [rsp + 176], xmm2
	movss dword ptr [rsp + 180], xmm3
	movss dword ptr [rsp + 184], xmm0
	movss dword ptr [rsp + 188], xmm1
	xorps xmm0, xmm0
	movups xmmword ptr [rsp + 428], xmm0
	movaps xmmword ptr [rsp + 416], xmm0
	mov r12, qword ptr [rsi + 264]
	mov r15, qword ptr [rsi + 272]
	movss xmm1, dword ptr [rsi + 280]
	movss dword ptr [rsp + 16], xmm1
	movaps xmmword ptr [rsp + 208], xmm2
	movaps xmm0, xmm2
	mulss xmm0, xmm1
	xorps xmm1, xmm1
	maxss xmm0, xmm1
	mov r14, qword ptr [rip + floorf@GOTPCREL]
	call r14
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
	mov qword ptr [rsp + 320], r12
	sub r12, 1
	cmovb r12, rbx
	cmp r12, rbp
	cmovb rbp, r12
	movss xmm1, dword ptr [rip + .LCPI1952_5]
	ucomiss xmm0, xmm1
	cmovae rbp, rbx
	movss xmm0, dword ptr [rsp + 16]
	mulss xmm0, dword ptr [rsp + 144]
	xorps xmm1, xmm1
	maxss xmm0, xmm1
	call r14
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
	cmova rsi, r13
	sub r15, 1
	cmovb r15, rbx
	cmp r15, rsi
	cmovb rsi, r15
	ucomiss xmm0, dword ptr [rip + .LCPI1952_5]
	cmovae rsi, rbx
	mov rcx, rbp
	sub rcx, 1
	cmovb rcx, rbx
	mov qword ptr [rsp + 304], rcx
	mov rdx, rsi
	sub rdx, 1
	cmovb rdx, rbx
	inc rsi
	cmp r15, rsi
	cmovb rsi, r15
	mov qword ptr [rsp + 312], rsi
	cmp rdx, rsi
	ja .LBB1952_96
	mov rax, rbp
	inc rax
	cmp r12, rax
	cmovb rax, r12
	inc rax
	mov qword ptr [rsp + 296], rax
	mov rax, qword ptr [rsp + 40]
	mov rcx, qword ptr [rax + 200]
	mov qword ptr [rsp + 288], rcx
	mov r9, qword ptr [rax + 208]
	movaps xmm0, xmmword ptr [rsp + 208]
	movaps xmm4, xmm0
	movaps xmm12, xmmword ptr [rsp + 144]
	unpcklps xmm4, xmm12
	shufps xmm12, xmm12, 0
	shufps xmm0, xmm0, 0
	movaps xmmword ptr [rsp + 208], xmm0
	xorps xmm5, xmm5
	xorps xmm6, xmm6
	xorps xmm7, xmm7
	mov qword ptr [rsp + 8], r9
	movaps xmmword ptr [rsp + 448], xmm4
	movaps xmmword ptr [rsp + 144], xmm12
	.p2align	4
.LBB1952_46:
	mov rcx, qword ptr [rsp + 320]
	imul rcx, rdx
	mov rax, qword ptr [rsp + 304]
	lea r8, [rcx + rax]
	cmp r8, r9
	mov qword ptr [rsp + 392], rdx
	jae .LBB1952_47
	add rcx, qword ptr [rsp + 296]
	mov edi, 0
	mov esi, 0
	cmp rcx, r9
	jae .LBB1952_50
	mov rax, qword ptr [rsp + 288]
	mov esi, dword ptr [rax + 4*r8]
	mov edi, dword ptr [rax + 4*rcx]
	jmp .LBB1952_50
	.p2align	4
.LBB1952_47:
	xor edi, edi
	xor esi, esi
.LBB1952_50:
	mov r8, rdi
	sub r8, rsi
	setb bl
	cmp rdi, qword ptr [rsp + 384]
	seta cl
	or cl, bl
	mov rax, qword ptr [rsp + 352]
	lea r9, [rax + 4*rsi]
	mov r12, r8
	mov ebp, 0
	cmovne r12, rbp
	mov eax, 4
	cmovne r9, rax
	cmp rdi, qword ptr [rsp + 376]
	seta cl
	or cl, bl
	mov r14, r8
	cmovne r14, rbp
	mov rcx, qword ptr [rsp + 344]
	lea r13, [rcx + 4*rsi]
	cmovne r13, rax
	mov rcx, r14
	shr rcx, 3
	cmp rdi, qword ptr [rsp + 368]
	seta r10b
	or r10b, bl
	mov rdx, qword ptr [rsp + 336]
	lea r10, [rdx + 4*rsi]
	mov rdx, r8
	cmovne rdx, rbp
	cmovne r10, rax
	mov r11, rdx
	shr r11, 3
	cmp rdi, qword ptr [rsp + 360]
	seta dil
	or dil, bl
	mov rdi, qword ptr [rsp + 328]
	lea r15, [rdi + 4*rsi]
	cmovne r8, rbp
	cmovne r15, rax
	mov rdi, r8
	shr rdi, 3
	mov rsi, r12
	shr rsi, 3
	cmp rcx, rsi
	cmovb rsi, rcx
	cmp r11, rsi
	cmovb rsi, r11
	cmp rdi, rsi
	cmovb rsi, rdi
	test rsi, rsi
	je .LBB1952_51
	movaps xmmword ptr [rsp + 464], xmm7
	movss dword ptr [rsp + 124], xmm6
	movaps xmmword ptr [rsp + 480], xmm5
	shl rsi, 5
	xorps xmm9, xmm9
	xor edi, edi
	xorps xmm0, xmm0
	movaps xmmword ptr [rsp + 16], xmm0
	xorps xmm5, xmm5
	movaps xmmword ptr [rsp + 48], xmm0
	xorps xmm10, xmm10
	xorps xmm13, xmm13
	xorps xmm6, xmm6
	xorps xmm7, xmm7
	xorpd xmm2, xmm2
	xorps xmm8, xmm8
	xorps xmm15, xmm15
	xorps xmm14, xmm14
	xorps xmm1, xmm1
	movaps xmmword ptr [rsp + 128], xmm1
	.p2align	4
.LBB1952_53:
	movaps xmmword ptr [rsp + 512], xmm15
	movaps xmmword ptr [rsp + 528], xmm0
	movapd xmmword ptr [rsp + 544], xmm2
	movaps xmmword ptr [rsp + 560], xmm14
	movaps xmmword ptr [rsp + 576], xmm7
	movaps xmmword ptr [rsp + 592], xmm6
	movaps xmmword ptr [rsp + 608], xmm9
	movaps xmmword ptr [rsp + 624], xmm8
	movups xmm4, xmmword ptr [r9 + rdi]
	movaps xmm0, xmmword ptr [rsp + 208]
	movaps xmm7, xmm0
	subps xmm7, xmm4
	movups xmm6, xmmword ptr [r13 + rdi]
	movaps xmm9, xmm12
	subps xmm9, xmm6
	movaps xmm1, xmm7
	mulps xmm1, xmm7
	movaps xmm8, xmm9
	mulps xmm8, xmm9
	addps xmm8, xmm1
	movaps xmm15, xmm13
	movaps xmm13, xmm10
	movaps xmm2, xmm12
	movaps xmm10, xmm8
	movaps xmm3, xmmword ptr [rsp + 496]
	movaps xmm1, xmm3
	cmpleps xmm1, xmm8
	movaps xmm14, xmm5
	xorps xmm5, xmm5
	cmpltps xmm5, xmm8
	cmpltps xmm8, xmmword ptr [rsp + 160]
	andps xmm8, xmm1
	movups xmm12, xmmword ptr [r9 + rdi + 16]
	movaps xmm1, xmmword ptr [rip + .LCPI1952_6]
	andps xmm5, xmm1
	andps xmm5, xmm8
	movups xmm11, xmmword ptr [r13 + rdi + 16]
	cmpltps xmm10, xmm3
	andps xmm10, xmm1
	mulps xmm7, xmm10
	movaps xmm8, xmmword ptr [rsp + 48]
	addps xmm8, xmm7
	movaps xmmword ptr [rsp + 48], xmm8
	mulps xmm10, xmm9
	movaps xmm7, xmmword ptr [rsp + 16]
	addps xmm7, xmm10
	movaps xmmword ptr [rsp + 16], xmm7
	movaps xmm8, xmm0
	movaps xmm1, xmm2
	movaps xmm10, xmm13
	movaps xmm13, xmm15
	movaps xmm15, xmmword ptr [rsp + 512]
	movaps xmm0, xmmword ptr [rsp + 528]
	movaps xmm2, xmmword ptr [rsp + 544]
	mulps xmm4, xmm5
	movaps xmm7, xmmword ptr [rsp + 128]
	addps xmm7, xmm4
	movaps xmmword ptr [rsp + 128], xmm7
	mulps xmm6, xmm5
	addps xmm15, xmm6
	movups xmm4, xmmword ptr [r10 + rdi]
	mulps xmm4, xmm5
	addps xmm2, xmm4
	movups xmm4, xmmword ptr [r15 + rdi]
	mulps xmm4, xmm5
	addps xmm0, xmm4
	addps xmm13, xmm5
	movaps xmm5, xmm8
	subps xmm5, xmm12
	movaps xmm6, xmm1
	subps xmm6, xmm11
	movaps xmm4, xmm5
	mulps xmm4, xmm5
	movaps xmm7, xmm6
	mulps xmm7, xmm6
	addps xmm7, xmm4
	movaps xmm8, xmm7
	movaps xmm9, xmm3
	cmpleps xmm9, xmm7
	xorps xmm4, xmm4
	cmpltps xmm4, xmm7
	cmpltps xmm7, xmmword ptr [rsp + 160]
	andps xmm7, xmm9
	movaps xmm9, xmmword ptr [rsp + 608]
	movaps xmm1, xmmword ptr [rip + .LCPI1952_6]
	andps xmm4, xmm1
	andps xmm4, xmm7
	movaps xmm7, xmmword ptr [rsp + 576]
	cmpltps xmm8, xmm3
	andps xmm8, xmm1
	mulps xmm5, xmm8
	addps xmm14, xmm5
	movaps xmm5, xmm14
	movaps xmm14, xmmword ptr [rsp + 560]
	mulps xmm8, xmm6
	movaps xmm6, xmmword ptr [rsp + 592]
	addps xmm9, xmm8
	movaps xmm8, xmmword ptr [rsp + 624]
	mulps xmm12, xmm4
	addps xmm14, xmm12
	movaps xmm12, xmmword ptr [rsp + 144]
	mulps xmm11, xmm4
	addps xmm8, xmm11
	movups xmm1, xmmword ptr [r10 + rdi + 16]
	mulps xmm1, xmm4
	addps xmm7, xmm1
	movups xmm1, xmmword ptr [r15 + rdi + 16]
	mulps xmm1, xmm4
	addps xmm6, xmm1
	addps xmm10, xmm4
	add rdi, 32
	cmp rsi, rdi
	jne .LBB1952_53
	movaps xmm11, xmmword ptr [rsp + 128]
	movaps xmm1, xmm11
	unpcklps xmm1, xmm15
	movaps xmm3, xmm15
	shufps xmm3, xmm11, 17
	movaps xmm4, xmm2
	unpcklps xmm4, xmm0
	movlhps xmm1, xmm4
	movaps xmm4, xmm0
	shufps xmm4, xmm2, 17
	shufps xmm3, xmm4, 34
	addps xmm3, xmm1
	movaps xmm1, xmm11
	unpckhps xmm1, xmm15
	movaps xmm4, xmm0
	unpckhpd xmm4, xmm2
	shufps xmm1, xmm4, 36
	addps xmm1, xmm3
	shufps xmm15, xmm11, 51
	shufps xmm0, xmm2, 255
	shufps xmm15, xmm0, 34
	addps xmm15, xmm1
	movaps xmm0, xmm14
	unpcklps xmm0, xmm8
	movaps xmm1, xmm6
	movlhps xmm1, xmm7
	shufps xmm0, xmm1, 36
	addps xmm0, xmm15
	movaps xmm1, xmm8
	shufps xmm1, xmm14, 17
	movaps xmm2, xmm6
	shufps xmm2, xmm7, 85
	shufps xmm1, xmm2, 34
	addps xmm1, xmm0
	movaps xmm0, xmm14
	unpckhps xmm0, xmm8
	movaps xmm2, xmm6
	unpckhpd xmm2, xmm7
	shufps xmm0, xmm2, 36
	addps xmm0, xmm1
	shufps xmm8, xmm14, 51
	shufps xmm6, xmm7, 255
	shufps xmm8, xmm6, 34
	addps xmm8, xmm0
	movaps xmm0, xmm13
	shufps xmm0, xmm13, 85
	addss xmm0, xmm13
	movaps xmm1, xmm13
	unpckhpd xmm1, xmm13
	addss xmm1, xmm0
	shufps xmm13, xmm13, 255
	addss xmm13, xmm1
	addss xmm13, xmm10
	movaps xmm0, xmm10
	shufps xmm0, xmm10, 85
	addss xmm0, xmm13
	movaps xmm1, xmm10
	unpckhpd xmm1, xmm10
	addss xmm1, xmm0
	shufps xmm10, xmm10, 255
	addss xmm10, xmm1
	movaps xmm3, xmmword ptr [rsp + 48]
	movaps xmm0, xmm3
	movaps xmm2, xmmword ptr [rsp + 16]
	unpcklps xmm0, xmm2
	movaps xmm1, xmm2
	shufps xmm1, xmm3, 17
	shufps xmm1, xmm3, 226
	addps xmm1, xmm0
	movaps xmm0, xmm3
	unpckhps xmm0, xmm2
	addps xmm0, xmm1
	shufps xmm2, xmm3, 255
	shufps xmm2, xmm3, 226
	addps xmm2, xmm0
	movaps xmm0, xmm5
	unpcklps xmm0, xmm9
	addps xmm0, xmm2
	movaps xmm1, xmm9
	shufps xmm1, xmm5, 17
	shufps xmm1, xmm5, 226
	addps xmm1, xmm0
	movaps xmm0, xmm5
	unpckhps xmm0, xmm9
	addps xmm0, xmm1
	shufps xmm9, xmm5, 255
	shufps xmm9, xmm5, 226
	addps xmm9, xmm0
	movaps xmm4, xmmword ptr [rsp + 448]
	movaps xmm5, xmmword ptr [rsp + 480]
	movss xmm6, dword ptr [rsp + 124]
	movaps xmm7, xmmword ptr [rsp + 464]
	jmp .LBB1952_55
	.p2align	4
.LBB1952_51:
	xorps xmm8, xmm8
	xorps xmm10, xmm10
	xorps xmm9, xmm9
.LBB1952_55:
	addps xmm5, xmm9
	addss xmm6, xmm10
	mov ecx, r14d
	and ecx, 7
	mov edi, edx
	and edi, 7
	mov r11d, r8d
	and r11d, 7
	mov esi, r12d
	and esi, 7
	cmp rcx, rsi
	cmovb rsi, rcx
	addps xmm7, xmm8
	cmp rdi, rsi
	cmovb rsi, rdi
	cmp r11, rsi
	cmovb rsi, r11
	test rsi, rsi
	je .LBB1952_44
	and r12d, -8
	and r14d, -8
	and edx, -8
	and r8d, -8
	movss xmm0, dword ptr [r9 + 4*r12]
	movss xmm1, dword ptr [r13 + 4*r14]
	unpcklps xmm0, xmm1
	movaps xmm1, xmm4
	subps xmm1, xmm0
	movaps xmm3, xmm1
	mulps xmm3, xmm1
	movaps xmm2, xmm3
	shufps xmm2, xmm3, 85
	addss xmm2, xmm3
	movaps xmm3, xmmword ptr [rsp + 96]
	ucomiss xmm3, xmm2
	jbe .LBB1952_57
	addps xmm5, xmm1
	jmp .LBB1952_60
	.p2align	4
.LBB1952_57:
	movaps xmm1, xmmword ptr [rsp + 80]
	ucomiss xmm1, xmm2
	jbe .LBB1952_60
	xorps xmm1, xmm1
	ucomiss xmm2, xmm1
	jbe .LBB1952_60
	movss xmm1, dword ptr [r10 + 4*rdx]
	movss xmm2, dword ptr [r15 + 4*r8]
	unpcklps xmm1, xmm2
	movlhps xmm0, xmm1
	addps xmm7, xmm0
	addss xmm6, dword ptr [rip + .LCPI1952_2]
.LBB1952_60:
	cmp esi, 1
	je .LBB1952_44
	movss xmm0, dword ptr [r9 + 4*r12 + 4]
	movss xmm1, dword ptr [r13 + 4*r14 + 4]
	unpcklps xmm0, xmm1
	movaps xmm1, xmm4
	subps xmm1, xmm0
	movaps xmm3, xmm1
	mulps xmm3, xmm1
	movaps xmm2, xmm3
	shufps xmm2, xmm3, 85
	addss xmm2, xmm3
	movaps xmm3, xmmword ptr [rsp + 96]
	ucomiss xmm3, xmm2
	jbe .LBB1952_62
	addps xmm5, xmm1
	jmp .LBB1952_66
.LBB1952_62:
	movaps xmm1, xmmword ptr [rsp + 80]
	ucomiss xmm1, xmm2
	jbe .LBB1952_66
	xorps xmm1, xmm1
	ucomiss xmm2, xmm1
	jbe .LBB1952_66
	movss xmm1, dword ptr [r10 + 4*rdx + 4]
	movss xmm2, dword ptr [r15 + 4*r8 + 4]
	unpcklps xmm1, xmm2
	movlhps xmm0, xmm1
	addps xmm7, xmm0
	addss xmm6, dword ptr [rip + .LCPI1952_2]
.LBB1952_66:
	cmp esi, 2
	je .LBB1952_44
	movss xmm0, dword ptr [r9 + 4*r12 + 8]
	movss xmm1, dword ptr [r13 + 4*r14 + 8]
	unpcklps xmm0, xmm1
	movaps xmm1, xmm4
	subps xmm1, xmm0
	movaps xmm3, xmm1
	mulps xmm3, xmm1
	movaps xmm2, xmm3
	shufps xmm2, xmm3, 85
	addss xmm2, xmm3
	movaps xmm3, xmmword ptr [rsp + 96]
	ucomiss xmm3, xmm2
	jbe .LBB1952_68
	addps xmm5, xmm1
	jmp .LBB1952_72
.LBB1952_68:
	movaps xmm1, xmmword ptr [rsp + 80]
	ucomiss xmm1, xmm2
	jbe .LBB1952_72
	xorps xmm1, xmm1
	ucomiss xmm2, xmm1
	jbe .LBB1952_72
	movss xmm1, dword ptr [r10 + 4*rdx + 8]
	movss xmm2, dword ptr [r15 + 4*r8 + 8]
	unpcklps xmm1, xmm2
	movlhps xmm0, xmm1
	addps xmm7, xmm0
	addss xmm6, dword ptr [rip + .LCPI1952_2]
.LBB1952_72:
	cmp esi, 3
	je .LBB1952_44
	movss xmm0, dword ptr [r9 + 4*r12 + 12]
	movss xmm1, dword ptr [r13 + 4*r14 + 12]
	unpcklps xmm0, xmm1
	movaps xmm1, xmm4
	subps xmm1, xmm0
	movaps xmm3, xmm1
	mulps xmm3, xmm1
	movaps xmm2, xmm3
	shufps xmm2, xmm3, 85
	addss xmm2, xmm3
	movaps xmm3, xmmword ptr [rsp + 96]
	ucomiss xmm3, xmm2
	jbe .LBB1952_74
	addps xmm5, xmm1
	jmp .LBB1952_78
.LBB1952_74:
	movaps xmm1, xmmword ptr [rsp + 80]
	ucomiss xmm1, xmm2
	jbe .LBB1952_78
	xorps xmm1, xmm1
	ucomiss xmm2, xmm1
	jbe .LBB1952_78
	movss xmm1, dword ptr [r10 + 4*rdx + 12]
	movss xmm2, dword ptr [r15 + 4*r8 + 12]
	unpcklps xmm1, xmm2
	movlhps xmm0, xmm1
	addps xmm7, xmm0
	addss xmm6, dword ptr [rip + .LCPI1952_2]
.LBB1952_78:
	cmp esi, 4
	je .LBB1952_44
	movss xmm0, dword ptr [r9 + 4*r12 + 16]
	movss xmm1, dword ptr [r13 + 4*r14 + 16]
	unpcklps xmm0, xmm1
	movaps xmm1, xmm4
	subps xmm1, xmm0
	movaps xmm3, xmm1
	mulps xmm3, xmm1
	movaps xmm2, xmm3
	shufps xmm2, xmm3, 85
	addss xmm2, xmm3
	movaps xmm3, xmmword ptr [rsp + 96]
	ucomiss xmm3, xmm2
	jbe .LBB1952_80
	addps xmm5, xmm1
	jmp .LBB1952_84
.LBB1952_80:
	movaps xmm1, xmmword ptr [rsp + 80]
	ucomiss xmm1, xmm2
	jbe .LBB1952_84
	xorps xmm1, xmm1
	ucomiss xmm2, xmm1
	jbe .LBB1952_84
	movss xmm1, dword ptr [r10 + 4*rdx + 16]
	movss xmm2, dword ptr [r15 + 4*r8 + 16]
	unpcklps xmm1, xmm2
	movlhps xmm0, xmm1
	addps xmm7, xmm0
	addss xmm6, dword ptr [rip + .LCPI1952_2]
.LBB1952_84:
	cmp esi, 5
	je .LBB1952_44
	movss xmm0, dword ptr [r9 + 4*r12 + 20]
	movss xmm1, dword ptr [r13 + 4*r14 + 20]
	unpcklps xmm0, xmm1
	movaps xmm1, xmm4
	subps xmm1, xmm0
	movaps xmm3, xmm1
	mulps xmm3, xmm1
	movaps xmm2, xmm3
	shufps xmm2, xmm3, 85
	addss xmm2, xmm3
	movaps xmm3, xmmword ptr [rsp + 96]
	ucomiss xmm3, xmm2
	jbe .LBB1952_86
	addps xmm5, xmm1
	jmp .LBB1952_90
.LBB1952_86:
	movaps xmm1, xmmword ptr [rsp + 80]
	ucomiss xmm1, xmm2
	jbe .LBB1952_90
	xorps xmm1, xmm1
	ucomiss xmm2, xmm1
	jbe .LBB1952_90
	movss xmm1, dword ptr [r10 + 4*rdx + 20]
	movss xmm2, dword ptr [r15 + 4*r8 + 20]
	unpcklps xmm1, xmm2
	movlhps xmm0, xmm1
	addps xmm7, xmm0
	addss xmm6, dword ptr [rip + .LCPI1952_2]
.LBB1952_90:
	cmp esi, 6
	je .LBB1952_44
	movss xmm0, dword ptr [r9 + 4*r12 + 24]
	movss xmm1, dword ptr [r13 + 4*r14 + 24]
	unpcklps xmm0, xmm1
	movaps xmm1, xmm4
	subps xmm1, xmm0
	movaps xmm3, xmm1
	mulps xmm3, xmm1
	movaps xmm2, xmm3
	shufps xmm2, xmm3, 85
	addss xmm2, xmm3
	movaps xmm3, xmmword ptr [rsp + 96]
	ucomiss xmm3, xmm2
	jbe .LBB1952_92
	addps xmm5, xmm1
	.p2align	4
.LBB1952_44:
	mov r9, qword ptr [rsp + 8]
.LBB1952_45:
	mov rax, qword ptr [rsp + 392]
	cmp rax, qword ptr [rsp + 312]
	lea rdx, [rax + 1]
	jne .LBB1952_46
	jmp .LBB1952_95
.LBB1952_92:
	movaps xmm1, xmmword ptr [rsp + 80]
	ucomiss xmm1, xmm2
	mov r9, qword ptr [rsp + 8]
	jbe .LBB1952_45
	xorps xmm1, xmm1
	ucomiss xmm2, xmm1
	jbe .LBB1952_45
	movss xmm1, dword ptr [r10 + 4*rdx + 24]
	movss xmm2, dword ptr [r15 + 4*r8 + 24]
	unpcklps xmm1, xmm2
	movlhps xmm0, xmm1
	addps xmm7, xmm0
	addss xmm6, dword ptr [rip + .LCPI1952_2]
	jmp .LBB1952_45
.LBB1952_95:
	movaps xmmword ptr [rsp + 416], xmm7
	movss dword ptr [rsp + 432], xmm6
	movlps qword ptr [rsp + 436], xmm5
.LBB1952_96:
	lea rdi, [rsp + 192]
	mov rsi, qword ptr [rsp + 272]
	movss xmm0, dword ptr [rsp + 120]
	movss xmm1, dword ptr [rsp + 76]
	lea rdx, [rsp + 400]
	lea rcx, [rsp + 176]
	lea r8, [rsp + 416]
	call swarm::rules::finish
	mov rdx, qword ptr [rsp + 280]
	cmp rdx, qword ptr [rsp + 256]
	jae .LBB1952_98
	movss xmm0, dword ptr [rsp + 192]
	movss xmm1, dword ptr [rsp + 196]
	movss xmm2, dword ptr [rsp + 200]
	movss xmm3, dword ptr [rsp + 204]
	mov rax, qword ptr [rsp + 248]
	movss dword ptr [rax + 4*rdx], xmm0
	mov rax, qword ptr [rsp + 240]
	movss dword ptr [rax + 4*rdx], xmm1
	mov rax, qword ptr [rsp + 232]
	movss dword ptr [rax + 4*rdx], xmm2
	mov rax, qword ptr [rsp + 224]
	movss dword ptr [rax + 4*rdx], xmm3
	jmp .LBB1952_98
.LBB1952_100:
	add rsp, 648
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
