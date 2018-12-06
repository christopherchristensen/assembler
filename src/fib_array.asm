section	.text
   global _start   ;must be declared for linker (ld)
	
_start:	
 		
   mov  eax, 0      ;counter;number bytes to be summed 
   mov  ebx, 0      ;EBX will store the sum
   mov  ecx, x      ;ECX will point to the current element to be summed

   ; INPUT *******
   add  ecx, 2      ; ENTER: Fib Zahl n
   ; *************
   
   CMP  ecx, 3      
   JGE  normal      ; handle normal case
   
   mov ebx, 1       ; handle base case f1, f2
   JMP done
      
   
normal:
   sub  ecx, 3   
   
top:  

   add  ebx, [ecx] ; add value of element to sum
   add  ecx,1      ; move pointer to next element
   
   INC  eax        ;decrement counter
   CMP  eax, 2
   JE   done       ;if counter not 2, then loop again
  
   JMP top

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
global x
x:    
   db  1    ;f1
   db  1    ;f2
   db  2    ;f3
   db  3    ;f4
   db  5    ;f5
   db  8    ;f6
   db  17   ;f7

sum: 
   db  0