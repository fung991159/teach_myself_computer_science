
#include <stdio.h>
#include <assert.h>

int mul_a(int x)
{
    return (x << 4) + x;
}

int mul_b(int x)
{
    return -(x << 3) + x;
}

int mul_c(int x)
{
    return (x << 6) - (x << 2);
}

int mul_d(int x)
{
    return -(x << 7) + (x << 4);
}
void main()
{
    assert(mul_a(10) == 170);
    assert(mul_b(10) == -70);
    assert(mul_c(10) == 600);
    assert(mul_d(10) == -1120);
}
