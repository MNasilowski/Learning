class Luhn:
    def __init__(self, card_num):
        self.number = card_num.replace(" ", "") 

    def valid(self):
        if len(self.number) > 1 and self.number.isdigit():
            numbers = [int(i) for i in self.number]
            a = sum(i*2 if i < 5 else i*2 - 9 for i in numbers[-2::-2]) 
            b = sum(numbers[::-2])
            return (a+b)%10 == 0
        else:
            return False