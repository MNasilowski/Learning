# -*- coding: utf-8 -*-
"""
Created on Tue Mar 17 11:44:23 2020

@author: nasil
"""

def nailed_planks(nail_position,A,B):
    if nail_position > max(B):
        return []
    if nail_position < min(A):
        return []
    start = 0
    ending = len(B)
    nailed = []
    middle = (start + ending)//2
    while start != ending:
        if A[middle] <= nail_position <= B[middle]:
            nailed.append(middle)
            break
        else:
            if nail_position > B[middle]:
                start = middle
            elif nail_position < A[middle]:
                ending = middle
        middle = (start + ending)//2

    for i in range(middle+1,len(A)):
        if A[i] <= nail_position <= B[i]:
            nailed.append(i)
        elif A[i] > nail_position:
            break
    
    for i in reversed(range(0,middle)):
        if A[i] <= nail_position <= B[i]:
            nailed.append(i)
        elif B[i] < nail_position:
            break
    return nailed
    
def remove_nailed(A, B, nailed):
    if len(nailed) == 0:
        return A, B
    nailed.sort()
    for i in range(len(nailed)):
        A.pop(nailed[i]-i)
        B.pop(nailed[i]-i)
    return A, B
def solution(A,B,C):
    for i in range(len(C)):
        nailed = nailed_planks(C[i],A,B)
        A, B = remove_nailed(A,B, nailed)
        if len(A) == 0:
            return i+1
    return -1


A = [1,4,4,4]
B = [4,5,5,5]
C = [3,6,4,10,2]

print("result",solution(A,B,C))