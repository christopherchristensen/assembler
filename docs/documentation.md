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

