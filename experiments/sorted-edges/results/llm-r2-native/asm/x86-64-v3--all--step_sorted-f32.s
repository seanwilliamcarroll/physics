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
	sub rsp, 600
	.cfi_def_cfa_offset 656
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r14, rdi
	lea rax, [rdi + 316]
	mov qword ptr [rsp + 368], rax
	mov eax, dword ptr [rdi + 312]
	mov dword ptr [rsp + 440], eax
	mov rax, qword ptr [rdi + 304]
	mov qword ptr [rsp + 432], rax
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
	vmovaps xmmword ptr [rsp + 480], xmm2
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
	vmovaps xmmword ptr [rsp + 496], xmm6
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
	vmovddup xmm2, qword ptr [rip + .LCPI1950_18]
	vblendvpd xmm0, xmm2, xmm0, xmm1
	vmovupd xmmword ptr [r14 + 264], xmm0
	call <swarm::grid::Grid>::fill
	mov rsi, r14
	mov r14, qword ptr [r14 + 248]
	mov rax, qword ptr [rsi + 256]
	mov rbp, qword ptr [rsi + 8]
	mov r12, qword ptr [rsi + 16]
	mov qword ptr [rsi + 112], 0
	lea rbx, [r14 + 4*rax]
	lea rax, [rsi + 96]
	mov qword ptr [rsp + 256], rax
	mov r13, r14
	mov qword ptr [rsp + 56], rsi
	jmp .LBB1950_1
.LBB1950_8:
	mov rax, qword ptr [rsi + 104]
	vmovss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rsi + 112], r15
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
	cmp r15, qword ptr [rsi + 96]
	jne .LBB1950_8
	mov edx, 1
	mov rdi, qword ptr [rsp + 256]
	mov rsi, r15
	vmovss dword ptr [rsp + 160], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovss xmm0, dword ptr [rsp + 160]
	mov rsi, qword ptr [rsp + 56]
	jmp .LBB1950_8
.LBB1950_9:
	mov r13, qword ptr [rsi + 32]
	mov r12, qword ptr [rsi + 40]
	mov qword ptr [rsi + 136], 0
	xor r15d, r15d
	lea rax, [rsi + 120]
	mov qword ptr [rsp + 256], rax
	mov rbp, r14
	jmp .LBB1950_10
.LBB1950_17:
	mov rax, qword ptr [rsi + 128]
	vmovss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rsi + 136], r15
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
	cmp r15, qword ptr [rsi + 120]
	jne .LBB1950_17
	mov edx, 1
	mov rdi, qword ptr [rsp + 256]
	mov rsi, r15
	vmovss dword ptr [rsp + 160], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovss xmm0, dword ptr [rsp + 160]
	mov rsi, qword ptr [rsp + 56]
	jmp .LBB1950_17
.LBB1950_18:
	mov r13, qword ptr [rsi + 56]
	mov r12, qword ptr [rsi + 64]
	mov qword ptr [rsi + 160], 0
	xor r15d, r15d
	lea rax, [rsi + 144]
	mov qword ptr [rsp + 256], rax
	mov rbp, r14
	jmp .LBB1950_19
.LBB1950_26:
	mov rax, qword ptr [rsi + 152]
	vmovss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rsi + 160], r15
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
	cmp r15, qword ptr [rsi + 144]
	jne .LBB1950_26
	mov edx, 1
	mov rdi, qword ptr [rsp + 256]
	mov rsi, r15
	vmovss dword ptr [rsp + 160], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovss xmm0, dword ptr [rsp + 160]
	mov rsi, qword ptr [rsp + 56]
	jmp .LBB1950_26
.LBB1950_27:
	mov r13, qword ptr [rsi + 80]
	mov r12, qword ptr [rsi + 88]
	mov qword ptr [rsi + 184], 0
	xor r15d, r15d
	lea rbp, [rsi + 168]
	jmp .LBB1950_28
.LBB1950_35:
	mov rax, qword ptr [rsi + 176]
	vmovss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rsi + 184], r15
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
	cmp r15, qword ptr [rsi + 168]
	jne .LBB1950_35
	mov edx, 1
	mov rdi, rbp
	mov rsi, r15
	vmovss dword ptr [rsp + 160], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovss xmm0, dword ptr [rsp + 160]
	mov rsi, qword ptr [rsp + 56]
	jmp .LBB1950_35
.LBB1950_36:
	vmovups ymm1, ymmword ptr [rsi + 96]
	mov rdi, qword ptr [rsi + 112]
	vmovdqu ymm0, ymmword ptr [rsi]
	mov rax, qword ptr [rsi + 8]
	mov qword ptr [rsp + 344], rax
	vmovups ymmword ptr [rsi], ymm1
	vmovdqu ymmword ptr [rsi + 96], ymm0
	vmovups ymm1, ymmword ptr [rsi + 128]
	vmovdqu ymm2, ymmword ptr [rsi + 32]
	mov rax, qword ptr [rsi + 32]
	mov qword ptr [rsp + 336], rax
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 328], rax
	vmovups ymmword ptr [rsi + 32], ymm1
	vmovdqu ymmword ptr [rsi + 128], ymm2
	mov rcx, qword ptr [rsi + 176]
	vmovdqu ymm1, ymmword ptr [rsi + 64]
	mov rax, qword ptr [rsi + 64]
	vmovups xmm3, xmmword ptr [rsi + 160]
	vmovups xmmword ptr [rsi + 64], xmm3
	mov rdx, qword ptr [rsi + 80]
	mov qword ptr [rsp + 320], rdx
	mov qword ptr [rsi + 80], rcx
	mov qword ptr [rsi + 88], r15
	vmovdqu ymmword ptr [rsi + 160], ymm1
	test rdi, rdi
	je .LBB1950_61
	vmovss xmm3, dword ptr [rsi + 316]
	vmovss xmm4, dword ptr [rsi + 320]
	vmulss xmm4, xmm4, xmm4
	vmulss xmm3, xmm3, xmm3
	vextracti128 xmm0, ymm0, 1
	vpextrq rcx, xmm2, 1
	vmovq rdx, xmm0
	cmp rcx, rdx
	cmovb rdx, rcx
	cmp rax, rdx
	cmovb rdx, rax
	vextracti128 xmm0, ymm1, 1
	vpextrq rax, xmm0, 1
	vmovaps xmmword ptr [rsp + 64], xmm3
	vbroadcastss ymm0, xmm3
	vmovaps xmmword ptr [rsp + 80], xmm4
	vbroadcastss ymm1, xmm4
	cmp rax, rdx
	cmovb rdx, rax
	mov qword ptr [rsp + 352], rdx
	xor r8d, r8d
	mov qword ptr [rsp + 360], rdi
	vmovups ymmword ptr [rsp + 560], ymm0
	vmovups ymmword ptr [rsp + 528], ymm1
	jmp .LBB1950_38
.LBB1950_59:
	mov rsi, qword ptr [rsp + 56]
	mov rdi, qword ptr [rsp + 360]
	.p2align	4
.LBB1950_60:
	inc r8
	cmp r8, rdi
	je .LBB1950_61
.LBB1950_38:
	mov rbp, qword ptr [rsi + 16]
	cmp r8, rbp
	jae .LBB1950_60
	mov rax, qword ptr [rsi + 40]
	mov qword ptr [rsp + 208], rax
	cmp r8, rax
	jae .LBB1950_60
	mov rax, qword ptr [rsi + 64]
	mov rdx, qword ptr [rsi + 88]
	mov qword ptr [rsp + 200], rax
	cmp r8, rax
	setb cl
	mov qword ptr [rsp + 192], rdx
	cmp r8, rdx
	setb dl
	and dl, cl
	cmp dl, 1
	jne .LBB1950_60
	mov rax, qword ptr [rsi + 8]
	mov qword ptr [rsp + 240], rax
	vmovss xmm8, dword ptr [rax + 4*r8]
	mov rax, qword ptr [rsi + 32]
	mov rcx, qword ptr [rsi + 56]
	mov qword ptr [rsp + 232], rax
	vmovss xmm9, dword ptr [rax + 4*r8]
	mov rax, qword ptr [rsi + 80]
	mov qword ptr [rsp + 224], rcx
	vmovss xmm0, dword ptr [rcx + 4*r8]
	mov qword ptr [rsp + 376], r8
	mov qword ptr [rsp + 216], rax
	vmovss xmm1, dword ptr [rax + 4*r8]
	vmovss dword ptr [rsp + 288], xmm8
	vmovss dword ptr [rsp + 292], xmm9
	vmovss dword ptr [rsp + 296], xmm0
	vmovss dword ptr [rsp + 300], xmm1
	vxorps xmm0, xmm0, xmm0
	vmovups xmmword ptr [rsp + 140], xmm0
	vmovaps xmmword ptr [rsp + 128], xmm0
	vmovss xmm0, dword ptr [rsi + 280]
	vmulss xmm1, xmm8, xmm0
	vpxor xmm2, xmm2, xmm2
	vmaxss xmm1, xmm1, xmm2
	vcvtss2sd xmm3, xmm1, xmm1
	vcvttsd2si rcx, xmm3
	mov rdx, rcx
	sar rdx, 63
	vmovsd xmm5, qword ptr [rip + .LCPI1950_5]
	vsubsd xmm4, xmm3, xmm5
	vcvttsd2si r9, xmm4
	and r9, rdx
	or r9, rcx
	vxorps xmm6, xmm6, xmm6
	vucomisd xmm3, xmm6
	mov edi, 0
	cmovb r9, rdi
	vmovsd xmm4, qword ptr [rip + .LCPI1950_6]
	vucomisd xmm3, xmm4
	mov r8, -1
	cmova r9, r8
	mov rcx, qword ptr [rsi + 264]
	mov qword ptr [rsp + 424], rcx
	sub rcx, 1
	cmovb rcx, rdi
	cmp rcx, r9
	cmovb r9, rcx
	vmovss xmm7, dword ptr [rip + .LCPI1950_4]
	vucomiss xmm1, xmm7
	cmovae r9, rdi
	vmulss xmm0, xmm9, xmm0
	vmaxss xmm0, xmm0, xmm2
	vcvtss2sd xmm1, xmm0, xmm0
	vcvttsd2si rdx, xmm1
	mov rax, rsi
	mov rsi, rdx
	sar rsi, 63
	vsubsd xmm3, xmm1, xmm5
	vcvttsd2si r10, xmm3
	and r10, rsi
	or r10, rdx
	vucomisd xmm1, xmm6
	cmovb r10, rdi
	vucomisd xmm1, xmm4
	cmova r10, r8
	mov rdx, qword ptr [rax + 272]
	sub rdx, 1
	cmovb rdx, rdi
	cmp rdx, r10
	cmovb r10, rdx
	vucomiss xmm0, xmm7
	cmovae r10, rdi
	mov rax, r9
	sub rax, 1
	cmovb rax, rdi
	mov qword ptr [rsp + 408], rax
	mov r14, r10
	sub r14, 1
	cmovb r14, rdi
	inc r10
	cmp rdx, r10
	cmovb r10, rdx
	vxorps xmm0, xmm0, xmm0
	vxorps xmm1, xmm1, xmm1
	mov qword ptr [rsp + 416], r10
	cmp r14, r10
	ja .LBB1950_57
	mov rsi, r9
	inc rsi
	cmp rcx, rsi
	cmovb rsi, rcx
	mov rax, qword ptr [rsp + 200]
	mov rcx, qword ptr [rsp + 192]
	cmp rax, rcx
	cmovb rcx, rax
	inc rsi
	mov qword ptr [rsp + 400], rsi
	mov rax, qword ptr [rsp + 208]
	cmp rax, rcx
	cmovb rcx, rax
	mov qword ptr [rsp + 384], rcx
	mov rax, qword ptr [rsp + 56]
	mov rcx, qword ptr [rax + 200]
	mov qword ptr [rsp + 392], rcx
	mov rdi, qword ptr [rax + 208]
	vmovaps xmmword ptr [rsp + 96], xmm9
	vbroadcastss ymm6, xmm9
	vmovaps xmmword ptr [rsp + 112], xmm8
	vbroadcastss ymm12, xmm8
	vmovaps xmmword ptr [rsp + 32], xmm0
	vxorps xmm0, xmm0, xmm0
	vmovss dword ptr [rsp + 20], xmm0
	vxorps xmm14, xmm14, xmm14
	vxorps xmm15, xmm15, xmm15
	vxorps xmm7, xmm7, xmm7
	vxorps xmm8, xmm8, xmm8
	vxorps xmm9, xmm9, xmm9
	vxorps xmm10, xmm10, xmm10
	vxorpd xmm5, xmm5, xmm5
	vmovss dword ptr [rsp + 16], xmm0
	vmovss dword ptr [rsp + 12], xmm0
	mov qword ptr [rsp + 24], rdi
	vmovups ymmword ptr [rsp + 160], ymm6
	vmovups ymmword ptr [rsp + 256], ymm12
	.p2align	4
.LBB1950_43:
	mov rcx, qword ptr [rsp + 424]
	imul rcx, r14
	mov rax, qword ptr [rsp + 408]
	lea rsi, [rcx + rax]
	cmp rsi, rdi
	mov qword ptr [rsp + 248], r14
	jae .LBB1950_44
	add rcx, qword ptr [rsp + 400]
	mov r15d, 0
	mov edx, 0
	cmp rcx, rdi
	jae .LBB1950_47
	mov rax, qword ptr [rsp + 392]
	mov edx, dword ptr [rax + 4*rsi]
	mov r15d, dword ptr [rax + 4*rcx]
	jmp .LBB1950_47
	.p2align	4
.LBB1950_44:
	xor r15d, r15d
	xor edx, edx
.LBB1950_47:
	mov r11, r15
	sub r11, rdx
	setb sil
	mov r14, rbp
	cmp r15, rbp
	seta cl
	or cl, sil
	mov rax, qword ptr [rsp + 240]
	lea rdi, [rax + 4*rdx]
	mov r13, r11
	mov ebp, 0
	cmovne r13, rbp
	mov r10d, 4
	cmovne rdi, r10
	cmp r15, qword ptr [rsp + 208]
	seta cl
	or cl, sil
	mov rax, qword ptr [rsp + 232]
	lea rcx, [rax + 4*rdx]
	mov r8, r11
	cmovne r8, rbp
	cmovne rcx, r10
	mov qword ptr [rsp + 448], r8
	shr r8, 3
	cmp r15, qword ptr [rsp + 200]
	seta r9b
	or r9b, sil
	mov rax, qword ptr [rsp + 224]
	lea r9, [rax + 4*rdx]
	mov rbx, r11
	cmovne rbx, rbp
	cmovne r9, r10
	mov r12, rbx
	shr rbx, 3
	cmp r15, qword ptr [rsp + 192]
	seta al
	or al, sil
	cmovne r11, rbp
	mov rax, qword ptr [rsp + 216]
	lea rsi, [rax + 4*rdx]
	cmovne rsi, r10
	mov rax, r11
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
	je .LBB1950_50
	shl rdx, 5
	xor r8d, r8d
	.p2align	4
.LBB1950_49:
	vmovups ymm0, ymmword ptr [rdi + r8]
	vmovups ymm1, ymmword ptr [rcx + r8]
	vsubps ymm2, ymm12, ymm0
	vsubps ymm4, ymm6, ymm1
	vmulps ymm13, ymm2, ymm2
	vmovaps ymm6, ymm14
	vmulps ymm14, ymm4, ymm4
	vaddps ymm13, ymm13, ymm14
	vmovups ymm3, ymmword ptr [rsp + 528]
	vcmpltps ymm14, ymm13, ymm3
	vmovapd ymm12, ymm5
	vmovaps ymm5, ymm10
	vmovaps ymm10, ymm9
	vmovaps ymm9, ymm8
	vmovaps ymm8, ymm7
	vmovaps ymm7, ymm15
	vcmpleps ymm15, ymm3, ymm13
	vcmpltps ymm11, ymm13, ymmword ptr [rsp + 560]
	vandps ymm11, ymm15, ymm11
	vbroadcastss ymm15, dword ptr [rip + .LCPI1950_3]
	vandps ymm14, ymm14, ymm15
	vxorps xmm3, xmm3, xmm3
	vcmpltps ymm13, ymm3, ymm13
	vandps ymm13, ymm13, ymm15
	vmovaps ymm15, ymm7
	vmovaps ymm7, ymm8
	vmovaps ymm8, ymm9
	vmovaps ymm9, ymm10
	vmovaps ymm10, ymm5
	vmovapd ymm5, ymm12
	vmovups ymm12, ymmword ptr [rsp + 256]
	vandps ymm11, ymm13, ymm11
	vmulps ymm2, ymm14, ymm2
	vaddps ymm15, ymm15, ymm2
	vmulps ymm2, ymm14, ymm4
	vmovaps ymm14, ymm6
	vmovups ymm6, ymmword ptr [rsp + 160]
	vaddps ymm14, ymm14, ymm2
	vmulps ymm0, ymm11, ymm0
	vaddps ymm5, ymm5, ymm0
	vmulps ymm0, ymm11, ymm1
	vmulps ymm1, ymm11, ymmword ptr [r9 + r8]
	vaddps ymm10, ymm10, ymm0
	vaddps ymm9, ymm9, ymm1
	vmulps ymm0, ymm11, ymmword ptr [rsi + r8]
	vaddps ymm8, ymm8, ymm0
	vaddps ymm7, ymm11, ymm7
	add r8, 32
	cmp rdx, r8
	jne .LBB1950_49
.LBB1950_50:
	vxorps xmm3, xmm3, xmm3
	mov r8d, r13d
	and r8d, 7
	mov rax, r15
	sub rax, 8
	mov edx, 0
	cmovae rdx, rax
	test r8, r8
	mov rbp, r14
	je .LBB1950_62
	lea rbx, [rdx + 8]
	cmp rbx, rbp
	ja .LBB1950_62
	cmp rbx, qword ptr [rsp + 384]
	ja .LBB1950_62
	sub r15, rdx
	mov r11, r15
	sub r11, r8
	xor ecx, ecx
	cmp r15, 2
	setae cl
	xor esi, esi
	cmp r11, 3
	setb sil
	xor edi, edi
	cmp r15, 4
	setae dil
	xor r9d, r9d
	cmp r11, 5
	setb r9b
	xor r10d, r10d
	cmp r15, 6
	setae r10b
	vmovq xmm1, r8
	xor r8d, r8d
	cmp r11, 7
	setb r8b
	vpbroadcastq xmm0, qword ptr [rip + .LCPI1950_19]
	vpinsrq xmm0, xmm0, r11, 1
	vmovdqa xmmword ptr [rsp + 448], xmm0
	vmovq xmm11, r11
	vpbroadcastq xmm0, qword ptr [rip + .LCPI1950_20]
	vpinsrq xmm0, xmm0, r11, 1
	vmovdqa xmmword ptr [rsp + 512], xmm0
	vpbroadcastq xmm0, qword ptr [rip + .LCPI1950_21]
	vmovaps ymm6, ymm15
	vpinsrq xmm15, xmm0, r11, 1
	xor r11d, r11d
	cmp r15, 8
	vpbroadcastq xmm0, qword ptr [rip + .LCPI1950_21]
	vmovaps ymm12, ymm5
	vmovaps ymm5, ymm14
	vpinsrq xmm14, xmm0, r15, 0
	vpbroadcastq xmm0, qword ptr [rip + .LCPI1950_19]
	vpinsrq xmm2, xmm0, r15, 0
	vpbroadcastq xmm0, qword ptr [rip + .LCPI1950_22]
	vpinsrq xmm13, xmm0, r15, 0
	vpbroadcastq xmm0, qword ptr [rip + .LCPI1950_20]
	vpinsrq xmm4, xmm0, r15, 0
	vpunpcklqdq xmm1, xmm1, xmm11
	mov eax, 65535
	vmovd xmm11, eax
	vpinsrw xmm11, xmm11, ecx, 1
	vpinsrw xmm11, xmm11, esi, 2
	vpinsrw xmm11, xmm11, edi, 3
	vpinsrw xmm11, xmm11, r9d, 4
	vpinsrw xmm11, xmm11, r10d, 5
	vpinsrw xmm11, xmm11, r8d, 6
	setae r11b
	vpinsrw xmm11, xmm11, r11d, 7
	vinserti128 ymm0, ymm1, xmmword ptr [rsp + 448], 1
	vinserti128 ymm15, ymm15, xmmword ptr [rsp + 512], 1
	vinserti128 ymm14, ymm2, xmm14, 1
	vinserti128 ymm4, ymm4, xmm13, 1
	vpcmpeqq xmm1, xmm1, xmm2
	vpshuflw xmm1, xmm1, 232
	vpackssdw xmm1, xmm1, xmm1
	vpbroadcastq ymm2, qword ptr [rip + .LCPI1950_15]
	vpxor ymm4, ymm4, ymm2
	vpxor ymm13, ymm15, ymm2
	vpcmpgtq ymm4, ymm4, ymm13
	vpxor ymm13, ymm14, ymm2
	vpxor ymm0, ymm0, ymm2
	vpcmpgtq ymm0, ymm13, ymm0
	vpackssdw ymm0, ymm0, ymm4
	vextracti128 xmm2, ymm0, 1
	vpackssdw xmm0, xmm0, xmm2
	vpshufd xmm0, xmm0, 216
	vpblendw xmm0, xmm0, xmm1, 1
	vpand xmm0, xmm11, xmm0
	vpmovzxwd ymm0, xmm0
	vpbroadcastd ymm1, dword ptr [rip + .LCPI1950_16]
	vpand ymm0, ymm0, ymm1
	vmovdqu ymmword ptr [rsp + 448], ymm0
	mov rax, qword ptr [rsp + 240]
	vmovups ymm1, ymmword ptr [rax + 4*rdx]
	mov rax, qword ptr [rsp + 232]
	vmovups ymm2, ymmword ptr [rax + 4*rdx]
	vmovups ymm0, ymmword ptr [rsp + 256]
	vsubps ymm4, ymm0, ymm1
	vmovups ymm0, ymmword ptr [rsp + 160]
	vsubps ymm11, ymm0, ymm2
	vmulps ymm13, ymm4, ymm4
	vmulps ymm14, ymm11, ymm11
	vaddps ymm13, ymm13, ymm14
	vmovups ymm0, ymmword ptr [rsp + 528]
	vcmpltps ymm14, ymm13, ymm0
	vcmpleps ymm15, ymm0, ymm13
	vcmpltps ymm0, ymm13, ymmword ptr [rsp + 560]
	vandps ymm0, ymm15, ymm0
	vbroadcastss ymm15, dword ptr [rip + .LCPI1950_3]
	vandps ymm14, ymm14, ymm15
	vcmpltps ymm13, ymm3, ymm13
	vandps ymm13, ymm13, ymm15
	vmovaps ymm15, ymm6
	vmovups ymm6, ymmword ptr [rsp + 160]
	vandps ymm0, ymm13, ymm0
	vcvtdq2ps ymm13, ymmword ptr [rsp + 448]
	vmulps ymm14, ymm13, ymm14
	vmulps ymm0, ymm13, ymm0
	vmulps ymm4, ymm14, ymm4
	vaddps ymm15, ymm15, ymm4
	vmulps ymm4, ymm11, ymm14
	vmovaps ymm14, ymm5
	vmovaps ymm5, ymm12
	vmovups ymm12, ymmword ptr [rsp + 256]
	vaddps ymm14, ymm14, ymm4
	vmulps ymm1, ymm1, ymm0
	vaddps ymm5, ymm5, ymm1
	vmulps ymm1, ymm2, ymm0
	vaddps ymm10, ymm10, ymm1
	mov rax, qword ptr [rsp + 224]
	vmulps ymm1, ymm0, ymmword ptr [rax + 4*rdx]
	vaddps ymm9, ymm9, ymm1
	mov rax, qword ptr [rsp + 216]
	vmulps ymm1, ymm0, ymmword ptr [rax + 4*rdx]
	vaddps ymm8, ymm8, ymm1
	vaddps ymm7, ymm0, ymm7
	mov rax, qword ptr [rsp + 248]
	jmp .LBB1950_54
	.p2align	4
.LBB1950_62:
	mov r14, qword ptr [rsp + 448]
	mov eax, r14d
	and eax, 7
	mov edx, r12d
	and edx, 7
	mov ebx, r11d
	and ebx, 7
	cmp rax, r8
	cmovb r8, rax
	cmp rdx, r8
	cmovb r8, rdx
	cmp rbx, r8
	cmovb r8, rbx
	test r8, r8
	mov rax, qword ptr [rsp + 248]
	je .LBB1950_54
	and r13d, -8
	and r14d, -8
	and r12d, -8
	and r11d, -8
	vmovss xmm0, dword ptr [rdi + 4*r13]
	vmovss xmm1, dword ptr [rcx + 4*r14]
	vmovaps xmm2, xmmword ptr [rsp + 112]
	vsubss xmm2, xmm2, xmm0
	vmovaps xmm3, xmmword ptr [rsp + 96]
	vsubss xmm4, xmm3, xmm1
	vmulss xmm11, xmm2, xmm2
	vmulss xmm13, xmm4, xmm4
	vaddss xmm13, xmm11, xmm13
	vmovaps xmm11, xmmword ptr [rsp + 80]
	vucomiss xmm11, xmm13
	jbe .LBB1950_64
	vmovss xmm0, dword ptr [rsp + 16]
	vaddss xmm0, xmm0, xmm2
	vmovss dword ptr [rsp + 16], xmm0
	vmovss xmm0, dword ptr [rsp + 20]
	vaddss xmm0, xmm0, xmm4
	vmovss dword ptr [rsp + 20], xmm0
	jmp .LBB1950_67
	.p2align	4
.LBB1950_64:
	vmovaps xmm2, xmmword ptr [rsp + 64]
	vucomiss xmm2, xmm13
	jbe .LBB1950_67
	vxorps xmm2, xmm2, xmm2
	vucomiss xmm13, xmm2
	jbe .LBB1950_67
	vmovss xmm2, dword ptr [r9 + 4*r12]
	vmovss xmm4, dword ptr [rsi + 4*r11]
	vinsertps xmm0, xmm0, xmm1, 16
	vinsertps xmm0, xmm0, xmm2, 32
	vinsertps xmm0, xmm0, xmm4, 48
	vmovaps xmm1, xmmword ptr [rsp + 32]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 32], xmm1
	vmovss xmm0, dword ptr [rsp + 12]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovss dword ptr [rsp + 12], xmm0
.LBB1950_67:
	cmp r8d, 1
	je .LBB1950_54
	vmovss xmm0, dword ptr [rdi + 4*r13 + 4]
	vmovss xmm1, dword ptr [rcx + 4*r14 + 4]
	vmovaps xmm2, xmmword ptr [rsp + 112]
	vsubss xmm2, xmm2, xmm0
	vmovaps xmm3, xmmword ptr [rsp + 96]
	vsubss xmm4, xmm3, xmm1
	vmulss xmm11, xmm2, xmm2
	vmulss xmm13, xmm4, xmm4
	vaddss xmm13, xmm11, xmm13
	vmovaps xmm11, xmmword ptr [rsp + 80]
	vucomiss xmm11, xmm13
	jbe .LBB1950_69
	vmovss xmm0, dword ptr [rsp + 16]
	vaddss xmm0, xmm0, xmm2
	vmovss dword ptr [rsp + 16], xmm0
	vmovss xmm0, dword ptr [rsp + 20]
	vaddss xmm0, xmm0, xmm4
	vmovss dword ptr [rsp + 20], xmm0
	jmp .LBB1950_73
.LBB1950_69:
	vmovaps xmm2, xmmword ptr [rsp + 64]
	vucomiss xmm2, xmm13
	jbe .LBB1950_73
	vxorps xmm2, xmm2, xmm2
	vucomiss xmm13, xmm2
	jbe .LBB1950_73
	vmovss xmm2, dword ptr [r9 + 4*r12 + 4]
	vmovss xmm4, dword ptr [rsi + 4*r11 + 4]
	vinsertps xmm0, xmm0, xmm1, 16
	vinsertps xmm0, xmm0, xmm2, 32
	vinsertps xmm0, xmm0, xmm4, 48
	vmovaps xmm1, xmmword ptr [rsp + 32]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 32], xmm1
	vmovss xmm0, dword ptr [rsp + 12]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovss dword ptr [rsp + 12], xmm0
.LBB1950_73:
	cmp r8d, 2
	je .LBB1950_54
	vmovss xmm0, dword ptr [rdi + 4*r13 + 8]
	vmovss xmm1, dword ptr [rcx + 4*r14 + 8]
	vmovaps xmm2, xmmword ptr [rsp + 112]
	vsubss xmm2, xmm2, xmm0
	vmovaps xmm3, xmmword ptr [rsp + 96]
	vsubss xmm4, xmm3, xmm1
	vmulss xmm11, xmm2, xmm2
	vmulss xmm13, xmm4, xmm4
	vaddss xmm13, xmm11, xmm13
	vmovaps xmm11, xmmword ptr [rsp + 80]
	vucomiss xmm11, xmm13
	jbe .LBB1950_75
	vmovss xmm0, dword ptr [rsp + 16]
	vaddss xmm0, xmm0, xmm2
	vmovss dword ptr [rsp + 16], xmm0
	vmovss xmm0, dword ptr [rsp + 20]
	vaddss xmm0, xmm0, xmm4
	vmovss dword ptr [rsp + 20], xmm0
	jmp .LBB1950_79
.LBB1950_75:
	vmovaps xmm2, xmmword ptr [rsp + 64]
	vucomiss xmm2, xmm13
	jbe .LBB1950_79
	vxorps xmm2, xmm2, xmm2
	vucomiss xmm13, xmm2
	jbe .LBB1950_79
	vmovss xmm2, dword ptr [r9 + 4*r12 + 8]
	vmovss xmm4, dword ptr [rsi + 4*r11 + 8]
	vinsertps xmm0, xmm0, xmm1, 16
	vinsertps xmm0, xmm0, xmm2, 32
	vinsertps xmm0, xmm0, xmm4, 48
	vmovaps xmm1, xmmword ptr [rsp + 32]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 32], xmm1
	vmovss xmm0, dword ptr [rsp + 12]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovss dword ptr [rsp + 12], xmm0
.LBB1950_79:
	cmp r8d, 3
	je .LBB1950_54
	vmovss xmm0, dword ptr [rdi + 4*r13 + 12]
	vmovss xmm1, dword ptr [rcx + 4*r14 + 12]
	vmovaps xmm2, xmmword ptr [rsp + 112]
	vsubss xmm2, xmm2, xmm0
	vmovaps xmm3, xmmword ptr [rsp + 96]
	vsubss xmm4, xmm3, xmm1
	vmulss xmm11, xmm2, xmm2
	vmulss xmm13, xmm4, xmm4
	vaddss xmm13, xmm11, xmm13
	vmovaps xmm11, xmmword ptr [rsp + 80]
	vucomiss xmm11, xmm13
	jbe .LBB1950_81
	vmovss xmm0, dword ptr [rsp + 16]
	vaddss xmm0, xmm0, xmm2
	vmovss dword ptr [rsp + 16], xmm0
	vmovss xmm0, dword ptr [rsp + 20]
	vaddss xmm0, xmm0, xmm4
	vmovss dword ptr [rsp + 20], xmm0
	jmp .LBB1950_85
.LBB1950_81:
	vmovaps xmm2, xmmword ptr [rsp + 64]
	vucomiss xmm2, xmm13
	jbe .LBB1950_85
	vxorps xmm2, xmm2, xmm2
	vucomiss xmm13, xmm2
	jbe .LBB1950_85
	vmovss xmm2, dword ptr [r9 + 4*r12 + 12]
	vmovss xmm4, dword ptr [rsi + 4*r11 + 12]
	vinsertps xmm0, xmm0, xmm1, 16
	vinsertps xmm0, xmm0, xmm2, 32
	vinsertps xmm0, xmm0, xmm4, 48
	vmovaps xmm1, xmmword ptr [rsp + 32]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 32], xmm1
	vmovss xmm0, dword ptr [rsp + 12]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovss dword ptr [rsp + 12], xmm0
.LBB1950_85:
	cmp r8d, 4
	je .LBB1950_54
	vmovss xmm0, dword ptr [rdi + 4*r13 + 16]
	vmovss xmm1, dword ptr [rcx + 4*r14 + 16]
	vmovaps xmm2, xmmword ptr [rsp + 112]
	vsubss xmm2, xmm2, xmm0
	vmovaps xmm3, xmmword ptr [rsp + 96]
	vsubss xmm4, xmm3, xmm1
	vmulss xmm11, xmm2, xmm2
	vmulss xmm13, xmm4, xmm4
	vaddss xmm13, xmm11, xmm13
	vmovaps xmm11, xmmword ptr [rsp + 80]
	vucomiss xmm11, xmm13
	jbe .LBB1950_87
	vmovss xmm0, dword ptr [rsp + 16]
	vaddss xmm0, xmm0, xmm2
	vmovss dword ptr [rsp + 16], xmm0
	vmovss xmm0, dword ptr [rsp + 20]
	vaddss xmm0, xmm0, xmm4
	vmovss dword ptr [rsp + 20], xmm0
	jmp .LBB1950_91
.LBB1950_87:
	vmovaps xmm2, xmmword ptr [rsp + 64]
	vucomiss xmm2, xmm13
	jbe .LBB1950_91
	vxorps xmm2, xmm2, xmm2
	vucomiss xmm13, xmm2
	jbe .LBB1950_91
	vmovss xmm2, dword ptr [r9 + 4*r12 + 16]
	vmovss xmm4, dword ptr [rsi + 4*r11 + 16]
	vinsertps xmm0, xmm0, xmm1, 16
	vinsertps xmm0, xmm0, xmm2, 32
	vinsertps xmm0, xmm0, xmm4, 48
	vmovaps xmm1, xmmword ptr [rsp + 32]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 32], xmm1
	vmovss xmm0, dword ptr [rsp + 12]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovss dword ptr [rsp + 12], xmm0
.LBB1950_91:
	cmp r8d, 5
	je .LBB1950_54
	vmovss xmm0, dword ptr [rdi + 4*r13 + 20]
	vmovss xmm1, dword ptr [rcx + 4*r14 + 20]
	vmovaps xmm2, xmmword ptr [rsp + 112]
	vsubss xmm2, xmm2, xmm0
	vmovaps xmm3, xmmword ptr [rsp + 96]
	vsubss xmm4, xmm3, xmm1
	vmulss xmm11, xmm2, xmm2
	vmulss xmm13, xmm4, xmm4
	vaddss xmm13, xmm11, xmm13
	vmovaps xmm11, xmmword ptr [rsp + 80]
	vucomiss xmm11, xmm13
	jbe .LBB1950_93
	vmovss xmm0, dword ptr [rsp + 16]
	vaddss xmm0, xmm0, xmm2
	vmovss dword ptr [rsp + 16], xmm0
	vmovss xmm0, dword ptr [rsp + 20]
	vaddss xmm0, xmm0, xmm4
	vmovss dword ptr [rsp + 20], xmm0
	jmp .LBB1950_97
.LBB1950_93:
	vmovaps xmm2, xmmword ptr [rsp + 64]
	vucomiss xmm2, xmm13
	jbe .LBB1950_97
	vxorps xmm2, xmm2, xmm2
	vucomiss xmm13, xmm2
	jbe .LBB1950_97
	vmovss xmm2, dword ptr [r9 + 4*r12 + 20]
	vmovss xmm4, dword ptr [rsi + 4*r11 + 20]
	vinsertps xmm0, xmm0, xmm1, 16
	vinsertps xmm0, xmm0, xmm2, 32
	vinsertps xmm0, xmm0, xmm4, 48
	vmovaps xmm1, xmmword ptr [rsp + 32]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 32], xmm1
	vmovss xmm0, dword ptr [rsp + 12]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovss dword ptr [rsp + 12], xmm0
.LBB1950_97:
	cmp r8d, 6
	je .LBB1950_54
	vmovss xmm0, dword ptr [rdi + 4*r13 + 24]
	vmovss xmm1, dword ptr [rcx + 4*r14 + 24]
	vmovaps xmm2, xmmword ptr [rsp + 112]
	vsubss xmm2, xmm2, xmm0
	vmovaps xmm3, xmmword ptr [rsp + 96]
	vsubss xmm4, xmm3, xmm1
	vmulss xmm11, xmm2, xmm2
	vmulss xmm13, xmm4, xmm4
	vaddss xmm13, xmm11, xmm13
	vmovaps xmm11, xmmword ptr [rsp + 80]
	vucomiss xmm11, xmm13
	jbe .LBB1950_99
	vmovss xmm0, dword ptr [rsp + 16]
	vaddss xmm0, xmm0, xmm2
	vmovss dword ptr [rsp + 16], xmm0
	vmovss xmm0, dword ptr [rsp + 20]
	vaddss xmm0, xmm0, xmm4
	vmovss dword ptr [rsp + 20], xmm0
	.p2align	4
.LBB1950_54:
	mov rdi, qword ptr [rsp + 24]
.LBB1950_55:
	cmp rax, qword ptr [rsp + 416]
	lea r14, [rax + 1]
	jne .LBB1950_43
	jmp .LBB1950_56
.LBB1950_99:
	vmovaps xmm2, xmmword ptr [rsp + 64]
	vucomiss xmm2, xmm13
	mov rdi, qword ptr [rsp + 24]
	jbe .LBB1950_55
	vxorps xmm2, xmm2, xmm2
	vucomiss xmm13, xmm2
	jbe .LBB1950_55
	vmovss xmm2, dword ptr [r9 + 4*r12 + 24]
	vmovss xmm4, dword ptr [rsi + 4*r11 + 24]
	vinsertps xmm0, xmm0, xmm1, 16
	vinsertps xmm0, xmm0, xmm2, 32
	vinsertps xmm0, xmm0, xmm4, 48
	vmovaps xmm1, xmmword ptr [rsp + 32]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 32], xmm1
	vmovss xmm0, dword ptr [rsp + 12]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovss dword ptr [rsp + 12], xmm0
	jmp .LBB1950_55
.LBB1950_56:
	vmovaps xmm3, xmmword ptr [rsp + 32]
	vmovaps xmmword ptr [rsp + 128], xmm3
	vmovss xmm0, dword ptr [rsp + 12]
	vmovss dword ptr [rsp + 144], xmm0
	vmovss xmm0, dword ptr [rsp + 16]
	vmovss dword ptr [rsp + 148], xmm0
	vmovss xmm11, dword ptr [rsp + 20]
	vmovss dword ptr [rsp + 152], xmm11
	vunpcklps xmm0, xmm5, xmm10
	vmovlhps xmm0, xmm0, xmm9
	vinsertps xmm0, xmm0, xmm8, 48
	vinsertps xmm1, xmm10, xmm5, 76
	vshufps xmm1, xmm1, xmm9, 212
	vinsertps xmm1, xmm1, xmm8, 112
	vaddps xmm0, xmm0, xmm1
	vunpckhps xmm1, xmm5, xmm10
	vblendps xmm1, xmm9, xmm1, 3
	vinsertps xmm1, xmm1, xmm8, 176
	vaddps xmm0, xmm0, xmm1
	vshufps xmm1, xmm10, xmm5, 51
	vshufps xmm1, xmm1, xmm9, 242
	vblendps xmm1, xmm1, xmm8, 8
	vaddps xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm10, 1
	vextractf128 xmm2, ymm5, 1
	vunpcklps xmm4, xmm2, xmm1
	vmovaps ymm6, ymm8
	vextractf128 xmm8, ymm9, 1
	vmovlhps xmm4, xmm4, xmm8
	vmovaps ymm5, ymm7
	vextractf128 xmm7, ymm6, 1
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
	vhaddps xmm1, xmm5, xmm15
	vshufps xmm1, xmm1, xmm1, 232
	vshufpd xmm2, xmm5, xmm5, 1
	vinsertps xmm2, xmm2, xmm15, 156
	vaddps xmm1, xmm1, xmm2
	vshufpd xmm2, xmm15, xmm15, 1
	vinsertps xmm2, xmm2, xmm5, 204
	vaddps xmm1, xmm1, xmm2
	vextractf128 xmm2, ymm15, 1
	vextractf128 xmm4, ymm5, 1
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
	vmovsd xmm2, qword ptr [rsp + 144]
	vaddps xmm1, xmm1, xmm2
	vaddps xmm0, xmm0, xmm3
	vmovshdup xmm2, xmm14
	vaddss xmm2, xmm14, xmm2
	vshufpd xmm4, xmm14, xmm14, 1
	vaddss xmm2, xmm2, xmm4
	vshufps xmm4, xmm14, xmm14, 255
	vaddss xmm2, xmm2, xmm4
	vextractf128 xmm3, ymm14, 1
	vaddss xmm2, xmm2, xmm3
	vmovshdup xmm4, xmm3
	vaddss xmm2, xmm2, xmm4
	vshufpd xmm4, xmm3, xmm3, 1
	vaddss xmm2, xmm2, xmm4
	vshufps xmm3, xmm3, xmm3, 255
	vaddss xmm2, xmm2, xmm3
	vaddss xmm2, xmm11, xmm2
.LBB1950_57:
	vmovaps xmmword ptr [rsp + 128], xmm0
	vmovlps qword ptr [rsp + 144], xmm1
	vmovss dword ptr [rsp + 152], xmm2
	lea rdi, [rsp + 304]
	mov rsi, qword ptr [rsp + 368]
	vmovaps xmm0, xmmword ptr [rsp + 496]
	vmovaps xmm1, xmmword ptr [rsp + 480]
	lea rdx, [rsp + 432]
	lea rcx, [rsp + 288]
	lea r8, [rsp + 128]
	vzeroupper
	call swarm::rules::finish
	mov r8, qword ptr [rsp + 376]
	cmp r8, qword ptr [rsp + 352]
	jae .LBB1950_59
	vmovss xmm0, dword ptr [rsp + 304]
	vmovss xmm1, dword ptr [rsp + 308]
	vmovss xmm2, dword ptr [rsp + 312]
	vmovss xmm3, dword ptr [rsp + 316]
	mov rax, qword ptr [rsp + 344]
	vmovss dword ptr [rax + 4*r8], xmm0
	mov rax, qword ptr [rsp + 336]
	vmovss dword ptr [rax + 4*r8], xmm1
	mov rax, qword ptr [rsp + 328]
	vmovss dword ptr [rax + 4*r8], xmm2
	mov rax, qword ptr [rsp + 320]
	vmovss dword ptr [rax + 4*r8], xmm3
	jmp .LBB1950_59
.LBB1950_61:
	add rsp, 600
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
