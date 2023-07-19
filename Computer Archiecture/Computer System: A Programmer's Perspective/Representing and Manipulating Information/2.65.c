#include <stdio.h>
#include "show_bytes.h"

/* Return 1 when x contains an odd number of 1s; 0 otherwise.
Assume w=32 */
int odd_ones(unsigned x)
{
    show_bytes((byte_pointer)&x, sizeof(x)); // 0x12345678

    x ^= x >> 16;
    show_bytes((byte_pointer)&x, sizeof(x)); // 0x12345678 ^ 0x00001234 = 0x12344444

    x ^= x >> 8;
    show_bytes((byte_pointer)&x, sizeof(x)); // 0x12344444 ^ 0x00123444 = 0x12220000
    x ^= x >> 4;
    show_bytes((byte_pointer)&x, sizeof(x)); // 0x12220000 ^ 0x01222000 = 0x11000000
    x ^= x >> 2;
    show_bytes((byte_pointer)&x, sizeof(x)); // 0x11000000 ^ 0x01100000 = 0x10100000
    x ^= x >> 1;
    show_bytes((byte_pointer)&x, sizeof(x));           // 0x10100000 ^ 0x01010000 = 0x11110000
    unsigned output = x & 1;                           // 0x11110000 & 0x00000001 = 0x00000000
    show_bytes((byte_pointer)&output, sizeof(output)); // 0x11110000 & 0x00000001 = 0x00000000
    return output;
};

int main(int argc, char const *argv[])
{
    unsigned x = 0x12345678;
    // odd_ones(x);
    printf("x = 0x%x, odd_ones(x) = %d\n", x, odd_ones(x));
    // show_bytes((byte_pointer)&x, sizeof(x));
}
