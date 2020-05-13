# -*- coding: utf-8 -*-
"""
Created on Mon Mar 16 10:36:39 2020

@author: nasil
"""

def sieve(n):
    sieve = [True] * (n + 1)
    sieve[0] = sieve[1] = False
    i=2
    while (i * i <= n):
        if (sieve[i]):
            k=i * i
            while (k <= n):
                sieve[k] = False
                k += i
        i += 1
    return sieve

def prime(n):
    prime = []
    sieve_a = sieve(n)
    for i in range(len(sieve_a)):
        if sieve_a[i]:
            prime.append(i)
    return prime

def all_common_prime_divisors(A,B,primes):
    if B > A:
        helper = A
        A = B
        B = helper
    if (A < 2):
        return 1
    if(A == B):
        return 1
    for i in primes:
            if A%i == 0 and B%i ==0:
                while A%i == 0 and B%i ==0:
                    A = A/i
                    B = B/i
            elif A%i == 0 and B%i !=0:
                return 0
            elif A%i != 0 and B%i ==0:   
                return 0
            elif A/i < 2:
                break
    return 1
def solution(A,B):
    primes = prime(max(max(A),max(B)))
    result = 0
    for i in range(len(A)):
        result += all_common_prime_divisors(A[i],B[i],primes)
    return result

A = [75,10,1]
B = [15,30,2]
print(solution(A, B))