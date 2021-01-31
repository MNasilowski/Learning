import math
class ComplexNumber:
    def __init__(self, real, imaginary):
        self.real = real
        self.imaginary = imaginary

    def __eq__(self, other):
        return (self.real,self.imaginary) == (other.real,other.imaginary)

    def __add__(self, other):
        return ComplexNumber(self.real + other.real,
                             self.imaginary + other.imaginary)
        
    def __sub__(self, other):
        return ComplexNumber(self.real - other.real,
                             self.imaginary - other.imaginary)
        
    def __mul__(self, other):
        re = self.real*other.real - self.imaginary*other.imaginary
        im = self.imaginary*other.real + self.real*other.imaginary
        return ComplexNumber(re,im)

    def __truediv__(self, other):
        if (other.real,other.imaginary) == (0,0):
            raise ZeroDivisionError ("You canot divide by zero")
        foo = 1.0/(other.real**2 + other.imaginary**2)
        return self*ComplexNumber(other.real*foo,-other.imaginary*foo)

    def __abs__(self):
        return math.sqrt(self.real**2 + self.imaginary**2)

    def conjugate(self):
        return ComplexNumber(self.real,-self.imaginary)

    def exp(self):
        re = math.exp(self.real)*math.cos(self.imaginary)
        im = math.exp(self.real)*math.sin(self.imaginary)
        return ComplexNumber(re,im)
