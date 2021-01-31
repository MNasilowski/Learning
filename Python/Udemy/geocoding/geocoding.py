# -*- coding: utf-8 -*-
"""
Created on Tue Nov 24 15:31:45 2020

@author: nasil
"""
import folium
import pandas as pd
from geopy.geocoders import ArcGIS

locations = pd.read_excel("PCK_boxes.xlsx")
nom = ArcGIS()
positions = []
rejected = []
for a in list(locations["City"] +" " + locations["Adress"]):
    try:
        b = nom.geocode(a)
        positions.append([round(b.latitude,4),round(b.longitude,4)])
    except:
        positions.append([None,None])
        
locations["Positions"] = positions
word_map = folium.Map(location=[52.228, 21.003], zoom_start = 12, tiles = "Stamen Terrain")

fg = folium.FeatureGroup(name="My Map")
for b,c in zip(locations["Positions"],locations["Adress"]):
    fg.add_child(folium.Marker(location = b,popup = c , icon = folium.Icon(color='green')))
word_map.add_child(fg)

word_map.save("Map1.html")
