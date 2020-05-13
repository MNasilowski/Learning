# -*- coding: utf-8 -*-
"""
Created on Thu Jul 12 22:47:20 2018

@author: MN
"""
import multiprocessing as mp
import time
import os

def f(x,y):
    return x**4 + y**4

def calkowanie1D(f,x1, x2,y):
    dokladnosc = 0.0001
    calka = 0
    dx = (x2 - x1)*dokladnosc
    x = x1
    while x <= x2:
        calka += (f(x,y) + f(x+dx,y))*0.5*dx
        x += dx
#    print(os.getpid())
    return calka

def calkowanie2D(f,x1,x2, y1, y2):
    dokladnosc = 0.0001
    wynik = 0
    dy = (y2 - y1)*dokladnosc
    pool = mp.Pool()
    results = []
    y = y1
    while y < y2:
        results.append(pool.apply_async(calkowanie1D,args=(f,x1,x2,y+dokladnosc*0.5*dokladnosc)))
        y += dy
    pool.close()
    pool.join()
    results = [r.get() for r in results]
    for i in results:
        wynik += i*dy
    return wynik

def calkowanie2DV0(f,x1,x2, y1, y2):
    dokladnosc = 0.0001
    wynik = 0
    dy = (y2 - y1)*dokladnosc
    y = y1
    while y <= y2:
        wynik += calkowanie1D(f,x1,x2,y)*dy
        y += dy
    return wynik


if __name__ == '__main__':
    start = time.time()
    print('wynik = ',calkowanie2D(f,-1,1,-1,1),'  czas = ', time.time() - start)
    start = time.time()
    print('wynik = ',calkowanie2DV0(f,-1,1,-1,1),'  czas = ', time.time() - start)
