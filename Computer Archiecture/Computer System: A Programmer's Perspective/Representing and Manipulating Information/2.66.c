#include <stdio.h>
#include "show_bytes.h"

int leftmost_one(int x)
{
    int w = sizeof(int) << 3; // Compute w as the number of bits in the integer type (e.g., int is 32 bits)

    show_bytes((byte_pointer)&x, sizeof(x));

    // put x into vector form of 000...111

    unsigned shift_x = x >> 1; // 0000 0000 0000 0000
    // show_bytes((byte_pointer)&shift_x, sizeof(shift_x));
    x = x | shift_x; // 0000 0000 1111 1111
    show_bytes((byte_pointer)&x, sizeof(x));

    shift_x = x >> 2; // 0000 0000 0000 1111
    // show_bytes((byte_pointer)&shift_x, sizeof(shift_x));
    x = x | shift_x; // 0000 0000 1111 1111
    show_bytes((byte_pointer)&x, sizeof(x));

    shift_x = x >> 4;
    // show_bytes((byte_pointer)&shift_x, sizeof(shift_x));
    x = x | shift_x; // 0000 0000 1111 1111
    show_bytes((byte_pointer)&x, sizeof(x));

    shift_x = x >> 8;
    // show_bytes((byte_pointer)&shift_x, sizeof(shift_x));
    x = x | shift_x; // 0000 0000 1111 1111
    show_bytes((byte_pointer)&x, sizeof(x));

    shift_x = x >> 16;
    // show_bytes((byte_pointer)&shift_x, sizeof(shift_x));
    x = x | shift_x; // 0000 0000 1111 1111
    show_bytes((byte_pointer)&x, sizeof(x));

    // turn all other 1 other left most bits to 0
    shift_x = ~(x >> 1);
    unsigned output = shift_x & x;
    show_bytes((byte_pointer)&output, sizeof(output));
}

void main()
{

    int output = leftmost_one(0x6600);
    // printf("0xFF00: 0x%x\n", output);
}

/*
how  0xFF00 becomes 0x8000
0xFF00 = 1111 1111 0000 0000
0x8000 = 1000 0000 0000 0000


now I get bit vector 1111 1111 0000 0000,
how do i get to      1000 0000 0000 0000


x=0xFF00
x            = 1111 1111 0000 0000
x >> 16      = 0000 0000 1111 1111
x |= x >> 16 = 1111 1111 1111 1111

x >> 8       = 0000 1111 1111 1111
x |= x >> 16 -=

*/

// a b c d e f g h
// 0 0 0 0 a b c d  ( x >> 16)

// a b c d ae bf cg dh     (OR result)
// 0 0 a b c  d  ae  bf     (x >> 8)

// a b ac bd ace bdf aceg bdfh     (OR result: x>>8)
// 0 a b  ac bd  ace bdf aceg     (x >> 4)

// a ab abc abcd abcdef abcdefg abcdefgh  (OR result: x >> 4)

// basically we are running or on all the bits of x, hence creating a bit vecotr
// for x
//

// a b  c  d  e  f g h
// 0 a  b  c  d  e f g         ( x >> 1)
// a ab bc cd de ef fg gh     (OR result: x >> 1)

// or result >> 2
// 0 0 a ab bc cd de ef fg
// (result >> 2 or result >> 1)
