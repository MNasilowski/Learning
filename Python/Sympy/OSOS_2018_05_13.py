# -*- coding: utf-8 -*-
"""
Created on Sat May 19 16:58:25 2018

@author: Marcin Nasilowski
"""


"""
1) Proszę utworzyć funkcję: y(t) = h0  + v0*t - (1/2)*g*t^2. Wykorzystując Sympy, proszę ją dwukrotnie zróżniczkować,
aby otrzymać prędkość v(t) i przyspieszenie a(t) = -g. Następnie, podstawiając h0 = 100.0, v0 = 2.0, g = 9.81, proszę sporządzić
wykres (link z pomocą do tworzenia wykresów w Sympy załączony), zawierający a(t), v(t) oraz y(t). Wykres powinien
być sporządzony dla t od t1 do t2, gdzie t1 = 0, a t2 jest jednym z rozwiązań równania y(t) = 0. Rozwiązania te także
należy otrzymać w SymPy i wybrać jedno z nich (które?).
"""

import sympy as sp

h0, v0, g, t, a, v = sp.symbols('h0, v0, g, t, a, v')

x = h0 + v0*t - (1/2)*g*t**2
v = sp.diff(x,t)
a = sp.diff(v,t)

x = x.subs([(h0,100),(v0, 2.0),(g, 9.81)])
v = v.subs([(h0,100),(v0, 2.0),(g, 9.81)])
a = a.subs([(h0,100),(v0, 2.0),(g, 9.81)])

t1 = 0
t2 = sp.solve(x)[1]
#Solve sortuje wyniki od najmniejszego do największego,
#dlatego wybrano drugie rozwiązanie
#pierwsze jest ujemne

sp.plot(x, v, a ,(t,t1,t2))


"""
2) Wykorzystując SymPy, proszę rozwinąć w szereg Taylora funkcję sin(x). Następnie proszę sporządzić wykresy czterech
funkcji: 

(a) sin(x), 

(b) a0 + a1 x + a x^2, 

(c) a0 + a1  x + a2 x^2 + a3 x^3 + a4 x^4, 

(d) a0 + a1  x + a2 x^2 + a3 x^3 + a4 x^4 + a5 x^5 + a6 x^6,

gdzie a0, a1, a2, a3, a4, a5, a6 są współczynnikami rozwinięcia w szereg Taylora funkcji sin(x) do szóstego rzędu włącznie. Wykres proszę sporządzić dla x od zera do 2 pi.

Ostatnia modyfikacja: niedziela, 13 maj 2018, 10:07
"""
import sympy as sp


x = sp.Symbol('x')
T6, T4 = sp.symbols('T6, T4')
T6 = sp.series(sp.sin(x),x,0.0,6).removeO()
T4 = sp.series(sp.sin(x),x,0.0,4).removeO()
T2 = sp.series(sp.sin(x),x,0.0,2).removeO()
sp.plot(sp.sin(x),T2,T4,T6,(x,-sp.pi,sp.pi))


