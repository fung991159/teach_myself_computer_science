// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// define variables
@i  // @16
M=1

@sum // @17
M=0

(LOOP)
    // if (i > R1) goto @STOP
    @i
    D=M
    @R1
    D=D-M
    @STOP
    D;JGT


    // sum = sum + RAM[0]
    @R0
    D=M
    @sum
    M=M+D

    // i = i + 1
    @i
    M=M+1
    D=M

    // start looping until  condition met
    @LOOP
    0; JMP

(STOP)
    // R2 = sum
    @sum
    D=M
    @R2
    M=D

(END)
    @END
    0;JMP