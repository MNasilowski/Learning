allergies = ['eggs', 'peanuts', 'shellfish', 'strawberries',
             'tomatoes', 'chocolate', 'pollen', 'cats']

class Allergies:

    def __init__(self, score = 0):
        self.score = score
        binScore = list(bin(score))[2:]
        self.allergies = []
        for i in range(min(8,len(binScore))):
            if binScore[-(i+1)] == '1':
                self.allergies.append(allergies[i])

    def allergic_to(self, item):
        return item in self.allergies
    @property
    def lst(self):
        return self.allergies