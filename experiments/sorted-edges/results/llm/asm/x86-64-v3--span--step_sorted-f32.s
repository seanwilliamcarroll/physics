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
	sub rsp, 552
	.cfi_def_cfa_offset 608
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r14, rdi
	lea rax, [rdi + 316]
	mov qword ptr [rsp + 240], rax
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
	vmovaps xmmword ptr [rsp + 480], xmm6
	vblendvps xmm1, xmm3, xmm6, xmm1
	vmovshdup xmm3, xmm5
	vmovaps xmmword ptr [rsp + 416], xmm3
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
	vmovaps xmmword ptr [rsp + 432], xmm5
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
	vmovddup xmm2, qword ptr [rip + .LCPI1950_9]
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
	mov qword ptr [rsp + 160], rax
	mov r13, r14
	mov qword ptr [rsp + 8], rcx
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
	mov rdi, qword ptr [rsp + 160]
	mov rsi, r15
	vmovss dword ptr [rsp + 96], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovss xmm0, dword ptr [rsp + 96]
	mov rcx, qword ptr [rsp + 8]
	jmp .LBB1950_8
.LBB1950_9:
	mov r13, qword ptr [rcx + 32]
	mov r12, qword ptr [rcx + 40]
	mov qword ptr [rcx + 136], 0
	xor r15d, r15d
	lea rax, [rcx + 120]
	mov qword ptr [rsp + 160], rax
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
	mov rdi, qword ptr [rsp + 160]
	mov rsi, r15
	vmovss dword ptr [rsp + 96], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovss xmm0, dword ptr [rsp + 96]
	mov rcx, qword ptr [rsp + 8]
	jmp .LBB1950_17
.LBB1950_18:
	mov r13, qword ptr [rcx + 56]
	mov r12, qword ptr [rcx + 64]
	mov qword ptr [rcx + 160], 0
	xor r15d, r15d
	lea rax, [rcx + 144]
	mov qword ptr [rsp + 160], rax
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
	mov rdi, qword ptr [rsp + 160]
	mov rsi, r15
	vmovss dword ptr [rsp + 96], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovss xmm0, dword ptr [rsp + 96]
	mov rcx, qword ptr [rsp + 8]
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
	vmovss dword ptr [rsp + 96], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovss xmm0, dword ptr [rsp + 96]
	mov rcx, qword ptr [rsp + 8]
	jmp .LBB1950_35
.LBB1950_36:
	vmovups ymm0, ymmword ptr [rcx + 96]
	mov rsi, qword ptr [rcx + 112]
	vmovdqu ymm1, ymmword ptr [rcx]
	mov rax, qword ptr [rcx + 8]
	mov qword ptr [rsp + 216], rax
	vmovups ymmword ptr [rcx], ymm0
	vmovdqu ymmword ptr [rcx + 96], ymm1
	vmovups ymm0, ymmword ptr [rcx + 128]
	vmovdqu ymm2, ymmword ptr [rcx + 32]
	mov rax, qword ptr [rcx + 32]
	mov qword ptr [rsp + 208], rax
	mov rax, qword ptr [rcx + 56]
	mov qword ptr [rsp + 200], rax
	vmovups ymmword ptr [rcx + 32], ymm0
	vmovdqu ymmword ptr [rcx + 128], ymm2
	mov rax, qword ptr [rsp + 8]
	mov rcx, qword ptr [rax + 176]
	mov rax, qword ptr [rsp + 8]
	vmovdqu ymm0, ymmword ptr [rax + 64]
	mov rax, qword ptr [rsp + 8]
	mov rax, qword ptr [rax + 64]
	mov rdx, qword ptr [rsp + 8]
	vmovups xmm3, xmmword ptr [rdx + 160]
	mov rdx, qword ptr [rsp + 8]
	vmovups xmmword ptr [rdx + 64], xmm3
	mov rdx, qword ptr [rsp + 8]
	mov rdx, qword ptr [rdx + 80]
	mov qword ptr [rsp + 192], rdx
	mov rdx, qword ptr [rsp + 8]
	mov qword ptr [rdx + 80], rcx
	mov rcx, qword ptr [rsp + 8]
	mov qword ptr [rcx + 88], r15
	vmovdqu ymmword ptr [rcx + 160], ymm0
	test rsi, rsi
	je .LBB1950_98
	vmovss xmm3, dword ptr [rcx + 320]
	vmulss xmm3, xmm3, xmm3
	vextracti128 xmm1, ymm1, 1
	vpextrq rcx, xmm2, 1
	vmovq rdx, xmm1
	cmp rcx, rdx
	cmovb rdx, rcx
	mov rcx, qword ptr [rsp + 8]
	vmovaps xmm1, xmmword ptr [rsp + 480]
	vmulss xmm1, xmm1, xmm1
	cmp rax, rdx
	cmovb rdx, rax
	vextracti128 xmm0, ymm0, 1
	vpextrq rax, xmm0, 1
	vmovaps xmmword ptr [rsp + 64], xmm1
	vbroadcastss ymm0, xmm1
	vmovaps xmmword ptr [rsp + 80], xmm3
	vbroadcastss ymm1, xmm3
	cmp rax, rdx
	cmovb rdx, rax
	mov qword ptr [rsp + 224], rdx
	xor edx, edx
	mov qword ptr [rsp + 232], rsi
	vmovups ymmword ptr [rsp + 480], ymm0
	vmovups ymmword ptr [rsp + 512], ymm1
	mov ebp, 4
	jmp .LBB1950_38
.LBB1950_96:
	mov rcx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 232]
	.p2align	4
.LBB1950_97:
	inc rdx
	cmp rdx, rsi
	je .LBB1950_98
.LBB1950_38:
	mov rax, qword ptr [rcx + 16]
	mov qword ptr [rsp + 360], rax
	cmp rdx, rax
	jae .LBB1950_97
	mov rax, qword ptr [rcx + 40]
	mov qword ptr [rsp + 352], rax
	cmp rdx, rax
	jae .LBB1950_97
	mov rax, qword ptr [rcx + 64]
	mov rcx, qword ptr [rcx + 88]
	mov qword ptr [rsp + 344], rax
	cmp rdx, rax
	setb al
	mov qword ptr [rsp + 336], rcx
	cmp rdx, rcx
	setb cl
	and cl, al
	cmp cl, 1
	mov rcx, qword ptr [rsp + 8]
	jne .LBB1950_97
	mov rax, qword ptr [rcx + 8]
	mov qword ptr [rsp + 328], rax
	vmovss xmm13, dword ptr [rax + 4*rdx]
	mov rax, qword ptr [rcx + 32]
	mov rsi, qword ptr [rcx + 56]
	mov qword ptr [rsp + 320], rax
	vmovss xmm14, dword ptr [rax + 4*rdx]
	mov rax, qword ptr [rcx + 80]
	mov qword ptr [rsp + 312], rsi
	vmovss xmm2, dword ptr [rsi + 4*rdx]
	mov qword ptr [rsp + 248], rdx
	mov qword ptr [rsp + 304], rax
	vmovss xmm3, dword ptr [rax + 4*rdx]
	vmovss dword ptr [rsp + 128], xmm13
	vmovss dword ptr [rsp + 132], xmm14
	vmovss dword ptr [rsp + 136], xmm2
	vmovss dword ptr [rsp + 140], xmm3
	vmovss xmm3, dword ptr [rcx + 280]
	vmulss xmm4, xmm13, xmm3
	vxorps xmm2, xmm2, xmm2
	vmaxss xmm4, xmm4, xmm2
	vroundss xmm4, xmm4, xmm4, 9
	vcvtss2sd xmm5, xmm4, xmm4
	vcvttsd2si rax, xmm5
	mov rsi, rcx
	mov rcx, rax
	sar rcx, 63
	vmovsd xmm0, qword ptr [rip + .LCPI1950_5]
	vsubsd xmm6, xmm5, xmm0
	vcvttsd2si r9, xmm6
	and r9, rcx
	or r9, rax
	vxorpd xmm6, xmm6, xmm6
	vucomisd xmm5, xmm6
	mov edi, 0
	cmovb r9, rdi
	vmovsd xmm1, qword ptr [rip + .LCPI1950_6]
	vucomisd xmm5, xmm1
	mov r8, -1
	cmova r9, r8
	mov rax, qword ptr [rsi + 264]
	mov qword ptr [rsp + 296], rax
	sub rax, 1
	cmovb rax, rdi
	cmp rax, r9
	cmovb r9, rax
	vmovss xmm7, dword ptr [rip + .LCPI1950_4]
	vucomiss xmm4, xmm7
	cmovae r9, rdi
	vmulss xmm3, xmm14, xmm3
	vmaxss xmm3, xmm3, xmm2
	vroundss xmm3, xmm3, xmm3, 9
	vcvtss2sd xmm4, xmm3, xmm3
	vcvttsd2si rcx, xmm4
	mov rdx, rcx
	sar rdx, 63
	vsubsd xmm5, xmm4, xmm0
	vcvttsd2si r10, xmm5
	and r10, rdx
	or r10, rcx
	vucomisd xmm4, xmm6
	cmovb r10, rdi
	vucomisd xmm4, xmm1
	cmova r10, r8
	mov rcx, qword ptr [rsi + 272]
	sub rcx, 1
	cmovb rcx, rdi
	cmp rcx, r10
	cmovb r10, rcx
	vucomiss xmm3, xmm7
	cmovae r10, rdi
	mov rdx, r9
	sub rdx, 1
	cmovb rdx, rdi
	mov qword ptr [rsp + 280], rdx
	mov r14, r10
	sub r14, 1
	cmovb r14, rdi
	inc r10
	cmp rcx, r10
	cmovb r10, rcx
	vxorps xmm8, xmm8, xmm8
	vxorps xmm4, xmm4, xmm4
	mov qword ptr [rsp + 288], r10
	cmp r14, r10
	ja .LBB1950_94
	inc r9
	cmp rax, r9
	cmovb r9, rax
	inc r9
	mov rax, qword ptr [rsp + 8]
	mov rcx, qword ptr [rax + 200]
	mov qword ptr [rsp + 256], rcx
	mov rsi, qword ptr [rax + 208]
	vbroadcastss ymm0, xmm14
	vmovups ymmword ptr [rsp + 96], ymm0
	vbroadcastss ymm0, xmm13
	vmovups ymmword ptr [rsp + 160], ymm0
	vxorps xmm0, xmm0, xmm0
	vmovaps xmmword ptr [rsp + 16], xmm0
	vxorps xmm0, xmm0, xmm0
	vmovss dword ptr [rsp + 4], xmm0
	vxorps xmm3, xmm3, xmm3
	vxorpd xmm6, xmm6, xmm6
	vxorps xmm7, xmm7, xmm7
	vxorps xmm8, xmm8, xmm8
	vxorps xmm10, xmm10, xmm10
	vxorps xmm11, xmm11, xmm11
	vxorps xmm12, xmm12, xmm12
	vmovaps xmmword ptr [rsp + 48], xmm0
	vmovaps xmmword ptr [rsp + 32], xmm0
	mov qword ptr [rsp + 272], r9
	mov qword ptr [rsp + 264], rsi
	vmovaps xmmword ptr [rsp + 464], xmm13
	vmovaps xmmword ptr [rsp + 448], xmm14
	jmp .LBB1950_46
.LBB1950_43:
	vmovaps xmm0, xmmword ptr [rsp + 48]
	vaddss xmm0, xmm0, xmm2
	vmovaps xmmword ptr [rsp + 48], xmm0
	vmovss xmm0, dword ptr [rsp + 4]
	vaddss xmm0, xmm8, xmm0
	vmovss dword ptr [rsp + 4], xmm0
	.p2align	4
.LBB1950_44:
	vmovaps ymm8, ymm9
.LBB1950_45:
	cmp r14, qword ptr [rsp + 288]
	lea r14, [r14 + 1]
	mov r9, qword ptr [rsp + 272]
	mov rsi, qword ptr [rsp + 264]
	je .LBB1950_93
.LBB1950_46:
	mov rax, qword ptr [rsp + 296]
	imul rax, r14
	mov rcx, qword ptr [rsp + 280]
	add rcx, rax
	cmp rcx, rsi
	jae .LBB1950_47
	add rax, r9
	mov r11d, 0
	mov edx, 0
	cmp rax, rsi
	jae .LBB1950_50
	mov rsi, qword ptr [rsp + 256]
	mov edx, dword ptr [rsi + 4*rcx]
	mov r11d, dword ptr [rsi + 4*rax]
	jmp .LBB1950_50
	.p2align	4
.LBB1950_47:
	xor r11d, r11d
	xor edx, edx
.LBB1950_50:
	mov r9, r11
	sub r9, rdx
	setb bl
	cmp r11, qword ptr [rsp + 360]
	seta al
	or al, bl
	mov rax, qword ptr [rsp + 328]
	lea r15, [rax + 4*rdx]
	mov rax, r9
	mov r13d, 0
	cmovne rax, r13
	cmovne r15, rbp
	cmp r11, qword ptr [rsp + 352]
	seta cl
	or cl, bl
	mov rcx, qword ptr [rsp + 320]
	lea rcx, [rcx + 4*rdx]
	mov r10, r9
	cmovne r10, r13
	cmovne rcx, rbp
	mov r12, r10
	shr r12, 3
	cmp r11, qword ptr [rsp + 344]
	seta sil
	or sil, bl
	mov rsi, qword ptr [rsp + 312]
	lea rsi, [rsi + 4*rdx]
	mov r8, r9
	cmovne r8, r13
	cmovne rsi, rbp
	mov rdi, r8
	shr rdi, 3
	cmp r11, qword ptr [rsp + 336]
	seta r11b
	or r11b, bl
	cmovne r9, r13
	mov r11, qword ptr [rsp + 304]
	lea r13, [r11 + 4*rdx]
	cmovne r13, rbp
	mov r11, r9
	shr r11, 3
	mov rdx, rax
	shr rdx, 3
	cmp r12, rdx
	cmovb rdx, r12
	cmp rdi, rdx
	cmovb rdx, rdi
	cmp r11, rdx
	cmovb rdx, r11
	test rdx, rdx
	je .LBB1950_53
	shl rdx, 5
	xor r11d, r11d
	.p2align	4
.LBB1950_52:
	vmovups ymm2, ymmword ptr [r15 + r11]
	vmovups ymm4, ymmword ptr [rcx + r11]
	vmovups ymm0, ymmword ptr [rsp + 160]
	vsubps ymm5, ymm0, ymm2
	vmovaps ymm14, ymm12
	vmovaps ymm12, ymm11
	vmovaps ymm11, ymm10
	vmovaps ymm10, ymm8
	vmovups ymm0, ymmword ptr [rsp + 96]
	vsubps ymm8, ymm0, ymm4
	vmulps ymm15, ymm5, ymm5
	vmulps ymm0, ymm8, ymm8
	vaddps ymm0, ymm15, ymm0
	vmovups ymm1, ymmword ptr [rsp + 512]
	vcmpltps ymm15, ymm0, ymm1
	vcmpleps ymm1, ymm1, ymm0
	vcmpltps ymm13, ymm0, ymmword ptr [rsp + 480]
	vandps ymm1, ymm13, ymm1
	vbroadcastss ymm13, dword ptr [rip + .LCPI1950_3]
	vandps ymm15, ymm15, ymm13
	vxorps xmm9, xmm9, xmm9
	vcmpltps ymm0, ymm9, ymm0
	vandps ymm0, ymm13, ymm0
	vandps ymm0, ymm0, ymm1
	vmulps ymm1, ymm15, ymm5
	vaddps ymm6, ymm6, ymm1
	vmulps ymm1, ymm8, ymm15
	vmovaps ymm8, ymm10
	vmovaps ymm10, ymm11
	vmovaps ymm11, ymm12
	vaddps ymm3, ymm3, ymm1
	vmulps ymm1, ymm2, ymm0
	vaddps ymm12, ymm14, ymm1
	vmulps ymm1, ymm4, ymm0
	vmulps ymm2, ymm0, ymmword ptr [rsi + r11]
	vaddps ymm11, ymm11, ymm1
	vaddps ymm10, ymm10, ymm2
	vmulps ymm1, ymm0, ymmword ptr [r13 + r11]
	vaddps ymm8, ymm8, ymm1
	vaddps ymm7, ymm0, ymm7
	add r11, 32
	cmp rdx, r11
	jne .LBB1950_52
.LBB1950_53:
	mov edi, r10d
	and edi, 7
	mov r11d, r8d
	and r11d, 7
	mov ebx, r9d
	and ebx, 7
	mov edx, eax
	and edx, 7
	cmp rdi, rdx
	cmovb rdx, rdi
	cmp r11, rdx
	cmovb rdx, r11
	cmp rbx, rdx
	cmovb rdx, rbx
	test rdx, rdx
	je .LBB1950_45
	vmovaps ymm9, ymm8
	and eax, -8
	and r10d, -8
	and r8d, -8
	and r9d, -8
	vmovss xmm15, dword ptr [r15 + 4*rax]
	vmovss xmm5, dword ptr [rcx + 4*r10]
	vmovaps xmm13, xmmword ptr [rsp + 464]
	vsubss xmm8, xmm13, xmm15
	vmovaps xmm14, xmmword ptr [rsp + 448]
	vsubss xmm2, xmm14, xmm5
	vmulss xmm0, xmm8, xmm8
	vmulss xmm1, xmm2, xmm2
	vaddss xmm4, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 80]
	vucomiss xmm0, xmm4
	jbe .LBB1950_55
	vmovaps xmm0, xmmword ptr [rsp + 48]
	vaddss xmm0, xmm8, xmm0
	vmovaps xmmword ptr [rsp + 48], xmm0
	vmovss xmm0, dword ptr [rsp + 4]
	vaddss xmm0, xmm0, xmm2
	vmovss dword ptr [rsp + 4], xmm0
	jmp .LBB1950_58
	.p2align	4
.LBB1950_55:
	vmovaps xmm0, xmmword ptr [rsp + 64]
	vucomiss xmm0, xmm4
	jbe .LBB1950_58
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm4, xmm0
	jbe .LBB1950_58
	vmovss xmm0, dword ptr [rsi + 4*r8]
	vmovss xmm1, dword ptr [r13 + 4*r9]
	vinsertps xmm2, xmm15, xmm5, 16
	vinsertps xmm0, xmm2, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vmovaps xmm1, xmmword ptr [rsp + 16]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 16], xmm1
	vmovaps xmm0, xmmword ptr [rsp + 32]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovaps xmmword ptr [rsp + 32], xmm0
.LBB1950_58:
	cmp edx, 1
	je .LBB1950_44
	vmovss xmm15, dword ptr [r15 + 4*rax + 4]
	vmovss xmm5, dword ptr [rcx + 4*r10 + 4]
	vsubss xmm2, xmm13, xmm15
	vsubss xmm8, xmm14, xmm5
	vmulss xmm0, xmm2, xmm2
	vmulss xmm1, xmm8, xmm8
	vaddss xmm4, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 80]
	vucomiss xmm0, xmm4
	jbe .LBB1950_60
	vmovaps xmm0, xmmword ptr [rsp + 48]
	vaddss xmm0, xmm0, xmm2
	vmovaps xmmword ptr [rsp + 48], xmm0
	vmovss xmm0, dword ptr [rsp + 4]
	vaddss xmm0, xmm8, xmm0
	vmovss dword ptr [rsp + 4], xmm0
	jmp .LBB1950_64
.LBB1950_60:
	vmovaps xmm0, xmmword ptr [rsp + 64]
	vucomiss xmm0, xmm4
	jbe .LBB1950_64
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm4, xmm0
	jbe .LBB1950_64
	vmovss xmm0, dword ptr [rsi + 4*r8 + 4]
	vmovss xmm1, dword ptr [r13 + 4*r9 + 4]
	vinsertps xmm2, xmm15, xmm5, 16
	vinsertps xmm0, xmm2, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vmovaps xmm1, xmmword ptr [rsp + 16]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 16], xmm1
	vmovaps xmm0, xmmword ptr [rsp + 32]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovaps xmmword ptr [rsp + 32], xmm0
.LBB1950_64:
	cmp edx, 2
	je .LBB1950_44
	vmovss xmm15, dword ptr [r15 + 4*rax + 8]
	vmovss xmm5, dword ptr [rcx + 4*r10 + 8]
	vsubss xmm2, xmm13, xmm15
	vsubss xmm8, xmm14, xmm5
	vmulss xmm0, xmm2, xmm2
	vmulss xmm1, xmm8, xmm8
	vaddss xmm4, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 80]
	vucomiss xmm0, xmm4
	jbe .LBB1950_66
	vmovaps xmm0, xmmword ptr [rsp + 48]
	vaddss xmm0, xmm0, xmm2
	vmovaps xmmword ptr [rsp + 48], xmm0
	vmovss xmm0, dword ptr [rsp + 4]
	vaddss xmm0, xmm8, xmm0
	vmovss dword ptr [rsp + 4], xmm0
	jmp .LBB1950_70
.LBB1950_66:
	vmovaps xmm0, xmmword ptr [rsp + 64]
	vucomiss xmm0, xmm4
	jbe .LBB1950_70
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm4, xmm0
	jbe .LBB1950_70
	vmovss xmm0, dword ptr [rsi + 4*r8 + 8]
	vmovss xmm1, dword ptr [r13 + 4*r9 + 8]
	vinsertps xmm2, xmm15, xmm5, 16
	vinsertps xmm0, xmm2, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vmovaps xmm1, xmmword ptr [rsp + 16]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 16], xmm1
	vmovaps xmm0, xmmword ptr [rsp + 32]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovaps xmmword ptr [rsp + 32], xmm0
.LBB1950_70:
	cmp edx, 3
	je .LBB1950_44
	vmovss xmm15, dword ptr [r15 + 4*rax + 12]
	vmovss xmm5, dword ptr [rcx + 4*r10 + 12]
	vsubss xmm2, xmm13, xmm15
	vsubss xmm8, xmm14, xmm5
	vmulss xmm0, xmm2, xmm2
	vmulss xmm1, xmm8, xmm8
	vaddss xmm4, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 80]
	vucomiss xmm0, xmm4
	jbe .LBB1950_72
	vmovaps xmm0, xmmword ptr [rsp + 48]
	vaddss xmm0, xmm0, xmm2
	vmovaps xmmword ptr [rsp + 48], xmm0
	vmovss xmm0, dword ptr [rsp + 4]
	vaddss xmm0, xmm8, xmm0
	vmovss dword ptr [rsp + 4], xmm0
	jmp .LBB1950_76
.LBB1950_72:
	vmovaps xmm0, xmmword ptr [rsp + 64]
	vucomiss xmm0, xmm4
	jbe .LBB1950_76
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm4, xmm0
	jbe .LBB1950_76
	vmovss xmm0, dword ptr [rsi + 4*r8 + 12]
	vmovss xmm1, dword ptr [r13 + 4*r9 + 12]
	vinsertps xmm2, xmm15, xmm5, 16
	vinsertps xmm0, xmm2, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vmovaps xmm1, xmmword ptr [rsp + 16]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 16], xmm1
	vmovaps xmm0, xmmword ptr [rsp + 32]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovaps xmmword ptr [rsp + 32], xmm0
.LBB1950_76:
	cmp edx, 4
	je .LBB1950_44
	vmovss xmm15, dword ptr [r15 + 4*rax + 16]
	vmovss xmm5, dword ptr [rcx + 4*r10 + 16]
	vsubss xmm2, xmm13, xmm15
	vsubss xmm8, xmm14, xmm5
	vmulss xmm0, xmm2, xmm2
	vmulss xmm1, xmm8, xmm8
	vaddss xmm4, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 80]
	vucomiss xmm0, xmm4
	jbe .LBB1950_78
	vmovaps xmm0, xmmword ptr [rsp + 48]
	vaddss xmm0, xmm0, xmm2
	vmovaps xmmword ptr [rsp + 48], xmm0
	vmovss xmm0, dword ptr [rsp + 4]
	vaddss xmm0, xmm8, xmm0
	vmovss dword ptr [rsp + 4], xmm0
	jmp .LBB1950_82
.LBB1950_78:
	vmovaps xmm0, xmmword ptr [rsp + 64]
	vucomiss xmm0, xmm4
	jbe .LBB1950_82
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm4, xmm0
	jbe .LBB1950_82
	vmovss xmm0, dword ptr [rsi + 4*r8 + 16]
	vmovss xmm1, dword ptr [r13 + 4*r9 + 16]
	vinsertps xmm2, xmm15, xmm5, 16
	vinsertps xmm0, xmm2, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vmovaps xmm1, xmmword ptr [rsp + 16]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 16], xmm1
	vmovaps xmm0, xmmword ptr [rsp + 32]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovaps xmmword ptr [rsp + 32], xmm0
.LBB1950_82:
	cmp edx, 5
	je .LBB1950_44
	vmovss xmm15, dword ptr [r15 + 4*rax + 20]
	vmovss xmm5, dword ptr [rcx + 4*r10 + 20]
	vsubss xmm2, xmm13, xmm15
	vsubss xmm8, xmm14, xmm5
	vmulss xmm0, xmm2, xmm2
	vmulss xmm1, xmm8, xmm8
	vaddss xmm4, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 80]
	vucomiss xmm0, xmm4
	jbe .LBB1950_84
	vmovaps xmm0, xmmword ptr [rsp + 48]
	vaddss xmm0, xmm0, xmm2
	vmovaps xmmword ptr [rsp + 48], xmm0
	vmovss xmm0, dword ptr [rsp + 4]
	vaddss xmm0, xmm8, xmm0
	vmovss dword ptr [rsp + 4], xmm0
	jmp .LBB1950_88
.LBB1950_84:
	vmovaps xmm0, xmmword ptr [rsp + 64]
	vucomiss xmm0, xmm4
	jbe .LBB1950_88
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm4, xmm0
	jbe .LBB1950_88
	vmovss xmm0, dword ptr [rsi + 4*r8 + 20]
	vmovss xmm1, dword ptr [r13 + 4*r9 + 20]
	vinsertps xmm2, xmm15, xmm5, 16
	vinsertps xmm0, xmm2, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vmovaps xmm1, xmmword ptr [rsp + 16]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 16], xmm1
	vmovaps xmm0, xmmword ptr [rsp + 32]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovaps xmmword ptr [rsp + 32], xmm0
.LBB1950_88:
	cmp edx, 6
	je .LBB1950_44
	vmovss xmm15, dword ptr [r15 + 4*rax + 24]
	vmovss xmm5, dword ptr [rcx + 4*r10 + 24]
	vsubss xmm2, xmm13, xmm15
	vsubss xmm8, xmm14, xmm5
	vmulss xmm0, xmm2, xmm2
	vmulss xmm1, xmm8, xmm8
	vaddss xmm4, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 80]
	vucomiss xmm0, xmm4
	ja .LBB1950_43
	vmovaps xmm0, xmmword ptr [rsp + 64]
	vucomiss xmm0, xmm4
	jbe .LBB1950_44
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm4, xmm0
	vmovaps ymm8, ymm9
	jbe .LBB1950_45
	vmovss xmm0, dword ptr [rsi + 4*r8 + 24]
	vmovss xmm1, dword ptr [r13 + 4*r9 + 24]
	vinsertps xmm2, xmm15, xmm5, 16
	vinsertps xmm0, xmm2, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vmovaps xmm1, xmmword ptr [rsp + 16]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 16], xmm1
	vmovaps xmm0, xmmword ptr [rsp + 32]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovaps xmmword ptr [rsp + 32], xmm0
	jmp .LBB1950_45
.LBB1950_93:
	vunpcklps xmm0, xmm12, xmm11
	vmovlhps xmm0, xmm0, xmm10
	vinsertps xmm0, xmm0, xmm8, 48
	vinsertps xmm1, xmm11, xmm12, 76
	vshufps xmm1, xmm1, xmm10, 212
	vinsertps xmm1, xmm1, xmm8, 112
	vaddps xmm0, xmm0, xmm1
	vunpckhps xmm1, xmm12, xmm11
	vblendps xmm1, xmm10, xmm1, 3
	vinsertps xmm1, xmm1, xmm8, 176
	vaddps xmm0, xmm0, xmm1
	vshufps xmm1, xmm11, xmm12, 51
	vshufps xmm1, xmm1, xmm10, 242
	vblendps xmm1, xmm1, xmm8, 8
	vaddps xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm11, 1
	vextractf128 xmm2, ymm12, 1
	vunpcklps xmm4, xmm2, xmm1
	vextractf128 xmm5, ymm10, 1
	vmovlhps xmm4, xmm4, xmm5
	vextractf128 xmm8, ymm8, 1
	vinsertps xmm4, xmm4, xmm8, 48
	vaddps xmm0, xmm0, xmm4
	vinsertps xmm4, xmm1, xmm2, 76
	vshufps xmm4, xmm4, xmm5, 212
	vinsertps xmm4, xmm4, xmm8, 112
	vaddps xmm0, xmm0, xmm4
	vunpckhps xmm4, xmm2, xmm1
	vblendps xmm4, xmm5, xmm4, 3
	vinsertps xmm4, xmm4, xmm8, 176
	vaddps xmm0, xmm0, xmm4
	vshufps xmm1, xmm1, xmm2, 51
	vshufps xmm1, xmm1, xmm5, 242
	vblendps xmm1, xmm1, xmm8, 8
	vaddps xmm0, xmm0, xmm1
	vaddps xmm8, xmm0, xmmword ptr [rsp + 16]
	vmovshdup xmm0, xmm6
	vmovshdup xmm1, xmm7
	vaddps xmm0, xmm6, xmm0
	vaddps xmm1, xmm7, xmm1
	vinsertps xmm0, xmm1, xmm0, 28
	vshufpd xmm1, xmm7, xmm7, 1
	vinsertps xmm1, xmm1, xmm6, 156
	vaddps xmm0, xmm0, xmm1
	vshufpd xmm1, xmm6, xmm6, 1
	vinsertps xmm1, xmm1, xmm7, 204
	vaddps xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm6, 1
	vextractf128 xmm2, ymm7, 1
	vinsertps xmm4, xmm2, xmm1, 28
	vaddps xmm0, xmm0, xmm4
	vinsertps xmm4, xmm1, xmm2, 76
	vaddps xmm0, xmm0, xmm4
	vshufpd xmm4, xmm2, xmm2, 1
	vinsertps xmm4, xmm4, xmm1, 156
	vaddps xmm0, xmm0, xmm4
	vshufpd xmm1, xmm1, xmm1, 1
	vinsertps xmm1, xmm1, xmm2, 204
	vaddps xmm0, xmm0, xmm1
	vmovaps xmm1, xmmword ptr [rsp + 32]
	vinsertps xmm1, xmm1, dword ptr [rsp + 48], 16
	vaddps xmm4, xmm1, xmm0
	vmovshdup xmm0, xmm3
	vaddss xmm0, xmm3, xmm0
	vshufpd xmm1, xmm3, xmm3, 1
	vaddss xmm0, xmm0, xmm1
	vshufps xmm1, xmm3, xmm3, 255
	vaddss xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm3, 1
	vaddss xmm0, xmm0, xmm1
	vmovshdup xmm2, xmm1
	vaddss xmm0, xmm0, xmm2
	vshufpd xmm2, xmm1, xmm1, 1
	vaddss xmm0, xmm0, xmm2
	vshufps xmm1, xmm1, xmm1, 255
	vaddss xmm0, xmm0, xmm1
	vaddss xmm2, xmm0, dword ptr [rsp + 4]
.LBB1950_94:
	vmovaps xmmword ptr [rsp + 384], xmm8
	vmovlps qword ptr [rsp + 400], xmm4
	vmovss dword ptr [rsp + 408], xmm2
	lea rdi, [rsp + 144]
	mov rsi, qword ptr [rsp + 240]
	vmovaps xmm0, xmmword ptr [rsp + 432]
	vmovaps xmm1, xmmword ptr [rsp + 416]
	lea rdx, [rsp + 368]
	lea rcx, [rsp + 128]
	lea r8, [rsp + 384]
	vzeroupper
	call swarm::rules::finish
	mov rdx, qword ptr [rsp + 248]
	cmp rdx, qword ptr [rsp + 224]
	jae .LBB1950_96
	vmovss xmm0, dword ptr [rsp + 144]
	vmovss xmm1, dword ptr [rsp + 148]
	vmovss xmm2, dword ptr [rsp + 152]
	vmovss xmm3, dword ptr [rsp + 156]
	mov rax, qword ptr [rsp + 216]
	vmovss dword ptr [rax + 4*rdx], xmm0
	mov rax, qword ptr [rsp + 208]
	vmovss dword ptr [rax + 4*rdx], xmm1
	mov rax, qword ptr [rsp + 200]
	vmovss dword ptr [rax + 4*rdx], xmm2
	mov rax, qword ptr [rsp + 192]
	vmovss dword ptr [rax + 4*rdx], xmm3
	jmp .LBB1950_96
.LBB1950_98:
	add rsp, 552
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
