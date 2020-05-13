# -*- coding: utf-8 -*-
"""
Created on Sun Mar 15 17:19:19 2020

@author: nasil
"""

def gcd(a, b):
    if a % b == 0:
        return b
    else:
        return gcd(b, a%b)
    
    
def lcm(a, b):
    return(a*b/gcd(a,b))
    
def Solution(N, M):
    return lcm(N, M)/M

print(Solution(4,7))