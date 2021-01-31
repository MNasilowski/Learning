from __future__ import division


class Rational:
    def __init__(self, numer, denom):
        a, b = reduce(numer, denom)
        self.numer = a
        self.denom = b

    def __eq__(self, other):
        return self.numer == other.numer and self.denom == other.denom

    def __repr__(self):
        return '{}/{}'.format(self.numer, self.denom)

    def __add__(self, other):
        a = self.numer*other.denom + other.numer*self.denom
        b = self.denom* other.denom
        return Rational(a,b)

    def __sub__(self, other):
        a = self.numer*other.denom - other.numer*self.denom
        b = self.denom* other.denom
        return Rational(a,b)

    def __mul__(self, other):
        a = self.numer*other.numer
        b = self.denom*other.denom
        return Rational(a,b)

    def __truediv__(self, other):
        a = self.numer*other.denom
        b = self.denom*other.numer
        return Rational(a,b)

    def __abs__(self):
        a = abs(self.numer)
        b = abs(self.denom)
        return Rational(a,b)

    def __pow__(self, power):
        a = pow(self.numer,power)
        b = pow(self.denom,power)
        return Rational(a,b)

    def __rpow__(self, base):
        return pow(base,self.numer*1.0/self.denom)
    
def reduce(a,b):
    i = 2
    if a == 0:
        return 0,1
    while i <= min(abs(a),abs(b)):
        if a%i == 0 and b%i ==0:
            a = a/i
            b = b/i
        i +=1
    s = int((a*b)/(abs(a*b)))
    return s*int(abs(a)),int(abs(b))