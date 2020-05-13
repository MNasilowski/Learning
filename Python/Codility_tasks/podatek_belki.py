# -*- coding: utf-8 -*-
"""
Created on Fri Apr  3 10:39:57 2020

@author: nasil
"""

def zaokraglij(x):
    y = int(x*100)
    if y == x*100:
        return y*1.0/100
    else:
        return y*1.0/100 + 0.01
    
    
oprocentowanie = 0.015
kwota = 5000
podatek = 0.19
okres = 125
odsetki_brutto = oprocentowanie*kwota*okres/365
odsetki_brutto = zaokraglij(odsetki_brutto)
kwota_podatku = zaokraglij(odsetki_brutto*podatek)
odsetki_netto = odsetki_brutto - kwota_podatku




#5000,125dni, 2%
#5000, 125 dni, 1,5%
#500000, 30 dni, 1,8%
