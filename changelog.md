# Changelog

## v0.09 *(stable,latest)*

Started threading lib.  
Added:
1. Feature in [entry.asm](src/entry.asm) that allocates TLS_SIZE bytes using mmap and sets fs to the result.
1. [thread.asm](src/thread.asm):
    1. __errno_location which returns the start of fs
    1. __prog_tls_location which returns the start of the program tls location
    1. __prog_tls_size which returns the size of the program tls location
1. Version number as ELF constant in [entry.asm](src/entry.asm)

Additionally perror was changed to use errno (but only if errno is not -1, then use rax for backwards compatibility)

## v0.08 *(stable,latest)*

Breaking changes:
- malloc now no longer accepts calls of size 0 (realloc frees and returns 0)
- printf now has size specifiers, previously all specifiers were 64 bit

Changes:
- atol just calls atoi (ud ftw)

## v0.07 *(stable,depr-c1)*

Added:
1. Stability display and changed order of version numbers.
1. strchr in [string.asm](src/string.asm)

## v0.06 *(stable,depr-c1)*

Fixed display of errno 0 and added this [changelog](changelog.md)

## v0.05 *(faulty,depr-c1)*

*Bugs:*
- *errno 0 is displayed incorrectly*

Fixed perror (errno was not inverted) and forgot NULL terminators for the errno strings.

## v0.04 *(unstable,depr-c1)*

*Bugs:*
- *errno is not inverted,  strerror strings are not **NULL** terminated and errno 0 was displayed incorrectly*

Added:
1. [errno.inc](src/errno.inc) with errno constants
1. [errno.asm](src/errno.asm) with strerror (would usually be in string.*) and perror with all strings needed

## v0.03 *(stable,depr-c1)*

added strtok in [string.asm](src/string.asm) and some more constants in [socket.inc](src/socket.inc)

## v0.02 *(stable,depr-c1)*

Just a fix for atoi

## v0.01 *(unstable,depr-c1)*

*Bugs:*
- *atoi does not work*

First commit with versions.  
Included:  
1. [Stats file](stats.txt) with section sizes and version number in the [Makefile](Makefile)
1. [syscall.inc](src/syscall.inc) with constants for all system calls
1. [entry.asm](src/entry.asm) with the entry point that calls main with argc and argv
1. [string.inc](src/string.inc)/[string.asm](src/string.asm) with strlen and strcmp
1. [stdlib.inc](src/stdlib.inc)/[stdlib.asm](src/stdlib.asm) with atoi
1. [stdio.inc](src/stdio.inc)/[stdio.asm](src/stdio.asm) with puts, putchar and printf
1. [socket.inc](src/socket.inc) with a few socket constants
1. [signal.inc](src/signal.inc) with all signal constants
1. [select.inc](src/select.inc) with FD_SETSIZE
1. [reg.inc](src/reg.inc) with the offsets needed for ptrace PEEK_USER
1. [ptrace.inc](src/ptrace.inc) with some ptrace constants
1. [memory.inc](src/memory.inc)/[memory.asm](src/memory.asm) with memcpy
1. [malloc.inc](src/malloc.inc)/[malloc.asm](src/malloc.asm) with malloc, realloc and free