#include <stdio.h>
typedef unsigned char *byte_pointer;
void show_bytes(byte_pointer start, size_t len)
{
    int i;
    for (i = 0; i < len; i++)
        printf(" %.2x", start[i]);
    printf("\n");
}

void show_short(short x)
{
    show_bytes((byte_pointer)&x, sizeof(short));
}
void show_long(long x)
{
    show_bytes((byte_pointer)&x, sizeof(float));
}
void show_double(double x)
{
    show_bytes((byte_pointer)&x, sizeof(double));
}

void main()
{
    short a = 200;
    long b = 200.0;
    double c = 200.0;

    show_short(a);
    show_long(b);
    show_double(c);
}