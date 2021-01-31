def flatten(iterable):
    result = str(iterable).replace("[","").replace("]","")
    result = result.replace(" ","")
    result = result.split(",")
    result = [int(i) for i in result if i != 'None']
    return result

