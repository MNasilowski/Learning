"""
It's work in about 80s
"""

def largest(min_factor, max_factor):
    value = None
    if min_factor > max_factor:
        raise ValueError ("min is biger then max")
    max_product = min_factor**2
    factors = []
    for i in range(max_factor,min_factor -1,-1):
        for j in range(i,min_factor - 1,-1):
            if str(i*j) == str(i*j)[::-1]:
                if i*j > max_product:
                    max_product = i*j
                    value = max_product
                    factors = [sorted([i,j])]
                    break
                elif i*j == max_product:
                    factors.append([i,j])
                    break
    return value, factors



def smallest(min_factor, max_factor):
    value = None
    if min_factor > max_factor:
        raise ValueError ("min is biger then max")
    min_product = max_factor**2
    factors = []
    for i in range(min_factor,max_factor + 1):
        for j in range(i,max_factor + 1):
            if str(i*j) == str(i*j)[::-1]:
                if i*j < min_product:
                    min_product = i*j
                    factors = [sorted([i,j])]
                    value = min_product
                    break
                elif i*j == min_product:
                    factors.append([i,j])
                    break
    return value, factors