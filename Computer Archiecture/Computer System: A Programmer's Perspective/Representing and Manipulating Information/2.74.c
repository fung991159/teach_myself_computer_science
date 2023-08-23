
#include <stdio.h>
#include "show_bytes.h"
#include <assert.h>
#include <limits.h>
/* Determine whether arguments can be subtracted without overflow */
int tsub_ok(int x, int y)
{
    int mask = INT_MIN; // 0x8000 0000
    int diff = x - y;

    int pos_flag = !(x & mask) && (y & mask) && (diff & mask);
    int neg_flag = (x & mask) && !(y & mask) && !(diff & mask);
    // show_bytes((byte_pointer)&pos_flag, sizeof(int));
    // show_bytes((byte_pointer)&neg_flag, sizeof(int));

    int output = !(pos_flag || neg_flag);
    // printf("%d\n", output);
    return output;
};

void main()
{
    assert(tsub_ok(100, 50) == 1);
    assert(tsub_ok(-50, -100) == 1);
    assert(tsub_ok(-577, 123) == 1);
    assert(tsub_ok(8364, -27298) == 1);
    assert(tsub_ok(INT_MIN, -1) == 1);
    assert(tsub_ok(INT_MIN, 1) == 0);
    assert(tsub_ok(-2, INT_MAX) == 0); // tsub_ok(-1, INT_MAX) actually works because disparity of negative and positive numbers
    assert(tsub_ok(1, INT_MAX) == 1);
}
