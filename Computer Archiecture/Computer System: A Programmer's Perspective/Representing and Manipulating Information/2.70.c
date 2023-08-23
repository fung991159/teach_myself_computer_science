#include <stdio.h>
#include "show_bytes.h"
#include <assert.h>
// Write code for the function with the following prototype:
// /*
// * Return 1 when x can be represented as an n-bit, 2’s-complement
// * number; 0 otherwise
// * Assume 1 <= n <= w
// */
// int fits_bits(int x, int n);
// Your function should follow the bit-level integer coding rules (page 164).

int fits_bits(int x, int n)
{
    printf("original bits:");
    show_bytes((byte_pointer)&x, sizeof(unsigned));

    // retain only the bits to the left of n
    int outer_bits = x >> n;
    printf("outer_bits:");
    show_bytes((byte_pointer)&outer_bits, sizeof(unsigned));

    // if n is a postive number, then all the forward bits will be 0
    printf("leading_bit_all_zeros:");
    int leading_bit_all_zeros = (outer_bits == 0);
    show_bytes((byte_pointer)&leading_bit_all_zeros, sizeof(unsigned));

    // if n is a negative number, then all the forward bits will be 1
    printf("leading_bit_all_ones:");
    int all_ones = ~0;
    int leading_bit_all_ones = (outer_bits == all_ones);
    show_bytes((byte_pointer)&leading_bit_all_ones, sizeof(unsigned));

    // check if above conditions are met, if either of them is not true, then x
    // cannot represent as an n bits
    int output = leading_bit_all_zeros | leading_bit_all_ones;
    return output;
}

void main()
{

    int result = fits_bits(16, 4);
    printf("%d\n", result);
    assert(fits_bits(15, 4) == 1);     // true
    assert(fits_bits(17, 4) == 0);     // false
    assert(fits_bits(-16, 16) == 1);   // true
    assert(fits_bits(65537, 16) == 0); // false
}

// get the chuck of bits outside n bits
// see if there is any one in it, if yes then it doesn't fit, if no then ok

// example: x = 15 = 0000 1111, n = 8
// x >> 8

// given n= 4 , x = 16 (0001 0000)
// outbit = x >> 28

// if x = -16 (.... 1111 0000)

// all front 1 bits are ok
// it is within range:
// if x is positive: then all outer_bits are 0s
// if x is negative: then all outer_bits are 1s
// so basically we want to check all outer_bits must be either all 0 or all 1s