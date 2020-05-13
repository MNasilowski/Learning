pro wyniki1a
;****************************************************************
entry_device = !D.NAME & help, entry_device 
set_plot, 'PS' 
device,/helvetica       ;; for nice ps fonts
device,/portrait        ;; landscape makes no sense for eps
device,xsize=xsize
device,ysize=ysize      ;; determine the aspect ratio and size of your plot
device,xoffset=0        ;; I'm not sure if you really need this
device,/encapsulated    ;; to create eps output
device, filename='F:\Gaia_Wykresy\Wyniki_1a_G.eps'


wyniki=FltArr(4,61)
obserwowane=FltArr(169)


openr,101,'F:\Gaia_Wykresy\Wyniki_1a2016.txt'
readf,101,wyniki
close, 101

openr,105,'F:\Gaia_Wykresy\Jasn_Obser.txt'
readf,105,obserwowane
close, 105

!P.MULTI = [0,1,1]
;*******************Pierwszy wykres************************************
AXISCOLORNAME=7   
BACKCOLORNAME=143
cgHistoplot, obserwowane[*],$
     MININPUT = -22,$          ;;POczątek histogramu
     datacolorname = 'NAVY',$ ;;Kolor lini w histogramie
     POLYCOLOR='HONEYDEW',$   ;;Kolor wypełnieniea
     Location = loc,$         ;;Wektor z poczatkami slupkow
     BINSIZE=0.1,$            ;;Rozmiar slupkow
     /FREQUENCY,$             ;;Wyswietla czestotliwosc
     /FILL,$                  ;;Wypelnia slupki   
     title='Rozklad jasnosci supernowych 1a',$ 
     xtitle='Jasnosc absolutna [mag]',$
     ytitle='Czestosc'


     
CGplot, wyniki[0,*] ,wyniki[1,*]*3, COLOR = 'NAVY',thick=4,/OVERPLOT
CGplot, wyniki[2,*] ,wyniki[3,*]*3,linestyle = 2,thick=4, COLOR ='RED',/OVERPLOT



CGplot, [-18.0, -17.5], [0.129 , 0.129], COLOR ='NAVY',thick=4, /OVERPLOT
CGPlot, [-18.0, -17.5], [0.118 , 0.118], linestyle = 2,COLOR ='RED',thick=4, /OVERPLOT
;CGPlot, [1.0, 1.2], [0.11 , 0.11], COLOR ='NAVY', /OVERPLOT
cgText, 0.76, 0.86, /NORMAL, '18,99', COLOR='NAVY'
cgText, 0.76, 0.80, /NORMAL, '18,67', COLOR='RED'
;cgText, 0.6, 0.69, /NORMAL, 'Obserwowana w g', COLOR='blue'


 ;*************Zamykanie PS**************************************
 device, /close_file 
 set_plot, entry_device
end