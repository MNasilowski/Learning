def find(search_list, value):
    a = 0
    b = len(search_list)-1
    c = (a+b)//2
    if b == 0:
        if value == search_list[0]:
            return 0
        else:
            raise ValueError("single element list and no value")
    while a<b-1:
        c = (b+a)//2
        if search_list[c] == value:
            return c
        elif search_list[a] == value:
            return a
        elif search_list[b] == value:
            return b
        elif search_list[c] < value < search_list[b]:
            a = c
            continue
        elif search_list[c] > value > search_list[a]:
            b = c
        else:
            raise ValueError ("not found")
            
    raise ValueError("not found")