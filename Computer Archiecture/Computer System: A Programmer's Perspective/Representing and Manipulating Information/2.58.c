#include <stdio.h>

typedef unsigned char *byte_pointer;
void show_bytes(byte_pointer start, size_t len)
{
    int i;
    for (i = 0; i < len; i++)
        printf(" %.2x", start[i]);
    printf("\n");
}

int is_little_endian()
{
    int x = 1;
    return *(char *)&x;
}

void is_little_endian_with_steps()
{
    int x = 1;       // create a int variable
    int *ptr_x = &x; // assign the address of int x to an int
    show_bytes((byte_pointer)ptr_x, sizeof(int));
    char *chr_ptr = (char *)ptr_x; // cast the x integer pointer into char pointer, since char is 1 byte, so the first byte of x is the first byte of the char pointer
    int result = *chr_ptr;         // get the value of the first byte

    printf("result (int) = %d\n", result);
    // print binary representation of x
    // printf("%d\n", *ptr);/
}