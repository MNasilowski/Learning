class Clock:
    def __init__(self, hour, minute):
        self.hour = (24 + (hour + minute//60)%24)%24
        self.minute = minute%60

    def __repr__(self):
        return(f"{self.hour:02}:{self.minute:02}")

    def __eq__(self, other):
        return self.hour == other.hour and self.minute == other.minute

    def __add__(self, minutes):
        return(Clock(self.hour,self.minute+minutes))

    def __sub__(self, minutes):
        return(Clock(self.hour,self.minute-minutes))


