def next_n(n):
    if n == 2:
        return 3
    else:
        return n + 2

def modified_smallest_divisor(n, test_divisor=2):
    if test_divisor ** 2 > n:
        return n
    elif n % test_divisor == 0:
        return test_divisor
    else:
        return test_divisor = next_n(n)
        # return smallest_divisor(n, test_divisor)
print(modified_smallest_divisor(5))

# print(func(10))
# def pascal(n):
#     if n == 0:
#         return [1]
#     elif n == 1:
#         return [1, 1]
#     else:
#         new_row = [1]
#         last_row = pascal(n-1)
#         for i in range(len(last_row)-1):
#             new_row.append(last_row[i] + last_row[i+1])
#         new_row += [1]
#     return new_row

# def recurisve_add(a,b):
#     if b == 0:
#         return 0
#     else:
#         return a + recurisve_add(a,b-1)

# def recurisve_add2(a,b):
#     if b == 0:
#         return 0
#     else:
#         return recurisve_add2(2*a,b/2)

# print(recurisve_add(5,10))
# print(recurisve_add2(5,10))
