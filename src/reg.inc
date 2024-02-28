%if 0
R15 equ 0
R14 equ 1
R13 equ 2
R12 equ 3
RBP equ 4
RBX equ 5
R11 equ 6
R10 equ 7
R9 equ 8
R8 equ 9
RAX equ 10
RCX equ 11
RDX equ 12
RSI equ 13
RDI equ 14
%endif
ORIG_RAX equ 15
%if 0
RIP equ 16
CS equ 17
EFLAGS equ 18
RSP equ 19
SS equ 20
%endif
FS_BASE equ 21
GS_BASE equ 22
%if 0
DS equ 23
ES equ 24
FS equ 25
GS equ 26
%endif
;;; CUSTOM
ORIG_RAX_MUL equ (15 * 8)
RAX_MUL equ (10 * 8)