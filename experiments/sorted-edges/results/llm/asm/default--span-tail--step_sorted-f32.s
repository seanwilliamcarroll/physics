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
	sub rsp, 808
	.cfi_def_cfa_offset 864
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r13, rdi
	lea rax, [rdi + 316]
	mov qword ptr [rsp + 576], rax
	movss xmm4, dword ptr [rdi + 288]
	movss xmm6, dword ptr [rdi + 292]
	movss dword ptr [rsp + 220], xmm6
	mov eax, dword ptr [rdi + 312]
	mov dword ptr [rsp + 664], eax
	mov rax, qword ptr [rdi + 304]
	mov qword ptr [rsp + 656], rax
	movss xmm5, dword ptr [rdi + 316]
	mov rax, qword ptr [rdi + 8]
	mov qword ptr [rsp + 16], rax
	mov rbp, qword ptr [rdi + 16]
	mov rax, qword ptr [rdi + 32]
	mov qword ptr [rsp + 64], rax
	mov rax, qword ptr [rdi + 40]
	mov qword ptr [rsp + 224], rax
	movss xmm0, dword ptr [rip + .LCPI1952_0]
	movaps xmm1, xmm4
	mulss xmm1, xmm0
	movaps xmm2, xmm5
	maxss xmm2, xmm1
	cmpunordss xmm1, xmm1
	movaps xmm3, xmm1
	andnps xmm3, xmm2
	movaps xmmword ptr [rsp + 240], xmm5
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
	movss dword ptr [rsp + 48], xmm1
	movss dword ptr [rdi + 280], xmm1
	movss dword ptr [rsp + 284], xmm4
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
	movss xmm0, dword ptr [rsp + 48]
	mulss xmm0, dword ptr [rsp + 220]
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
	mov rcx, qword ptr [rsp + 64]
	mov r8, qword ptr [rsp + 224]
	call <swarm::grid::Grid>::fill
	mov rsi, r13
	mov r12, qword ptr [r13 + 248]
	mov rax, qword ptr [r13 + 256]
	mov rbp, qword ptr [r13 + 8]
	mov r14, qword ptr [r13 + 16]
	mov qword ptr [r13 + 112], 0
	lea rbx, [r12 + 4*rax]
	lea rax, [r13 + 96]
	mov qword ptr [rsp + 64], rax
	mov r13, r12
	mov qword ptr [rsp + 168], rsi
	jmp .LBB1952_2
.LBB1952_5:
	xor eax, eax
	mov r13, rbx
	cmp eax, 1
	jne .LBB1952_8
.LBB1952_6:
	cmp r15, qword ptr [rsi + 96]
	je .LBB1952_7
.LBB1952_1:
	mov rax, qword ptr [rsi + 104]
	movss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rsi + 112], r15
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
	mov rdi, qword ptr [rsp + 64]
	mov rsi, r15
	movss dword ptr [rsp + 16], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 16]
	mov rsi, qword ptr [rsp + 168]
	jmp .LBB1952_1
.LBB1952_8:
	mov r13, qword ptr [rsi + 32]
	mov r15, qword ptr [rsi + 40]
	mov qword ptr [rsi + 136], 0
	xor r14d, r14d
	lea rax, [rsi + 120]
	mov qword ptr [rsp + 64], rax
	mov rbp, r12
	jmp .LBB1952_10
.LBB1952_13:
	xor eax, eax
	mov rbp, rbx
	cmp eax, 1
	jne .LBB1952_16
.LBB1952_14:
	cmp r14, qword ptr [rsi + 120]
	je .LBB1952_15
.LBB1952_9:
	mov rax, qword ptr [rsi + 128]
	movss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rsi + 136], r14
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
	mov rdi, qword ptr [rsp + 64]
	mov rsi, r14
	movss dword ptr [rsp + 16], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 16]
	mov rsi, qword ptr [rsp + 168]
	jmp .LBB1952_9
.LBB1952_16:
	mov r13, qword ptr [rsi + 56]
	mov r15, qword ptr [rsi + 64]
	mov qword ptr [rsi + 160], 0
	xor r14d, r14d
	lea rax, [rsi + 144]
	mov qword ptr [rsp + 64], rax
	mov rbp, r12
	jmp .LBB1952_18
.LBB1952_21:
	xor eax, eax
	mov rbp, rbx
	cmp eax, 1
	jne .LBB1952_24
.LBB1952_22:
	cmp r14, qword ptr [rsi + 144]
	je .LBB1952_23
.LBB1952_17:
	mov rax, qword ptr [rsi + 152]
	movss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rsi + 160], r14
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
	mov rdi, qword ptr [rsp + 64]
	mov rsi, r14
	movss dword ptr [rsp + 16], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 16]
	mov rsi, qword ptr [rsp + 168]
	jmp .LBB1952_17
.LBB1952_24:
	mov r13, qword ptr [rsi + 80]
	mov r15, qword ptr [rsi + 88]
	mov qword ptr [rsi + 184], 0
	xor r14d, r14d
	lea rbp, [rsi + 168]
	jmp .LBB1952_26
.LBB1952_29:
	xor eax, eax
	mov r12, rbx
	cmp eax, 1
	jne .LBB1952_32
.LBB1952_30:
	cmp r14, qword ptr [rsi + 168]
	je .LBB1952_31
.LBB1952_25:
	mov rax, qword ptr [rsi + 176]
	movss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rsi + 184], r14
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
	movss dword ptr [rsp + 16], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	movss xmm0, dword ptr [rsp + 16]
	mov rsi, qword ptr [rsp + 168]
	jmp .LBB1952_25
.LBB1952_32:
	movups xmm0, xmmword ptr [rsi + 96]
	mov rax, qword ptr [rsi + 8]
	mov qword ptr [rsp + 552], rax
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
	mov qword ptr [rsp + 544], rax
	mov qword ptr [rsi + 128], rax
	mov rcx, qword ptr [rsi + 56]
	movups xmm1, xmmword ptr [rsi + 144]
	movupd xmm2, xmmword ptr [rsi + 40]
	mov rax, qword ptr [rsi + 40]
	movups xmmword ptr [rsi + 32], xmm0
	movupd xmmword ptr [rsi + 136], xmm2
	movups xmmword ptr [rsi + 48], xmm1
	mov qword ptr [rsp + 536], rcx
	mov qword ptr [rsi + 152], rcx
	movups xmm0, xmmword ptr [rsi + 64]
	movups xmm1, xmmword ptr [rsi + 160]
	mov rcx, qword ptr [rsi + 64]
	movups xmmword ptr [rsi + 64], xmm1
	movups xmmword ptr [rsi + 160], xmm0
	mov r9, qword ptr [rsi + 80]
	mov rdx, qword ptr [rsi + 176]
	mov qword ptr [rsi + 80], rdx
	mov qword ptr [rsp + 528], r9
	mov qword ptr [rsi + 176], r9
	mov rdx, qword ptr [rsi + 88]
	mov qword ptr [rsi + 88], r14
	mov qword ptr [rsi + 184], rdx
	test rdi, rdi
	je .LBB1952_105
	movss xmm1, dword ptr [rsi + 320]
	mulss xmm1, xmm1
	cmp rax, r8
	cmovb r8, rax
	movaps xmm0, xmmword ptr [rsp + 240]
	mulss xmm0, xmm0
	cmp rcx, r8
	cmovb r8, rcx
	movaps xmmword ptr [rsp + 240], xmm0
	shufps xmm0, xmm0, 0
	movaps xmmword ptr [rsp + 256], xmm1
	shufps xmm1, xmm1, 0
	cmp rdx, r8
	cmovb r8, rdx
	mov qword ptr [rsp + 560], r8
	xor edx, edx
	mov qword ptr [rsp + 568], rdi
	movaps xmmword ptr [rsp + 512], xmm0
	movaps xmmword ptr [rsp + 688], xmm1
	jmp .LBB1952_36
.LBB1952_34:
	mov rsi, qword ptr [rsp + 168]
	mov rdi, qword ptr [rsp + 568]
	.p2align	4
.LBB1952_35:
	inc rdx
	cmp rdx, rdi
	je .LBB1952_105
.LBB1952_36:
	mov rbp, qword ptr [rsi + 16]
	cmp rdx, rbp
	jae .LBB1952_35
	mov rax, qword ptr [rsi + 40]
	mov qword ptr [rsp + 360], rax
	cmp rdx, rax
	jae .LBB1952_35
	mov rax, qword ptr [rsi + 64]
	mov rcx, qword ptr [rsi + 88]
	mov qword ptr [rsp + 352], rax
	cmp rdx, rax
	setb al
	mov qword ptr [rsp + 344], rcx
	cmp rdx, rcx
	setb cl
	and cl, al
	cmp cl, 1
	jne .LBB1952_35
	mov rax, qword ptr [rsi + 8]
	mov qword ptr [rsp + 392], rax
	movss xmm2, dword ptr [rax + 4*rdx]
	mov rax, qword ptr [rsi + 32]
	mov rcx, qword ptr [rsi + 56]
	mov qword ptr [rsp + 384], rax
	movss xmm3, dword ptr [rax + 4*rdx]
	movaps xmmword ptr [rsp + 480], xmm3
	mov rax, qword ptr [rsi + 80]
	mov qword ptr [rsp + 376], rcx
	movss xmm0, dword ptr [rcx + 4*rdx]
	mov qword ptr [rsp + 584], rdx
	mov qword ptr [rsp + 368], rax
	movss xmm1, dword ptr [rax + 4*rdx]
	movss dword ptr [rsp + 448], xmm2
	movss dword ptr [rsp + 452], xmm3
	movss dword ptr [rsp + 456], xmm0
	movss dword ptr [rsp + 460], xmm1
	mov r15, qword ptr [rsi + 264]
	mov r14, qword ptr [rsi + 272]
	movss xmm1, dword ptr [rsi + 280]
	movss dword ptr [rsp + 16], xmm1
	movaps xmmword ptr [rsp + 672], xmm2
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
	mov qword ptr [rsp + 648], r15
	sub r15, 1
	cmovb r15, rbx
	cmp r15, r12
	cmovb r12, r15
	movss xmm1, dword ptr [rip + .LCPI1952_5]
	ucomiss xmm0, xmm1
	cmovae r12, rbx
	movss xmm1, dword ptr [rsp + 16]
	mulss xmm1, dword ptr [rsp + 480]
	xorps xmm0, xmm0
	maxss xmm1, xmm0
	movaps xmm0, xmm1
	call rdx
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
	cmovb rdx, rbx
	ucomisd xmm1, qword ptr [rip + .LCPI1952_4]
	cmova rdx, r13
	sub r14, 1
	cmovb r14, rbx
	cmp r14, rdx
	cmovb rdx, r14
	ucomiss xmm0, dword ptr [rip + .LCPI1952_5]
	xorps xmm0, xmm0
	cmovae rdx, rbx
	mov rcx, r12
	sub rcx, 1
	cmovb rcx, rbx
	mov qword ptr [rsp + 632], rcx
	mov rdi, rdx
	sub rdi, 1
	cmovb rdi, rbx
	inc rdx
	cmp r14, rdx
	cmovb rdx, r14
	xorpd xmm2, xmm2
	xorpd xmm3, xmm3
	mov qword ptr [rsp + 640], rdx
	cmp rdi, rdx
	ja .LBB1952_103
	inc r12
	cmp r15, r12
	cmovb r12, r15
	mov rax, qword ptr [rsp + 352]
	mov rcx, qword ptr [rsp + 344]
	cmp rax, rcx
	cmovb rcx, rax
	inc r12
	mov qword ptr [rsp + 608], r12
	mov rax, qword ptr [rsp + 360]
	cmp rax, rcx
	cmovb rcx, rax
	mov qword ptr [rsp + 592], rcx
	mov rax, qword ptr [rsp + 168]
	mov rcx, qword ptr [rax + 200]
	mov qword ptr [rsp + 600], rcx
	mov rdx, qword ptr [rax + 208]
	movaps xmm15, xmmword ptr [rsp + 480]
	shufps xmm15, xmm15, 0
	movaps xmm0, xmmword ptr [rsp + 672]
	shufps xmm0, xmm0, 0
	movaps xmmword ptr [rsp + 400], xmm0
	xorps xmm7, xmm7
	xorps xmm0, xmm0
	movss dword ptr [rsp + 12], xmm0
	xorps xmm11, xmm11
	xorps xmm0, xmm0
	movaps xmmword ptr [rsp + 224], xmm0
	xorps xmm10, xmm10
	movaps xmmword ptr [rsp + 304], xmm0
	movaps xmmword ptr [rsp + 64], xmm0
	movaps xmmword ptr [rsp + 16], xmm0
	xorps xmm1, xmm1
	xorps xmm6, xmm6
	xorps xmm12, xmm12
	xorps xmm4, xmm4
	xorps xmm5, xmm5
	movaps xmmword ptr [rsp + 288], xmm0
	xorps xmm0, xmm0
	movaps xmmword ptr [rsp + 112], xmm0
	movaps xmmword ptr [rsp + 80], xmm0
	xorps xmm0, xmm0
	movaps xmmword ptr [rsp + 96], xmm0
	mov qword ptr [rsp + 616], rdx
	mov qword ptr [rsp + 624], rbp
	movaps xmmword ptr [rsp + 416], xmm15
	jmp .LBB1952_44
	.p2align	4
.LBB1952_41:
	movaps xmm11, xmmword ptr [rsp + 128]
	movaps xmm4, xmmword ptr [rsp + 48]
	movaps xmm6, xmm1
	movaps xmm5, xmmword ptr [rsp + 176]
	movaps xmm1, xmmword ptr [rsp + 192]
	mov rax, qword ptr [rsp + 40]
.LBB1952_42:
	movaps xmm3, xmmword ptr [rsp + 144]
	cmp rax, qword ptr [rsp + 640]
	lea rdi, [rax + 1]
	mov rdx, qword ptr [rsp + 616]
	je .LBB1952_102
.LBB1952_44:
	movapd xmmword ptr [rsp + 144], xmm3
	movaps xmm8, xmm12
	movaps xmm13, xmm1
	mov rcx, qword ptr [rsp + 648]
	imul rcx, rdi
	mov rax, qword ptr [rsp + 632]
	lea rsi, [rcx + rax]
	cmp rsi, rdx
	mov qword ptr [rsp + 40], rdi
	jae .LBB1952_47
	movaps xmm3, xmmword ptr [rsp + 288]
	movaps xmm2, xmmword ptr [rsp + 16]
	movaps xmm0, xmmword ptr [rsp + 64]
	movaps xmm1, xmm10
	add rcx, qword ptr [rsp + 608]
	mov r9d, 0
	mov eax, 0
	cmp rcx, rdx
	movaps xmm12, xmmword ptr [rsp + 224]
	jae .LBB1952_48
	mov rdx, qword ptr [rsp + 600]
	mov eax, dword ptr [rdx + 4*rsi]
	mov r9d, dword ptr [rdx + 4*rcx]
	jmp .LBB1952_48
	.p2align	4
.LBB1952_47:
	movaps xmm3, xmmword ptr [rsp + 288]
	movaps xmm2, xmmword ptr [rsp + 16]
	movaps xmm0, xmmword ptr [rsp + 64]
	movaps xmm1, xmm10
	xor r9d, r9d
	xor eax, eax
	movaps xmm12, xmmword ptr [rsp + 224]
.LBB1952_48:
	movaps xmm15, xmmword ptr [rsp + 304]
	mov r12, r9
	sub r12, rax
	setb dil
	cmp r9, rbp
	seta cl
	or cl, dil
	mov rcx, qword ptr [rsp + 392]
	lea r10, [rcx + 4*rax]
	mov r14, r12
	mov ebp, 0
	cmovne r14, rbp
	mov r13d, 4
	cmovne r10, r13
	cmp r9, qword ptr [rsp + 360]
	seta cl
	or cl, dil
	mov rcx, r12
	cmovne rcx, rbp
	mov rdx, qword ptr [rsp + 384]
	lea r8, [rdx + 4*rax]
	cmovne r8, r13
	mov rbx, rcx
	shr rbx, 3
	cmp r9, qword ptr [rsp + 352]
	seta sil
	or sil, dil
	mov rdx, qword ptr [rsp + 376]
	lea r11, [rdx + 4*rax]
	mov rdx, r12
	cmovne rdx, rbp
	cmovne r11, r13
	mov rsi, rdx
	shr rsi, 3
	cmp r9, qword ptr [rsp + 344]
	seta r15b
	or r15b, dil
	mov rdi, qword ptr [rsp + 368]
	lea r15, [rdi + 4*rax]
	cmovne r12, rbp
	cmovne r15, r13
	mov rdi, r12
	shr rdi, 3
	mov rax, r14
	shr rax, 3
	cmp rbx, rax
	cmovb rax, rbx
	cmp rsi, rax
	cmovb rax, rsi
	cmp rdi, rax
	cmovb rax, rdi
	test rax, rax
	movaps xmmword ptr [rsp + 128], xmm11
	movaps xmmword ptr [rsp + 224], xmm12
	movaps xmmword ptr [rsp + 432], xmm1
	je .LBB1952_51
	shl rax, 5
	xor edi, edi
	movaps xmm12, xmm15
	movaps xmm15, xmm0
	movaps xmm9, xmm3
	movaps xmm14, xmm5
	movaps xmm11, xmm13
	movaps xmm13, xmm8
	.p2align	4
.LBB1952_50:
	movaps xmmword ptr [rsp + 64], xmm7
	movaps xmmword ptr [rsp + 16], xmm2
	movaps xmmword ptr [rsp + 304], xmm12
	movaps xmmword ptr [rsp + 320], xmm6
	movaps xmmword ptr [rsp + 48], xmm4
	movups xmm0, xmmword ptr [r10 + rdi]
	movaps xmm5, xmmword ptr [rsp + 400]
	subps xmm5, xmm0
	movups xmm3, xmmword ptr [r8 + rdi]
	movaps xmm7, xmmword ptr [rsp + 416]
	subps xmm7, xmm3
	movaps xmm2, xmm5
	mulps xmm2, xmm5
	movaps xmm6, xmm7
	mulps xmm6, xmm7
	addps xmm6, xmm2
	movaps xmm8, xmm6
	movaps xmm10, xmmword ptr [rsp + 688]
	movaps xmm2, xmm10
	cmpleps xmm2, xmm6
	xorps xmm4, xmm4
	cmpltps xmm4, xmm6
	movaps xmm12, xmmword ptr [rsp + 512]
	cmpltps xmm6, xmm12
	andps xmm6, xmm2
	movups xmm2, xmmword ptr [r10 + rdi + 16]
	movaps xmm1, xmmword ptr [rip + .LCPI1952_6]
	andps xmm4, xmm1
	andps xmm4, xmm6
	movups xmm6, xmmword ptr [r8 + rdi + 16]
	cmpltps xmm8, xmm10
	andps xmm8, xmm1
	mulps xmm5, xmm8
	movaps xmm1, xmm13
	movaps xmm13, xmm11
	movaps xmm11, xmm14
	movaps xmm14, xmm9
	movaps xmm9, xmm15
	movaps xmm15, xmmword ptr [rsp + 432]
	addps xmm15, xmm5
	movaps xmmword ptr [rsp + 432], xmm15
	movaps xmm15, xmm9
	movaps xmm9, xmm14
	movaps xmm14, xmm11
	movaps xmm11, xmm13
	movaps xmm13, xmm1
	mulps xmm8, xmm7
	movaps xmm5, xmmword ptr [rsp + 128]
	addps xmm5, xmm8
	movaps xmmword ptr [rsp + 128], xmm5
	mulps xmm0, xmm4
	movaps xmm1, xmmword ptr [rsp + 144]
	addps xmm1, xmm0
	movaps xmmword ptr [rsp + 144], xmm1
	mulps xmm3, xmm4
	addps xmm14, xmm3
	movups xmm0, xmmword ptr [r11 + rdi]
	mulps xmm0, xmm4
	addps xmm13, xmm0
	movups xmm0, xmmword ptr [r15 + rdi]
	mulps xmm0, xmm4
	addps xmm11, xmm0
	addps xmm15, xmm4
	movaps xmm3, xmmword ptr [rsp + 400]
	subps xmm3, xmm2
	movaps xmm4, xmmword ptr [rsp + 416]
	subps xmm4, xmm6
	movaps xmm0, xmm3
	mulps xmm0, xmm3
	movaps xmm5, xmm4
	mulps xmm5, xmm4
	addps xmm5, xmm0
	movaps xmm7, xmm5
	movaps xmm8, xmm10
	cmpleps xmm8, xmm5
	xorps xmm0, xmm0
	cmpltps xmm0, xmm5
	cmpltps xmm5, xmm12
	andps xmm5, xmm8
	movaps xmm1, xmmword ptr [rip + .LCPI1952_6]
	andps xmm0, xmm1
	andps xmm0, xmm5
	cmpltps xmm7, xmm10
	andps xmm7, xmm1
	mulps xmm3, xmm7
	movaps xmm5, xmmword ptr [rsp + 224]
	addps xmm5, xmm3
	movaps xmmword ptr [rsp + 224], xmm5
	mulps xmm7, xmm4
	movaps xmm4, xmmword ptr [rsp + 48]
	movaps xmm1, xmmword ptr [rsp + 64]
	addps xmm1, xmm7
	movaps xmmword ptr [rsp + 64], xmm1
	movaps xmm7, xmmword ptr [rsp + 64]
	movaps xmm12, xmmword ptr [rsp + 304]
	mulps xmm2, xmm0
	addps xmm9, xmm2
	mulps xmm6, xmm0
	addps xmm4, xmm6
	movaps xmm6, xmmword ptr [rsp + 320]
	movups xmm2, xmmword ptr [r11 + rdi + 16]
	mulps xmm2, xmm0
	addps xmm6, xmm2
	movups xmm2, xmmword ptr [r15 + rdi + 16]
	mulps xmm2, xmm0
	movaps xmm3, xmmword ptr [rsp + 16]
	addps xmm3, xmm2
	movaps xmmword ptr [rsp + 16], xmm3
	movaps xmm2, xmmword ptr [rsp + 16]
	addps xmm12, xmm0
	add rdi, 32
	cmp rax, rdi
	jne .LBB1952_50
	jmp .LBB1952_52
	.p2align	4
.LBB1952_51:
	movaps xmm12, xmm15
	movaps xmm15, xmm0
	movaps xmm9, xmm3
	movaps xmm14, xmm5
	movaps xmm11, xmm13
	movaps xmm13, xmm8
.LBB1952_52:
	movaps xmmword ptr [rsp + 496], xmm13
	movaps xmmword ptr [rsp + 192], xmm11
	movaps xmmword ptr [rsp + 176], xmm14
	movaps xmmword ptr [rsp + 288], xmm9
	movaps xmm8, xmm2
	movaps xmmword ptr [rsp + 64], xmm15
	movaps xmm13, xmm12
	movaps xmm14, xmmword ptr [rsp + 224]
	mov edi, r14d
	and edi, 7
	mov rsi, r9
	sub rsi, 8
	mov eax, 0
	cmovae rax, rsi
	test rdi, rdi
	mov rbp, qword ptr [rsp + 624]
	je .LBB1952_56
	lea rbx, [rax + 8]
	cmp rbx, rbp
	ja .LBB1952_56
	cmp rbx, qword ptr [rsp + 592]
	ja .LBB1952_56
	add rdi, rax
	mov rcx, r9
	sub rcx, rdi
	movq xmm0, rcx
	pshufd xmm2, xmm0, 68
	movdqa xmm0, xmmword ptr [rip + .LCPI1952_7]
	movaps xmmword ptr [rsp + 320], xmm6
	movdqa xmm6, xmm0
	pxor xmm2, xmm0
	pshufd xmm3, xmm2, 160
	movdqa xmmword ptr [rsp + 736], xmm3
	movdqa xmm0, xmm3
	pcmpgtd xmm0, xmmword ptr [rip + .LCPI1952_8]
	pshufd xmm1, xmm2, 245
	pcmpeqd xmm1, xmm6
	movdqa xmmword ptr [rsp + 784], xmm1
	pandn xmm0, xmm1
	movdqa xmm2, xmm3
	pcmpgtd xmm2, xmmword ptr [rip + .LCPI1952_9]
	pandn xmm2, xmm1
	movaps xmmword ptr [rsp + 48], xmm4
	movdqa xmm4, xmm2
	shufps xmm4, xmm0, 136
	sub r9, rax
	movq xmm3, r9
	pshufd xmm1, xmm3, 68
	pxor xmm1, xmm6
	movdqa xmm3, xmm1
	pcmpgtd xmm3, xmmword ptr [rip + .LCPI1952_10]
	pshufd xmm5, xmm3, 160
	pshufd xmm9, xmm1, 245
	pcmpeqd xmm9, xmm6
	movdqa xmmword ptr [rsp + 768], xmm9
	pand xmm5, xmm9
	pshufd xmm6, xmm3, 245
	por xmm6, xmm5
	movdqa xmm3, xmm1
	pcmpgtd xmm3, xmmword ptr [rip + .LCPI1952_11]
	pshufd xmm5, xmm3, 160
	pand xmm5, xmm9
	pshufd xmm3, xmm3, 245
	por xmm3, xmm5
	pand xmm2, xmm3
	shufps xmm3, xmm6, 136
	andps xmm3, xmm4
	andps xmm6, xmm0
	shufps xmm2, xmm6, 136
	mov rcx, qword ptr [rsp + 392]
	movups xmm11, xmmword ptr [rcx + 4*rax + 16]
	movaps xmm4, xmmword ptr [rsp + 400]
	subps xmm4, xmm11
	movaps xmmword ptr [rsp + 752], xmm4
	mulps xmm4, xmm4
	mov rdx, qword ptr [rsp + 384]
	movups xmm0, xmmword ptr [rdx + 4*rax + 16]
	movaps xmm12, xmmword ptr [rsp + 416]
	subps xmm12, xmm0
	movaps xmm6, xmm12
	mulps xmm6, xmm12
	addps xmm6, xmm4
	movaps xmm15, xmmword ptr [rsp + 688]
	movaps xmm4, xmm15
	cmpleps xmm4, xmm6
	movaps xmm5, xmm6
	movaps xmm10, xmm7
	cmpltps xmm5, xmmword ptr [rsp + 512]
	andps xmm5, xmm4
	xorps xmm4, xmm4
	cmpltps xmm4, xmm6
	andps xmm4, xmm3
	andps xmm4, xmm5
	movaps xmm9, xmmword ptr [rip + .LCPI1952_6]
	andps xmm4, xmm9
	mov rdi, qword ptr [rsp + 368]
	movups xmm3, xmmword ptr [rdi + 4*rax + 16]
	mulps xmm3, xmm4
	addps xmm8, xmm3
	movaps xmmword ptr [rsp + 16], xmm8
	mov rsi, qword ptr [rsp + 376]
	movups xmm3, xmmword ptr [rsi + 4*rax + 16]
	mulps xmm3, xmm4
	movaps xmm5, xmmword ptr [rsp + 320]
	addps xmm5, xmm3
	movaps xmmword ptr [rsp + 320], xmm5
	mulps xmm0, xmm4
	movaps xmm3, xmmword ptr [rsp + 48]
	addps xmm3, xmm0
	movaps xmmword ptr [rsp + 48], xmm3
	addps xmm13, xmm4
	movaps xmmword ptr [rsp + 304], xmm13
	mulps xmm4, xmm11
	movaps xmm0, xmmword ptr [rsp + 288]
	addps xmm0, xmm4
	movaps xmmword ptr [rsp + 288], xmm0
	movups xmm13, xmmword ptr [rcx + 4*rax]
	cmpltps xmm6, xmm15
	andps xmm2, xmm9
	andps xmm2, xmm6
	movups xmm11, xmmword ptr [rdx + 4*rax]
	mulps xmm12, xmm2
	addps xmm10, xmm12
	mulps xmm2, xmmword ptr [rsp + 752]
	addps xmm14, xmm2
	movaps xmmword ptr [rsp + 224], xmm14
	movdqa xmm8, xmmword ptr [rsp + 736]
	movdqa xmm0, xmm8
	pcmpgtd xmm0, xmmword ptr [rip + .LCPI1952_12]
	movdqa xmm2, xmmword ptr [rsp + 784]
	pandn xmm0, xmm2
	pcmpgtd xmm8, xmmword ptr [rip + .LCPI1952_13]
	pandn xmm8, xmm2
	movdqa xmm2, xmm8
	shufps xmm2, xmm0, 136
	movdqa xmm3, xmm1
	pcmpgtd xmm3, xmmword ptr [rip + .LCPI1952_14]
	pshufd xmm4, xmm3, 160
	movdqa xmm5, xmmword ptr [rsp + 768]
	pand xmm4, xmm5
	pshufd xmm3, xmm3, 245
	por xmm3, xmm4
	pcmpgtd xmm1, xmmword ptr [rip + .LCPI1952_15]
	pshufd xmm4, xmm1, 160
	pand xmm4, xmm5
	pshufd xmm5, xmm1, 245
	por xmm5, xmm4
	pand xmm8, xmm5
	shufps xmm5, xmm3, 136
	andps xmm5, xmm2
	andps xmm3, xmm0
	shufps xmm8, xmm3, 136
	movaps xmm2, xmmword ptr [rsp + 400]
	subps xmm2, xmm13
	movaps xmm3, xmm2
	mulps xmm3, xmm2
	movaps xmm6, xmmword ptr [rsp + 416]
	subps xmm6, xmm11
	movaps xmm0, xmm6
	mulps xmm0, xmm6
	addps xmm0, xmm3
	movaps xmm3, xmm15
	cmpleps xmm3, xmm0
	movaps xmm4, xmm0
	cmpltps xmm4, xmmword ptr [rsp + 512]
	movaps xmm7, xmm10
	andps xmm4, xmm3
	xorps xmm3, xmm3
	cmpltps xmm3, xmm0
	andps xmm3, xmm5
	andps xmm3, xmm4
	movups xmm4, xmmword ptr [rdi + 4*rax]
	andps xmm3, xmm9
	mulps xmm4, xmm3
	movaps xmm10, xmmword ptr [rsp + 192]
	addps xmm10, xmm4
	movups xmm4, xmmword ptr [rsi + 4*rax]
	mulps xmm4, xmm3
	movaps xmm12, xmmword ptr [rsp + 496]
	addps xmm12, xmm4
	movaps xmm4, xmmword ptr [rsp + 48]
	mulps xmm11, xmm3
	movaps xmm5, xmmword ptr [rsp + 176]
	addps xmm5, xmm11
	movaps xmm11, xmmword ptr [rsp + 64]
	addps xmm11, xmm3
	movaps xmmword ptr [rsp + 64], xmm11
	mulps xmm3, xmm13
	movaps xmm14, xmmword ptr [rsp + 144]
	addps xmm14, xmm3
	movaps xmm3, xmm14
	cmpltps xmm0, xmm15
	movaps xmm1, xmm10
	andps xmm8, xmm9
	andps xmm8, xmm0
	mulps xmm6, xmm8
	movaps xmm11, xmmword ptr [rsp + 128]
	addps xmm11, xmm6
	movaps xmm6, xmmword ptr [rsp + 320]
	mulps xmm8, xmm2
	movaps xmm10, xmmword ptr [rsp + 432]
	addps xmm10, xmm8
	mov rax, qword ptr [rsp + 40]
	cmp rax, qword ptr [rsp + 640]
	lea rdi, [rax + 1]
	mov rdx, qword ptr [rsp + 616]
	jne .LBB1952_44
	jmp .LBB1952_102
	.p2align	4
.LBB1952_56:
	mov eax, ecx
	and eax, 7
	mov esi, edx
	and esi, 7
	mov r9d, r12d
	and r9d, 7
	cmp rax, rdi
	cmovb rdi, rax
	cmp rsi, rdi
	cmovb rdi, rsi
	cmp r9, rdi
	cmovb rdi, r9
	test rdi, rdi
	movaps xmmword ptr [rsp + 304], xmm13
	movaps xmm10, xmmword ptr [rsp + 432]
	movaps xmmword ptr [rsp + 16], xmm8
	je .LBB1952_59
	movaps xmm1, xmm6
	movaps xmmword ptr [rsp + 48], xmm4
	and r14d, -8
	and ecx, -8
	and edx, -8
	and r12d, -8
	movss xmm0, dword ptr [r10 + 4*r14]
	movss xmm2, dword ptr [r8 + 4*rcx]
	movaps xmm14, xmmword ptr [rsp + 672]
	movaps xmm3, xmm14
	subss xmm3, xmm0
	movaps xmm9, xmmword ptr [rsp + 480]
	movaps xmm4, xmm9
	subss xmm4, xmm2
	movaps xmm6, xmm3
	mulss xmm6, xmm3
	movaps xmm5, xmm4
	mulss xmm5, xmm4
	addss xmm5, xmm6
	movaps xmm6, xmmword ptr [rsp + 256]
	ucomiss xmm6, xmm5
	movaps xmm12, xmmword ptr [rsp + 496]
	jbe .LBB1952_60
	movaps xmm0, xmmword ptr [rsp + 112]
	addss xmm0, xmm3
	movaps xmmword ptr [rsp + 112], xmm0
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, xmm4
	movss dword ptr [rsp + 12], xmm0
	jmp .LBB1952_63
	.p2align	4
.LBB1952_59:
	movaps xmm11, xmmword ptr [rsp + 128]
	movaps xmm5, xmmword ptr [rsp + 176]
	movaps xmm1, xmmword ptr [rsp + 192]
	mov rax, qword ptr [rsp + 40]
	movaps xmm12, xmmword ptr [rsp + 496]
	jmp .LBB1952_42
	.p2align	4
.LBB1952_60:
	movaps xmm3, xmmword ptr [rsp + 240]
	ucomiss xmm3, xmm5
	jbe .LBB1952_63
	xorps xmm3, xmm3
	ucomiss xmm5, xmm3
	jbe .LBB1952_63
	movss xmm3, dword ptr [r11 + 4*rdx]
	movss xmm4, dword ptr [r15 + 4*r12]
	unpcklps xmm3, xmm4
	unpcklps xmm0, xmm2
	movlhps xmm0, xmm3
	movaps xmm2, xmmword ptr [rsp + 96]
	addps xmm2, xmm0
	movaps xmmword ptr [rsp + 96], xmm2
	movaps xmm0, xmmword ptr [rsp + 80]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movaps xmmword ptr [rsp + 80], xmm0
.LBB1952_63:
	cmp edi, 1
	je .LBB1952_41
	movss xmm0, dword ptr [r10 + 4*r14 + 4]
	movss xmm2, dword ptr [r8 + 4*rcx + 4]
	movaps xmm3, xmm14
	subss xmm3, xmm0
	movaps xmm4, xmm9
	subss xmm4, xmm2
	movaps xmm6, xmm3
	mulss xmm6, xmm3
	movaps xmm5, xmm4
	mulss xmm5, xmm4
	addss xmm5, xmm6
	movaps xmm6, xmmword ptr [rsp + 256]
	ucomiss xmm6, xmm5
	jbe .LBB1952_66
	movaps xmm0, xmmword ptr [rsp + 112]
	addss xmm0, xmm3
	movaps xmmword ptr [rsp + 112], xmm0
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, xmm4
	movss dword ptr [rsp + 12], xmm0
	jmp .LBB1952_69
.LBB1952_66:
	movaps xmm3, xmmword ptr [rsp + 240]
	ucomiss xmm3, xmm5
	jbe .LBB1952_69
	xorps xmm3, xmm3
	ucomiss xmm5, xmm3
	jbe .LBB1952_69
	movss xmm3, dword ptr [r11 + 4*rdx + 4]
	movss xmm4, dword ptr [r15 + 4*r12 + 4]
	unpcklps xmm3, xmm4
	unpcklps xmm0, xmm2
	movlhps xmm0, xmm3
	movaps xmm2, xmmword ptr [rsp + 96]
	addps xmm2, xmm0
	movaps xmmword ptr [rsp + 96], xmm2
	movaps xmm0, xmmword ptr [rsp + 80]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movaps xmmword ptr [rsp + 80], xmm0
.LBB1952_69:
	cmp edi, 2
	je .LBB1952_41
	movss xmm0, dword ptr [r10 + 4*r14 + 8]
	movss xmm2, dword ptr [r8 + 4*rcx + 8]
	movaps xmm3, xmm14
	subss xmm3, xmm0
	movaps xmm4, xmm9
	subss xmm4, xmm2
	movaps xmm6, xmm3
	mulss xmm6, xmm3
	movaps xmm5, xmm4
	mulss xmm5, xmm4
	addss xmm5, xmm6
	movaps xmm6, xmmword ptr [rsp + 256]
	ucomiss xmm6, xmm5
	jbe .LBB1952_72
	movaps xmm0, xmmword ptr [rsp + 112]
	addss xmm0, xmm3
	movaps xmmword ptr [rsp + 112], xmm0
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, xmm4
	movss dword ptr [rsp + 12], xmm0
	jmp .LBB1952_75
.LBB1952_72:
	movaps xmm3, xmmword ptr [rsp + 240]
	ucomiss xmm3, xmm5
	jbe .LBB1952_75
	xorps xmm3, xmm3
	ucomiss xmm5, xmm3
	jbe .LBB1952_75
	movss xmm3, dword ptr [r11 + 4*rdx + 8]
	movss xmm4, dword ptr [r15 + 4*r12 + 8]
	unpcklps xmm3, xmm4
	unpcklps xmm0, xmm2
	movlhps xmm0, xmm3
	movaps xmm2, xmmword ptr [rsp + 96]
	addps xmm2, xmm0
	movaps xmmword ptr [rsp + 96], xmm2
	movaps xmm0, xmmword ptr [rsp + 80]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movaps xmmword ptr [rsp + 80], xmm0
.LBB1952_75:
	cmp edi, 3
	je .LBB1952_41
	movss xmm0, dword ptr [r10 + 4*r14 + 12]
	movss xmm2, dword ptr [r8 + 4*rcx + 12]
	movaps xmm3, xmm14
	subss xmm3, xmm0
	movaps xmm4, xmm9
	subss xmm4, xmm2
	movaps xmm6, xmm3
	mulss xmm6, xmm3
	movaps xmm5, xmm4
	mulss xmm5, xmm4
	addss xmm5, xmm6
	movaps xmm6, xmmword ptr [rsp + 256]
	ucomiss xmm6, xmm5
	jbe .LBB1952_78
	movaps xmm0, xmmword ptr [rsp + 112]
	addss xmm0, xmm3
	movaps xmmword ptr [rsp + 112], xmm0
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, xmm4
	movss dword ptr [rsp + 12], xmm0
	jmp .LBB1952_81
.LBB1952_78:
	movaps xmm3, xmmword ptr [rsp + 240]
	ucomiss xmm3, xmm5
	jbe .LBB1952_81
	xorps xmm3, xmm3
	ucomiss xmm5, xmm3
	jbe .LBB1952_81
	movss xmm3, dword ptr [r11 + 4*rdx + 12]
	movss xmm4, dword ptr [r15 + 4*r12 + 12]
	unpcklps xmm3, xmm4
	unpcklps xmm0, xmm2
	movlhps xmm0, xmm3
	movaps xmm2, xmmword ptr [rsp + 96]
	addps xmm2, xmm0
	movaps xmmword ptr [rsp + 96], xmm2
	movaps xmm0, xmmword ptr [rsp + 80]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movaps xmmword ptr [rsp + 80], xmm0
.LBB1952_81:
	cmp edi, 4
	je .LBB1952_41
	movss xmm0, dword ptr [r10 + 4*r14 + 16]
	movss xmm2, dword ptr [r8 + 4*rcx + 16]
	movaps xmm3, xmm14
	subss xmm3, xmm0
	movaps xmm4, xmm9
	subss xmm4, xmm2
	movaps xmm6, xmm3
	mulss xmm6, xmm3
	movaps xmm5, xmm4
	mulss xmm5, xmm4
	addss xmm5, xmm6
	movaps xmm6, xmmword ptr [rsp + 256]
	ucomiss xmm6, xmm5
	jbe .LBB1952_84
	movaps xmm0, xmmword ptr [rsp + 112]
	addss xmm0, xmm3
	movaps xmmword ptr [rsp + 112], xmm0
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, xmm4
	movss dword ptr [rsp + 12], xmm0
	jmp .LBB1952_87
.LBB1952_84:
	movaps xmm3, xmmword ptr [rsp + 240]
	ucomiss xmm3, xmm5
	jbe .LBB1952_87
	xorps xmm3, xmm3
	ucomiss xmm5, xmm3
	jbe .LBB1952_87
	movss xmm3, dword ptr [r11 + 4*rdx + 16]
	movss xmm4, dword ptr [r15 + 4*r12 + 16]
	unpcklps xmm3, xmm4
	unpcklps xmm0, xmm2
	movlhps xmm0, xmm3
	movaps xmm2, xmmword ptr [rsp + 96]
	addps xmm2, xmm0
	movaps xmmword ptr [rsp + 96], xmm2
	movaps xmm0, xmmword ptr [rsp + 80]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movaps xmmword ptr [rsp + 80], xmm0
.LBB1952_87:
	cmp edi, 5
	je .LBB1952_41
	movss xmm0, dword ptr [r10 + 4*r14 + 20]
	movss xmm2, dword ptr [r8 + 4*rcx + 20]
	movaps xmm3, xmm14
	subss xmm3, xmm0
	movaps xmm4, xmm9
	subss xmm4, xmm2
	movaps xmm6, xmm3
	mulss xmm6, xmm3
	movaps xmm5, xmm4
	mulss xmm5, xmm4
	addss xmm5, xmm6
	movaps xmm6, xmmword ptr [rsp + 256]
	ucomiss xmm6, xmm5
	jbe .LBB1952_90
	movaps xmm0, xmmword ptr [rsp + 112]
	addss xmm0, xmm3
	movaps xmmword ptr [rsp + 112], xmm0
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, xmm4
	movss dword ptr [rsp + 12], xmm0
	jmp .LBB1952_93
.LBB1952_90:
	movaps xmm3, xmmword ptr [rsp + 240]
	ucomiss xmm3, xmm5
	jbe .LBB1952_93
	xorps xmm3, xmm3
	ucomiss xmm5, xmm3
	jbe .LBB1952_93
	movss xmm3, dword ptr [r11 + 4*rdx + 20]
	movss xmm4, dword ptr [r15 + 4*r12 + 20]
	unpcklps xmm3, xmm4
	unpcklps xmm0, xmm2
	movlhps xmm0, xmm3
	movaps xmm2, xmmword ptr [rsp + 96]
	addps xmm2, xmm0
	movaps xmmword ptr [rsp + 96], xmm2
	movaps xmm0, xmmword ptr [rsp + 80]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movaps xmmword ptr [rsp + 80], xmm0
.LBB1952_93:
	cmp edi, 6
	je .LBB1952_41
	movss xmm0, dword ptr [r10 + 4*r14 + 24]
	movss xmm2, dword ptr [r8 + 4*rcx + 24]
	movaps xmm3, xmm14
	subss xmm3, xmm0
	movaps xmm4, xmm9
	subss xmm4, xmm2
	movaps xmm6, xmm3
	mulss xmm6, xmm3
	movaps xmm5, xmm4
	mulss xmm5, xmm4
	addss xmm5, xmm6
	movaps xmm6, xmmword ptr [rsp + 256]
	ucomiss xmm6, xmm5
	mov rax, qword ptr [rsp + 40]
	jbe .LBB1952_97
	movaps xmm0, xmmword ptr [rsp + 112]
	addss xmm0, xmm3
	movaps xmmword ptr [rsp + 112], xmm0
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, xmm4
	movss dword ptr [rsp + 12], xmm0
	movaps xmm11, xmmword ptr [rsp + 128]
	movaps xmm4, xmmword ptr [rsp + 48]
	movaps xmm6, xmm1
.LBB1952_96:
	movaps xmm5, xmmword ptr [rsp + 176]
	movaps xmm1, xmmword ptr [rsp + 192]
	jmp .LBB1952_42
.LBB1952_97:
	movaps xmm3, xmmword ptr [rsp + 240]
	ucomiss xmm3, xmm5
	movaps xmm6, xmm1
	jbe .LBB1952_101
	xorps xmm3, xmm3
	ucomiss xmm5, xmm3
	movaps xmm1, xmmword ptr [rsp + 192]
	jbe .LBB1952_100
	movss xmm3, dword ptr [r11 + 4*rdx + 24]
	movss xmm4, dword ptr [r15 + 4*r12 + 24]
	unpcklps xmm3, xmm4
	unpcklps xmm0, xmm2
	movlhps xmm0, xmm3
	movaps xmm2, xmmword ptr [rsp + 96]
	addps xmm2, xmm0
	movaps xmmword ptr [rsp + 96], xmm2
	movaps xmm0, xmmword ptr [rsp + 80]
	addss xmm0, dword ptr [rip + .LCPI1952_2]
	movaps xmmword ptr [rsp + 80], xmm0
.LBB1952_100:
	movaps xmm11, xmmword ptr [rsp + 128]
	movaps xmm4, xmmword ptr [rsp + 48]
	movaps xmm5, xmmword ptr [rsp + 176]
	jmp .LBB1952_42
.LBB1952_101:
	movaps xmm11, xmmword ptr [rsp + 128]
	movaps xmm4, xmmword ptr [rsp + 48]
	jmp .LBB1952_96
.LBB1952_102:
	movaps xmm0, xmm3
	unpcklps xmm0, xmm5
	movaps xmm2, xmm12
	unpcklps xmm2, xmm1
	movlhps xmm0, xmm2
	movaps xmm2, xmm5
	shufps xmm2, xmm3, 17
	movaps xmm8, xmm3
	movaps xmm3, xmm1
	shufps xmm3, xmm12, 17
	shufps xmm2, xmm3, 34
	addps xmm2, xmm0
	movaps xmm0, xmm8
	unpckhps xmm0, xmm5
	movaps xmm3, xmm1
	unpckhpd xmm3, xmm12
	shufps xmm0, xmm3, 36
	addps xmm0, xmm2
	shufps xmm5, xmm8, 51
	shufps xmm1, xmm12, 255
	shufps xmm5, xmm1, 34
	addps xmm5, xmm0
	movaps xmm8, xmmword ptr [rsp + 288]
	movaps xmm0, xmm8
	unpcklps xmm0, xmm4
	movaps xmm3, xmmword ptr [rsp + 16]
	movaps xmm1, xmm3
	movlhps xmm1, xmm6
	shufps xmm0, xmm1, 36
	addps xmm0, xmm5
	movaps xmm1, xmm4
	shufps xmm1, xmm8, 17
	movaps xmm2, xmm3
	shufps xmm2, xmm6, 85
	shufps xmm1, xmm2, 34
	addps xmm1, xmm0
	movaps xmm0, xmm8
	unpckhps xmm0, xmm4
	movaps xmm2, xmm3
	unpckhpd xmm2, xmm6
	shufps xmm0, xmm2, 36
	addps xmm0, xmm1
	shufps xmm4, xmm8, 51
	shufps xmm3, xmm6, 255
	shufps xmm4, xmm3, 34
	addps xmm4, xmm0
	movaps xmm2, xmmword ptr [rsp + 96]
	addps xmm2, xmm4
	movaps xmm3, xmmword ptr [rsp + 64]
	movaps xmm0, xmm3
	unpcklps xmm0, xmm10
	movaps xmm1, xmm10
	shufps xmm1, xmm3, 17
	shufps xmm1, xmm3, 226
	addps xmm1, xmm0
	movaps xmm0, xmm3
	unpckhps xmm0, xmm10
	addps xmm0, xmm1
	shufps xmm10, xmm3, 255
	shufps xmm10, xmm3, 226
	addps xmm10, xmm0
	movaps xmm3, xmmword ptr [rsp + 304]
	movaps xmm0, xmm3
	movaps xmm4, xmmword ptr [rsp + 224]
	unpcklps xmm0, xmm4
	addps xmm0, xmm10
	movaps xmm1, xmm4
	shufps xmm1, xmm3, 17
	shufps xmm1, xmm3, 226
	addps xmm1, xmm0
	movaps xmm0, xmm3
	unpckhps xmm0, xmm4
	addps xmm0, xmm1
	shufps xmm4, xmm3, 255
	shufps xmm4, xmm3, 226
	addps xmm4, xmm0
	movaps xmm3, xmmword ptr [rsp + 80]
	unpcklps xmm3, xmmword ptr [rsp + 112]
	addps xmm3, xmm4
	movaps xmm0, xmm11
	shufps xmm0, xmm11, 85
	addss xmm0, xmm11
	movaps xmm1, xmm11
	unpckhpd xmm1, xmm11
	addss xmm1, xmm0
	shufps xmm11, xmm11, 255
	addss xmm11, xmm1
	addss xmm11, xmm7
	movaps xmm0, xmm7
	shufps xmm0, xmm7, 85
	addss xmm0, xmm11
	movaps xmm1, xmm7
	unpckhpd xmm1, xmm7
	addss xmm1, xmm0
	shufps xmm7, xmm7, 255
	addss xmm7, xmm1
	movss xmm0, dword ptr [rsp + 12]
	addss xmm0, xmm7
.LBB1952_103:
	movapd xmmword ptr [rsp + 704], xmm2
	movlpd qword ptr [rsp + 720], xmm3
	movss dword ptr [rsp + 728], xmm0
	lea rdi, [rsp + 464]
	mov rsi, qword ptr [rsp + 576]
	movss xmm0, dword ptr [rsp + 284]
	movss xmm1, dword ptr [rsp + 220]
	lea rdx, [rsp + 656]
	lea rcx, [rsp + 448]
	lea r8, [rsp + 704]
	call swarm::rules::finish
	mov rdx, qword ptr [rsp + 584]
	cmp rdx, qword ptr [rsp + 560]
	jae .LBB1952_34
	movss xmm0, dword ptr [rsp + 464]
	movss xmm1, dword ptr [rsp + 468]
	movss xmm2, dword ptr [rsp + 472]
	movss xmm3, dword ptr [rsp + 476]
	mov rax, qword ptr [rsp + 552]
	movss dword ptr [rax + 4*rdx], xmm0
	mov rax, qword ptr [rsp + 544]
	movss dword ptr [rax + 4*rdx], xmm1
	mov rax, qword ptr [rsp + 536]
	movss dword ptr [rax + 4*rdx], xmm2
	mov rax, qword ptr [rsp + 528]
	movss dword ptr [rax + 4*rdx], xmm3
	jmp .LBB1952_34
.LBB1952_105:
	add rsp, 808
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
