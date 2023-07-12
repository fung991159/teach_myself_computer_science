#include "show_bytes.h"
#include <stdio.h>

int int_shifts_are_arithmetic()
{
    int x = -1; // 0xFF FF FF FF

    // get msb of x
    int msb = (x & 0xFF000000);
    show_bytes((byte_pointer)&msb, sizeof(int));

    // performance arithmetic right shift of x
    int shift_x = x >> 1;

    // get msb of shift_x
    int msb_shift_x = (shift_x & 0xFF000000);
    show_bytes((byte_pointer)&msb_shift_x, sizeof(int));

    // compare msb of x and msb of shift_x
    return msb == msb_shift_x;
};

void main()
{
    printf("%d\n", int_shifts_are_arithmetic());
}