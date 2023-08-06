
#include <stdio.h>
#include "show_bytes.h"
// #include <assert.h>
// #include <limits.h>
/*
void *calloc(size_t nmemb, size_t size);
Here's what calloc does:    num_elements: The number of elements you want to allocate memory for.
    element_size: The size (in bytes) of each element in the array.

    It takes two arguments:
        num_elements: The number of elements you want to allocate memory for.
        element_size: The size (in bytes) of each element in the array.
    The total amount of memory allocated is num_elements * element_size.
    calloc returns a pointer to the first byte of the allocated memory block, just like malloc.
    The memory allocated by calloc is initialized to zero, unlike malloc, which leaves the memory uninitialized and may contain garbage data.
\
void *memset(void *s, int c, size_t n);:

    memset stands for "memory set."
    It is used to initialize a block of memory with a specific value.
    The function takes three arguments:
        s: A pointer to the memory block that needs to be initialized.
        c: The value (as an integer) that will be set to each byte of the memory block.
        n: The number of bytes to be set in the memory block, starting from the location pointed to by s.
    The function returns a pointer to the first byte of the memory block (s).
    memset is commonly used to set memory blocks to zero (by passing 0 as the value of c), but it can also be used to set any other specific value.
void *malloc(size_t size);

    malloc stands for "memory allocation."
    It is used to dynamically allocate memory during program execution.
    The function takes a single argument size, which is the number of bytes of memory to be allocated.
    It returns a pointer to the first byte of the allocated memory block (of the specified size).
    If the memory allocation is successful, malloc returns a valid pointer. Otherwise, if memory cannot be allocated (for example, if there is insufficient memory available), it returns a special value NULL.
*/

void *malloc(size_t size);

void *memset(void *s, int c, size_t n);

void *calloc(size_t nmemb, size_t size)
{
    if (nmemb == 0 || size == 0)
    {
        return NULL;
    }
    size_t buff_size = nmemb * size;
    if (buff_size / nmemb == size)
    { // Check for potential overflow
        void *pbuf = malloc(buff_size);
        if (pbuf != NULL)
        {
            memset(pbuf, 0, buff_size);
        }
        return pbuf;
    }
    return NULL;
}

void main()
{
    void *a = calloc(0, 1);
}