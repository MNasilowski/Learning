# -*- coding: utf-8 -*-
"""
Created on Tue Mar 17 19:46:05 2020

@author: nasil
"""

def solution(K,A):
    i = 0
    rope_len = 0
    nr_of_ropes = 0
    while i < len(A): 
        while rope_len < K:
            rope_len += A[i]
            i+=1
            if(i == len(A)):
                if rope_len >= K: return nr_of_ropes + 1
                if rope_len < K: return nr_of_ropes
        rope_len = 0
        nr_of_ropes += 1
    return
        
A = [4]
A2 = [1,2,3,4,1,1,3]
print(solution(4, A))