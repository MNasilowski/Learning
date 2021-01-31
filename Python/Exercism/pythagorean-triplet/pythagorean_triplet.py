def triplets_with_sum(number):
    results = []
    for a in range(1,number//3):
        b = 0.5*number*(number - 2*a)/(number - a)
        if int(b) == b and b > a and b < 0.5*(number - a):
            results.append([a,int(b),number - a - int(b)])
    return results
