"""
This exercise stub and the test suite contain several enumerated constants.

Since Python 2 does not have the enum module, the idiomatic way to write
enumerated constants has traditionally been a NAME assigned to an arbitrary,
but unique value. An integer is traditionally used because it’s memory
efficient.
It is a common practice to export both constants and functions that work with
those constants (ex. the constants in the os, subprocess and re modules).

You can learn more here: https://en.wikipedia.org/wiki/Enumerated_type
"""


# Score categories.
# Change the values as you see fit.
YACHT = 0
ONES = 1
TWOS = 2
THREES = 3
FOURS = 4
FIVES = 5
SIXES = 6
FULL_HOUSE = 7
FOUR_OF_A_KIND = 8
LITTLE_STRAIGHT = 9
BIG_STRAIGHT = 10
CHOICE = 11


def score(dice, category):
    dice.sort()
    if  ONES <= category <= SIXES:
        return dice.count(category)*category
    elif category == FULL_HOUSE:
        test = (dice.count(dice[0]),dice.count(dice[4]))
        return (test == (3,2))*19 + (test == (2,3))*16
    elif category == FOUR_OF_A_KIND:
        test = dice.count(dice[2])
        return (test ==4)*24 + (test == 5)*12
    elif category == LITTLE_STRAIGHT:
        return ([1,2,3,4,5]==dice)*30
    elif category == BIG_STRAIGHT:
        return ([2,3,4,5,6]==dice)*30
    elif category == CHOICE:
        return sum(dice)
    elif category == YACHT:
        return (dice.count(dice[0])==5)*50