def is_valid(isbn):
    isbn = isbn.replace("-","")
    if len(isbn) != 10:
        return False
    try:
        validation = int(isbn[-1])
    except: 
        if isbn[-1]=='X':
            validation = 10
        else:
            return False
        
    isbn = isbn[:-1]
    for i in range(9):
        try:
            validation += int(isbn[i])*(10-i)
        except:
            return(False)

    return validation%11==0

