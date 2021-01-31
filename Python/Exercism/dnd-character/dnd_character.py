import random
import math

class Character:
    
    def __init__(self):
        self.strength= self.roll_dice()
        self.dexterity = self.roll_dice()
        self.constitution = self.roll_dice()
        self.intelligence = self.roll_dice()
        self.wisdom = self.roll_dice()
        self.charisma = self.roll_dice()
        self.hitpoints = 10 + modifier(self.constitution)
        
    def roll_dice(self):
        rolls = [random.randint(1,6) for i in range(4)]
        return sum(rolls) - min(rolls)

    def show_stats(self):
        print("STR ",self.strength)
        print("DEX ",self.dexterity)
        print("CON ",self.constitution)
        print("INT ",self.intelligence)
        print("WIS ",self.wisdom)
        print("CHA ",self.charisma)
        print("HP  ",self.hitpoints)
        
    def ability(self):
        return random.choice([self.strength, self.dexterity, self.constitution, 
                              self.intelligence, self.wisdom, self.charisma])
        
        
def modifier(con):
    return math.floor((con - 10)/2)
