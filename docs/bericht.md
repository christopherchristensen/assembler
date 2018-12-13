# PCP Bericht: Assembly

> Christopher Christensen, Melvin Werthmüller

In diesem Bericht wird die low-level Programmiersprache Assembly genauer betrachtet. Da die Implementation von Assembly auf den Prozessortyp (sprich Instruction Set) abhangt und nicht wie andere Sprachen eine einzige Form einer Sprache repräsentiert, beschränken wir uns auf Intel-32 Prozessoren wie Pentium. Als Assembler verwenden wir NASM, weil dieser gratis, stark verbreitet und dadurch gut dokumentiert ist. 



## NASM installieren



### Requirements

Um NASM zu installieren brauchen sie

* einen IBM PC (oder equivalent kompatibler PC)
* ein Linux Betriebssystem
* eine Kopie von NASM ([https://www.nasm.us/pub/nasm/releasebuilds/2.14/](https://www.nasm.us/pub/nasm/releasebuilds/2.14/) , `nasm-2.14.tar.gz`)



### Installation

* Heruntergeladene Zip-File auspacken
* Öffnen Sie Ihr Terminal und bewegen Sie sich in das entpackte *nasm* Verzeichnis
* Geben Sie `./configure` in die Kommandozeile ein. Dies findet den geeigneten C-Kompiler für Ihre Maschine und bereit die Make-Files vor
* Geben Sie `make` ein, um die Binaries und *nasm* zu builden
* Geben Sie `make install` ein, um *nasm* zu installieren
* Mit `whereis nasm` können Sie überprüfen, ob die Installation erfolgreich war



## Was ist Assembly?

Assembly ist wie bereits erwähnt eine low-level Programmiersprache. Diese dient als eine Abstraktion von Maschinencode für das bessere Verständnis. Wie bereits erwähnt hat Assembly verschiedene Implementationen, die jeweils von der bestimment Computer-Architektur, sprich ihrer Prozessor-Architektur, abhangt. Assembly wird in schlussendlich ausführbaren Maschinencode konvertiert durch Dienstprogramm (Assembler), wie NASM oder MASM (für Microsoft).



## Why Assembly and why not

### Vorteile

Assembly ist eine sehr hardwarenahe Programmiersprache, weshalb sie weniger Memory und kürze Ausführzeiten besitzt. Sie erlaubt durch ihre Hardware-Nähe auch hardwarespezifisch komplexere Aufgaben einfacher umzusetzen. Sie ist also für beispielsweise folgende Aufgaben nützlich:

* zeitkritische Aufgaben
* Interrupt Service Routines
* Memory Resident Programme



### Nachteile

Als Programmiersprache hat Assembly eigentlich nur eine aber sehr relevante Schwäche. Assembly ist sehr aufwändig und kompliziert, wenn es darum geht grosse und komplexe Software zu entwickeln.



## RISC / CISC

Bei RISC und CISC handelt es sich um zwei fundamentell verschiedene Prozessor-Architekturen. CISC, kurz für Complex Instruction Set Computer, kann eine Serie von Instruktionen und somit ein Programm in so wenig Zeilen wie möglich lesen und abarbeiten. RISC, kurz für Reduced Instruction Set Computer, arbeitet simple Instruktionen in einem einzigen Clock-Cycle ab. Grundsätzlich ist RISC weniger performativ, da es am Ende mehr Zeilen von Code braucht und mehr RAM benötigt, um ein gleiches Program in CISC auszuführen.  Trotzdem hat RISC Vorteile. 

**TODO** James ;)

 *Because each instruction requires only one clock cycle to execute, the entire program will execute in approximately the same amount of time as the multi-cycle "MULT" command. These RISC "reduced instructions" require less transistors of hardware space than the complex instructions, leaving more room for general purpose registers. Because all of the instructions execute in a uniform amount of time (i.e. one clock), pipelining is possible.*



In der folgenden Tabelle sieht man einen generellen Vergleich der beiden Architekturen.

| CISC                                                         | RISC                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| Schwerpunkt Hardware                                         | Schwerpunkt Software                                         |
| Multi-clock komplexe Anweisungen                             | Single-clock (reduced instruction only)                      |
| Weniger Code, hohe Zyklen pro Sekunde                        | Mehr Code, niedrige Zyklen pro Sekunde                       |
| Transistoren zum Speichern verwendet komplexe   Anweisungen  | Verwendet mehr Transistoren in den Speicherregistern         |
| Memory-to-memory: "LOAD" und "STORE" in Anweisungen eingebettet | Register-to-register: "LOAD" und "STORE" unabhängige Anweisungen |

* Beispiele von CISC sind: Motorola 68000 (68K), DEC VAX, PDP-11, mehrere Generationen von Intel x86, und 8051
* Beispiele von RISC sind: MIPS, PowerPC, Atmel’s AVR, Microchip PIC processors, Arm processors, RISC-V, und alle modernen Mikroprozessoren haben mindestens Elemente von RISC



> **Fun Facts**: Wurde wegen des Fortschreitens von 8- und 16-Bit- zu 32-Bit-Architekturen benötigt. Viele Prozessoren sind heute ein Mix aus CISC und RISC.



## Basic Instruction

In folgender Tabelle sind einige wichtige Operationen aufgelistet.

| Anweisung | Beschreibung                             |
| --------- | ---------------------------------------- |
| `mov`     | Bewegt einen Wert in ein Register (move) |
| `add`     | Addition                                 |
| `sub`     | Subtraktion                              |
| `mul`     | Multiplikation                           |
| `div`     | Division                                 |
| `push`    | Wert auf Stack pushen                    |
| `pop`     | Wert von Stack entfernen                 |
| `int`     | Interrupt                                |

Die Operationen werden meistens folgendermassen ausgeführt: `operation [operand, …]`. Nachfolgend sind zwei Beispiele aufgelistet:

```assembly
mov ebx, 123		; ebx  = 123
add ebx, ecx		; ebx += ecx
mul 5				; ebx *= 5
div edx				; ebx *= edx (mul und div implizit Register ebx zugewiesen)
```



### System Calls

**TODO** James

| eax  | System Call |
| ---- | ----------- |
| 1    | sys_exit    |
| 2    | sys_fork    |
| 3    | sys_read    |
| 4    | sys_write   |
| 5    | sys_open    |
| 6    | sys_close   |



## Zusammenspiel mit HW

### Register

**TODO** James



### Memory Addressing

**TODO** James



## Codebeispiele
Folgende Codebeispiele können mit dem online NASM compiliert und ausgeführt werden: [https://www.tutorialspoint.com/compile_asm_online.php](https://www.tutorialspoint.com/compile_asm_online.php)

### Counter über einen Stack
```assembly
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
```

### Summe zweier Zahlen
```assembly
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
```

### Begrenzte Fibbonaciberechnung mit einem Array
```assembly
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
```

### Fibbonaciberechnung über den Stack
```assembly
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
```


## Schlussgedanken



### Fazit Christopher Christensen

Obwohl man zu Beginn eine relativ grosse Hürde überwinden muss, empfinde ich Assembly als sehr lohnenswert zu lernen. Es verschafft einem ein besseres Verständnis wie Prozessoren im Allgemeinen aufgebaut sind, der Prozessor auf Instruktionen zugreift und diese ausführt, Daten in Registern zwischengespeichert und Daten im Memory repräsentiert und abgerufen werden. Es erlaubt einem auch sich besser vorzustellen, wie higher-level Programmiersprachen funktionieren und vorallem auch was der Sinn dahinter ist. Für jene, die sich eine neue Sprache aneignen wollen, kann ich Assembly nur anraten. Ich werde mich auf jeden Fall weiterhin damit beschäftigen.



### Fazit Melvin Werthmüller

Ich finde Assembler eine Sprache, welche man in seiner Karriere als Software-Entwickler, angeschaut haben muss. Es gibt ein gutes Verständniss über die Funktionsweise eines Prozessors und zwingt so die Denkweise an zu passen. Mit Hilfe der Maschinennahen Instruktionen, kann ein hoch effizientes Programm erstellt werden. Dies ist aber vorallem für komplexere Vorgehen eine sehr anspruchsvolle Angelegenheit. Assembler werde ich nur in erwägung ziehen, wenn dies unbedingt notwendig ist. Ansonsten bevorzuge ich Programmiersprachen, auf einem höheren Abstraktionslevel.