# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.


import sympy as sp
import math as mt

x = sp.symbols(x)

sp.diff(mt.sin(x)*mt.cos(x),x)"""


import sympy as sp
import math as mt

mt.sqrt(9)

sp.sqrt(8)

x, y = sp.symbols('x y')

expr = x + 2*y
expr
expr - x 

x*expr

expanded_expr = sp.expand(x*expr)
expanded_expr
sp.factor(expanded_expr)

from sympy import *

x, t, z, nu = symbols('x t z nu')

sp.init_printing(use_unicode = True)

diff(sin(x)*exp(x),x)

limit(sin(x)/x, x, 0)

Matrix([[1,2],[2,2]]).eigenvals()

Integral(cos(x)**2, (x, 0, pi)))
