
#include <stdio.h>
#include <assert.h>
#include "show_bytes.h"
#include <limits.h>

/* Divide by power of 2. Assume 0 <= k < w-1 */
int divide_power2(int x, int k)
{
    int x_is_negative = !!(INT_MIN & x);
    
    // if positive number, just do right( shift
    int positive_result = x >> k;

    // if negative number, add a bias before right shift
    int negative_result = (x + (1 << k) - 1) >> k;

    int output;
    (x_is_negative && (output = negative_result)) || (!x_is_negative && (output = positive_result));
    return output;
}
// if positive, cna just do right shfit
void main()
{
    int output = divide_power2(-12340, 8);
    printf("%d\n", output);
    // assert(divide_power2(20, 3) == 2);
}
