def slices(series, length):
    if length <= len(series) and length > 0:
        return [series[i:i+length] for i in range(len(series) - length+1)]
    else:
        raise ValueError('Length should be GT 0 an LT series length')
