// Write C expressions to generate the bit patterns that follow, where a^k represents
// k repetitions of symbol a. Assume a w-bit data type. Your code may contain
// references to parameters j and k, representing the values of j and k, but not a
// parameter representing w.
// A. 1^(w−k) 0k

// 1^(w-k) = -1 << (w - k)
// 0^k = -1 << k

#include <stdio.h>
#include <assert.h>
#include "show_bytes.h"
#include <limits.h>

int generate_bit_patterns_A(int k)
{
    int msb_part = -1 << k;
    show_bytes((byte_pointer)&msb_part, sizeof(int));
}

int generate_bit_patterns_B(int j, int k)
{
    int left_part = ~(-1 << (k + j));
    show_bytes((byte_pointer)&left_part, sizeof(int));

    int right_part = -1 << j;
    show_bytes((byte_pointer)&right_part, sizeof(int));

    int output = -1 & left_part & right_part;
    show_bytes((byte_pointer)&output, sizeof(int));
}

void main()
{
    generate_bit_patterns_B(0, 2);
}
