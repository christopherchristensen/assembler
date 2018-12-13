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

**TODO** Melvin?



## Schlussgedanken



### Fazit Christopher Christensen

Obwohl man  zu Beginn eine relativ grosse Hürde überwinden muss, empfinde ich Assembly als sehr lohnenswert zu lernen. Es verschafft einem ein besseres Verständnis wie Prozessoren im Allgemeinen aufgebaut sind, der Prozessor auf Instruktionen zugreift und diese ausführt, Daten in Registern zwischengespeichert und Daten im Memory repräsentiert und abgerufen werden. Es erlaubt einem auch sich besser vorzustellen, wie higher-level Programmiersprachen funktionieren und vorallem auch was der Sinn dahinter ist. Für jene, die sich eine neue Sprache aneignen wollen, kann ich Assembly nur anraten. Ich werde mich auf jeden Fall weiterhin damit beschäftigen.



### Fazit Melvin Werthmüller

**TODO** Melvin