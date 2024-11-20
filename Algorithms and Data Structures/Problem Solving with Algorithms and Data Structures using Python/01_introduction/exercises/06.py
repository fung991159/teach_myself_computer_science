# In many ways it would be better if all fractions were maintained in lowest terms right from the start. Modify the constructor for the Fraction class so that GCD is used to reduce fractions immediately. Notice that this means the __add__ function no longer needs to reduce. Make the necessary modifications.


def gcd(m, n):
    while m % n != 0:
        m, n = n, m % n
    return n


class Fraction:
    def __init__(self, top, bottom):
        # get the gcd for num and den
        cmmn = gcd(top, bottom)
        self.num = top // cmmn
        self.den = bottom // cmmn

    def __str__(self):
        return "{:d}/{:d}".format(self.num, self.den)

    def __add__(self, other_fraction):
        # remove any subsequent division of gcf.
        new_num = self.num * other_fraction.den + self.den * other_fraction.num
        new_den = self.den * other_fraction.den

        return Fraction(new_num, new_den)


f = Fraction(1, 2)
f2 = Fraction(3, 4)
print(f + f2)
