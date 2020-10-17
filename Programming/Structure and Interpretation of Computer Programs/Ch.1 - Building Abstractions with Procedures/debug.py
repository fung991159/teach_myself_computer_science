from random import randrange

def check_modulo(n, a):
    return (n**a)%n == a%n

def test_congruent(n):
    if n <= 1:
        return False
    else:
        return check_modulo(n, n-1)
        

# for i in range(1, 100):
#     print(i, test_congruent(i))
print(test_congruent(3))
