# -*- coding: utf-8 -*-
"""
Created on Wed Nov 22 11:40:56 2017

@author: Marcin
"""

import folium
import pandas as pd
from geopy.geocoders import Nominatim

danes = pd.read_excel("adresy.xlsx","Polska")
lats = list(danes["Lat"])
lons = list(danes["Lon"])

danep = pd.read_excel("adresy.xlsx","Pioneers")
latp = list(danep["Lat"])
lonp = list(danep["Lon"])

danee = pd.read_excel("adresy.xlsx","Explorers")
late = list(danee["Lat"])
lone = list(danee["Lon"])

danefp = pd.read_excel("adresy.xlsx","FinalistP")
latfp = list(danefp["Lat"])
lonfp = list(danefp["Lon"])

danefe = pd.read_excel("adresy.xlsx","FinalistE")
latfe = list(danefe["Lat"])
lonfe = list(danefe["Lon"])

map = folium.Map(location = [52.00, 21.00], zoom_start=5, tiles="Mapbox Bright")

fgs = folium.FeatureGroup(name = "Skywalkers")
for lt, ln in zip(lats, lons):
    fgs.add_child(folium.CircleMarker(location=[float(lt),float(ln)], radius = 2,fill_color = 'Green', color = 'green'))
    
    
fgp = folium.FeatureGroup(name = "Pioneers")
for lt, ln in zip(latp, lonp):
    fgp.add_child(folium.CircleMarker(location=[float(lt),float(ln)], radius = 2,fill_color = 'Red', color = 'Red'))
   
fge = folium.FeatureGroup(name = "Explorers")
for lt, ln in zip(late, lone):
    fge.add_child(folium.CircleMarker(location=[float(lt),float(ln)], radius = 2,fill_color = 'Blue', color = 'Blue'))

fgfp = folium.FeatureGroup(name = "Pioneers")
for lt, ln in zip(latfp, lonfp):
    fgfp.add_child(folium.CircleMarker(location=[float(lt),float(ln)], radius = 4,fill_color = 'Red', color = 'Red'))
   
fgfe = folium.FeatureGroup(name = "Explorers")
for lt, ln in zip(latfe, lonfe):
    fgfe.add_child(folium.CircleMarker(location=[float(lt),float(ln)], radius = 4,fill_color = 'Blue', color = 'Blue'))     


map.add_child(fgfe)
map.add_child(fgfp)
map.add_child(fgs)
map.add_child(fgp)
map.add_child(fge)
map.add_child(folium.LayerControl())
map.save("Map2.html")

