<swarm::flock::Flock>::step_grid:
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
	sub rsp, 296
	.cfi_def_cfa_offset 352
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r13, rdi
	movss xmm5, dword ptr [rdi + 288]
	movss xmm6, dword ptr [rdi + 292]
	movss dword ptr [rsp + 60], xmm6
	mov eax, dword ptr [rdi + 312]
	mov dword ptr [rsp + 288], eax
	mov rax, qword ptr [rdi + 304]
	mov qword ptr [rsp + 280], rax
	movss xmm0, dword ptr [rdi + 316]
	mov rax, qword ptr [rdi + 8]
	mov qword ptr [rsp + 120], rax
	mov rax, qword ptr [rdi + 16]
	mov qword ptr [rsp + 112], rax
	mov rax, qword ptr [rdi + 32]
	mov qword ptr [rsp + 104], rax
	mov rbp, qword ptr [rdi + 40]
	movss xmm1, dword ptr [rip + .LCPI1951_0]
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
	mulss xmm0, dword ptr [rip + .LCPI1951_1]
	movss xmm1, dword ptr [rip + .LCPI1951_2]
	divss xmm1, xmm0
	movss dword ptr [rsp + 8], xmm1
	movss dword ptr [rdi + 280], xmm1
	movss dword ptr [rsp + 140], xmm5
	movaps xmm0, xmm5
	mulss xmm0, xmm1
	mov r14, qword ptr [rip + ceilf@GOTPCREL]
	call r14
	xorps xmm1, xmm1
	cvtss2sd xmm1, xmm0
	cvttsd2si rax, xmm1
	mov rcx, rax
	sar rcx, 63
	movapd xmm2, xmm1
	subsd xmm2, qword ptr [rip + .LCPI1951_3]
	cvttsd2si rdx, xmm2
	and rdx, rcx
	or rdx, rax
	xor ebx, ebx
	xorpd xmm2, xmm2
	ucomisd xmm1, xmm2
	cmovb rdx, rbx
	ucomisd xmm1, qword ptr [rip + .LCPI1951_4]
	mov r12, -1
	cmova rdx, r12
	cmp rdx, 1
	adc rdx, 0
	movss xmm1, dword ptr [rip + .LCPI1951_5]
	ucomiss xmm1, xmm0
	mov r15d, 1
	cmovbe rdx, r15
	xorps xmm1, xmm1
	ucomiss xmm0, xmm1
	cmovb rdx, r15
	mov qword ptr [r13 + 264], rdx
	movss xmm0, dword ptr [rsp + 8]
	mulss xmm0, dword ptr [rsp + 60]
	call r14
	xorps xmm1, xmm1
	cvtss2sd xmm1, xmm0
	cvttsd2si rax, xmm1
	mov rcx, rax
	sar rcx, 63
	movapd xmm2, xmm1
	subsd xmm2, qword ptr [rip + .LCPI1951_3]
	cvttsd2si rdx, xmm2
	and rdx, rcx
	or rdx, rax
	xorpd xmm2, xmm2
	ucomisd xmm1, xmm2
	cmovb rdx, rbx
	ucomisd xmm1, qword ptr [rip + .LCPI1951_4]
	cmova rdx, r12
	cmp rdx, 1
	adc rdx, 0
	movss xmm1, dword ptr [rip + .LCPI1951_5]
	ucomiss xmm1, xmm0
	cmovbe rdx, r15
	xorps xmm1, xmm1
	ucomiss xmm0, xmm1
	cmovb rdx, r15
	mov qword ptr [r13 + 272], rdx
	lea rdi, [r13 + 192]
	mov rsi, qword ptr [rsp + 120]
	mov rdx, qword ptr [rsp + 112]
	mov rcx, qword ptr [rsp + 104]
	mov r8, rbp
	call <swarm::grid::Grid>::fill
	mov rbp, qword ptr [r13 + 16]
	test rbp, rbp
	je .LBB1951_39
	mov rsi, r13
	lea rax, [r13 + 316]
	mov qword ptr [rsp + 256], rax
	mov rax, qword ptr [r13 + 8]
	mov qword ptr [rsp + 96], rax
	mov rax, qword ptr [r13 + 32]
	mov qword ptr [rsp + 88], rax
	mov r13, qword ptr [r13 + 40]
	mov rax, qword ptr [rsi + 64]
	mov rbx, qword ptr [rsi + 88]
	cmp rax, rbx
	cmovb rbx, rax
	mov rax, qword ptr [rsi + 80]
	mov qword ptr [rsp + 80], rax
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 72], rax
	mov rax, qword ptr [rsi + 264]
	movss xmm0, dword ptr [rsi + 280]
	movss dword ptr [rsp + 64], xmm0
	xor r12d, r12d
	mov qword ptr [rsp + 120], rax
	sub rax, 1
	cmovb rax, r12
	mov qword ptr [rsp + 144], rax
	mov rax, qword ptr [rsi + 272]
	sub rax, 1
	cmovb rax, r12
	mov qword ptr [rsp + 248], rax
	movss xmm0, dword ptr [rsi + 320]
	mulss xmm0, xmm0
	movss dword ptr [rsp + 24], xmm0
	movss xmm0, dword ptr [rsi + 316]
	mulss xmm0, xmm0
	movss dword ptr [rsp + 20], xmm0
	mov rax, qword ptr [rsi + 136]
	mov rcx, qword ptr [rsi + 112]
	cmp rax, rcx
	cmovb rcx, rax
	mov rax, qword ptr [rsi + 160]
	cmp rax, rcx
	cmovb rcx, rax
	cmp r13, rbx
	mov rdx, rbx
	cmovb rdx, r13
	mov rax, qword ptr [rsi + 184]
	cmp rax, rcx
	cmovb rcx, rax
	mov qword ptr [rsp + 240], rcx
	mov r14, qword ptr [rsi + 208]
	mov rax, qword ptr [rsi + 200]
	mov qword ptr [rsp + 112], rax
	mov rax, qword ptr [rsi + 256]
	mov qword ptr [rsp + 104], rax
	mov rax, qword ptr [rsi + 248]
	mov rcx, qword ptr [rsi + 104]
	mov qword ptr [rsp + 224], rcx
	mov rcx, qword ptr [rsi + 128]
	mov qword ptr [rsp + 216], rcx
	mov rcx, qword ptr [rsi + 152]
	mov qword ptr [rsp + 208], rcx
	mov rcx, qword ptr [rsi + 176]
	mov qword ptr [rsp + 200], rcx
	mov qword ptr [rsp + 160], rax
	add rax, 4
	mov qword ptr [rsp + 152], rax
	mov qword ptr [rsp + 232], rdx
	jmp .LBB1951_2
	.p2align	4
.LBB1951_37:
	mov rdx, qword ptr [rsp + 232]
.LBB1951_38:
	inc r12
	cmp r12, rbp
	je .LBB1951_39
.LBB1951_2:
	cmp r12, rdx
	jae .LBB1951_38
	mov rax, qword ptr [rsp + 96]
	movss xmm2, dword ptr [rax + 4*r12]
	mov rax, qword ptr [rsp + 88]
	movss xmm3, dword ptr [rax + 4*r12]
	movss dword ptr [rsp + 28], xmm3
	mov rax, qword ptr [rsp + 72]
	movss xmm0, dword ptr [rax + 4*r12]
	mov rax, qword ptr [rsp + 80]
	movss xmm1, dword ptr [rax + 4*r12]
	movss dword ptr [rsp + 168], xmm2
	movss dword ptr [rsp + 172], xmm3
	movss dword ptr [rsp + 176], xmm0
	movss dword ptr [rsp + 180], xmm1
	movss dword ptr [rsp + 68], xmm2
	movaps xmm0, xmm2
	mulss xmm0, dword ptr [rsp + 64]
	mov r15, qword ptr [rip + floorf@GOTPCREL]
	call r15
	mov rdx, r15
	xorps xmm1, xmm1
	maxss xmm0, xmm1
	xorps xmm1, xmm1
	cvtss2sd xmm1, xmm0
	cvttsd2si rax, xmm1
	mov rcx, rax
	sar rcx, 63
	movapd xmm2, xmm1
	movsd xmm3, qword ptr [rip + .LCPI1951_3]
	subsd xmm2, xmm3
	cvttsd2si r15, xmm2
	and r15, rcx
	or r15, rax
	xor eax, eax
	xorpd xmm2, xmm2
	ucomisd xmm1, xmm2
	cmovb r15, rax
	movsd xmm2, qword ptr [rip + .LCPI1951_4]
	ucomisd xmm1, xmm2
	mov rcx, -1
	cmova r15, rcx
	mov rcx, qword ptr [rsp + 144]
	cmp rcx, r15
	cmovb r15, rcx
	movss xmm1, dword ptr [rip + .LCPI1951_5]
	ucomiss xmm0, xmm1
	cmovae r15, rax
	movss xmm0, dword ptr [rsp + 28]
	mulss xmm0, dword ptr [rsp + 64]
	call rdx
	xorps xmm14, xmm14
	maxss xmm0, xmm14
	xorps xmm1, xmm1
	cvtss2sd xmm1, xmm0
	cvttsd2si rcx, xmm1
	mov rdx, rcx
	sar rdx, 63
	movapd xmm2, xmm1
	subsd xmm2, qword ptr [rip + .LCPI1951_3]
	cvttsd2si rax, xmm2
	and rax, rdx
	or rax, rcx
	xorpd xmm2, xmm2
	ucomisd xmm1, xmm2
	mov edx, 0
	cmovb rax, rdx
	ucomisd xmm1, qword ptr [rip + .LCPI1951_4]
	mov rcx, -1
	cmova rax, rcx
	mov rsi, qword ptr [rsp + 248]
	cmp rsi, rax
	cmovb rax, rsi
	ucomiss xmm0, dword ptr [rip + .LCPI1951_5]
	cmovae rax, rdx
	mov rcx, r15
	sub rcx, 1
	cmovb rcx, rdx
	xor r8d, r8d
	inc r15
	mov rdx, qword ptr [rsp + 144]
	cmp rdx, r15
	cmovb r15, rdx
	mov rdx, rax
	sub rdx, 1
	mov edi, 0
	mov qword ptr [rsp + 128], rdi
	cmovb rdx, r8
	inc rax
	cmp rsi, rax
	cmovb rax, rsi
	xorps xmm0, xmm0
	movups xmmword ptr [rsp + 44], xmm0
	movaps xmmword ptr [rsp + 32], xmm0
	mov rdi, qword ptr [rsp + 120]
	imul rdi, rax
	lea r8, [rdi + r15]
	inc r8
	add rdi, rcx
	inc r15
	mov qword ptr [rsp + 272], rdi
	cmp rdi, r14
	setb dil
	mov qword ptr [rsp + 264], r8
	cmp r8, r14
	setb sil
	and sil, dil
	mov byte ptr [rsp + 7], sil
	xor r10d, r10d
	xorpd xmm2, xmm2
	xorps xmm1, xmm1
	xorps xmm10, xmm10
	test r10, r10
	je .LBB1951_5
.LBB1951_6:
	mov qword ptr [rsp + 8], r9
	cmp r10, r9
	movss xmm12, dword ptr [rsp + 68]
	movss xmm13, dword ptr [rsp + 28]
	jne .LBB1951_9
	jmp .LBB1951_12
	.p2align	4
.LBB1951_5:
	movss xmm12, dword ptr [rsp + 68]
	movss xmm13, dword ptr [rsp + 28]
	jmp .LBB1951_12
	.p2align	4
.LBB1951_13:
	cmp rdx, rax
	ja .LBB1951_32
	cmp rdx, rax
	jb .LBB1951_15
	jmp .LBB1951_25
	.p2align	4
.LBB1951_23:
	cmp rdx, rax
	je .LBB1951_24
.LBB1951_15:
	mov rdi, rdx
	inc rdx
	imul rdi, qword ptr [rsp + 120]
	lea r9, [rdi + rcx]
	cmp r9, r14
	jae .LBB1951_23
	add rdi, r15
	cmp rdi, r14
	jae .LBB1951_23
	mov rsi, qword ptr [rsp + 112]
	mov r10d, dword ptr [rsi + 4*r9]
	mov edi, dword ptr [rsi + 4*rdi]
	cmp edi, r10d
	jb .LBB1951_23
	cmp qword ptr [rsp + 104], rdi
	jb .LBB1951_23
	cmp edi, r10d
	je .LBB1951_23
	sub rdi, r10
	mov rsi, qword ptr [rsp + 160]
	lea rsi, [rsi + 4*r10]
	lea rsi, [rsi + 4*rdi]
	mov qword ptr [rsp + 8], rsi
	shl rdi, 2
	mov rsi, qword ptr [rsp + 152]
	lea r10, [rsi + 4*r10]
	.p2align	4
.LBB1951_21:
	mov r11d, dword ptr [r10 - 4]
	cmp r12, r11
	setne sil
	cmp rbp, r11
	seta r8b
	cmp r13, r11
	seta r9b
	and r9b, r8b
	and r9b, sil
	cmp rbx, r11
	seta sil
	test r9b, sil
	jne .LBB1951_7
	add r10, 4
	add rdi, -4
	jne .LBB1951_21
	jmp .LBB1951_23
	.p2align	4
.LBB1951_7:
	mov rsi, qword ptr [rsp + 96]
	movss xmm3, dword ptr [rsi + 4*r11]
	mov rsi, qword ptr [rsp + 88]
	movss xmm4, dword ptr [rsi + 4*r11]
	movaps xmm5, xmm12
	subss xmm5, xmm3
	movaps xmm6, xmm13
	subss xmm6, xmm4
	movaps xmm7, xmm5
	mulss xmm7, xmm5
	movaps xmm8, xmm6
	mulss xmm8, xmm6
	addss xmm8, xmm7
	movaps xmm7, xmm8
	cmpltss xmm7, dword ptr [rsp + 20]
	movss xmm11, dword ptr [rsp + 24]
	movaps xmm9, xmm11
	cmpless xmm9, xmm8
	andps xmm9, xmm7
	ucomiss xmm8, xmm10
	movd edi, xmm9
	cmpltss xmm8, xmm11
	movss xmm7, dword ptr [rip + .LCPI1951_2]
	andps xmm8, xmm7
	mulss xmm5, xmm8
	addss xmm2, xmm5
	mulss xmm8, xmm6
	addss xmm14, xmm8
	mov rsi, qword ptr [rsp + 80]
	movss xmm5, dword ptr [rsi + 4*r11]
	mov rsi, qword ptr [rsp + 72]
	movss xmm6, dword ptr [rsi + 4*r11]
	unpcklps xmm6, xmm5
	seta r11b
	unpcklps xmm3, xmm4
	and r11b, dil
	movzx edi, r11b
	movlhps xmm3, xmm6
	xorps xmm4, xmm4
	cvtsi2ss xmm4, edi
	addss xmm1, xmm4
	shufps xmm4, xmm4, 0
	mulps xmm4, xmm3
	addps xmm0, xmm4
	cmp r10, qword ptr [rsp + 8]
	je .LBB1951_13
	movss dword ptr [rsp + 52], xmm2
	movss dword ptr [rsp + 56], xmm14
	movaps xmmword ptr [rsp + 32], xmm0
	movss dword ptr [rsp + 48], xmm1
	mov qword ptr [rsp + 128], 0
	jmp .LBB1951_9
	.p2align	4
.LBB1951_24:
	mov rdx, rax
.LBB1951_25:
	movss dword ptr [rsp + 52], xmm2
	movss dword ptr [rsp + 56], xmm14
	movaps xmmword ptr [rsp + 32], xmm0
	movss dword ptr [rsp + 48], xmm1
	cmp byte ptr [rsp + 7], 0
	je .LBB1951_35
	mov rsi, qword ptr [rsp + 112]
	mov rdi, qword ptr [rsp + 272]
	mov r10d, dword ptr [rsi + 4*rdi]
	mov rdi, qword ptr [rsp + 264]
	mov edi, dword ptr [rsi + 4*rdi]
	cmp edi, r10d
	jb .LBB1951_35
	cmp qword ptr [rsp + 104], rdi
	jb .LBB1951_35
	cmp edi, r10d
	je .LBB1951_35
	sub rdi, r10
	mov rsi, qword ptr [rsp + 160]
	lea rsi, [rsi + 4*r10]
	lea rsi, [rsi + 4*rdi]
	mov qword ptr [rsp + 8], rsi
	shl rdi, 2
	mov rsi, qword ptr [rsp + 152]
	lea r10, [rsi + 4*r10]
	.p2align	4
.LBB1951_30:
	mov r11d, dword ptr [r10 - 4]
	cmp r12, r11
	setne sil
	cmp rbp, r11
	seta r8b
	cmp r13, r11
	seta r9b
	and r9b, r8b
	and r9b, sil
	cmp rbx, r11
	seta sil
	test r9b, sil
	jne .LBB1951_34
	add r10, 4
	add rdi, -4
	jne .LBB1951_30
	jmp .LBB1951_35
	.p2align	4
.LBB1951_34:
	mov rsi, qword ptr [rsp + 96]
	movss xmm3, dword ptr [rsi + 4*r11]
	mov rsi, qword ptr [rsp + 88]
	movss xmm4, dword ptr [rsi + 4*r11]
	movaps xmm7, xmm12
	subss xmm7, xmm3
	movaps xmm6, xmm13
	subss xmm6, xmm4
	movaps xmm8, xmm7
	mulss xmm8, xmm7
	movaps xmm5, xmm6
	mulss xmm5, xmm6
	addss xmm5, xmm8
	movaps xmm8, xmm5
	cmpltss xmm8, dword ptr [rsp + 20]
	movss xmm11, dword ptr [rsp + 24]
	movaps xmm9, xmm11
	cmpless xmm9, xmm5
	andps xmm9, xmm8
	movd edi, xmm9
	ucomiss xmm5, xmm10
	cmpltss xmm5, xmm11
	movss xmm8, dword ptr [rip + .LCPI1951_2]
	andps xmm5, xmm8
	mulss xmm7, xmm5
	addss xmm2, xmm7
	mov rsi, qword ptr [rsp + 72]
	movss xmm7, dword ptr [rsi + 4*r11]
	mov rsi, qword ptr [rsp + 80]
	movss xmm8, dword ptr [rsi + 4*r11]
	unpcklps xmm7, xmm8
	mulss xmm5, xmm6
	seta r11b
	and r11b, dil
	movzx edi, r11b
	addss xmm14, xmm5
	xorps xmm5, xmm5
	cvtsi2ss xmm5, edi
	unpcklps xmm3, xmm4
	movlhps xmm3, xmm7
	addss xmm1, xmm5
	shufps xmm5, xmm5, 0
	mulps xmm5, xmm3
	addps xmm0, xmm5
	movss dword ptr [rsp + 52], xmm2
	movss dword ptr [rsp + 56], xmm14
	movaps xmmword ptr [rsp + 32], xmm0
	movss dword ptr [rsp + 48], xmm1
	mov sil, 1
	mov qword ptr [rsp + 128], rsi
	cmp r10, qword ptr [rsp + 8]
	je .LBB1951_35
.LBB1951_9:
	mov r9, qword ptr [rsp + 8]
	.p2align	4
.LBB1951_10:
	mov r11d, dword ptr [r10]
	add r10, 4
	cmp r12, r11
	setne dil
	cmp rbp, r11
	seta r8b
	cmp r13, r11
	seta sil
	and sil, r8b
	and sil, dil
	cmp rbx, r11
	seta dil
	test sil, dil
	jne .LBB1951_33
	cmp r10, r9
	jne .LBB1951_10
.LBB1951_12:
	cmp byte ptr [rsp + 128], 0
	je .LBB1951_13
	jmp .LBB1951_35
	.p2align	4
.LBB1951_33:
	mov rsi, qword ptr [rsp + 96]
	movss xmm3, dword ptr [rsi + 4*r11]
	mov rsi, qword ptr [rsp + 88]
	movss xmm4, dword ptr [rsi + 4*r11]
	movaps xmm7, xmm12
	subss xmm7, xmm3
	movaps xmm5, xmm13
	subss xmm5, xmm4
	movaps xmm8, xmm7
	mulss xmm8, xmm7
	movaps xmm6, xmm5
	mulss xmm6, xmm5
	addss xmm6, xmm8
	movaps xmm8, xmm6
	cmpltss xmm8, dword ptr [rsp + 20]
	movss xmm11, dword ptr [rsp + 24]
	movaps xmm9, xmm11
	cmpless xmm9, xmm6
	andps xmm9, xmm8
	movd esi, xmm9
	ucomiss xmm6, xmm10
	cmpltss xmm6, xmm11
	movss xmm8, dword ptr [rip + .LCPI1951_2]
	andps xmm6, xmm8
	mulss xmm7, xmm6
	addss xmm2, xmm7
	mov rdi, qword ptr [rsp + 72]
	movss xmm7, dword ptr [rdi + 4*r11]
	mov rdi, qword ptr [rsp + 80]
	movss xmm8, dword ptr [rdi + 4*r11]
	unpcklps xmm7, xmm8
	mulss xmm6, xmm5
	addss xmm14, xmm6
	unpcklps xmm3, xmm4
	seta dil
	and dil, sil
	movzx esi, dil
	movlhps xmm3, xmm7
	xorps xmm4, xmm4
	cvtsi2ss xmm4, esi
	addss xmm1, xmm4
	shufps xmm4, xmm4, 0
	mulps xmm4, xmm3
	addps xmm0, xmm4
	movss dword ptr [rsp + 52], xmm2
	movss dword ptr [rsp + 56], xmm14
	movaps xmmword ptr [rsp + 32], xmm0
	movss dword ptr [rsp + 48], xmm1
	test r10, r10
	jne .LBB1951_6
	jmp .LBB1951_5
.LBB1951_32:
	movss dword ptr [rsp + 52], xmm2
	movss dword ptr [rsp + 56], xmm14
	movaps xmmword ptr [rsp + 32], xmm0
	movss dword ptr [rsp + 48], xmm1
	.p2align	4
.LBB1951_35:
	lea rdi, [rsp + 184]
	mov rsi, qword ptr [rsp + 256]
	movss xmm0, dword ptr [rsp + 140]
	movss xmm1, dword ptr [rsp + 60]
	lea rdx, [rsp + 280]
	lea rcx, [rsp + 168]
	lea r8, [rsp + 32]
	call swarm::rules::finish
	cmp r12, qword ptr [rsp + 240]
	jae .LBB1951_37
	movss xmm0, dword ptr [rsp + 184]
	movss xmm1, dword ptr [rsp + 188]
	movss xmm2, dword ptr [rsp + 192]
	movss xmm3, dword ptr [rsp + 196]
	mov rax, qword ptr [rsp + 224]
	movss dword ptr [rax + 4*r12], xmm0
	mov rax, qword ptr [rsp + 216]
	movss dword ptr [rax + 4*r12], xmm1
	mov rax, qword ptr [rsp + 208]
	movss dword ptr [rax + 4*r12], xmm2
	mov rax, qword ptr [rsp + 200]
	movss dword ptr [rax + 4*r12], xmm3
	jmp .LBB1951_37
.LBB1951_39:
	add rsp, 296
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
