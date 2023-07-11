#include <stdio.h>

typedef unsigned char *byte_pointer;
void show_bytes(byte_pointer start, size_t len)
{
    int i;
    for (i = 0; i < len; i++)
        printf(" %.2x", start[i]);
    printf("\n");
}
/*
Suppose we number the bytes in a w-bit word from 0 (least significant) to w/8 − 1
(most significant). Write code for the following C function, which will return an
unsigned value in which byte i of argument x has been replaced by byte b:
unsigned replace_byte (unsigned x, int i, unsigned char b);
Here are some examples showing how the function should work:

0x12 34 56 78
replace_byte(0x12345678, 2, 0xAB) --> 0x12AB5678
replace_byte(0x12345678, 0, 0xAB) --> 0x123456AB

0x12345678 becomes 0x34567800
*/

/*



    3.

*/

unsigned replace_byte(unsigned x, int i, unsigned char b)
{
    // replace_byte(0x12345678, 2, 0xAB) ->  0x12AB5678
    // 1. I want to have 0x12005678 and 0x00AB0000, then OR them together to
    //    result
    //    0x00AB0000 = shift b by i * 8 bit
    //    0x12005678 = x & 0x00FF0000

    // shift b by the appropriate number of bits to the left (if i==0 no
    // shifting, if i==1 shift by 8 etc.)
    unsigned char shift_by = (unsigned char)8 * i;
    // printf("shift_by: %u bits\n ", shift_by);
    unsigned shifted_b = b << shift_by;
    // printf("shifted_b: ");
    // show_bytes((byte_pointer)&shifted_b, sizeof(unsigned));

    unsigned x_mask = 0xFF << shift_by;
    unsigned x_masked = x & ~x_mask;

    // printf("x_masked: ");
    // show_bytes((byte_pointer)&x_masked, sizeof(unsigned));
    unsigned result = x_masked | shifted_b;
    // show_bytes((byte_pointer)&result, sizeof(unsigned));

    return result;
}

void main()
{
    unsigned t1 = replace_byte(0x12345678, 2, 0xAB);
    printf("t1: ");
    show_bytes((byte_pointer)&t1, sizeof(unsigned));

    unsigned t2 = replace_byte(0x12345678, 0, 0xAB);
    printf("t2: ");
    show_bytes((byte_pointer)&t2, sizeof(unsigned));
}