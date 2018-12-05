SYS_EXIT  equ 1
SYS_WRITE equ 4
STDOUT    equ 1

section	.text
   global _start    ;must be declared for using gcc
	
_start:             ;tell linker entry point

   ; moving the first number to eax register and second number to ebx
   ; and subtracting ascii '0' to convert it into a decimal number
   mov	eax, '3'
   sub  eax, '0'
	
   mov 	ebx, '4'
   sub  ebx, '0'
   
   
   ; add eax and ebx
   ; add '0' to to convert the sum from decimal to ASCII
   add 	eax, ebx
   add	eax, '0'
	
   ; storing the sum in memory location sum
   mov 	[sum], eax
	
   mov	ecx, sum
   mov	edx, 1  ;lenght of output
   mov	ebx, STDOUT	;file descriptor (stdout)
   mov	eax, SYS_WRITE	;system call number (sys_write)
   int	0x80	;call kernel

_exit:    
   mov	eax, SYS_EXIT	;system call number (sys_exit)
   int	0x80	;call kernel
	
segment .bss ;memory
   sum resb 1