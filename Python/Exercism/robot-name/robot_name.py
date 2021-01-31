import random
import string

class Robot:
    names = []
    def create_name(self):
        i = 0
        while i < 10000:
            series = random.choice(string.ascii_uppercase)
            series += random.choice(string.ascii_uppercase)
            number = random.randint(0,1000)
            ID = series+str(number)
            if ID not in self.names:
                return ID
            i += 1
        
    
    def __init__(self):
        self.name = self.create_name()
        self.names.append(self.name)
        
    def reset(self):
        self.name = self.create_name()
        self.names.append(self.name)
        