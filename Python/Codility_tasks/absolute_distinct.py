# -*- coding: utf-8 -*-
"""
Created on Tue Mar 17 14:52:40 2020

@author: nasil
"""

def solution(A):
    j = len(A) - 1
    koniec_i = j
    distinct = 0
    A.append(A[-1]+1)
    i = 0
    if j == 0:
        return 1
    while i < koniec_i:
        if i == 0 or A[i] != A[i-1]:
            distinct += 1
            while j > i and A[j] >= abs(A[i]):
                if A[j] != A[j+1] and A[j] != abs(A[i]): 
                    distinct +=1
                j = j - 1
            koniec_i = j +  1   
        i = i + 1
    return distinct
            