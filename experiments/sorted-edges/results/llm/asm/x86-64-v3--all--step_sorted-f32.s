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
	mov qword ptr [rsp + 352], rax
	mov eax, dword ptr [rdi + 312]
	mov dword ptr [rsp + 424], eax
	mov rax, qword ptr [rdi + 304]
	mov qword ptr [rsp + 416], rax
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
	vmovaps xmmword ptr [rsp + 464], xmm6
	vblendvps xmm1, xmm3, xmm6, xmm1
	vmovshdup xmm3, xmm5
	vmovaps xmmword ptr [rsp + 528], xmm3
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
	vmovaps xmmword ptr [rsp + 544], xmm5
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
	mov qword ptr [rsp + 272], rax
	mov r13, r14
	mov qword ptr [rsp + 16], rcx
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
	mov rdi, qword ptr [rsp + 272]
	mov rsi, r15
	vmovss dword ptr [rsp + 80], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovss xmm0, dword ptr [rsp + 80]
	mov rcx, qword ptr [rsp + 16]
	jmp .LBB1950_1
.LBB1950_8:
	mov r13, qword ptr [rcx + 32]
	mov r12, qword ptr [rcx + 40]
	mov qword ptr [rcx + 136], 0
	xor r15d, r15d
	lea rax, [rcx + 120]
	mov qword ptr [rsp + 272], rax
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
	mov rdi, qword ptr [rsp + 272]
	mov rsi, r15
	vmovss dword ptr [rsp + 80], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovss xmm0, dword ptr [rsp + 80]
	mov rcx, qword ptr [rsp + 16]
	jmp .LBB1950_9
.LBB1950_16:
	mov r13, qword ptr [rcx + 56]
	mov r12, qword ptr [rcx + 64]
	mov qword ptr [rcx + 160], 0
	xor r15d, r15d
	lea rax, [rcx + 144]
	mov qword ptr [rsp + 272], rax
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
	mov rdi, qword ptr [rsp + 272]
	mov rsi, r15
	vmovss dword ptr [rsp + 80], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovss xmm0, dword ptr [rsp + 80]
	mov rcx, qword ptr [rsp + 16]
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
	vmovss dword ptr [rsp + 80], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovss xmm0, dword ptr [rsp + 80]
	mov rcx, qword ptr [rsp + 16]
	jmp .LBB1950_25
.LBB1950_32:
	vmovups ymm0, ymmword ptr [rcx + 96]
	mov rsi, qword ptr [rcx + 112]
	vmovdqu ymm1, ymmword ptr [rcx]
	mov rax, qword ptr [rcx + 8]
	mov qword ptr [rsp + 328], rax
	vmovups ymmword ptr [rcx], ymm0
	vmovdqu ymmword ptr [rcx + 96], ymm1
	vmovups ymm0, ymmword ptr [rcx + 128]
	vmovdqu ymm2, ymmword ptr [rcx + 32]
	mov rax, qword ptr [rcx + 32]
	mov qword ptr [rsp + 320], rax
	mov rax, qword ptr [rcx + 56]
	mov qword ptr [rsp + 312], rax
	vmovups ymmword ptr [rcx + 32], ymm0
	vmovdqu ymmword ptr [rcx + 128], ymm2
	mov rax, qword ptr [rsp + 16]
	mov rcx, qword ptr [rax + 176]
	mov rax, qword ptr [rsp + 16]
	vmovdqu ymm0, ymmword ptr [rax + 64]
	mov rax, qword ptr [rsp + 16]
	mov rax, qword ptr [rax + 64]
	mov rdx, qword ptr [rsp + 16]
	vmovups xmm3, xmmword ptr [rdx + 160]
	mov rdx, qword ptr [rsp + 16]
	vmovups xmmword ptr [rdx + 64], xmm3
	mov rdx, qword ptr [rsp + 16]
	mov rdx, qword ptr [rdx + 80]
	mov qword ptr [rsp + 304], rdx
	mov rdx, qword ptr [rsp + 16]
	mov qword ptr [rdx + 80], rcx
	mov rcx, qword ptr [rsp + 16]
	mov qword ptr [rcx + 88], r15
	vmovdqu ymmword ptr [rcx + 160], ymm0
	test rsi, rsi
	je .LBB1950_102
	vmovss xmm3, dword ptr [rcx + 320]
	vextracti128 xmm1, ymm1, 1
	vpextrq rcx, xmm2, 1
	vmovq rdx, xmm1
	cmp rcx, rdx
	cmovb rdx, rcx
	mov rcx, qword ptr [rsp + 16]
	vmulss xmm1, xmm3, xmm3
	cmp rax, rdx
	cmovb rdx, rax
	vmovaps xmm2, xmmword ptr [rsp + 464]
	vmulss xmm2, xmm2, xmm2
	vextracti128 xmm0, ymm0, 1
	vpextrq rax, xmm0, 1
	vmovaps xmmword ptr [rsp + 112], xmm2
	vbroadcastss ymm0, xmm2
	cmp rax, rdx
	cmovb rdx, rax
	mov qword ptr [rsp + 336], rdx
	vmovaps xmmword ptr [rsp + 128], xmm1
	vbroadcastss ymm1, xmm1
	xor edi, edi
	mov qword ptr [rsp + 344], rsi
	vmovups ymmword ptr [rsp + 464], ymm0
	vmovups ymmword ptr [rsp + 560], ymm1
	jmp .LBB1950_36
.LBB1950_34:
	mov rcx, qword ptr [rsp + 16]
	mov rsi, qword ptr [rsp + 344]
	.p2align	4
.LBB1950_35:
	inc rdi
	cmp rdi, rsi
	je .LBB1950_102
.LBB1950_36:
	mov rbp, qword ptr [rcx + 16]
	cmp rdi, rbp
	jae .LBB1950_35
	mov rax, qword ptr [rcx + 40]
	mov qword ptr [rsp + 192], rax
	cmp rdi, rax
	jae .LBB1950_35
	mov rax, qword ptr [rcx + 64]
	mov rdx, qword ptr [rcx + 88]
	mov qword ptr [rsp + 184], rax
	cmp rdi, rax
	setb cl
	mov qword ptr [rsp + 176], rdx
	cmp rdi, rdx
	setb dl
	and dl, cl
	mov rcx, qword ptr [rsp + 16]
	cmp dl, 1
	jne .LBB1950_35
	mov rax, qword ptr [rcx + 8]
	mov qword ptr [rsp + 224], rax
	vmovss xmm9, dword ptr [rax + 4*rdi]
	mov rax, qword ptr [rcx + 32]
	mov rdx, qword ptr [rcx + 56]
	mov qword ptr [rsp + 216], rax
	vmovss xmm10, dword ptr [rax + 4*rdi]
	mov rax, qword ptr [rcx + 80]
	mov qword ptr [rsp + 208], rdx
	vmovss xmm2, dword ptr [rdx + 4*rdi]
	mov qword ptr [rsp + 360], rdi
	mov qword ptr [rsp + 200], rax
	vmovss xmm3, dword ptr [rax + 4*rdi]
	vmovss dword ptr [rsp + 240], xmm9
	vmovss dword ptr [rsp + 244], xmm10
	vmovss dword ptr [rsp + 248], xmm2
	vmovss dword ptr [rsp + 252], xmm3
	vmovss xmm3, dword ptr [rcx + 280]
	vmulss xmm4, xmm9, xmm3
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
	mov qword ptr [rsp + 408], rcx
	sub rcx, 1
	cmovb rcx, rdi
	cmp rcx, r9
	cmovb r9, rcx
	vmovss xmm7, dword ptr [rip + .LCPI1950_4]
	vucomiss xmm4, xmm7
	cmovae r9, rdi
	vmulss xmm3, xmm10, xmm3
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
	mov qword ptr [rsp + 392], rax
	mov r14, r10
	sub r14, 1
	cmovb r14, rdi
	inc r10
	cmp rdx, r10
	cmovb r10, rdx
	vxorps xmm8, xmm8, xmm8
	vxorps xmm4, xmm4, xmm4
	mov qword ptr [rsp + 400], r10
	cmp r14, r10
	ja .LBB1950_100
	inc r9
	cmp rcx, r9
	cmovb r9, rcx
	mov rax, qword ptr [rsp + 184]
	mov rcx, qword ptr [rsp + 176]
	cmp rax, rcx
	cmovb rcx, rax
	inc r9
	mov qword ptr [rsp + 384], r9
	mov rax, qword ptr [rsp + 192]
	cmp rax, rcx
	cmovb rcx, rax
	mov qword ptr [rsp + 368], rcx
	mov rax, qword ptr [rsp + 16]
	mov rcx, qword ptr [rax + 200]
	mov qword ptr [rsp + 376], rcx
	mov rdi, qword ptr [rax + 208]
	vmovaps xmmword ptr [rsp + 144], xmm10
	vbroadcastss ymm14, xmm10
	vmovaps xmmword ptr [rsp + 160], xmm9
	vbroadcastss ymm8, xmm9
	vxorps xmm0, xmm0, xmm0
	vmovaps xmmword ptr [rsp + 32], xmm0
	vxorps xmm0, xmm0, xmm0
	vmovss dword ptr [rsp + 12], xmm0
	vxorps xmm13, xmm13, xmm13
	vxorpd xmm6, xmm6, xmm6
	vxorps xmm7, xmm7, xmm7
	vxorps xmm9, xmm9, xmm9
	vxorps xmm10, xmm10, xmm10
	vxorps xmm11, xmm11, xmm11
	vxorps xmm12, xmm12, xmm12
	vmovaps xmmword ptr [rsp + 64], xmm0
	vmovaps xmmword ptr [rsp + 48], xmm0
	mov qword ptr [rsp + 24], rdi
	vmovups ymmword ptr [rsp + 272], ymm14
	vmovups ymmword ptr [rsp + 80], ymm8
	jmp .LBB1950_45
	.p2align	4
.LBB1950_55:
	mov rax, r15
	sub rax, rdx
	vmovq xmm0, rax
	vpbroadcastq ymm0, xmm0
	add r8, rdx
	sub r15, r8
	vmovq xmm1, r15
	vpbroadcastq ymm1, xmm1
	mov rax, qword ptr [rsp + 224]
	vmovups ymm2, ymmword ptr [rax + 4*rdx]
	vmovups ymmword ptr [rsp + 432], ymm2
	mov rax, qword ptr [rsp + 216]
	vmovups ymm5, ymmword ptr [rax + 4*rdx]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI1950_8]
	vpxor ymm1, ymm1, ymm2
	vmovdqa ymm3, ymmword ptr [rip + .LCPI1950_9]
	vpcmpgtq ymm4, ymm1, ymm3
	vmovdqa ymm14, ymmword ptr [rip + .LCPI1950_10]
	vpcmpgtq ymm1, ymm1, ymm14
	vpackssdw ymm8, ymm1, ymm4
	vmovups ymmword ptr [rsp + 592], ymm13
	vpcmpeqd ymm13, ymm13, ymm13
	vpxor ymm8, ymm8, ymm13
	vextracti128 xmm13, ymm8, 1
	vpackssdw xmm8, xmm8, xmm13
	vpxor ymm0, ymm0, ymm2
	vpcmpgtq ymm2, ymm0, ymm3
	vpcmpgtq ymm0, ymm0, ymm14
	vmovups ymm14, ymmword ptr [rsp + 272]
	vpackssdw ymm13, ymm0, ymm2
	vextracti128 xmm15, ymm13, 1
	vpackssdw xmm13, xmm13, xmm15
	vpand xmm8, xmm8, xmm13
	vpshufd xmm8, xmm8, 216
	vpandn ymm2, ymm4, ymm2
	vpandn ymm0, ymm1, ymm0
	vpackssdw ymm0, ymm0, ymm2
	vpermq ymm0, ymm0, 216
	vmovups ymm1, ymmword ptr [rsp + 80]
	vsubps ymm1, ymm1, ymmword ptr [rsp + 432]
	vsubps ymm2, ymm14, ymm5
	vmulps ymm4, ymm1, ymm1
	vmulps ymm13, ymm2, ymm2
	vaddps ymm4, ymm13, ymm4
	vmovups ymm3, ymmword ptr [rsp + 560]
	vcmpleps ymm13, ymm3, ymm4
	vcmpltps ymm15, ymm4, ymmword ptr [rsp + 464]
	vandps ymm13, ymm13, ymm15
	vextractf128 xmm15, ymm13, 1
	vpackssdw xmm13, xmm13, xmm15
	vcmpltps ymm15, ymm4, ymm3
	vpand xmm8, xmm8, xmm13
	vbroadcastss ymm13, dword ptr [rip + .LCPI1950_3]
	vandps ymm15, ymm15, ymm13
	vxorps xmm3, xmm3, xmm3
	vblendvps ymm0, ymm3, ymm15, ymm0
	vcmpltps ymm4, ymm3, ymm4
	vandps ymm4, ymm13, ymm4
	vmovups ymm13, ymmword ptr [rsp + 592]
	vpmovzxwd ymm8, xmm8
	vpslld ymm8, ymm8, 31
	vpsrad ymm8, ymm8, 31
	vandps ymm4, ymm8, ymm4
	vmovups ymm8, ymmword ptr [rsp + 80]
	vmulps ymm1, ymm1, ymm0
	vaddps ymm6, ymm1, ymm6
	vmulps ymm0, ymm2, ymm0
	vaddps ymm13, ymm13, ymm0
	vmulps ymm0, ymm4, ymmword ptr [rsp + 432]
	vaddps ymm12, ymm12, ymm0
	vmulps ymm0, ymm5, ymm4
	vaddps ymm11, ymm11, ymm0
	mov rax, qword ptr [rsp + 208]
	vmulps ymm0, ymm4, ymmword ptr [rax + 4*rdx]
	vaddps ymm10, ymm10, ymm0
	mov rax, qword ptr [rsp + 200]
	vmulps ymm0, ymm4, ymmword ptr [rax + 4*rdx]
	vaddps ymm9, ymm9, ymm0
	vaddps ymm7, ymm4, ymm7
	mov rax, qword ptr [rsp + 232]
.LBB1950_59:
	mov rdi, qword ptr [rsp + 24]
.LBB1950_44:
	cmp rax, qword ptr [rsp + 400]
	lea r14, [rax + 1]
	je .LBB1950_99
.LBB1950_45:
	mov rcx, qword ptr [rsp + 408]
	imul rcx, r14
	mov rax, qword ptr [rsp + 392]
	lea rsi, [rcx + rax]
	cmp rsi, rdi
	mov qword ptr [rsp + 232], r14
	jae .LBB1950_48
	add rcx, qword ptr [rsp + 384]
	mov r15d, 0
	mov edx, 0
	cmp rcx, rdi
	jae .LBB1950_49
	mov rax, qword ptr [rsp + 376]
	mov edx, dword ptr [rax + 4*rsi]
	mov r15d, dword ptr [rax + 4*rcx]
	jmp .LBB1950_49
	.p2align	4
.LBB1950_48:
	xor r15d, r15d
	xor edx, edx
.LBB1950_49:
	mov r11, r15
	sub r11, rdx
	setb r8b
	mov r14, rbp
	cmp r15, rbp
	seta cl
	or cl, r8b
	mov rax, qword ptr [rsp + 224]
	lea rdi, [rax + 4*rdx]
	mov rsi, r11
	mov ebp, 0
	cmovne rsi, rbp
	mov eax, 4
	cmovne rdi, rax
	cmp r15, qword ptr [rsp + 192]
	seta cl
	or cl, r8b
	mov rcx, qword ptr [rsp + 216]
	lea rcx, [rcx + 4*rdx]
	mov r12, r11
	cmovne r12, rbp
	cmovne rcx, rax
	mov rbx, r12
	shr rbx, 3
	cmp r15, qword ptr [rsp + 184]
	seta r9b
	or r9b, r8b
	mov r9, qword ptr [rsp + 208]
	lea r9, [r9 + 4*rdx]
	mov r10, r11
	cmovne r10, rbp
	cmovne r9, rax
	mov qword ptr [rsp + 432], r10
	shr r10, 3
	cmp r15, qword ptr [rsp + 176]
	seta r13b
	or r13b, r8b
	cmovne r11, rbp
	mov r8, qword ptr [rsp + 200]
	lea r13, [r8 + 4*rdx]
	cmovne r13, rax
	mov r8, r11
	shr r8, 3
	mov rdx, rsi
	shr rdx, 3
	cmp rbx, rdx
	cmovb rdx, rbx
	cmp r10, rdx
	cmovb rdx, r10
	cmp r8, rdx
	cmovb rdx, r8
	test rdx, rdx
	je .LBB1950_52
	shl rdx, 5
	xor r8d, r8d
	.p2align	4
.LBB1950_51:
	vmovups ymm2, ymmword ptr [rdi + r8]
	vmovups ymm4, ymmword ptr [rcx + r8]
	vsubps ymm5, ymm8, ymm2
	vsubps ymm8, ymm14, ymm4
	vmulps ymm15, ymm5, ymm5
	vmulps ymm0, ymm8, ymm8
	vaddps ymm0, ymm15, ymm0
	vmovups ymm1, ymmword ptr [rsp + 560]
	vcmpltps ymm15, ymm0, ymm1
	vcmpleps ymm1, ymm1, ymm0
	vmovaps ymm14, ymm12
	vmovaps ymm12, ymm11
	vmovaps ymm11, ymm10
	vmovaps ymm10, ymm9
	vmovaps ymm9, ymm7
	vmovapd ymm7, ymm6
	vmovaps ymm6, ymm13
	vcmpltps ymm13, ymm0, ymmword ptr [rsp + 464]
	vandps ymm1, ymm13, ymm1
	vbroadcastss ymm13, dword ptr [rip + .LCPI1950_3]
	vandps ymm15, ymm15, ymm13
	vxorps xmm3, xmm3, xmm3
	vcmpltps ymm0, ymm3, ymm0
	vandps ymm0, ymm13, ymm0
	vmovaps ymm13, ymm6
	vmovapd ymm6, ymm7
	vmovaps ymm7, ymm9
	vmovaps ymm9, ymm10
	vmovaps ymm10, ymm11
	vmovaps ymm11, ymm12
	vmovaps ymm12, ymm14
	vmovups ymm14, ymmword ptr [rsp + 272]
	vandps ymm0, ymm0, ymm1
	vmulps ymm1, ymm15, ymm5
	vaddps ymm6, ymm6, ymm1
	vmulps ymm1, ymm8, ymm15
	vmovups ymm8, ymmword ptr [rsp + 80]
	vaddps ymm13, ymm13, ymm1
	vmulps ymm1, ymm2, ymm0
	vaddps ymm12, ymm12, ymm1
	vmulps ymm1, ymm4, ymm0
	vmulps ymm2, ymm0, ymmword ptr [r9 + r8]
	vaddps ymm11, ymm11, ymm1
	vaddps ymm10, ymm10, ymm2
	vmulps ymm1, ymm0, ymmword ptr [r13 + r8]
	vaddps ymm9, ymm9, ymm1
	vaddps ymm7, ymm0, ymm7
	add r8, 32
	cmp rdx, r8
	jne .LBB1950_51
.LBB1950_52:
	mov r8d, esi
	and r8d, 7
	mov r10, r15
	sub r10, 8
	mov edx, 0
	cmovae rdx, r10
	test r8, r8
	mov rbp, r14
	je .LBB1950_56
	lea rbx, [rdx + 8]
	cmp rbx, rbp
	ja .LBB1950_56
	cmp rbx, qword ptr [rsp + 368]
	jbe .LBB1950_55
.LBB1950_56:
	mov edx, r12d
	and edx, 7
	mov r14, qword ptr [rsp + 432]
	mov r10d, r14d
	and r10d, 7
	mov ebx, r11d
	and ebx, 7
	cmp rdx, r8
	cmovb r8, rdx
	cmp r10, r8
	cmovb r8, r10
	cmp rbx, r8
	cmovb r8, rbx
	test r8, r8
	mov rax, qword ptr [rsp + 232]
	je .LBB1950_59
	and esi, -8
	and r12d, -8
	and r14d, -8
	and r11d, -8
	vmovss xmm5, dword ptr [rdi + 4*rsi]
	vmovss xmm15, dword ptr [rcx + 4*r12]
	vmovaps xmm0, xmmword ptr [rsp + 160]
	vsubss xmm8, xmm0, xmm5
	vmovaps xmm0, xmmword ptr [rsp + 144]
	vsubss xmm2, xmm0, xmm15
	vmulss xmm0, xmm8, xmm8
	vmulss xmm1, xmm2, xmm2
	vaddss xmm4, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 128]
	vucomiss xmm0, xmm4
	jbe .LBB1950_60
	vmovaps xmm0, xmmword ptr [rsp + 64]
	vaddss xmm0, xmm8, xmm0
	vmovaps xmmword ptr [rsp + 64], xmm0
	vmovss xmm0, dword ptr [rsp + 12]
	vaddss xmm0, xmm0, xmm2
	vmovss dword ptr [rsp + 12], xmm0
	jmp .LBB1950_63
	.p2align	4
.LBB1950_60:
	vmovaps xmm0, xmmword ptr [rsp + 112]
	vucomiss xmm0, xmm4
	jbe .LBB1950_63
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm4, xmm0
	jbe .LBB1950_63
	vmovss xmm0, dword ptr [r9 + 4*r14]
	vmovss xmm1, dword ptr [r13 + 4*r11]
	vinsertps xmm2, xmm5, xmm15, 16
	vinsertps xmm0, xmm2, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vmovaps xmm1, xmmword ptr [rsp + 32]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 32], xmm1
	vmovaps xmm0, xmmword ptr [rsp + 48]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovaps xmmword ptr [rsp + 48], xmm0
.LBB1950_63:
	cmp r8d, 1
	je .LBB1950_42
	vmovss xmm5, dword ptr [rdi + 4*rsi + 4]
	vmovss xmm15, dword ptr [rcx + 4*r12 + 4]
	vmovaps xmm0, xmmword ptr [rsp + 160]
	vsubss xmm2, xmm0, xmm5
	vmovaps xmm0, xmmword ptr [rsp + 144]
	vsubss xmm8, xmm0, xmm15
	vmulss xmm0, xmm2, xmm2
	vmulss xmm1, xmm8, xmm8
	vaddss xmm4, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 128]
	vucomiss xmm0, xmm4
	jbe .LBB1950_66
	vmovaps xmm0, xmmword ptr [rsp + 64]
	vaddss xmm0, xmm0, xmm2
	vmovaps xmmword ptr [rsp + 64], xmm0
	vmovss xmm0, dword ptr [rsp + 12]
	vaddss xmm0, xmm8, xmm0
	vmovss dword ptr [rsp + 12], xmm0
	jmp .LBB1950_69
.LBB1950_66:
	vmovaps xmm0, xmmword ptr [rsp + 112]
	vucomiss xmm0, xmm4
	jbe .LBB1950_69
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm4, xmm0
	jbe .LBB1950_69
	vmovss xmm0, dword ptr [r9 + 4*r14 + 4]
	vmovss xmm1, dword ptr [r13 + 4*r11 + 4]
	vinsertps xmm2, xmm5, xmm15, 16
	vinsertps xmm0, xmm2, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vmovaps xmm1, xmmword ptr [rsp + 32]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 32], xmm1
	vmovaps xmm0, xmmword ptr [rsp + 48]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovaps xmmword ptr [rsp + 48], xmm0
.LBB1950_69:
	cmp r8d, 2
	je .LBB1950_42
	vmovss xmm5, dword ptr [rdi + 4*rsi + 8]
	vmovss xmm15, dword ptr [rcx + 4*r12 + 8]
	vmovaps xmm0, xmmword ptr [rsp + 160]
	vsubss xmm2, xmm0, xmm5
	vmovaps xmm0, xmmword ptr [rsp + 144]
	vsubss xmm8, xmm0, xmm15
	vmulss xmm0, xmm2, xmm2
	vmulss xmm1, xmm8, xmm8
	vaddss xmm4, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 128]
	vucomiss xmm0, xmm4
	jbe .LBB1950_72
	vmovaps xmm0, xmmword ptr [rsp + 64]
	vaddss xmm0, xmm0, xmm2
	vmovaps xmmword ptr [rsp + 64], xmm0
	vmovss xmm0, dword ptr [rsp + 12]
	vaddss xmm0, xmm8, xmm0
	vmovss dword ptr [rsp + 12], xmm0
	jmp .LBB1950_75
.LBB1950_72:
	vmovaps xmm0, xmmword ptr [rsp + 112]
	vucomiss xmm0, xmm4
	jbe .LBB1950_75
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm4, xmm0
	jbe .LBB1950_75
	vmovss xmm0, dword ptr [r9 + 4*r14 + 8]
	vmovss xmm1, dword ptr [r13 + 4*r11 + 8]
	vinsertps xmm2, xmm5, xmm15, 16
	vinsertps xmm0, xmm2, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vmovaps xmm1, xmmword ptr [rsp + 32]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 32], xmm1
	vmovaps xmm0, xmmword ptr [rsp + 48]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovaps xmmword ptr [rsp + 48], xmm0
.LBB1950_75:
	cmp r8d, 3
	je .LBB1950_42
	vmovss xmm5, dword ptr [rdi + 4*rsi + 12]
	vmovss xmm15, dword ptr [rcx + 4*r12 + 12]
	vmovaps xmm0, xmmword ptr [rsp + 160]
	vsubss xmm2, xmm0, xmm5
	vmovaps xmm0, xmmword ptr [rsp + 144]
	vsubss xmm8, xmm0, xmm15
	vmulss xmm0, xmm2, xmm2
	vmulss xmm1, xmm8, xmm8
	vaddss xmm4, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 128]
	vucomiss xmm0, xmm4
	jbe .LBB1950_78
	vmovaps xmm0, xmmword ptr [rsp + 64]
	vaddss xmm0, xmm0, xmm2
	vmovaps xmmword ptr [rsp + 64], xmm0
	vmovss xmm0, dword ptr [rsp + 12]
	vaddss xmm0, xmm8, xmm0
	vmovss dword ptr [rsp + 12], xmm0
	jmp .LBB1950_81
.LBB1950_78:
	vmovaps xmm0, xmmword ptr [rsp + 112]
	vucomiss xmm0, xmm4
	jbe .LBB1950_81
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm4, xmm0
	jbe .LBB1950_81
	vmovss xmm0, dword ptr [r9 + 4*r14 + 12]
	vmovss xmm1, dword ptr [r13 + 4*r11 + 12]
	vinsertps xmm2, xmm5, xmm15, 16
	vinsertps xmm0, xmm2, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vmovaps xmm1, xmmword ptr [rsp + 32]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 32], xmm1
	vmovaps xmm0, xmmword ptr [rsp + 48]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovaps xmmword ptr [rsp + 48], xmm0
.LBB1950_81:
	cmp r8d, 4
	je .LBB1950_42
	vmovss xmm5, dword ptr [rdi + 4*rsi + 16]
	vmovss xmm15, dword ptr [rcx + 4*r12 + 16]
	vmovaps xmm0, xmmword ptr [rsp + 160]
	vsubss xmm2, xmm0, xmm5
	vmovaps xmm0, xmmword ptr [rsp + 144]
	vsubss xmm8, xmm0, xmm15
	vmulss xmm0, xmm2, xmm2
	vmulss xmm1, xmm8, xmm8
	vaddss xmm4, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 128]
	vucomiss xmm0, xmm4
	jbe .LBB1950_84
	vmovaps xmm0, xmmword ptr [rsp + 64]
	vaddss xmm0, xmm0, xmm2
	vmovaps xmmword ptr [rsp + 64], xmm0
	vmovss xmm0, dword ptr [rsp + 12]
	vaddss xmm0, xmm8, xmm0
	vmovss dword ptr [rsp + 12], xmm0
	jmp .LBB1950_87
.LBB1950_84:
	vmovaps xmm0, xmmword ptr [rsp + 112]
	vucomiss xmm0, xmm4
	jbe .LBB1950_87
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm4, xmm0
	jbe .LBB1950_87
	vmovss xmm0, dword ptr [r9 + 4*r14 + 16]
	vmovss xmm1, dword ptr [r13 + 4*r11 + 16]
	vinsertps xmm2, xmm5, xmm15, 16
	vinsertps xmm0, xmm2, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vmovaps xmm1, xmmword ptr [rsp + 32]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 32], xmm1
	vmovaps xmm0, xmmword ptr [rsp + 48]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovaps xmmword ptr [rsp + 48], xmm0
.LBB1950_87:
	cmp r8d, 5
	je .LBB1950_42
	vmovss xmm5, dword ptr [rdi + 4*rsi + 20]
	vmovss xmm15, dword ptr [rcx + 4*r12 + 20]
	vmovaps xmm0, xmmword ptr [rsp + 160]
	vsubss xmm2, xmm0, xmm5
	vmovaps xmm0, xmmword ptr [rsp + 144]
	vsubss xmm8, xmm0, xmm15
	vmulss xmm0, xmm2, xmm2
	vmulss xmm1, xmm8, xmm8
	vaddss xmm4, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 128]
	vucomiss xmm0, xmm4
	jbe .LBB1950_90
	vmovaps xmm0, xmmword ptr [rsp + 64]
	vaddss xmm0, xmm0, xmm2
	vmovaps xmmword ptr [rsp + 64], xmm0
	vmovss xmm0, dword ptr [rsp + 12]
	vaddss xmm0, xmm8, xmm0
	vmovss dword ptr [rsp + 12], xmm0
	jmp .LBB1950_93
.LBB1950_90:
	vmovaps xmm0, xmmword ptr [rsp + 112]
	vucomiss xmm0, xmm4
	jbe .LBB1950_93
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm4, xmm0
	jbe .LBB1950_93
	vmovss xmm0, dword ptr [r9 + 4*r14 + 20]
	vmovss xmm1, dword ptr [r13 + 4*r11 + 20]
	vinsertps xmm2, xmm5, xmm15, 16
	vinsertps xmm0, xmm2, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vmovaps xmm1, xmmword ptr [rsp + 32]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 32], xmm1
	vmovaps xmm0, xmmword ptr [rsp + 48]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovaps xmmword ptr [rsp + 48], xmm0
.LBB1950_93:
	cmp r8d, 6
	je .LBB1950_42
	vmovss xmm5, dword ptr [rdi + 4*rsi + 24]
	vmovss xmm15, dword ptr [rcx + 4*r12 + 24]
	vmovaps xmm0, xmmword ptr [rsp + 160]
	vsubss xmm2, xmm0, xmm5
	vmovaps xmm0, xmmword ptr [rsp + 144]
	vsubss xmm8, xmm0, xmm15
	vmulss xmm0, xmm2, xmm2
	vmulss xmm1, xmm8, xmm8
	vaddss xmm4, xmm0, xmm1
	vmovaps xmm0, xmmword ptr [rsp + 128]
	vucomiss xmm0, xmm4
	jbe .LBB1950_95
	vmovaps xmm0, xmmword ptr [rsp + 64]
	vaddss xmm0, xmm0, xmm2
	vmovaps xmmword ptr [rsp + 64], xmm0
	vmovss xmm0, dword ptr [rsp + 12]
	vaddss xmm0, xmm8, xmm0
	vmovss dword ptr [rsp + 12], xmm0
	.p2align	4
.LBB1950_42:
	mov rdi, qword ptr [rsp + 24]
.LBB1950_43:
	vmovups ymm8, ymmword ptr [rsp + 80]
	jmp .LBB1950_44
.LBB1950_95:
	vmovaps xmm0, xmmword ptr [rsp + 112]
	vucomiss xmm0, xmm4
	mov rdi, qword ptr [rsp + 24]
	jbe .LBB1950_43
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm4, xmm0
	vmovups ymm8, ymmword ptr [rsp + 80]
	jbe .LBB1950_44
	vmovss xmm0, dword ptr [r9 + 4*r14 + 24]
	vmovss xmm1, dword ptr [r13 + 4*r11 + 24]
	vinsertps xmm2, xmm5, xmm15, 16
	vinsertps xmm0, xmm2, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vmovaps xmm1, xmmword ptr [rsp + 32]
	vaddps xmm1, xmm1, xmm0
	vmovaps xmmword ptr [rsp + 32], xmm1
	vmovaps xmm0, xmmword ptr [rsp + 48]
	vaddss xmm0, xmm0, dword ptr [rip + .LCPI1950_3]
	vmovaps xmmword ptr [rsp + 48], xmm0
	jmp .LBB1950_44
.LBB1950_99:
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
	vextractf128 xmm2, ymm12, 1
	vunpcklps xmm4, xmm2, xmm1
	vextractf128 xmm5, ymm10, 1
	vmovlhps xmm4, xmm4, xmm5
	vextractf128 xmm8, ymm9, 1
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
	vaddps xmm8, xmm0, xmmword ptr [rsp + 32]
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
	vmovaps xmm1, xmmword ptr [rsp + 48]
	vinsertps xmm1, xmm1, dword ptr [rsp + 64], 16
	vaddps xmm4, xmm1, xmm0
	vmovshdup xmm0, xmm13
	vaddss xmm0, xmm13, xmm0
	vshufpd xmm1, xmm13, xmm13, 1
	vaddss xmm0, xmm0, xmm1
	vshufps xmm1, xmm13, xmm13, 255
	vaddss xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm13, 1
	vaddss xmm0, xmm0, xmm1
	vmovshdup xmm2, xmm1
	vaddss xmm0, xmm0, xmm2
	vshufpd xmm2, xmm1, xmm1, 1
	vaddss xmm0, xmm0, xmm2
	vshufps xmm1, xmm1, xmm1, 255
	vaddss xmm0, xmm0, xmm1
	vaddss xmm2, xmm0, dword ptr [rsp + 12]
.LBB1950_100:
	vmovaps xmmword ptr [rsp + 496], xmm8
	vmovlps qword ptr [rsp + 512], xmm4
	vmovss dword ptr [rsp + 520], xmm2
	lea rdi, [rsp + 256]
	mov rsi, qword ptr [rsp + 352]
	vmovaps xmm0, xmmword ptr [rsp + 544]
	vmovaps xmm1, xmmword ptr [rsp + 528]
	lea rdx, [rsp + 416]
	lea rcx, [rsp + 240]
	lea r8, [rsp + 496]
	vzeroupper
	call swarm::rules::finish
	mov rdi, qword ptr [rsp + 360]
	cmp rdi, qword ptr [rsp + 336]
	jae .LBB1950_34
	vmovss xmm0, dword ptr [rsp + 256]
	vmovss xmm1, dword ptr [rsp + 260]
	vmovss xmm2, dword ptr [rsp + 264]
	vmovss xmm3, dword ptr [rsp + 268]
	mov rax, qword ptr [rsp + 328]
	vmovss dword ptr [rax + 4*rdi], xmm0
	mov rax, qword ptr [rsp + 320]
	vmovss dword ptr [rax + 4*rdi], xmm1
	mov rax, qword ptr [rsp + 312]
	vmovss dword ptr [rax + 4*rdi], xmm2
	mov rax, qword ptr [rsp + 304]
	vmovss dword ptr [rax + 4*rdi], xmm3
	jmp .LBB1950_34
.LBB1950_102:
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
