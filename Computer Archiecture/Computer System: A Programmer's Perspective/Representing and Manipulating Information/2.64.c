#include "show_bytes.h"
#include <stdio.h>

// Write code to implement the following function:
/* Return 1 when any odd bit of x equals 1; 0 otherwise.
Assume w=32 */
int any_odd_one(unsigned x)
{

    unsigned mask = 0xAAAAAAAA; // 10101010101010101010101010101010

    // the masked value will keep at least 1 bit if any odd bit of x equals 1
    unsigned masked = x & mask;
    show_bytes((byte_pointer)&masked, sizeof(unsigned int));
    return !!masked; // this is a trick that I only know in this exercise, the first ! will convert any non-zero value to 0, and the second ! will convert 0 to 1, and any non-zero value to 0, hence achieving the result we want
};

void main()
{
    unsigned x = 0x04;
    int output = any_odd_one(x);
    printf("Output: %d\n", output);
}