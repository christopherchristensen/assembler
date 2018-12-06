# Themenfokus



## RISC / CISC

* Typen oder Kategorien von Prozessoren
* mit Instruction Set Architecture (ISA)
  $\to$  medium whereby a processor communicates with the human programmer
* Instruction Set =  entire collection of instructions for a given processor
* Many microprocessors today hold a mix of RISC- and CISC-like attributes



### RISC

* **R**educed **I**nstruction **S**et **C**omputer
* streamlined version of CISC
* Was needed because of the progression from 8- and 16-bit to 32-bit architectures 

> Examples: MIPS, PowerPC, Atmel’s AVR, Microchip PIC processors, Arm processors, RISC-V, and all modern microprocessors have at least some elements of RISC



### CISC

* **C**omplex **I**nstruction **S**et **C**omputer
* Predecessor of RISC
* 

> Examples: Motorola 68000 (68K), DEC VAX, PDP-11, several generations of the Intel x86, and 8051



### RISC vs. CISC

| CISC                                                         | RISC                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| CISC machines can have special instructions as well as instructions that take more than one cycle to execute. This means that the same instruction executed on a CISC architecture might take several instructions to execute on a RISC machine | Considered as an improvement over CISC                       |
| The CISC architecture can execute one, albeit more complex instruction, that does the same operations, all at once, directly upon memory | Unit Format for instructions                                 |
| CISC emphasizes efficiency in instructions per program       | Easily pipelined instructions                                |
| CISC ISAs use more transistors in the hardware to implement more instructions and more complex instructions as well | RISC-based machines execute one instruction per clock cycle  |
| CISC has an emphasis on smaller code size and uses less RAM overall than RISC | The RISC architecture will need more working (RAM) memory than CISC to hold values as it loads each instruction, acts upon it, then loads the next one |
|                                                              | RISC architecture requires more RAM but always executes one instruction per clock cycle for predictable processing (good for pipelining) |
|                                                              | RISC emphasizes efficiency in cycles per instruction         |
|                                                              | RISC has an emphasis on larger program code sizes            |
|                                                              | The RISC ISA emphasizes software over hardware               |
|                                                              | RISC instruction set requires one to write more efficient software with fewer instructions |

![riscvscisc](/Users/christopher/Development/studies/github/assembler/docs/img/riscvscisc.png)

![riscvscisc2](/Users/christopher/Development/studies/github/assembler/docs/img/riscvscisc2.png)

## Basic Instructions





## Zusammenspiel mit HW





## Codebeispiel für einen RISC-Prozessor

