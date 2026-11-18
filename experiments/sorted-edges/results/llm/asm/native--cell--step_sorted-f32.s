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
	mov qword ptr [rsp + 136], rax
	mov eax, dword ptr [rdi + 312]
	mov dword ptr [rsp + 248], eax
	mov rax, qword ptr [rdi + 304]
	add rdi, 192
	vmulss xmm1, xmm3, xmm0
	vmovaps xmmword ptr [rsp + 64], xmm2
	vmovaps xmmword ptr [rsp + 336], xmm3
	vcmpunordss k1, xmm1, xmm1
	vmaxss xmm1, xmm2, xmm1
	mov qword ptr [rsp + 240], rax
	vmovss xmm1 {k1}, xmm1, xmm2
	vmovshdup xmm2, xmm3
	vmulss xmm0, xmm2, xmm0
	vmovaps xmmword ptr [rsp + 320], xmm2
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
	mov rcx, rbx
	mov qword ptr [rbx + 112], 0
	mov qword ptr [rsp], rcx
	lea rbx, [r14 + 4*rax]
	lea rax, [rcx + 96]
	mov r13, r14
	mov qword ptr [rsp + 16], rax
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
	vmovd dword ptr [rax + 4*r15], xmm0
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
	vmovd xmm0, dword ptr [rbp + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1950_6
	jmp .LBB1950_8
.LBB1950_7:
	mov rdi, qword ptr [rsp + 16]
	mov edx, 1
	mov rsi, r15
	vmovd dword ptr [rsp + 8], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovd xmm0, dword ptr [rsp + 8]
	mov rcx, qword ptr [rsp]
	jmp .LBB1950_1
.LBB1950_8:
	mov r13, qword ptr [rcx + 32]
	mov r12, qword ptr [rcx + 40]
	lea rax, [rcx + 120]
	mov qword ptr [rcx + 136], 0
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
	cmp r15, qword ptr [rcx + 120]
	je .LBB1950_15
.LBB1950_9:
	mov rax, qword ptr [rcx + 128]
	vmovd dword ptr [rax + 4*r15], xmm0
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
	vmovd xmm0, dword ptr [r13 + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1950_14
	jmp .LBB1950_16
.LBB1950_15:
	mov rdi, qword ptr [rsp + 16]
	mov edx, 1
	mov rsi, r15
	vmovd dword ptr [rsp + 8], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovd xmm0, dword ptr [rsp + 8]
	mov rcx, qword ptr [rsp]
	jmp .LBB1950_9
.LBB1950_16:
	mov r13, qword ptr [rcx + 56]
	mov r12, qword ptr [rcx + 64]
	lea rax, [rcx + 144]
	mov qword ptr [rcx + 160], 0
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
	cmp r15, qword ptr [rcx + 144]
	je .LBB1950_23
.LBB1950_17:
	mov rax, qword ptr [rcx + 152]
	vmovd dword ptr [rax + 4*r15], xmm0
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
	vmovd xmm0, dword ptr [r13 + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1950_22
	jmp .LBB1950_24
.LBB1950_23:
	mov rdi, qword ptr [rsp + 16]
	mov edx, 1
	mov rsi, r15
	vmovd dword ptr [rsp + 8], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovd xmm0, dword ptr [rsp + 8]
	mov rcx, qword ptr [rsp]
	jmp .LBB1950_17
.LBB1950_24:
	mov r13, qword ptr [rcx + 80]
	mov r12, qword ptr [rcx + 88]
	lea rbp, [rcx + 168]
	xor r15d, r15d
	mov qword ptr [rcx + 184], 0
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
	vmovd dword ptr [rax + 4*r15], xmm0
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
	vmovd xmm0, dword ptr [r13 + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1950_30
	jmp .LBB1950_32
.LBB1950_31:
	mov edx, 1
	mov rdi, rbp
	mov rsi, r15
	vmovd dword ptr [rsp + 8], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovd xmm0, dword ptr [rsp + 8]
	mov rcx, qword ptr [rsp]
	jmp .LBB1950_25
.LBB1950_32:
	mov rdx, qword ptr [rcx + 56]
	vmovups zmm0, zmmword ptr [rcx + 96]
	vmovdqu64 zmm1, zmmword ptr [rcx]
	mov rax, qword ptr [rcx + 8]
	mov rdi, qword ptr [rcx + 32]
	mov rsi, qword ptr [rcx + 112]
	mov r8, qword ptr [rsp]
	mov qword ptr [rsp + 96], rdx
	mov rdx, qword ptr [rsp]
	mov qword ptr [rsp + 112], rax
	mov qword ptr [rsp + 104], rdi
	mov rdi, qword ptr [rsp]
	vmovups zmmword ptr [rcx], zmm0
	vmovdqu64 zmmword ptr [rcx + 96], zmm1
	mov rcx, qword ptr [rsp]
	mov rax, qword ptr [rdx + 64]
	mov rdx, qword ptr [rsp]
	vmovdqu ymm0, ymmword ptr [rdi + 64]
	mov rdi, qword ptr [rsp]
	mov rcx, qword ptr [rcx + 176]
	vmovups xmm2, xmmword ptr [rdx + 160]
	mov rdx, qword ptr [rsp]
	vmovups xmmword ptr [rdx + 64], xmm2
	mov rdx, qword ptr [r8 + 80]
	mov qword ptr [rdi + 80], rcx
	mov rcx, qword ptr [rsp]
	mov qword ptr [rcx + 88], r15
	mov qword ptr [rsp + 88], rdx
	vmovdqu ymmword ptr [rcx + 160], ymm0
	test rsi, rsi
	je .LBB1950_105
	vmovss xmm2, dword ptr [rcx + 320]
	vextracti128 xmm3, ymm1, 1
	vextracti32x4 xmm1, zmm1, 2
	vbroadcastss ymm26, dword ptr [rip + .LCPI1950_2]
	vpmovsxbd xmm28, dword ptr [rip + .LCPI1950_8]
	vpmovsxbd xmm29, dword ptr [rip + .LCPI1950_9]
	vextracti128 xmm0, ymm0, 1
	vxorps xmm25, xmm25, xmm25
	mov qword ptr [rsp + 128], rsi
	vmovq rdx, xmm3
	vpextrq rcx, xmm1, 1
	vpextrq rdi, xmm0, 1
	cmp rcx, rdx
	cmovb rdx, rcx
	mov rcx, qword ptr [rsp]
	cmp rax, rdx
	cmovb rdx, rax
	cmp rdi, rdx
	cmovb rdx, rdi
	vmulss xmm22, xmm2, xmm2
	vmovaps xmm2, xmmword ptr [rsp + 64]
	mov qword ptr [rsp + 120], rdx
	xor edx, edx
	vbroadcastss ymm0, xmm22
	vmovaps xmmword ptr [rsp + 304], xmm22
	vmovups ymmword ptr [rsp + 384], ymm0
	vmulss xmm23, xmm2, xmm2
	vbroadcastss ymm24, xmm23
	vmovaps xmmword ptr [rsp + 288], xmm23
	vmovups ymmword ptr [rsp + 352], ymm24
	jmp .LBB1950_36
.LBB1950_34:
	vmovaps xmm22, xmmword ptr [rsp + 304]
	vmovaps xmm23, xmmword ptr [rsp + 288]
	vmovups ymm24, ymmword ptr [rsp + 352]
	vbroadcastss ymm26, dword ptr [rip + .LCPI1950_2]
	vpmovsxbd xmm28, dword ptr [rip + .LCPI1950_8]
	vpmovsxbd xmm29, dword ptr [rip + .LCPI1950_9]
	mov rcx, qword ptr [rsp]
	mov rsi, qword ptr [rsp + 128]
	vxorps xmm25, xmm25, xmm25
	.p2align	4
.LBB1950_35:
	inc rdx
	cmp rdx, rsi
	je .LBB1950_105
.LBB1950_36:
	mov rax, qword ptr [rcx + 16]
	mov qword ptr [rsp + 16], rax
	cmp rdx, rax
	jae .LBB1950_35
	mov rax, qword ptr [rcx + 40]
	mov qword ptr [rsp + 64], rax
	cmp rdx, rax
	jae .LBB1950_35
	mov rax, qword ptr [rcx + 64]
	mov rcx, qword ptr [rcx + 88]
	cmp rdx, rax
	mov qword ptr [rsp + 232], rax
	mov qword ptr [rsp + 224], rcx
	setb al
	cmp rdx, rcx
	setb cl
	and cl, al
	cmp cl, 1
	mov rcx, qword ptr [rsp]
	jne .LBB1950_35
	mov rax, qword ptr [rcx + 8]
	mov rsi, qword ptr [rcx + 56]
	vmovsd xmm7, qword ptr [rip + .LCPI1950_4]
	vxorpd xmm5, xmm5, xmm5
	mov qword ptr [rsp + 144], rdx
	vmovss xmm6, dword ptr [rip + .LCPI1950_3]
	vpxor xmm1, xmm1, xmm1
	mov qword ptr [rsp + 216], rax
	vmovss xmm20, dword ptr [rax + 4*rdx]
	mov rax, qword ptr [rcx + 32]
	vmovss xmm2, dword ptr [rsi + 4*rdx]
	mov qword ptr [rsp + 200], rsi
	mov rsi, -1
	vmovss xmm21, dword ptr [rax + 4*rdx]
	mov qword ptr [rsp + 208], rax
	mov rax, qword ptr [rcx + 80]
	vmovss xmm3, dword ptr [rax + 4*rdx]
	vmovss dword ptr [rsp + 32], xmm20
	mov qword ptr [rsp + 192], rax
	mov rax, qword ptr [rcx + 264]
	mov edx, 0
	vmovdqu xmmword ptr [rsp + 268], xmm1
	vmovdqa xmmword ptr [rsp + 256], xmm1
	vmovss dword ptr [rsp + 36], xmm21
	vmovss dword ptr [rsp + 40], xmm2
	vmovss xmm2, dword ptr [rcx + 280]
	mov rcx, qword ptr [rcx + 272]
	mov qword ptr [rsp + 184], rax
	vmovss dword ptr [rsp + 44], xmm3
	vmulss xmm3, xmm20, xmm2
	vmulss xmm2, xmm21, xmm2
	vmaxss xmm3, xmm3, xmm25
	vmaxss xmm2, xmm2, xmm25
	vcvtss2sd xmm4, xmm3, xmm3
	vucomisd xmm4, xmm5
	vcvttsd2usi rdi, xmm4
	cmovb rdi, rdx
	vucomisd xmm4, xmm7
	cmova rdi, rsi
	sub rax, 1
	cmovb rax, rdx
	cmp rax, rdi
	cmovb rdi, rax
	vucomiss xmm3, xmm6
	vcvtss2sd xmm3, xmm7, xmm2
	vcvttsd2usi r8, xmm3
	cmovae rdi, rdx
	vucomisd xmm3, xmm5
	cmovb r8, rdx
	vucomisd xmm3, xmm7
	cmova r8, rsi
	sub rcx, 1
	mov rsi, rdi
	cmovb rcx, rdx
	cmp rcx, r8
	cmovb r8, rcx
	vucomiss xmm2, xmm6
	cmovae r8, rdx
	sub rsi, 1
	cmovb rsi, rdx
	mov r14, r8
	sub r14, 1
	cmovb r14, rdx
	inc r8
	mov qword ptr [rsp + 168], rsi
	cmp rcx, r8
	cmovb r8, rcx
	mov qword ptr [rsp + 176], r8
	cmp r14, r8
	ja .LBB1950_103
	mov rdx, qword ptr [rsp]
	inc rdi
	vbroadcastss ymm2, xmm21
	vbroadcastss ymm4, xmm20
	vxorps xmm6, xmm6, xmm6
	vxorps xmm27, xmm27, xmm27
	vxorps xmm3, xmm3, xmm3
	cmp rax, rdi
	cmovb rdi, rax
	inc rdi
	mov qword ptr [rsp + 24], rdi
	mov rcx, qword ptr [rdx + 200]
	mov rsi, qword ptr [rdx + 208]
	mov qword ptr [rsp + 152], rcx
	mov qword ptr [rsp + 160], rsi
	jmp .LBB1950_43
	.p2align	4
.LBB1950_59:
	vinsertps xmm6, xmm6, xmm7, 16
.LBB1950_42:
	mov rax, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 160]
	lea r14, [rax + 1]
	cmp rax, qword ptr [rsp + 176]
	je .LBB1950_102
.LBB1950_43:
	mov rax, qword ptr [rsp + 184]
	mov rcx, qword ptr [rsp + 168]
	mov qword ptr [rsp + 8], r14
	imul rax, r14
	add rcx, rax
	cmp rcx, rsi
	jae .LBB1950_46
	add rax, rdi
	mov r10d, 0
	mov edx, 0
	cmp rax, rsi
	jae .LBB1950_47
	mov rsi, qword ptr [rsp + 152]
	mov edx, dword ptr [rsi + 4*rcx]
	mov r10d, dword ptr [rsi + 4*rax]
	jmp .LBB1950_47
	.p2align	4
.LBB1950_46:
	xor r10d, r10d
	xor edx, edx
.LBB1950_47:
	mov r9, r10
	sub r9, rdx
	mov rcx, qword ptr [rsp + 216]
	mov ebp, 0
	mov r8d, 4
	mov rsi, qword ptr [rsp + 200]
	setb bl
	cmp r10, qword ptr [rsp + 16]
	mov r13, r9
	mov r14, r9
	lea r11, [rcx + 4*rdx]
	lea rsi, [rsi + 4*rdx]
	seta al
	or al, bl
	mov rax, r9
	cmovne rax, rbp
	cmovne r11, r8
	cmp r10, qword ptr [rsp + 64]
	seta cl
	or cl, bl
	mov rcx, qword ptr [rsp + 208]
	cmovne r13, rbp
	mov r15, r13
	lea rcx, [rcx + 4*rdx]
	cmovne rcx, r8
	shr r15, 3
	cmp r10, qword ptr [rsp + 232]
	seta dil
	or dil, bl
	cmovne r14, rbp
	cmovne rsi, r8
	mov rdi, r14
	shr rdi, 3
	cmp r10, qword ptr [rsp + 224]
	seta r10b
	or r10b, bl
	mov r10, qword ptr [rsp + 192]
	cmovne r9, rbp
	lea r12, [r10 + 4*rdx]
	mov rdx, rax
	mov r10, r9
	cmovne r12, r8
	shr rdx, 3
	shr r10, 3
	cmp r15, rdx
	cmovb rdx, r15
	cmp rdi, rdx
	cmovb rdx, rdi
	cmp r10, rdx
	cmovb rdx, r10
	test rdx, rdx
	je .LBB1950_51
	vmovups ymm5, ymmword ptr [rsp + 384]
	shl rdx, 5
	vmovaps xmm30, xmm3
	vxorps xmm7, xmm7, xmm7
	xor r10d, r10d
	vxorps xmm8, xmm8, xmm8
	vxorps xmm9, xmm9, xmm9
	vxorps xmm12, xmm12, xmm12
	vxorps xmm13, xmm13, xmm13
	vxorps xmm11, xmm11, xmm11
	vxorps xmm10, xmm10, xmm10
	vxorps xmm3, xmm3, xmm3
	.p2align	4
.LBB1950_49:
	vmovups ymm14, ymmword ptr [r11 + r10]
	vmovups ymm15, ymmword ptr [rcx + r10]
	vsubps ymm16, ymm4, ymm14
	vsubps ymm17, ymm2, ymm15
	vmulps ymm18, ymm16, ymm16
	vmulps ymm19, ymm17, ymm17
	vaddps ymm0, ymm18, ymm19
	vcmpltps ymm1, ymm0, ymm5
	vcmpleps k1, ymm5, ymm0
	vandps ymm1, ymm1, ymm26
	vcmpltps k1 {k1}, ymm0, ymm24
	vcmpltps ymm0, ymm3, ymm0
	vmulps ymm16, ymm16, ymm1
	vmulps ymm1, ymm17, ymm1
	vandps ymm0 {k1} {z}, ymm0, ymm26
	vaddps ymm9, ymm9, ymm0
	vaddps ymm8, ymm8, ymm16
	vmulps ymm16, ymm14, ymm0
	vmulps ymm14, ymm15, ymm0
	vmulps ymm15, ymm0, ymmword ptr [rsi + r10]
	vaddps ymm7, ymm7, ymm1
	vaddps ymm11, ymm14, ymm11
	vmulps ymm14, ymm0, ymmword ptr [r12 + r10]
	vaddps ymm10, ymm10, ymm16
	add r10, 32
	vaddps ymm13, ymm15, ymm13
	vaddps ymm12, ymm14, ymm12
	cmp rdx, r10
	jne .LBB1950_49
	vunpcklps xmm0, xmm10, xmm11
	vinsertps xmm1, xmm11, xmm10, 76
	vextractf128 xmm14, ymm10, 1
	vmovaps xmm3, xmm30
	vmovlhps xmm0, xmm0, xmm13
	vshufps xmm1, xmm1, xmm13, 212
	vinsertps xmm0, xmm0, xmm12, 48
	vinsertps xmm1, xmm1, xmm12, 112
	vaddps xmm0, xmm0, xmm1
	vunpckhps xmm1, xmm10, xmm11
	vmovsd xmm1, xmm13, xmm1
	vinsertps xmm1, xmm1, xmm12, 176
	vaddps xmm0, xmm0, xmm1
	vmovaps xmm1, xmm10
	vpermt2ps xmm1, xmm28, xmm11
	vpermt2ps ymm10, ymm29, ymm11
	vshufps xmm1, xmm1, xmm13, 244
	vextractf128 xmm13, ymm13, 1
	vblendps xmm1, xmm1, xmm12, 8
	vextractf128 xmm12, ymm12, 1
	vaddps xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm11, 1
	vunpcklps xmm15, xmm14, xmm1
	vmovlhps xmm15, xmm15, xmm13
	vinsertps xmm15, xmm15, xmm12, 48
	vaddps xmm0, xmm15, xmm0
	vinsertps xmm15, xmm1, xmm14, 76
	vunpckhps xmm1, xmm14, xmm1
	vshufps xmm15, xmm15, xmm13, 212
	vmovsd xmm1, xmm13, xmm1
	vinsertps xmm15, xmm15, xmm12, 112
	vinsertps xmm1, xmm1, xmm12, 176
	vaddps xmm0, xmm15, xmm0
	vaddps xmm0, xmm0, xmm1
	vshufps xmm1, xmm10, xmm13, 244
	vblendps xmm1, xmm1, xmm12, 8
	vaddps xmm10, xmm0, xmm1
	vhaddps xmm0, xmm9, xmm8
	vshufpd xmm1, xmm9, xmm9, 1
	vinsertps xmm1, xmm1, xmm8, 156
	vshufps xmm0, xmm0, xmm0, 232
	vaddps xmm0, xmm0, xmm1
	vshufpd xmm1, xmm8, xmm8, 1
	vinsertps xmm1, xmm1, xmm9, 204
	vaddps xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm8, 1
	vextractf128 xmm8, ymm9, 1
	vinsertps xmm9, xmm8, xmm1, 28
	vaddps xmm0, xmm9, xmm0
	vinsertps xmm9, xmm1, xmm8, 76
	vaddps xmm0, xmm9, xmm0
	vshufpd xmm9, xmm8, xmm8, 1
	vinsertps xmm9, xmm9, xmm1, 156
	vshufpd xmm1, xmm1, xmm1, 1
	vinsertps xmm1, xmm1, xmm8, 204
	vaddps xmm0, xmm9, xmm0
	vshufpd xmm9, xmm7, xmm7, 1
	vaddps xmm8, xmm0, xmm1
	vmovshdup xmm1, xmm7
	vextractf128 xmm0, ymm7, 1
	vaddss xmm1, xmm7, xmm1
	vshufps xmm7, xmm7, xmm7, 255
	vaddss xmm1, xmm9, xmm1
	vaddss xmm1, xmm1, xmm7
	vmovshdup xmm7, xmm0
	vaddss xmm1, xmm1, xmm0
	vaddss xmm1, xmm1, xmm7
	vshufpd xmm7, xmm0, xmm0, 1
	vshufps xmm0, xmm0, xmm0, 255
	vaddss xmm1, xmm1, xmm7
	vaddss xmm7, xmm1, xmm0
	jmp .LBB1950_52
	.p2align	4
.LBB1950_51:
	vxorps xmm10, xmm10, xmm10
	vxorps xmm7, xmm7, xmm7
	vxorps xmm8, xmm8, xmm8
.LBB1950_52:
	mov edi, r13d
	mov edx, eax
	and edi, 7
	and edx, 7
	mov r10d, r14d
	mov ebx, r9d
	and r10d, 7
	and ebx, 7
	vaddss xmm27, xmm27, xmm7
	vaddps xmm6, xmm8, xmm6
	vaddps xmm3, xmm10, xmm3
	cmp rdi, rdx
	cmovb rdx, rdi
	cmp r10, rdx
	cmovb rdx, r10
	cmp rbx, rdx
	cmovb rdx, rbx
	test rdx, rdx
	je .LBB1950_41
	and eax, -8
	and r13d, -8
	mov rdi, qword ptr [rsp + 24]
	and r14d, -8
	and r9d, -8
	vmovshdup xmm7, xmm6
	vmovss xmm8, dword ptr [r11 + 4*rax]
	vmovss xmm9, dword ptr [rcx + 4*r13]
	vsubss xmm10, xmm20, xmm8
	vsubss xmm11, xmm21, xmm9
	vmulss xmm0, xmm10, xmm10
	vmulss xmm1, xmm11, xmm11
	vaddss xmm12, xmm0, xmm1
	vucomiss xmm22, xmm12
	jbe .LBB1950_55
	vaddss xmm7, xmm10, xmm7
	vaddss xmm27, xmm27, xmm11
	jmp .LBB1950_58
	.p2align	4
.LBB1950_41:
	mov rdi, qword ptr [rsp + 24]
	jmp .LBB1950_42
	.p2align	4
.LBB1950_55:
	vucomiss xmm23, xmm12
	jbe .LBB1950_58
	vucomiss xmm12, xmm25
	jbe .LBB1950_58
	vmovss xmm0, dword ptr [rsi + 4*r14]
	vmovss xmm1, dword ptr [r12 + 4*r9]
	vaddss xmm6, xmm6, dword ptr [rip + .LCPI1950_2]
	vinsertps xmm8, xmm8, xmm9, 16
	vinsertps xmm0, xmm8, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm3, xmm3, xmm0
.LBB1950_58:
	cmp edx, 1
	je .LBB1950_59
	vmovss xmm8, dword ptr [r11 + 4*rax + 4]
	vmovss xmm9, dword ptr [rcx + 4*r13 + 4]
	vsubss xmm10, xmm20, xmm8
	vsubss xmm11, xmm21, xmm9
	vmulss xmm0, xmm10, xmm10
	vmulss xmm1, xmm11, xmm11
	vaddss xmm12, xmm0, xmm1
	vucomiss xmm22, xmm12
	jbe .LBB1950_62
	vaddss xmm7, xmm10, xmm7
	vaddss xmm27, xmm27, xmm11
	jmp .LBB1950_65
.LBB1950_62:
	vucomiss xmm23, xmm12
	jbe .LBB1950_65
	vucomiss xmm12, xmm25
	jbe .LBB1950_65
	vmovss xmm0, dword ptr [rsi + 4*r14 + 4]
	vaddss xmm6, xmm6, dword ptr [rip + .LCPI1950_2]
	vmovss xmm1, dword ptr [r12 + 4*r9 + 4]
	vinsertps xmm8, xmm8, xmm9, 16
	vinsertps xmm0, xmm8, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm3, xmm3, xmm0
.LBB1950_65:
	cmp edx, 2
	je .LBB1950_59
	vmovss xmm8, dword ptr [r11 + 4*rax + 8]
	vmovss xmm9, dword ptr [rcx + 4*r13 + 8]
	vsubss xmm10, xmm20, xmm8
	vsubss xmm11, xmm21, xmm9
	vmulss xmm0, xmm10, xmm10
	vmulss xmm1, xmm11, xmm11
	vaddss xmm12, xmm0, xmm1
	vucomiss xmm22, xmm12
	jbe .LBB1950_69
	vaddss xmm7, xmm10, xmm7
	vaddss xmm27, xmm27, xmm11
	jmp .LBB1950_72
.LBB1950_69:
	vucomiss xmm23, xmm12
	jbe .LBB1950_72
	vucomiss xmm12, xmm25
	jbe .LBB1950_72
	vmovss xmm0, dword ptr [rsi + 4*r14 + 8]
	vaddss xmm6, xmm6, dword ptr [rip + .LCPI1950_2]
	vmovss xmm1, dword ptr [r12 + 4*r9 + 8]
	vinsertps xmm8, xmm8, xmm9, 16
	vinsertps xmm0, xmm8, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm3, xmm3, xmm0
.LBB1950_72:
	cmp edx, 3
	je .LBB1950_59
	vmovss xmm8, dword ptr [r11 + 4*rax + 12]
	vmovss xmm9, dword ptr [rcx + 4*r13 + 12]
	vsubss xmm10, xmm20, xmm8
	vsubss xmm11, xmm21, xmm9
	vmulss xmm0, xmm10, xmm10
	vmulss xmm1, xmm11, xmm11
	vaddss xmm12, xmm0, xmm1
	vucomiss xmm22, xmm12
	jbe .LBB1950_76
	vaddss xmm7, xmm10, xmm7
	vaddss xmm27, xmm27, xmm11
	jmp .LBB1950_79
.LBB1950_76:
	vucomiss xmm23, xmm12
	jbe .LBB1950_79
	vucomiss xmm12, xmm25
	jbe .LBB1950_79
	vmovss xmm0, dword ptr [rsi + 4*r14 + 12]
	vaddss xmm6, xmm6, dword ptr [rip + .LCPI1950_2]
	vmovss xmm1, dword ptr [r12 + 4*r9 + 12]
	vinsertps xmm8, xmm8, xmm9, 16
	vinsertps xmm0, xmm8, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm3, xmm3, xmm0
.LBB1950_79:
	cmp edx, 4
	je .LBB1950_59
	vmovss xmm8, dword ptr [r11 + 4*rax + 16]
	vmovss xmm9, dword ptr [rcx + 4*r13 + 16]
	vsubss xmm10, xmm20, xmm8
	vsubss xmm11, xmm21, xmm9
	vmulss xmm0, xmm10, xmm10
	vmulss xmm1, xmm11, xmm11
	vaddss xmm12, xmm0, xmm1
	vucomiss xmm22, xmm12
	jbe .LBB1950_83
	vaddss xmm7, xmm10, xmm7
	vaddss xmm27, xmm27, xmm11
	jmp .LBB1950_86
.LBB1950_83:
	vucomiss xmm23, xmm12
	jbe .LBB1950_86
	vucomiss xmm12, xmm25
	jbe .LBB1950_86
	vmovss xmm0, dword ptr [rsi + 4*r14 + 16]
	vaddss xmm6, xmm6, dword ptr [rip + .LCPI1950_2]
	vmovss xmm1, dword ptr [r12 + 4*r9 + 16]
	vinsertps xmm8, xmm8, xmm9, 16
	vinsertps xmm0, xmm8, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm3, xmm3, xmm0
.LBB1950_86:
	cmp edx, 5
	je .LBB1950_59
	vmovss xmm8, dword ptr [r11 + 4*rax + 20]
	vmovss xmm9, dword ptr [rcx + 4*r13 + 20]
	vsubss xmm10, xmm20, xmm8
	vsubss xmm11, xmm21, xmm9
	vmulss xmm0, xmm10, xmm10
	vmulss xmm1, xmm11, xmm11
	vaddss xmm12, xmm0, xmm1
	vucomiss xmm22, xmm12
	jbe .LBB1950_90
	vaddss xmm7, xmm10, xmm7
	vaddss xmm27, xmm27, xmm11
	jmp .LBB1950_93
.LBB1950_90:
	vucomiss xmm23, xmm12
	jbe .LBB1950_93
	vucomiss xmm12, xmm25
	jbe .LBB1950_93
	vmovss xmm0, dword ptr [rsi + 4*r14 + 20]
	vaddss xmm6, xmm6, dword ptr [rip + .LCPI1950_2]
	vmovss xmm1, dword ptr [r12 + 4*r9 + 20]
	vinsertps xmm8, xmm8, xmm9, 16
	vinsertps xmm0, xmm8, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm3, xmm3, xmm0
.LBB1950_93:
	vinsertps xmm8, xmm6, xmm7, 16
	cmp edx, 6
	jne .LBB1950_95
.LBB1950_94:
	vmovaps xmm6, xmm8
	jmp .LBB1950_42
.LBB1950_95:
	vmovss xmm9, dword ptr [r11 + 4*rax + 24]
	vmovss xmm10, dword ptr [rcx + 4*r13 + 24]
	vsubss xmm11, xmm20, xmm9
	vsubss xmm12, xmm21, xmm10
	vmulss xmm0, xmm11, xmm11
	vmulss xmm1, xmm12, xmm12
	vaddss xmm13, xmm0, xmm1
	vucomiss xmm22, xmm13
	jbe .LBB1950_97
	vaddss xmm0, xmm11, xmm7
	vaddss xmm27, xmm27, xmm12
	vinsertps xmm6, xmm6, xmm0, 16
	jmp .LBB1950_42
.LBB1950_97:
	vucomiss xmm23, xmm13
	jbe .LBB1950_94
	vucomiss xmm13, xmm25
	jbe .LBB1950_94
	vmovss xmm0, dword ptr [rsi + 4*r14 + 24]
	vmovss xmm1, dword ptr [r12 + 4*r9 + 24]
	vinsertps xmm7, xmm9, xmm10, 16
	vinsertps xmm0, xmm7, xmm0, 32
	vinsertps xmm0, xmm0, xmm1, 48
	vaddps xmm3, xmm3, xmm0
	vaddss xmm0, xmm6, dword ptr [rip + .LCPI1950_2]
	vmovss xmm6, xmm8, xmm0
	jmp .LBB1950_42
.LBB1950_102:
	vmovaps xmmword ptr [rsp + 256], xmm3
	vmovlps qword ptr [rsp + 272], xmm6
	vmovss dword ptr [rsp + 280], xmm27
.LBB1950_103:
	vmovaps xmm0, xmmword ptr [rsp + 336]
	vmovdqa xmm1, xmmword ptr [rsp + 320]
	mov rsi, qword ptr [rsp + 136]
	lea rdi, [rsp + 48]
	lea rdx, [rsp + 240]
	lea rcx, [rsp + 32]
	lea r8, [rsp + 256]
	vzeroupper
	call swarm::rules::finish
	mov rdx, qword ptr [rsp + 144]
	cmp rdx, qword ptr [rsp + 120]
	jae .LBB1950_34
	vmovss xmm0, dword ptr [rsp + 48]
	vmovd xmm1, dword ptr [rsp + 52]
	mov rax, qword ptr [rsp + 112]
	mov rcx, qword ptr [rsp + 104]
	vmovss xmm2, dword ptr [rsp + 56]
	vmovss xmm3, dword ptr [rsp + 60]
	mov rsi, qword ptr [rsp + 96]
	vmovss dword ptr [rax + 4*rdx], xmm0
	vmovd dword ptr [rcx + 4*rdx], xmm1
	mov rcx, qword ptr [rsp + 88]
	vmovss dword ptr [rsi + 4*rdx], xmm2
	vmovss dword ptr [rcx + 4*rdx], xmm3
	jmp .LBB1950_34
.LBB1950_105:
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
