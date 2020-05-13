# -*- coding: utf-8 -*-
"""
Created on Fri Mar 15 18:54:39 2019

@author: nasil
"""

def binary_search(input_array, value):
    end = len(input_array) - 1
    start = 0
    while end - start >= 1:
        i = int((end + start + 1)/2)
        print(end,start)
        if(end - start == 1):
            
            if (input_array[start] == value or input_array[end] == value):
                return 1
            else:
                return -1
        if input_array[i] > value:
            end = i
            continue
        elif input_array[i] < value:
            start = i
            continue
        else:
            return 1
    return -1

test_list = [1,3,9,11,15,19,29]
test_val1 = 25
test_val2 = 15
print(binary_search(test_list, test_val1))
print(binary_search(test_list, test_val2))