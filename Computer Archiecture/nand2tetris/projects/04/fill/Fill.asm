// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(MAIN_LOOP)
    //  if keyboard pressed (value not equal to zero), GOTO PRESSED
    @KBD
    D=M

    @SCREEN_BLACK
    D; JNE

    // otherwise make screen white
    @SCREEN_WHITE
    0; JMP


(SCREEN_BLACK)
@i
M=0

(SCREEN_BLACK_LOOP)
    // if i = 8192, goto END
    @8192
    D=A
    @i
    D=M-D

    @SCREEN_STOP
    D; JEQ

    // *(@SCREEN + i) = -1
    @16384
    D=A
    @i
    A=D+M  // D: 16384/@SCREEN POINTER, M=i 
    M=-1

    // i = i + 1
    @i
    M=M+1

    // GOTO DRAW_SCREEN
    @SCREEN_BLACK_LOOP
    0; JMP

(SCREEN_WHITE)
@i
M=0

(SCREEN_WHITE_LOOP)
    // if i = 8192, goto END
    @8192
    D=A
    @i
    D=M-D

    @SCREEN_STOP
    D; JEQ

    // *(@SCREEN + i) = -1
    @16384
    D=A
    @i
    A=D+M
    M=0

    // i = i + 1
    @i
    M=M+1

    // GOTO DRAW_SCREEN
    @SCREEN_WHITE_LOOP
    0; JMP

(SCREEN_STOP)
    // after drawing black or white go back to main loop to listen for next keyboard event
    @MAIN_LOOP
    0; JMP