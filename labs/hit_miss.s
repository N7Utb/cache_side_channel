	.file	"hit_miss.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"address = %p \n"
.LC3:
	.string	"array[ 0 ] = %i \n"
.LC4:
	.string	"miss section latency = %lu \n"
.LC5:
	.string	"hit section latency = %lu \n"
.LC6:
	.string	"overhead latency = %lu \n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC7:
	.string	"Measured L1 hit latency = %lu TSC cycles\n"
	.align 8
.LC8:
	.string	"Measured main memory latency = %lu TSC cycles\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB5547:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$424, %rsp
	.cfi_def_cfa_offset 464
	movdqa	.LC0(%rip), %xmm0
	movdqa	.LC1(%rip), %xmm2
	movq	%fs:40, %rax
	movq	%rax, 408(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rbx
	leaq	400(%rsp), %rdx
	movq	%rbx, %rax
	.p2align 4,,10
	.p2align 3
.L2:
	movdqa	%xmm0, %xmm1
	addq	$16, %rax
	paddd	%xmm2, %xmm0
	movaps	%xmm1, -16(%rax)
	cmpq	%rdx, %rax
	jne	.L2
	movq	%rbx, %rdx
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	mfence
	clflush	(%rbx)
	mfence
	lfence
	rdtsc
	lfence
	movl	(%rsp), %r8d
	lfence
	movq	%rax, %rcx
	salq	$32, %rdx
	orq	%rdx, %rcx
	rdtsc
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	lfence
	salq	$32, %rdx
	orq	%rdx, %rax
	movl	%r8d, %edx
	subq	%rcx, %rax
	movq	%rax, %r12
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	%r12, %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC4(%rip), %rsi
	call	__printf_chk@PLT
	mfence
	lfence
	rdtsc
	lfence
	movl	(%rsp), %r8d
	lfence
	movq	%rax, %rcx
	salq	$32, %rdx
	orq	%rdx, %rcx
	rdtsc
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	lfence
	salq	$32, %rdx
	orq	%rdx, %rax
	movl	%r8d, %edx
	subq	%rcx, %rax
	movq	%rax, %rbp
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	%rbp, %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC5(%rip), %rsi
	call	__printf_chk@PLT
	mfence
	lfence
	rdtsc
	lfence
	lfence
	movq	%rax, %rbx
	salq	$32, %rdx
	orq	%rdx, %rbx
	rdtsc
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	lfence
	salq	$32, %rdx
	movq	%rax, %r13
	xorl	%eax, %eax
	orq	%rdx, %r13
	movq	%r13, %rdx
	subq	%rbx, %rdx
	subq	%r13, %rbx
	call	__printf_chk@PLT
	leaq	(%rbx,%rbp), %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC7(%rip), %rsi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	leaq	(%rbx,%r12), %rdx
	movl	$1, %edi
	leaq	.LC8(%rip), %rsi
	call	__printf_chk@PLT
	movq	408(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L7
	addq	$424, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L7:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5547:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC1:
	.long	4
	.long	4
	.long	4
	.long	4
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
