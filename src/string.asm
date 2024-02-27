bits 64
%include "syscall.inc"

stdin equ 0
stdout equ 1
stderr equ 2

section .text
global strlen
strlen:
    enter $16, $0
    %define len DWORD [rbp - 4]
    %define str QWORD [rbp - 16]

    mov len, 0
    mov str, rdi
.loop:
    mov rax, str
    cmp BYTE [rax], 0
    je .exit

    add rax, 1
    mov str, rax
    mov eax, len
    add eax, 1
    mov len, eax
    jmp .loop
.exit:
    mov eax, len

    %undef len
    %undef str
    leave
    ret