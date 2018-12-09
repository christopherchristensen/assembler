# PCP - Assembly



## Was ist Assembly?

* Low-level Programmiersprache
* Spezifisch für eine bestimmte Computer-Architektur (spezifische Typen von Prozessoren), die Instruktionen in symbolischen Code representieren
* Wird in ausführbaren Maschinencode konvertiert durch ein Dienstprogramm (Assembler), wie NASM oder MASM

* Abstraktion von Maschinencode für bessere Verständlichkeit



## Vorteile von Assembly

* verwendet weniger Memory und Ausführzeiten
* Erlaubt hardwarespezifisch komplexere Aufgaben einfacher umzusetzen
* geeignet für zeitkritische Aufgaben
* geeignet für Interrupt Service Routines
* geeignet für Memory Resident Programme



## Haupt-Features einer PC-Hardware

* Besteht aus
  * Prozessor
  * Memory
  * Registern: Prozessorkomponente die Daten und Addressen halten

* 1 byte = 9 bits (8 bits für Daten, 1 bit für Parity)



## Datengrössen eines Prozessors

Prozessor unterstützt folgende Datengrössen:

* Word: 2-byte item
* Doubleword: 4-byte (32 bit) item
* Quadword: 8-byte (64 bit) item
* Paragraph: 16-byte (128 bit) area
* Kilobyte: 1024 bytes
* Megabyte: 1048576 bytes



## Daten in Memory adressieren

* The process through which the processor controls the execution of instructions is referred as the **fetch-decode-execute cycle** or the **execution cycle**. It consists of three continuous steps:
  * Fetching the instruction from memory
  * Decoding or identifying the instruction
  * Executing the instruction

* processor may access one or more bytes of memory at a time
* processor stores data in reverse-byte sequence. 
  * E.g. 0725H (H for hex)
  * 07: high-order byte (most significant byte)
  * When the processor gets the numeric data from memory to register, it again reverses the bytes

![reverse-byte-sequence](/Users/christopher/Development/studies/github/assembler/docs/img/reverse-byte-sequence.png)



## Welche Arten von Memory-Addressen gibt es?

* Absolute Adresse: direkte Referenz auf einen spezifischen Ort
* Segmentadresse (auch Offset): Startadresse eines Memorysegments mit Offset-Wert



## In welche 3 Teile kann ein Assembly Programm aufgeteilt werden?

* data: 

  * initialisierte Daten oder Konstanten deklarieren 
  * ändern sich nicht zur Laufzeit
  * The syntax for declaring data section is: `section.data` 

* bss:

  * Variablen deklarieren
  * Syntax: `section.bss` 

* text:

  * Ort wo eigentlicher Quellcode ist
  * Syntax:

  ```assembly
  section.text
     global _start
  _start:
  ```


## Syntax

* Kommentare: `; comment` 



## Welche Statements kennt Assembly?

* Executable instructions or instructions,
* Assembler directives or pseudo-ops, and
* Macros



## Local Environment Setup

https://www.tutorialspoint.com/assembly_programming/assembly_environment_setup.htm



## Memory Segments

* Segmented Memory Model teilt den Systemspeicher in Gruppen unabhängiger Segmente, die durch Pointer (in den Segmentregistern) referenziert werden, auf
* Jedes Segment wird verwendet um einen spezifischen Datentypen zu beinhalten
* One segment is used to contain instruction codes, another segment stores the data elements, and a third segment keeps the program stack.



## Registers

* The registers store data elements for processing without having to access the memory. A limited number of registers are built into the processor chip

* Registers are grouped into three categories (IA-32 architecture)
  - General registers,
    - Data registers,
    - Pointer registers, and
    - Index registers.
  - Control registers, and
  - Segment registers.



### Data Registers

* Four 32-bit data registers

* Used for arithmetic, logical, and other operations

* Used in 3 ways:

  - As complete 32-bit data registers: EAX, EBX, ECX, EDX.

  - Lower halves of 32-bit registers can be used as four 16-bit data registers: 

    AX, BX, CX, DX.

  - Lower and higher halves of the above-mentioned four 16-bit registers can be used as eight 8-bit data registers: AH, AL, BH, BL, CH, CL, DH, and DL.

* **AX**: primary accumulator (I/O, arithmetic instructions)
* **BX**: base register (indexed addressing)
* **CX**: count register (store loop count in iterative operations)
* **DX**: data register (I/O, also used with AX register along with DX for multiply and divide operations involving large values)



### Pointer Registers

* 32-bit EIP, ESP and EBP registers and
* corresponding 16-bit right portions IP, SP and BP
* 3 categories:
  * **IP**: Instruction Pointer (stores offset address of next instruction)
  * **SP**: Stack Pointer (provides offset value within program stack)
  * **BP**: Base Pointer (helps in referencing parameter variables passed to subrouting)



### Control Register

* 32-bit instruction pointer register and the 32-bit flags register
* instructions involve comparisons and mathematical calculations and change the status of the flags and some other conditional instructions test



### Segment Registers

* specific areas defined in a program for containing data, code and stack

* Code, Data and Stack Segment



## System Calls

* APIs for the interface between the user space and the kernel space
* How to make system calls
  * Put the system call number in the EAX register.
  * Store the arguments to the system call in the registers EBX, ECX, etc.
  * Call the relevant interrupt (80h).
  * The result is usually returned in the EAX register.

| %eax | Name      | %ebx           | %ecx         | %edx   | %esx | %ed  |
| ---- | --------- | -------------- | ------------ | ------ | ---- | ---- |
| 1    | sys_exit  | int            | -            | -      | -    | -    |
| 2    | sys_fork  | struct pt_regs | -            | -      | -    | -    |
| 3    | sys_read  | unsigned int   | char *       | size_t | -    | -    |
| 4    | sys_write | unsigned int   | const char * | size_t | -    | -    |
| 5    | sys_open  | const char *   | int          | int    | -    | -    |
| 6    | sys_close | unsigned int   | -            | -      | -    | -    |



## Addressing Modes

Most assembly language instructions require operands to be processed. An operand address provides the location, where the data to be processed is stored.



### Register Addressing

* Register contains the operand
* Depending upon the instruction, the register may be the first operand, the second operand or both
* As processing data between registers does not involve memory, it provides fastest processing of data.



### Immediate Addressing

* Operand has constant value or an expression
* When an instruction with two operands uses immediate addressing, the first operand may be a register or memory location, and the second operand is an immediate constant. The first operand defines the length of the data.



### Direct Memory Addressing

* When operands are specified in memory addressing mode, direct access to main memory, usually to the data segment, is required. This way of addressing results in slower processing of data. 



