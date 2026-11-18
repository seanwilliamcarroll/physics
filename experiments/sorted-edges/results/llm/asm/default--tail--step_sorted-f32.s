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
	sub rsp, 744
	.cfi_def_cfa_offset 800
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r13, rdi
	lea rax, [rdi + 316]
	mov qword ptr [rsp + 520], rax
	movss xmm4, dword ptr [rdi + 288]
	movss xmm6, dword ptr [rdi + 292]
	movss dword ptr [rsp + 76], xmm6
	mov eax, dword ptr [rdi + 312]
	mov dword ptr [rsp + 600], eax
	mov rax, qword ptr [rdi + 304]
	mov qword ptr [rsp + 592], rax
	movss xmm5, dword ptr [rdi + 316]
	mov rax, qword ptr [rdi + 8]
	mov qword ptr [rsp + 16], rax
	mov rbp, qword ptr [rdi + 16]
	mov rax, qword ptr [rdi + 32]
	mov qword ptr [rsp + 48], rax
	mov rax, qword ptr [rdi + 40]
	mov qword ptr [rsp + 112], rax
	movss xmm0, dword ptr [rip + .LCPI1952_0]
	movaps xmm1, xmm4
	mulss xmm1, xmm0
	movaps xmm2, xmm5
	maxss xmm2, xmm1
	cmpunordss xmm1, xmm1
	movaps xmm3, xmm1
	andnps xmm3, xmm2
	movaps xmmword ptr [rsp + 80], xmm5
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
	movss dword ptr [rsp + 96], xmm1
	movss dword ptr [rdi + 280], xmm1
	movss dword ptr [rsp + 200], xmm4
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
	movss xmm0, dword ptr [rsp + 96]
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
	mov r8, qword ptr [rsp + 112]
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
	mov qword ptr [rsp + 64], rsi
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
	mov rsi, qword ptr [rsp + 64]
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
	mov rsi, qword ptr [rsp + 64]
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
	mov rsi, qword ptr [rsp + 64]
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
	mov rsi, qword ptr [rsp + 64]
	jmp .LBB1952_35
.LBB1952_36:
	movups xmm0, xmmword ptr [rsi + 96]
	mov rax, qword ptr [rsi + 8]
	mov qword ptr [rsp + 496], rax
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
	mov qword ptr [rsp + 488], rax
	mov qword ptr [rsi + 128], rax
	mov rcx, qword ptr [rsi + 56]
	movups xmm1, xmmword ptr [rsi + 144]
	movupd xmm2, xmmword ptr [rsi + 40]
	mov rax, qword ptr [rsi + 40]
	movups xmmword ptr [rsi + 32], xmm0
	movupd xmmword ptr [rsi + 136], xmm2
	movups xmmword ptr [rsi + 48], xmm1
	mov qword ptr [rsp + 480], rcx
	mov qword ptr [rsi + 152], rcx
	movups xmm0, xmmword ptr [rsi + 64]
	movups xmm1, xmmword ptr [rsi + 160]
	mov rcx, qword ptr [rsi + 64]
	movups xmmword ptr [rsi + 64], xmm1
	movups xmmword ptr [rsi + 160], xmm0
	mov r9, qword ptr [rsi + 80]
	mov rdx, qword ptr [rsi + 176]
	mov qword ptr [rsi + 80], rdx
	mov qword ptr [rsp + 472], r9
	mov qword ptr [rsi + 176], r9
	mov rdx, qword ptr [rsi + 88]
	mov qword ptr [rsi + 88], r14
	mov qword ptr [rsi + 184], rdx
	test rdi, rdi
	je .LBB1952_66
	movss xmm1, dword ptr [rsi + 320]
	mulss xmm1, xmm1
	movaps xmm0, xmmword ptr [rsp + 80]
	mulss xmm0, xmm0
	cmp rax, r8
	cmovb r8, rax
	cmp rcx, r8
	cmovb r8, rcx
	movaps xmmword ptr [rsp + 80], xmm0
	shufps xmm0, xmm0, 0
	movaps xmmword ptr [rsp + 128], xmm1
	shufps xmm1, xmm1, 0
	cmp rdx, r8
	cmovb r8, rdx
	mov qword ptr [rsp + 504], r8
	xor edx, edx
	mov qword ptr [rsp + 512], rdi
	movaps xmmword ptr [rsp + 448], xmm0
	movaps xmmword ptr [rsp + 432], xmm1
	jmp .LBB1952_38
.LBB1952_64:
	mov rsi, qword ptr [rsp + 64]
	mov rdi, qword ptr [rsp + 512]
	.p2align	4
.LBB1952_65:
	inc rdx
	cmp rdx, rdi
	je .LBB1952_66
.LBB1952_38:
	mov rbp, qword ptr [rsi + 16]
	cmp rdx, rbp
	jae .LBB1952_65
	mov rax, qword ptr [rsi + 40]
	mov qword ptr [rsp + 328], rax
	cmp rdx, rax
	jae .LBB1952_65
	mov rax, qword ptr [rsi + 64]
	mov rcx, qword ptr [rsi + 88]
	mov qword ptr [rsp + 320], rax
	cmp rdx, rax
	setb al
	mov qword ptr [rsp + 312], rcx
	cmp rdx, rcx
	setb cl
	and cl, al
	cmp cl, 1
	jne .LBB1952_65
	mov rax, qword ptr [rsi + 8]
	mov qword ptr [rsp + 360], rax
	movss xmm2, dword ptr [rax + 4*rdx]
	mov rax, qword ptr [rsi + 32]
	mov rcx, qword ptr [rsi + 56]
	mov qword ptr [rsp + 352], rax
	movss xmm3, dword ptr [rax + 4*rdx]
	movaps xmmword ptr [rsp + 208], xmm3
	mov rax, qword ptr [rsi + 80]
	mov qword ptr [rsp + 344], rcx
	movss xmm0, dword ptr [rcx + 4*rdx]
	mov qword ptr [rsp + 528], rdx
	mov qword ptr [rsp + 336], rax
	movss xmm1, dword ptr [rax + 4*rdx]
	movss dword ptr [rsp + 400], xmm2
	movss dword ptr [rsp + 404], xmm3
	movss dword ptr [rsp + 408], xmm0
	movss dword ptr [rsp + 412], xmm1
	xorps xmm0, xmm0
	movups xmmword ptr [rsp + 620], xmm0
	movaps xmmword ptr [rsp + 608], xmm0
	mov r15, qword ptr [rsi + 264]
	mov r14, qword ptr [rsi + 272]
	movss xmm1, dword ptr [rsi + 280]
	movss dword ptr [rsp + 16], xmm1
	movaps xmmword ptr [rsp + 240], xmm2
	movaps xmm0, xmm2
	mulss xmm0, xmm1
	xorps xmm1, xmm1
	maxss xmm0, xmm1
	mov r12, qword ptr [rip + floorf@GOTPCREL]
	call r12
	mov rdx, r12
	xorps xmm1, xmm1
	cvtss2sd xmm1, xmm0
	cvttsd2si rax, xmm1
	mov rcx, rax
	sar rcx, 63
	movapd xmm2, xmm1
	movsd xmm3, qword ptr [rip + .LCPI1952_3]
	subsd xmm2, xmm3
	cvttsd2si r12, xmm2
	and r12, rcx
	or r12, rax
	xorpd xmm2, xmm2
	ucomisd xmm1, xmm2
	mov ebx, 0
	cmovb r12, rbx
	movsd xmm2, qword ptr [rip + .LCPI1952_4]
	ucomisd xmm1, xmm2
	mov r13, -1
	cmova r12, r13
	mov qword ptr [rsp + 584], r15
	sub r15, 1
	cmovb r15, rbx
	cmp r15, r12
	cmovb r12, r15
	movss xmm1, dword ptr [rip + .LCPI1952_5]
	ucomiss xmm0, xmm1
	cmovae r12, rbx
	movss xmm0, dword ptr [rsp + 16]
	mulss xmm0, dword ptr [rsp + 208]
	xorps xmm1, xmm1
	maxss xmm0, xmm1
	call rdx
	xorps xmm1, xmm1
	cvtss2sd xmm1, xmm0
	cvttsd2si rax, xmm1
	mov rcx, rax
	sar rcx, 63
	movapd xmm2, xmm1
	subsd xmm2, qword ptr [rip + .LCPI1952_3]
	cvttsd2si rsi, xmm2
	and rsi, rcx
	or rsi, rax
	xorpd xmm2, xmm2
	ucomisd xmm1, xmm2
	cmovb rsi, rbx
	ucomisd xmm1, qword ptr [rip + .LCPI1952_4]
	cmova rsi, r13
	sub r14, 1
	cmovb r14, rbx
	cmp r14, rsi
	cmovb rsi, r14
	ucomiss xmm0, dword ptr [rip + .LCPI1952_5]
	cmovae rsi, rbx
	mov rax, r12
	sub rax, 1
	cmovb rax, rbx
	mov qword ptr [rsp + 568], rax
	mov rdi, rsi
	sub rdi, 1
	cmovb rdi, rbx
	inc rsi
	cmp r14, rsi
	cmovb rsi, r14
	mov qword ptr [rsp + 576], rsi
	cmp rdi, rsi
	ja .LBB1952_62
	inc r12
	cmp r15, r12
	cmovb r12, r15
	mov rax, qword ptr [rsp + 320]
	mov rcx, qword ptr [rsp + 312]
	cmp rax, rcx
	cmovb rcx, rax
	inc r12
	mov qword ptr [rsp + 552], r12
	mov rax, qword ptr [rsp + 328]
	cmp rax, rcx
	cmovb rcx, rax
	mov qword ptr [rsp + 536], rcx
	mov rax, qword ptr [rsp + 64]
	mov rcx, qword ptr [rax + 200]
	mov qword ptr [rsp + 544], rcx
	mov r8, qword ptr [rax + 208]
	movaps xmm1, xmmword ptr [rsp + 240]
	movaps xmm0, xmm1
	movaps xmm2, xmmword ptr [rsp + 208]
	unpcklps xmm0, xmm2
	movaps xmmword ptr [rsp + 144], xmm0
	shufps xmm2, xmm2, 0
	shufps xmm1, xmm1, 0
	xorps xmm4, xmm4
	xorps xmm5, xmm5
	xorps xmm6, xmm6
	mov qword ptr [rsp + 8], r8
	movaps xmmword ptr [rsp + 240], xmm1
	movaps xmmword ptr [rsp + 208], xmm2
	mov qword ptr [rsp + 560], rbp
	.p2align	4
.LBB1952_43:
	mov rcx, qword ptr [rsp + 584]
	imul rcx, rdi
	mov rax, qword ptr [rsp + 568]
	lea rsi, [rcx + rax]
	cmp rsi, r8
	mov qword ptr [rsp + 40], rdi
	jae .LBB1952_44
	add rcx, qword ptr [rsp + 552]
	mov edx, 0
	mov eax, 0
	cmp rcx, r8
	jae .LBB1952_47
	mov rdx, qword ptr [rsp + 544]
	mov eax, dword ptr [rdx + 4*rsi]
	mov edx, dword ptr [rdx + 4*rcx]
	jmp .LBB1952_47
	.p2align	4
.LBB1952_44:
	xor edx, edx
	xor eax, eax
.LBB1952_47:
	movaps xmmword ptr [rsp + 704], xmm6
	movss dword ptr [rsp + 204], xmm5
	movaps xmmword ptr [rsp + 720], xmm4
	mov r9, rdx
	sub r9, rax
	setb dil
	cmp rdx, rbp
	seta cl
	or cl, dil
	mov rcx, qword ptr [rsp + 360]
	lea r10, [rcx + 4*rax]
	mov r12, r9
	mov ebp, 0
	cmovne r12, rbp
	mov r14d, 4
	cmovne r10, r14
	cmp rdx, qword ptr [rsp + 328]
	seta cl
	or cl, dil
	mov rcx, r9
	cmovne rcx, rbp
	mov rsi, qword ptr [rsp + 352]
	lea r8, [rsi + 4*rax]
	cmovne r8, r14
	mov rbx, rcx
	shr rbx, 3
	cmp rdx, qword ptr [rsp + 320]
	seta sil
	or sil, dil
	mov rsi, qword ptr [rsp + 344]
	lea r11, [rsi + 4*rax]
	mov rsi, r9
	cmovne rsi, rbp
	cmovne r11, r14
	mov r13, rsi
	shr r13, 3
	cmp rdx, qword ptr [rsp + 312]
	seta r15b
	or r15b, dil
	mov rdi, qword ptr [rsp + 336]
	lea r15, [rdi + 4*rax]
	cmovne r9, rbp
	cmovne r15, r14
	mov r14, r12
	mov r12, r9
	mov rdi, r9
	shr rdi, 3
	mov rax, r14
	shr rax, 3
	cmp rbx, rax
	cmovb rax, rbx
	cmp r13, rax
	cmovb rax, r13
	cmp rdi, rax
	cmovb rax, rdi
	test rax, rax
	je .LBB1952_48
	shl rax, 5
	xorps xmm7, xmm7
	xor edi, edi
	xorps xmm0, xmm0
	movaps xmmword ptr [rsp + 384], xmm0
	xorps xmm1, xmm1
	movaps xmmword ptr [rsp + 112], xmm1
	movaps xmmword ptr [rsp + 224], xmm0
	xorpd xmm3, xmm3
	movaps xmmword ptr [rsp + 176], xmm0
	xorps xmm5, xmm5
	movaps xmmword ptr [rsp + 96], xmm0
	xorps xmm6, xmm6
	movaps xmmword ptr [rsp + 16], xmm0
	xorps xmm9, xmm9
	xorps xmm11, xmm11
	xorps xmm8, xmm8
	xorps xmm15, xmm15
	.p2align	4
.LBB1952_50:
	movapd xmmword ptr [rsp + 160], xmm3
	movaps xmmword ptr [rsp + 288], xmm7
	movaps xmmword ptr [rsp + 48], xmm8
	movaps xmmword ptr [rsp + 256], xmm6
	movaps xmmword ptr [rsp + 272], xmm5
	movups xmm5, xmmword ptr [r10 + rdi]
	movaps xmm0, xmmword ptr [rsp + 240]
	movaps xmm6, xmm0
	subps xmm6, xmm5
	movups xmm4, xmmword ptr [r8 + rdi]
	movaps xmm13, xmmword ptr [rsp + 208]
	movaps xmm8, xmm13
	subps xmm8, xmm4
	movaps xmm1, xmm6
	mulps xmm1, xmm6
	movaps xmm3, xmm8
	mulps xmm3, xmm8
	addps xmm3, xmm1
	movaps xmm12, xmm3
	movaps xmm14, xmmword ptr [rsp + 432]
	movaps xmm1, xmm14
	cmpleps xmm1, xmm3
	xorps xmm7, xmm7
	cmpltps xmm7, xmm3
	movaps xmm2, xmmword ptr [rsp + 448]
	cmpltps xmm3, xmm2
	andps xmm3, xmm1
	movups xmm1, xmmword ptr [r10 + rdi + 16]
	movaps xmm10, xmmword ptr [rip + .LCPI1952_6]
	andps xmm7, xmm10
	andps xmm7, xmm3
	movups xmm3, xmmword ptr [r8 + rdi + 16]
	cmpltps xmm12, xmm14
	andps xmm12, xmm10
	mulps xmm6, xmm12
	movaps xmm10, xmmword ptr [rsp + 224]
	addps xmm10, xmm6
	movaps xmmword ptr [rsp + 224], xmm10
	mulps xmm12, xmm8
	movaps xmm6, xmmword ptr [rsp + 384]
	addps xmm6, xmm12
	movaps xmmword ptr [rsp + 384], xmm6
	mulps xmm5, xmm7
	addps xmm15, xmm5
	mulps xmm4, xmm7
	addps xmm11, xmm4
	movups xmm4, xmmword ptr [r11 + rdi]
	mulps xmm4, xmm7
	movaps xmm5, xmmword ptr [rsp + 16]
	addps xmm5, xmm4
	movaps xmmword ptr [rsp + 16], xmm5
	movups xmm4, xmmword ptr [r15 + rdi]
	mulps xmm4, xmm7
	movaps xmm5, xmmword ptr [rsp + 96]
	addps xmm5, xmm4
	movaps xmmword ptr [rsp + 96], xmm5
	movaps xmm4, xmmword ptr [rsp + 176]
	addps xmm4, xmm7
	movaps xmmword ptr [rsp + 176], xmm4
	movaps xmm5, xmm0
	subps xmm5, xmm1
	subps xmm13, xmm3
	movaps xmm4, xmm5
	mulps xmm4, xmm5
	movaps xmm7, xmm13
	mulps xmm7, xmm13
	addps xmm7, xmm4
	movaps xmm8, xmm7
	movaps xmm12, xmm14
	cmpleps xmm12, xmm7
	xorps xmm4, xmm4
	cmpltps xmm4, xmm7
	cmpltps xmm7, xmm2
	andps xmm7, xmm12
	movaps xmm0, xmmword ptr [rip + .LCPI1952_6]
	andps xmm4, xmm0
	andps xmm4, xmm7
	movaps xmm7, xmmword ptr [rsp + 288]
	movaps xmm10, xmmword ptr [rsp + 112]
	cmpltps xmm8, xmm14
	andps xmm8, xmm0
	mulps xmm5, xmm8
	addps xmm10, xmm5
	movaps xmmword ptr [rsp + 112], xmm10
	movaps xmm5, xmmword ptr [rsp + 272]
	mulps xmm8, xmm13
	movaps xmm6, xmmword ptr [rsp + 256]
	addps xmm7, xmm8
	movaps xmm8, xmmword ptr [rsp + 48]
	mulps xmm1, xmm4
	addps xmm8, xmm1
	mulps xmm3, xmm4
	addps xmm9, xmm3
	movaps xmm3, xmmword ptr [rsp + 160]
	movups xmm1, xmmword ptr [r11 + rdi + 16]
	mulps xmm1, xmm4
	addps xmm6, xmm1
	movups xmm1, xmmword ptr [r15 + rdi + 16]
	mulps xmm1, xmm4
	addps xmm5, xmm1
	addps xmm3, xmm4
	add rdi, 32
	cmp rax, rdi
	jne .LBB1952_50
	jmp .LBB1952_51
	.p2align	4
.LBB1952_48:
	xorps xmm7, xmm7
	xorps xmm0, xmm0
	movaps xmmword ptr [rsp + 384], xmm0
	xorps xmm1, xmm1
	movaps xmmword ptr [rsp + 112], xmm1
	movaps xmmword ptr [rsp + 224], xmm0
	xorpd xmm3, xmm3
	movaps xmmword ptr [rsp + 176], xmm0
	xorps xmm5, xmm5
	movaps xmmword ptr [rsp + 96], xmm0
	xorps xmm6, xmm6
	movaps xmmword ptr [rsp + 16], xmm0
	xorps xmm9, xmm9
	xorps xmm11, xmm11
	xorps xmm8, xmm8
	xorps xmm15, xmm15
.LBB1952_51:
	movaps xmmword ptr [rsp + 160], xmm15
	movaps xmm1, xmmword ptr [rsp + 16]
	movaps xmmword ptr [rsp + 368], xmm11
	movaps xmmword ptr [rsp + 48], xmm8
	movaps xmm2, xmm3
	movaps xmm11, xmmword ptr [rsp + 384]
	mov edi, r14d
	and edi, 7
	mov rax, rdx
	sub rax, 8
	mov r13d, 0
	cmovae r13, rax
	mov al, 1
	test rdi, rdi
	mov rbp, qword ptr [rsp + 560]
	je .LBB1952_52
	lea rbx, [r13 + 8]
	cmp rbx, rbp
	movaps xmm8, xmmword ptr [rsp + 224]
	movaps xmm15, xmm2
	movaps xmm14, xmm9
	movaps xmm0, xmmword ptr [rsp + 96]
	movaps xmm10, xmm1
	movaps xmm9, xmmword ptr [rsp + 160]
	ja .LBB1952_54
	cmp rbx, qword ptr [rsp + 536]
	ja .LBB1952_54
	mov rbx, rdx
	sub rbx, r13
	sub rbx, rdi
	movq xmm1, rbx
	pshufd xmm3, xmm1, 68
	movdqa xmm1, xmmword ptr [rip + .LCPI1952_7]
	movaps xmmword ptr [rsp + 288], xmm7
	movdqa xmm7, xmm1
	pxor xmm3, xmm1
	pshufd xmm9, xmm3, 160
	movdqa xmm1, xmm9
	pcmpgtd xmm1, xmmword ptr [rip + .LCPI1952_8]
	pshufd xmm0, xmm3, 245
	pcmpeqd xmm0, xmm7
	movdqa xmmword ptr [rsp + 688], xmm0
	pandn xmm1, xmm0
	movdqa xmm3, xmm9
	pcmpgtd xmm3, xmmword ptr [rip + .LCPI1952_9]
	pandn xmm3, xmm0
	movdqa xmm4, xmm3
	shufps xmm4, xmm1, 136
	sub rdx, r13
	movaps xmmword ptr [rsp + 272], xmm5
	movq xmm5, rdx
	pshufd xmm0, xmm5, 68
	pxor xmm0, xmm7
	movdqa xmm5, xmm0
	pcmpgtd xmm5, xmmword ptr [rip + .LCPI1952_10]
	movaps xmmword ptr [rsp + 256], xmm6
	pshufd xmm6, xmm5, 160
	pshufd xmm2, xmm0, 245
	pcmpeqd xmm2, xmm7
	movdqa xmmword ptr [rsp + 672], xmm2
	pand xmm6, xmm2
	pshufd xmm7, xmm5, 245
	por xmm7, xmm6
	movdqa xmm5, xmm0
	pcmpgtd xmm5, xmmword ptr [rip + .LCPI1952_11]
	pshufd xmm6, xmm5, 160
	pand xmm6, xmm2
	pshufd xmm5, xmm5, 245
	por xmm5, xmm6
	pand xmm3, xmm5
	shufps xmm5, xmm7, 136
	andps xmm5, xmm4
	andps xmm7, xmm1
	shufps xmm3, xmm7, 136
	mov rax, qword ptr [rsp + 360]
	movups xmm8, xmmword ptr [rax + 4*r13 + 16]
	movaps xmm6, xmmword ptr [rsp + 240]
	subps xmm6, xmm8
	movaps xmmword ptr [rsp + 656], xmm6
	mulps xmm6, xmm6
	mov rdx, qword ptr [rsp + 352]
	movups xmm4, xmmword ptr [rdx + 4*r13 + 16]
	movaps xmm2, xmmword ptr [rsp + 208]
	subps xmm2, xmm4
	movaps xmm1, xmm2
	mulps xmm1, xmm2
	addps xmm1, xmm6
	movaps xmm7, xmmword ptr [rsp + 432]
	movaps xmm6, xmm7
	movaps xmm13, xmm7
	cmpleps xmm6, xmm1
	movaps xmm7, xmm1
	cmpltps xmm7, xmmword ptr [rsp + 448]
	andps xmm7, xmm6
	xorps xmm6, xmm6
	cmpltps xmm6, xmm1
	andps xmm6, xmm5
	andps xmm6, xmm7
	movaps xmm10, xmmword ptr [rip + .LCPI1952_6]
	andps xmm6, xmm10
	mov rbx, qword ptr [rsp + 336]
	movups xmm5, xmmword ptr [rbx + 4*r13 + 16]
	mulps xmm5, xmm6
	movaps xmm7, xmmword ptr [rsp + 272]
	addps xmm7, xmm5
	movaps xmmword ptr [rsp + 272], xmm7
	mov r9, qword ptr [rsp + 344]
	movups xmm5, xmmword ptr [r9 + 4*r13 + 16]
	mulps xmm5, xmm6
	movaps xmm7, xmmword ptr [rsp + 256]
	addps xmm7, xmm5
	movaps xmmword ptr [rsp + 256], xmm7
	mulps xmm4, xmm6
	addps xmm14, xmm4
	addps xmm15, xmm6
	mulps xmm6, xmm8
	movaps xmm4, xmmword ptr [rsp + 48]
	addps xmm4, xmm6
	movaps xmmword ptr [rsp + 48], xmm4
	movups xmm12, xmmword ptr [rax + 4*r13]
	movaps xmmword ptr [rsp + 640], xmm12
	cmpltps xmm1, xmm13
	movaps xmm8, xmm13
	andps xmm3, xmm10
	andps xmm3, xmm1
	movups xmm7, xmmword ptr [rdx + 4*r13]
	mulps xmm2, xmm3
	movaps xmm1, xmmword ptr [rsp + 288]
	addps xmm1, xmm2
	movaps xmmword ptr [rsp + 288], xmm1
	mulps xmm3, xmmword ptr [rsp + 656]
	movaps xmm1, xmmword ptr [rsp + 112]
	addps xmm1, xmm3
	movaps xmmword ptr [rsp + 112], xmm1
	movdqa xmm13, xmm9
	movdqa xmm1, xmm9
	pcmpgtd xmm1, xmmword ptr [rip + .LCPI1952_12]
	movdqa xmm3, xmmword ptr [rsp + 688]
	pandn xmm1, xmm3
	pcmpgtd xmm13, xmmword ptr [rip + .LCPI1952_13]
	pandn xmm13, xmm3
	movdqa xmm3, xmm13
	shufps xmm3, xmm1, 136
	movdqa xmm4, xmm0
	pcmpgtd xmm4, xmmword ptr [rip + .LCPI1952_14]
	pshufd xmm5, xmm4, 160
	movdqa xmm6, xmmword ptr [rsp + 672]
	pand xmm5, xmm6
	pshufd xmm4, xmm4, 245
	por xmm4, xmm5
	pcmpgtd xmm0, xmmword ptr [rip + .LCPI1952_15]
	pshufd xmm5, xmm0, 160
	pand xmm5, xmm6
	pshufd xmm6, xmm0, 245
	por xmm6, xmm5
	pand xmm13, xmm6
	shufps xmm6, xmm4, 136
	andps xmm6, xmm3
	andps xmm4, xmm1
	shufps xmm13, xmm4, 136
	movaps xmm3, xmmword ptr [rsp + 240]
	subps xmm3, xmm12
	movaps xmm5, xmm3
	mulps xmm5, xmm3
	movaps xmm1, xmmword ptr [rsp + 208]
	movaps xmm0, xmmword ptr [rsp + 96]
	subps xmm1, xmm7
	movaps xmm2, xmm7
	movaps xmm4, xmm1
	mulps xmm4, xmm1
	addps xmm4, xmm5
	movaps xmm5, xmm8
	cmpleps xmm5, xmm4
	movaps xmm7, xmm4
	cmpltps xmm7, xmmword ptr [rsp + 448]
	movaps xmm8, xmmword ptr [rsp + 224]
	andps xmm7, xmm5
	xorps xmm5, xmm5
	cmpltps xmm5, xmm4
	andps xmm5, xmm6
	andps xmm5, xmm7
	movaps xmm7, xmmword ptr [rsp + 288]
	movups xmm6, xmmword ptr [rbx + 4*r13]
	andps xmm5, xmm10
	mulps xmm6, xmm5
	addps xmm0, xmm6
	movups xmm6, xmmword ptr [r9 + 4*r13]
	mulps xmm6, xmm5
	movaps xmm9, xmmword ptr [rsp + 16]
	addps xmm9, xmm6
	movaps xmmword ptr [rsp + 16], xmm9
	movaps xmm6, xmmword ptr [rsp + 256]
	movaps xmm9, xmm2
	mulps xmm9, xmm5
	movaps xmm2, xmmword ptr [rsp + 368]
	addps xmm2, xmm9
	movaps xmm12, xmmword ptr [rsp + 176]
	addps xmm12, xmm5
	mulps xmm5, xmmword ptr [rsp + 640]
	movaps xmm9, xmmword ptr [rsp + 160]
	addps xmm9, xmm5
	movaps xmmword ptr [rsp + 160], xmm9
	movaps xmm5, xmmword ptr [rsp + 272]
	cmpltps xmm4, xmmword ptr [rsp + 432]
	andps xmm13, xmm10
	movaps xmm10, xmmword ptr [rsp + 16]
	movaps xmm9, xmmword ptr [rsp + 160]
	andps xmm13, xmm4
	mulps xmm1, xmm13
	addps xmm11, xmm1
	mulps xmm13, xmm3
	addps xmm8, xmm13
	xor eax, eax
	jmp .LBB1952_57
	.p2align	4
.LBB1952_52:
	movaps xmm8, xmmword ptr [rsp + 224]
	movaps xmm15, xmm2
	movaps xmm12, xmmword ptr [rsp + 176]
	movaps xmm14, xmm9
	movaps xmm2, xmmword ptr [rsp + 368]
	movaps xmm0, xmmword ptr [rsp + 96]
	movaps xmm10, xmm1
	movaps xmm9, xmmword ptr [rsp + 160]
	jmp .LBB1952_57
	.p2align	4
.LBB1952_54:
	movaps xmm12, xmmword ptr [rsp + 176]
	movaps xmm2, xmmword ptr [rsp + 368]
.LBB1952_57:
	movaps xmm1, xmm9
	unpcklps xmm1, xmm2
	movaps xmm3, xmm10
	unpcklps xmm3, xmm0
	movlhps xmm1, xmm3
	movaps xmm3, xmm2
	shufps xmm3, xmm9, 17
	movaps xmm4, xmm0
	shufps xmm4, xmm10, 17
	shufps xmm3, xmm4, 34
	addps xmm3, xmm1
	movaps xmm1, xmm9
	unpckhps xmm1, xmm2
	movaps xmm4, xmm0
	unpckhpd xmm4, xmm10
	shufps xmm1, xmm4, 36
	addps xmm1, xmm3
	shufps xmm2, xmm9, 51
	shufps xmm0, xmm10, 255
	shufps xmm2, xmm0, 34
	addps xmm2, xmm1
	movaps xmm3, xmmword ptr [rsp + 48]
	movaps xmm0, xmm3
	unpcklps xmm0, xmm14
	movaps xmm1, xmm5
	movlhps xmm1, xmm6
	shufps xmm0, xmm1, 36
	addps xmm0, xmm2
	movaps xmm1, xmm14
	shufps xmm1, xmm3, 17
	movaps xmm2, xmm5
	shufps xmm2, xmm6, 85
	shufps xmm1, xmm2, 34
	addps xmm1, xmm0
	movaps xmm0, xmm3
	unpckhps xmm0, xmm14
	movaps xmm2, xmm5
	unpckhpd xmm2, xmm6
	shufps xmm0, xmm2, 36
	addps xmm0, xmm1
	shufps xmm14, xmm3, 51
	shufps xmm5, xmm6, 255
	shufps xmm14, xmm5, 34
	addps xmm14, xmm0
	movaps xmm6, xmmword ptr [rsp + 704]
	addps xmm6, xmm14
	movaps xmm0, xmm12
	shufps xmm0, xmm12, 85
	addss xmm0, xmm12
	movaps xmm1, xmm12
	unpckhpd xmm1, xmm12
	addss xmm1, xmm0
	shufps xmm12, xmm12, 255
	addss xmm12, xmm1
	addss xmm12, xmm15
	movaps xmm0, xmm15
	shufps xmm0, xmm15, 85
	addss xmm0, xmm12
	movaps xmm1, xmm15
	unpckhpd xmm1, xmm15
	addss xmm1, xmm0
	shufps xmm15, xmm15, 255
	addss xmm15, xmm1
	movss xmm5, dword ptr [rsp + 204]
	addss xmm5, xmm15
	movaps xmm0, xmm8
	unpcklps xmm0, xmm11
	movaps xmm1, xmm11
	shufps xmm1, xmm8, 17
	shufps xmm1, xmm8, 226
	addps xmm1, xmm0
	movaps xmm0, xmm8
	unpckhps xmm0, xmm11
	addps xmm0, xmm1
	shufps xmm11, xmm8, 255
	shufps xmm11, xmm8, 226
	addps xmm11, xmm0
	movaps xmm2, xmmword ptr [rsp + 112]
	movaps xmm0, xmm2
	unpcklps xmm0, xmm7
	addps xmm0, xmm11
	movaps xmm1, xmm7
	shufps xmm1, xmm2, 17
	shufps xmm1, xmm2, 226
	addps xmm1, xmm0
	movaps xmm0, xmm2
	unpckhps xmm0, xmm7
	addps xmm0, xmm1
	shufps xmm7, xmm2, 255
	shufps xmm7, xmm2, 226
	addps xmm7, xmm0
	movaps xmm4, xmmword ptr [rsp + 720]
	addps xmm4, xmm7
	test al, al
	je .LBB1952_58
	mov eax, ecx
	and eax, 7
	mov r9d, esi
	and r9d, 7
	mov ebx, r12d
	and ebx, 7
	cmp rax, rdi
	cmovb rdi, rax
	cmp r9, rdi
	cmovb rdi, r9
	cmp rbx, rdi
	cmovb rdi, rbx
	test rdi, rdi
	je .LBB1952_58
	and r14d, -8
	and ecx, -8
	and esi, -8
	and r12d, -8
	movss xmm0, dword ptr [r10 + 4*r14]
	movss xmm1, dword ptr [r8 + 4*rcx]
	unpcklps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 144]
	subps xmm1, xmm0
	movaps xmm3, xmm1
	mulps xmm3, xmm1
	movaps xmm2, xmm3
	shufps xmm2, xmm3, 85
	addss xmm2, xmm3
	movaps xmm3, xmmword ptr [rsp + 128]
	ucomiss xmm3, xmm2
	jbe .LBB1952_69
	addps xmm4, xmm1
	jmp .LBB1952_72
.LBB1952_69:
	movaps xmm1, xmmword ptr [rsp + 80]
	ucomiss xmm1, xmm2
	jbe .LBB1952_72
	xorps xmm1, xmm1
	ucomiss xmm2, xmm1
	jbe .LBB1952_72
	movss xmm1, dword ptr [r11 + 4*rsi]
	movss xmm2, dword ptr [r15 + 4*r12]
	unpcklps xmm1, xmm2
	movlhps xmm0, xmm1
	addps xmm6, xmm0
	addss xmm5, dword ptr [rip + .LCPI1952_2]
.LBB1952_72:
	cmp edi, 1
	je .LBB1952_58
	movss xmm0, dword ptr [r10 + 4*r14 + 4]
	movss xmm1, dword ptr [r8 + 4*rcx + 4]
	unpcklps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 144]
	subps xmm1, xmm0
	movaps xmm3, xmm1
	mulps xmm3, xmm1
	movaps xmm2, xmm3
	shufps xmm2, xmm3, 85
	addss xmm2, xmm3
	movaps xmm3, xmmword ptr [rsp + 128]
	ucomiss xmm3, xmm2
	jbe .LBB1952_74
	addps xmm4, xmm1
	jmp .LBB1952_78
.LBB1952_74:
	movaps xmm1, xmmword ptr [rsp + 80]
	ucomiss xmm1, xmm2
	jbe .LBB1952_78
	xorps xmm1, xmm1
	ucomiss xmm2, xmm1
	jbe .LBB1952_78
	movss xmm1, dword ptr [r11 + 4*rsi + 4]
	movss xmm2, dword ptr [r15 + 4*r12 + 4]
	unpcklps xmm1, xmm2
	movlhps xmm0, xmm1
	addps xmm6, xmm0
	addss xmm5, dword ptr [rip + .LCPI1952_2]
.LBB1952_78:
	cmp edi, 2
	je .LBB1952_58
	movss xmm0, dword ptr [r10 + 4*r14 + 8]
	movss xmm1, dword ptr [r8 + 4*rcx + 8]
	unpcklps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 144]
	subps xmm1, xmm0
	movaps xmm3, xmm1
	mulps xmm3, xmm1
	movaps xmm2, xmm3
	shufps xmm2, xmm3, 85
	addss xmm2, xmm3
	movaps xmm3, xmmword ptr [rsp + 128]
	ucomiss xmm3, xmm2
	jbe .LBB1952_80
	addps xmm4, xmm1
	jmp .LBB1952_84
.LBB1952_80:
	movaps xmm1, xmmword ptr [rsp + 80]
	ucomiss xmm1, xmm2
	jbe .LBB1952_84
	xorps xmm1, xmm1
	ucomiss xmm2, xmm1
	jbe .LBB1952_84
	movss xmm1, dword ptr [r11 + 4*rsi + 8]
	movss xmm2, dword ptr [r15 + 4*r12 + 8]
	unpcklps xmm1, xmm2
	movlhps xmm0, xmm1
	addps xmm6, xmm0
	addss xmm5, dword ptr [rip + .LCPI1952_2]
.LBB1952_84:
	cmp edi, 3
	je .LBB1952_58
	movss xmm0, dword ptr [r10 + 4*r14 + 12]
	movss xmm1, dword ptr [r8 + 4*rcx + 12]
	unpcklps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 144]
	subps xmm1, xmm0
	movaps xmm3, xmm1
	mulps xmm3, xmm1
	movaps xmm2, xmm3
	shufps xmm2, xmm3, 85
	addss xmm2, xmm3
	movaps xmm3, xmmword ptr [rsp + 128]
	ucomiss xmm3, xmm2
	jbe .LBB1952_86
	addps xmm4, xmm1
	jmp .LBB1952_90
.LBB1952_86:
	movaps xmm1, xmmword ptr [rsp + 80]
	ucomiss xmm1, xmm2
	jbe .LBB1952_90
	xorps xmm1, xmm1
	ucomiss xmm2, xmm1
	jbe .LBB1952_90
	movss xmm1, dword ptr [r11 + 4*rsi + 12]
	movss xmm2, dword ptr [r15 + 4*r12 + 12]
	unpcklps xmm1, xmm2
	movlhps xmm0, xmm1
	addps xmm6, xmm0
	addss xmm5, dword ptr [rip + .LCPI1952_2]
.LBB1952_90:
	cmp edi, 4
	je .LBB1952_58
	movss xmm0, dword ptr [r10 + 4*r14 + 16]
	movss xmm1, dword ptr [r8 + 4*rcx + 16]
	unpcklps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 144]
	subps xmm1, xmm0
	movaps xmm3, xmm1
	mulps xmm3, xmm1
	movaps xmm2, xmm3
	shufps xmm2, xmm3, 85
	addss xmm2, xmm3
	movaps xmm3, xmmword ptr [rsp + 128]
	ucomiss xmm3, xmm2
	jbe .LBB1952_92
	addps xmm4, xmm1
	jmp .LBB1952_96
.LBB1952_92:
	movaps xmm1, xmmword ptr [rsp + 80]
	ucomiss xmm1, xmm2
	jbe .LBB1952_96
	xorps xmm1, xmm1
	ucomiss xmm2, xmm1
	jbe .LBB1952_96
	movss xmm1, dword ptr [r11 + 4*rsi + 16]
	movss xmm2, dword ptr [r15 + 4*r12 + 16]
	unpcklps xmm1, xmm2
	movlhps xmm0, xmm1
	addps xmm6, xmm0
	addss xmm5, dword ptr [rip + .LCPI1952_2]
.LBB1952_96:
	cmp edi, 5
	je .LBB1952_58
	movss xmm0, dword ptr [r10 + 4*r14 + 20]
	movss xmm1, dword ptr [r8 + 4*rcx + 20]
	unpcklps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 144]
	subps xmm1, xmm0
	movaps xmm3, xmm1
	mulps xmm3, xmm1
	movaps xmm2, xmm3
	shufps xmm2, xmm3, 85
	addss xmm2, xmm3
	movaps xmm3, xmmword ptr [rsp + 128]
	ucomiss xmm3, xmm2
	jbe .LBB1952_98
	addps xmm4, xmm1
	jmp .LBB1952_102
.LBB1952_98:
	movaps xmm1, xmmword ptr [rsp + 80]
	ucomiss xmm1, xmm2
	jbe .LBB1952_102
	xorps xmm1, xmm1
	ucomiss xmm2, xmm1
	jbe .LBB1952_102
	movss xmm1, dword ptr [r11 + 4*rsi + 20]
	movss xmm2, dword ptr [r15 + 4*r12 + 20]
	unpcklps xmm1, xmm2
	movlhps xmm0, xmm1
	addps xmm6, xmm0
	addss xmm5, dword ptr [rip + .LCPI1952_2]
.LBB1952_102:
	cmp edi, 6
	jne .LBB1952_103
	.p2align	4
.LBB1952_58:
	mov rax, qword ptr [rsp + 40]
.LBB1952_59:
	mov r8, qword ptr [rsp + 8]
.LBB1952_60:
	cmp rax, qword ptr [rsp + 576]
	lea rdi, [rax + 1]
	jne .LBB1952_43
	jmp .LBB1952_61
.LBB1952_103:
	movss xmm0, dword ptr [r10 + 4*r14 + 24]
	movss xmm1, dword ptr [r8 + 4*rcx + 24]
	unpcklps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 144]
	subps xmm1, xmm0
	movaps xmm3, xmm1
	mulps xmm3, xmm1
	movaps xmm2, xmm3
	shufps xmm2, xmm3, 85
	addss xmm2, xmm3
	movaps xmm3, xmmword ptr [rsp + 128]
	ucomiss xmm3, xmm2
	mov rax, qword ptr [rsp + 40]
	jbe .LBB1952_104
	addps xmm4, xmm1
	jmp .LBB1952_59
.LBB1952_104:
	movaps xmm1, xmmword ptr [rsp + 80]
	ucomiss xmm1, xmm2
	mov r8, qword ptr [rsp + 8]
	jbe .LBB1952_60
	xorps xmm1, xmm1
	ucomiss xmm2, xmm1
	jbe .LBB1952_60
	movss xmm1, dword ptr [r11 + 4*rsi + 24]
	movss xmm2, dword ptr [r15 + 4*r12 + 24]
	unpcklps xmm1, xmm2
	movlhps xmm0, xmm1
	addps xmm6, xmm0
	addss xmm5, dword ptr [rip + .LCPI1952_2]
	jmp .LBB1952_60
.LBB1952_61:
	movaps xmmword ptr [rsp + 608], xmm6
	movss dword ptr [rsp + 624], xmm5
	movlps qword ptr [rsp + 628], xmm4
.LBB1952_62:
	lea rdi, [rsp + 416]
	mov rsi, qword ptr [rsp + 520]
	movss xmm0, dword ptr [rsp + 200]
	movss xmm1, dword ptr [rsp + 76]
	lea rdx, [rsp + 592]
	lea rcx, [rsp + 400]
	lea r8, [rsp + 608]
	call swarm::rules::finish
	mov rdx, qword ptr [rsp + 528]
	cmp rdx, qword ptr [rsp + 504]
	jae .LBB1952_64
	movss xmm0, dword ptr [rsp + 416]
	movss xmm1, dword ptr [rsp + 420]
	movss xmm2, dword ptr [rsp + 424]
	movss xmm3, dword ptr [rsp + 428]
	mov rax, qword ptr [rsp + 496]
	movss dword ptr [rax + 4*rdx], xmm0
	mov rax, qword ptr [rsp + 488]
	movss dword ptr [rax + 4*rdx], xmm1
	mov rax, qword ptr [rsp + 480]
	movss dword ptr [rax + 4*rdx], xmm2
	mov rax, qword ptr [rsp + 472]
	movss dword ptr [rax + 4*rdx], xmm3
	jmp .LBB1952_64
.LBB1952_66:
	add rsp, 744
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
