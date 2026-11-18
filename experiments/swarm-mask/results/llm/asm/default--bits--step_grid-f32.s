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
	sub rsp, 312
	.cfi_def_cfa_offset 368
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r13, rdi
	movss xmm5, dword ptr [rdi + 288]
	movss xmm6, dword ptr [rdi + 292]
	movss dword ptr [rsp + 12], xmm6
	mov eax, dword ptr [rdi + 312]
	mov dword ptr [rsp + 264], eax
	mov rax, qword ptr [rdi + 304]
	mov qword ptr [rsp + 256], rax
	movss xmm0, dword ptr [rdi + 316]
	mov rax, qword ptr [rdi + 8]
	mov qword ptr [rsp + 40], rax
	mov rax, qword ptr [rdi + 16]
	mov qword ptr [rsp + 56], rax
	mov rax, qword ptr [rdi + 32]
	mov qword ptr [rsp + 32], rax
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
	movss dword ptr [rsp + 24], xmm1
	movss dword ptr [rdi + 280], xmm1
	movss dword ptr [rsp + 64], xmm5
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
	xor r15d, r15d
	xorpd xmm2, xmm2
	ucomisd xmm1, xmm2
	cmovb rdx, r15
	ucomisd xmm1, qword ptr [rip + .LCPI1951_4]
	mov r12, -1
	cmova rdx, r12
	cmp rdx, 1
	adc rdx, 0
	movss xmm1, dword ptr [rip + .LCPI1951_5]
	ucomiss xmm1, xmm0
	mov ebx, 1
	cmovbe rdx, rbx
	xorps xmm1, xmm1
	ucomiss xmm0, xmm1
	cmovb rdx, rbx
	mov qword ptr [r13 + 264], rdx
	movss xmm0, dword ptr [rsp + 24]
	mulss xmm0, dword ptr [rsp + 12]
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
	cmovb rdx, r15
	ucomisd xmm1, qword ptr [rip + .LCPI1951_4]
	cmova rdx, r12
	cmp rdx, 1
	adc rdx, 0
	movss xmm1, dword ptr [rip + .LCPI1951_5]
	ucomiss xmm1, xmm0
	cmovbe rdx, rbx
	xorps xmm1, xmm1
	ucomiss xmm0, xmm1
	cmovb rdx, rbx
	mov qword ptr [r13 + 272], rdx
	lea rdi, [r13 + 192]
	mov rsi, qword ptr [rsp + 40]
	mov rdx, qword ptr [rsp + 56]
	mov rcx, qword ptr [rsp + 32]
	mov r8, rbp
	call <swarm::grid::Grid>::fill
	mov rbp, qword ptr [r13 + 16]
	test rbp, rbp
	je .LBB1951_34
	mov rsi, r13
	lea rax, [r13 + 316]
	mov qword ptr [rsp + 232], rax
	mov rax, qword ptr [r13 + 8]
	mov qword ptr [rsp + 120], rax
	mov rax, qword ptr [r13 + 32]
	mov qword ptr [rsp + 112], rax
	mov r15, qword ptr [r13 + 40]
	mov rax, qword ptr [r13 + 64]
	mov rbx, qword ptr [r13 + 88]
	cmp rax, rbx
	cmovb rbx, rax
	mov rax, qword ptr [r13 + 80]
	mov qword ptr [rsp + 104], rax
	mov rax, qword ptr [r13 + 56]
	mov qword ptr [rsp + 96], rax
	mov rax, qword ptr [r13 + 264]
	movss xmm0, dword ptr [r13 + 280]
	movss dword ptr [rsp + 16], xmm0
	xor r13d, r13d
	mov qword ptr [rsp + 40], rax
	sub rax, 1
	cmovb rax, r13
	mov qword ptr [rsp + 224], rax
	mov rax, qword ptr [rsi + 272]
	sub rax, 1
	cmovb rax, r13
	mov qword ptr [rsp + 216], rax
	movss xmm0, dword ptr [rsi + 320]
	mulss xmm0, xmm0
	movss dword ptr [rsp + 72], xmm0
	movss xmm0, dword ptr [rsi + 316]
	mulss xmm0, xmm0
	movss dword ptr [rsp + 68], xmm0
	mov rax, qword ptr [rsi + 136]
	mov rcx, qword ptr [rsi + 112]
	cmp rax, rcx
	cmovb rcx, rax
	mov rax, qword ptr [rsi + 160]
	cmp rax, rcx
	cmovb rcx, rax
	cmp r15, rbx
	mov rdx, rbx
	cmovb rdx, r15
	mov rax, qword ptr [rsi + 184]
	cmp rax, rcx
	cmovb rcx, rax
	mov qword ptr [rsp + 208], rcx
	mov r14, qword ptr [rsi + 208]
	mov rax, qword ptr [rsi + 200]
	mov qword ptr [rsp + 32], rax
	mov rax, qword ptr [rsi + 256]
	mov qword ptr [rsp + 24], rax
	mov rax, qword ptr [rsi + 248]
	mov rcx, qword ptr [rsi + 104]
	mov qword ptr [rsp + 184], rcx
	mov rcx, qword ptr [rsi + 128]
	mov qword ptr [rsp + 176], rcx
	mov rcx, qword ptr [rsi + 152]
	mov qword ptr [rsp + 168], rcx
	mov rcx, qword ptr [rsi + 176]
	mov qword ptr [rsp + 160], rcx
	mov qword ptr [rsp + 88], rax
	add rax, 4
	mov qword ptr [rsp + 80], rax
	mov qword ptr [rsp + 200], rdx
	mov qword ptr [rsp + 192], r14
	jmp .LBB1951_2
	.p2align	4
.LBB1951_32:
	mov rdx, qword ptr [rsp + 200]
.LBB1951_33:
	inc r13
	cmp r13, rbp
	je .LBB1951_34
.LBB1951_2:
	cmp r13, rdx
	jae .LBB1951_33
	mov rax, qword ptr [rsp + 120]
	movss xmm2, dword ptr [rax + 4*r13]
	movss dword ptr [rsp + 76], xmm2
	mov rax, qword ptr [rsp + 112]
	movss xmm3, dword ptr [rax + 4*r13]
	movss dword ptr [rsp + 20], xmm3
	mov rax, qword ptr [rsp + 96]
	movss xmm0, dword ptr [rax + 4*r13]
	mov rax, qword ptr [rsp + 104]
	movss xmm1, dword ptr [rax + 4*r13]
	movss dword ptr [rsp + 128], xmm2
	movss dword ptr [rsp + 132], xmm3
	movss dword ptr [rsp + 136], xmm0
	movss dword ptr [rsp + 140], xmm1
	movaps xmm0, xmm2
	mulss xmm0, dword ptr [rsp + 16]
	mov r12, qword ptr [rip + floorf@GOTPCREL]
	call r12
	mov rdx, r12
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
	cvttsd2si r12, xmm2
	and r12, rcx
	or r12, rax
	xor eax, eax
	xorpd xmm2, xmm2
	ucomisd xmm1, xmm2
	cmovb r12, rax
	movsd xmm2, qword ptr [rip + .LCPI1951_4]
	ucomisd xmm1, xmm2
	mov rcx, -1
	cmova r12, rcx
	mov r14, qword ptr [rsp + 224]
	cmp r14, r12
	cmovb r12, r14
	movss xmm1, dword ptr [rip + .LCPI1951_5]
	ucomiss xmm0, xmm1
	cmovae r12, rax
	movss xmm0, dword ptr [rsp + 20]
	mulss xmm0, dword ptr [rsp + 16]
	call rdx
	xorps xmm13, xmm13
	movss xmm12, dword ptr [rsp + 20]
	movss xmm11, dword ptr [rsp + 76]
	maxss xmm0, xmm13
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
	mov rcx, qword ptr [rsp + 216]
	cmp rcx, rax
	cmovb rax, rcx
	ucomiss xmm0, dword ptr [rip + .LCPI1951_5]
	cmovae rax, rdx
	mov rsi, r12
	sub rsi, 1
	cmovb rsi, rdx
	xor r8d, r8d
	inc r12
	cmp r14, r12
	cmovb r12, r14
	mov r14, qword ptr [rsp + 192]
	mov rdx, rax
	sub rdx, 1
	mov edi, 0
	mov qword ptr [rsp + 48], rdi
	cmovb rdx, r8
	inc rax
	cmp rcx, rax
	cmovb rax, rcx
	xorps xmm0, xmm0
	movups xmmword ptr [rsp + 284], xmm0
	movaps xmmword ptr [rsp + 272], xmm0
	mov rdi, rax
	imul rdi, qword ptr [rsp + 40]
	lea r8, [rdi + r12]
	inc r8
	mov qword ptr [rsp + 56], rsi
	add rdi, rsi
	inc r12
	mov qword ptr [rsp + 248], rdi
	cmp rdi, r14
	setb dil
	mov qword ptr [rsp + 240], r8
	cmp r8, r14
	setb cl
	and cl, dil
	mov byte ptr [rsp + 11], cl
	xor r10d, r10d
	xorps xmm1, xmm1
	jmp .LBB1951_4
	.p2align	4
.LBB1951_25:
	mov cl, 1
	mov qword ptr [rsp + 48], rcx
.LBB1951_18:
	mov rcx, qword ptr [rsp + 120]
	movss xmm3, dword ptr [rcx + 4*r11]
	mov rcx, qword ptr [rsp + 112]
	movss xmm5, dword ptr [rcx + 4*r11]
	movaps xmm2, xmm11
	subss xmm2, xmm3
	movaps xmm6, xmm12
	subss xmm6, xmm5
	movaps xmm7, xmm2
	mulss xmm7, xmm2
	movaps xmm4, xmm6
	mulss xmm4, xmm6
	addss xmm4, xmm7
	movaps xmm7, xmm4
	movss xmm8, dword ptr [rsp + 72]
	cmpltss xmm7, xmm8
	movss xmm10, dword ptr [rip + .LCPI1951_2]
	andps xmm7, xmm10
	cmpless xmm8, xmm4
	xorps xmm9, xmm9
	cmpltss xmm9, xmm4
	cmpltss xmm4, dword ptr [rsp + 68]
	andps xmm4, xmm10
	andps xmm4, xmm8
	andps xmm4, xmm9
	mulss xmm2, xmm7
	mulss xmm7, xmm6
	addss xmm13, xmm7
	mov rcx, qword ptr [rsp + 96]
	movss xmm6, dword ptr [rcx + 4*r11]
	mov rcx, qword ptr [rsp + 104]
	movss xmm7, dword ptr [rcx + 4*r11]
	unpcklps xmm6, xmm7
	movss dword ptr [rsp + 296], xmm13
	unpcklps xmm3, xmm5
	movlhps xmm3, xmm6
	movaps xmm5, xmm4
	shufps xmm5, xmm4, 0
	mulps xmm5, xmm3
	addps xmm1, xmm5
	movaps xmmword ptr [rsp + 272], xmm1
	unpcklps xmm4, xmm2
	addps xmm0, xmm4
	movlps qword ptr [rsp + 288], xmm0
.LBB1951_4:
	test r10, r10
	je .LBB1951_7
	.p2align	4
.LBB1951_5:
	cmp r10, r9
	je .LBB1951_7
	mov r11d, dword ptr [r10]
	cmp r13, r11
	setne dil
	cmp rbp, r11
	seta r8b
	cmp r15, r11
	seta sil
	and sil, r8b
	and sil, dil
	cmp rbx, r11
	seta dil
	add r10, 4
	test sil, dil
	je .LBB1951_5
	jmp .LBB1951_18
	.p2align	4
.LBB1951_7:
	cmp byte ptr [rsp + 48], 0
	jne .LBB1951_30
	cmp rdx, rax
	ja .LBB1951_30
	jb .LBB1951_10
	cmp byte ptr [rsp + 11], 0
	jne .LBB1951_20
	jmp .LBB1951_30
	.p2align	4
.LBB1951_27:
	cmp rdx, rax
	je .LBB1951_28
.LBB1951_10:
	mov rdi, rdx
	inc rdx
	imul rdi, qword ptr [rsp + 40]
	mov rcx, qword ptr [rsp + 56]
	lea r9, [rdi + rcx]
	cmp r9, r14
	jae .LBB1951_27
	add rdi, r12
	cmp rdi, r14
	jae .LBB1951_27
	mov rcx, qword ptr [rsp + 32]
	mov r10d, dword ptr [rcx + 4*r9]
	mov edi, dword ptr [rcx + 4*rdi]
	cmp edi, r10d
	jb .LBB1951_27
	cmp qword ptr [rsp + 24], rdi
	jb .LBB1951_27
	cmp edi, r10d
	je .LBB1951_27
	sub rdi, r10
	mov rcx, qword ptr [rsp + 88]
	lea rsi, [rcx + 4*r10]
	lea r9, [rsi + 4*rdi]
	shl rdi, 2
	mov rcx, qword ptr [rsp + 80]
	lea r10, [rcx + 4*r10]
	.p2align	4
.LBB1951_16:
	mov r11d, dword ptr [r10 - 4]
	cmp r13, r11
	setne sil
	cmp rbp, r11
	seta r8b
	cmp r15, r11
	seta cl
	and cl, r8b
	and cl, sil
	cmp rbx, r11
	seta sil
	test cl, sil
	jne .LBB1951_17
	add r10, 4
	add rdi, -4
	jne .LBB1951_16
	jmp .LBB1951_27
.LBB1951_17:
	mov qword ptr [rsp + 48], 0
	jmp .LBB1951_18
.LBB1951_28:
	mov rdx, rax
	cmp byte ptr [rsp + 11], 0
	je .LBB1951_30
.LBB1951_20:
	mov rcx, qword ptr [rsp + 32]
	mov rsi, qword ptr [rsp + 248]
	mov r10d, dword ptr [rcx + 4*rsi]
	mov rsi, qword ptr [rsp + 240]
	mov edi, dword ptr [rcx + 4*rsi]
	cmp edi, r10d
	jb .LBB1951_30
	cmp qword ptr [rsp + 24], rdi
	jb .LBB1951_30
	cmp edi, r10d
	je .LBB1951_30
	sub rdi, r10
	mov rcx, qword ptr [rsp + 88]
	lea rcx, [rcx + 4*r10]
	lea r9, [rcx + 4*rdi]
	shl rdi, 2
	mov rcx, qword ptr [rsp + 80]
	lea r10, [rcx + 4*r10]
	.p2align	4
.LBB1951_24:
	mov r11d, dword ptr [r10 - 4]
	cmp r13, r11
	setne cl
	cmp rbp, r11
	seta sil
	cmp r15, r11
	seta r8b
	and r8b, sil
	and r8b, cl
	cmp rbx, r11
	seta cl
	test r8b, cl
	jne .LBB1951_25
	add r10, 4
	add rdi, -4
	jne .LBB1951_24
.LBB1951_30:
	lea rdi, [rsp + 144]
	mov rsi, qword ptr [rsp + 232]
	movss xmm0, dword ptr [rsp + 64]
	movss xmm1, dword ptr [rsp + 12]
	lea rdx, [rsp + 256]
	lea rcx, [rsp + 128]
	lea r8, [rsp + 272]
	call swarm::rules::finish
	cmp r13, qword ptr [rsp + 208]
	jae .LBB1951_32
	movss xmm0, dword ptr [rsp + 144]
	movss xmm1, dword ptr [rsp + 148]
	movss xmm2, dword ptr [rsp + 152]
	movss xmm3, dword ptr [rsp + 156]
	mov rax, qword ptr [rsp + 184]
	movss dword ptr [rax + 4*r13], xmm0
	mov rax, qword ptr [rsp + 176]
	movss dword ptr [rax + 4*r13], xmm1
	mov rax, qword ptr [rsp + 168]
	movss dword ptr [rax + 4*r13], xmm2
	mov rax, qword ptr [rsp + 160]
	movss dword ptr [rax + 4*r13], xmm3
	jmp .LBB1951_32
.LBB1951_34:
	add rsp, 312
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
