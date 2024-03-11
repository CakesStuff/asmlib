global TLS_SIZE

TLS_ERRNO_OFFSET equ 0
TLS_PROG_STOR_OFF equ 8
TLS_PROG_STOR_SIZE equ 512
TLS_SIZE equ (8 + TLS_PROG_STOR_SIZE)

global __errno_location
__errno_location:
    rdfsbase rax
    add rax, TLS_ERRNO_OFFSET
    ret

global __prog_tls_location
__prog_tls_location:
    rdfsbase rax
    add rax, TLS_PROG_STOR_OFF
    ret

global __prog_tls_size
__prog_tls_size:
    mov rax, TLS_PROG_STOR_SIZE
    ret

;global thread_create
thread_create_TODO:
    ; TODO: