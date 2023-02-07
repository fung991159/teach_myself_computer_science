#include <stdio.h>
/* Prototype for library function strlen */
size_t strlen(const char *s); // unsinged integer

/* Determine whether string s is longer than string t */
/* WARNING: This function is buggy */
int strlonger(char *s, char *t)
{
    unsigned ui;
    ui = strlen(s) - strlen(t);
    printf("%u\n", ui);
    printf("%d\n", ui);
    // printf("%d\n", ui);
    // return strlen(s) - strlen(t) > 0;
}

int main()
{
    int output;
    output = strlonger("a", "ab");
    // printf("%d\n", output);
}