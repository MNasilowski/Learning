def is_triangle(sides):
    return sorted(sides)[2] < sum(sorted(sides)[:2])

def equilateral(sides):
    return len(set(sides)) == 1 and is_triangle(sides)


def isosceles(sides):
    return len(set(sides)) < 3 and is_triangle(sides)


def scalene(sides):
    return len(set(sides)) == 3 and is_triangle(sides)
