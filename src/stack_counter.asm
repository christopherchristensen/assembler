SYS_EXIT  equ 1
SYS_WRITE equ 4
STDOUT    equ 1

section	.text
   global _start    ;must be declared for using gcc
	
_start:

   mov	eax, '0' ; init number
   sub  eax, '0' ; subtracting ascii '0' to convert it into a decimal number

l1:
   INC  eax
   mov 	[sum], eax
   PUSH sum
   
   CMP eax,	'6'
   JLE  l1 ; eax <= 6
   

print:
   POP  ecx
   mov	edx, 1  ;lenght of output
   mov	ebx, STDOUT	;file descriptor (stdout)
   mov	eax, SYS_WRITE	;system call number (sys_write)
   int	0x80	;call kernel
   

_exit:    
   mov	eax, SYS_EXIT	;system call number (sys_exit)
   int	0x80	;call kernel
	
segment .bss ;memory
   sum resb 1