def is_isogram_v2(string):
    #complexity always Ó(n)
    string = string.lower() #O(n)
    string = string.replace(' ','') #O(n)
    string = string.replace('-','') #O(n)   
    if len(set(string)) == len(string): #O(n)
        return True
    else:
        return False
    
def is_isogram(string):
    #complexity O(n^2) but it can break earlier
    string = string.lower() #O(n)
    for i in range(len(string)): #0(n^2)
        for j in range(i+1,len(string)):
            if string[i] == string[j] and string[i] != '-' and string[i] != ' ':
                return False
    return True
