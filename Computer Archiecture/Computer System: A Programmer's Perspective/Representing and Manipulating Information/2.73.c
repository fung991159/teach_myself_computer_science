
#include <stdio.h>
#include "show_bytes.h"
#include <assert.h>
#include <limits.h>

int saturating_add(int x, int y)
{
    int mask = INT_MIN; // 0x8000 0000
    int sum = x + y;

    // these two flags are to indicate if msb of input x and y is different than sum
    int positive_flag = !(x & mask) && !(y & mask) && (sum & mask);
    int negative_flag = (x & mask) && (y & mask) && !(sum & mask);

    // if positive_flag is true, then assign sum to INT_MAX, elif negative_flag
    // is true, then assign sum to INT_MIN, else sum can remain unchanged since
    // there is no overflow
    (positive_flag && (sum = INT_MAX)) || (negative_flag && (sum = INT_MIN));
    return sum;
}

void main()
{
    int output = add(100, INT_MAX);
    printf("%d\n", output);
}
// 1. get the msb of x and y
// 1. add them together

// 0111 = 7 0111 = 7

//     0000 1110 = 14

//                 1. unsigned add x and
//                 y 2. check if resultant larger than TMAX
