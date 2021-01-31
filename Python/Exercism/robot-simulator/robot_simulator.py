# Globals for the directions
# Change the values as you see fit
EAST = {'L':'NORTH', 'R':'SOUTH', 'A': [1,0]}
NORTH = {'L':'WEST', 'R':'EAST', 'A': [0,1]}
WEST = {'L':'SOUTH', 'R':'NORTH', 'A': [-1,0]}
SOUTH = {'L':'EAST', 'R':'WEST', 'A': [0,-1]}
DIRECTIONS = {'EAST': EAST, 'NORTH': NORTH, 'WEST': WEST, 'SOUTH': SOUTH}

class Robot:
    def __init__(self, direction=NORTH, x=0, y=0):
        self.coordinates = (x,y)
        self.direction = direction
        
    def move(self,commands = 'A'):
        for c in commands:
            if c == 'L' or c == 'R':
                self.direction = DIRECTIONS[self.direction[c]]
            elif c == 'A':
                a = self.coordinates[0] + self.direction[c][0]
                b = self.coordinates[1] + self.direction[c][1]
                self.coordinates = (a,b)