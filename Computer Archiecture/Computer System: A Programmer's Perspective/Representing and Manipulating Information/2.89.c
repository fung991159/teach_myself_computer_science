#include <stdio.h>
#include <assert.h>
#include "show_bytes.h"
#include <limits.h>

#include <stdlib.h>

int tester()
{
    /* Create some arbitrary values */
    int x = random();
    int y = random();
    int z = random();

    printf("x: %d\n", x);
    printf("y: %d\n", y);
    printf("z: %d\n", z);

    /* Convert to double */
    double dx = (double)x;
    double dy = (double)y;
    double dz = (double)z;
    printf("dx: %f\n", dx);
    printf("dy: %f\n", dy);
    printf("dz: %f\n", dz);

    assert(dx / dx == dz / dz);
    //  assert(dx - dy == (double)(x - y));//B
    // assert((float)x == (float)dx);//A
}

int main()
{
    tester();
}