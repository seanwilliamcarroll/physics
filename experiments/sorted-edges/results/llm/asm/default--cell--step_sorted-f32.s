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
	sub rsp, 616
	.cfi_def_cfa_offset 672
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r13, rdi
	lea rax, [rdi + 316]
	mov qword ptr [rsp + 232], rax
	movss xmm4, dword ptr [rdi + 288]
	movss xmm6, dword ptr [rdi + 292]
	movss dword ptr [rsp + 60], xmm6
	mov eax, dword ptr [rdi + 312]
	mov dword ptr [rsp + 376], eax
	mov rax, qword ptr [rdi + 304]
	mov qword ptr [rsp + 368], rax
	movss xmm5, dword ptr [rdi + 316]
	mov rax, qword ptr [rdi + 8]
	mov qword ptr [rsp + 16], rax
	mov rbp, qword ptr [rdi + 16]
	mov rax, qword ptr [rdi + 32]
	mov qword ptr [rsp + 32], rax
	mov rax, qword ptr [rdi + 40]
	mov qword ptr [rsp + 128], rax
	movss xmm0, dword ptr [rip + .LCPI1952_0]
	movaps xmm1, xmm4
	mulss xmm1, xmm0
	movaps xmm2, xmm5
	maxss xmm2, xmm1
	cmpunordss xmm1, xmm1
	movaps xmm3, xmm1
	andnps xmm3, xmm2
	movaps xmmword ptr [rsp + 64], xmm5
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
	movss dword ptr [rsp + 104], xmm4
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
	mulss xmm0, dword ptr [rsp + 60]
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
	mov r8, qword ptr [rsp + 128]
	call <swarm::grid::Grid>::fill
	mov rcx, r13
	mov r12, qword ptr [r13 + 248]
	mov rax, qword ptr [r13 + 256]
	mov rbp, qword ptr [r13 + 8]
	mov r14, qword ptr [r13 + 16]
	mov qword ptr [r13 + 112], 0
	lea rbx, [r12 + 4*rax]
	lea rax, [r13 + 96]
	mov qword ptr [rsp + 32], rax
	mov r13, r12
	mov qword ptr [rsp + 8], rcx
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
	mov rdi, qword ptr [rsp + 32]
	mov rsi, r15
	movss dword ptr [rsp + 16], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 16]
	mov rcx, qword ptr [rsp + 8]
	jmp .LBB1952_8
.LBB1952_9:
	mov r13, qword ptr [rcx + 32]
	mov r15, qword ptr [rcx + 40]
	mov qword ptr [rcx + 136], 0
	xor r14d, r14d
	lea rax, [rcx + 120]
	mov qword ptr [rsp + 32], rax
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
	mov rdi, qword ptr [rsp + 32]
	mov rsi, r14
	movss dword ptr [rsp + 16], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 16]
	mov rcx, qword ptr [rsp + 8]
	jmp .LBB1952_17
.LBB1952_18:
	mov r13, qword ptr [rcx + 56]
	mov r15, qword ptr [rcx + 64]
	mov qword ptr [rcx + 160], 0
	xor r14d, r14d
	lea rax, [rcx + 144]
	mov qword ptr [rsp + 32], rax
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
	mov rdi, qword ptr [rsp + 32]
	mov rsi, r14
	movss dword ptr [rsp + 16], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 16]
	mov rcx, qword ptr [rsp + 8]
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
	mov rcx, qword ptr [rsp + 8]
	jmp .LBB1952_35
.LBB1952_36:
	movups xmm0, xmmword ptr [rcx + 96]
	mov rax, qword ptr [rcx + 8]
	mov qword ptr [rsp + 208], rax
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
	mov qword ptr [rsp + 200], rax
	mov qword ptr [rcx + 128], rax
	mov rdx, qword ptr [rcx + 56]
	movups xmm1, xmmword ptr [rcx + 144]
	movupd xmm2, xmmword ptr [rcx + 40]
	mov rax, qword ptr [rcx + 40]
	movups xmmword ptr [rcx + 32], xmm0
	movupd xmmword ptr [rcx + 136], xmm2
	movups xmmword ptr [rcx + 48], xmm1
	mov qword ptr [rsp + 192], rdx
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
	mov qword ptr [rsp + 184], r9
	mov qword ptr [rsi + 176], r9
	mov rcx, qword ptr [rsi + 88]
	mov qword ptr [rsi + 88], r14
	mov qword ptr [rsi + 184], rcx
	test rdi, rdi
	je .LBB1952_99
	mov rsi, qword ptr [rsp + 8]
	movss xmm1, dword ptr [rsi + 320]
	cmp rax, r8
	cmovb r8, rax
	mulss xmm1, xmm1
	cmp rdx, r8
	cmovb r8, rdx
	movaps xmm0, xmmword ptr [rsp + 64]
	mulss xmm0, xmm0
	movaps xmmword ptr [rsp + 64], xmm0
	shufps xmm0, xmm0, 0
	movaps xmmword ptr [rsp + 80], xmm1
	shufps xmm1, xmm1, 0
	cmp rcx, r8
	cmovb r8, rcx
	mov qword ptr [rsp + 216], r8
	xor edx, edx
	mov qword ptr [rsp + 224], rdi
	movaps xmmword ptr [rsp + 416], xmm0
	movaps xmmword ptr [rsp + 496], xmm1
	jmp .LBB1952_38
.LBB1952_97:
	mov rdi, qword ptr [rsp + 224]
	.p2align	4
.LBB1952_98:
	inc rdx
	cmp rdx, rdi
	je .LBB1952_99
.LBB1952_38:
	mov rax, qword ptr [rsp + 8]
	mov rcx, qword ptr [rax + 16]
	mov qword ptr [rsp + 352], rcx
	cmp rdx, rcx
	jae .LBB1952_98
	mov rcx, qword ptr [rax + 40]
	mov qword ptr [rsp + 344], rcx
	cmp rdx, rcx
	jae .LBB1952_98
	mov rcx, qword ptr [rax + 64]
	mov rsi, qword ptr [rax + 88]
	mov qword ptr [rsp + 336], rcx
	cmp rdx, rcx
	setb al
	mov qword ptr [rsp + 328], rsi
	cmp rdx, rsi
	setb cl
	and cl, al
	cmp cl, 1
	mov rsi, qword ptr [rsp + 8]
	jne .LBB1952_98
	mov rax, qword ptr [rsi + 8]
	mov qword ptr [rsp + 320], rax
	movss xmm9, dword ptr [rax + 4*rdx]
	mov rax, qword ptr [rsi + 32]
	mov rcx, qword ptr [rsi + 56]
	mov qword ptr [rsp + 312], rax
	movss xmm10, dword ptr [rax + 4*rdx]
	mov rax, qword ptr [rsi + 80]
	mov qword ptr [rsp + 304], rcx
	movss xmm0, dword ptr [rcx + 4*rdx]
	mov qword ptr [rsp + 240], rdx
	mov qword ptr [rsp + 296], rax
	movss xmm1, dword ptr [rax + 4*rdx]
	movss dword ptr [rsp + 152], xmm9
	movss dword ptr [rsp + 156], xmm10
	movss dword ptr [rsp + 160], xmm0
	movss dword ptr [rsp + 164], xmm1
	movss xmm0, dword ptr [rsi + 280]
	movaps xmm1, xmm9
	mulss xmm1, xmm0
	xorps xmm7, xmm7
	maxss xmm1, xmm7
	xorps xmm2, xmm2
	cvtss2sd xmm2, xmm1
	cvttsd2si rax, xmm2
	mov rcx, rax
	sar rcx, 63
	movapd xmm3, xmm2
	movsd xmm4, qword ptr [rip + .LCPI1952_3]
	subsd xmm3, xmm4
	cvttsd2si r9, xmm3
	and r9, rcx
	or r9, rax
	xorpd xmm8, xmm8
	ucomisd xmm2, xmm8
	mov edi, 0
	cmovb r9, rdi
	movsd xmm3, qword ptr [rip + .LCPI1952_4]
	ucomisd xmm2, xmm3
	mov rax, qword ptr [rsi + 264]
	mov r8, -1
	cmova r9, r8
	mov qword ptr [rsp + 288], rax
	sub rax, 1
	cmovb rax, rdi
	xorps xmm6, xmm6
	movups xmmword ptr [rsp + 396], xmm6
	cmp rax, r9
	cmovb r9, rax
	movss xmm5, dword ptr [rip + .LCPI1952_5]
	ucomiss xmm1, xmm5
	cmovae r9, rdi
	mulss xmm0, xmm10
	maxss xmm0, xmm7
	xorps xmm1, xmm1
	cvtss2sd xmm1, xmm0
	cvttsd2si rcx, xmm1
	mov rdx, rcx
	sar rdx, 63
	movapd xmm2, xmm1
	subsd xmm2, xmm4
	cvttsd2si r10, xmm2
	and r10, rdx
	or r10, rcx
	ucomisd xmm1, xmm8
	cmovb r10, rdi
	ucomisd xmm1, xmm3
	mov rcx, qword ptr [rsi + 272]
	cmova r10, r8
	sub rcx, 1
	cmovb rcx, rdi
	cmp rcx, r10
	cmovb r10, rcx
	ucomiss xmm0, xmm5
	movaps xmmword ptr [rsp + 384], xmm6
	cmovae r10, rdi
	mov rdx, r9
	sub rdx, 1
	cmovb rdx, rdi
	mov qword ptr [rsp + 272], rdx
	mov r12, r10
	sub r12, 1
	cmovb r12, rdi
	inc r10
	cmp rcx, r10
	cmovb r10, rcx
	mov qword ptr [rsp + 280], r10
	cmp r12, r10
	ja .LBB1952_95
	inc r9
	cmp rax, r9
	cmovb r9, rax
	inc r9
	mov rax, qword ptr [rsp + 8]
	mov rcx, qword ptr [rax + 200]
	mov qword ptr [rsp + 248], rcx
	mov rdx, qword ptr [rax + 208]
	movaps xmm4, xmm9
	unpcklps xmm4, xmm10
	shufps xmm10, xmm10, 0
	shufps xmm9, xmm9, 0
	xorps xmm5, xmm5
	xorps xmm6, xmm6
	xorps xmm7, xmm7
	mov qword ptr [rsp + 264], r9
	mov qword ptr [rsp + 256], rdx
	movaps xmmword ptr [rsp + 448], xmm4
	movaps xmmword ptr [rsp + 512], xmm9
	movaps xmmword ptr [rsp + 432], xmm10
	jmp .LBB1952_45
.LBB1952_43:
	addps xmm5, xmm1
	.p2align	4
.LBB1952_44:
	mov rax, qword ptr [rsp + 360]
	cmp rax, qword ptr [rsp + 280]
	lea r12, [rax + 1]
	mov r9, qword ptr [rsp + 264]
	mov rdx, qword ptr [rsp + 256]
	je .LBB1952_94
.LBB1952_45:
	mov rax, qword ptr [rsp + 288]
	imul rax, r12
	mov rcx, qword ptr [rsp + 272]
	add rcx, rax
	cmp rcx, rdx
	mov qword ptr [rsp + 360], r12
	jae .LBB1952_46
	add rax, r9
	mov r10d, 0
	mov edi, 0
	cmp rax, rdx
	jae .LBB1952_49
	mov rdx, qword ptr [rsp + 248]
	mov edi, dword ptr [rdx + 4*rcx]
	mov r10d, dword ptr [rdx + 4*rax]
	jmp .LBB1952_49
	.p2align	4
.LBB1952_46:
	xor r10d, r10d
	xor edi, edi
.LBB1952_49:
	mov r9, r10
	sub r9, rdi
	setb bl
	cmp r10, qword ptr [rsp + 352]
	seta al
	or al, bl
	mov rax, qword ptr [rsp + 320]
	lea r13, [rax + 4*rdi]
	mov r11, r9
	mov ebp, 0
	cmovne r11, rbp
	mov r8d, 4
	cmovne r13, r8
	cmp r10, qword ptr [rsp + 344]
	seta al
	or al, bl
	mov r14, r9
	cmovne r14, rbp
	mov rax, qword ptr [rsp + 312]
	lea rax, [rax + 4*rdi]
	cmovne rax, r8
	mov rcx, r14
	shr rcx, 3
	cmp r10, qword ptr [rsp + 336]
	seta dl
	or dl, bl
	mov rdx, qword ptr [rsp + 304]
	lea rdx, [rdx + 4*rdi]
	mov r12, r9
	cmovne r12, rbp
	cmovne rdx, r8
	mov rsi, r12
	shr rsi, 3
	cmp r10, qword ptr [rsp + 328]
	seta r10b
	or r10b, bl
	mov r10, qword ptr [rsp + 296]
	lea r15, [r10 + 4*rdi]
	cmovne r9, rbp
	cmovne r15, r8
	mov r10, r9
	shr r10, 3
	mov rdi, r11
	shr rdi, 3
	cmp rcx, rdi
	cmovb rdi, rcx
	cmp rsi, rdi
	cmovb rdi, rsi
	cmp r10, rdi
	cmovb rdi, r10
	test rdi, rdi
	je .LBB1952_50
	movaps xmmword ptr [rsp + 464], xmm7
	movss dword ptr [rsp + 108], xmm6
	movaps xmmword ptr [rsp + 480], xmm5
	shl rdi, 5
	xorps xmm11, xmm11
	xor r10d, r10d
	xorps xmm0, xmm0
	movaps xmmword ptr [rsp + 128], xmm0
	xorps xmm7, xmm7
	movaps xmmword ptr [rsp + 112], xmm0
	movaps xmmword ptr [rsp + 32], xmm0
	xorps xmm15, xmm15
	xorps xmm9, xmm9
	xorps xmm4, xmm4
	xorps xmm10, xmm10
	xorps xmm5, xmm5
	xorpd xmm8, xmm8
	xorpd xmm2, xmm2
	xorps xmm12, xmm12
	xorpd xmm3, xmm3
	.p2align	4
.LBB1952_52:
	movaps xmmword ptr [rsp + 16], xmm7
	movaps xmmword ptr [rsp + 528], xmm12
	movaps xmmword ptr [rsp + 544], xmm10
	movaps xmmword ptr [rsp + 560], xmm9
	movaps xmmword ptr [rsp + 576], xmm11
	movapd xmmword ptr [rsp + 592], xmm8
	movups xmm6, xmmword ptr [r13 + r10]
	movaps xmm12, xmmword ptr [rsp + 512]
	movaps xmm9, xmm12
	subps xmm9, xmm6
	movups xmm8, xmmword ptr [rax + r10]
	movaps xmm10, xmmword ptr [rsp + 432]
	subps xmm10, xmm8
	movaps xmm0, xmm9
	mulps xmm0, xmm9
	movaps xmm1, xmm10
	mulps xmm1, xmm10
	addps xmm1, xmm0
	movaps xmm11, xmm1
	movaps xmm13, xmmword ptr [rsp + 496]
	movaps xmm0, xmm13
	cmpleps xmm0, xmm1
	xorps xmm7, xmm7
	cmpltps xmm7, xmm1
	cmpltps xmm1, xmmword ptr [rsp + 416]
	andps xmm1, xmm0
	movups xmm14, xmmword ptr [r13 + r10 + 16]
	movaps xmm0, xmmword ptr [rip + .LCPI1952_6]
	andps xmm7, xmm0
	andps xmm7, xmm1
	movups xmm1, xmmword ptr [rax + r10 + 16]
	cmpltps xmm11, xmm13
	andps xmm11, xmm0
	mulps xmm9, xmm11
	movapd xmm0, xmm3
	movaps xmm3, xmm5
	movaps xmm5, xmm4
	movapd xmm4, xmm2
	movaps xmm2, xmm15
	movaps xmm15, xmmword ptr [rsp + 112]
	addps xmm15, xmm9
	movaps xmmword ptr [rsp + 112], xmm15
	movaps xmm15, xmm2
	movapd xmm2, xmm4
	movaps xmm4, xmm5
	movaps xmm5, xmm3
	movapd xmm3, xmm0
	mulps xmm11, xmm10
	movaps xmm9, xmmword ptr [rsp + 128]
	addps xmm9, xmm11
	movaps xmmword ptr [rsp + 128], xmm9
	mulps xmm6, xmm7
	addps xmm3, xmm6
	mulps xmm8, xmm7
	addps xmm2, xmm8
	movups xmm6, xmmword ptr [rdx + r10]
	mulps xmm6, xmm7
	addps xmm5, xmm6
	movups xmm6, xmmword ptr [r15 + r10]
	mulps xmm6, xmm7
	addps xmm4, xmm6
	addps xmm15, xmm7
	movaps xmm7, xmm12
	movaps xmm12, xmmword ptr [rsp + 528]
	subps xmm7, xmm14
	movaps xmm8, xmmword ptr [rsp + 432]
	subps xmm8, xmm1
	movaps xmm6, xmm7
	mulps xmm6, xmm7
	movaps xmm9, xmm8
	mulps xmm9, xmm8
	addps xmm9, xmm6
	movaps xmm10, xmm9
	movaps xmm11, xmm13
	cmpleps xmm11, xmm9
	xorps xmm6, xmm6
	cmpltps xmm6, xmm9
	cmpltps xmm9, xmmword ptr [rsp + 416]
	andps xmm9, xmm11
	movaps xmm11, xmmword ptr [rsp + 576]
	movaps xmm0, xmmword ptr [rip + .LCPI1952_6]
	andps xmm6, xmm0
	andps xmm6, xmm9
	movaps xmm9, xmmword ptr [rsp + 560]
	cmpltps xmm10, xmm13
	andps xmm10, xmm0
	mulps xmm7, xmm10
	movaps xmm0, xmmword ptr [rsp + 16]
	addps xmm0, xmm7
	movaps xmmword ptr [rsp + 16], xmm0
	movaps xmm7, xmmword ptr [rsp + 16]
	mulps xmm10, xmm8
	movaps xmm8, xmmword ptr [rsp + 592]
	addps xmm11, xmm10
	movaps xmm10, xmmword ptr [rsp + 544]
	mulps xmm14, xmm6
	addps xmm12, xmm14
	mulps xmm1, xmm6
	addps xmm8, xmm1
	movups xmm0, xmmword ptr [rdx + r10 + 16]
	mulps xmm0, xmm6
	addps xmm10, xmm0
	movups xmm0, xmmword ptr [r15 + r10 + 16]
	mulps xmm0, xmm6
	addps xmm9, xmm0
	movaps xmm0, xmmword ptr [rsp + 32]
	addps xmm0, xmm6
	movaps xmmword ptr [rsp + 32], xmm0
	add r10, 32
	cmp rdi, r10
	jne .LBB1952_52
	movaps xmm0, xmm3
	unpcklps xmm0, xmm2
	movaps xmm1, xmm2
	shufps xmm1, xmm3, 17
	movaps xmm6, xmm5
	unpcklps xmm6, xmm4
	movlhps xmm0, xmm6
	movaps xmm6, xmm4
	shufps xmm6, xmm5, 17
	shufps xmm1, xmm6, 34
	addps xmm1, xmm0
	movaps xmm0, xmm3
	unpckhps xmm0, xmm2
	movaps xmm6, xmm4
	unpckhpd xmm6, xmm5
	shufps xmm0, xmm6, 36
	addps xmm0, xmm1
	shufps xmm2, xmm3, 51
	shufps xmm4, xmm5, 255
	shufps xmm2, xmm4, 34
	addps xmm2, xmm0
	movaps xmm0, xmm12
	unpcklps xmm0, xmm8
	movaps xmm1, xmm9
	movlhps xmm1, xmm10
	shufps xmm0, xmm1, 36
	addps xmm0, xmm2
	movaps xmm1, xmm8
	shufps xmm1, xmm12, 17
	movaps xmm2, xmm9
	shufps xmm2, xmm10, 85
	shufps xmm1, xmm2, 34
	addps xmm1, xmm0
	movaps xmm0, xmm12
	unpckhps xmm0, xmm8
	movaps xmm2, xmm9
	unpckhpd xmm2, xmm10
	shufps xmm0, xmm2, 36
	addps xmm0, xmm1
	shufps xmm8, xmm12, 51
	shufps xmm9, xmm10, 255
	shufps xmm8, xmm9, 34
	addps xmm8, xmm0
	movaps xmm0, xmm15
	shufps xmm0, xmm15, 85
	addss xmm0, xmm15
	movaps xmm1, xmm15
	unpckhpd xmm1, xmm15
	addss xmm1, xmm0
	shufps xmm15, xmm15, 255
	addss xmm15, xmm1
	movaps xmm2, xmmword ptr [rsp + 32]
	addss xmm15, xmm2
	movaps xmm0, xmm2
	shufps xmm0, xmm2, 85
	addss xmm0, xmm15
	movaps xmm1, xmm2
	unpckhpd xmm1, xmm2
	addss xmm1, xmm0
	shufps xmm2, xmm2, 255
	addss xmm2, xmm1
	movaps xmm4, xmmword ptr [rsp + 112]
	movaps xmm0, xmm4
	movaps xmm3, xmmword ptr [rsp + 128]
	unpcklps xmm0, xmm3
	movaps xmm1, xmm3
	shufps xmm1, xmm4, 17
	shufps xmm1, xmm4, 226
	addps xmm1, xmm0
	movaps xmm0, xmm4
	unpckhps xmm0, xmm3
	addps xmm0, xmm1
	shufps xmm3, xmm4, 255
	shufps xmm3, xmm4, 226
	addps xmm3, xmm0
	movaps xmm0, xmm7
	unpcklps xmm0, xmm11
	addps xmm0, xmm3
	movaps xmm1, xmm11
	shufps xmm1, xmm7, 17
	shufps xmm1, xmm7, 226
	addps xmm1, xmm0
	movaps xmm0, xmm7
	unpckhps xmm0, xmm11
	addps xmm0, xmm1
	shufps xmm11, xmm7, 255
	shufps xmm11, xmm7, 226
	addps xmm11, xmm0
	movaps xmm4, xmmword ptr [rsp + 448]
	movaps xmm5, xmmword ptr [rsp + 480]
	movss xmm6, dword ptr [rsp + 108]
	movaps xmm7, xmmword ptr [rsp + 464]
	jmp .LBB1952_54
	.p2align	4
.LBB1952_50:
	xorpd xmm8, xmm8
	xorpd xmm2, xmm2
	xorps xmm11, xmm11
.LBB1952_54:
	addps xmm5, xmm11
	addss xmm6, xmm2
	mov ecx, r14d
	and ecx, 7
	mov esi, r12d
	and esi, 7
	mov r10d, r9d
	and r10d, 7
	mov edi, r11d
	and edi, 7
	cmp rcx, rdi
	cmovb rdi, rcx
	addps xmm7, xmm8
	cmp rsi, rdi
	cmovb rdi, rsi
	cmp r10, rdi
	cmovb rdi, r10
	test rdi, rdi
	je .LBB1952_44
	and r11d, -8
	and r14d, -8
	and r12d, -8
	and r9d, -8
	movss xmm0, dword ptr [r13 + 4*r11]
	movss xmm1, dword ptr [rax + 4*r14]
	unpcklps xmm0, xmm1
	movaps xmm1, xmm4
	subps xmm1, xmm0
	movaps xmm3, xmm1
	mulps xmm3, xmm1
	movaps xmm2, xmm3
	shufps xmm2, xmm3, 85
	addss xmm2, xmm3
	movaps xmm3, xmmword ptr [rsp + 80]
	ucomiss xmm3, xmm2
	jbe .LBB1952_56
	addps xmm5, xmm1
	jmp .LBB1952_59
	.p2align	4
.LBB1952_56:
	movaps xmm1, xmmword ptr [rsp + 64]
	ucomiss xmm1, xmm2
	jbe .LBB1952_59
	xorps xmm1, xmm1
	ucomiss xmm2, xmm1
	jbe .LBB1952_59
	movss xmm1, dword ptr [rdx + 4*r12]
	movss xmm2, dword ptr [r15 + 4*r9]
	unpcklps xmm1, xmm2
	movlhps xmm0, xmm1
	addps xmm7, xmm0
	addss xmm6, dword ptr [rip + .LCPI1952_2]
.LBB1952_59:
	cmp edi, 1
	je .LBB1952_44
	movss xmm0, dword ptr [r13 + 4*r11 + 4]
	movss xmm1, dword ptr [rax + 4*r14 + 4]
	unpcklps xmm0, xmm1
	movaps xmm1, xmm4
	subps xmm1, xmm0
	movaps xmm3, xmm1
	mulps xmm3, xmm1
	movaps xmm2, xmm3
	shufps xmm2, xmm3, 85
	addss xmm2, xmm3
	movaps xmm3, xmmword ptr [rsp + 80]
	ucomiss xmm3, xmm2
	jbe .LBB1952_61
	addps xmm5, xmm1
	jmp .LBB1952_65
.LBB1952_61:
	movaps xmm1, xmmword ptr [rsp + 64]
	ucomiss xmm1, xmm2
	jbe .LBB1952_65
	xorps xmm1, xmm1
	ucomiss xmm2, xmm1
	jbe .LBB1952_65
	movss xmm1, dword ptr [rdx + 4*r12 + 4]
	movss xmm2, dword ptr [r15 + 4*r9 + 4]
	unpcklps xmm1, xmm2
	movlhps xmm0, xmm1
	addps xmm7, xmm0
	addss xmm6, dword ptr [rip + .LCPI1952_2]
.LBB1952_65:
	cmp edi, 2
	je .LBB1952_44
	movss xmm0, dword ptr [r13 + 4*r11 + 8]
	movss xmm1, dword ptr [rax + 4*r14 + 8]
	unpcklps xmm0, xmm1
	movaps xmm1, xmm4
	subps xmm1, xmm0
	movaps xmm3, xmm1
	mulps xmm3, xmm1
	movaps xmm2, xmm3
	shufps xmm2, xmm3, 85
	addss xmm2, xmm3
	movaps xmm3, xmmword ptr [rsp + 80]
	ucomiss xmm3, xmm2
	jbe .LBB1952_67
	addps xmm5, xmm1
	jmp .LBB1952_71
.LBB1952_67:
	movaps xmm1, xmmword ptr [rsp + 64]
	ucomiss xmm1, xmm2
	jbe .LBB1952_71
	xorps xmm1, xmm1
	ucomiss xmm2, xmm1
	jbe .LBB1952_71
	movss xmm1, dword ptr [rdx + 4*r12 + 8]
	movss xmm2, dword ptr [r15 + 4*r9 + 8]
	unpcklps xmm1, xmm2
	movlhps xmm0, xmm1
	addps xmm7, xmm0
	addss xmm6, dword ptr [rip + .LCPI1952_2]
.LBB1952_71:
	cmp edi, 3
	je .LBB1952_44
	movss xmm0, dword ptr [r13 + 4*r11 + 12]
	movss xmm1, dword ptr [rax + 4*r14 + 12]
	unpcklps xmm0, xmm1
	movaps xmm1, xmm4
	subps xmm1, xmm0
	movaps xmm3, xmm1
	mulps xmm3, xmm1
	movaps xmm2, xmm3
	shufps xmm2, xmm3, 85
	addss xmm2, xmm3
	movaps xmm3, xmmword ptr [rsp + 80]
	ucomiss xmm3, xmm2
	jbe .LBB1952_73
	addps xmm5, xmm1
	jmp .LBB1952_77
.LBB1952_73:
	movaps xmm1, xmmword ptr [rsp + 64]
	ucomiss xmm1, xmm2
	jbe .LBB1952_77
	xorps xmm1, xmm1
	ucomiss xmm2, xmm1
	jbe .LBB1952_77
	movss xmm1, dword ptr [rdx + 4*r12 + 12]
	movss xmm2, dword ptr [r15 + 4*r9 + 12]
	unpcklps xmm1, xmm2
	movlhps xmm0, xmm1
	addps xmm7, xmm0
	addss xmm6, dword ptr [rip + .LCPI1952_2]
.LBB1952_77:
	cmp edi, 4
	je .LBB1952_44
	movss xmm0, dword ptr [r13 + 4*r11 + 16]
	movss xmm1, dword ptr [rax + 4*r14 + 16]
	unpcklps xmm0, xmm1
	movaps xmm1, xmm4
	subps xmm1, xmm0
	movaps xmm3, xmm1
	mulps xmm3, xmm1
	movaps xmm2, xmm3
	shufps xmm2, xmm3, 85
	addss xmm2, xmm3
	movaps xmm3, xmmword ptr [rsp + 80]
	ucomiss xmm3, xmm2
	jbe .LBB1952_79
	addps xmm5, xmm1
	jmp .LBB1952_83
.LBB1952_79:
	movaps xmm1, xmmword ptr [rsp + 64]
	ucomiss xmm1, xmm2
	jbe .LBB1952_83
	xorps xmm1, xmm1
	ucomiss xmm2, xmm1
	jbe .LBB1952_83
	movss xmm1, dword ptr [rdx + 4*r12 + 16]
	movss xmm2, dword ptr [r15 + 4*r9 + 16]
	unpcklps xmm1, xmm2
	movlhps xmm0, xmm1
	addps xmm7, xmm0
	addss xmm6, dword ptr [rip + .LCPI1952_2]
.LBB1952_83:
	cmp edi, 5
	je .LBB1952_44
	movss xmm0, dword ptr [r13 + 4*r11 + 20]
	movss xmm1, dword ptr [rax + 4*r14 + 20]
	unpcklps xmm0, xmm1
	movaps xmm1, xmm4
	subps xmm1, xmm0
	movaps xmm3, xmm1
	mulps xmm3, xmm1
	movaps xmm2, xmm3
	shufps xmm2, xmm3, 85
	addss xmm2, xmm3
	movaps xmm3, xmmword ptr [rsp + 80]
	ucomiss xmm3, xmm2
	jbe .LBB1952_85
	addps xmm5, xmm1
	jmp .LBB1952_89
.LBB1952_85:
	movaps xmm1, xmmword ptr [rsp + 64]
	ucomiss xmm1, xmm2
	jbe .LBB1952_89
	xorps xmm1, xmm1
	ucomiss xmm2, xmm1
	jbe .LBB1952_89
	movss xmm1, dword ptr [rdx + 4*r12 + 20]
	movss xmm2, dword ptr [r15 + 4*r9 + 20]
	unpcklps xmm1, xmm2
	movlhps xmm0, xmm1
	addps xmm7, xmm0
	addss xmm6, dword ptr [rip + .LCPI1952_2]
.LBB1952_89:
	cmp edi, 6
	je .LBB1952_44
	movss xmm0, dword ptr [r13 + 4*r11 + 24]
	movss xmm1, dword ptr [rax + 4*r14 + 24]
	unpcklps xmm0, xmm1
	movaps xmm1, xmm4
	subps xmm1, xmm0
	movaps xmm3, xmm1
	mulps xmm3, xmm1
	movaps xmm2, xmm3
	shufps xmm2, xmm3, 85
	addss xmm2, xmm3
	movaps xmm3, xmmword ptr [rsp + 80]
	ucomiss xmm3, xmm2
	ja .LBB1952_43
	movaps xmm1, xmmword ptr [rsp + 64]
	ucomiss xmm1, xmm2
	jbe .LBB1952_44
	xorps xmm1, xmm1
	ucomiss xmm2, xmm1
	jbe .LBB1952_44
	movss xmm1, dword ptr [rdx + 4*r12 + 24]
	movss xmm2, dword ptr [r15 + 4*r9 + 24]
	unpcklps xmm1, xmm2
	movlhps xmm0, xmm1
	addps xmm7, xmm0
	addss xmm6, dword ptr [rip + .LCPI1952_2]
	jmp .LBB1952_44
.LBB1952_94:
	movaps xmmword ptr [rsp + 384], xmm7
	movss dword ptr [rsp + 400], xmm6
	movlps qword ptr [rsp + 404], xmm5
.LBB1952_95:
	lea rdi, [rsp + 168]
	mov rsi, qword ptr [rsp + 232]
	movss xmm0, dword ptr [rsp + 104]
	movss xmm1, dword ptr [rsp + 60]
	lea rdx, [rsp + 368]
	lea rcx, [rsp + 152]
	lea r8, [rsp + 384]
	call swarm::rules::finish
	mov rdx, qword ptr [rsp + 240]
	cmp rdx, qword ptr [rsp + 216]
	jae .LBB1952_97
	movss xmm0, dword ptr [rsp + 168]
	movss xmm1, dword ptr [rsp + 172]
	movss xmm2, dword ptr [rsp + 176]
	movss xmm3, dword ptr [rsp + 180]
	mov rax, qword ptr [rsp + 208]
	movss dword ptr [rax + 4*rdx], xmm0
	mov rax, qword ptr [rsp + 200]
	movss dword ptr [rax + 4*rdx], xmm1
	mov rax, qword ptr [rsp + 192]
	movss dword ptr [rax + 4*rdx], xmm2
	mov rax, qword ptr [rsp + 184]
	movss dword ptr [rax + 4*rdx], xmm3
	jmp .LBB1952_97
.LBB1952_99:
	add rsp, 616
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
