bits 64

section .text
global memcpy
memcpy:
    push rdi
.while:
    cmp rdx, 0
    je .exit

    mov al, BYTE [rsi]
    mov BYTE [rdi], al
    add rdi, 1
    add rsi, 1
    add rdx, -1
    jmp .while
.exit:
    pop rax
    ret