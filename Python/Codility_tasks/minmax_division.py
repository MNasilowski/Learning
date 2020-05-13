# -*- coding: utf-8 -*-
"""
Created on Tue Mar 17 10:51:54 2020

@author: nasil
"""

def blockSize(A, max_block_cnt, max_block_size):
    block_sum = 0
    block_cnt = 0
    
    for element in A:
        if block_sum + element > max_block_size:
            block_sum = element
            block_cnt += 1
        else:
            block_sum += element
        if block_cnt >= max_block_cnt:
            return False
        
        return True
    
def binary_search(A, max_block_cnt, not_M):
    lower_bound = max(A)
    upper_bound = sum(A)
    
    if max_block_cnt == 1: return upper_bound
    if max_block_cnt >= len(A): return lower_bound
    
    while lower_bound <= upper_bound:
        candidate_mid = (lower_bound + upper_bound) // 2
        if blockSize(A, max_block_cnt, candidate_mid):
            upper_bound = candidate_mid + 1
        else:
            lower_bound = candidate_mid + 1
            
    return lower_bound

def solution()