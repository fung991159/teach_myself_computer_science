
#include <stdio.h>
#include <assert.h>
#include "show_bytes.h"
#include <limits.h>

/* computes 3*x/4 */
int mul3div4(int x)
{

    // x * 3 = x * 4 - x
    int mul_output = (x << 2) - x;
    printf("mul_output: %d\n", mul_output);
    // div 4 = mul_output >> 2
    int x_is_negative = !!(INT_MIN & x);
    printf("x_is_negative: %d\n", x_is_negative);
    // if positive number, just do right( shift
    int positive_result = mul_output >> 2;
    // if negative number, add a bias before right shift
    int negative_result = (mul_output + (1 << 2) - 1) >> 2;

    printf("postiive_result: %d\n", positive_result);
    printf("negative_result: %d\n", negative_result);

    int output;
    (x_is_negative && (output = negative_result)) || (!x_is_negative && (output = positive_result));
    return output;
};

void main()
{
    int r = mul3div4(-10);
    printf("%d\n", r);
}
// 0001 = 1 0010 = 2 0100 = 4

//     1001 = 9 10010 = 16 + 2 = 18 100100 = 32 + 4 = 36

/*
0010 = 2
1000 = 8 - 2 = 6 (mul 3 correct)

*/