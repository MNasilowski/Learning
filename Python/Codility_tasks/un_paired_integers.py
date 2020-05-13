# -*- coding: utf-8 -*-
"""
Created on Thu Mar 19 17:12:36 2020

@author: nasil
"""

def solution(A):
    A.sort()
    for i in range(0,len(A)-1,2):
        print(i,i+1)
        if (A[i] != A[i+1]):
                return A[i]
    return A[-1]
