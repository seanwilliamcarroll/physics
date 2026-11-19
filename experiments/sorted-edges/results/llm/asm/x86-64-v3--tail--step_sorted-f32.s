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
	sub rsp, 584
	.cfi_def_cfa_offset 640
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r14, rdi
	lea rax, [rdi + 316]
	mov qword ptr [rsp + 312], rax
	mov eax, dword ptr [rdi + 312]
	mov dword ptr [rsp + 376], eax
	mov rax, qword ptr [rdi + 304]
	mov qword ptr [rsp + 368], rax
	vmovss xmm6, dword ptr [rdi + 316]
	mov rsi, qword ptr [rdi + 8]
	mov rdx, qword ptr [rdi + 16]
	vmovsd xmm5, qword ptr [rdi + 288]
	vmovss xmm0, dword ptr [rip + .LCPI1950_0]
	vmulss xmm1, xmm5, xmm0
	vbroadcastss xmm2, dword ptr [rip + .LCPI1950_1]
	vorps xmm3, xmm6, xmm2
	vmaxss xmm4, xmm6, xmm1
	vandps xmm3, xmm3, xmm4
	vcmpunordss xmm4, xmm6, xmm6
	vblendvps xmm3, xmm3, xmm1, xmm4
	mov rcx, qword ptr [rdi + 32]
	vcmpunordss xmm1, xmm1, xmm1
	vmovaps xmmword ptr [rsp + 416], xmm6
	vblendvps xmm1, xmm3, xmm6, xmm1
	vmovshdup xmm3, xmm5
	vmovaps xmmword ptr [rsp + 448], xmm3
	vmulss xmm0, xmm3, xmm0
	vorps xmm2, xmm1, xmm2
	vmaxss xmm3, xmm1, xmm0
	vandps xmm2, xmm2, xmm3
	vcmpunordss xmm3, xmm1, xmm1
	vblendvps xmm2, xmm2, xmm0, xmm3
	mov r8, qword ptr [rdi + 40]
	vcmpunordss xmm0, xmm0, xmm0
	vblendvps xmm0, xmm2, xmm1, xmm0
	vmulss xmm0, xmm0, dword ptr [rip + .LCPI1950_2]
	vmovss xmm1, dword ptr [rip + .LCPI1950_3]
	vdivss xmm0, xmm1, xmm0
	vmovss dword ptr [rdi + 280], xmm0
	vbroadcastss xmm0, xmm0
	vmovq xmm0, xmm0
	vmovaps xmmword ptr [rsp + 464], xmm5
	vmulps xmm0, xmm5, xmm0
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
	vmovddup xmm2, qword ptr [rip + .LCPI1950_12]
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
	mov qword ptr [rsp], rcx
	jmp .LBB1950_1
.LBB1950_8:
	mov rax, qword ptr [rcx + 104]
	vmovss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rcx + 112], r15
	.p2align	4
.LBB1950_1:
	cmp r13, rbx
	je .LBB1950_2
	mov eax, dword ptr [r13]
	add r13, 4
	cmp r12, rax
	jbe .LBB1950_1
	vmovss xmm0, dword ptr [rbp + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1950_6
	jmp .LBB1950_9
.LBB1950_2:
	xor eax, eax
	mov r13, rbx
	cmp eax, 1
	jne .LBB1950_9
.LBB1950_6:
	cmp r15, qword ptr [rcx + 96]
	jne .LBB1950_8
	mov edx, 1
	mov rdi, qword ptr [rsp + 224]
	mov rsi, r15
	vmovss dword ptr [rsp + 32], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovss xmm0, dword ptr [rsp + 32]
	mov rcx, qword ptr [rsp]
	jmp .LBB1950_8
.LBB1950_9:
	mov r13, qword ptr [rcx + 32]
	mov r12, qword ptr [rcx + 40]
	mov qword ptr [rcx + 136], 0
	xor r15d, r15d
	lea rax, [rcx + 120]
	mov qword ptr [rsp + 224], rax
	mov rbp, r14
	jmp .LBB1950_10
.LBB1950_17:
	mov rax, qword ptr [rcx + 128]
	vmovss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rcx + 136], r15
	.p2align	4
.LBB1950_10:
	cmp rbp, rbx
	je .LBB1950_11
	mov eax, dword ptr [rbp]
	add rbp, 4
	cmp r12, rax
	jbe .LBB1950_10
	vmovss xmm0, dword ptr [r13 + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1950_15
	jmp .LBB1950_18
.LBB1950_11:
	xor eax, eax
	mov rbp, rbx
	cmp eax, 1
	jne .LBB1950_18
.LBB1950_15:
	cmp r15, qword ptr [rcx + 120]
	jne .LBB1950_17
	mov edx, 1
	mov rdi, qword ptr [rsp + 224]
	mov rsi, r15
	vmovss dword ptr [rsp + 32], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovss xmm0, dword ptr [rsp + 32]
	mov rcx, qword ptr [rsp]
	jmp .LBB1950_17
.LBB1950_18:
	mov r13, qword ptr [rcx + 56]
	mov r12, qword ptr [rcx + 64]
	mov qword ptr [rcx + 160], 0
	xor r15d, r15d
	lea rax, [rcx + 144]
	mov qword ptr [rsp + 224], rax
	mov rbp, r14
	jmp .LBB1950_19
.LBB1950_26:
	mov rax, qword ptr [rcx + 152]
	vmovss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rcx + 160], r15
	.p2align	4
.LBB1950_19:
	cmp rbp, rbx
	je .LBB1950_20
	mov eax, dword ptr [rbp]
	add rbp, 4
	cmp r12, rax
	jbe .LBB1950_19
	vmovss xmm0, dword ptr [r13 + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1950_24
	jmp .LBB1950_27
.LBB1950_20:
	xor eax, eax
	mov rbp, rbx
	cmp eax, 1
	jne .LBB1950_27
.LBB1950_24:
	cmp r15, qword ptr [rcx + 144]
	jne .LBB1950_26
	mov edx, 1
	mov rdi, qword ptr [rsp + 224]
	mov rsi, r15
	vmovss dword ptr [rsp + 32], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovss xmm0, dword ptr [rsp + 32]
	mov rcx, qword ptr [rsp]
	jmp .LBB1950_26
.LBB1950_27:
	mov r13, qword ptr [rcx + 80]
	mov r12, qword ptr [rcx + 88]
	mov qword ptr [rcx + 184], 0
	xor r15d, r15d
	lea rbp, [rcx + 168]
	jmp .LBB1950_28
.LBB1950_35:
	mov rax, qword ptr [rcx + 176]
	vmovss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rcx + 184], r15
	.p2align	4
.LBB1950_28:
	cmp r14, rbx
	je .LBB1950_29
	mov eax, dword ptr [r14]
	add r14, 4
	cmp r12, rax
	jbe .LBB1950_28
	vmovss xmm0, dword ptr [r13 + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1950_33
	jmp .LBB1950_36
.LBB1950_29:
	xor eax, eax
	mov r14, rbx
	cmp eax, 1
	jne .LBB1950_36
.LBB1950_33:
	cmp r15, qword ptr [rcx + 168]
	jne .LBB1950_35
	mov edx, 1
	mov rdi, rbp
	mov rsi, r15
	vmovss dword ptr [rsp + 32], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovss xmm0, dword ptr [rsp + 32]
	mov rcx, qword ptr [rsp]
	jmp .LBB1950_35
.LBB1950_36:
	vmovups ymm0, ymmword ptr [rcx + 96]
	mov rsi, qword ptr [rcx + 112]
	vmovdqu ymm1, ymmword ptr [rcx]
	mov rax, qword ptr [rcx + 8]
	mov qword ptr [rsp + 288], rax
	vmovups ymmword ptr [rcx], ymm0
	vmovdqu ymmword ptr [rcx + 96], ymm1
	vmovups ymm0, ymmword ptr [rcx + 128]
	vmovdqu ymm2, ymmword ptr [rcx + 32]
	mov rax, qword ptr [rcx + 32]
	mov qword ptr [rsp + 280], rax
	mov rax, qword ptr [rcx + 56]
	mov qword ptr [rsp + 272], rax
	vmovups ymmword ptr [rcx + 32], ymm0
	vmovdqu ymmword ptr [rcx + 128], ymm2
	mov rax, qword ptr [rsp]
	mov rcx, qword ptr [rax + 176]
	mov rax, qword ptr [rsp]
	vmovdqu ymm0, ymmword ptr [rax + 64]
	mov rax, qword ptr [rsp]
	mov rax, qword ptr [rax + 64]
	mov rdx, qword ptr [rsp]
	vmovups xmm3, xmmword ptr [rdx + 160]
	mov rdx, qword ptr [rsp]
	vmovups xmmword ptr [rdx + 64], xmm3
	mov rdx, qword ptr [rsp]
	mov rdx, qword ptr [rdx + 80]
	mov qword ptr [rsp + 264], rdx
	mov rdx, qword ptr [rsp]
	mov qword ptr [rdx + 80], rcx
	mov rcx, qword ptr [rsp]
	mov qword ptr [rcx + 88], r15
	vmovdqu ymmword ptr [rcx + 160], ymm0
	test rsi, rsi
	je .LBB1950_63
	vmovss xmm3, dword ptr [rcx + 320]
	vmulss xmm3, xmm3, xmm3
	vextracti128 xmm1, ymm1, 1
	vpextrq rcx, xmm2, 1
	vmovq rdx, xmm1
	cmp rcx, rdx
	cmovb rdx, rcx
	mov rcx, qword ptr [rsp]
	vmovaps xmm1, xmmword ptr [rsp + 416]
	vmulss xmm1, xmm1, xmm1
	cmp rax, rdx
	cmovb rdx, rax
	vextracti128 xmm0, ymm0, 1
	vpextrq rax, xmm0, 1
	vmovaps xmmword ptr [rsp + 80], xmm1
	vbroadcastss ymm0, xmm1
	vmovaps xmmword ptr [rsp + 96], xmm3
	vbroadcastss ymm1, xmm3
	cmp rax, rdx
	cmovb rdx, rax
	mov qword ptr [rsp + 296], rdx
	xor edx, edx
	mov qword ptr [rsp + 304], rsi
	vmovups ymmword ptr [rsp + 416], ymm0
	vmovups ymmword ptr [rsp + 544], ymm1
	jmp .LBB1950_38
.LBB1950_61:
	mov rcx, qword ptr [rsp]
	mov rsi, qword ptr [rsp + 304]
	.p2align	4
.LBB1950_62:
	inc rdx
	cmp rdx, rsi
	je .LBB1950_63
.LBB1950_38:
	mov r10, qword ptr [rcx + 16]
	cmp rdx, r10
	jae .LBB1950_62
	mov rax, qword ptr [rcx + 40]
	mov qword ptr [rsp + 152], rax
	cmp rdx, rax
	jae .LBB1950_62
	mov rax, qword ptr [rcx + 64]
	mov rcx, qword ptr [rcx + 88]
	mov qword ptr [rsp + 144], rax
	cmp rdx, rax
	setb al
	mov qword ptr [rsp + 136], rcx
	cmp rdx, rcx
	setb cl
	and cl, al
	cmp cl, 1
	mov rcx, qword ptr [rsp]
	jne .LBB1950_62
	mov rax, qword ptr [rcx + 8]
	mov qword ptr [rsp + 184], rax
	vmovss xmm1, dword ptr [rax + 4*rdx]
	mov rax, qword ptr [rcx + 32]
	mov rsi, qword ptr [rcx + 56]
	mov qword ptr [rsp + 176], rax
	vmovss xmm0, dword ptr [rax + 4*rdx]
	mov rax, qword ptr [rcx + 80]
	mov qword ptr [rsp + 168], rsi
	vmovss xmm2, dword ptr [rsi + 4*rdx]
	mov qword ptr [rsp + 320], rdx
	mov qword ptr [rsp + 160], rax
	vmovss xmm3, dword ptr [rax + 4*rdx]
	vmovss dword ptr [rsp + 192], xmm1
	vmovss dword ptr [rsp + 196], xmm0
	vmovss dword ptr [rsp + 200], xmm2
	vmovss dword ptr [rsp + 204], xmm3
	vxorps xmm2, xmm2, xmm2
	vmovups xmmword ptr [rsp + 396], xmm2
	vmovaps xmmword ptr [rsp + 384], xmm2
	vmovss xmm2, dword ptr [rcx + 280]
	vmulss xmm3, xmm1, xmm2
	vxorps xmm7, xmm7, xmm7
	vmaxss xmm3, xmm3, xmm7
	vroundss xmm3, xmm3, xmm3, 9
	vcvtss2sd xmm4, xmm3, xmm3
	vcvttsd2si rax, xmm4
	mov rsi, rcx
	mov rcx, rax
	sar rcx, 63
	vmovsd xmm6, qword ptr [rip + .LCPI1950_5]
	vsubsd xmm5, xmm4, xmm6
	vcvttsd2si rbx, xmm5
	and rbx, rcx
	or rbx, rax
	vxorpd xmm8, xmm8, xmm8
	vucomisd xmm4, xmm8
	mov edi, 0
	cmovb rbx, rdi
	vmovsd xmm5, qword ptr [rip + .LCPI1950_6]
	vucomisd xmm4, xmm5
	mov r8, -1
	cmova rbx, r8
	mov rax, qword ptr [rsi + 264]
	mov qword ptr [rsp + 360], rax
	sub rax, 1
	cmovb rax, rdi
	cmp rax, rbx
	cmovb rbx, rax
	vmovss xmm9, dword ptr [rip + .LCPI1950_4]
	vucomiss xmm3, xmm9
	cmovae rbx, rdi
	vmulss xmm2, xmm0, xmm2
	vmaxss xmm2, xmm2, xmm7
	vroundss xmm2, xmm2, xmm2, 9
	vcvtss2sd xmm3, xmm2, xmm2
	vcvttsd2si rcx, xmm3
	mov rdx, rcx
	sar rdx, 63
	vsubsd xmm4, xmm3, xmm6
	vcvttsd2si r9, xmm4
	and r9, rdx
	or r9, rcx
	vucomisd xmm3, xmm8
	cmovb r9, rdi
	vucomisd xmm3, xmm5
	cmova r9, r8
	mov rcx, qword ptr [rsi + 272]
	sub rcx, 1
	cmovb rcx, rdi
	cmp rcx, r9
	cmovb r9, rcx
	vucomiss xmm2, xmm9
	cmovae r9, rdi
	mov rdx, rbx
	sub rdx, 1
	cmovb rdx, rdi
	mov qword ptr [rsp + 344], rdx
	mov r14, r9
	sub r14, 1
	cmovb r14, rdi
	inc r9
	cmp rcx, r9
	cmovb r9, rcx
	mov qword ptr [rsp + 352], r9
	cmp r14, r9
	ja .LBB1950_59
	inc rbx
	cmp rax, rbx
	cmovb rbx, rax
	mov rax, qword ptr [rsp + 144]
	mov rcx, qword ptr [rsp + 136]
	cmp rax, rcx
	cmovb rcx, rax
	inc rbx
	mov rax, qword ptr [rsp + 152]
	cmp rax, rcx
	cmovb rcx, rax
	mov qword ptr [rsp + 328], rcx
	mov rax, qword ptr [rsp]
	mov rcx, qword ptr [rax + 200]
	mov qword ptr [rsp + 336], rcx
	mov r8, qword ptr [rax + 208]
	vbroadcastss ymm0, xmm0
	vbroadcastss ymm1, xmm1
	vmovups ymmword ptr [rsp + 224], ymm1
	vinsertps xmm1, xmm1, xmm0, 16
	vmovaps xmmword ptr [rsp + 112], xmm1
	vxorps xmm2, xmm2, xmm2
	vxorpd xmm5, xmm5, xmm5
	vxorps xmm9, xmm9, xmm9
	mov qword ptr [rsp + 8], rbx
	mov qword ptr [rsp + 16], r8
	vmovups ymmword ptr [rsp + 32], ymm0
	.p2align	4
.LBB1950_43:
	mov rcx, qword ptr [rsp + 360]
	imul rcx, r14
	mov rax, qword ptr [rsp + 344]
	lea rdx, [rcx + rax]
	cmp rdx, r8
	mov qword ptr [rsp + 24], r14
	jae .LBB1950_44
	add rcx, rbx
	mov edi, 0
	mov eax, 0
	cmp rcx, r8
	jae .LBB1950_47
	mov rsi, qword ptr [rsp + 336]
	mov eax, dword ptr [rsi + 4*rdx]
	mov edi, dword ptr [rsi + 4*rcx]
	jmp .LBB1950_47
	.p2align	4
.LBB1950_44:
	xor edi, edi
	xor eax, eax
.LBB1950_47:
	vmovaps xmmword ptr [rsp + 480], xmm9
	vmovss dword ptr [rsp + 132], xmm5
	vmovaps xmmword ptr [rsp + 496], xmm2
	mov rsi, rdi
	sub rsi, rax
	setb dl
	mov r12, r10
	cmp rdi, r10
	seta cl
	or cl, dl
	mov rcx, qword ptr [rsp + 184]
	lea r15, [rcx + 4*rax]
	mov r13, rsi
	mov ebp, 0
	cmovne r13, rbp
	mov r10d, 4
	cmovne r15, r10
	cmp rdi, qword ptr [rsp + 152]
	seta cl
	or cl, dl
	mov rcx, qword ptr [rsp + 176]
	lea rcx, [rcx + 4*rax]
	mov r8, rsi
	cmovne r8, rbp
	cmovne rcx, r10
	mov qword ptr [rsp + 72], r8
	shr r8, 3
	cmp rdi, qword ptr [rsp + 144]
	seta r9b
	or r9b, dl
	mov r9, qword ptr [rsp + 168]
	lea r9, [r9 + 4*rax]
	mov rbx, rsi
	cmovne rbx, rbp
	cmovne r9, r10
	mov r14, rbx
	shr rbx, 3
	cmp rdi, qword ptr [rsp + 136]
	seta r11b
	or r11b, dl
	cmovne rsi, rbp
	mov rdx, qword ptr [rsp + 160]
	lea r11, [rdx + 4*rax]
	cmovne r11, r10
	mov rax, rsi
	shr rax, 3
	mov rdx, r13
	shr rdx, 3
	cmp r8, rdx
	cmovb rdx, r8
	cmp rbx, rdx
	cmovb rdx, rbx
	cmp rax, rdx
	cmovb rdx, rax
	test rdx, rdx
	je .LBB1950_48
	shl rdx, 5
	vxorpd xmm6, xmm6, xmm6
	xor eax, eax
	vxorps xmm7, xmm7, xmm7
	vxorpd xmm8, xmm8, xmm8
	vxorps xmm9, xmm9, xmm9
	vxorps xmm10, xmm10, xmm10
	vxorps xmm11, xmm11, xmm11
	vxorps xmm12, xmm12, xmm12
	.p2align	4
.LBB1950_50:
	vmovups ymm13, ymmword ptr [r15 + rax]
	vmovups ymm14, ymmword ptr [rcx + rax]
	vmovups ymm1, ymmword ptr [rsp + 224]
	vsubps ymm15, ymm1, ymm13
	vsubps ymm3, ymm0, ymm14
	vmulps ymm4, ymm15, ymm15
	vmulps ymm5, ymm3, ymm3
	vaddps ymm4, ymm4, ymm5
	vmovups ymm0, ymmword ptr [rsp + 544]
	vcmpltps ymm5, ymm4, ymm0
	vcmpleps ymm1, ymm0, ymm4
	vcmpltps ymm0, ymm4, ymmword ptr [rsp + 416]
	vandps ymm0, ymm1, ymm0
	vbroadcastss ymm1, dword ptr [rip + .LCPI1950_3]
	vandps ymm5, ymm5, ymm1
	vmovaps ymm2, ymm10
	vmovaps ymm10, ymm9
	vmovapd ymm9, ymm8
	vmovaps ymm8, ymm7
	vmovapd ymm7, ymm6
	vxorpd xmm6, xmm6, xmm6
	vcmpltps ymm4, ymm6, ymm4
	vmovapd ymm6, ymm7
	vmovaps ymm7, ymm8
	vmovapd ymm8, ymm9
	vmovaps ymm9, ymm10
	vandps ymm1, ymm4, ymm1
	vandps ymm0, ymm1, ymm0
	vmulps ymm1, ymm15, ymm5
	vaddps ymm7, ymm7, ymm1
	vmulps ymm1, ymm3, ymm5
	vaddps ymm6, ymm6, ymm1
	vmulps ymm1, ymm13, ymm0
	vaddps ymm12, ymm12, ymm1
	vmulps ymm1, ymm14, ymm0
	vmulps ymm3, ymm0, ymmword ptr [r9 + rax]
	vaddps ymm11, ymm11, ymm1
	vaddps ymm10, ymm3, ymm2
	vmulps ymm1, ymm0, ymmword ptr [r11 + rax]
	vaddps ymm9, ymm9, ymm1
	vaddps ymm8, ymm8, ymm0
	vmovups ymm0, ymmword ptr [rsp + 32]
	add rax, 32
	cmp rdx, rax
	jne .LBB1950_50
	jmp .LBB1950_51
	.p2align	4
.LBB1950_48:
	vxorpd xmm6, xmm6, xmm6
	vxorps xmm7, xmm7, xmm7
	vxorpd xmm8, xmm8, xmm8
	vxorps xmm9, xmm9, xmm9
	vxorps xmm10, xmm10, xmm10
	vxorps xmm11, xmm11, xmm11
	vxorps xmm12, xmm12, xmm12
.LBB1950_51:
	mov r8d, r13d
	and r8d, 7
	mov rdx, rdi
	sub rdx, 8
	mov eax, 0
	cmovae rax, rdx
	mov dl, 1
	test r8, r8
	mov r10, r12
	je .LBB1950_55
	lea rbx, [rax + 8]
	cmp rbx, r10
	ja .LBB1950_55
	cmp rbx, qword ptr [rsp + 328]
	ja .LBB1950_55
	mov rdx, rdi
	sub rdx, rax
	vmovq xmm0, rdx
	vpbroadcastq ymm0, xmm0
	sub rdi, rax
	sub rdi, r8
	vmovq xmm1, rdi
	vpbroadcastq ymm1, xmm1
	mov rdx, qword ptr [rsp + 184]
	vmovups ymm2, ymmword ptr [rdx + 4*rax]
	vmovups ymmword ptr [rsp + 512], ymm2
	mov rdx, qword ptr [rsp + 176]
	vmovups ymm14, ymmword ptr [rdx + 4*rax]
	vpbroadcastq ymm3, qword ptr [rip + .LCPI1950_8]
	vpxor ymm1, ymm1, ymm3
	vmovdqa ymm2, ymmword ptr [rip + .LCPI1950_9]
	vpcmpgtq ymm4, ymm1, ymm2
	vmovdqa ymm13, ymmword ptr [rip + .LCPI1950_10]
	vpcmpgtq ymm1, ymm1, ymm13
	vpackssdw ymm5, ymm1, ymm4
	vpcmpeqd ymm15, ymm15, ymm15
	vpxor ymm5, ymm15, ymm5
	vextracti128 xmm15, ymm5, 1
	vpackssdw xmm5, xmm5, xmm15
	vpxor ymm0, ymm0, ymm3
	vpcmpgtq ymm3, ymm0, ymm2
	vpcmpgtq ymm0, ymm0, ymm13
	vpackssdw ymm15, ymm0, ymm3
	vextracti128 xmm13, ymm15, 1
	vpackssdw xmm13, xmm15, xmm13
	vpand xmm5, xmm13, xmm5
	vpshufd xmm5, xmm5, 216
	vpandn ymm3, ymm4, ymm3
	vpandn ymm0, ymm1, ymm0
	vpackssdw ymm0, ymm0, ymm3
	vpermq ymm0, ymm0, 216
	vmovups ymm1, ymmword ptr [rsp + 224]
	vsubps ymm1, ymm1, ymmword ptr [rsp + 512]
	vmovups ymm2, ymmword ptr [rsp + 32]
	vsubps ymm3, ymm2, ymm14
	vmulps ymm4, ymm1, ymm1
	vmulps ymm13, ymm3, ymm3
	vaddps ymm4, ymm13, ymm4
	vmovups ymm2, ymmword ptr [rsp + 544]
	vcmpleps ymm13, ymm2, ymm4
	vcmpltps ymm15, ymm4, ymmword ptr [rsp + 416]
	vandps ymm13, ymm13, ymm15
	vextractf128 xmm15, ymm13, 1
	vpackssdw xmm13, xmm13, xmm15
	vcmpltps ymm15, ymm4, ymm2
	vpand xmm5, xmm13, xmm5
	vbroadcastss ymm13, dword ptr [rip + .LCPI1950_3]
	vandps ymm15, ymm15, ymm13
	vxorps xmm2, xmm2, xmm2
	vblendvps ymm0, ymm2, ymm15, ymm0
	vcmpltps ymm4, ymm2, ymm4
	vandps ymm4, ymm13, ymm4
	vpmovzxwd ymm5, xmm5
	vpslld ymm5, ymm5, 31
	vpsrad ymm5, ymm5, 31
	vandps ymm4, ymm4, ymm5
	vmulps ymm1, ymm1, ymm0
	vaddps ymm7, ymm1, ymm7
	vmulps ymm0, ymm3, ymm0
	vaddps ymm6, ymm0, ymm6
	vmulps ymm0, ymm4, ymmword ptr [rsp + 512]
	vaddps ymm12, ymm12, ymm0
	vmulps ymm0, ymm14, ymm4
	vaddps ymm11, ymm11, ymm0
	mov rdx, qword ptr [rsp + 168]
	vmulps ymm0, ymm4, ymmword ptr [rdx + 4*rax]
	mov rdx, qword ptr [rsp + 160]
	vmulps ymm1, ymm4, ymmword ptr [rdx + 4*rax]
	vaddps ymm10, ymm10, ymm0
	vaddps ymm9, ymm9, ymm1
	vaddps ymm8, ymm8, ymm4
	xor edx, edx
.LBB1950_55:
	mov rbx, qword ptr [rsp + 72]
	vunpcklps xmm0, xmm12, xmm11
	vmovlhps xmm0, xmm0, xmm10
	vinsertps xmm0, xmm0, xmm9, 48
	vinsertps xmm1, xmm11, xmm12, 76
	vshufps xmm1, xmm1, xmm10, 212
	vinsertps xmm1, xmm1, xmm9, 112
	vaddps xmm0, xmm0, xmm1
	vunpckhps xmm1, xmm12, xmm11
	vblendps xmm1, xmm10, xmm1, 3
	vinsertps xmm1, xmm1, xmm9, 176
	vaddps xmm0, xmm0, xmm1
	vshufps xmm1, xmm11, xmm12, 51
	vshufps xmm1, xmm1, xmm10, 242
	vblendps xmm1, xmm1, xmm9, 8
	vaddps xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm11, 1
	vextractf128 xmm3, ymm12, 1
	vunpcklps xmm4, xmm3, xmm1
	vextractf128 xmm5, ymm10, 1
	vmovlhps xmm4, xmm4, xmm5
	vextractf128 xmm9, ymm9, 1
	vinsertps xmm4, xmm4, xmm9, 48
	vaddps xmm0, xmm0, xmm4
	vinsertps xmm4, xmm1, xmm3, 76
	vshufps xmm4, xmm4, xmm5, 212
	vinsertps xmm4, xmm4, xmm9, 112
	vaddps xmm0, xmm0, xmm4
	vunpckhps xmm4, xmm3, xmm1
	vblendps xmm4, xmm5, xmm4, 3
	vinsertps xmm4, xmm4, xmm9, 176
	vaddps xmm0, xmm0, xmm4
	vshufps xmm1, xmm1, xmm3, 51
	vshufps xmm1, xmm1, xmm5, 242
	vblendps xmm1, xmm1, xmm9, 8
	vaddps xmm0, xmm0, xmm1
	vmovaps xmm9, xmmword ptr [rsp + 480]
	vaddps xmm9, xmm9, xmm0
	vmovshdup xmm0, xmm8
	vaddss xmm0, xmm8, xmm0
	vshufpd xmm1, xmm8, xmm8, 1
	vaddss xmm0, xmm0, xmm1
	vshufps xmm1, xmm8, xmm8, 255
	vaddss xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm8, 1
	vaddss xmm0, xmm0, xmm1
	vmovshdup xmm3, xmm1
	vaddss xmm0, xmm0, xmm3
	vshufpd xmm3, xmm1, xmm1, 1
	vaddss xmm0, xmm0, xmm3
	vshufps xmm1, xmm1, xmm1, 255
	vaddss xmm0, xmm0, xmm1
	vmovss xmm5, dword ptr [rsp + 132]
	vaddss xmm5, xmm5, xmm0
	vhaddps xmm0, xmm7, xmm6
	vshufps xmm0, xmm0, xmm0, 232
	vshufpd xmm1, xmm7, xmm7, 1
	vinsertps xmm1, xmm1, xmm6, 156
	vaddps xmm0, xmm0, xmm1
	vshufpd xmm1, xmm6, xmm6, 1
	vinsertps xmm1, xmm1, xmm7, 204
	vaddps xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm6, 1
	vextractf128 xmm3, ymm7, 1
	vinsertps xmm4, xmm3, xmm1, 28
	vaddps xmm0, xmm0, xmm4
	vinsertps xmm4, xmm1, xmm3, 76
	vaddps xmm0, xmm0, xmm4
	vshufpd xmm4, xmm3, xmm3, 1
	vinsertps xmm4, xmm4, xmm1, 156
	vaddps xmm0, xmm0, xmm4
	vshufpd xmm1, xmm1, xmm1, 1
	vinsertps xmm1, xmm1, xmm3, 204
	vaddps xmm0, xmm0, xmm1
	vmovaps xmm2, xmmword ptr [rsp + 496]
	vaddps xmm2, xmm2, xmm0
	test dl, dl
	je .LBB1950_56
	mov eax, ebx
	and eax, 7
	mov edx, r14d
	and edx, 7
	mov edi, esi
	and edi, 7
	cmp rax, r8
	cmovb r8, rax
	cmp rdx, r8
	cmovb r8, rdx
	cmp rdi, r8
	cmovb r8, rdi
	test r8, r8
	je .LBB1950_56
	and r13d, -8
	and ebx, -8
	and r14d, -8
	and esi, -8
	vmovss xmm0, dword ptr [r15 + 4*r13]
	vmovss xmm1, dword ptr [rcx + 4*rbx]
	vinsertps xmm6, xmm0, xmm1, 16
	vmovaps xmm0, xmmword ptr [rsp + 112]
	vsubps xmm7, xmm0, xmm6
	vmulps xmm0, xmm7, xmm7
	vmovshdup xmm1, xmm0
	vaddss xmm8, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 96]
	vucomiss xmm0, xmm8
	jbe .LBB1950_66
	vaddps xmm2, xmm2, xmm7
	jmp .LBB1950_69
.LBB1950_66:
	vmovaps xmm0, xmmword ptr [rsp + 80]
	vucomiss xmm0, xmm8
	jbe .LBB1950_69
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm8, xmm0
	jbe .LBB1950_69
	vmovss xmm0, dword ptr [r9 + 4*r14]
	vmovss xmm1, dword ptr [r11 + 4*rsi]
	vinsertps xmm0, xmm6, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm9, xmm9, xmm0
	vaddss xmm5, xmm5, dword ptr [rip + .LCPI1950_3]
.LBB1950_69:
	cmp r8d, 1
	je .LBB1950_56
	vmovss xmm0, dword ptr [r15 + 4*r13 + 4]
	vmovss xmm1, dword ptr [rcx + 4*rbx + 4]
	vinsertps xmm6, xmm0, xmm1, 16
	vmovaps xmm0, xmmword ptr [rsp + 112]
	vsubps xmm7, xmm0, xmm6
	vmulps xmm0, xmm7, xmm7
	vmovshdup xmm1, xmm0
	vaddss xmm8, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 96]
	vucomiss xmm0, xmm8
	jbe .LBB1950_71
	vaddps xmm2, xmm2, xmm7
	jmp .LBB1950_75
.LBB1950_71:
	vmovaps xmm0, xmmword ptr [rsp + 80]
	vucomiss xmm0, xmm8
	jbe .LBB1950_75
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm8, xmm0
	jbe .LBB1950_75
	vmovss xmm0, dword ptr [r9 + 4*r14 + 4]
	vmovss xmm1, dword ptr [r11 + 4*rsi + 4]
	vinsertps xmm0, xmm6, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm9, xmm9, xmm0
	vaddss xmm5, xmm5, dword ptr [rip + .LCPI1950_3]
.LBB1950_75:
	cmp r8d, 2
	je .LBB1950_56
	vmovss xmm0, dword ptr [r15 + 4*r13 + 8]
	vmovss xmm1, dword ptr [rcx + 4*rbx + 8]
	vinsertps xmm6, xmm0, xmm1, 16
	vmovaps xmm0, xmmword ptr [rsp + 112]
	vsubps xmm7, xmm0, xmm6
	vmulps xmm0, xmm7, xmm7
	vmovshdup xmm1, xmm0
	vaddss xmm8, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 96]
	vucomiss xmm0, xmm8
	jbe .LBB1950_77
	vaddps xmm2, xmm2, xmm7
	jmp .LBB1950_81
.LBB1950_77:
	vmovaps xmm0, xmmword ptr [rsp + 80]
	vucomiss xmm0, xmm8
	jbe .LBB1950_81
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm8, xmm0
	jbe .LBB1950_81
	vmovss xmm0, dword ptr [r9 + 4*r14 + 8]
	vmovss xmm1, dword ptr [r11 + 4*rsi + 8]
	vinsertps xmm0, xmm6, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm9, xmm9, xmm0
	vaddss xmm5, xmm5, dword ptr [rip + .LCPI1950_3]
.LBB1950_81:
	cmp r8d, 3
	je .LBB1950_56
	vmovss xmm0, dword ptr [r15 + 4*r13 + 12]
	vmovss xmm1, dword ptr [rcx + 4*rbx + 12]
	vinsertps xmm6, xmm0, xmm1, 16
	vmovaps xmm0, xmmword ptr [rsp + 112]
	vsubps xmm7, xmm0, xmm6
	vmulps xmm0, xmm7, xmm7
	vmovshdup xmm1, xmm0
	vaddss xmm8, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 96]
	vucomiss xmm0, xmm8
	jbe .LBB1950_83
	vaddps xmm2, xmm2, xmm7
	jmp .LBB1950_87
.LBB1950_83:
	vmovaps xmm0, xmmword ptr [rsp + 80]
	vucomiss xmm0, xmm8
	jbe .LBB1950_87
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm8, xmm0
	jbe .LBB1950_87
	vmovss xmm0, dword ptr [r9 + 4*r14 + 12]
	vmovss xmm1, dword ptr [r11 + 4*rsi + 12]
	vinsertps xmm0, xmm6, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm9, xmm9, xmm0
	vaddss xmm5, xmm5, dword ptr [rip + .LCPI1950_3]
.LBB1950_87:
	cmp r8d, 4
	je .LBB1950_56
	vmovss xmm0, dword ptr [r15 + 4*r13 + 16]
	vmovss xmm1, dword ptr [rcx + 4*rbx + 16]
	vinsertps xmm6, xmm0, xmm1, 16
	vmovaps xmm0, xmmword ptr [rsp + 112]
	vsubps xmm7, xmm0, xmm6
	vmulps xmm0, xmm7, xmm7
	vmovshdup xmm1, xmm0
	vaddss xmm8, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 96]
	vucomiss xmm0, xmm8
	jbe .LBB1950_89
	vaddps xmm2, xmm2, xmm7
	jmp .LBB1950_93
.LBB1950_89:
	vmovaps xmm0, xmmword ptr [rsp + 80]
	vucomiss xmm0, xmm8
	jbe .LBB1950_93
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm8, xmm0
	jbe .LBB1950_93
	vmovss xmm0, dword ptr [r9 + 4*r14 + 16]
	vmovss xmm1, dword ptr [r11 + 4*rsi + 16]
	vinsertps xmm0, xmm6, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm9, xmm9, xmm0
	vaddss xmm5, xmm5, dword ptr [rip + .LCPI1950_3]
.LBB1950_93:
	cmp r8d, 5
	je .LBB1950_56
	vmovss xmm0, dword ptr [r15 + 4*r13 + 20]
	vmovss xmm1, dword ptr [rcx + 4*rbx + 20]
	vinsertps xmm6, xmm0, xmm1, 16
	vmovaps xmm0, xmmword ptr [rsp + 112]
	vsubps xmm7, xmm0, xmm6
	vmulps xmm0, xmm7, xmm7
	vmovshdup xmm1, xmm0
	vaddss xmm8, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 96]
	vucomiss xmm0, xmm8
	jbe .LBB1950_95
	vaddps xmm2, xmm2, xmm7
	jmp .LBB1950_99
.LBB1950_95:
	vmovaps xmm0, xmmword ptr [rsp + 80]
	vucomiss xmm0, xmm8
	jbe .LBB1950_99
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm8, xmm0
	jbe .LBB1950_99
	vmovss xmm0, dword ptr [r9 + 4*r14 + 20]
	vmovss xmm1, dword ptr [r11 + 4*rsi + 20]
	vinsertps xmm0, xmm6, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm9, xmm9, xmm0
	vaddss xmm5, xmm5, dword ptr [rip + .LCPI1950_3]
.LBB1950_99:
	cmp r8d, 6
	jne .LBB1950_100
	.p2align	4
.LBB1950_56:
	mov rbx, qword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 16]
.LBB1950_57:
	vmovups ymm0, ymmword ptr [rsp + 32]
	cmp rax, qword ptr [rsp + 352]
	lea r14, [rax + 1]
	jne .LBB1950_43
	jmp .LBB1950_58
.LBB1950_100:
	vmovss xmm0, dword ptr [r15 + 4*r13 + 24]
	vmovss xmm1, dword ptr [rcx + 4*rbx + 24]
	vinsertps xmm6, xmm0, xmm1, 16
	vmovaps xmm0, xmmword ptr [rsp + 112]
	vsubps xmm7, xmm0, xmm6
	vmulps xmm0, xmm7, xmm7
	vmovshdup xmm1, xmm0
	vaddss xmm8, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 96]
	vucomiss xmm0, xmm8
	mov rax, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 16]
	jbe .LBB1950_101
	vaddps xmm2, xmm2, xmm7
	mov rbx, qword ptr [rsp + 8]
	jmp .LBB1950_57
.LBB1950_101:
	vmovaps xmm0, xmmword ptr [rsp + 80]
	vucomiss xmm0, xmm8
	mov rbx, qword ptr [rsp + 8]
	jbe .LBB1950_57
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm8, xmm0
	jbe .LBB1950_57
	vmovss xmm0, dword ptr [r9 + 4*r14 + 24]
	vmovss xmm1, dword ptr [r11 + 4*rsi + 24]
	vinsertps xmm0, xmm6, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm9, xmm9, xmm0
	vaddss xmm5, xmm5, dword ptr [rip + .LCPI1950_3]
	jmp .LBB1950_57
.LBB1950_58:
	vmovaps xmmword ptr [rsp + 384], xmm9
	vmovss dword ptr [rsp + 400], xmm5
	vmovlps qword ptr [rsp + 404], xmm2
.LBB1950_59:
	lea rdi, [rsp + 208]
	mov rsi, qword ptr [rsp + 312]
	vmovaps xmm0, xmmword ptr [rsp + 464]
	vmovaps xmm1, xmmword ptr [rsp + 448]
	lea rdx, [rsp + 368]
	lea rcx, [rsp + 192]
	lea r8, [rsp + 384]
	vzeroupper
	call swarm::rules::finish
	mov rdx, qword ptr [rsp + 320]
	cmp rdx, qword ptr [rsp + 296]
	jae .LBB1950_61
	vmovss xmm0, dword ptr [rsp + 208]
	vmovss xmm1, dword ptr [rsp + 212]
	vmovss xmm2, dword ptr [rsp + 216]
	vmovss xmm3, dword ptr [rsp + 220]
	mov rax, qword ptr [rsp + 288]
	vmovss dword ptr [rax + 4*rdx], xmm0
	mov rax, qword ptr [rsp + 280]
	vmovss dword ptr [rax + 4*rdx], xmm1
	mov rax, qword ptr [rsp + 272]
	vmovss dword ptr [rax + 4*rdx], xmm2
	mov rax, qword ptr [rsp + 264]
	vmovss dword ptr [rax + 4*rdx], xmm3
	jmp .LBB1950_61
.LBB1950_63:
	add rsp, 584
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
