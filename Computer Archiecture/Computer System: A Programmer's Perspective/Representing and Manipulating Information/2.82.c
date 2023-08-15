#include <stdio.h>
#include <assert.h>
#include "show_bytes.h"
#include <limits.h>

int E()
{
    int x = 1;
    int y = 2;
    unsigned ux = (unsigned)x;
    unsigned uy = (unsigned)y;
    // int out = ((x + y) << 4) + y - x;
    int left = (x >> 2) << 2;
    int right = x;

    printf("left: %d\n", left);
    printf("right: %d\n", right);
}

int C()
{
    int x = 1;
    int y = 2;
    unsigned ux = (unsigned)x;
    unsigned uy = (unsigned)y;
    // int out = ((x + y) << 4) + y - x;
    int left = ~x + ~y + 1;
    int right = ~(x + y);

    printf("left: %d\n", left);
    printf("right: %d\n", right);
}
int D()
{
    int x = -1;
    int y = -2;
    unsigned ux = (unsigned)x;
    unsigned uy = (unsigned)y;
    // int out = ((x + y) << 4) + y - x;
    int left = (ux - uy);
    int right = -(unsigned)(y - x);

    printf("left: %d\n", left);
    printf("right: %d\n", right);
}

int B()
{
    int x = INT_MIN;
    int y = 2;
    unsigned ux = (unsigned)x;
    unsigned uy = (unsigned)y;
    // int out = ((x + y) << 4) + y - x;
    int left = ((x + y) << 4) + y - x;
    int right = 17 * y + 15 * x;

    printf("left: %d\n", left);
    printf("right: %d\n", right);
}
void main()
{
    // int x = INT_MAX;
    // int y = INT_MAX;
    // unsigned ux = (unsigned)x;
    // unsigned uy = (unsigned)y;
    // // int out = ((x + y) << 4) + y - x;
    // int left = ((x + y) << 4) + y - x;
    // int right = 17 * y + 15 * x;

    // printf("left: %d\n", left);
    // printf("right: %d\n", right);
    // printf("%d\n", out);
    // return (x < y) == (-x > -y)
    int out = D();
}
