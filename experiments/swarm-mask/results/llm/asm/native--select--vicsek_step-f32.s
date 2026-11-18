
    Finished `release` profile [optimized] target(s) in 0.01s
.section .text.<criterion::bencher::Bencher>::iter_batched_ref::<swarm::vicsek::Vicsek, (), step::models::{closure#0}::{closure#1}, <swarm::vicsek::Vicsek>::step>,"ax",@progbits
	.prefalign	4, .Lfunc_end6, nop
.type	<criterion::bencher::Bencher>::iter_batched_ref::<swarm::vicsek::Vicsek, (), step::models::{closure#0}::{closure#1}, <swarm::vicsek::Vicsek>::step>,@function
<criterion::bencher::Bencher>::iter_batched_ref::<swarm::vicsek::Vicsek, (), step::models::{closure#0}::{closure#1}, <swarm::vicsek::Vicsek>::step>:
	.cfi_startproc
	.cfi_personality 155, DW.ref.rust_eh_personality
	.cfi_lsda 27, .Lexception4
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
	sub rsp, 1112
	.cfi_def_cfa_offset 1168
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov byte ptr [rdi + 48], 1
	mov qword ptr [rsp + 24], rsi
	movabs rcx, 2361183241434822607
	mov rsi, qword ptr [rdi + 40]
	lea rax, [rsi + 999]
	mov rdx, rax
	shr rdx, 3
	mulx rcx, rcx, rcx
	mov qword ptr [rsp + 72], rcx
	cmp rax, 999
	jbe .LBB6_70
	mov rbx, rdi
	mov edi, 1
	mov qword ptr [rsp + 80], rsi
	call <std::sys::pal::unix::time::Timespec>::now
	mov r15, qword ptr [rsp + 80]
	mov qword ptr [rsp + 120], rax
	mov qword ptr [rbx], 0
	mov dword ptr [rsp + 64], edx
	mov qword ptr [rsp + 32], rbx
	mov dword ptr [rbx + 8], 0
	lea rax, [r15 - 1]
	cmp rax, 1000
	jae .LBB6_2
	mov rax, qword ptr [rsp + 24]
	lea r14, [rsp + 672]
	xor ebp, ebp
	xor ebx, ebx
	lea rcx, [rax + 96]
	vmovss xmm0, dword ptr [rax + 312]
	vmovups xmm1, xmmword ptr [rax + 288]
	mov qword ptr [rsp + 56], rcx
	mov rcx, qword ptr [rax + 304]
	mov qword ptr [rsp + 40], rcx
	movzx ecx, byte ptr [rax + 328]
	vmovss dword ptr [rsp + 20], xmm0
	vmovaps xmmword ptr [rsp + 96], xmm1
	mov byte ptr [rsp + 4], cl
	lea rcx, [rax + 192]
	add rax, 316
	mov qword ptr [rsp + 48], rcx
	mov qword ptr [rsp + 8], rax
	jmp .LBB6_6
	.p2align	4
.LBB6_23:
	inc r12
	add ebp, -1000000000
.LBB6_24:
	mov rax, qword ptr [rsp + 32]
	lea rdi, [rsp + 336]
	mov qword ptr [rax], r12
	mov dword ptr [rax + 8], ebp
	#APP
	#NO_APP
	vmovups zmm0, zmmword ptr [rsp + 944]
	vmovups zmm1, zmmword ptr [rsp + 928]
	vmovups zmm4, zmmword ptr [rsp + 672]
	vmovups zmm2, zmmword ptr [rsp + 800]
	vmovups zmm3, zmmword ptr [rsp + 864]
	vmovups zmmword ptr [rsp + 608], zmm0
	vmovups zmmword ptr [rsp + 592], zmm1
	vmovups zmm1, zmmword ptr [rsp + 736]
	vmovups zmmword ptr [rsp + 528], zmm3
	vmovups zmmword ptr [rsp + 464], zmm2
	vmovups zmmword ptr [rsp + 336], zmm4
	vmovups zmmword ptr [rsp + 400], zmm1
	#APP
	#NO_APP
	vzeroupper
	call core::ptr::drop_glue::<swarm::vicsek::Vicsek>
	dec r15
	mov rbx, r12
	je .LBB6_67
.LBB6_6:
	mov rsi, qword ptr [rsp + 24]
	lea rdi, [rsp + 1016]
	call <swarm::flock::Boids as core::clone::Clone>::clone
	mov rsi, qword ptr [rsp + 56]
	lea rdi, [rsp + 240]
	call <swarm::flock::Boids as core::clone::Clone>::clone
	mov rsi, qword ptr [rsp + 48]
	lea rdi, [rsp + 144]
	call <swarm::grid::Grid as core::clone::Clone>::clone
	vmovups zmm1, zmmword ptr [rsp + 1048]
	vmovups zmm0, zmmword ptr [rsp + 1016]
	mov rcx, qword ptr [rsp + 8]
	vmovups zmm2, zmmword ptr [rsp + 176]
	lea rdx, [rsp + 988]
	mov eax, dword ptr [rcx + 8]
	mov rsi, qword ptr [rcx]
	lea rcx, [rsp + 432]
	vmovups zmmword ptr [rsp + 368], zmm1
	vmovups zmmword ptr [rsp + 336], zmm0
	vmovups zmm1, zmmword ptr [rsp + 272]
	vmovups zmm0, zmmword ptr [rsp + 240]
	mov dword ptr [rdx + 8], eax
	mov qword ptr [rdx], rsi
	mov rax, qword ptr [rsp + 40]
	vmovups zmmword ptr [rcx + 32], zmm1
	vmovups zmmword ptr [rcx], zmm0
	vmovups zmm0, zmmword ptr [rsp + 144]
	vmovups zmmword ptr [rcx + 128], zmm2
	vmovups zmmword ptr [rcx + 96], zmm0
	vmovups zmm2, zmmword ptr [rsp + 464]
	vmovups zmm3, zmmword ptr [rsp + 528]
	vmovups zmm1, zmmword ptr [rsp + 400]
	vmovups zmm0, zmmword ptr [rsp + 336]
	vmovups zmmword ptr [rsp + 800], zmm2
	vmovups zmmword ptr [rsp + 864], zmm3
	vmovups zmm3, zmmword ptr [rsp + 560]
	vmovaps xmm2, xmmword ptr [rsp + 96]
	vmovups zmmword ptr [rsp + 736], zmm1
	vmovss xmm1, dword ptr [rsp + 20]
	vmovups zmmword ptr [rsp + 672], zmm0
	vmovups zmmword ptr [rsp + 896], zmm3
	vmovaps xmmword ptr [rsp + 960], xmm2
	mov qword ptr [rsp + 976], rax
	movzx eax, byte ptr [rsp + 4]
	vmovss dword ptr [rsp + 984], xmm1
	mov byte ptr [rsp + 1000], al
	#APP
	#NO_APP
	mov edi, 1
	vzeroupper
	call <std::sys::pal::unix::time::Timespec>::now
	mov rdi, r14
	mov r12, rax
	mov r13d, edx
	call <swarm::vicsek::Vicsek>::step
	mov edi, 1
	call <std::sys::pal::unix::time::Timespec>::now
	mov qword ptr [rsp + 240], rax
	mov qword ptr [rsp + 144], r12
	mov dword ptr [rsp + 248], edx
	mov dword ptr [rsp + 152], r13d
	lea rdi, [rsp + 336]
	lea rsi, [rsp + 240]
	lea rdx, [rsp + 144]
	call <std::sys::pal::unix::time::Timespec>::sub_timespec
	movzx eax, byte ptr [rsp + 336]
	test al, al
	jne .LBB6_13
	mov r12, qword ptr [rsp + 344]
	jmp .LBB6_20
	.p2align	4
.LBB6_13:
	xor r12d, r12d
.LBB6_20:
	add r12, rbx
	jb .LBB6_25
	mov edx, dword ptr [rsp + 352]
	test al, al
	mov ecx, 0
	cmovne edx, ecx
	add ebp, edx
	cmp ebp, 1000000000
	jb .LBB6_24
	cmp r12, -1
	jne .LBB6_23
.LBB6_25:
	lea rdi, [rip + .Lanon.094e8a2080f91d241e8a345b3139da00.691]
	lea rdx, [rip + .Lanon.094e8a2080f91d241e8a345b3139da00.692]
	mov esi, 30
	call core::option::expect_failed
	jmp .LBB6_26
.LBB6_2:
	mov rax, qword ptr [rsp + 24]
	shr qword ptr [rsp + 72], 4
	lea rbp, [rsp + 432]
	mov qword ptr [rsp + 88], 0
	xor edx, edx
	vmovss xmm0, dword ptr [rax + 312]
	vmovups xmm1, xmmword ptr [rax + 288]
	lea rcx, [rax + 96]
	movzx r13d, byte ptr [rax + 328]
	lea r14, [rax + 316]
	mov qword ptr [rsp + 56], rcx
	mov rcx, qword ptr [rax + 304]
	mov qword ptr [rsp + 40], rcx
	lea rcx, [rax + 192]
	mov qword ptr [rsp + 48], rcx
	xor ecx, ecx
	vmovss dword ptr [rsp + 20], xmm0
	vmovaps xmmword ptr [rsp + 96], xmm1
	jmp .LBB6_3
	.p2align	4
.LBB6_66:
	mov rdx, qword ptr [rsp + 128]
	mov r15, qword ptr [rsp + 80]
	mov ecx, dword ptr [rsp + 4]
	add rdx, rbx
	cmp rdx, r15
	jae .LBB6_67
.LBB6_3:
	mov rax, qword ptr [rsp + 72]
	mov rbx, r15
	sub rbx, rdx
	mov dword ptr [rsp + 4], ecx
	mov qword ptr [rsp + 128], rdx
	cmp rbx, rax
	cmovae rbx, rax
	cmp r15, rdx
	jne .LBB6_30
	mov r12d, 8
	xor eax, eax
	jmp .LBB6_31
	.p2align	4
.LBB6_30:
	mov rax, qword ptr [rip + malloc@GOTPCREL]
	imul r15, rbx, 336
	mov rdi, r15
	call rax
	mov r12, rax
	mov rax, rbx
	test r12, r12
	je .LBB6_71
.LBB6_31:
	mov qword ptr [rsp + 1016], rax
	mov qword ptr [rsp + 1024], r12
	add r12, 328
	xor r15d, r15d
	.p2align	4
.LBB6_32:
	mov rsi, qword ptr [rsp + 24]
	lea rdi, [rsp + 240]
	vzeroupper
	call <swarm::flock::Boids as core::clone::Clone>::clone
	mov rsi, qword ptr [rsp + 56]
	lea rdi, [rsp + 144]
	call <swarm::flock::Boids as core::clone::Clone>::clone
	mov rsi, qword ptr [rsp + 48]
	lea rdi, [rsp + 672]
	call <swarm::grid::Grid as core::clone::Clone>::clone
	vmovups zmm1, zmmword ptr [rsp + 272]
	vmovups zmm0, zmmword ptr [rsp + 240]
	vmovups zmm3, zmmword ptr [rsp + 176]
	vmovups zmm2, zmmword ptr [rsp + 704]
	mov rax, qword ptr [rsp + 40]
	inc r15
	vmovups zmmword ptr [rsp + 368], zmm1
	vmovups zmmword ptr [rsp + 336], zmm0
	vmovups zmm0, zmmword ptr [rsp + 144]
	vmovups zmmword ptr [rbp + 32], zmm3
	vmovups zmmword ptr [rbp], zmm0
	vmovups zmm0, zmmword ptr [rsp + 672]
	vmovups zmmword ptr [rbp + 128], zmm2
	vmovups zmmword ptr [rbp + 96], zmm0
	vmovups zmm0, zmmword ptr [rsp + 560]
	vmovups zmmword ptr [r12 - 104], zmm0
	vmovups zmm1, zmmword ptr [rsp + 400]
	vmovups zmm2, zmmword ptr [rsp + 464]
	vmovups zmm0, zmmword ptr [rsp + 336]
	vmovups zmm3, zmmword ptr [rsp + 528]
	vmovups zmmword ptr [r12 - 200], zmm2
	vmovups zmmword ptr [r12 - 264], zmm1
	vmovaps xmm2, xmmword ptr [rsp + 96]
	vmovss xmm1, dword ptr [rsp + 20]
	vmovups zmmword ptr [r12 - 136], zmm3
	vmovups zmmword ptr [r12 - 328], zmm0
	vmovups xmmword ptr [r12 - 40], xmm2
	mov qword ptr [r12 - 24], rax
	vmovss dword ptr [r12 - 16], xmm1
	mov rax, qword ptr [r14]
	mov qword ptr [r12 - 12], rax
	mov eax, dword ptr [r14 + 8]
	mov dword ptr [r12 - 4], eax
	mov byte ptr [r12], r13b
	add r12, 336
	cmp rbx, r15
	jne .LBB6_32
	vmovups xmm0, xmmword ptr [rsp + 1016]
	mov qword ptr [rsp + 688], rbx
	lea rax, [rsp + 672]
	vmovaps xmmword ptr [rsp + 672], xmm0
	#APP
	#NO_APP
	mov edi, 1
	vzeroupper
	call <std::sys::pal::unix::time::Timespec>::now
	mov qword ptr [rsp + 136], rax
	mov dword ptr [rsp + 68], edx
	mov rax, qword ptr [rsp + 688]
	mov qword ptr [rsp + 8], rax
	test rax, rax
	je .LBB6_41
	mov r15, qword ptr [rsp + 680]
	mov r12, qword ptr [rsp + 8]
	.p2align	4
.LBB6_39:
	mov rdi, r15
	call <swarm::vicsek::Vicsek>::step
	add r15, 336
	dec r12
	jne .LBB6_39
.LBB6_41:
	mov edi, 1
	call <std::sys::pal::unix::time::Timespec>::now
	mov r8, qword ptr [rsp + 136]
	mov ecx, dword ptr [rsp + 68]
	mov qword ptr [rsp + 240], rax
	mov dword ptr [rsp + 248], edx
	mov qword ptr [rsp + 144], r8
	mov dword ptr [rsp + 152], ecx
	lea rdi, [rsp + 336]
	lea rsi, [rsp + 240]
	lea rdx, [rsp + 144]
	call <std::sys::pal::unix::time::Timespec>::sub_timespec
	movzx eax, byte ptr [rsp + 336]
	test al, al
	jne .LBB6_44
	mov rcx, qword ptr [rsp + 344]
	jmp .LBB6_57
	.p2align	4
.LBB6_44:
	xor ecx, ecx
.LBB6_57:
	mov rdx, qword ptr [rsp + 88]
	add rdx, rcx
	jb .LBB6_68
	mov esi, dword ptr [rsp + 352]
	test al, al
	mov ecx, 0
	cmovne esi, ecx
	mov ecx, dword ptr [rsp + 4]
	add ecx, esi
	cmp ecx, 1000000000
	jb .LBB6_61
	cmp rdx, -1
	je .LBB6_68
	inc rdx
	add ecx, -1000000000
.LBB6_61:
	mov rax, qword ptr [rsp + 32]
	mov dword ptr [rsp + 4], ecx
	mov qword ptr [rsp + 336], 0
	mov qword ptr [rsp + 88], rdx
	mov qword ptr [rsp + 344], 1
	mov qword ptr [rax], rdx
	mov dword ptr [rax + 8], ecx
	mov rcx, qword ptr [rsp + 8]
	lea rax, [rsp + 336]
	mov qword ptr [rsp + 352], rcx
	#APP
	#NO_APP
	mov rax, qword ptr [rsp + 680]
	mov r12, qword ptr [rsp + 688]
	mov qword ptr [rsp + 8], rax
	test r12, r12
	je .LBB6_64
	mov r15, qword ptr [rsp + 8]
	.p2align	4
.LBB6_63:
	mov rdi, r15
	call core::ptr::drop_glue::<swarm::vicsek::Vicsek>
	add r15, 336
	dec r12
	jne .LBB6_63
.LBB6_64:
	cmp qword ptr [rsp + 672], 0
	je .LBB6_66
	mov rdi, qword ptr [rsp + 8]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	jmp .LBB6_66
.LBB6_67:
	mov edi, 1
	call <std::sys::pal::unix::time::Timespec>::now
	mov qword ptr [rsp + 144], rax
	mov dword ptr [rsp + 152], edx
	mov rdx, qword ptr [rsp + 120]
	mov ecx, dword ptr [rsp + 64]
	lea rdi, [rsp + 336]
	lea rsi, [rsp + 144]
	mov qword ptr [rsp + 672], rdx
	lea rdx, [rsp + 672]
	mov dword ptr [rsp + 680], ecx
	call <std::sys::pal::unix::time::Timespec>::sub_timespec
	xor eax, eax
	cmp byte ptr [rsp + 336], 0
	mov ecx, dword ptr [rsp + 352]
	mov rdx, qword ptr [rsp + 32]
	cmovne ecx, eax
	cmove rax, qword ptr [rsp + 344]
	mov qword ptr [rdx + 16], rax
	mov dword ptr [rdx + 24], ecx
	add rsp, 1112
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
.LBB6_68:
	.cfi_def_cfa_offset 1168
	lea rdi, [rip + .Lanon.094e8a2080f91d241e8a345b3139da00.691]
	lea rdx, [rip + .Lanon.094e8a2080f91d241e8a345b3139da00.692]
	mov esi, 30
	call core::option::expect_failed
.LBB6_26:
	ud2
.LBB6_70:
	lea rdi, [rip + .Lanon.c430ce33a94608f4541cbd7c9bf04936.6]
	lea rdx, [rip + .Lanon.c430ce33a94608f4541cbd7c9bf04936.8]
	mov esi, 57
	call core::panicking::panic_fmt
.LBB6_71:
	mov edi, 8
	mov rsi, r15
	call alloc::raw_vec::handle_error
	jmp .LBB6_53
	mov rbx, rax
	lea rdi, [rsp + 1016]
	call core::ptr::drop_glue::<swarm::flock::Boids>
	mov rdi, rbx
	call _Unwind_Resume@PLT
	lea rdi, [rsp + 240]
	mov rbx, rax
	call core::ptr::drop_glue::<swarm::flock::Boids>
	lea rdi, [rsp + 1016]
	call core::ptr::drop_glue::<swarm::flock::Boids>
	mov rdi, rbx
	call _Unwind_Resume@PLT
	jmp .LBB6_29
	jmp .LBB6_29
	jmp .LBB6_53
	jmp .LBB6_29
	jmp .LBB6_53
	lea rdi, [rsp + 144]
	mov rbx, rax
	call core::ptr::drop_glue::<swarm::flock::Boids>
	jmp .LBB6_46
	mov rbx, rax
	jmp .LBB6_49
	mov rbx, rax
.LBB6_46:
	lea rdi, [rsp + 240]
	call core::ptr::drop_glue::<swarm::flock::Boids>
.LBB6_49:
	lea rdi, [rsp + 1016]
	mov qword ptr [rsp + 1032], r15
	call core::ptr::drop_glue::<alloc::vec::Vec<swarm::vicsek::Vicsek>>
	mov rdi, rbx
	call _Unwind_Resume@PLT
.LBB6_53:
	mov rbx, rax
	lea rdi, [rsp + 672]
	call core::ptr::drop_glue::<alloc::vec::Vec<swarm::vicsek::Vicsek>>
	mov rdi, rbx
	call _Unwind_Resume@PLT
.LBB6_29:
	lea rdi, [rsp + 672]
	mov rbx, rax
	call core::ptr::drop_glue::<swarm::vicsek::Vicsek>
	mov rdi, rbx
	call _Unwind_Resume@PLT
