# -*- coding: utf-8 -*-
"""
Created on Tue Mar 17 20:32:09 2020

@author: nasil
"""

def solution(A):
    # write your code in Python 3.6
    integers = [False]*(len(A)+1)
    print(integers)
    for a in A:
        if a > 0:
            try:
                integers[a] = True
            except IndexError:
                pass
    for i in range(1,len(integers)):
        print("bla",i,integers[i])
        if not integers[i]:return i
         
    return len(integers)

A = [1,3,6,4,1,2]
A2 = [1,2,3]
A3 = [-1]
print(solution(A3))