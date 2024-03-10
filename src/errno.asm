bits 64

section .data
errno_strs_arr: dq errno_str_n0, errno_str_n1, errno_str_n2, errno_str_n3, errno_str_n4, errno_str_n5, errno_str_n6, errno_str_n7, errno_str_n8, errno_str_n9, errno_str_n10, errno_str_n11, errno_str_n12, errno_str_n13, errno_str_n14, errno_str_n15, errno_str_n16, errno_str_n17, errno_str_n18, errno_str_n19, errno_str_n20, errno_str_n21, errno_str_n22, errno_str_n23, errno_str_n24, errno_str_n25, errno_str_n26, errno_str_n27, errno_str_n28, errno_str_n29, errno_str_n30, errno_str_n31, errno_str_n32, errno_str_n33, errno_str_n34, errno_str_n35, errno_str_n36, errno_str_n37, errno_str_n38, errno_str_n39, errno_str_n40, errno_str_n41, errno_str_n42, errno_str_n43, errno_str_n44, errno_str_n45, errno_str_n46, errno_str_n47, errno_str_n48, errno_str_n49, errno_str_n50, errno_str_n51, errno_str_n52, errno_str_n53, errno_str_n54, errno_str_n55, errno_str_n56, errno_str_n57, errno_str_n58, errno_str_n59, errno_str_n60, errno_str_n61, errno_str_n62, errno_str_n63, errno_str_n64, errno_str_n65, errno_str_n66, errno_str_n67, errno_str_n68, errno_str_n69, errno_str_n70, errno_str_n71, errno_str_n72, errno_str_n73, errno_str_n74, errno_str_n75, errno_str_n76, errno_str_n77, errno_str_n78, errno_str_n79, errno_str_n80, errno_str_n81, errno_str_n82, errno_str_n83, errno_str_n84, errno_str_n85, errno_str_n86, errno_str_n87, errno_str_n88, errno_str_n89, errno_str_n90, errno_str_n91, errno_str_n92, errno_str_n93, errno_str_n94, errno_str_n95, errno_str_n96, errno_str_n97, errno_str_n98, errno_str_n99, errno_str_n100, errno_str_n101, errno_str_n102, errno_str_n103, errno_str_n104, errno_str_n105, errno_str_n106, errno_str_n107, errno_str_n108, errno_str_n109, errno_str_n110, errno_str_n111, errno_str_n112, errno_str_n113, errno_str_n114, errno_str_n115, errno_str_n116, errno_str_n117, errno_str_n118, errno_str_n119, errno_str_n120, errno_str_n121, errno_str_n122, errno_str_n123, errno_str_n124, errno_str_n125, errno_str_n126, errno_str_n127, errno_str_n128, errno_str_n129, errno_str_n130, errno_str_n131, errno_str_n132, errno_str_n133
errno_str_n0: db "Success"
errno_str_n1: db "Operation not permitted"
errno_str_n2: db "No such file or directory"
errno_str_n3: db "No such process"
errno_str_n4: db "Interrupted system call"
errno_str_n5: db "Input/output error"
errno_str_n6: db "No such device or address"
errno_str_n7: db "Argument list too long"
errno_str_n8: db "Exec format error"
errno_str_n9: db "Bad file descriptor"
errno_str_n10: db "No child processes"
errno_str_n11: db "Resource temporarily unavailable"
errno_str_n12: db "Cannot allocate memory"
errno_str_n13: db "Permission denied"
errno_str_n14: db "Bad address"
errno_str_n15: db "Block device required"
errno_str_n16: db "Device or resource busy"
errno_str_n17: db "File exists"
errno_str_n18: db "Invalid cross-device link"
errno_str_n19: db "No such device"
errno_str_n20: db "Not a directory"
errno_str_n21: db "Is a directory"
errno_str_n22: db "Invalid argument"
errno_str_n23: db "Too many open files in system"
errno_str_n24: db "Too many open files"
errno_str_n25: db "Inappropriate ioctl for device"
errno_str_n26: db "Text file busy"
errno_str_n27: db "File too large"
errno_str_n28: db "No space left on device"
errno_str_n29: db "Illegal seek"
errno_str_n30: db "Read-only file system"
errno_str_n31: db "Too many links"
errno_str_n32: db "Broken pipe"
errno_str_n33: db "Numerical argument out of domain"
errno_str_n34: db "Numerical result out of range"
errno_str_n35: db "Resource deadlock avoided"
errno_str_n36: db "File name too long"
errno_str_n37: db "No locks available"
errno_str_n38: db "Function not implemented"
errno_str_n39: db "Directory not empty"
errno_str_n40: db "Too many levels of symbolic links"
errno_str_n41: db "Unknown error 41"
errno_str_n42: db "No message of desired type"
errno_str_n43: db "Identifier removed"
errno_str_n44: db "Channel number out of range"
errno_str_n45: db "Level 2 not synchronized"
errno_str_n46: db "Level 3 halted"
errno_str_n47: db "Level 3 reset"
errno_str_n48: db "Link number out of range"
errno_str_n49: db "Protocol driver not attached"
errno_str_n50: db "No CSI structure available"
errno_str_n51: db "Level 2 halted"
errno_str_n52: db "Invalid exchange"
errno_str_n53: db "Invalid request descriptor"
errno_str_n54: db "Exchange full"
errno_str_n55: db "No anode"
errno_str_n56: db "Invalid request code"
errno_str_n57: db "Invalid slot"
errno_str_n58: db "Unknown error 58"
errno_str_n59: db "Bad font file format"
errno_str_n60: db "Device not a stream"
errno_str_n61: db "No data available"
errno_str_n62: db "Timer expired"
errno_str_n63: db "Out of streams resources"
errno_str_n64: db "Machine is not on the network"
errno_str_n65: db "Package not installed"
errno_str_n66: db "Object is remote"
errno_str_n67: db "Link has been severed"
errno_str_n68: db "Advertise error"
errno_str_n69: db "Srmount error"
errno_str_n70: db "Communication error on send"
errno_str_n71: db "Protocol error"
errno_str_n72: db "Multihop attempted"
errno_str_n73: db "RFS specific error"
errno_str_n74: db "Bad message"
errno_str_n75: db "Value too large for defined data type"
errno_str_n76: db "Name not unique on network"
errno_str_n77: db "File descriptor in bad state"
errno_str_n78: db "Remote address changed"
errno_str_n79: db "Can not access a needed shared library"
errno_str_n80: db "Accessing a corrupted shared library"
errno_str_n81: db ".lib section in a.out corrupted"
errno_str_n82: db "Attempting to link in too many shared libraries"
errno_str_n83: db "Cannot exec a shared library directly"
errno_str_n84: db "Invalid or incomplete multibyte or wide character"
errno_str_n85: db "Interrupted system call should be restarted"
errno_str_n86: db "Streams pipe error"
errno_str_n87: db "Too many users"
errno_str_n88: db "Socket operation on non-socket"
errno_str_n89: db "Destination address required"
errno_str_n90: db "Message too long"
errno_str_n91: db "Protocol wrong type for socket"
errno_str_n92: db "Protocol not available"
errno_str_n93: db "Protocol not supported"
errno_str_n94: db "Socket type not supported"
errno_str_n95: db "Operation not supported"
errno_str_n96: db "Protocol family not supported"
errno_str_n97: db "Address family not supported by protocol"
errno_str_n98: db "Address already in use"
errno_str_n99: db "Cannot assign requested address"
errno_str_n100: db "Network is down"
errno_str_n101: db "Network is unreachable"
errno_str_n102: db "Network dropped connection on reset"
errno_str_n103: db "Software caused connection abort"
errno_str_n104: db "Connection reset by peer"
errno_str_n105: db "No buffer space available"
errno_str_n106: db "Transport endpoint is already connected"
errno_str_n107: db "Transport endpoint is not connected"
errno_str_n108: db "Cannot send after transport endpoint shutdown"
errno_str_n109: db "Too many references: cannot splice"
errno_str_n110: db "Connection timed out"
errno_str_n111: db "Connection refused"
errno_str_n112: db "Host is down"
errno_str_n113: db "No route to host"
errno_str_n114: db "Operation already in progress"
errno_str_n115: db "Operation now in progress"
errno_str_n116: db "Stale file handle"
errno_str_n117: db "Structure needs cleaning"
errno_str_n118: db "Not a XENIX named type file"
errno_str_n119: db "No XENIX semaphores available"
errno_str_n120: db "Is a named type file"
errno_str_n121: db "Remote I/O error"
errno_str_n122: db "Disk quota exceeded"
errno_str_n123: db "No medium found"
errno_str_n124: db "Wrong medium type"
errno_str_n125: db "Operation canceled"
errno_str_n126: db "Required key not available"
errno_str_n127: db "Key has expired"
errno_str_n128: db "Key has been revoked"
errno_str_n129: db "Key was rejected by service"
errno_str_n130: db "Owner died"
errno_str_n131: db "State not recoverable"
errno_str_n132: db "Operation not possible due to RF-kill"
errno_str_n133: db "Memory page has hardware error"
errno_str_unknown: db "%s: Unknown error %d", 0x0A, 0
errno_str_known: db "%s: %s", 0x0A, 0

section .text
extern printf

global strerror
strerror:
    cmp rdi, 0
    jle .retunknown
    cmp rdi, 133
    jg .retunknown

    shl rdi, 3
    add rdi, errno_strs_arr
    mov rax, QWORD [rdi]
    ret

.retunknown:
    mov rax, 0
    ret

global perror
perror:
    push rax
    push rdi
    mov rdi, rax
    call strerror

    cmp rax, 0
    je .not_found

    pop rdi
    push rax
    push rdi
    mov rdi, errno_str_known
    call printf
    pop rax
    ret
    
.not_found:
    mov rdi, errno_str_unknown
    call printf
    ret