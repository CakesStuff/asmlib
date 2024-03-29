__NR_read	equ 0
__NR_write	equ 1
__NR_open	equ 2
__NR_close	equ 3
__NR_stat	equ 4
__NR_fstat	equ 5
__NR_lstat	equ 6
__NR_poll	equ 7
__NR_lseek	equ 8
__NR_mmap	equ 9
__NR_mprotect	equ 10
__NR_munmap	equ 11
__NR_brk	equ 12
__NR_rt_sigaction	equ 13
__NR_rt_sigprocmask	equ 14
__NR_rt_sigreturn	equ 15
__NR_ioctl	equ 16
__NR_pread64	equ 17
__NR_pwrite64	equ 18
__NR_readv	equ 19
__NR_writev	equ 20
__NR_access	equ 21
__NR_pipe	equ 22
__NR_select	equ 23
__NR_sched_yield	equ 24
__NR_mremap	equ 25
__NR_msync	equ 26
__NR_mincore	equ 27
__NR_madvise	equ 28
__NR_shmget	equ 29
__NR_shmat	equ 30
__NR_shmctl	equ 31
__NR_dup	equ 32
__NR_dup2	equ 33
__NR_pause	equ 34
__NR_nanosleep	equ 35
__NR_getitimer	equ 36
__NR_alarm	equ 37
__NR_setitimer	equ 38
__NR_getpid	equ 39
__NR_sendfile	equ 40
__NR_socket	equ 41
__NR_connect	equ 42
__NR_accept	equ 43
__NR_sendto	equ 44
__NR_recvfrom	equ 45
__NR_sendmsg	equ 46
__NR_recvmsg	equ 47
__NR_shutdown	equ 48
__NR_bind	equ 49
__NR_listen	equ 50
__NR_getsockname	equ 51
__NR_getpeername	equ 52
__NR_socketpair	equ 53
__NR_setsockopt	equ 54
__NR_getsockopt	equ 55
__NR_clone	equ 56
__NR_fork	equ 57
__NR_vfork	equ 58
__NR_execve	equ 59
__NR_exit	equ 60
__NR_wait4	equ 61
__NR_kill	equ 62
__NR_uname	equ 63
__NR_semget	equ 64
__NR_semop	equ 65
__NR_semctl	equ 66
__NR_shmdt	equ 67
__NR_msgget	equ 68
__NR_msgsnd	equ 69
__NR_msgrcv	equ 70
__NR_msgctl	equ 71
__NR_fcntl	equ 72
__NR_flock	equ 73
__NR_fsync	equ 74
__NR_fdatasync	equ 75
__NR_truncate	equ 76
__NR_ftruncate	equ 77
__NR_getdents	equ 78
__NR_getcwd	equ 79
__NR_chdir	equ 80
__NR_fchdir	equ 81
__NR_rename	equ 82
__NR_mkdir	equ 83
__NR_rmdir	equ 84
__NR_creat	equ 85
__NR_link	equ 86
__NR_unlink	equ 87
__NR_symlink	equ 88
__NR_readlink	equ 89
__NR_chmod	equ 90
__NR_fchmod	equ 91
__NR_chown	equ 92
__NR_fchown	equ 93
__NR_lchown	equ 94
__NR_umask	equ 95
__NR_gettimeofday	equ 96
__NR_getrlimit	equ 97
__NR_getrusage	equ 98
__NR_sysinfo	equ 99
__NR_times	equ 100
__NR_ptrace	equ 101
__NR_getuid	equ 102
__NR_syslog	equ 103
__NR_getgid	equ 104
__NR_setuid	equ 105
__NR_setgid	equ 106
__NR_geteuid	equ 107
__NR_getegid	equ 108
__NR_setpgid	equ 109
__NR_getppid	equ 110
__NR_getpgrp	equ 111
__NR_setsid	equ 112
__NR_setreuid	equ 113
__NR_setregid	equ 114
__NR_getgroups	equ 115
__NR_setgroups	equ 116
__NR_setresuid	equ 117
__NR_getresuid	equ 118
__NR_setresgid	equ 119
__NR_getresgid	equ 120
__NR_getpgid	equ 121
__NR_setfsuid	equ 122
__NR_setfsgid	equ 123
__NR_getsid	equ 124
__NR_capget	equ 125
__NR_capset	equ 126
__NR_rt_sigpending	equ 127
__NR_rt_sigtimedwait	equ 128
__NR_rt_sigqueueinfo	equ 129
__NR_rt_sigsuspend	equ 130
__NR_sigaltstack	equ 131
__NR_utime	equ 132
__NR_mknod	equ 133
__NR_uselib	equ 134
__NR_personality	equ 135
__NR_ustat	equ 136
__NR_statfs	equ 137
__NR_fstatfs	equ 138
__NR_sysfs	equ 139
__NR_getpriority	equ 140
__NR_setpriority	equ 141
__NR_sched_setparam	equ 142
__NR_sched_getparam	equ 143
__NR_sched_setscheduler	equ 144
__NR_sched_getscheduler	equ 145
__NR_sched_get_priority_max	equ 146
__NR_sched_get_priority_min	equ 147
__NR_sched_rr_get_interval	equ 148
__NR_mlock	equ 149
__NR_munlock	equ 150
__NR_mlockall	equ 151
__NR_munlockall	equ 152
__NR_vhangup	equ 153
__NR_modify_ldt	equ 154
__NR_pivot_root	equ 155
__NR__sysctl	equ 156
__NR_prctl	equ 157
__NR_arch_prctl	equ 158
__NR_adjtimex	equ 159
__NR_setrlimit	equ 160
__NR_chroot	equ 161
__NR_sync	equ 162
__NR_acct	equ 163
__NR_settimeofday	equ 164
__NR_mount	equ 165
__NR_umount2	equ 166
__NR_swapon	equ 167
__NR_swapoff	equ 168
__NR_reboot	equ 169
__NR_sethostname	equ 170
__NR_setdomainname	equ 171
__NR_iopl	equ 172
__NR_ioperm	equ 173
__NR_create_module	equ 174
__NR_init_module	equ 175
__NR_delete_module	equ 176
__NR_get_kernel_syms	equ 177
__NR_query_module	equ 178
__NR_quotactl	equ 179
__NR_nfsservctl	equ 180
__NR_getpmsg	equ 181
__NR_putpmsg	equ 182
__NR_afs_syscall	equ 183
__NR_tuxcall	equ 184
__NR_security	equ 185
__NR_gettid	equ 186
__NR_readahead	equ 187
__NR_setxattr	equ 188
__NR_lsetxattr	equ 189
__NR_fsetxattr	equ 190
__NR_getxattr	equ 191
__NR_lgetxattr	equ 192
__NR_fgetxattr	equ 193
__NR_listxattr	equ 194
__NR_llistxattr	equ 195
__NR_flistxattr	equ 196
__NR_removexattr	equ 197
__NR_lremovexattr	equ 198
__NR_fremovexattr	equ 199
__NR_tkill	equ 200
__NR_time	equ 201
__NR_futex	equ 202
__NR_sched_setaffinity	equ 203
__NR_sched_getaffinity	equ 204
__NR_set_thread_area	equ 205
__NR_io_setup	equ 206
__NR_io_destroy	equ 207
__NR_io_getevents	equ 208
__NR_io_submit	equ 209
__NR_io_cancel	equ 210
__NR_get_thread_area	equ 211
__NR_lookup_dcookie	equ 212
__NR_epoll_create	equ 213
__NR_epoll_ctl_old	equ 214
__NR_epoll_wait_old	equ 215
__NR_remap_file_pages	equ 216
__NR_getdents64	equ 217
__NR_set_tid_address	equ 218
__NR_restart_syscall	equ 219
__NR_semtimedop	equ 220
__NR_fadvise64	equ 221
__NR_timer_create	equ 222
__NR_timer_settime	equ 223
__NR_timer_gettime	equ 224
__NR_timer_getoverrun	equ 225
__NR_timer_delete	equ 226
__NR_clock_settime	equ 227
__NR_clock_gettime	equ 228
__NR_clock_getres	equ 229
__NR_clock_nanosleep	equ 230
__NR_exit_group	equ 231
__NR_epoll_wait	equ 232
__NR_epoll_ctl	equ 233
__NR_tgkill	equ 234
__NR_utimes	equ 235
__NR_vserver	equ 236
__NR_mbind	equ 237
__NR_set_mempolicy	equ 238
__NR_get_mempolicy	equ 239
__NR_mq_open	equ 240
__NR_mq_unlink	equ 241
__NR_mq_timedsend	equ 242
__NR_mq_timedreceive	equ 243
__NR_mq_notify	equ 244
__NR_mq_getsetattr	equ 245
__NR_kexec_load	equ 246
__NR_waitid	equ 247
__NR_add_key	equ 248
__NR_request_key	equ 249
__NR_keyctl	equ 250
__NR_ioprio_set	equ 251
__NR_ioprio_get	equ 252
__NR_inotify_init	equ 253
__NR_inotify_add_watch	equ 254
__NR_inotify_rm_watch	equ 255
__NR_migrate_pages	equ 256
__NR_openat	equ 257
__NR_mkdirat	equ 258
__NR_mknodat	equ 259
__NR_fchownat	equ 260
__NR_futimesat	equ 261
__NR_newfstatat	equ 262
__NR_unlinkat	equ 263
__NR_renameat	equ 264
__NR_linkat	equ 265
__NR_symlinkat	equ 266
__NR_readlinkat	equ 267
__NR_fchmodat	equ 268
__NR_faccessat	equ 269
__NR_pselect6	equ 270
__NR_ppoll	equ 271
__NR_unshare	equ 272
__NR_set_robust_list	equ 273
__NR_get_robust_list	equ 274
__NR_splice	equ 275
__NR_tee	equ 276
__NR_sync_file_range	equ 277
__NR_vmsplice	equ 278
__NR_move_pages	equ 279
__NR_utimensat	equ 280
__NR_epoll_pwait	equ 281
__NR_signalfd	equ 282
__NR_timerfd_create	equ 283
__NR_eventfd	equ 284
__NR_fallocate	equ 285
__NR_timerfd_settime	equ 286
__NR_timerfd_gettime	equ 287
__NR_accept4	equ 288
__NR_signalfd4	equ 289
__NR_eventfd2	equ 290
__NR_epoll_create1	equ 291
__NR_dup3	equ 292
__NR_pipe2	equ 293
__NR_inotify_init1	equ 294
__NR_preadv	equ 295
__NR_pwritev	equ 296
__NR_rt_tgsigqueueinfo	equ 297
__NR_perf_event_open	equ 298
__NR_recvmmsg	equ 299
__NR_fanotify_init	equ 300
__NR_fanotify_mark	equ 301
__NR_prlimit64	equ 302
__NR_name_to_handle_at	equ 303
__NR_open_by_handle_at	equ 304
__NR_clock_adjtime	equ 305
__NR_syncfs	equ 306
__NR_sendmmsg	equ 307
__NR_setns	equ 308
__NR_getcpu	equ 309
__NR_process_vm_readv	equ 310
__NR_process_vm_writev	equ 311
__NR_kcmp	equ 312
__NR_finit_module	equ 313
__NR_sched_setattr	equ 314
__NR_sched_getattr	equ 315
__NR_renameat2	equ 316
__NR_seccomp	equ 317
__NR_getrandom	equ 318
__NR_memfd_create	equ 319
__NR_kexec_file_load	equ 320
__NR_bpf	equ 321
__NR_execveat	equ 322
__NR_userfaultfd	equ 323
__NR_membarrier	equ 324
__NR_mlock2	equ 325
__NR_copy_file_range	equ 326
__NR_preadv2	equ 327
__NR_pwritev2	equ 328
__NR_pkey_mprotect	equ 329
__NR_pkey_alloc	equ 330
__NR_pkey_free	equ 331
__NR_statx	equ 332
__NR_io_pgetevents	equ 333
__NR_rseq	equ 334
__NR_pidfd_send_signal	equ 424
__NR_io_uring_setup	equ 425
__NR_io_uring_enter	equ 426
__NR_io_uring_register	equ 427
__NR_open_tree	equ 428
__NR_move_mount	equ 429
__NR_fsopen	equ 430
__NR_fsconfig	equ 431
__NR_fsmount	equ 432
__NR_fspick	equ 433
__NR_pidfd_open	equ 434
__NR_clone3	equ 435
__NR_close_range	equ 436
__NR_openat2	equ 437
__NR_pidfd_getfd	equ 438
__NR_faccessat2	equ 439
__NR_process_madvise	equ 440
__NR_epoll_pwait2	equ 441
__NR_mount_setattr	equ 442
__NR_quotactl_fd	equ 443
__NR_landlock_create_ruleset	equ 444
__NR_landlock_add_rule	equ 445
__NR_landlock_restrict_self	equ 446
__NR_memfd_secret	equ 447
__NR_process_mrelease	equ 448
SYS__sysctl	equ __NR__sysctl
SYS_accept	equ __NR_accept
SYS_accept4	equ __NR_accept4
SYS_access	equ __NR_access
SYS_acct	equ __NR_acct
SYS_add_key	equ __NR_add_key
SYS_adjtimex	equ __NR_adjtimex
SYS_afs_syscall	equ __NR_afs_syscall
SYS_alarm	equ __NR_alarm
SYS_arch_prctl	equ __NR_arch_prctl
SYS_bind	equ __NR_bind
SYS_bpf	equ __NR_bpf
SYS_brk	equ __NR_brk
SYS_capget	equ __NR_capget
SYS_capset	equ __NR_capset
SYS_chdir	equ __NR_chdir
SYS_chmod	equ __NR_chmod
SYS_chown	equ __NR_chown
SYS_chroot	equ __NR_chroot
SYS_clock_adjtime	equ __NR_clock_adjtime
SYS_clock_getres	equ __NR_clock_getres
SYS_clock_gettime	equ __NR_clock_gettime
SYS_clock_nanosleep	equ __NR_clock_nanosleep
SYS_clock_settime	equ __NR_clock_settime
SYS_clone	equ __NR_clone
SYS_clone3	equ __NR_clone3
SYS_close	equ __NR_close
SYS_close_range	equ __NR_close_range
SYS_connect	equ __NR_connect
SYS_copy_file_range	equ __NR_copy_file_range
SYS_creat	equ __NR_creat
SYS_create_module	equ __NR_create_module
SYS_delete_module	equ __NR_delete_module
SYS_dup	equ __NR_dup
SYS_dup2	equ __NR_dup2
SYS_dup3	equ __NR_dup3
SYS_epoll_create	equ __NR_epoll_create
SYS_epoll_create1	equ __NR_epoll_create1
SYS_epoll_ctl	equ __NR_epoll_ctl
SYS_epoll_ctl_old	equ __NR_epoll_ctl_old
SYS_epoll_pwait	equ __NR_epoll_pwait
SYS_epoll_pwait2	equ __NR_epoll_pwait2
SYS_epoll_wait	equ __NR_epoll_wait
SYS_epoll_wait_old	equ __NR_epoll_wait_old
SYS_eventfd	equ __NR_eventfd
SYS_eventfd2	equ __NR_eventfd2
SYS_execve	equ __NR_execve
SYS_execveat	equ __NR_execveat
SYS_exit	equ __NR_exit
SYS_exit_group	equ __NR_exit_group
SYS_faccessat	equ __NR_faccessat
SYS_faccessat2	equ __NR_faccessat2
SYS_fadvise64	equ __NR_fadvise64
SYS_fallocate	equ __NR_fallocate
SYS_fanotify_init	equ __NR_fanotify_init
SYS_fanotify_mark	equ __NR_fanotify_mark
SYS_fchdir	equ __NR_fchdir
SYS_fchmod	equ __NR_fchmod
SYS_fchmodat	equ __NR_fchmodat
SYS_fchown	equ __NR_fchown
SYS_fchownat	equ __NR_fchownat
SYS_fcntl	equ __NR_fcntl
SYS_fdatasync	equ __NR_fdatasync
SYS_fgetxattr	equ __NR_fgetxattr
SYS_finit_module	equ __NR_finit_module
SYS_flistxattr	equ __NR_flistxattr
SYS_flock	equ __NR_flock
SYS_fork	equ __NR_fork
SYS_fremovexattr	equ __NR_fremovexattr
SYS_fsconfig	equ __NR_fsconfig
SYS_fsetxattr	equ __NR_fsetxattr
SYS_fsmount	equ __NR_fsmount
SYS_fsopen	equ __NR_fsopen
SYS_fspick	equ __NR_fspick
SYS_fstat	equ __NR_fstat
SYS_fstatfs	equ __NR_fstatfs
SYS_fsync	equ __NR_fsync
SYS_ftruncate	equ __NR_ftruncate
SYS_futex	equ __NR_futex
SYS_futimesat	equ __NR_futimesat
SYS_get_kernel_syms	equ __NR_get_kernel_syms
SYS_get_mempolicy	equ __NR_get_mempolicy
SYS_get_robust_list	equ __NR_get_robust_list
SYS_get_thread_area	equ __NR_get_thread_area
SYS_getcpu	equ __NR_getcpu
SYS_getcwd	equ __NR_getcwd
SYS_getdents	equ __NR_getdents
SYS_getdents64	equ __NR_getdents64
SYS_getegid	equ __NR_getegid
SYS_geteuid	equ __NR_geteuid
SYS_getgid	equ __NR_getgid
SYS_getgroups	equ __NR_getgroups
SYS_getitimer	equ __NR_getitimer
SYS_getpeername	equ __NR_getpeername
SYS_getpgid	equ __NR_getpgid
SYS_getpgrp	equ __NR_getpgrp
SYS_getpid	equ __NR_getpid
SYS_getpmsg	equ __NR_getpmsg
SYS_getppid	equ __NR_getppid
SYS_getpriority	equ __NR_getpriority
SYS_getrandom	equ __NR_getrandom
SYS_getresgid	equ __NR_getresgid
SYS_getresuid	equ __NR_getresuid
SYS_getrlimit	equ __NR_getrlimit
SYS_getrusage	equ __NR_getrusage
SYS_getsid	equ __NR_getsid
SYS_getsockname	equ __NR_getsockname
SYS_getsockopt	equ __NR_getsockopt
SYS_gettid	equ __NR_gettid
SYS_gettimeofday	equ __NR_gettimeofday
SYS_getuid	equ __NR_getuid
SYS_getxattr	equ __NR_getxattr
SYS_init_module	equ __NR_init_module
SYS_inotify_add_watch	equ __NR_inotify_add_watch
SYS_inotify_init	equ __NR_inotify_init
SYS_inotify_init1	equ __NR_inotify_init1
SYS_inotify_rm_watch	equ __NR_inotify_rm_watch
SYS_io_cancel	equ __NR_io_cancel
SYS_io_destroy	equ __NR_io_destroy
SYS_io_getevents	equ __NR_io_getevents
SYS_io_pgetevents	equ __NR_io_pgetevents
SYS_io_setup	equ __NR_io_setup
SYS_io_submit	equ __NR_io_submit
SYS_io_uring_enter	equ __NR_io_uring_enter
SYS_io_uring_register	equ __NR_io_uring_register
SYS_io_uring_setup	equ __NR_io_uring_setup
SYS_ioctl	equ __NR_ioctl
SYS_ioperm	equ __NR_ioperm
SYS_iopl	equ __NR_iopl
SYS_ioprio_get	equ __NR_ioprio_get
SYS_ioprio_set	equ __NR_ioprio_set
SYS_kcmp	equ __NR_kcmp
SYS_kexec_file_load	equ __NR_kexec_file_load
SYS_kexec_load	equ __NR_kexec_load
SYS_keyctl	equ __NR_keyctl
SYS_kill	equ __NR_kill
SYS_landlock_add_rule	equ __NR_landlock_add_rule
SYS_landlock_create_ruleset	equ __NR_landlock_create_ruleset
SYS_landlock_restrict_self	equ __NR_landlock_restrict_self
SYS_lchown	equ __NR_lchown
SYS_lgetxattr	equ __NR_lgetxattr
SYS_link	equ __NR_link
SYS_linkat	equ __NR_linkat
SYS_listen	equ __NR_listen
SYS_listxattr	equ __NR_listxattr
SYS_llistxattr	equ __NR_llistxattr
SYS_lookup_dcookie	equ __NR_lookup_dcookie
SYS_lremovexattr	equ __NR_lremovexattr
SYS_lseek	equ __NR_lseek
SYS_lsetxattr	equ __NR_lsetxattr
SYS_lstat	equ __NR_lstat
SYS_madvise	equ __NR_madvise
SYS_mbind	equ __NR_mbind
SYS_membarrier	equ __NR_membarrier
SYS_memfd_create	equ __NR_memfd_create
SYS_memfd_secret	equ __NR_memfd_secret
SYS_migrate_pages	equ __NR_migrate_pages
SYS_mincore	equ __NR_mincore
SYS_mkdir	equ __NR_mkdir
SYS_mkdirat	equ __NR_mkdirat
SYS_mknod	equ __NR_mknod
SYS_mknodat	equ __NR_mknodat
SYS_mlock	equ __NR_mlock
SYS_mlock2	equ __NR_mlock2
SYS_mlockall	equ __NR_mlockall
SYS_mmap	equ __NR_mmap
SYS_modify_ldt	equ __NR_modify_ldt
SYS_mount	equ __NR_mount
SYS_mount_setattr	equ __NR_mount_setattr
SYS_move_mount	equ __NR_move_mount
SYS_move_pages	equ __NR_move_pages
SYS_mprotect	equ __NR_mprotect
SYS_mq_getsetattr	equ __NR_mq_getsetattr
SYS_mq_notify	equ __NR_mq_notify
SYS_mq_open	equ __NR_mq_open
SYS_mq_timedreceive	equ __NR_mq_timedreceive
SYS_mq_timedsend	equ __NR_mq_timedsend
SYS_mq_unlink	equ __NR_mq_unlink
SYS_mremap	equ __NR_mremap
SYS_msgctl	equ __NR_msgctl
SYS_msgget	equ __NR_msgget
SYS_msgrcv	equ __NR_msgrcv
SYS_msgsnd	equ __NR_msgsnd
SYS_msync	equ __NR_msync
SYS_munlock	equ __NR_munlock
SYS_munlockall	equ __NR_munlockall
SYS_munmap	equ __NR_munmap
SYS_name_to_handle_at	equ __NR_name_to_handle_at
SYS_nanosleep	equ __NR_nanosleep
SYS_newfstatat	equ __NR_newfstatat
SYS_nfsservctl	equ __NR_nfsservctl
SYS_open	equ __NR_open
SYS_open_by_handle_at	equ __NR_open_by_handle_at
SYS_open_tree	equ __NR_open_tree
SYS_openat	equ __NR_openat
SYS_openat2	equ __NR_openat2
SYS_pause	equ __NR_pause
SYS_perf_event_open	equ __NR_perf_event_open
SYS_personality	equ __NR_personality
SYS_pidfd_getfd	equ __NR_pidfd_getfd
SYS_pidfd_open	equ __NR_pidfd_open
SYS_pidfd_send_signal	equ __NR_pidfd_send_signal
SYS_pipe	equ __NR_pipe
SYS_pipe2	equ __NR_pipe2
SYS_pivot_root	equ __NR_pivot_root
SYS_pkey_alloc	equ __NR_pkey_alloc
SYS_pkey_free	equ __NR_pkey_free
SYS_pkey_mprotect	equ __NR_pkey_mprotect
SYS_poll	equ __NR_poll
SYS_ppoll	equ __NR_ppoll
SYS_prctl	equ __NR_prctl
SYS_pread64	equ __NR_pread64
SYS_preadv	equ __NR_preadv
SYS_preadv2	equ __NR_preadv2
SYS_prlimit64	equ __NR_prlimit64
SYS_process_madvise	equ __NR_process_madvise
SYS_process_mrelease	equ __NR_process_mrelease
SYS_process_vm_readv	equ __NR_process_vm_readv
SYS_process_vm_writev	equ __NR_process_vm_writev
SYS_pselect6	equ __NR_pselect6
SYS_ptrace	equ __NR_ptrace
SYS_putpmsg	equ __NR_putpmsg
SYS_pwrite64	equ __NR_pwrite64
SYS_pwritev	equ __NR_pwritev
SYS_pwritev2	equ __NR_pwritev2
SYS_query_module	equ __NR_query_module
SYS_quotactl	equ __NR_quotactl
SYS_quotactl_fd	equ __NR_quotactl_fd
SYS_read	equ __NR_read
SYS_readahead	equ __NR_readahead
SYS_readlink	equ __NR_readlink
SYS_readlinkat	equ __NR_readlinkat
SYS_readv	equ __NR_readv
SYS_reboot	equ __NR_reboot
SYS_recvfrom	equ __NR_recvfrom
SYS_recvmmsg	equ __NR_recvmmsg
SYS_recvmsg	equ __NR_recvmsg
SYS_remap_file_pages	equ __NR_remap_file_pages
SYS_removexattr	equ __NR_removexattr
SYS_rename	equ __NR_rename
SYS_renameat	equ __NR_renameat
SYS_renameat2	equ __NR_renameat2
SYS_request_key	equ __NR_request_key
SYS_restart_syscall	equ __NR_restart_syscall
SYS_rmdir	equ __NR_rmdir
SYS_rseq	equ __NR_rseq
SYS_rt_sigaction	equ __NR_rt_sigaction
SYS_rt_sigpending	equ __NR_rt_sigpending
SYS_rt_sigprocmask	equ __NR_rt_sigprocmask
SYS_rt_sigqueueinfo	equ __NR_rt_sigqueueinfo
SYS_rt_sigreturn	equ __NR_rt_sigreturn
SYS_rt_sigsuspend	equ __NR_rt_sigsuspend
SYS_rt_sigtimedwait	equ __NR_rt_sigtimedwait
SYS_rt_tgsigqueueinfo	equ __NR_rt_tgsigqueueinfo
SYS_sched_get_priority_max	equ __NR_sched_get_priority_max
SYS_sched_get_priority_min	equ __NR_sched_get_priority_min
SYS_sched_getaffinity	equ __NR_sched_getaffinity
SYS_sched_getattr	equ __NR_sched_getattr
SYS_sched_getparam	equ __NR_sched_getparam
SYS_sched_getscheduler	equ __NR_sched_getscheduler
SYS_sched_rr_get_interval	equ __NR_sched_rr_get_interval
SYS_sched_setaffinity	equ __NR_sched_setaffinity
SYS_sched_setattr	equ __NR_sched_setattr
SYS_sched_setparam	equ __NR_sched_setparam
SYS_sched_setscheduler	equ __NR_sched_setscheduler
SYS_sched_yield	equ __NR_sched_yield
SYS_seccomp	equ __NR_seccomp
SYS_security	equ __NR_security
SYS_select	equ __NR_select
SYS_semctl	equ __NR_semctl
SYS_semget	equ __NR_semget
SYS_semop	equ __NR_semop
SYS_semtimedop	equ __NR_semtimedop
SYS_sendfile	equ __NR_sendfile
SYS_sendmmsg	equ __NR_sendmmsg
SYS_sendmsg	equ __NR_sendmsg
SYS_sendto	equ __NR_sendto
SYS_set_mempolicy	equ __NR_set_mempolicy
SYS_set_robust_list	equ __NR_set_robust_list
SYS_set_thread_area	equ __NR_set_thread_area
SYS_set_tid_address	equ __NR_set_tid_address
SYS_setdomainname	equ __NR_setdomainname
SYS_setfsgid	equ __NR_setfsgid
SYS_setfsuid	equ __NR_setfsuid
SYS_setgid	equ __NR_setgid
SYS_setgroups	equ __NR_setgroups
SYS_sethostname	equ __NR_sethostname
SYS_setitimer	equ __NR_setitimer
SYS_setns	equ __NR_setns
SYS_setpgid	equ __NR_setpgid
SYS_setpriority	equ __NR_setpriority
SYS_setregid	equ __NR_setregid
SYS_setresgid	equ __NR_setresgid
SYS_setresuid	equ __NR_setresuid
SYS_setreuid	equ __NR_setreuid
SYS_setrlimit	equ __NR_setrlimit
SYS_setsid	equ __NR_setsid
SYS_setsockopt	equ __NR_setsockopt
SYS_settimeofday	equ __NR_settimeofday
SYS_setuid	equ __NR_setuid
SYS_setxattr	equ __NR_setxattr
SYS_shmat	equ __NR_shmat
SYS_shmctl	equ __NR_shmctl
SYS_shmdt	equ __NR_shmdt
SYS_shmget	equ __NR_shmget
SYS_shutdown	equ __NR_shutdown
SYS_sigaltstack	equ __NR_sigaltstack
SYS_signalfd	equ __NR_signalfd
SYS_signalfd4	equ __NR_signalfd4
SYS_socket	equ __NR_socket
SYS_socketpair	equ __NR_socketpair
SYS_splice	equ __NR_splice
SYS_stat	equ __NR_stat
SYS_statfs	equ __NR_statfs
SYS_statx	equ __NR_statx
SYS_swapoff	equ __NR_swapoff
SYS_swapon	equ __NR_swapon
SYS_symlink	equ __NR_symlink
SYS_symlinkat	equ __NR_symlinkat
SYS_sync	equ __NR_sync
SYS_sync_file_range	equ __NR_sync_file_range
SYS_syncfs	equ __NR_syncfs
SYS_sysfs	equ __NR_sysfs
SYS_sysinfo	equ __NR_sysinfo
SYS_syslog	equ __NR_syslog
SYS_tee	equ __NR_tee
SYS_tgkill	equ __NR_tgkill
SYS_time	equ __NR_time
SYS_timer_create	equ __NR_timer_create
SYS_timer_delete	equ __NR_timer_delete
SYS_timer_getoverrun	equ __NR_timer_getoverrun
SYS_timer_gettime	equ __NR_timer_gettime
SYS_timer_settime	equ __NR_timer_settime
SYS_timerfd_create	equ __NR_timerfd_create
SYS_timerfd_gettime	equ __NR_timerfd_gettime
SYS_timerfd_settime	equ __NR_timerfd_settime
SYS_times	equ __NR_times
SYS_tkill	equ __NR_tkill
SYS_truncate	equ __NR_truncate
SYS_tuxcall	equ __NR_tuxcall
SYS_umask	equ __NR_umask
SYS_umount2	equ __NR_umount2
SYS_uname	equ __NR_uname
SYS_unlink	equ __NR_unlink
SYS_unlinkat	equ __NR_unlinkat
SYS_unshare	equ __NR_unshare
SYS_uselib	equ __NR_uselib
SYS_userfaultfd	equ __NR_userfaultfd
SYS_ustat	equ __NR_ustat
SYS_utime	equ __NR_utime
SYS_utimensat	equ __NR_utimensat
SYS_utimes	equ __NR_utimes
SYS_vfork	equ __NR_vfork
SYS_vhangup	equ __NR_vhangup
SYS_vmsplice	equ __NR_vmsplice
SYS_vserver	equ __NR_vserver
SYS_wait4	equ __NR_wait4
SYS_waitid	equ __NR_waitid
SYS_write	equ __NR_write
SYS_writev	equ __NR_writev
