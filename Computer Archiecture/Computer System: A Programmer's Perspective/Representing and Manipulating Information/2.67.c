#include <stdio.h>
#include "show_bytes.h"

int int_size_is_32()
{
    // get the bit lenght of integer
    // int bit_length = sizeof(int) * 8;
    int w = sizeof(int) << 3;
    int set_msb = 1 << w - 1; // set msb to 1, and the rest 0. So it is the most negative number of integers: -2147483648
    show_bytes((byte_pointer)&set_msb, sizeof(unsigned int));
    return set_msb == -2147483648;
}

int int_size_is_16()
{
    // get the bit lenght of integer
    // int bit_length = sizeof(int) * 8;
    int w = sizeof(int) << 3;
    int set_msb = 1 << w - 1; // set msb to 1, and the rest 0. So it is the most negative number of integers: -2147483648
    show_bytes((byte_pointer)&set_msb, sizeof(unsigned int));
    return set_msb == -32768;
}

int main()
{
    // bad_int_size_is_32();
    printf("%d\n", bad_int_size_is_32());
}

/*
1 << 31
0x80000000
1 << 32
0x00000000
*/