# -*- coding: utf-8 -*-
"""
Created on Thu Nov 26 18:10:25 2020

@author: nasil
"""
import string

def histogram(s):
    d = dict()
    for c in s:
        if c not in d:
            d[c] = 1
        else:
            d[c] += 1
    return d

def word_counter(file):
    words = dict()
    with open(file,'r') as f:
        lines = f.readlines()[58:]
        lines = [line.lower().translate(str.maketrans('', '', string.punctuation)).split() for line in lines if line.split() != []]
    for line in lines:
        for word in line:
            words[word] = words.get(word, 0) + 1
    
    return dict(sorted(words.items(), key=lambda item: item[1], reverse = True))


def get_most_popular_word(file, number = 10):
    populars = word_counter("SherlocHolmes.txt")
    j = 0
    for i in populars:
        print(i, populars[i])
        j += 1
        if j > number: break