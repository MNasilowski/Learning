def score(x, y):
    r = (x**2 + y**2)**0.5
    if r > 10:
        return 0
    elif 5 < r <= 10:
        return 1
    elif 1 < r <= 5:
        return 5
    elif 0 <= r <= 1:
        return 10


True*10 + True*1