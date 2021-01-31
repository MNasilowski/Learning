def sum_of_multiples(limit, multiples):
    set_of_multiples = set()
    for number in multiples:
        try:
            set_of_multiples.update(range(0,limit,number))
        except:
            pass
    return sum(set_of_multiples)


print(sum_of_multiples(4, [3, 5]))