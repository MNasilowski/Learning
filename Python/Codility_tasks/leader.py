# -*- coding: utf-8 -*-
"""
Created on Mon Mar 16 23:08:09 2020

@author: nasil
"""

def fibonaci_plus(N):
    fibonaci = [1,1,2]
    for i in range(3,N+1):
        fibonaci.append(fibonaci[i-1] + fibonaci[i-2])
    return fibonaci
    
def powers_of_two(N):
    powers = [1]
    for i in range(N):
        powers.append(2*powers[-1])
    return powers

def solution(A,B):
    permutations = fibonaci_plus(max(A))
    powers = powers_of_two(max(B))
    result = []
    for i in range(len(A)):
        result.append(permutations[A[i]]%powers[B[i]])
    return result

A = [4, 4, 5, 5, 1]
B = [3, 2, 5, 3, 1]
print(solution(A,B))