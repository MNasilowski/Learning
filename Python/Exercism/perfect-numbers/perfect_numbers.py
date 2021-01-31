def classify(number):
    if number <= 0:
        raise ValueError('Value Error')
    dividers = [i for i in range(2,number//2 + 1) if number%i==0]
    dividers.append(1)
    dividers_sum = sum(dividers)
    if dividers_sum == number and dividers_sum != 1:
        return "perfect"
    elif dividers_sum <= number:
        return "deficient"
    else:
        return "abundant"
    
