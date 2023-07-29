
#include <stdio.h>
#include "show_bytes.h"
// #include "2.67.c"
/*
 * Mask with least signficant n bits set to 1
 * Examples: n = 6 --> 0x3F, n = 17 --> 0x1FFFF
 * Assume 1 <= n <= w
 */

int lower_one_mask(int n)
{
    // show_bytes((byte_pointer)&n, sizeof(n));
    int w = sizeof(int) << 3; // Compute the number of bits in an integer
    int all_ones = ~0;

    int shifted = all_ones << n;
    printf("shifted:");
    show_bytes((byte_pointer)&shifted, sizeof(shifted));

    int result = ~shifted;
    printf("result:");
    show_bytes((byte_pointer)&result, sizeof(result));
};
void main() { lower_one_mask(2); };

/*
basically the quesiton is asking to mainpulate bit by using int

0011 1111   (n=6)

int 6 in bits = 0110

0000 0001
0010 0000

how to make 0010 0000 becomes 0011 1111
1. shift left by n bits
2.







0010 0000
0001 0000 x >>1
0011 0000 result

0011 0000
0000 1100 x >> 2
0011 1100 result




*/
