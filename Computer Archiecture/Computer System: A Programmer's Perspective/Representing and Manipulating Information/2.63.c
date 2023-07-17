#include "show_bytes.h"
#include <stdio.h>

unsigned srl(unsigned x, int k)
{

    /* Perform shift arithmetically */
    printf("x: ");
    show_bytes((byte_pointer)&x, sizeof(unsigned));
    unsigned xsra = (int)x >> k; // 87 65 43 21 -> FF 87 65 43
    printf("xsra: ");
    show_bytes((byte_pointer)&xsra, sizeof(unsigned));

    /* final desired output : 0x00 87 65 43
    to get to this this i need a mask of 0x00 FF FF FF, which is the invert
    of 0xFF 00 00 00
    using only left shift since right shift is not allowed
    */

    // get the size of unsigned
    int w = 8 * sizeof(int);

    // get the amount of left shift reqiured
    int shift_by = w - k; // 32 - 16 = 16
    printf("shift left by: %d bits\n", shift_by);

    unsigned base_mask = ~0x00 << shift_by; // FF FF 00 00
    unsigned mask = ~base_mask;             // 00 00 FF FF

    printf("mask: ");
    show_bytes((byte_pointer)&mask, sizeof(unsigned));
    unsigned output = xsra & mask;
    printf("output: ");
    show_bytes((byte_pointer)&output, sizeof(unsigned));
    return output;
}

int sra(int x, int k)
{
    /* Perform shift logically */
    printf("x: ");
    show_bytes((byte_pointer)&x, sizeof(unsigned));
    int xsrl = (unsigned)x >> k; // given k=16, 87 65 43 21 -> 00 00 87 65
    printf("xsrl: ");
    show_bytes((byte_pointer)&xsrl, sizeof(unsigned));

    /* sra is different in a sense that there are 2 cases
        1. if x is positive, then sra and srl are the same
        2. if x is negative, then sra is different from srl, only when x was
           originally negative, then the funciton need to add back all the 1s in
           shifted bit
    */
    if (x >= 0)
    {
        return srl(x, k);
    }
    else
    {
        // get the size of unsigned
        int w = 8 * sizeof(int);

        // get the amount of left shift reqiured
        int shift_by = w - k;
        printf("shift left by: %d bits\n", shift_by);

        unsigned mask = ~0x00 << shift_by; // FF FF 00 00
        // show_bytes((byte_pointer)&test, sizeof(int));
        return xsrl | mask;
    }
}

void main()
{
    int k = 16;
    // srl test case
    unsigned x = 0x87654321;
    unsigned expected_output = x >> k;
    unsigned output = srl(x, k);
    show_bytes((byte_pointer)&output, sizeof(unsigned));
    // check if output is equal to expected output
    printf("test srl is true: %d\n", output == expected_output);

    // sra test case
    int positive_x = 0x12345678; // positive number
    int positive_expected_output = positive_x >> k;
    int positive_output = sra(positive_x, k);
    printf("test positive srl is true: %d\n", positive_output == positive_expected_output);

    int negative_x = 0x87654321; // negative number
    int negative_expected_output = negative_x >> k;
    int negative_output = sra(negative_x, k);
    // show_bytes((byte_pointer)&negative_output, sizeof(int));
    printf("test negative srl is true: %d\n", negative_output == negative_expected_output);
}

// 0111 1111100010010001101000101011
// 7F891A2B
// workflow
// 1. 1 -> 00000001