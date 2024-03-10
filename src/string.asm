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

section .bss
strtok_str: resq 1

section .text
global strtok
strtok:
    cmp rsi, 0
    je .retz

    cmp rdi, 0
    je .first

    mov QWORD [strtok_str], rdi
.first:
    mov rdi, QWORD [strtok_str]
    cmp rdi, 0
    je .retz

.tok:
    cmp BYTE [rdi], 0
    je .retz

    push rdi
    push rsi
    mov dil, BYTE [rdi]
    call istoken

    pop rsi
    pop rdi
    cmp rax, 0
    je .found

    mov BYTE [rdi], 0
    add rdi, 1
    jmp .tok

.found:
    mov QWORD [strtok_str], rdi
    add rdi, 1
.loop:
    cmp BYTE [rdi], 0
    je .endz

    push rdi
    push rsi
    mov dil, BYTE [rdi]
    call istoken

    pop rsi
    pop rdi
    cmp rax, 0
    jne .end

    add rdi, 1
    jmp .loop

.end:
    mov BYTE [rdi], 0
    mov rax, QWORD [strtok_str]
    add rdi, 1
    mov QWORD [strtok_str], rdi
    ret

.endz:
    mov rax, QWORD [strtok_str]
    mov QWORD [strtok_str], 0
    ret

.retz:
    mov rax, 0
    ret

istoken:
    cmp BYTE [rsi], 0
    je .retz

    cmp dil, BYTE [rsi]
    je .reto

    add rsi, 1
    jmp istoken
.retz:
    mov rax, 0
    ret
.reto:
    mov rax, 1
    ret

global strchr
strchr:
    cmp BYTE [rdi], 0
    je .retz

    cmp BYTE [rdi], sil
    je .retrdi

    add rdi, 1
    jmp strchr
.retz:
    mov rdi, 0
.retrdi:
    mov rax, rdi
    ret