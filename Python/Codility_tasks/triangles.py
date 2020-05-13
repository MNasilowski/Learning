# -*- coding: utf-8 -*-
"""
Created on Tue Mar 17 18:14:31 2020

@author: nasil
"""

def solution(A):
    if len(A) < 3:
        return 0
    A.sort()
    triangles = 0
    for i in range(len(A)-2):
        first_side = A[i]
        for j in range(i+1,len(A)-1):
            second_side = A[j]
            k = j + 1
            third_side = A[k]
            while k < len(A) and third_side < first_side + second_side:
                triangles +=1
                k += 1
                try:
                    third_side = A[k]
                except IndexError:
                    pass
    return triangles