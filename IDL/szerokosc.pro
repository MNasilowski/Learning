pro szerokosc
;****************************************************************
entry_device = !D.NAME & help, entry_device 
set_plot, 'PS' 
device, filename='D:\Gaia_Wykresy\Ekstynkcjag.ps'
B=FltArr(7,204); Tablica z ekstynkcja w B
g=FltArr(7,183); Tablica z ekstynkją w g
V=FltArr(7,20); Tablica z ekstynkcja w B
wyn = FltArr(2,70);

;****************Wczytywanie tabele z ekstynkcja*****************
;
;***********************Filtru B*********************************
close, 104 
openr,104,'D:\Gaia_Wykresy\EkstynkcjaB.txt'
readf,104,B
close, 104
;***********************Filtru g*********************************
close, 101
openr,101,'D:\Gaia_Wykresy\Ekstynkcjag.txt'
readf,101,g
close, 101
;***********************Filtru V*********************************
close, 102
openr,102,'D:\Gaia_Wykresy\Ekstynkcjag.txt'
readf,102,V
close, 102
;***********************Filtru V*********************************
close, 105
openr,105,'D:\Gaia_Wykresy\Wyniki_1a.txt'
readf,105,wyn
close, 105
!P.MULTI = [0,1,1]
;*******************Pierwszy wykres************************************
;binsize = 0.2
;AXISCOLORNAME=7   
;BACKCOLORNAME=143
;cgHistoplot, B[3,*], HISTDATA=h, LOCATIONS=loc, BINSIZE=binsize,$
;     Title='B', $
;     XTitle='Jasnosc', $
;     YTitle='Ilosc',$
;     /FILL
;binCenters = loc + (binsize / 2.0)
;yfit = GaussFit(binCenters, h, coeff, NTERMS=3)
;cgPlot, binCenters, yfit, COLOR='dodger blue', THICK=2, /OVERPLOT
 
 
;****************Drugi wykres*************************************** 
binsize = 0.1  
AXISCOLORNAME=7   
BACKCOLORNAME=143
cgHistoplot, g[3,*], HISTDATA=h, LOCATIONS=loc, BINSIZE=binsize,$
     MININPUT = -1,$
     Title='g', $
     POLYCOLOR='spring green',$
     XTitle='Jasnosc', $
     YTitle='Ilosc',$
     /FILL
  binCenters = loc + (binsize / 2.0)
  yfit = GaussFit(binCenters, h, coeff, NTERMS=3)
  cgPlot, binCenters, yfit, COLOR='navy', THICK=2, /OVERPLOT  
   maxfit = String(coeff[0], FORMAT='(F0.2)')
   centerfit = String(coeff[1], FORMAT='(F0.2)')
   fwhm = String(2 * SQRT(2 * ALOG(2)) * coeff[2], FORMAT='(F0.2)')
   sig = String(coeff[2], FORMAT='(F0.2)')
   cgText, 0.5, 0.85, /NORMAL, 'Maksimum: ' + maxfit, COLOR='navy'
   cgText, 0.5, 0.80, /NORMAL, 'Centrum: ' + centerfit, COLOR='navy'
   cgText, 0.5, 0.75, /NORMAL, 'FWHM: ' + sig, COLOR='navy'
  !P.MULTI = 0
  
  
  
 ;*************Zamykanie PS**************************************
 device, /close_file 
 set_plot, entry_device
end