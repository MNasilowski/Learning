# -*- coding: utf-8 -*-
"""
Created on Sun Mar 15 17:19:19 2020

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


def semiprime(n):
    semiprime = [0] * (n + 1)
    prime_a = prime(n)
    nr_of_prime = len(prime_a)
    for i in range(nr_of_prime):
        for j in range(nr_of_prime):
            nr = prime_a[i]*prime_a[j]
            try:
                semiprime[nr] = 1
            except:
                break
    return semiprime

def count_semiprime(n):
    semiprime_a = semiprime(n)
    counted_semiprime = [0]*(n+1)
    for i in range(1,len(counted_semiprime)):
        counted_semiprime[i] = counted_semiprime[i-1] + semiprime_a[i]
    return counted_semiprime
    
def solution(N,P,Q):
    N  = max(Q)+1
    counted_semiprime = count_semiprime(N)
    nr_of_semiprime_in_range = []
    for i in range(len(P)):
        nr_of_semiprime_in_range.append(counted_semiprime[Q[i]] - counted_semiprime[P[i]-1])
    return nr_of_semiprime_in_range


P = [1,10,30]
Q = [1,10,30]
N = 10  
print(solution(N,P,Q))