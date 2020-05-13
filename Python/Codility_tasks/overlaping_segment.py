# -*- coding: utf-8 -*-
"""
Created on Tue Mar 17 18:52:34 2020

@author: nasil
"""

def solution(A,B):
    if len(A) < 2: return len(A)
    segments = 1
    segment_end = B[0]
    i = 1
    while i < len(A):
        while i < len(A) and A[i] <= segment_end: i += 1
        if i == len(A): break
        segments += 1
        segment_end = B[i]
    return segments
A = [1,3,7,9,9]
B = [5,6,8,9,10]
        
print(solution(A,B))