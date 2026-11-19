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
	sub rsp, 456
	.cfi_def_cfa_offset 512
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov rbx, rdi
	vmovsd xmm3, qword ptr [rbx + 288]
	vmovss xmm1, dword ptr [rip + .LCPI1950_0]
	vmovss xmm0, dword ptr [rbx + 316]
	lea rax, [rdi + 316]
	mov rsi, qword ptr [rbx + 8]
	mov rdx, qword ptr [rbx + 16]
	mov rcx, qword ptr [rbx + 32]
	mov r8, qword ptr [rbx + 40]
	xor r15d, r15d
	mov r9, -1
	mov qword ptr [rsp + 240], rax
	mov eax, dword ptr [rdi + 312]
	mov dword ptr [rsp + 312], eax
	mov rax, qword ptr [rdi + 304]
	add rdi, 192
	vmulss xmm2, xmm3, xmm1
	vmovaps xmmword ptr [rsp + 400], xmm3
	vcmpunordss k1, xmm2, xmm2
	vmaxss xmm2, xmm0, xmm2
	mov qword ptr [rsp + 304], rax
	vmovss xmm2 {k1}, xmm2, xmm0
	vmovshdup xmm0, xmm3
	vmovaps xmmword ptr [rsp + 384], xmm0
	vmulss xmm0, xmm0, xmm1
	vmaxss xmm1, xmm2, xmm0
	vcmpunordss k1, xmm0, xmm0
	vmovss xmm1 {k1}, xmm1, xmm2
	vmulss xmm0, xmm1, dword ptr [rip + .LCPI1950_1]
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
	mov qword ptr [rsp + 8], rcx
	lea rbx, [r14 + 4*rax]
	lea rax, [rcx + 96]
	mov r13, r14
	mov qword ptr [rsp + 32], rax
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
	mov rdi, qword ptr [rsp + 32]
	mov edx, 1
	mov rsi, r15
	vmovd dword ptr [rsp + 24], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovd xmm0, dword ptr [rsp + 24]
	mov rcx, qword ptr [rsp + 8]
	jmp .LBB1950_1
.LBB1950_8:
	mov r13, qword ptr [rcx + 32]
	mov r12, qword ptr [rcx + 40]
	lea rax, [rcx + 120]
	mov qword ptr [rcx + 136], 0
	xor r15d, r15d
	mov rbp, r14
	mov qword ptr [rsp + 32], rax
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
	mov rdi, qword ptr [rsp + 32]
	mov edx, 1
	mov rsi, r15
	vmovd dword ptr [rsp + 24], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovd xmm0, dword ptr [rsp + 24]
	mov rcx, qword ptr [rsp + 8]
	jmp .LBB1950_9
.LBB1950_16:
	mov r13, qword ptr [rcx + 56]
	mov r12, qword ptr [rcx + 64]
	lea rax, [rcx + 144]
	mov qword ptr [rcx + 160], 0
	xor r15d, r15d
	mov rbp, r14
	mov qword ptr [rsp + 32], rax
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
	mov rdi, qword ptr [rsp + 32]
	mov edx, 1
	mov rsi, r15
	vmovd dword ptr [rsp + 24], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovd xmm0, dword ptr [rsp + 24]
	mov rcx, qword ptr [rsp + 8]
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
	vmovd dword ptr [rsp + 24], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovd xmm0, dword ptr [rsp + 24]
	mov rcx, qword ptr [rsp + 8]
	jmp .LBB1950_25
.LBB1950_32:
	mov rdx, qword ptr [rcx + 56]
	vmovups zmm0, zmmword ptr [rcx + 96]
	vmovdqu64 zmm1, zmmword ptr [rcx]
	mov rax, qword ptr [rcx + 8]
	mov rdi, qword ptr [rcx + 32]
	mov rsi, qword ptr [rcx + 112]
	mov r8, qword ptr [rsp + 8]
	mov qword ptr [rsp + 200], rdx
	mov rdx, qword ptr [rsp + 8]
	mov qword ptr [rsp + 216], rax
	mov qword ptr [rsp + 208], rdi
	mov rdi, qword ptr [rsp + 8]
	vmovups zmmword ptr [rcx], zmm0
	vmovdqu64 zmmword ptr [rcx + 96], zmm1
	mov rcx, qword ptr [rsp + 8]
	mov rax, qword ptr [rdx + 64]
	mov rdx, qword ptr [rsp + 8]
	vmovdqu ymm0, ymmword ptr [rdi + 64]
	mov rdi, qword ptr [rsp + 8]
	mov rcx, qword ptr [rcx + 176]
	vmovups xmm2, xmmword ptr [rdx + 160]
	mov rdx, qword ptr [rsp + 8]
	vmovups xmmword ptr [rdx + 64], xmm2
	mov rdx, qword ptr [r8 + 80]
	mov qword ptr [rdi + 80], rcx
	mov rcx, qword ptr [rsp + 8]
	mov qword ptr [rcx + 88], r15
	mov qword ptr [rsp + 192], rdx
	vmovdqu ymmword ptr [rcx + 160], ymm0
	test rsi, rsi
	je .LBB1950_107
	vmovss xmm3, dword ptr [rcx + 320]
	vmovss xmm2, dword ptr [rcx + 316]
	vbroadcastss ymm29, dword ptr [rip + .LCPI1950_2]
	vextracti128 xmm0, ymm0, 1
	vxorps xmm28, xmm28, xmm28
	mov qword ptr [rsp + 232], rsi
	vpextrq r8, xmm0, 1
	vmulss xmm25, xmm3, xmm3
	vextracti128 xmm3, ymm1, 1
	vextracti32x4 xmm1, zmm1, 2
	vmulss xmm26, xmm2, xmm2
	vmovq rdx, xmm3
	vpextrq rcx, xmm1, 1
	cmp rcx, rdx
	cmovb rdx, rcx
	mov rcx, qword ptr [rsp + 8]
	vbroadcastss ymm27, xmm26
	vbroadcastss ymm13, xmm25
	vmovaps xmmword ptr [rsp + 368], xmm25
	vmovaps xmmword ptr [rsp + 352], xmm26
	cmp rax, rdx
	cmovb rdx, rax
	vmovups ymmword ptr [rsp + 80], ymm13
	vmovups ymmword ptr [rsp + 416], ymm27
	cmp r8, rdx
	cmovb rdx, r8
	xor edi, edi
	mov qword ptr [rsp + 224], rdx
	jmp .LBB1950_36
.LBB1950_34:
	vmovaps xmm25, xmmword ptr [rsp + 368]
	vmovaps xmm26, xmmword ptr [rsp + 352]
	vmovups ymm27, ymmword ptr [rsp + 416]
	vmovups ymm13, ymmword ptr [rsp + 80]
	vbroadcastss ymm29, dword ptr [rip + .LCPI1950_2]
	mov rcx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 232]
	vxorps xmm28, xmm28, xmm28
	.p2align	4
.LBB1950_35:
	inc rdi
	cmp rdi, rsi
	je .LBB1950_107
.LBB1950_36:
	mov r10, qword ptr [rcx + 16]
	cmp rdi, r10
	jae .LBB1950_35
	mov rax, qword ptr [rcx + 40]
	mov qword ptr [rsp + 168], rax
	cmp rdi, rax
	jae .LBB1950_35
	mov rax, qword ptr [rcx + 64]
	mov rdx, qword ptr [rcx + 88]
	cmp rdi, rax
	mov qword ptr [rsp + 120], rdx
	mov qword ptr [rsp + 128], rax
	setb cl
	cmp rdi, rdx
	setb dl
	and dl, cl
	mov rcx, qword ptr [rsp + 8]
	cmp dl, 1
	jne .LBB1950_35
	mov rax, qword ptr [rcx + 8]
	mov r8, qword ptr [rcx + 32]
	mov rdx, qword ptr [rcx + 56]
	mov rsi, qword ptr [rcx + 80]
	vmovsd xmm6, qword ptr [rip + .LCPI1950_4]
	vxorpd xmm7, xmm7, xmm7
	mov qword ptr [rsp + 248], rdi
	vmovss xmm30, dword ptr [rax + 4*rdi]
	vmovss xmm1, dword ptr [r8 + 4*rdi]
	vmovss xmm2, dword ptr [rdx + 4*rdi]
	vmovss xmm3, dword ptr [rsi + 4*rdi]
	mov qword ptr [rsp + 160], rax
	mov qword ptr [rsp + 152], r8
	mov eax, 0
	mov rdi, qword ptr [rcx + 264]
	mov qword ptr [rsp + 136], rsi
	mov rsi, -1
	mov qword ptr [rsp + 144], rdx
	mov rdx, qword ptr [rcx + 272]
	mov qword ptr [rsp + 296], rdi
	vmovss dword ptr [rsp + 176], xmm30
	vmovss dword ptr [rsp + 180], xmm1
	vmovss dword ptr [rsp + 184], xmm2
	vmovss dword ptr [rsp + 188], xmm3
	vmovss xmm3, dword ptr [rcx + 280]
	vxorps xmm2, xmm2, xmm2
	vmovups xmmword ptr [rsp + 60], xmm2
	vmovaps xmmword ptr [rsp + 48], xmm2
	vxorps xmm2, xmm2, xmm2
	mov rcx, rdi
	vmulss xmm4, xmm30, xmm3
	vmulss xmm3, xmm1, xmm3
	vmaxss xmm4, xmm4, xmm2
	vmaxss xmm3, xmm3, xmm2
	vcvtss2sd xmm5, xmm4, xmm4
	vucomisd xmm5, xmm7
	vcvttsd2usi r8, xmm5
	cmovb r8, rax
	vucomisd xmm5, xmm6
	vmovss xmm5, dword ptr [rip + .LCPI1950_3]
	cmova r8, rsi
	sub rcx, 1
	cmovb rcx, rax
	cmp rcx, r8
	cmovb r8, rcx
	vucomiss xmm4, xmm5
	vcvtss2sd xmm4, xmm3, xmm3
	vcvttsd2usi rdi, xmm4
	cmovae r8, rax
	vucomisd xmm4, xmm7
	cmovb rdi, rax
	vucomisd xmm4, xmm6
	vxorps xmm4, xmm4, xmm4
	cmova rdi, rsi
	sub rdx, 1
	mov rsi, r8
	cmovb rdx, rax
	cmp rdx, rdi
	cmovb rdi, rdx
	vucomiss xmm3, xmm5
	vxorps xmm5, xmm5, xmm5
	cmovae rdi, rax
	sub rsi, 1
	cmovb rsi, rax
	mov r14, rdi
	sub r14, 1
	cmovb r14, rax
	inc rdi
	mov qword ptr [rsp + 280], rsi
	cmp rdx, rdi
	cmovb rdi, rdx
	mov qword ptr [rsp + 288], rdi
	cmp r14, rdi
	ja .LBB1950_105
	mov rax, qword ptr [rsp + 128]
	mov rdx, qword ptr [rsp + 120]
	mov rsi, qword ptr [rsp + 168]
	inc r8
	vbroadcastss ymm11, xmm1
	vbroadcastss ymm12, xmm30
	vxorps xmm21, xmm21, xmm21
	vxorps xmm23, xmm23, xmm23
	vxorps xmm3, xmm3, xmm3
	vxorps xmm5, xmm5, xmm5
	vxorpd xmm6, xmm6, xmm6
	vxorps xmm9, xmm9, xmm9
	vxorps xmm10, xmm10, xmm10
	vxorps xmm8, xmm8, xmm8
	vxorpd xmm7, xmm7, xmm7
	vxorps xmm24, xmm24, xmm24
	vxorps xmm22, xmm22, xmm22
	vxorps xmm2, xmm2, xmm2
	mov qword ptr [rsp + 272], r10
	cmp rcx, r8
	cmovb r8, rcx
	cmp rax, rdx
	cmovb rdx, rax
	inc r8
	cmp rsi, rdx
	mov qword ptr [rsp + 16], r8
	cmovb rdx, rsi
	mov qword ptr [rsp + 256], rdx
	mov rdx, qword ptr [rsp + 8]
	mov rdi, qword ptr [rdx + 208]
	mov rcx, qword ptr [rdx + 200]
	mov qword ptr [rsp + 264], rcx
	mov qword ptr [rsp + 40], rdi
	jmp .LBB1950_45
	.p2align	4
.LBB1950_58:
	mov r8, qword ptr [rsp + 16]
.LBB1950_75:
	mov rdi, qword ptr [rsp + 40]
.LBB1950_44:
	mov r10, qword ptr [rsp + 272]
	lea r14, [r11 + 1]
	cmp r11, qword ptr [rsp + 288]
	je .LBB1950_104
.LBB1950_45:
	mov rcx, qword ptr [rsp + 296]
	mov rax, qword ptr [rsp + 280]
	mov qword ptr [rsp + 24], r14
	imul rcx, r14
	lea rsi, [rcx + rax]
	cmp rsi, rdi
	jae .LBB1950_48
	add rcx, r8
	mov r9d, 0
	mov edx, 0
	cmp rcx, rdi
	jae .LBB1950_49
	mov rax, qword ptr [rsp + 264]
	mov edx, dword ptr [rax + 4*rsi]
	mov r9d, dword ptr [rax + 4*rcx]
	jmp .LBB1950_49
	.p2align	4
.LBB1950_48:
	xor r9d, r9d
	xor edx, edx
.LBB1950_49:
	mov rax, qword ptr [rsp + 160]
	mov rbp, r9
	sub rbp, rdx
	mov r14, r10
	mov r15d, 0
	mov rsi, qword ptr [rsp + 144]
	setb dil
	cmp r9, r10
	mov r8, rbp
	mov rbx, rbp
	seta cl
	or cl, dil
	cmovne r8, r15
	lea r10, [rax + 4*rdx]
	mov eax, 4
	lea rsi, [rsi + 4*rdx]
	cmovne r10, rax
	cmp r9, qword ptr [rsp + 168]
	seta cl
	or cl, dil
	mov rcx, qword ptr [rsp + 152]
	cmovne rbx, r15
	mov qword ptr [rsp + 32], rbx
	lea rcx, [rcx + 4*rdx]
	cmovne rcx, rax
	shr rbx, 3
	cmp r9, qword ptr [rsp + 128]
	seta r11b
	or r11b, dil
	mov r11, rbp
	cmovne r11, r15
	cmovne rsi, rax
	mov r13, r11
	shr r11, 3
	cmp r9, qword ptr [rsp + 120]
	seta r12b
	or r12b, dil
	mov r12, qword ptr [rsp + 136]
	cmovne rbp, r15
	mov r15, r8
	mov rdi, rbp
	lea r12, [r12 + 4*rdx]
	cmovne r12, rax
	shr r8, 3
	shr rdi, 3
	cmp rbx, r8
	cmovb r8, rbx
	cmp r11, r8
	cmovb r8, r11
	cmp rdi, r8
	cmovb r8, rdi
	test r8, r8
	je .LBB1950_52
	shl r8, 5
	xor edi, edi
	.p2align	4
.LBB1950_51:
	vmovups ymm15, ymmword ptr [r10 + rdi]
	vmovups ymm16, ymmword ptr [rcx + rdi]
	vsubps ymm17, ymm12, ymm15
	vsubps ymm18, ymm11, ymm16
	vmulps ymm19, ymm17, ymm17
	vmulps ymm20, ymm18, ymm18
	vaddps ymm4, ymm19, ymm20
	vcmpleps k1, ymm13, ymm4
	vcmpltps ymm14, ymm4, ymm13
	vcmpltps k1 {k1}, ymm4, ymm27
	vcmpltps ymm4, ymm2, ymm4
	vandps ymm14, ymm14, ymm29
	vmulps ymm17, ymm17, ymm14
	vmulps ymm14, ymm18, ymm14
	vandps ymm4 {k1} {z}, ymm4, ymm29
	vmulps ymm0, ymm16, ymm4
	vaddps ymm6, ymm4, ymm6
	vaddps ymm5, ymm5, ymm17
	vmulps ymm17, ymm15, ymm4
	vmulps ymm15, ymm4, ymmword ptr [rsi + rdi]
	vaddps ymm3, ymm14, ymm3
	vaddps ymm8, ymm8, ymm0
	vmulps ymm0, ymm4, ymmword ptr [r12 + rdi]
	add rdi, 32
	vaddps ymm7, ymm7, ymm17
	vaddps ymm10, ymm15, ymm10
	vaddps ymm9, ymm9, ymm0
	cmp r8, rdi
	jne .LBB1950_51
.LBB1950_52:
	mov edx, r15d
	and edx, 7
	mov r11, r9
	sub r11, 8
	mov edi, 0
	cmovae rdi, r11
	test rdx, rdx
	je .LBB1950_55
	lea rbx, [rdi + 8]
	cmp rbx, r14
	ja .LBB1950_55
	cmp rbx, qword ptr [rsp + 256]
	jbe .LBB1950_65
	.p2align	4
.LBB1950_55:
	mov rbx, qword ptr [rsp + 32]
	mov r9d, r13d
	mov r11d, ebp
	and r9d, 7
	and r11d, 7
	mov edi, ebx
	and edi, 7
	cmp rdi, rdx
	cmovb rdx, rdi
	cmp r9, rdx
	cmovb rdx, r9
	cmp r11, rdx
	cmovb rdx, r11
	mov r11, qword ptr [rsp + 24]
	test rdx, rdx
	je .LBB1950_58
	and r15d, -8
	and ebx, -8
	mov rdi, qword ptr [rsp + 40]
	and r13d, -8
	and ebp, -8
	vmovss xmm15, dword ptr [r10 + 4*r15]
	vmovss xmm16, dword ptr [rcx + 4*rbx]
	vsubss xmm17, xmm30, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm2, xmm17, xmm17
	vmulss xmm4, xmm18, xmm18
	vaddss xmm19, xmm2, xmm4
	vucomiss xmm25, xmm19
	jbe .LBB1950_59
	vaddss xmm24, xmm24, xmm17
	vaddss xmm23, xmm23, xmm18
	jmp .LBB1950_62
	.p2align	4
.LBB1950_59:
	vucomiss xmm26, xmm19
	jbe .LBB1950_62
	vucomiss xmm19, xmm28
	jbe .LBB1950_62
	vmovss xmm2, dword ptr [rsi + 4*r13]
	vmovss xmm4, dword ptr [r12 + 4*rbp]
	vaddss xmm22, xmm22, dword ptr [rip + .LCPI1950_2]
	vinsertps xmm13, xmm15, xmm16, 16
	vinsertps xmm2, xmm13, xmm2, 32
	vmovups ymm13, ymmword ptr [rsp + 80]
	vinsertps xmm2, xmm2, xmm4, 48
	vaddps xmm21, xmm21, xmm2
.LBB1950_62:
	cmp edx, 1
	je .LBB1950_42
	vmovss xmm15, dword ptr [r10 + 4*r15 + 4]
	vmovss xmm16, dword ptr [rcx + 4*rbx + 4]
	vsubss xmm17, xmm30, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm2, xmm17, xmm17
	vmulss xmm4, xmm18, xmm18
	vaddss xmm19, xmm2, xmm4
	vucomiss xmm25, xmm19
	jbe .LBB1950_67
	vaddss xmm24, xmm24, xmm17
	vaddss xmm23, xmm23, xmm18
	jmp .LBB1950_70
.LBB1950_65:
	mov r11, qword ptr [rsp + 24]
	mov rcx, r9
	sub rcx, rdi
	cmp rcx, 8
	jne .LBB1950_73
	lea rax, [rip + swarm::rules::lanes::STEPS]
	lea rcx, [rax + 4*rdx + 224]
	jmp .LBB1950_74
.LBB1950_67:
	vucomiss xmm26, xmm19
	jbe .LBB1950_70
	vucomiss xmm19, xmm28
	jbe .LBB1950_70
	vmovss xmm2, dword ptr [rsi + 4*r13 + 4]
	vmovss xmm4, dword ptr [r12 + 4*rbp + 4]
	vaddss xmm22, xmm22, dword ptr [rip + .LCPI1950_2]
	vinsertps xmm13, xmm15, xmm16, 16
	vinsertps xmm2, xmm13, xmm2, 32
	vmovups ymm13, ymmword ptr [rsp + 80]
	vinsertps xmm2, xmm2, xmm4, 48
	vaddps xmm21, xmm21, xmm2
.LBB1950_70:
	cmp edx, 2
	je .LBB1950_42
	vmovss xmm15, dword ptr [r10 + 4*r15 + 8]
	vmovss xmm16, dword ptr [rcx + 4*rbx + 8]
	vsubss xmm17, xmm30, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm2, xmm17, xmm17
	vmulss xmm4, xmm18, xmm18
	vaddss xmm19, xmm2, xmm4
	vucomiss xmm25, xmm19
	jbe .LBB1950_76
	vaddss xmm24, xmm24, xmm17
	vaddss xmm23, xmm23, xmm18
	jmp .LBB1950_79
.LBB1950_73:
	vmovdqa64 zmm0, zmmword ptr [rip + .LCPI1950_6]
	vmovdqa64 zmm13, zmmword ptr [rip + .LCPI1950_7]
	vmovq xmm4, rdx
	vmovd xmm14, r9d
	sub rcx, rdx
	mov r8d, 1
	vpunpcklqdq xmm4, xmm4, xmm14
	vmovq xmm14, rdi
	cmp rcx, 2
	vpslldq xmm14, xmm14, 8
	setb al
	setbe dl
	cmp rcx, 4
	vpsubq xmm4, xmm4, xmm14
	setb sil
	vpermq zmm14, zmm0, zmm4
	vpermt2q zmm4, zmm13, zmmword ptr [rip + .LCPI1950_8]
	vpcmpeqq k0, zmm14, zmm4
	vpcmpnleuq k1, zmm14, zmm4
	vpmovm2d ymm4, k0
	vpmovm2d ymm14, k1
	vpblendd ymm4, ymm14, ymm4, 1
	vpbroadcastq ymm14, rcx
	vpcmpltuq k0, ymm14, ymmword ptr [rip + .LCPI1950_9]
	vmovd xmm14, r8d
	lea rcx, [rsp + 320]
	vpinsrb xmm14, xmm14, eax, 1
	vpinsrb xmm14, xmm14, edx, 2
	vpinsrb xmm14, xmm14, esi, 3
	vpmovzxbq zmm14, xmm14
	vptestmq k1, zmm14, qword ptr [rip + .LCPI1950_5]{1to8}
	kshiftlb k0, k0, 4
	kshiftlb k1, k1, 4
	kshiftrb k1, k1, 4
	korb k1, k1, k0
	vpcmpgtd k0 {k1}, ymm2, ymm4
	vpmovm2d ymm4, k0
	vpsrld ymm4, ymm4, 31
	vcvtdq2ps ymm4, ymm4
	vmovups ymmword ptr [rsp + 320], ymm4
.LBB1950_74:
	mov rax, qword ptr [rsp + 160]
	mov rdx, qword ptr [rsp + 152]
	vmovups ymm15, ymmword ptr [rcx]
	vpxor xmm0, xmm0, xmm0
	mov r8, qword ptr [rsp + 16]
	vmovups ymm4, ymmword ptr [rax + 4*rdi]
	vmovups ymm14, ymmword ptr [rdx + 4*rdi]
	mov rax, qword ptr [rsp + 144]
	vsubps ymm16, ymm12, ymm4
	vsubps ymm17, ymm11, ymm14
	vmulps ymm18, ymm16, ymm16
	vmulps ymm19, ymm17, ymm17
	vaddps ymm2, ymm18, ymm19
	vcmpgeps k1, ymm2, ymmword ptr [rsp + 80]
	vcmpltps ymm13, ymm2, ymmword ptr [rsp + 80]
	vcmpltps k1 {k1}, ymm2, ymm27
	vcmpltps ymm2, ymm0, ymm2
	vandps ymm13, ymm13, ymm29
	vmulps ymm13, ymm15, ymm13
	vandps ymm2 {k1} {z}, ymm2, ymm29
	vmulps ymm2, ymm15, ymm2
	vmulps ymm15, ymm16, ymm13
	vmulps ymm13, ymm17, ymm13
	vmulps ymm0, ymm14, ymm2
	vmulps ymm14, ymm2, ymmword ptr [rax + 4*rdi]
	mov rax, qword ptr [rsp + 136]
	vmulps ymm4, ymm4, ymm2
	vaddps ymm6, ymm2, ymm6
	vaddps ymm3, ymm13, ymm3
	vmovups ymm13, ymmword ptr [rsp + 80]
	vaddps ymm5, ymm15, ymm5
	vaddps ymm8, ymm8, ymm0
	vaddps ymm7, ymm7, ymm4
	vmulps ymm0, ymm2, ymmword ptr [rax + 4*rdi]
	vxorps xmm2, xmm2, xmm2
	vaddps ymm10, ymm14, ymm10
	vaddps ymm9, ymm9, ymm0
	jmp .LBB1950_75
.LBB1950_76:
	vucomiss xmm26, xmm19
	jbe .LBB1950_79
	vucomiss xmm19, xmm28
	jbe .LBB1950_79
	vmovss xmm2, dword ptr [rsi + 4*r13 + 8]
	vmovss xmm4, dword ptr [r12 + 4*rbp + 8]
	vaddss xmm22, xmm22, dword ptr [rip + .LCPI1950_2]
	vinsertps xmm13, xmm15, xmm16, 16
	vinsertps xmm2, xmm13, xmm2, 32
	vmovups ymm13, ymmword ptr [rsp + 80]
	vinsertps xmm2, xmm2, xmm4, 48
	vaddps xmm21, xmm21, xmm2
.LBB1950_79:
	cmp edx, 3
	je .LBB1950_42
	vmovss xmm15, dword ptr [r10 + 4*r15 + 12]
	vmovss xmm16, dword ptr [rcx + 4*rbx + 12]
	vsubss xmm17, xmm30, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm2, xmm17, xmm17
	vmulss xmm4, xmm18, xmm18
	vaddss xmm19, xmm2, xmm4
	vucomiss xmm25, xmm19
	jbe .LBB1950_82
	vaddss xmm24, xmm24, xmm17
	vaddss xmm23, xmm23, xmm18
	jmp .LBB1950_85
.LBB1950_82:
	vucomiss xmm26, xmm19
	jbe .LBB1950_85
	vucomiss xmm19, xmm28
	jbe .LBB1950_85
	vmovss xmm2, dword ptr [rsi + 4*r13 + 12]
	vmovss xmm4, dword ptr [r12 + 4*rbp + 12]
	vaddss xmm22, xmm22, dword ptr [rip + .LCPI1950_2]
	vinsertps xmm13, xmm15, xmm16, 16
	vinsertps xmm2, xmm13, xmm2, 32
	vmovups ymm13, ymmword ptr [rsp + 80]
	vinsertps xmm2, xmm2, xmm4, 48
	vaddps xmm21, xmm21, xmm2
.LBB1950_85:
	cmp edx, 4
	je .LBB1950_42
	vmovss xmm15, dword ptr [r10 + 4*r15 + 16]
	vmovss xmm16, dword ptr [rcx + 4*rbx + 16]
	vsubss xmm17, xmm30, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm2, xmm17, xmm17
	vmulss xmm4, xmm18, xmm18
	vaddss xmm19, xmm2, xmm4
	vucomiss xmm25, xmm19
	jbe .LBB1950_88
	vaddss xmm24, xmm24, xmm17
	vaddss xmm23, xmm23, xmm18
	jmp .LBB1950_91
.LBB1950_88:
	vucomiss xmm26, xmm19
	jbe .LBB1950_91
	vucomiss xmm19, xmm28
	jbe .LBB1950_91
	vmovss xmm2, dword ptr [rsi + 4*r13 + 16]
	vmovss xmm4, dword ptr [r12 + 4*rbp + 16]
	vaddss xmm22, xmm22, dword ptr [rip + .LCPI1950_2]
	vinsertps xmm13, xmm15, xmm16, 16
	vinsertps xmm2, xmm13, xmm2, 32
	vmovups ymm13, ymmword ptr [rsp + 80]
	vinsertps xmm2, xmm2, xmm4, 48
	vaddps xmm21, xmm21, xmm2
.LBB1950_91:
	cmp edx, 5
	je .LBB1950_42
	vmovss xmm15, dword ptr [r10 + 4*r15 + 20]
	vmovss xmm16, dword ptr [rcx + 4*rbx + 20]
	vsubss xmm17, xmm30, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm2, xmm17, xmm17
	vmulss xmm4, xmm18, xmm18
	vaddss xmm19, xmm2, xmm4
	vucomiss xmm25, xmm19
	jbe .LBB1950_94
	vaddss xmm24, xmm24, xmm17
	vaddss xmm23, xmm23, xmm18
	jmp .LBB1950_97
.LBB1950_94:
	vucomiss xmm26, xmm19
	jbe .LBB1950_97
	vucomiss xmm19, xmm28
	jbe .LBB1950_97
	vmovss xmm2, dword ptr [rsi + 4*r13 + 20]
	vmovss xmm4, dword ptr [r12 + 4*rbp + 20]
	vaddss xmm22, xmm22, dword ptr [rip + .LCPI1950_2]
	vinsertps xmm13, xmm15, xmm16, 16
	vinsertps xmm2, xmm13, xmm2, 32
	vmovups ymm13, ymmword ptr [rsp + 80]
	vinsertps xmm2, xmm2, xmm4, 48
	vaddps xmm21, xmm21, xmm2
.LBB1950_97:
	cmp edx, 6
	je .LBB1950_42
	vmovss xmm15, dword ptr [r10 + 4*r15 + 24]
	vmovss xmm16, dword ptr [rcx + 4*rbx + 24]
	vsubss xmm17, xmm30, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm2, xmm17, xmm17
	vmulss xmm4, xmm18, xmm18
	vaddss xmm19, xmm2, xmm4
	vucomiss xmm25, xmm19
	jbe .LBB1950_99
	vaddss xmm24, xmm24, xmm17
	vaddss xmm23, xmm23, xmm18
	.p2align	4
.LBB1950_42:
	mov r8, qword ptr [rsp + 16]
.LBB1950_43:
	vxorps xmm2, xmm2, xmm2
	jmp .LBB1950_44
.LBB1950_99:
	vucomiss xmm26, xmm19
	vxorps xmm2, xmm2, xmm2
	jbe .LBB1950_103
	vucomiss xmm19, xmm28
	jbe .LBB1950_103
	vmovss xmm2, dword ptr [rsi + 4*r13 + 24]
	vmovss xmm4, dword ptr [r12 + 4*rbp + 24]
	vaddss xmm22, xmm22, dword ptr [rip + .LCPI1950_2]
	vinsertps xmm13, xmm15, xmm16, 16
	mov r8, qword ptr [rsp + 16]
	vinsertps xmm2, xmm13, xmm2, 32
	vmovups ymm13, ymmword ptr [rsp + 80]
	vinsertps xmm2, xmm2, xmm4, 48
	vaddps xmm21, xmm21, xmm2
	jmp .LBB1950_43
.LBB1950_103:
	mov r8, qword ptr [rsp + 16]
	jmp .LBB1950_44
.LBB1950_104:
	vpmovsxbd xmm2, dword ptr [rip + .LCPI1950_12]
	vunpcklps xmm0, xmm7, xmm8
	vinsertps xmm1, xmm8, xmm7, 76
	vmovaps xmmword ptr [rsp + 48], xmm21
	vmovss dword ptr [rsp + 64], xmm22
	vmovss dword ptr [rsp + 68], xmm24
	vmovss dword ptr [rsp + 72], xmm23
	vmovlhps xmm0, xmm0, xmm10
	vshufps xmm1, xmm1, xmm10, 212
	vinsertps xmm0, xmm0, xmm9, 48
	vinsertps xmm1, xmm1, xmm9, 112
	vaddps xmm0, xmm0, xmm1
	vunpckhps xmm1, xmm7, xmm8
	vmovsd xmm1, xmm10, xmm1
	vinsertps xmm1, xmm1, xmm9, 176
	vaddps xmm0, xmm0, xmm1
	vmovaps xmm1, xmm7
	vpermt2ps xmm1, xmm2, xmm8
	vextractf128 xmm2, ymm7, 1
	vshufps xmm1, xmm1, xmm10, 244
	vextractf128 xmm10, ymm10, 1
	vblendps xmm1, xmm1, xmm9, 8
	vextractf128 xmm9, ymm9, 1
	vaddps xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm8, 1
	vunpcklps xmm4, xmm2, xmm1
	vmovlhps xmm4, xmm4, xmm10
	vinsertps xmm4, xmm4, xmm9, 48
	vaddps xmm0, xmm0, xmm4
	vinsertps xmm4, xmm1, xmm2, 76
	vunpckhps xmm1, xmm2, xmm1
	vshufpd xmm2, xmm6, xmm6, 1
	vshufps xmm4, xmm4, xmm10, 212
	vmovsd xmm1, xmm10, xmm1
	vinsertps xmm2, xmm2, xmm5, 156
	vinsertps xmm4, xmm4, xmm9, 112
	vinsertps xmm1, xmm1, xmm9, 176
	vaddps xmm0, xmm0, xmm4
	vextractf128 xmm4, ymm6, 1
	vaddps xmm0, xmm0, xmm1
	vpmovsxbd xmm1, dword ptr [rip + .LCPI1950_13]
	vpermt2ps ymm7, ymm1, ymm8
	vshufps xmm1, xmm7, xmm10, 244
	vblendps xmm1, xmm1, xmm9, 8
	vaddps xmm0, xmm0, xmm1
	vhaddps xmm1, xmm6, xmm5
	vshufps xmm1, xmm1, xmm1, 232
	vaddps xmm1, xmm1, xmm2
	vshufpd xmm2, xmm5, xmm5, 1
	vinsertps xmm2, xmm2, xmm6, 204
	vaddps xmm1, xmm1, xmm2
	vextractf128 xmm2, ymm5, 1
	vinsertps xmm5, xmm4, xmm2, 28
	vaddps xmm1, xmm1, xmm5
	vinsertps xmm5, xmm2, xmm4, 76
	vaddps xmm1, xmm1, xmm5
	vshufpd xmm5, xmm4, xmm4, 1
	vinsertps xmm5, xmm5, xmm2, 156
	vshufpd xmm2, xmm2, xmm2, 1
	vinsertps xmm2, xmm2, xmm4, 204
	vaddps xmm4, xmm0, xmm21
	vmovshdup xmm0, xmm3
	vaddps xmm1, xmm1, xmm5
	vaddss xmm0, xmm3, xmm0
	vaddps xmm1, xmm1, xmm2
	vmovsd xmm2, qword ptr [rsp + 64]
	vaddps xmm5, xmm1, xmm2
	vshufpd xmm1, xmm3, xmm3, 1
	vaddss xmm0, xmm0, xmm1
	vshufps xmm1, xmm3, xmm3, 255
	vaddss xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm3, 1
	vmovshdup xmm2, xmm1
	vaddss xmm0, xmm0, xmm1
	vaddss xmm0, xmm0, xmm2
	vshufpd xmm2, xmm1, xmm1, 1
	vshufps xmm1, xmm1, xmm1, 255
	vaddss xmm0, xmm0, xmm2
	vaddss xmm0, xmm0, xmm1
	vaddss xmm2, xmm0, xmm23
.LBB1950_105:
	vmovaps xmm0, xmmword ptr [rsp + 400]
	vmovdqa xmm1, xmmword ptr [rsp + 384]
	mov rsi, qword ptr [rsp + 240]
	lea rdi, [rsp + 320]
	lea rdx, [rsp + 304]
	lea rcx, [rsp + 176]
	lea r8, [rsp + 48]
	vmovaps xmmword ptr [rsp + 48], xmm4
	vmovlps qword ptr [rsp + 64], xmm5
	vmovss dword ptr [rsp + 72], xmm2
	vzeroupper
	call swarm::rules::finish
	mov rdi, qword ptr [rsp + 248]
	cmp rdi, qword ptr [rsp + 224]
	jae .LBB1950_34
	vmovss xmm0, dword ptr [rsp + 320]
	vmovd xmm1, dword ptr [rsp + 324]
	mov rax, qword ptr [rsp + 216]
	mov rcx, qword ptr [rsp + 208]
	vmovss xmm2, dword ptr [rsp + 328]
	vmovss xmm3, dword ptr [rsp + 332]
	mov rdx, qword ptr [rsp + 200]
	vmovss dword ptr [rax + 4*rdi], xmm0
	vmovd dword ptr [rcx + 4*rdi], xmm1
	mov rcx, qword ptr [rsp + 192]
	vmovss dword ptr [rdx + 4*rdi], xmm2
	vmovss dword ptr [rcx + 4*rdi], xmm3
	jmp .LBB1950_34
.LBB1950_107:
	add rsp, 456
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
