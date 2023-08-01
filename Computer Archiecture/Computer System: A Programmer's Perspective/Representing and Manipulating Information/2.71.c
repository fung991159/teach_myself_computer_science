#include <stdio.h>
#include "show_bytes.h"
#include <assert.h>

/* Declaration of data type where 4 bytes are packed
into an unsigned */
typedef unsigned packed_t;
/* Extract byte from word. Return as signed integer */
int xbyte(packed_t word, int bytenum)
{
    int shift_pos = (bytenum << 3);
    int target_bytes = (word >> shift_pos) & 0xFF;
    show_bytes((byte_pointer)&target_bytes, sizeof(int));

    // put target_bytes back to msb positon
    int back_to_msb = target_bytes << (32 - shift_pos);
    show_bytes((byte_pointer)&back_to_msb, sizeof(int));

    // hard code right shift 24 bits, since we just want to extend it
    int output = back_to_msb >> 24;
    show_bytes((byte_pointer)&output, sizeof(int));
    // return target_bytes;
}

// 1. extract byte from word
// 2. find msb of the extract byte
// 3. extend the msb to 32 bits

void main()
{
    int r = xbyte(-1869, 1);
    printf("%d\n", r);
}

/*

bytenum = 0
(bytenum << 3) = 0

bytenum = 1
(bytenum << 3) = 8

bytenum = 2 (0000 0010 -> 0001 0000)
(bytenum << 3) = 16

bytenum = 3 (0000 0011 -> 0001 1000)
(bytenum << 3) = 24

*/