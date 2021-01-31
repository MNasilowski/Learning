earth_period = 31557600
T = {"Earth": 1, "Mercury": 0.2408467, "Venus": 0.61519726,
     "Mars": 1.8808158, "Jupiter": 11.862615, "Saturn": 29.447498,
     "Uranus": 84.016846, "Neptune": 164.79132}

class SpaceAge:

    def __init__(self, seconds): 
        self.age_on_earth = seconds / earth_period 
        
    def on_earth(self):
        return round(self.age_on_earth,2)
    
    def on_mercury(self):
        return round(self.age_on_earth/T["Mercury"],2)
    
    def on_venus(self):
        return round(self.age_on_earth/T["Venus"],2)
    
    def on_mars(self):
        return round(self.age_on_earth/T["Mars"],2)
    
    def on_jupiter(self):
        return round(self.age_on_earth/T["Jupiter"],2)
    
    def on_saturn(self):
        return round(self.age_on_earth/T["Saturn"],2)
    
    def on_uranus(self):
        return round(self.age_on_earth/T["Uranus"],2)
    
    def on_neptune(self):
        return round(self.age_on_earth/T["Neptune"],2)
    
    
    
        
    