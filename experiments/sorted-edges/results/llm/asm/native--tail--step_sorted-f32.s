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
	sub rsp, 424
	.cfi_def_cfa_offset 480
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov rbx, rdi
	vmovsd xmm3, qword ptr [rbx + 288]
	vmovss xmm0, dword ptr [rip + .LCPI1950_0]
	vmovss xmm2, dword ptr [rbx + 316]
	lea rax, [rdi + 316]
	mov rsi, qword ptr [rbx + 8]
	mov rdx, qword ptr [rbx + 16]
	mov rcx, qword ptr [rbx + 32]
	mov r8, qword ptr [rbx + 40]
	xor r15d, r15d
	mov r9, -1
	mov qword ptr [rsp + 192], rax
	mov eax, dword ptr [rdi + 312]
	mov dword ptr [rsp + 264], eax
	mov rax, qword ptr [rdi + 304]
	add rdi, 192
	vmulss xmm1, xmm3, xmm0
	vmovaps xmmword ptr [rsp + 96], xmm2
	vmovaps xmmword ptr [rsp + 368], xmm3
	vcmpunordss k1, xmm1, xmm1
	vmaxss xmm1, xmm2, xmm1
	mov qword ptr [rsp + 256], rax
	vmovss xmm1 {k1}, xmm1, xmm2
	vmovshdup xmm2, xmm3
	vmulss xmm0, xmm2, xmm0
	vmovaps xmmword ptr [rsp + 352], xmm2
	vmaxss xmm2, xmm1, xmm0
	vcmpunordss k1, xmm0, xmm0
	vmovss xmm2 {k1}, xmm2, xmm1
	vmulss xmm0, xmm2, dword ptr [rip + .LCPI1950_1]
	vmovss xmm1, dword ptr [rip + .LCPI1950_2]
	vxorps xmm2, xmm2, xmm2
	vdivss xmm0, xmm1, xmm0
	vmovss dword ptr [rbx + 280], xmm0
	vbroadcastss xmm0, xmm0
	vmulps xmm0, xmm3, xmm0
	vmovsd xmm3, qword ptr [rip + .LCPI1950_4]
	vroundps xmm0, xmm0, 10
	vcmpltps k1, xmm0, dword ptr [rip + .LCPI1950_3]{1to4}
	vcvtps2pd xmm1, xmm0
	vcmpleps k0, xmm2, xmm0
	vxorps xmm0, xmm0, xmm0
	vucomisd xmm1, xmm0
	vcvttsd2usi rax, xmm1
	kandw k1, k0, k1
	cmovb rax, r15
	vucomisd xmm1, xmm3
	vshufpd xmm1, xmm1, xmm1, 1
	cmova rax, r9
	vucomisd xmm1, xmm0
	vmovq xmm2, rax
	vcvttsd2usi rax, xmm1
	cmovb rax, r15
	vucomisd xmm1, xmm3
	cmova rax, r9
	vmovq xmm0, rax
	vpunpcklqdq xmm0, xmm2, xmm0
	vpbroadcastq xmm2, qword ptr [rip + .LCPI1950_5]
	vpmaxuq xmm2 {k1}, xmm0, xmm2
	vmovdqu xmmword ptr [rbx + 264], xmm2
	call <swarm::grid::Grid>::fill
	mov r14, qword ptr [rbx + 248]
	mov rax, qword ptr [rbx + 256]
	mov rbp, qword ptr [rbx + 8]
	mov r12, qword ptr [rbx + 16]
	mov rdx, rbx
	mov qword ptr [rbx + 112], 0
	mov qword ptr [rsp + 24], rdx
	lea rbx, [r14 + 4*rax]
	lea rax, [rdx + 96]
	mov r13, r14
	mov qword ptr [rsp + 16], rax
	jmp .LBB1950_2
.LBB1950_5:
	xor eax, eax
	mov r13, rbx
	cmp eax, 1
	jne .LBB1950_8
.LBB1950_6:
	cmp r15, qword ptr [rdx + 96]
	je .LBB1950_7
.LBB1950_1:
	mov rax, qword ptr [rdx + 104]
	vmovd dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rdx + 112], r15
	.p2align	4
.LBB1950_2:
	cmp r13, rbx
	je .LBB1950_5
	mov eax, dword ptr [r13]
	add r13, 4
	cmp r12, rax
	jbe .LBB1950_2
	vmovd xmm0, dword ptr [rbp + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1950_6
	jmp .LBB1950_8
.LBB1950_7:
	mov rdi, qword ptr [rsp + 16]
	mov edx, 1
	mov rsi, r15
	vmovd dword ptr [rsp], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovd xmm0, dword ptr [rsp]
	mov rdx, qword ptr [rsp + 24]
	jmp .LBB1950_1
.LBB1950_8:
	mov r13, qword ptr [rdx + 32]
	mov r12, qword ptr [rdx + 40]
	lea rax, [rdx + 120]
	mov qword ptr [rdx + 136], 0
	xor r15d, r15d
	mov rbp, r14
	mov qword ptr [rsp + 16], rax
	jmp .LBB1950_10
.LBB1950_13:
	xor eax, eax
	mov rbp, rbx
	cmp eax, 1
	jne .LBB1950_16
.LBB1950_14:
	cmp r15, qword ptr [rdx + 120]
	je .LBB1950_15
.LBB1950_9:
	mov rax, qword ptr [rdx + 128]
	vmovd dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rdx + 136], r15
	.p2align	4
.LBB1950_10:
	cmp rbp, rbx
	je .LBB1950_13
	mov eax, dword ptr [rbp]
	add rbp, 4
	cmp r12, rax
	jbe .LBB1950_10
	vmovd xmm0, dword ptr [r13 + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1950_14
	jmp .LBB1950_16
.LBB1950_15:
	mov rdi, qword ptr [rsp + 16]
	mov edx, 1
	mov rsi, r15
	vmovd dword ptr [rsp], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovd xmm0, dword ptr [rsp]
	mov rdx, qword ptr [rsp + 24]
	jmp .LBB1950_9
.LBB1950_16:
	mov r13, qword ptr [rdx + 56]
	mov r12, qword ptr [rdx + 64]
	lea rax, [rdx + 144]
	mov qword ptr [rdx + 160], 0
	xor r15d, r15d
	mov rbp, r14
	mov qword ptr [rsp + 16], rax
	jmp .LBB1950_18
.LBB1950_21:
	xor eax, eax
	mov rbp, rbx
	cmp eax, 1
	jne .LBB1950_24
.LBB1950_22:
	cmp r15, qword ptr [rdx + 144]
	je .LBB1950_23
.LBB1950_17:
	mov rax, qword ptr [rdx + 152]
	vmovd dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rdx + 160], r15
	.p2align	4
.LBB1950_18:
	cmp rbp, rbx
	je .LBB1950_21
	mov eax, dword ptr [rbp]
	add rbp, 4
	cmp r12, rax
	jbe .LBB1950_18
	vmovd xmm0, dword ptr [r13 + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1950_22
	jmp .LBB1950_24
.LBB1950_23:
	mov rdi, qword ptr [rsp + 16]
	mov edx, 1
	mov rsi, r15
	vmovd dword ptr [rsp], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovd xmm0, dword ptr [rsp]
	mov rdx, qword ptr [rsp + 24]
	jmp .LBB1950_17
.LBB1950_24:
	mov r13, qword ptr [rdx + 80]
	mov r12, qword ptr [rdx + 88]
	lea rbp, [rdx + 168]
	xor r15d, r15d
	mov qword ptr [rdx + 184], 0
	jmp .LBB1950_26
.LBB1950_29:
	xor eax, eax
	mov r14, rbx
	cmp eax, 1
	jne .LBB1950_32
.LBB1950_30:
	cmp r15, qword ptr [rdx + 168]
	je .LBB1950_31
.LBB1950_25:
	mov rax, qword ptr [rdx + 176]
	vmovd dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rdx + 184], r15
	.p2align	4
.LBB1950_26:
	cmp r14, rbx
	je .LBB1950_29
	mov eax, dword ptr [r14]
	add r14, 4
	cmp r12, rax
	jbe .LBB1950_26
	vmovd xmm0, dword ptr [r13 + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1950_30
	jmp .LBB1950_32
.LBB1950_31:
	mov edx, 1
	mov rdi, rbp
	mov rsi, r15
	vmovd dword ptr [rsp], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovd xmm0, dword ptr [rsp]
	mov rdx, qword ptr [rsp + 24]
	jmp .LBB1950_25
.LBB1950_32:
	vmovups zmm0, zmmword ptr [rdx + 96]
	vmovdqu64 zmm1, zmmword ptr [rdx]
	mov rax, qword ptr [rdx + 8]
	mov rdi, qword ptr [rdx + 32]
	mov rcx, qword ptr [rdx + 56]
	mov rsi, qword ptr [rdx + 112]
	mov qword ptr [rsp + 168], rax
	mov qword ptr [rsp + 160], rdi
	mov qword ptr [rsp + 152], rcx
	vmovups zmmword ptr [rdx], zmm0
	vmovdqu64 zmmword ptr [rdx + 96], zmm1
	vmovdqu ymm0, ymmword ptr [rdx + 64]
	vmovups xmm2, xmmword ptr [rdx + 160]
	mov rdi, qword ptr [rdx + 80]
	mov rcx, qword ptr [rdx + 176]
	mov rax, qword ptr [rdx + 64]
	mov qword ptr [rsp + 144], rdi
	vmovups xmmword ptr [rdx + 64], xmm2
	mov qword ptr [rdx + 80], rcx
	mov qword ptr [rdx + 88], r15
	vmovdqu ymmword ptr [rdx + 160], ymm0
	test rsi, rsi
	je .LBB1950_108
	vmovss xmm2, dword ptr [rdx + 320]
	vextracti128 xmm4, ymm1, 1
	vextracti32x4 xmm1, zmm1, 2
	vpmovsxbd xmm27, dword ptr [rip + .LCPI1950_10]
	vpmovsxbd xmm28, dword ptr [rip + .LCPI1950_11]
	vmovdqa64 zmm29, zmmword ptr [rip + .LCPI1950_6]
	vmovdqa64 zmm30, zmmword ptr [rip + .LCPI1950_7]
	vbroadcastss ymm31, dword ptr [rip + .LCPI1950_2]
	vextracti128 xmm0, ymm0, 1
	mov qword ptr [rsp + 184], rsi
	vpextrq rcx, xmm1, 1
	vmovq rdi, xmm4
	cmp rcx, rdi
	cmovb rdi, rcx
	vpextrq rcx, xmm0, 1
	cmp rax, rdi
	cmovb rdi, rax
	cmp rcx, rdi
	cmovb rdi, rcx
	vmulss xmm23, xmm2, xmm2
	vmovaps xmm2, xmmword ptr [rsp + 96]
	mov qword ptr [rsp + 176], rdi
	xor edi, edi
	vbroadcastss ymm6, xmm23
	vmovaps xmmword ptr [rsp + 336], xmm23
	vmovups ymmword ptr [rsp + 304], ymm6
	vmulss xmm3, xmm2, xmm2
	vbroadcastss ymm25, xmm3
	vmovaps xmmword ptr [rsp + 32], xmm3
	vmovups ymmword ptr [rsp + 384], ymm25
	jmp .LBB1950_36
.LBB1950_34:
	vmovaps xmm23, xmmword ptr [rsp + 336]
	vmovups ymm25, ymmword ptr [rsp + 384]
	vmovups ymm6, ymmword ptr [rsp + 304]
	vpmovsxbd xmm27, dword ptr [rip + .LCPI1950_10]
	vpmovsxbd xmm28, dword ptr [rip + .LCPI1950_11]
	vmovdqa64 zmm29, zmmword ptr [rip + .LCPI1950_6]
	vmovdqa64 zmm30, zmmword ptr [rip + .LCPI1950_7]
	vbroadcastss ymm31, dword ptr [rip + .LCPI1950_2]
	mov rdx, qword ptr [rsp + 24]
	mov rsi, qword ptr [rsp + 184]
	.p2align	4
.LBB1950_35:
	inc rdi
	cmp rdi, rsi
	je .LBB1950_108
.LBB1950_36:
	mov r15, qword ptr [rdx + 16]
	cmp rdi, r15
	jae .LBB1950_35
	mov rax, qword ptr [rdx + 40]
	mov qword ptr [rsp + 64], rax
	cmp rdi, rax
	jae .LBB1950_35
	mov rax, qword ptr [rdx + 64]
	mov rcx, qword ptr [rdx + 88]
	cmp rdi, rax
	mov qword ptr [rsp + 56], rax
	mov qword ptr [rsp + 48], rcx
	setb al
	cmp rdi, rcx
	setb cl
	and cl, al
	cmp cl, 1
	jne .LBB1950_35
	mov rax, qword ptr [rdx + 8]
	mov rsi, qword ptr [rdx + 32]
	mov rcx, qword ptr [rdx + 56]
	vxorps xmm7, xmm7, xmm7
	vxorpd xmm5, xmm5, xmm5
	mov qword ptr [rsp + 200], rdi
	vmovss xmm8, dword ptr [rip + .LCPI1950_3]
	vpxor xmm1, xmm1, xmm1
	vmovss xmm20, dword ptr [rax + 4*rdi]
	vmovss xmm21, dword ptr [rsi + 4*rdi]
	vmovss xmm2, dword ptr [rcx + 4*rdi]
	mov qword ptr [rsp + 96], rax
	mov rax, qword ptr [rdx + 80]
	mov qword ptr [rsp + 88], rsi
	mov rsi, -1
	mov qword ptr [rsp + 80], rcx
	mov rcx, qword ptr [rdx + 272]
	vmovss xmm3, dword ptr [rax + 4*rdi]
	mov qword ptr [rsp + 72], rax
	mov rdi, qword ptr [rdx + 264]
	mov eax, 0
	vmovdqu xmmword ptr [rsp + 284], xmm1
	vmovdqa xmmword ptr [rsp + 272], xmm1
	vmovss dword ptr [rsp + 112], xmm20
	vmovss dword ptr [rsp + 116], xmm21
	vmovss dword ptr [rsp + 120], xmm2
	vmovss xmm2, dword ptr [rdx + 280]
	mov rdx, rdi
	mov qword ptr [rsp + 248], rdi
	vmovss dword ptr [rsp + 124], xmm3
	vmulss xmm3, xmm20, xmm2
	vmulss xmm2, xmm21, xmm2
	vmaxss xmm3, xmm3, xmm7
	vmaxss xmm2, xmm2, xmm7
	vroundss xmm3, xmm3, xmm3, 9
	vcvtss2sd xmm4, xmm3, xmm3
	vmovsd xmm0, qword ptr [rip + .LCPI1950_4]
	vucomisd xmm4, xmm5
	vcvttsd2usi r8, xmm4
	cmovb r8, rax
	vucomisd xmm4, xmm0
	vroundss xmm2, xmm2, xmm2, 9
	cmova r8, rsi
	sub rdx, 1
	cmovb rdx, rax
	cmp rdx, r8
	cmovb r8, rdx
	vucomiss xmm3, xmm8
	vcvtss2sd xmm3, xmm2, xmm2
	vcvttsd2usi rdi, xmm3
	cmovae r8, rax
	vucomisd xmm3, xmm5
	cmovb rdi, rax
	vucomisd xmm3, xmm0
	cmova rdi, rsi
	sub rcx, 1
	mov rsi, r8
	cmovb rcx, rax
	cmp rcx, rdi
	cmovb rdi, rcx
	vucomiss xmm2, xmm8
	cmovae rdi, rax
	sub r8, 1
	cmovb r8, rax
	mov r14, rdi
	sub r14, 1
	cmovb r14, rax
	inc rdi
	mov qword ptr [rsp + 232], r8
	cmp rcx, rdi
	cmovb rdi, rcx
	mov qword ptr [rsp + 240], rdi
	cmp r14, rdi
	ja .LBB1950_106
	mov rax, qword ptr [rsp + 56]
	mov rcx, qword ptr [rsp + 48]
	inc rsi
	vbroadcastss ymm2, xmm21
	vbroadcastss ymm4, xmm20
	vxorps xmm15, xmm15, xmm15
	vxorps xmm22, xmm22, xmm22
	vxorps xmm26, xmm26, xmm26
	vxorpd xmm5, xmm5, xmm5
	cmp rdx, rsi
	cmovb rsi, rdx
	mov rdx, qword ptr [rsp + 24]
	cmp rax, rcx
	cmovb rcx, rax
	inc rsi
	mov qword ptr [rsp + 224], rsi
	mov rsi, qword ptr [rsp + 64]
	mov rdi, qword ptr [rdx + 208]
	cmp rsi, rcx
	mov qword ptr [rsp + 8], rdi
	cmovb rcx, rsi
	mov qword ptr [rsp + 208], rcx
	mov rcx, qword ptr [rdx + 200]
	mov qword ptr [rsp + 216], rcx
	.p2align	4
.LBB1950_41:
	mov rcx, qword ptr [rsp + 248]
	mov rax, qword ptr [rsp + 232]
	mov qword ptr [rsp], r14
	imul rcx, r14
	lea rsi, [rcx + rax]
	cmp rsi, rdi
	jae .LBB1950_44
	add rcx, qword ptr [rsp + 224]
	mov r11d, 0
	mov edx, 0
	cmp rcx, rdi
	jae .LBB1950_45
	mov rax, qword ptr [rsp + 216]
	mov edx, dword ptr [rax + 4*rsi]
	mov r11d, dword ptr [rax + 4*rcx]
	jmp .LBB1950_45
	.p2align	4
.LBB1950_44:
	xor r11d, r11d
	xor edx, edx
.LBB1950_45:
	mov rcx, qword ptr [rsp + 96]
	mov rsi, r11
	sub rsi, rdx
	mov r14, r15
	mov ebp, 0
	mov r9, qword ptr [rsp + 80]
	vmovaps xmm24, xmm15
	setb r8b
	cmp r11, r15
	mov r15d, 4
	mov r13, rsi
	seta al
	or al, r8b
	cmovne r13, rbp
	lea rdi, [rcx + 4*rdx]
	lea r9, [r9 + 4*rdx]
	cmovne rdi, r15
	cmp r11, qword ptr [rsp + 64]
	seta al
	or al, r8b
	mov rax, qword ptr [rsp + 88]
	lea rcx, [rax + 4*rdx]
	mov rax, rsi
	cmovne rax, rbp
	mov qword ptr [rsp + 16], rax
	cmovne rcx, r15
	shr rax, 3
	cmp r11, qword ptr [rsp + 56]
	seta r10b
	or r10b, r8b
	mov r10, rsi
	cmovne r10, rbp
	cmovne r9, r15
	mov rbx, r10
	shr rbx, 3
	cmp r11, qword ptr [rsp + 48]
	seta r12b
	or r12b, r8b
	mov r12, qword ptr [rsp + 72]
	cmovne rsi, rbp
	mov r8, rsi
	lea r12, [r12 + 4*rdx]
	mov rdx, r13
	cmovne r12, r15
	shr rdx, 3
	shr r8, 3
	cmp rax, rdx
	cmovb rdx, rax
	cmp rbx, rdx
	cmovb rdx, rbx
	cmp r8, rdx
	cmovb rdx, r8
	test rdx, rdx
	je .LBB1950_48
	shl rdx, 5
	vxorps xmm7, xmm7, xmm7
	xor r8d, r8d
	vxorps xmm8, xmm8, xmm8
	vxorps xmm9, xmm9, xmm9
	vxorps xmm12, xmm12, xmm12
	vxorps xmm13, xmm13, xmm13
	vxorps xmm10, xmm10, xmm10
	vxorps xmm11, xmm11, xmm11
	.p2align	4
.LBB1950_47:
	vmovups ymm14, ymmword ptr [rdi + r8]
	vmovups ymm15, ymmword ptr [rcx + r8]
	vsubps ymm16, ymm4, ymm14
	vsubps ymm17, ymm2, ymm15
	vmulps ymm18, ymm16, ymm16
	vmulps ymm19, ymm17, ymm17
	vaddps ymm0, ymm18, ymm19
	vcmpleps k1, ymm6, ymm0
	vcmpltps ymm1, ymm0, ymm6
	vcmpltps k1 {k1}, ymm0, ymm25
	vcmpltps ymm0, ymm5, ymm0
	vandps ymm1, ymm1, ymm31
	vmulps ymm16, ymm16, ymm1
	vmulps ymm1, ymm17, ymm1
	vandps ymm0 {k1} {z}, ymm0, ymm31
	vmulps ymm3, ymm15, ymm0
	vaddps ymm9, ymm9, ymm0
	vaddps ymm8, ymm8, ymm16
	vmulps ymm16, ymm14, ymm0
	vmulps ymm14, ymm0, ymmword ptr [r9 + r8]
	vaddps ymm7, ymm7, ymm1
	vaddps ymm10, ymm10, ymm3
	vmulps ymm3, ymm0, ymmword ptr [r12 + r8]
	add r8, 32
	vaddps ymm11, ymm11, ymm16
	vaddps ymm13, ymm14, ymm13
	vaddps ymm12, ymm12, ymm3
	cmp rdx, r8
	jne .LBB1950_47
	jmp .LBB1950_49
	.p2align	4
.LBB1950_48:
	vxorps xmm7, xmm7, xmm7
	vxorps xmm8, xmm8, xmm8
	vxorps xmm9, xmm9, xmm9
	vxorps xmm12, xmm12, xmm12
	vxorps xmm13, xmm13, xmm13
	vxorps xmm10, xmm10, xmm10
	vxorps xmm11, xmm11, xmm11
.LBB1950_49:
	mov r8d, r13d
	and r8d, 7
	mov rax, r11
	sub rax, 8
	mov ebx, 0
	mov dl, 1
	mov r15, r14
	cmovae rbx, rax
	test r8, r8
	je .LBB1950_53
	lea rax, [rbx + 8]
	vmovaps xmm15, xmm24
	cmp rax, r15
	ja .LBB1950_54
	cmp rax, qword ptr [rsp + 208]
	ja .LBB1950_54
	mov rax, r11
	mov r14, qword ptr [rsp + 96]
	sub rax, rbx
	xor edx, edx
	sub r11, rbx
	sub r11, r8
	vpbroadcastq zmm0, rax
	mov rax, qword ptr [rsp + 80]
	vpbroadcastq zmm1, r11
	mov r11, qword ptr [rsp + 88]
	vpcmpltuq k1, zmm1, zmm29
	vpcmpnleuq k1 {k1}, zmm0, zmm30
	vmovups ymm14, ymmword ptr [r14 + 4*rbx]
	vmovups ymm15, ymmword ptr [r11 + 4*rbx]
	vsubps ymm0, ymm4, ymm14
	vsubps ymm1, ymm2, ymm15
	vmulps ymm16, ymm0, ymm0
	vmulps ymm17, ymm1, ymm1
	vaddps ymm5, ymm16, ymm17
	vmovaps ymm16, ymm6
	vcmpleps k2, ymm16, ymm5
	vcmpltps ymm3, ymm5, ymm6
	vxorps xmm6, xmm6, xmm6
	vcmpltps ymm6, ymm6, ymm5
	vcmpltps k0 {k2}, ymm5, ymm25
	vandps ymm3 {k1} {z}, ymm3, ymm31
	vmulps ymm0, ymm0, ymm3
	kandb k1, k1, k0
	vandps ymm5 {k1} {z}, ymm6, ymm31
	vmulps ymm6, ymm1, ymm3
	vmulps ymm3, ymm14, ymm5
	vmulps ymm1, ymm15, ymm5
	vaddps ymm8, ymm8, ymm0
	vaddps ymm9, ymm9, ymm5
	vmovaps xmm15, xmm24
	vaddps ymm7, ymm6, ymm7
	vaddps ymm11, ymm11, ymm3
	vmulps ymm3, ymm5, ymmword ptr [rax + 4*rbx]
	mov rax, qword ptr [rsp + 72]
	vaddps ymm10, ymm10, ymm1
	vmulps ymm1, ymm5, ymmword ptr [rax + 4*rbx]
	vaddps ymm13, ymm13, ymm3
	vaddps ymm12, ymm12, ymm1
	jmp .LBB1950_54
	.p2align	4
.LBB1950_53:
	vmovaps xmm15, xmm24
.LBB1950_54:
	vunpcklps xmm0, xmm11, xmm10
	vinsertps xmm1, xmm10, xmm11, 76
	vextractf128 xmm3, ymm11, 1
	vextractf128 xmm6, ymm13, 1
	mov rbx, qword ptr [rsp + 16]
	vmovlhps xmm0, xmm0, xmm13
	vshufps xmm1, xmm1, xmm13, 212
	vinsertps xmm0, xmm0, xmm12, 48
	vinsertps xmm1, xmm1, xmm12, 112
	vaddps xmm0, xmm0, xmm1
	vunpckhps xmm1, xmm11, xmm10
	vmovsd xmm1, xmm13, xmm1
	vinsertps xmm1, xmm1, xmm12, 176
	vaddps xmm0, xmm0, xmm1
	vmovaps xmm1, xmm11
	vpermt2ps xmm1, xmm27, xmm10
	vpermt2ps ymm11, ymm28, ymm10
	vshufps xmm1, xmm1, xmm13, 244
	vblendps xmm1, xmm1, xmm12, 8
	vextractf128 xmm12, ymm12, 1
	vaddps xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm10, 1
	vunpcklps xmm5, xmm3, xmm1
	vmovlhps xmm5, xmm5, xmm6
	vinsertps xmm5, xmm5, xmm12, 48
	vaddps xmm0, xmm0, xmm5
	vinsertps xmm5, xmm1, xmm3, 76
	vunpckhps xmm1, xmm3, xmm1
	vextractf128 xmm3, ymm9, 1
	vshufps xmm5, xmm5, xmm6, 212
	vmovsd xmm1, xmm6, xmm1
	vinsertps xmm5, xmm5, xmm12, 112
	vinsertps xmm1, xmm1, xmm12, 176
	vaddps xmm0, xmm0, xmm5
	vaddps xmm0, xmm0, xmm1
	vshufps xmm1, xmm11, xmm6, 244
	vblendps xmm1, xmm1, xmm12, 8
	vaddps xmm0, xmm0, xmm1
	vshufpd xmm1, xmm9, xmm9, 1
	vinsertps xmm1, xmm1, xmm8, 156
	vaddps xmm26, xmm26, xmm0
	vhaddps xmm0, xmm9, xmm8
	vshufps xmm0, xmm0, xmm0, 232
	vaddps xmm0, xmm0, xmm1
	vshufpd xmm1, xmm8, xmm8, 1
	vinsertps xmm1, xmm1, xmm9, 204
	vaddps xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm8, 1
	vinsertps xmm5, xmm3, xmm1, 28
	vaddps xmm0, xmm0, xmm5
	vinsertps xmm5, xmm1, xmm3, 76
	vaddps xmm0, xmm0, xmm5
	vshufpd xmm5, xmm3, xmm3, 1
	vinsertps xmm5, xmm5, xmm1, 156
	vshufpd xmm1, xmm1, xmm1, 1
	vinsertps xmm1, xmm1, xmm3, 204
	vaddps xmm0, xmm0, xmm5
	vaddps xmm0, xmm0, xmm1
	vshufpd xmm1, xmm7, xmm7, 1
	vaddps xmm15, xmm15, xmm0
	vmovshdup xmm0, xmm7
	vaddss xmm0, xmm7, xmm0
	vaddss xmm0, xmm0, xmm1
	vshufps xmm1, xmm7, xmm7, 255
	vaddss xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm7, 1
	vmovshdup xmm3, xmm1
	vaddss xmm0, xmm0, xmm1
	vaddss xmm0, xmm0, xmm3
	vshufpd xmm3, xmm1, xmm1, 1
	vshufps xmm1, xmm1, xmm1, 255
	vaddss xmm0, xmm0, xmm3
	vaddss xmm0, xmm0, xmm1
	vaddss xmm22, xmm22, xmm0
	test dl, dl
	je .LBB1950_58
	mov eax, ebx
	and eax, 7
	mov edx, r10d
	mov r11d, esi
	and edx, 7
	and r11d, 7
	cmp rax, r8
	cmovb r8, rax
	cmp rdx, r8
	cmovb r8, rdx
	cmp r11, r8
	cmovb r8, r11
	test r8, r8
	je .LBB1950_58
	and r13d, -8
	and ebx, -8
	vmovups ymm6, ymmword ptr [rsp + 304]
	and r10d, -8
	and esi, -8
	vmovshdup xmm7, xmm15
	vxorps xmm5, xmm5, xmm5
	vmovss xmm8, dword ptr [rdi + 4*r13]
	vmovss xmm9, dword ptr [rcx + 4*rbx]
	vsubss xmm10, xmm20, xmm8
	vsubss xmm11, xmm21, xmm9
	vmulss xmm0, xmm10, xmm10
	vmulss xmm1, xmm11, xmm11
	vaddss xmm12, xmm0, xmm1
	vucomiss xmm23, xmm12
	jbe .LBB1950_59
	vaddss xmm7, xmm10, xmm7
	vaddss xmm22, xmm22, xmm11
	jmp .LBB1950_62
	.p2align	4
.LBB1950_58:
	vmovups ymm6, ymmword ptr [rsp + 304]
	vxorps xmm5, xmm5, xmm5
	jmp .LBB1950_88
.LBB1950_59:
	vmovaps xmm0, xmmword ptr [rsp + 32]
	vucomiss xmm0, xmm12
	jbe .LBB1950_62
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm12, xmm0
	jbe .LBB1950_62
	vmovss xmm0, dword ptr [r9 + 4*r10]
	vmovss xmm1, dword ptr [r12 + 4*rsi]
	vaddss xmm15, xmm15, dword ptr [rip + .LCPI1950_2]
	vinsertps xmm3, xmm8, xmm9, 16
	vinsertps xmm0, xmm3, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm26, xmm26, xmm0
.LBB1950_62:
	cmp r8d, 1
	je .LBB1950_87
	vmovss xmm8, dword ptr [rdi + 4*r13 + 4]
	vmovss xmm9, dword ptr [rcx + 4*rbx + 4]
	vsubss xmm10, xmm20, xmm8
	vsubss xmm11, xmm21, xmm9
	vmulss xmm0, xmm10, xmm10
	vmulss xmm1, xmm11, xmm11
	vaddss xmm12, xmm0, xmm1
	vucomiss xmm23, xmm12
	jbe .LBB1950_65
	vaddss xmm7, xmm10, xmm7
	vaddss xmm22, xmm22, xmm11
	jmp .LBB1950_68
.LBB1950_65:
	vmovaps xmm0, xmmword ptr [rsp + 32]
	vucomiss xmm0, xmm12
	jbe .LBB1950_68
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm12, xmm0
	jbe .LBB1950_68
	vmovss xmm0, dword ptr [r9 + 4*r10 + 4]
	vaddss xmm15, xmm15, dword ptr [rip + .LCPI1950_2]
	vmovss xmm1, dword ptr [r12 + 4*rsi + 4]
	vinsertps xmm3, xmm8, xmm9, 16
	vinsertps xmm0, xmm3, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm26, xmm26, xmm0
.LBB1950_68:
	cmp r8d, 2
	je .LBB1950_87
	vmovss xmm8, dword ptr [rdi + 4*r13 + 8]
	vmovss xmm9, dword ptr [rcx + 4*rbx + 8]
	vsubss xmm10, xmm20, xmm8
	vsubss xmm11, xmm21, xmm9
	vmulss xmm0, xmm10, xmm10
	vmulss xmm1, xmm11, xmm11
	vaddss xmm12, xmm0, xmm1
	vucomiss xmm23, xmm12
	jbe .LBB1950_71
	vaddss xmm7, xmm10, xmm7
	vaddss xmm22, xmm22, xmm11
	jmp .LBB1950_74
.LBB1950_71:
	vmovaps xmm0, xmmword ptr [rsp + 32]
	vucomiss xmm0, xmm12
	jbe .LBB1950_74
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm12, xmm0
	jbe .LBB1950_74
	vmovss xmm0, dword ptr [r9 + 4*r10 + 8]
	vaddss xmm15, xmm15, dword ptr [rip + .LCPI1950_2]
	vmovss xmm1, dword ptr [r12 + 4*rsi + 8]
	vinsertps xmm3, xmm8, xmm9, 16
	vinsertps xmm0, xmm3, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm26, xmm26, xmm0
.LBB1950_74:
	cmp r8d, 3
	je .LBB1950_87
	vmovss xmm8, dword ptr [rdi + 4*r13 + 12]
	vmovss xmm9, dword ptr [rcx + 4*rbx + 12]
	vsubss xmm10, xmm20, xmm8
	vsubss xmm11, xmm21, xmm9
	vmulss xmm0, xmm10, xmm10
	vmulss xmm1, xmm11, xmm11
	vaddss xmm12, xmm0, xmm1
	vucomiss xmm23, xmm12
	jbe .LBB1950_77
	vaddss xmm7, xmm10, xmm7
	vaddss xmm22, xmm22, xmm11
	jmp .LBB1950_80
.LBB1950_77:
	vmovaps xmm0, xmmword ptr [rsp + 32]
	vucomiss xmm0, xmm12
	jbe .LBB1950_80
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm12, xmm0
	jbe .LBB1950_80
	vmovss xmm0, dword ptr [r9 + 4*r10 + 12]
	vaddss xmm15, xmm15, dword ptr [rip + .LCPI1950_2]
	vmovss xmm1, dword ptr [r12 + 4*rsi + 12]
	vinsertps xmm3, xmm8, xmm9, 16
	vinsertps xmm0, xmm3, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm26, xmm26, xmm0
.LBB1950_80:
	cmp r8d, 4
	je .LBB1950_87
	vmovss xmm8, dword ptr [rdi + 4*r13 + 16]
	vmovss xmm9, dword ptr [rcx + 4*rbx + 16]
	vsubss xmm10, xmm20, xmm8
	vsubss xmm11, xmm21, xmm9
	vmulss xmm0, xmm10, xmm10
	vmulss xmm1, xmm11, xmm11
	vaddss xmm12, xmm0, xmm1
	vucomiss xmm23, xmm12
	jbe .LBB1950_83
	vaddss xmm7, xmm10, xmm7
	vaddss xmm22, xmm22, xmm11
	jmp .LBB1950_86
.LBB1950_83:
	vmovaps xmm0, xmmword ptr [rsp + 32]
	vucomiss xmm0, xmm12
	jbe .LBB1950_86
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm12, xmm0
	jbe .LBB1950_86
	vmovss xmm0, dword ptr [r9 + 4*r10 + 16]
	vaddss xmm15, xmm15, dword ptr [rip + .LCPI1950_2]
	vmovss xmm1, dword ptr [r12 + 4*rsi + 16]
	vinsertps xmm3, xmm8, xmm9, 16
	vinsertps xmm0, xmm3, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm26, xmm26, xmm0
.LBB1950_86:
	cmp r8d, 5
	jne .LBB1950_91
	.p2align	4
.LBB1950_87:
	vinsertps xmm15, xmm15, xmm7, 16
.LBB1950_88:
	mov rax, qword ptr [rsp]
.LBB1950_89:
	mov rdi, qword ptr [rsp + 8]
.LBB1950_90:
	lea r14, [rax + 1]
	cmp rax, qword ptr [rsp + 240]
	jne .LBB1950_41
	jmp .LBB1950_105
.LBB1950_91:
	vmovss xmm8, dword ptr [rdi + 4*r13 + 20]
	vmovss xmm9, dword ptr [rcx + 4*rbx + 20]
	vsubss xmm10, xmm20, xmm8
	vsubss xmm11, xmm21, xmm9
	vmulss xmm0, xmm10, xmm10
	vmulss xmm1, xmm11, xmm11
	vaddss xmm12, xmm0, xmm1
	vucomiss xmm23, xmm12
	jbe .LBB1950_93
	vaddss xmm7, xmm10, xmm7
	vaddss xmm22, xmm22, xmm11
	jmp .LBB1950_96
.LBB1950_93:
	vmovaps xmm0, xmmword ptr [rsp + 32]
	vucomiss xmm0, xmm12
	jbe .LBB1950_96
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm12, xmm0
	jbe .LBB1950_96
	vmovss xmm0, dword ptr [r9 + 4*r10 + 20]
	vaddss xmm15, xmm15, dword ptr [rip + .LCPI1950_2]
	vmovss xmm1, dword ptr [r12 + 4*rsi + 20]
	vinsertps xmm3, xmm8, xmm9, 16
	vinsertps xmm0, xmm3, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm26, xmm26, xmm0
.LBB1950_96:
	vinsertps xmm8, xmm15, xmm7, 16
	cmp r8d, 6
	jne .LBB1950_98
	vmovaps xmm15, xmm8
	jmp .LBB1950_88
.LBB1950_98:
	vmovss xmm9, dword ptr [rdi + 4*r13 + 24]
	vmovss xmm10, dword ptr [rcx + 4*rbx + 24]
	mov rax, qword ptr [rsp]
	vsubss xmm11, xmm20, xmm9
	vsubss xmm12, xmm21, xmm10
	vmulss xmm0, xmm11, xmm11
	vmulss xmm1, xmm12, xmm12
	vaddss xmm13, xmm0, xmm1
	vucomiss xmm23, xmm13
	jbe .LBB1950_100
	vaddss xmm0, xmm11, xmm7
	vaddss xmm22, xmm22, xmm12
	vinsertps xmm15, xmm15, xmm0, 16
	jmp .LBB1950_89
.LBB1950_100:
	vmovaps xmm0, xmmword ptr [rsp + 32]
	mov rdi, qword ptr [rsp + 8]
	vucomiss xmm0, xmm13
	jbe .LBB1950_104
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm13, xmm0
	jbe .LBB1950_104
	vmovss xmm0, dword ptr [r9 + 4*r10 + 24]
	vmovss xmm1, dword ptr [r12 + 4*rsi + 24]
	vinsertps xmm3, xmm9, xmm10, 16
	vinsertps xmm0, xmm3, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm26, xmm26, xmm0
	vaddss xmm0, xmm15, dword ptr [rip + .LCPI1950_2]
	vmovss xmm15, xmm8, xmm0
	jmp .LBB1950_90
.LBB1950_104:
	vmovaps xmm15, xmm8
	jmp .LBB1950_90
.LBB1950_105:
	vmovaps xmmword ptr [rsp + 272], xmm26
	vmovlps qword ptr [rsp + 288], xmm15
	vmovss dword ptr [rsp + 296], xmm22
.LBB1950_106:
	vmovaps xmm0, xmmword ptr [rsp + 368]
	vmovdqa xmm1, xmmword ptr [rsp + 352]
	mov rsi, qword ptr [rsp + 192]
	lea rdi, [rsp + 128]
	lea rdx, [rsp + 256]
	lea rcx, [rsp + 112]
	lea r8, [rsp + 272]
	vzeroupper
	call swarm::rules::finish
	mov rdi, qword ptr [rsp + 200]
	cmp rdi, qword ptr [rsp + 176]
	jae .LBB1950_34
	vmovss xmm0, dword ptr [rsp + 128]
	vmovd xmm1, dword ptr [rsp + 132]
	mov rax, qword ptr [rsp + 168]
	mov rcx, qword ptr [rsp + 160]
	vmovss xmm2, dword ptr [rsp + 136]
	vmovss xmm3, dword ptr [rsp + 140]
	mov rdx, qword ptr [rsp + 152]
	vmovss dword ptr [rax + 4*rdi], xmm0
	vmovd dword ptr [rcx + 4*rdi], xmm1
	mov rcx, qword ptr [rsp + 144]
	vmovss dword ptr [rdx + 4*rdi], xmm2
	vmovss dword ptr [rcx + 4*rdi], xmm3
	jmp .LBB1950_34
.LBB1950_108:
	add rsp, 424
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
