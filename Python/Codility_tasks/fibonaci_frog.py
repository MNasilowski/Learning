# -*- coding: utf-8 -*-
"""
Created on Mon Mar 16 19:59:36 2020

@author: nasil
"""
def fibonaci(N):
    F = [1,2]
    while True:
        new_element = F[-1] + F[-2]
        if new_element < N:
            F.append(new_element)
        elif new_element == N:
            F.append(new_element)
            break
        else:
            break
    return F
    
def solution(A):
    F = fibonaci(len(A)+1)
    reachable = set()
    position = 0
    for i in F:
        new_position = position+i
        if new_position == len(A)+1:
            return 1
        elif new_position > len(A):
            break
        elif A[new_position-1] == 1:
            reachable.add(position+i)
    new_set = set(reachable)
    for jump in range(2,len(A)):
        for position in reachable:
            for i in F:
                new_position = position + i
                if new_position == len(A)+1:
                    return jump
                elif new_position > len(A):
                    break
                elif A[new_position-1] == 1:
                    new_set.add(position+i)
       
        if(len(reachable) == len(new_set)):
            return -1
        else:
            reachable = set(new_set)
    return -1
    
A = []
print(solution(A))