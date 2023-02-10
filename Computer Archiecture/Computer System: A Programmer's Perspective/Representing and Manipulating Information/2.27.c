#include <stdio.h>

/* Determine whether arguments can be added without overflow */
int uadd_ok(unsigned x, unsigned y)
{
    // definition of overflow is when either x or y is larger than the sum of x
    // + y.

    unsigned s;
    s = x + y;
    return s > x;
};

int main()
{
    int result;
    result = uadd_ok(1, 1);
    printf("%d\n", result);
};
