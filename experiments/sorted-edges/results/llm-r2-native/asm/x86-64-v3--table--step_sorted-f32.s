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
	sub rsp, 632
	.cfi_def_cfa_offset 688
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r14, rdi
	lea rax, [rdi + 316]
	mov qword ptr [rsp + 320], rax
	mov eax, dword ptr [rdi + 312]
	mov dword ptr [rsp + 392], eax
	mov rax, qword ptr [rdi + 304]
	mov qword ptr [rsp + 384], rax
	vmovss xmm0, dword ptr [rdi + 316]
	mov rsi, qword ptr [rdi + 8]
	mov rdx, qword ptr [rdi + 16]
	vmovsd xmm6, qword ptr [rdi + 288]
	vmovss xmm1, dword ptr [rip + .LCPI1950_0]
	vmulss xmm2, xmm6, xmm1
	vbroadcastss xmm3, dword ptr [rip + .LCPI1950_1]
	vorps xmm4, xmm0, xmm3
	vmaxss xmm5, xmm0, xmm2
	vandps xmm4, xmm4, xmm5
	vcmpunordss xmm5, xmm0, xmm0
	vblendvps xmm4, xmm4, xmm2, xmm5
	mov rcx, qword ptr [rdi + 32]
	vcmpunordss xmm2, xmm2, xmm2
	vblendvps xmm0, xmm4, xmm0, xmm2
	vmovshdup xmm2, xmm6
	vmovaps xmmword ptr [rsp + 432], xmm2
	vmulss xmm1, xmm2, xmm1
	vorps xmm2, xmm0, xmm3
	vmaxss xmm3, xmm0, xmm1
	vandps xmm2, xmm2, xmm3
	vcmpunordss xmm3, xmm0, xmm0
	vblendvps xmm2, xmm2, xmm1, xmm3
	mov r8, qword ptr [rdi + 40]
	vcmpunordss xmm1, xmm1, xmm1
	vblendvps xmm0, xmm2, xmm0, xmm1
	vmulss xmm0, xmm0, dword ptr [rip + .LCPI1950_2]
	vmovss xmm1, dword ptr [rip + .LCPI1950_3]
	vdivss xmm0, xmm1, xmm0
	vmovss dword ptr [rdi + 280], xmm0
	vbroadcastss xmm0, xmm0
	vmovq xmm0, xmm0
	vmovaps xmmword ptr [rsp + 448], xmm6
	vmulps xmm0, xmm6, xmm0
	vroundps xmm2, xmm0, 10
	vmovshdup xmm0, xmm2
	vcvtss2sd xmm3, xmm0, xmm0
	vcvtss2sd xmm1, xmm2, xmm2
	add rdi, 192
	vxorps xmm0, xmm0, xmm0
	vcvttsd2si r9, xmm3
	mov r10, r9
	vmovsd xmm5, qword ptr [rip + .LCPI1950_5]
	vsubsd xmm4, xmm3, xmm5
	vcvttsd2si rax, xmm4
	sar r10, 63
	and rax, r10
	or rax, r9
	xor r15d, r15d
	vxorpd xmm4, xmm4, xmm4
	vucomisd xmm3, xmm4
	cmovb rax, r15
	vsubsd xmm5, xmm1, xmm5
	vcvttsd2si r9, xmm5
	vmovsd xmm5, qword ptr [rip + .LCPI1950_6]
	vucomisd xmm3, xmm5
	vbroadcastss xmm3, dword ptr [rip + .LCPI1950_4]
	vcmpltps xmm3, xmm2, xmm3
	vcmpleps xmm2, xmm0, xmm2
	mov r10, -1
	cmova rax, r10
	vcvttsd2si r11, xmm1
	mov rbx, r11
	sar rbx, 63
	and r9, rbx
	or r9, r11
	vucomisd xmm1, xmm4
	cmovb r9, r15
	vucomisd xmm1, xmm5
	cmova r9, r10
	vandps xmm1, xmm2, xmm3
	vpmovsxdq xmm1, xmm1
	vmovq xmm2, r9
	vmovq xmm3, rax
	vpunpcklqdq xmm2, xmm2, xmm3
	vpcmpeqq xmm0, xmm2, xmm0
	vpsubq xmm0, xmm2, xmm0
	vmovddup xmm2, qword ptr [rip + .LCPI1950_14]
	vblendvpd xmm0, xmm2, xmm0, xmm1
	vmovupd xmmword ptr [r14 + 264], xmm0
	call <swarm::grid::Grid>::fill
	mov rcx, r14
	mov r14, qword ptr [r14 + 248]
	mov rax, qword ptr [rcx + 256]
	mov rbp, qword ptr [rcx + 8]
	mov r12, qword ptr [rcx + 16]
	mov qword ptr [rcx + 112], 0
	lea rbx, [r14 + 4*rax]
	lea rax, [rcx + 96]
	mov qword ptr [rsp + 224], rax
	mov r13, r14
	mov qword ptr [rsp + 24], rcx
	jmp .LBB1950_2
.LBB1950_5:
	xor eax, eax
	mov r13, rbx
	cmp eax, 1
	jne .LBB1950_8
.LBB1950_6:
	cmp r15, qword ptr [rcx + 96]
	je .LBB1950_7
.LBB1950_1:
	mov rax, qword ptr [rcx + 104]
	vmovss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rcx + 112], r15
	.p2align	4
.LBB1950_2:
	cmp r13, rbx
	je .LBB1950_5
	mov eax, dword ptr [r13]
	add r13, 4
	cmp r12, rax
	jbe .LBB1950_2
	vmovss xmm0, dword ptr [rbp + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1950_6
	jmp .LBB1950_8
.LBB1950_7:
	mov edx, 1
	mov rdi, qword ptr [rsp + 224]
	mov rsi, r15
	vmovss dword ptr [rsp + 128], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovss xmm0, dword ptr [rsp + 128]
	mov rcx, qword ptr [rsp + 24]
	jmp .LBB1950_1
.LBB1950_8:
	mov r13, qword ptr [rcx + 32]
	mov r12, qword ptr [rcx + 40]
	mov qword ptr [rcx + 136], 0
	xor r15d, r15d
	lea rax, [rcx + 120]
	mov qword ptr [rsp + 224], rax
	mov rbp, r14
	jmp .LBB1950_10
.LBB1950_13:
	xor eax, eax
	mov rbp, rbx
	cmp eax, 1
	jne .LBB1950_16
.LBB1950_14:
	cmp r15, qword ptr [rcx + 120]
	je .LBB1950_15
.LBB1950_9:
	mov rax, qword ptr [rcx + 128]
	vmovss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rcx + 136], r15
	.p2align	4
.LBB1950_10:
	cmp rbp, rbx
	je .LBB1950_13
	mov eax, dword ptr [rbp]
	add rbp, 4
	cmp r12, rax
	jbe .LBB1950_10
	vmovss xmm0, dword ptr [r13 + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1950_14
	jmp .LBB1950_16
.LBB1950_15:
	mov edx, 1
	mov rdi, qword ptr [rsp + 224]
	mov rsi, r15
	vmovss dword ptr [rsp + 128], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovss xmm0, dword ptr [rsp + 128]
	mov rcx, qword ptr [rsp + 24]
	jmp .LBB1950_9
.LBB1950_16:
	mov r13, qword ptr [rcx + 56]
	mov r12, qword ptr [rcx + 64]
	mov qword ptr [rcx + 160], 0
	xor r15d, r15d
	lea rax, [rcx + 144]
	mov qword ptr [rsp + 224], rax
	mov rbp, r14
	jmp .LBB1950_18
.LBB1950_21:
	xor eax, eax
	mov rbp, rbx
	cmp eax, 1
	jne .LBB1950_24
.LBB1950_22:
	cmp r15, qword ptr [rcx + 144]
	je .LBB1950_23
.LBB1950_17:
	mov rax, qword ptr [rcx + 152]
	vmovss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rcx + 160], r15
	.p2align	4
.LBB1950_18:
	cmp rbp, rbx
	je .LBB1950_21
	mov eax, dword ptr [rbp]
	add rbp, 4
	cmp r12, rax
	jbe .LBB1950_18
	vmovss xmm0, dword ptr [r13 + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1950_22
	jmp .LBB1950_24
.LBB1950_23:
	mov edx, 1
	mov rdi, qword ptr [rsp + 224]
	mov rsi, r15
	vmovss dword ptr [rsp + 128], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovss xmm0, dword ptr [rsp + 128]
	mov rcx, qword ptr [rsp + 24]
	jmp .LBB1950_17
.LBB1950_24:
	mov r13, qword ptr [rcx + 80]
	mov r12, qword ptr [rcx + 88]
	mov qword ptr [rcx + 184], 0
	xor r15d, r15d
	lea rbp, [rcx + 168]
	jmp .LBB1950_26
.LBB1950_29:
	xor eax, eax
	mov r14, rbx
	cmp eax, 1
	jne .LBB1950_32
.LBB1950_30:
	cmp r15, qword ptr [rcx + 168]
	je .LBB1950_31
.LBB1950_25:
	mov rax, qword ptr [rcx + 176]
	vmovss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rcx + 184], r15
	.p2align	4
.LBB1950_26:
	cmp r14, rbx
	je .LBB1950_29
	mov eax, dword ptr [r14]
	add r14, 4
	cmp r12, rax
	jbe .LBB1950_26
	vmovss xmm0, dword ptr [r13 + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1950_30
	jmp .LBB1950_32
.LBB1950_31:
	mov edx, 1
	mov rdi, rbp
	mov rsi, r15
	vmovss dword ptr [rsp + 128], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovss xmm0, dword ptr [rsp + 128]
	mov rcx, qword ptr [rsp + 24]
	jmp .LBB1950_25
.LBB1950_32:
	vmovups ymm0, ymmword ptr [rcx + 96]
	mov rsi, qword ptr [rcx + 112]
	vmovdqu ymm1, ymmword ptr [rcx]
	mov rax, qword ptr [rcx + 8]
	mov qword ptr [rsp + 296], rax
	vmovups ymmword ptr [rcx], ymm0
	vmovdqu ymmword ptr [rcx + 96], ymm1
	vmovups ymm0, ymmword ptr [rcx + 128]
	vmovdqu ymm2, ymmword ptr [rcx + 32]
	mov rax, qword ptr [rcx + 32]
	mov qword ptr [rsp + 288], rax
	mov rax, qword ptr [rcx + 56]
	mov qword ptr [rsp + 280], rax
	vmovups ymmword ptr [rcx + 32], ymm0
	vmovdqu ymmword ptr [rcx + 128], ymm2
	mov rax, qword ptr [rsp + 24]
	mov rcx, qword ptr [rax + 176]
	mov rax, qword ptr [rsp + 24]
	vmovdqu ymm0, ymmword ptr [rax + 64]
	mov rax, qword ptr [rsp + 24]
	mov rax, qword ptr [rax + 64]
	mov rdx, qword ptr [rsp + 24]
	vmovups xmm3, xmmword ptr [rdx + 160]
	mov rdx, qword ptr [rsp + 24]
	vmovups xmmword ptr [rdx + 64], xmm3
	mov rdx, qword ptr [rsp + 24]
	mov rdx, qword ptr [rdx + 80]
	mov qword ptr [rsp + 272], rdx
	mov rdx, qword ptr [rsp + 24]
	mov qword ptr [rdx + 80], rcx
	mov rcx, qword ptr [rsp + 24]
	mov qword ptr [rcx + 88], r15
	vmovdqu ymmword ptr [rcx + 160], ymm0
	test rsi, rsi
	je .LBB1950_104
	vmovss xmm3, dword ptr [rcx + 316]
	vmovss xmm4, dword ptr [rcx + 320]
	vmulss xmm4, xmm4, xmm4
	vextracti128 xmm1, ymm1, 1
	vpextrq rcx, xmm2, 1
	vmovq rdx, xmm1
	cmp rcx, rdx
	cmovb rdx, rcx
	mov rcx, qword ptr [rsp + 24]
	vmulss xmm1, xmm3, xmm3
	cmp rax, rdx
	cmovb rdx, rax
	vextracti128 xmm0, ymm0, 1
	vpextrq rax, xmm0, 1
	vmovaps xmmword ptr [rsp + 48], xmm1
	vbroadcastss ymm0, xmm1
	vmovaps xmmword ptr [rsp + 64], xmm4
	vbroadcastss ymm1, xmm4
	cmp rax, rdx
	cmovb rdx, rax
	mov qword ptr [rsp + 304], rdx
	vbroadcastss ymm2, dword ptr [rip + .LCPI1950_3]
	xor edi, edi
	mov qword ptr [rsp + 312], rsi
	vmovups ymmword ptr [rsp + 592], ymm0
	vmovups ymmword ptr [rsp + 560], ymm1
	vmovups ymmword ptr [rsp + 528], ymm2
	jmp .LBB1950_36
.LBB1950_34:
	mov rcx, qword ptr [rsp + 24]
	mov rsi, qword ptr [rsp + 312]
	.p2align	4
.LBB1950_35:
	inc rdi
	cmp rdi, rsi
	je .LBB1950_104
.LBB1950_36:
	mov r15, qword ptr [rcx + 16]
	cmp rdi, r15
	jae .LBB1950_35
	mov rax, qword ptr [rcx + 40]
	mov qword ptr [rsp + 208], rax
	cmp rdi, rax
	jae .LBB1950_35
	mov rax, qword ptr [rcx + 64]
	mov rdx, qword ptr [rcx + 88]
	mov qword ptr [rsp + 168], rax
	cmp rdi, rax
	setb cl
	mov qword ptr [rsp + 160], rdx
	cmp rdi, rdx
	setb dl
	and dl, cl
	mov rcx, qword ptr [rsp + 24]
	cmp dl, 1
	jne .LBB1950_35
	mov rax, qword ptr [rcx + 8]
	mov qword ptr [rsp + 200], rax
	vmovss xmm11, dword ptr [rax + 4*rdi]
	mov rax, qword ptr [rcx + 32]
	mov rdx, qword ptr [rcx + 56]
	mov qword ptr [rsp + 192], rax
	vmovss xmm12, dword ptr [rax + 4*rdi]
	mov rax, qword ptr [rcx + 80]
	mov qword ptr [rsp + 184], rdx
	vmovss xmm2, dword ptr [rdx + 4*rdi]
	mov qword ptr [rsp + 328], rdi
	mov qword ptr [rsp + 176], rax
	vmovss xmm3, dword ptr [rax + 4*rdi]
	vmovss dword ptr [rsp + 256], xmm11
	vmovss dword ptr [rsp + 260], xmm12
	vmovss dword ptr [rsp + 264], xmm2
	vmovss dword ptr [rsp + 268], xmm3
	vxorps xmm0, xmm0, xmm0
	vmovups xmmword ptr [rsp + 108], xmm0
	vmovaps xmmword ptr [rsp + 96], xmm0
	vmovss xmm3, dword ptr [rcx + 280]
	vmulss xmm4, xmm11, xmm3
	vxorps xmm2, xmm2, xmm2
	vmaxss xmm4, xmm4, xmm2
	vcvtss2sd xmm5, xmm4, xmm4
	mov rax, rcx
	vcvttsd2si rcx, xmm5
	mov rdx, rcx
	sar rdx, 63
	vmovsd xmm0, qword ptr [rip + .LCPI1950_5]
	vsubsd xmm6, xmm5, xmm0
	vcvttsd2si r9, xmm6
	and r9, rdx
	or r9, rcx
	vxorpd xmm6, xmm6, xmm6
	vucomisd xmm5, xmm6
	mov edi, 0
	cmovb r9, rdi
	vmovsd xmm1, qword ptr [rip + .LCPI1950_6]
	vucomisd xmm5, xmm1
	mov r8, -1
	cmova r9, r8
	mov rcx, qword ptr [rax + 264]
	mov qword ptr [rsp + 376], rcx
	sub rcx, 1
	cmovb rcx, rdi
	cmp rcx, r9
	cmovb r9, rcx
	vmovss xmm7, dword ptr [rip + .LCPI1950_4]
	vucomiss xmm4, xmm7
	cmovae r9, rdi
	vmulss xmm3, xmm12, xmm3
	vmaxss xmm3, xmm3, xmm2
	vcvtss2sd xmm4, xmm3, xmm3
	vcvttsd2si rdx, xmm4
	mov rsi, rdx
	sar rsi, 63
	vsubsd xmm5, xmm4, xmm0
	vcvttsd2si r10, xmm5
	and r10, rsi
	or r10, rdx
	vucomisd xmm4, xmm6
	cmovb r10, rdi
	vucomisd xmm4, xmm1
	cmova r10, r8
	mov rdx, qword ptr [rax + 272]
	sub rdx, 1
	cmovb rdx, rdi
	cmp rdx, r10
	cmovb r10, rdx
	vucomiss xmm3, xmm7
	cmovae r10, rdi
	mov rax, r9
	sub rax, 1
	cmovb rax, rdi
	mov qword ptr [rsp + 360], rax
	mov r14, r10
	sub r14, 1
	cmovb r14, rdi
	inc r10
	cmp rdx, r10
	cmovb r10, rdx
	vxorps xmm4, xmm4, xmm4
	vxorpd xmm5, xmm5, xmm5
	mov qword ptr [rsp + 368], r10
	cmp r14, r10
	ja .LBB1950_102
	inc r9
	cmp rcx, r9
	cmovb r9, rcx
	mov rax, qword ptr [rsp + 168]
	mov rcx, qword ptr [rsp + 160]
	cmp rax, rcx
	cmovb rcx, rax
	inc r9
	mov qword ptr [rsp + 352], r9
	mov rax, qword ptr [rsp + 208]
	cmp rax, rcx
	cmovb rcx, rax
	mov qword ptr [rsp + 336], rcx
	mov rax, qword ptr [rsp + 24]
	mov rcx, qword ptr [rax + 200]
	mov qword ptr [rsp + 344], rcx
	mov rdi, qword ptr [rax + 208]
	vbroadcastss ymm0, xmm12
	vmovups ymmword ptr [rsp + 128], ymm0
	vbroadcastss ymm0, xmm11
	vmovups ymmword ptr [rsp + 224], ymm0
	vxorps xmm0, xmm0, xmm0
	vmovaps xmmword ptr [rsp + 32], xmm0
	vxorps xmm0, xmm0, xmm0
	vmovss dword ptr [rsp + 20], xmm0
	vxorps xmm15, xmm15, xmm15
	vxorpd xmm6, xmm6, xmm6
	vxorps xmm7, xmm7, xmm7
	vxorps xmm8, xmm8, xmm8
	vxorps xmm9, xmm9, xmm9
	vxorps xmm10, xmm10, xmm10
	vxorps xmm14, xmm14, xmm14
	vmovss dword ptr [rsp + 16], xmm0
	vmovss dword ptr [rsp + 12], xmm0
	mov qword ptr [rsp + 88], rdi
	vmovaps xmmword ptr [rsp + 480], xmm11
	vmovaps xmmword ptr [rsp + 464], xmm12
	jmp .LBB1950_44
.LBB1950_41:
	vmovss xmm0, dword ptr [rsp + 16]
	vaddss xmm0, xmm0, xmm2
	vmovss dword ptr [rsp + 16], xmm0
	vmovss xmm0, dword ptr [rsp + 20]
	vaddss xmm0, xmm14, xmm0
	vmovss dword ptr [rsp + 20], xmm0
	.p2align	4
.LBB1950_42:
	vmovaps ymm15, ymm3
	vmovaps ymm14, ymm5
.LBB1950_43:
	cmp rbx, qword ptr [rsp + 368]
	lea r14, [rbx + 1]
	je .LBB1950_101
.LBB1950_44:
	mov rcx, qword ptr [rsp + 376]
	imul rcx, r14
	mov rax, qword ptr [rsp + 360]
	lea rsi, [rcx + rax]
	cmp rsi, rdi
	mov qword ptr [rsp + 216], r14
	jae .LBB1950_47
	add rcx, qword ptr [rsp + 352]
	mov r9d, 0
	mov edx, 0
	cmp rcx, rdi
	jae .LBB1950_48
	mov rax, qword ptr [rsp + 344]
	mov edx, dword ptr [rax + 4*rsi]
	mov r9d, dword ptr [rax + 4*rcx]
	jmp .LBB1950_48
	.p2align	4
.LBB1950_47:
	xor r9d, r9d
	xor edx, edx
.LBB1950_48:
	mov rbp, r9
	sub rbp, rdx
	setb dil
	mov r14, r15
	cmp r9, r15
	seta cl
	or cl, dil
	mov rax, qword ptr [rsp + 200]
	lea r10, [rax + 4*rdx]
	mov r11, rbp
	mov r15d, 0
	cmovne r11, r15
	mov eax, 4
	cmovne r10, rax
	cmp r9, qword ptr [rsp + 208]
	seta cl
	or cl, dil
	mov rcx, qword ptr [rsp + 192]
	lea rcx, [rcx + 4*rdx]
	mov rbx, rbp
	cmovne rbx, r15
	cmovne rcx, rax
	mov qword ptr [rsp + 496], rbx
	shr rbx, 3
	cmp r9, qword ptr [rsp + 168]
	seta sil
	or sil, dil
	mov rsi, qword ptr [rsp + 184]
	lea rsi, [rsi + 4*rdx]
	mov r13, rbp
	cmovne r13, r15
	cmovne rsi, rax
	mov r12, r13
	shr r13, 3
	cmp r9, qword ptr [rsp + 160]
	seta r8b
	or r8b, dil
	cmovne rbp, r15
	mov rdi, qword ptr [rsp + 176]
	lea r8, [rdi + 4*rdx]
	cmovne r8, rax
	mov rdi, rbp
	shr rdi, 3
	mov rax, r11
	shr r11, 3
	cmp rbx, r11
	cmovb r11, rbx
	cmp r13, r11
	cmovb r11, r13
	cmp rdi, r11
	cmovb r11, rdi
	test r11, r11
	je .LBB1950_51
	shl r11, 5
	xor edi, edi
	vmovups ymm12, ymmword ptr [rsp + 560]
	vmovups ymm5, ymmword ptr [rsp + 528]
	.p2align	4
.LBB1950_50:
	vmovups ymm2, ymmword ptr [r10 + rdi]
	vmovups ymm4, ymmword ptr [rcx + rdi]
	vmovups ymm0, ymmword ptr [rsp + 224]
	vsubps ymm13, ymm0, ymm2
	vmovaps ymm11, ymm14
	vmovups ymm0, ymmword ptr [rsp + 128]
	vsubps ymm14, ymm0, ymm4
	vmovaps ymm3, ymm10
	vmovaps ymm10, ymm9
	vmovaps ymm9, ymm8
	vmovaps ymm8, ymm7
	vmovapd ymm7, ymm6
	vmovaps ymm6, ymm15
	vmulps ymm15, ymm13, ymm13
	vmulps ymm0, ymm14, ymm14
	vaddps ymm0, ymm15, ymm0
	vcmpleps ymm15, ymm12, ymm0
	vcmpltps ymm1, ymm0, ymmword ptr [rsp + 592]
	vandps ymm1, ymm15, ymm1
	vxorps xmm15, xmm15, xmm15
	vcmpltps ymm15, ymm15, ymm0
	vandps ymm15, ymm15, ymm5
	vandps ymm1, ymm15, ymm1
	vmovaps ymm15, ymm6
	vmovapd ymm6, ymm7
	vmovaps ymm7, ymm8
	vmovaps ymm8, ymm9
	vmovaps ymm9, ymm10
	vcmpltps ymm0, ymm0, ymm12
	vandps ymm0, ymm0, ymm5
	vmulps ymm13, ymm13, ymm0
	vaddps ymm6, ymm13, ymm6
	vmulps ymm0, ymm14, ymm0
	vaddps ymm15, ymm15, ymm0
	vmulps ymm0, ymm2, ymm1
	vaddps ymm14, ymm11, ymm0
	vmulps ymm0, ymm4, ymm1
	vmulps ymm2, ymm1, ymmword ptr [rsi + rdi]
	vaddps ymm10, ymm0, ymm3
	vaddps ymm9, ymm9, ymm2
	vmulps ymm0, ymm1, ymmword ptr [r8 + rdi]
	vaddps ymm8, ymm8, ymm0
	vaddps ymm7, ymm1, ymm7
	add rdi, 32
	cmp r11, rdi
	jne .LBB1950_50
.LBB1950_51:
	vxorps xmm12, xmm12, xmm12
	mov r13, rax
	mov edx, r13d
	and edx, 7
	mov rbx, r9
	sub rbx, 8
	mov edi, 0
	cmovae rdi, rbx
	test rdx, rdx
	mov r15, r14
	je .LBB1950_54
	lea rbx, [rdi + 8]
	cmp rbx, r15
	ja .LBB1950_54
	cmp rbx, qword ptr [rsp + 336]
	jbe .LBB1950_63
	.p2align	4
.LBB1950_54:
	mov r14, qword ptr [rsp + 496]
	mov edi, r14d
	and edi, 7
	mov r9d, r12d
	and r9d, 7
	mov ebx, ebp
	and ebx, 7
	cmp rdi, rdx
	cmovb rdx, rdi
	cmp r9, rdx
	cmovb rdx, r9
	cmp rbx, rdx
	cmovb rdx, rbx
	test rdx, rdx
	vmovaps xmm11, xmmword ptr [rsp + 480]
	mov rbx, qword ptr [rsp + 216]
	je .LBB1950_73
	vmovaps ymm5, ymm14
	vmovaps ymm3, ymm15
	and r13d, -8
	and r14d, -8
	and r12d, -8
	and ebp, -8
	vmovss xmm15, dword ptr [r10 + 4*r13]
	vmovss xmm4, dword ptr [rcx + 4*r14]
	vsubss xmm14, xmm11, xmm15
	vmovaps xmm12, xmmword ptr [rsp + 464]
	vsubss xmm2, xmm12, xmm4
	vmulss xmm0, xmm14, xmm14
	vmulss xmm1, xmm2, xmm2
	vaddss xmm13, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 64]
	vucomiss xmm0, xmm13
	mov rdi, qword ptr [rsp + 88]
	jbe .LBB1950_57
	vmovss xmm0, dword ptr [rsp + 16]
	vaddss xmm0, xmm14, xmm0
	vmovss dword ptr [rsp + 16], xmm0
	vmovss xmm0, dword ptr [rsp + 20]
	vaddss xmm0, xmm0, xmm2
	vmovss dword ptr [rsp + 20], xmm0
	jmp .LBB1950_60
	.p2align	4
.LBB1950_57:
	vmovaps xmm0, xmmword ptr [rsp + 48]
	vucomiss xmm0, xmm13
	jbe .LBB1950_60
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm13, xmm0
	jbe .LBB1950_60
	vmovss xmm0, dword ptr [rsi + 4*r12]
	vmovss xmm1, dword ptr [r8 + 4*rbp]
	vinsertps xmm2, xmm15, xmm4, 16
	vinsertps xmm0, xmm2, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vmovaps xmm1, xmmword ptr [rsp + 32]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 32], xmm1
	vmovss xmm0, dword ptr [rsp + 12]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovss dword ptr [rsp + 12], xmm0
.LBB1950_60:
	cmp edx, 1
	je .LBB1950_42
	vmovss xmm15, dword ptr [r10 + 4*r13 + 4]
	vmovss xmm4, dword ptr [rcx + 4*r14 + 4]
	vsubss xmm2, xmm11, xmm15
	vsubss xmm14, xmm12, xmm4
	vmulss xmm0, xmm2, xmm2
	vmulss xmm1, xmm14, xmm14
	vaddss xmm13, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 64]
	vucomiss xmm0, xmm13
	jbe .LBB1950_65
	vmovss xmm0, dword ptr [rsp + 16]
	vaddss xmm0, xmm0, xmm2
	vmovss dword ptr [rsp + 16], xmm0
	vmovss xmm0, dword ptr [rsp + 20]
	vaddss xmm0, xmm14, xmm0
	vmovss dword ptr [rsp + 20], xmm0
	jmp .LBB1950_68
.LBB1950_63:
	vmovups ymmword ptr [rsp + 496], ymm15
	sub r9, rdi
	cmp r9, 8
	mov rbx, qword ptr [rsp + 216]
	vmovaps ymm5, ymm14
	jne .LBB1950_71
	lea rax, [rip + swarm::rules::lanes::STEPS]
	lea rcx, [rax + 4*rdx]
	add rcx, 224
	jmp .LBB1950_72
.LBB1950_65:
	vmovaps xmm0, xmmword ptr [rsp + 48]
	vucomiss xmm0, xmm13
	jbe .LBB1950_68
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm13, xmm0
	jbe .LBB1950_68
	vmovss xmm0, dword ptr [rsi + 4*r12 + 4]
	vmovss xmm1, dword ptr [r8 + 4*rbp + 4]
	vinsertps xmm2, xmm15, xmm4, 16
	vinsertps xmm0, xmm2, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vmovaps xmm1, xmmword ptr [rsp + 32]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 32], xmm1
	vmovss xmm0, dword ptr [rsp + 12]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovss dword ptr [rsp + 12], xmm0
.LBB1950_68:
	cmp edx, 2
	je .LBB1950_42
	vmovss xmm15, dword ptr [r10 + 4*r13 + 8]
	vmovss xmm4, dword ptr [rcx + 4*r14 + 8]
	vsubss xmm2, xmm11, xmm15
	vsubss xmm14, xmm12, xmm4
	vmulss xmm0, xmm2, xmm2
	vmulss xmm1, xmm14, xmm14
	vaddss xmm13, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 64]
	vucomiss xmm0, xmm13
	jbe .LBB1950_74
	vmovss xmm0, dword ptr [rsp + 16]
	vaddss xmm0, xmm0, xmm2
	vmovss dword ptr [rsp + 16], xmm0
	vmovss xmm0, dword ptr [rsp + 20]
	vaddss xmm0, xmm14, xmm0
	vmovss dword ptr [rsp + 20], xmm0
	jmp .LBB1950_77
.LBB1950_71:
	mov rcx, r9
	sub rcx, rdx
	vmovq xmm0, r9
	vpbroadcastq ymm0, xmm0
	vmovq xmm1, rdx
	vpblendd ymm2, ymm0, ymm1, 3
	vmovdqa ymm3, ymmword ptr [rip + .LCPI1950_8]
	vpblendd ymm4, ymm3, ymm0, 3
	vpinsrq xmm13, xmm3, r9, 0
	vpunpcklqdq xmm1, xmm1, xmm0
	vpcmpeqq xmm1, xmm1, xmm13
	vpshuflw xmm1, xmm1, 232
	vpackssdw xmm15, xmm1, xmm1
	vpbroadcastq ymm1, qword ptr [rip + .LCPI1950_9]
	vpxor ymm4, ymm4, ymm1
	vpxor ymm2, ymm2, ymm1
	vpcmpgtq ymm2, ymm2, ymm4
	vpxor ymm0, ymm0, ymm1
	vpcmpgtq ymm0, ymm0, ymmword ptr [rip + .LCPI1950_10]
	vpackssdw ymm0, ymm2, ymm0
	vextracti128 xmm2, ymm0, 1
	vpackssdw xmm0, xmm0, xmm2
	vpshufd xmm0, xmm0, 216
	vmovq xmm2, rcx
	vpbroadcastq ymm2, xmm2
	vpxor ymm1, ymm2, ymm1
	vmovdqa ymm2, ymmword ptr [rip + .LCPI1950_11]
	vpcmpgtq ymm1, ymm2, ymm1
	vextracti128 xmm2, ymm1, 1
	vpackssdw xmm1, xmm1, xmm2
	vpshufb xmm1, xmm1, xmmword ptr [rip + .LCPI1950_12]
	vpcmpeqd xmm2, xmm2, xmm2
	vpblendw xmm1, xmm1, xmm2, 1
	xor eax, eax
	xor edx, edx
	cmp rcx, 6
	setb al
	setbe dl
	xor esi, esi
	cmp rcx, 8
	setb sil
	vpinsrw xmm1, xmm1, eax, 5
	vpinsrw xmm1, xmm1, edx, 6
	vpinsrw xmm1, xmm1, esi, 7
	vpblendw xmm0, xmm0, xmm15, 1
	vpand xmm0, xmm0, xmm1
	vpmovzxwd ymm0, xmm0
	vpbroadcastd ymm1, dword ptr [rip + .LCPI1950_13]
	vpand ymm0, ymm0, ymm1
	vcvtdq2ps ymm0, ymm0
	vmovups ymmword ptr [rsp + 400], ymm0
	lea rcx, [rsp + 400]
.LBB1950_72:
	vmovups ymm3, ymmword ptr [rsp + 128]
	vmovups ymm2, ymmword ptr [rsp + 224]
	mov rax, qword ptr [rsp + 200]
	vmovups ymm0, ymmword ptr [rax + 4*rdi]
	mov rax, qword ptr [rsp + 192]
	vmovups ymm1, ymmword ptr [rax + 4*rdi]
	vsubps ymm2, ymm2, ymm0
	vsubps ymm4, ymm3, ymm1
	vmulps ymm13, ymm2, ymm2
	vmulps ymm14, ymm4, ymm4
	vaddps ymm13, ymm13, ymm14
	vmovups ymm11, ymmword ptr [rsp + 560]
	vcmpleps ymm14, ymm11, ymm13
	vcmpltps ymm15, ymm13, ymmword ptr [rsp + 592]
	vandps ymm14, ymm14, ymm15
	vcmpltps ymm15, ymm12, ymm13
	vmovups ymm3, ymmword ptr [rsp + 528]
	vandps ymm15, ymm15, ymm3
	vandps ymm14, ymm15, ymm14
	vmovups ymm15, ymmword ptr [rcx]
	vcmpltps ymm13, ymm13, ymm11
	vandps ymm13, ymm13, ymm3
	vmulps ymm13, ymm15, ymm13
	vmulps ymm14, ymm15, ymm14
	vmulps ymm2, ymm13, ymm2
	vaddps ymm6, ymm6, ymm2
	vmulps ymm2, ymm13, ymm4
	vmovups ymm15, ymmword ptr [rsp + 496]
	vaddps ymm15, ymm15, ymm2
	vmulps ymm0, ymm14, ymm0
	vaddps ymm5, ymm5, ymm0
	vmulps ymm0, ymm14, ymm1
	vaddps ymm10, ymm10, ymm0
	mov rax, qword ptr [rsp + 184]
	vmulps ymm0, ymm14, ymmword ptr [rax + 4*rdi]
	vaddps ymm9, ymm9, ymm0
	mov rax, qword ptr [rsp + 176]
	vmulps ymm0, ymm14, ymmword ptr [rax + 4*rdi]
	vaddps ymm8, ymm8, ymm0
	vaddps ymm7, ymm14, ymm7
	vmovaps ymm14, ymm5
.LBB1950_73:
	mov rdi, qword ptr [rsp + 88]
	jmp .LBB1950_43
.LBB1950_74:
	vmovaps xmm0, xmmword ptr [rsp + 48]
	vucomiss xmm0, xmm13
	jbe .LBB1950_77
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm13, xmm0
	jbe .LBB1950_77
	vmovss xmm0, dword ptr [rsi + 4*r12 + 8]
	vmovss xmm1, dword ptr [r8 + 4*rbp + 8]
	vinsertps xmm2, xmm15, xmm4, 16
	vinsertps xmm0, xmm2, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vmovaps xmm1, xmmword ptr [rsp + 32]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 32], xmm1
	vmovss xmm0, dword ptr [rsp + 12]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovss dword ptr [rsp + 12], xmm0
.LBB1950_77:
	cmp edx, 3
	je .LBB1950_42
	vmovss xmm15, dword ptr [r10 + 4*r13 + 12]
	vmovss xmm4, dword ptr [rcx + 4*r14 + 12]
	vsubss xmm2, xmm11, xmm15
	vsubss xmm14, xmm12, xmm4
	vmulss xmm0, xmm2, xmm2
	vmulss xmm1, xmm14, xmm14
	vaddss xmm13, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 64]
	vucomiss xmm0, xmm13
	jbe .LBB1950_80
	vmovss xmm0, dword ptr [rsp + 16]
	vaddss xmm0, xmm0, xmm2
	vmovss dword ptr [rsp + 16], xmm0
	vmovss xmm0, dword ptr [rsp + 20]
	vaddss xmm0, xmm14, xmm0
	vmovss dword ptr [rsp + 20], xmm0
	jmp .LBB1950_83
.LBB1950_80:
	vmovaps xmm0, xmmword ptr [rsp + 48]
	vucomiss xmm0, xmm13
	jbe .LBB1950_83
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm13, xmm0
	jbe .LBB1950_83
	vmovss xmm0, dword ptr [rsi + 4*r12 + 12]
	vmovss xmm1, dword ptr [r8 + 4*rbp + 12]
	vinsertps xmm2, xmm15, xmm4, 16
	vinsertps xmm0, xmm2, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vmovaps xmm1, xmmword ptr [rsp + 32]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 32], xmm1
	vmovss xmm0, dword ptr [rsp + 12]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovss dword ptr [rsp + 12], xmm0
.LBB1950_83:
	cmp edx, 4
	je .LBB1950_42
	vmovss xmm15, dword ptr [r10 + 4*r13 + 16]
	vmovss xmm4, dword ptr [rcx + 4*r14 + 16]
	vsubss xmm2, xmm11, xmm15
	vsubss xmm14, xmm12, xmm4
	vmulss xmm0, xmm2, xmm2
	vmulss xmm1, xmm14, xmm14
	vaddss xmm13, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 64]
	vucomiss xmm0, xmm13
	jbe .LBB1950_86
	vmovss xmm0, dword ptr [rsp + 16]
	vaddss xmm0, xmm0, xmm2
	vmovss dword ptr [rsp + 16], xmm0
	vmovss xmm0, dword ptr [rsp + 20]
	vaddss xmm0, xmm14, xmm0
	vmovss dword ptr [rsp + 20], xmm0
	jmp .LBB1950_89
.LBB1950_86:
	vmovaps xmm0, xmmword ptr [rsp + 48]
	vucomiss xmm0, xmm13
	jbe .LBB1950_89
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm13, xmm0
	jbe .LBB1950_89
	vmovss xmm0, dword ptr [rsi + 4*r12 + 16]
	vmovss xmm1, dword ptr [r8 + 4*rbp + 16]
	vinsertps xmm2, xmm15, xmm4, 16
	vinsertps xmm0, xmm2, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vmovaps xmm1, xmmword ptr [rsp + 32]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 32], xmm1
	vmovss xmm0, dword ptr [rsp + 12]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovss dword ptr [rsp + 12], xmm0
.LBB1950_89:
	cmp edx, 5
	je .LBB1950_42
	vmovss xmm15, dword ptr [r10 + 4*r13 + 20]
	vmovss xmm4, dword ptr [rcx + 4*r14 + 20]
	vsubss xmm2, xmm11, xmm15
	vsubss xmm14, xmm12, xmm4
	vmulss xmm0, xmm2, xmm2
	vmulss xmm1, xmm14, xmm14
	vaddss xmm13, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 64]
	vucomiss xmm0, xmm13
	jbe .LBB1950_92
	vmovss xmm0, dword ptr [rsp + 16]
	vaddss xmm0, xmm0, xmm2
	vmovss dword ptr [rsp + 16], xmm0
	vmovss xmm0, dword ptr [rsp + 20]
	vaddss xmm0, xmm14, xmm0
	vmovss dword ptr [rsp + 20], xmm0
	jmp .LBB1950_95
.LBB1950_92:
	vmovaps xmm0, xmmword ptr [rsp + 48]
	vucomiss xmm0, xmm13
	jbe .LBB1950_95
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm13, xmm0
	jbe .LBB1950_95
	vmovss xmm0, dword ptr [rsi + 4*r12 + 20]
	vmovss xmm1, dword ptr [r8 + 4*rbp + 20]
	vinsertps xmm2, xmm15, xmm4, 16
	vinsertps xmm0, xmm2, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vmovaps xmm1, xmmword ptr [rsp + 32]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 32], xmm1
	vmovss xmm0, dword ptr [rsp + 12]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovss dword ptr [rsp + 12], xmm0
.LBB1950_95:
	cmp edx, 6
	je .LBB1950_42
	vmovss xmm15, dword ptr [r10 + 4*r13 + 24]
	vmovss xmm4, dword ptr [rcx + 4*r14 + 24]
	vsubss xmm2, xmm11, xmm15
	vsubss xmm14, xmm12, xmm4
	vmulss xmm0, xmm2, xmm2
	vmulss xmm1, xmm14, xmm14
	vaddss xmm13, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 64]
	vucomiss xmm0, xmm13
	ja .LBB1950_41
	vmovaps xmm0, xmmword ptr [rsp + 48]
	vucomiss xmm0, xmm13
	jbe .LBB1950_42
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm13, xmm0
	vmovaps ymm14, ymm5
	jbe .LBB1950_100
	vmovss xmm0, dword ptr [rsi + 4*r12 + 24]
	vmovss xmm1, dword ptr [r8 + 4*rbp + 24]
	vinsertps xmm2, xmm15, xmm4, 16
	vinsertps xmm0, xmm2, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vmovaps xmm1, xmmword ptr [rsp + 32]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 32], xmm1
	vmovss xmm0, dword ptr [rsp + 12]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovss dword ptr [rsp + 12], xmm0
.LBB1950_100:
	vmovaps ymm15, ymm3
	jmp .LBB1950_43
.LBB1950_101:
	vmovaps ymm5, ymm6
	vmovaps xmm6, xmmword ptr [rsp + 32]
	vmovaps xmmword ptr [rsp + 96], xmm6
	vmovss xmm0, dword ptr [rsp + 12]
	vmovss dword ptr [rsp + 112], xmm0
	vmovss xmm0, dword ptr [rsp + 16]
	vmovss dword ptr [rsp + 116], xmm0
	vmovss xmm3, dword ptr [rsp + 20]
	vmovss dword ptr [rsp + 120], xmm3
	vunpcklps xmm0, xmm14, xmm10
	vmovlhps xmm0, xmm0, xmm9
	vinsertps xmm0, xmm0, xmm8, 48
	vinsertps xmm1, xmm10, xmm14, 76
	vshufps xmm1, xmm1, xmm9, 212
	vinsertps xmm1, xmm1, xmm8, 112
	vaddps xmm0, xmm0, xmm1
	vunpckhps xmm1, xmm14, xmm10
	vblendps xmm1, xmm9, xmm1, 3
	vinsertps xmm1, xmm1, xmm8, 176
	vaddps xmm0, xmm0, xmm1
	vshufps xmm1, xmm10, xmm14, 51
	vshufps xmm1, xmm1, xmm9, 242
	vblendps xmm1, xmm1, xmm8, 8
	vaddps xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm10, 1
	vextractf128 xmm2, ymm14, 1
	vunpcklps xmm4, xmm2, xmm1
	vmovaps ymm10, ymm8
	vextractf128 xmm8, ymm9, 1
	vmovlhps xmm4, xmm4, xmm8
	vmovaps ymm9, ymm7
	vextractf128 xmm7, ymm10, 1
	vinsertps xmm4, xmm4, xmm7, 48
	vaddps xmm0, xmm0, xmm4
	vinsertps xmm4, xmm1, xmm2, 76
	vshufps xmm4, xmm4, xmm8, 212
	vinsertps xmm4, xmm4, xmm7, 112
	vaddps xmm0, xmm0, xmm4
	vunpckhps xmm4, xmm2, xmm1
	vblendps xmm4, xmm8, xmm4, 3
	vinsertps xmm4, xmm4, xmm7, 176
	vaddps xmm0, xmm0, xmm4
	vshufps xmm1, xmm1, xmm2, 51
	vshufps xmm1, xmm1, xmm8, 242
	vblendps xmm1, xmm1, xmm7, 8
	vaddps xmm0, xmm0, xmm1
	vhaddps xmm1, xmm9, xmm5
	vshufps xmm1, xmm1, xmm1, 232
	vshufpd xmm2, xmm9, xmm9, 1
	vinsertps xmm2, xmm2, xmm5, 156
	vaddps xmm1, xmm1, xmm2
	vshufpd xmm2, xmm5, xmm5, 1
	vinsertps xmm2, xmm2, xmm9, 204
	vaddps xmm1, xmm1, xmm2
	vextractf128 xmm2, ymm5, 1
	vextractf128 xmm4, ymm9, 1
	vinsertps xmm5, xmm4, xmm2, 28
	vaddps xmm1, xmm1, xmm5
	vinsertps xmm5, xmm2, xmm4, 76
	vaddps xmm1, xmm1, xmm5
	vshufpd xmm5, xmm4, xmm4, 1
	vinsertps xmm5, xmm5, xmm2, 156
	vaddps xmm1, xmm1, xmm5
	vshufpd xmm2, xmm2, xmm2, 1
	vinsertps xmm2, xmm2, xmm4, 204
	vaddps xmm1, xmm1, xmm2
	vmovsd xmm2, qword ptr [rsp + 112]
	vaddps xmm5, xmm1, xmm2
	vaddps xmm4, xmm0, xmm6
	vmovshdup xmm0, xmm15
	vaddss xmm0, xmm15, xmm0
	vshufpd xmm1, xmm15, xmm15, 1
	vaddss xmm0, xmm0, xmm1
	vshufps xmm1, xmm15, xmm15, 255
	vaddss xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm15, 1
	vaddss xmm0, xmm0, xmm1
	vmovshdup xmm2, xmm1
	vaddss xmm0, xmm0, xmm2
	vshufpd xmm2, xmm1, xmm1, 1
	vaddss xmm0, xmm0, xmm2
	vshufps xmm1, xmm1, xmm1, 255
	vaddss xmm0, xmm0, xmm1
	vaddss xmm2, xmm0, xmm3
.LBB1950_102:
	vmovaps xmmword ptr [rsp + 96], xmm4
	vmovlpd qword ptr [rsp + 112], xmm5
	vmovss dword ptr [rsp + 120], xmm2
	lea rdi, [rsp + 400]
	mov rsi, qword ptr [rsp + 320]
	vmovaps xmm0, xmmword ptr [rsp + 448]
	vmovaps xmm1, xmmword ptr [rsp + 432]
	lea rdx, [rsp + 384]
	lea rcx, [rsp + 256]
	lea r8, [rsp + 96]
	vzeroupper
	call swarm::rules::finish
	mov rdi, qword ptr [rsp + 328]
	cmp rdi, qword ptr [rsp + 304]
	jae .LBB1950_34
	vmovss xmm0, dword ptr [rsp + 400]
	vmovss xmm1, dword ptr [rsp + 404]
	vmovss xmm2, dword ptr [rsp + 408]
	vmovss xmm3, dword ptr [rsp + 412]
	mov rax, qword ptr [rsp + 296]
	vmovss dword ptr [rax + 4*rdi], xmm0
	mov rax, qword ptr [rsp + 288]
	vmovss dword ptr [rax + 4*rdi], xmm1
	mov rax, qword ptr [rsp + 280]
	vmovss dword ptr [rax + 4*rdi], xmm2
	mov rax, qword ptr [rsp + 272]
	vmovss dword ptr [rax + 4*rdi], xmm3
	jmp .LBB1950_34
.LBB1950_104:
	add rsp, 632
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
	vzeroupper
	ret
