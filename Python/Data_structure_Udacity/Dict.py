# -*- coding: utf-8 -*-
"""
Created on Fri Mar 15 22:04:45 2019

@author: nasil
"""

"""Time to play with Python dictionaries!
You're going to work on a dictionary that
stores cities by country and continent.
One is done for you - the city of Mountain 
View is in the USA, which is in North America.

You need to add the cities listed below by
modifying the structure.
Then, you should print out the values specified
by looking them up in the structure.

Cities to add:
Bangalore (India, Asia)
Atlanta (USA, North America)V
Cairo (Egypt, Africa)V
Shanghai (China, Asia)"""

locations = {'Africa': {'Egypt': ['Cairo']},
'Asia': {'China': ['Shanghai'],'India': ['Bangalore']},
'North America': {'USA': ['Mountain View','Atlanta']}}

"""Print the following (using "print").
1. A list of all cities in the USA in
alphabetic order.
2. All cities in Asia, in alphabetic
order, next to the name of the country.
In your output, label each answer with a number
so it looks like this:
1
American City
American City
2
Asian City - Country
Asian City - Country"""
A = locations['North America']['USA']
A.sort()
print(1)
for city in A:
    print(city)
print(2)
countries = locations['Asia']
A = list(countries.values())
cities = []
for city in A:
    for i in city:
        cities.append(i)
        
cities.sort()        
for city in cities:
    for country in countries:
        if city in countries[country]:
            print(city + " - " + country)
