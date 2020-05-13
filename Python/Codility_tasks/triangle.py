# -*- coding: utf-8 -*-
"""
Created on Mon Apr 13 17:32:55 2020

@author: nasil
"""

def Solution(A):
    A.sort()
    if(A[-1]+A[-2] > A[0]):
        return 1
    else:
        return 0



A = [1,8,3,4,5,6,7]
print(Solution(A))