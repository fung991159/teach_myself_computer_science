# Implement the remaining relational operators (__gt__, __ge__, __lt__, __le__, and __ne__).


def gcd(m, n):
    while m % n != 0:
        m, n = n, m % n
    return n


def lcd(m, n):
    return abs(m * n) // gcd(m, n)


class Fraction:
    def __init__(self, top, bottom):
        self.num = top
        self.den = bottom

    def __str__(self):
        return "{:d}/{:d}".format(self.num, self.den)

    def __eq__(self, other_fraction):
        first_num = self.num * other_fraction.den
        second_num = other_fraction.num * self.den

        return first_num == second_num

    def __add__(self, other_fraction):
        new_num = self.num * other_fraction.den + self.den * other_fraction.num
        new_den = self.den * other_fraction.den
        cmmn = gcd(new_num, new_den)
        return Fraction(new_num // cmmn, new_den // cmmn)

    def show(self):
        print("{:d}/{:d}".format(self.num, self.den))

    def __mul__(self, other_fraction):
        new_num = self.num * other_fraction.num
        new_den = self.den * other_fraction.den
        cmmn = gcd(new_num, new_den)
        return Fraction(new_num // cmmn, new_den // cmmn)

    def __truediv__(self, other_fraction):
        new_num = self.num * other_fraction.den
        new_den = self.den * other_fraction.num
        cmmn = gcd(new_num, new_den)
        return Fraction(new_num // cmmn, new_den // cmmn)

    def __sub__(self, other_fraction):
        new_den = lcd(self.den, other_fraction.den)
        self_new_num = new_den // self.den * self.num
        of_new_num = new_den // other_fraction.den * other_fraction.num
        return Fraction(self_new_num - of_new_num, new_den)

    def __gt__(self, other_fraction):
        return self.num / self.den > other_fraction.num / other_fraction.den

    def __lt__(self, other_fraction):
        return not self.__gt__(other_fraction)

    def __ge__(self, other_fraction):
        return self.num / self.den >= other_fraction.num / other_fraction.den

    def __le__(self, other_fraction):
        return self.num / self.den <= other_fraction.num / other_fraction.den

    def __ne__(self, other_fraction):
        return self.num / self.den != other_fraction.num / other_fraction.den




