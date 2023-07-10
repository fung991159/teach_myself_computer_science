#include <stdio.h>

typedef unsigned char *byte_pointer;
void show_bytes(byte_pointer start, size_t len)
{
    int i;
    for (i = 0; i < len; i++)
        printf(" %.2x", start[i]);
    printf("\n");
}

char merge_bytes(int x, int y)
{
    printf("x in bytes: ");
    show_bytes((byte_pointer)&x, sizeof(int));
    printf("y in bytes: ");
    show_bytes((byte_pointer)&y, sizeof(int));

    int least_significant_byte = x & 0xFF;
    printf("least_significant_byte: ");
    show_bytes((byte_pointer)&least_significant_byte, sizeof(int));

    int most_significant_byte = y & ~0xFF;
    printf("most_significant_byte: ");
    show_bytes((byte_pointer)&most_significant_byte, sizeof(int));

    printf("combined: ");
    int result = least_significant_byte | most_significant_byte;
    show_bytes((byte_pointer)&result, sizeof(int));
}

void main()
{
    int x = 0x89ABCDEF;
    int y = 0x76543210;
    merge_bytes(x, y);
}