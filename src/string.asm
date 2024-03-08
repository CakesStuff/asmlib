bits 64
%include "syscall.inc"

stdin equ 0
stdout equ 1
stderr equ 2

section .text
global strlen
strlen:
    mov rax, 0
.loop:
    cmp BYTE [rdi], 0
    je .exit

    add rax, 1
    add rdi, 1
    jmp .loop
.exit:
    ret