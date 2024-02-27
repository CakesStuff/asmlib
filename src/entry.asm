bits 64

%include "syscall.inc"

section .text
global _start
extern main

_start:
    mov rdi, [rsp]
    mov rsi, rsp
    add rsi, 8

    call main

    mov rdi, rax
    mov rax, SYS_exit
    syscall