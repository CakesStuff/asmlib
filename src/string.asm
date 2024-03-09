bits 64

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

global strcmp
strcmp:
    cmp BYTE [rdi], 0
    jne .next

    cmp BYTE [rsi], 0
    je .equal
    jmp .less

.next:
    cmp BYTE [rsi], 0
    jne .cmp

    cmp BYTE [rdi], 0
    je .equal
    jmp .greater

.cmp:
    mov al, BYTE [rdi]
    cmp al, BYTE [rsi]
    je .continue
    jg .greater

.less:
    mov rax, -1
    ret
.greater:
    mov rax, 1
    ret
.equal:
    mov rax, 0
    ret

.continue:
    add rdi, 1
    add rsi, 1
    jmp strcmp