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
	sub rsp, 536
	.cfi_def_cfa_offset 592
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r14, rdi
	lea rax, [rdi + 316]
	mov qword ptr [rsp + 216], rax
	mov eax, dword ptr [rdi + 312]
	mov dword ptr [rsp + 344], eax
	mov rax, qword ptr [rdi + 304]
	mov qword ptr [rsp + 336], rax
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
	vmovaps xmmword ptr [rsp + 384], xmm2
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
	vmovaps xmmword ptr [rsp + 400], xmm6
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
	vmovddup xmm2, qword ptr [rip + .LCPI1950_9]
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
	mov qword ptr [rsp + 128], rax
	mov r13, r14
	mov qword ptr [rsp + 8], rsi
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
	mov rdi, qword ptr [rsp + 128]
	mov rsi, r15
	vmovss dword ptr [rsp + 64], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovss xmm0, dword ptr [rsp + 64]
	mov rsi, qword ptr [rsp + 8]
	jmp .LBB1950_8
.LBB1950_9:
	mov r13, qword ptr [rsi + 32]
	mov r12, qword ptr [rsi + 40]
	mov qword ptr [rsi + 136], 0
	xor r15d, r15d
	lea rax, [rsi + 120]
	mov qword ptr [rsp + 128], rax
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
	mov rdi, qword ptr [rsp + 128]
	mov rsi, r15
	vmovss dword ptr [rsp + 64], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovss xmm0, dword ptr [rsp + 64]
	mov rsi, qword ptr [rsp + 8]
	jmp .LBB1950_17
.LBB1950_18:
	mov r13, qword ptr [rsi + 56]
	mov r12, qword ptr [rsi + 64]
	mov qword ptr [rsi + 160], 0
	xor r15d, r15d
	lea rax, [rsi + 144]
	mov qword ptr [rsp + 128], rax
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
	mov rdi, qword ptr [rsp + 128]
	mov rsi, r15
	vmovss dword ptr [rsp + 64], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovss xmm0, dword ptr [rsp + 64]
	mov rsi, qword ptr [rsp + 8]
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
	vmovss dword ptr [rsp + 64], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovss xmm0, dword ptr [rsp + 64]
	mov rsi, qword ptr [rsp + 8]
	jmp .LBB1950_35
.LBB1950_36:
	vmovups ymm1, ymmword ptr [rsi + 96]
	mov rdx, qword ptr [rsi + 112]
	vmovdqu ymm0, ymmword ptr [rsi]
	mov rax, qword ptr [rsi + 8]
	mov qword ptr [rsp + 192], rax
	vmovups ymmword ptr [rsi], ymm1
	vmovdqu ymmword ptr [rsi + 96], ymm0
	vmovups ymm1, ymmword ptr [rsi + 128]
	vmovdqu ymm2, ymmword ptr [rsi + 32]
	mov rax, qword ptr [rsi + 32]
	mov qword ptr [rsp + 184], rax
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 176], rax
	vmovups ymmword ptr [rsi + 32], ymm1
	vmovdqu ymmword ptr [rsi + 128], ymm2
	mov rcx, qword ptr [rsi + 176]
	vmovdqu ymm1, ymmword ptr [rsi + 64]
	mov rax, qword ptr [rsi + 64]
	vmovups xmm3, xmmword ptr [rsi + 160]
	vmovups xmmword ptr [rsi + 64], xmm3
	mov rdi, qword ptr [rsi + 80]
	mov qword ptr [rsp + 168], rdi
	mov qword ptr [rsi + 80], rcx
	mov qword ptr [rsi + 88], r15
	vmovdqu ymmword ptr [rsi + 160], ymm1
	test rdx, rdx
	je .LBB1950_100
	vmovss xmm3, dword ptr [rsi + 316]
	vmovss xmm4, dword ptr [rsi + 320]
	vmulss xmm4, xmm4, xmm4
	vmulss xmm3, xmm3, xmm3
	vextracti128 xmm0, ymm0, 1
	vpextrq rcx, xmm2, 1
	vmovq rdi, xmm0
	cmp rcx, rdi
	cmovb rdi, rcx
	cmp rax, rdi
	cmovb rdi, rax
	vextracti128 xmm0, ymm1, 1
	vpextrq rax, xmm0, 1
	vmovaps xmmword ptr [rsp + 16], xmm3
	vbroadcastss ymm0, xmm3
	vmovaps xmmword ptr [rsp + 32], xmm4
	vbroadcastss ymm1, xmm4
	cmp rax, rdi
	cmovb rdi, rax
	mov qword ptr [rsp + 200], rdi
	xor edi, edi
	mov qword ptr [rsp + 208], rdx
	vmovups ymmword ptr [rsp + 496], ymm0
	vmovups ymmword ptr [rsp + 464], ymm1
	mov ebp, 4
	jmp .LBB1950_38
.LBB1950_98:
	mov rsi, qword ptr [rsp + 8]
	mov rdx, qword ptr [rsp + 208]
	.p2align	4
.LBB1950_99:
	inc rdi
	cmp rdi, rdx
	je .LBB1950_100
.LBB1950_38:
	mov rax, qword ptr [rsi + 16]
	mov qword ptr [rsp + 328], rax
	cmp rdi, rax
	jae .LBB1950_99
	mov rax, qword ptr [rsi + 40]
	mov qword ptr [rsp + 320], rax
	cmp rdi, rax
	jae .LBB1950_99
	mov rax, qword ptr [rsi + 64]
	mov rcx, qword ptr [rsi + 88]
	mov qword ptr [rsp + 312], rax
	cmp rdi, rax
	setb al
	mov qword ptr [rsp + 304], rcx
	cmp rdi, rcx
	setb cl
	and cl, al
	cmp cl, 1
	jne .LBB1950_99
	mov rax, qword ptr [rsi + 8]
	mov qword ptr [rsp + 296], rax
	vmovss xmm1, dword ptr [rax + 4*rdi]
	mov rax, qword ptr [rsi + 32]
	mov rcx, qword ptr [rsi + 56]
	mov qword ptr [rsp + 288], rax
	vmovss xmm0, dword ptr [rax + 4*rdi]
	mov rax, qword ptr [rsi + 80]
	mov qword ptr [rsp + 280], rcx
	vmovss xmm2, dword ptr [rcx + 4*rdi]
	mov qword ptr [rsp + 224], rdi
	mov qword ptr [rsp + 272], rax
	vmovss xmm3, dword ptr [rax + 4*rdi]
	vmovss dword ptr [rsp + 96], xmm1
	vmovss dword ptr [rsp + 100], xmm0
	vmovss dword ptr [rsp + 104], xmm2
	vmovss dword ptr [rsp + 108], xmm3
	vxorps xmm2, xmm2, xmm2
	vmovups xmmword ptr [rsp + 364], xmm2
	vmovaps xmmword ptr [rsp + 352], xmm2
	vmovss xmm2, dword ptr [rsi + 280]
	vmulss xmm3, xmm1, xmm2
	vxorps xmm7, xmm7, xmm7
	vmaxss xmm3, xmm3, xmm7
	vroundss xmm3, xmm3, xmm3, 9
	vcvtss2sd xmm4, xmm3, xmm3
	vcvttsd2si rax, xmm4
	mov rcx, rax
	sar rcx, 63
	vmovsd xmm6, qword ptr [rip + .LCPI1950_5]
	vsubsd xmm5, xmm4, xmm6
	vcvttsd2si r9, xmm5
	and r9, rcx
	or r9, rax
	vxorpd xmm8, xmm8, xmm8
	vucomisd xmm4, xmm8
	mov edi, 0
	cmovb r9, rdi
	vmovsd xmm5, qword ptr [rip + .LCPI1950_6]
	vucomisd xmm4, xmm5
	mov r8, -1
	cmova r9, r8
	mov rax, qword ptr [rsi + 264]
	mov qword ptr [rsp + 264], rax
	sub rax, 1
	cmovb rax, rdi
	cmp rax, r9
	cmovb r9, rax
	vmovss xmm9, dword ptr [rip + .LCPI1950_4]
	vucomiss xmm3, xmm9
	cmovae r9, rdi
	vmulss xmm2, xmm0, xmm2
	vmaxss xmm2, xmm2, xmm7
	vroundss xmm2, xmm2, xmm2, 9
	vcvtss2sd xmm3, xmm2, xmm2
	vcvttsd2si rcx, xmm3
	mov rdx, rcx
	sar rdx, 63
	vsubsd xmm4, xmm3, xmm6
	vcvttsd2si r10, xmm4
	and r10, rdx
	or r10, rcx
	vucomisd xmm3, xmm8
	cmovb r10, rdi
	vucomisd xmm3, xmm5
	cmova r10, r8
	mov rcx, qword ptr [rsi + 272]
	sub rcx, 1
	cmovb rcx, rdi
	cmp rcx, r10
	cmovb r10, rcx
	vucomiss xmm2, xmm9
	cmovae r10, rdi
	mov rdx, r9
	sub rdx, 1
	cmovb rdx, rdi
	mov qword ptr [rsp + 248], rdx
	mov r14, r10
	sub r14, 1
	cmovb r14, rdi
	inc r10
	cmp rcx, r10
	cmovb r10, rcx
	mov qword ptr [rsp + 256], r10
	cmp r14, r10
	ja .LBB1950_96
	inc r9
	cmp rax, r9
	cmovb r9, rax
	inc r9
	mov qword ptr [rsp + 240], r9
	mov rax, qword ptr [rsp + 8]
	mov rcx, qword ptr [rax + 200]
	mov qword ptr [rsp + 232], rcx
	mov rdi, qword ptr [rax + 208]
	vbroadcastss ymm2, xmm0
	vbroadcastss ymm15, xmm1
	vinsertps xmm4, xmm15, xmm2, 16
	vxorps xmm3, xmm3, xmm3
	vxorpd xmm5, xmm5, xmm5
	vxorps xmm10, xmm10, xmm10
	mov qword ptr [rsp + 56], rdi
	vmovaps xmmword ptr [rsp + 416], xmm4
	vmovups ymmword ptr [rsp + 128], ymm2
	jmp .LBB1950_45
	.p2align	4
.LBB1950_55:
	mov rdi, qword ptr [rsp + 56]
.LBB1950_44:
	cmp r14, qword ptr [rsp + 256]
	lea r14, [r14 + 1]
	je .LBB1950_95
.LBB1950_45:
	mov rcx, qword ptr [rsp + 264]
	imul rcx, r14
	mov rax, qword ptr [rsp + 248]
	lea rsi, [rcx + rax]
	cmp rsi, rdi
	jae .LBB1950_46
	add rcx, qword ptr [rsp + 240]
	mov edx, 0
	mov eax, 0
	cmp rcx, rdi
	jae .LBB1950_49
	mov rdx, qword ptr [rsp + 232]
	mov eax, dword ptr [rdx + 4*rsi]
	mov edx, dword ptr [rdx + 4*rcx]
	jmp .LBB1950_49
	.p2align	4
.LBB1950_46:
	xor edx, edx
	xor eax, eax
.LBB1950_49:
	mov r9, rdx
	sub r9, rax
	setb r10b
	cmp rdx, qword ptr [rsp + 328]
	seta cl
	or cl, r10b
	mov rcx, qword ptr [rsp + 296]
	lea r15, [rcx + 4*rax]
	mov r11, r9
	mov r8d, 0
	cmovne r11, r8
	cmovne r15, rbp
	cmp rdx, qword ptr [rsp + 320]
	seta cl
	or cl, r10b
	mov rcx, qword ptr [rsp + 288]
	lea rcx, [rcx + 4*rax]
	mov r12, r9
	cmovne r12, r8
	cmovne rcx, rbp
	mov rbx, r12
	shr rbx, 3
	cmp rdx, qword ptr [rsp + 312]
	seta sil
	or sil, r10b
	mov rsi, qword ptr [rsp + 280]
	lea rsi, [rsi + 4*rax]
	mov r13, r9
	cmovne r13, r8
	cmovne rsi, rbp
	mov rdi, r13
	shr rdi, 3
	cmp rdx, qword ptr [rsp + 304]
	seta dl
	or dl, r10b
	cmovne r9, r8
	mov rdx, qword ptr [rsp + 272]
	lea rax, [rdx + 4*rax]
	cmovne rax, rbp
	mov r10, r9
	shr r10, 3
	mov rdx, r11
	shr rdx, 3
	cmp rbx, rdx
	cmovb rdx, rbx
	cmp rdi, rdx
	cmovb rdx, rdi
	cmp r10, rdx
	cmovb rdx, r10
	test rdx, rdx
	je .LBB1950_50
	vmovaps xmmword ptr [rsp + 432], xmm10
	vmovss dword ptr [rsp + 52], xmm5
	vmovaps xmmword ptr [rsp + 448], xmm3
	shl rdx, 5
	vxorpd xmm6, xmm6, xmm6
	xor r10d, r10d
	vxorps xmm7, xmm7, xmm7
	vxorpd xmm8, xmm8, xmm8
	vxorps xmm10, xmm10, xmm10
	vxorpd xmm5, xmm5, xmm5
	vxorps xmm11, xmm11, xmm11
	vxorps xmm12, xmm12, xmm12
	.p2align	4
.LBB1950_52:
	vmovupd ymmword ptr [rsp + 64], ymm5
	vmovups ymm13, ymmword ptr [r15 + r10]
	vmovups ymm14, ymmword ptr [rcx + r10]
	vmovaps ymm2, ymm15
	vsubps ymm15, ymm15, ymm13
	vmovups ymm0, ymmword ptr [rsp + 128]
	vsubps ymm3, ymm0, ymm14
	vmulps ymm4, ymm15, ymm15
	vmulps ymm5, ymm3, ymm3
	vaddps ymm4, ymm4, ymm5
	vmovups ymm0, ymmword ptr [rsp + 464]
	vcmpltps ymm5, ymm4, ymm0
	vcmpleps ymm1, ymm0, ymm4
	vcmpltps ymm0, ymm4, ymmword ptr [rsp + 496]
	vandps ymm0, ymm1, ymm0
	vbroadcastss ymm1, dword ptr [rip + .LCPI1950_3]
	vandps ymm5, ymm5, ymm1
	vmovapd ymm9, ymm8
	vmovaps ymm8, ymm7
	vmovapd ymm7, ymm6
	vxorpd xmm6, xmm6, xmm6
	vcmpltps ymm4, ymm6, ymm4
	vmovapd ymm6, ymm7
	vandps ymm1, ymm4, ymm1
	vandps ymm0, ymm1, ymm0
	vmulps ymm1, ymm15, ymm5
	vmovaps ymm15, ymm2
	vaddps ymm7, ymm8, ymm1
	vmulps ymm1, ymm3, ymm5
	vmovups ymm5, ymmword ptr [rsp + 64]
	vaddps ymm6, ymm6, ymm1
	vmulps ymm1, ymm13, ymm0
	vaddps ymm12, ymm12, ymm1
	vmulps ymm1, ymm14, ymm0
	vmulps ymm3, ymm0, ymmword ptr [rsi + r10]
	vaddps ymm11, ymm11, ymm1
	vaddps ymm5, ymm3, ymm5
	vmulps ymm1, ymm0, ymmword ptr [rax + r10]
	vaddps ymm10, ymm10, ymm1
	vaddps ymm8, ymm9, ymm0
	add r10, 32
	cmp rdx, r10
	jne .LBB1950_52
	vunpcklps xmm0, xmm12, xmm11
	vmovlhps xmm0, xmm0, xmm5
	vinsertps xmm0, xmm0, xmm10, 48
	vinsertps xmm1, xmm11, xmm12, 76
	vshufps xmm1, xmm1, xmm5, 212
	vinsertps xmm1, xmm1, xmm10, 112
	vaddps xmm0, xmm0, xmm1
	vunpckhps xmm1, xmm12, xmm11
	vblendps xmm1, xmm5, xmm1, 3
	vinsertps xmm1, xmm1, xmm10, 176
	vaddps xmm0, xmm0, xmm1
	vshufps xmm1, xmm11, xmm12, 51
	vshufps xmm1, xmm1, xmm5, 242
	vblendps xmm1, xmm1, xmm10, 8
	vaddps xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm11, 1
	vextractf128 xmm3, ymm12, 1
	vunpcklps xmm4, xmm3, xmm1
	vextractf128 xmm5, ymm5, 1
	vmovlhps xmm4, xmm4, xmm5
	vextractf128 xmm9, ymm10, 1
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
	vaddps xmm9, xmm0, xmm1
	vextractf128 xmm0, ymm8, 1
	vmovshdup xmm1, xmm8
	vaddss xmm1, xmm8, xmm1
	vshufpd xmm3, xmm8, xmm8, 1
	vaddss xmm1, xmm1, xmm3
	vshufps xmm3, xmm8, xmm8, 255
	vaddss xmm1, xmm1, xmm3
	vaddss xmm1, xmm1, xmm0
	vmovshdup xmm3, xmm0
	vaddss xmm1, xmm1, xmm3
	vshufpd xmm3, xmm0, xmm0, 1
	vaddss xmm1, xmm1, xmm3
	vshufps xmm0, xmm0, xmm0, 255
	vhaddps xmm3, xmm7, xmm6
	vaddss xmm8, xmm1, xmm0
	vshufps xmm0, xmm3, xmm3, 232
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
	vaddps xmm6, xmm0, xmm1
	vmovaps xmm3, xmmword ptr [rsp + 448]
	vmovaps xmm4, xmmword ptr [rsp + 416]
	vmovss xmm5, dword ptr [rsp + 52]
	vmovaps xmm10, xmmword ptr [rsp + 432]
	jmp .LBB1950_54
	.p2align	4
.LBB1950_50:
	vxorps xmm9, xmm9, xmm9
	vxorpd xmm8, xmm8, xmm8
	vxorpd xmm6, xmm6, xmm6
.LBB1950_54:
	vaddps xmm3, xmm3, xmm6
	vaddss xmm5, xmm8, xmm5
	mov edi, r12d
	and edi, 7
	mov r10d, r13d
	and r10d, 7
	mov ebx, r9d
	and ebx, 7
	mov edx, r11d
	and edx, 7
	cmp rdi, rdx
	cmovb rdx, rdi
	vaddps xmm10, xmm10, xmm9
	cmp r10, rdx
	cmovb rdx, r10
	cmp rbx, rdx
	cmovb rdx, rbx
	test rdx, rdx
	je .LBB1950_55
	and r11d, -8
	and r12d, -8
	and r13d, -8
	and r9d, -8
	vmovss xmm0, dword ptr [r15 + 4*r11]
	vmovss xmm1, dword ptr [rcx + 4*r12]
	vinsertps xmm6, xmm0, xmm1, 16
	vsubps xmm7, xmm4, xmm6
	vmulps xmm0, xmm7, xmm7
	vmovshdup xmm1, xmm0
	vaddss xmm8, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 32]
	vucomiss xmm0, xmm8
	mov rdi, qword ptr [rsp + 56]
	jbe .LBB1950_57
	vaddps xmm3, xmm3, xmm7
	jmp .LBB1950_60
	.p2align	4
.LBB1950_57:
	vmovaps xmm0, xmmword ptr [rsp + 16]
	vucomiss xmm0, xmm8
	jbe .LBB1950_60
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm8, xmm0
	jbe .LBB1950_60
	vmovss xmm0, dword ptr [rsi + 4*r13]
	vmovss xmm1, dword ptr [rax + 4*r9]
	vinsertps xmm0, xmm6, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm10, xmm10, xmm0
	vaddss xmm5, xmm5, dword ptr [rip + .LCPI1950_3]
.LBB1950_60:
	cmp edx, 1
	je .LBB1950_44
	vmovss xmm0, dword ptr [r15 + 4*r11 + 4]
	vmovss xmm1, dword ptr [rcx + 4*r12 + 4]
	vinsertps xmm6, xmm0, xmm1, 16
	vsubps xmm7, xmm4, xmm6
	vmulps xmm0, xmm7, xmm7
	vmovshdup xmm1, xmm0
	vaddss xmm8, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 32]
	vucomiss xmm0, xmm8
	jbe .LBB1950_62
	vaddps xmm3, xmm3, xmm7
	jmp .LBB1950_66
.LBB1950_62:
	vmovaps xmm0, xmmword ptr [rsp + 16]
	vucomiss xmm0, xmm8
	jbe .LBB1950_66
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm8, xmm0
	jbe .LBB1950_66
	vmovss xmm0, dword ptr [rsi + 4*r13 + 4]
	vmovss xmm1, dword ptr [rax + 4*r9 + 4]
	vinsertps xmm0, xmm6, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm10, xmm10, xmm0
	vaddss xmm5, xmm5, dword ptr [rip + .LCPI1950_3]
.LBB1950_66:
	cmp edx, 2
	je .LBB1950_44
	vmovss xmm0, dword ptr [r15 + 4*r11 + 8]
	vmovss xmm1, dword ptr [rcx + 4*r12 + 8]
	vinsertps xmm6, xmm0, xmm1, 16
	vsubps xmm7, xmm4, xmm6
	vmulps xmm0, xmm7, xmm7
	vmovshdup xmm1, xmm0
	vaddss xmm8, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 32]
	vucomiss xmm0, xmm8
	jbe .LBB1950_68
	vaddps xmm3, xmm3, xmm7
	jmp .LBB1950_72
.LBB1950_68:
	vmovaps xmm0, xmmword ptr [rsp + 16]
	vucomiss xmm0, xmm8
	jbe .LBB1950_72
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm8, xmm0
	jbe .LBB1950_72
	vmovss xmm0, dword ptr [rsi + 4*r13 + 8]
	vmovss xmm1, dword ptr [rax + 4*r9 + 8]
	vinsertps xmm0, xmm6, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm10, xmm10, xmm0
	vaddss xmm5, xmm5, dword ptr [rip + .LCPI1950_3]
.LBB1950_72:
	cmp edx, 3
	je .LBB1950_44
	vmovss xmm0, dword ptr [r15 + 4*r11 + 12]
	vmovss xmm1, dword ptr [rcx + 4*r12 + 12]
	vinsertps xmm6, xmm0, xmm1, 16
	vsubps xmm7, xmm4, xmm6
	vmulps xmm0, xmm7, xmm7
	vmovshdup xmm1, xmm0
	vaddss xmm8, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 32]
	vucomiss xmm0, xmm8
	jbe .LBB1950_74
	vaddps xmm3, xmm3, xmm7
	jmp .LBB1950_78
.LBB1950_74:
	vmovaps xmm0, xmmword ptr [rsp + 16]
	vucomiss xmm0, xmm8
	jbe .LBB1950_78
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm8, xmm0
	jbe .LBB1950_78
	vmovss xmm0, dword ptr [rsi + 4*r13 + 12]
	vmovss xmm1, dword ptr [rax + 4*r9 + 12]
	vinsertps xmm0, xmm6, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm10, xmm10, xmm0
	vaddss xmm5, xmm5, dword ptr [rip + .LCPI1950_3]
.LBB1950_78:
	cmp edx, 4
	je .LBB1950_44
	vmovss xmm0, dword ptr [r15 + 4*r11 + 16]
	vmovss xmm1, dword ptr [rcx + 4*r12 + 16]
	vinsertps xmm6, xmm0, xmm1, 16
	vsubps xmm7, xmm4, xmm6
	vmulps xmm0, xmm7, xmm7
	vmovshdup xmm1, xmm0
	vaddss xmm8, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 32]
	vucomiss xmm0, xmm8
	jbe .LBB1950_80
	vaddps xmm3, xmm3, xmm7
	jmp .LBB1950_84
.LBB1950_80:
	vmovaps xmm0, xmmword ptr [rsp + 16]
	vucomiss xmm0, xmm8
	jbe .LBB1950_84
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm8, xmm0
	jbe .LBB1950_84
	vmovss xmm0, dword ptr [rsi + 4*r13 + 16]
	vmovss xmm1, dword ptr [rax + 4*r9 + 16]
	vinsertps xmm0, xmm6, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm10, xmm10, xmm0
	vaddss xmm5, xmm5, dword ptr [rip + .LCPI1950_3]
.LBB1950_84:
	cmp edx, 5
	je .LBB1950_44
	vmovss xmm0, dword ptr [r15 + 4*r11 + 20]
	vmovss xmm1, dword ptr [rcx + 4*r12 + 20]
	vinsertps xmm6, xmm0, xmm1, 16
	vsubps xmm7, xmm4, xmm6
	vmulps xmm0, xmm7, xmm7
	vmovshdup xmm1, xmm0
	vaddss xmm8, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 32]
	vucomiss xmm0, xmm8
	jbe .LBB1950_86
	vaddps xmm3, xmm3, xmm7
	jmp .LBB1950_90
.LBB1950_86:
	vmovaps xmm0, xmmword ptr [rsp + 16]
	vucomiss xmm0, xmm8
	jbe .LBB1950_90
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm8, xmm0
	jbe .LBB1950_90
	vmovss xmm0, dword ptr [rsi + 4*r13 + 20]
	vmovss xmm1, dword ptr [rax + 4*r9 + 20]
	vinsertps xmm0, xmm6, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm10, xmm10, xmm0
	vaddss xmm5, xmm5, dword ptr [rip + .LCPI1950_3]
.LBB1950_90:
	cmp edx, 6
	je .LBB1950_44
	vmovss xmm0, dword ptr [r15 + 4*r11 + 24]
	vmovss xmm1, dword ptr [rcx + 4*r12 + 24]
	vinsertps xmm6, xmm0, xmm1, 16
	vsubps xmm7, xmm4, xmm6
	vmulps xmm0, xmm7, xmm7
	vmovshdup xmm1, xmm0
	vaddss xmm8, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 32]
	vucomiss xmm0, xmm8
	jbe .LBB1950_92
	vaddps xmm3, xmm3, xmm7
	jmp .LBB1950_44
.LBB1950_92:
	vmovaps xmm0, xmmword ptr [rsp + 16]
	vucomiss xmm0, xmm8
	jbe .LBB1950_44
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm8, xmm0
	jbe .LBB1950_44
	vmovss xmm0, dword ptr [rsi + 4*r13 + 24]
	vmovss xmm1, dword ptr [rax + 4*r9 + 24]
	vinsertps xmm0, xmm6, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm10, xmm10, xmm0
	vaddss xmm5, xmm5, dword ptr [rip + .LCPI1950_3]
	jmp .LBB1950_44
.LBB1950_95:
	vmovaps xmmword ptr [rsp + 352], xmm10
	vmovss dword ptr [rsp + 368], xmm5
	vmovlps qword ptr [rsp + 372], xmm3
.LBB1950_96:
	lea rdi, [rsp + 112]
	mov rsi, qword ptr [rsp + 216]
	vmovaps xmm0, xmmword ptr [rsp + 400]
	vmovaps xmm1, xmmword ptr [rsp + 384]
	lea rdx, [rsp + 336]
	lea rcx, [rsp + 96]
	lea r8, [rsp + 352]
	vzeroupper
	call swarm::rules::finish
	mov rdi, qword ptr [rsp + 224]
	cmp rdi, qword ptr [rsp + 200]
	jae .LBB1950_98
	vmovss xmm0, dword ptr [rsp + 112]
	vmovss xmm1, dword ptr [rsp + 116]
	vmovss xmm2, dword ptr [rsp + 120]
	vmovss xmm3, dword ptr [rsp + 124]
	mov rax, qword ptr [rsp + 192]
	vmovss dword ptr [rax + 4*rdi], xmm0
	mov rax, qword ptr [rsp + 184]
	vmovss dword ptr [rax + 4*rdi], xmm1
	mov rax, qword ptr [rsp + 176]
	vmovss dword ptr [rax + 4*rdi], xmm2
	mov rax, qword ptr [rsp + 168]
	vmovss dword ptr [rax + 4*rdi], xmm3
	jmp .LBB1950_98
.LBB1950_100:
	add rsp, 536
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
