section	.text
   global _start   ;must be declared for linker (ld)
	
_start:	
 		
   mov  eax, 8      ; fn INPUT
   
   mov  ebx, 0      ;EBX will store the sum
   mov  ecx, 0      ;ECX will be temp dir

   PUSH 1           ; base case f2 = 1
   PUSH 1           ; base case f1 = 1
 
   CMP eax, 2
   JG norm
   
   MOV ebx, 1
   JMP done
   
norm:  
   SUB eax, 2
   
top:  
   POP ecx
   MOV [fn_1], ecx
   POP ecx
   MOV [fn_2], ecx
   
   MOV ebx, 0   ; calc
   ADD ebx, [fn_2]
   ADD ebx, [fn_1]
   
   
   MOV ecx, 0
   ADD ecx, [fn_1]
   PUSH ecx    ;preview fn-1 is new fn-2
   PUSH ebx      ;calculated fn is new fn-1
   
   DEC eax
   JNZ top
  
done: 

   add  ebx, '0'   ; number -> ascii
   mov  [sum], ebx ;done, store result in "sum"

display:

   mov  edx, 1      ;message length
   mov  ecx, sum   ;message to write
   mov  ebx, 1     ;file descriptor (stdout)
   mov  eax, 4     ;system call number (sys_write)
   int  0x80       ;call kernel

exit:
   mov  eax, 1     ;system call number (sys_exit)
   int  0x80       ;call kernel

section	.data
fn_1:    
   db  1    ;fn-1
fn_2:
   db  1    ;fn-2

sum: 
   db  0