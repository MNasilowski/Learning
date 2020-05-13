# -*- coding: utf-8 -*-
"""
Created on Sun Apr 22 09:56:35 2018

@author: nasil
"""

import sympy as sp
import math
from sympy import *
sp.init_printing(use_unicode = True)

x, t, z, nu, s, a , b , w = sp.symbols('x t z nu s a b w')

sp.integrate(exp(-x**2)/2,(x,-oo, oo))
sp.integrate(exp(-(x-1)**2)/2,(x,-oo, oo))
sp.integrate(exp(-(x-1)**2)/2,(x,-oo, oo))
sp.integrate(exp((-(x-1)**2)/(2*s**2)),(x,-oo, oo))

#s to jest odchylenie standardowe

y = Function('y')

sp.dsolve(sp.Derivative(y(t),t,2) + y(t) - a*sin(2*t),y(t))
sp.dsolve(sp.Derivative(y(t),t,2) + 2*b*sp.Derivative(y(t),t) - a*sin(2*t),y(t))

A = Matrix([[0,1],[1,0]])
A
exp(t*A)