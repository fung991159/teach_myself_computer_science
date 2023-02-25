#include <stdio.h>
#include <math.h>

/* Determine whether arguments can be added without overflow */

// This function should return 1 if arguments x and y can be added without
// causing overflow.
int tadd_ok(int x, int y)
{
    int s;
    s = x + y;

    // positive overflow if x > 0 and y > 0, but s <= 0
    if (x > 0 && y > 0 && s <= 0)
    {
        return 0;
    }
    // negative overflow if s <0 and y <0, but s >= 0

    else if (x < 0 && y < 0 && s >= 0)
    {
        return 0;
    }
    else
    {
        return 1;
    }
};
