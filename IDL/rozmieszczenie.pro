pro rozmieszczenie
;****************************************************************
entry_device = !D.NAME & help, entry_device 
set_plot, 'ps' 
device,/helvetica       ;; for nice ps fonts
device,/portrait        ;; landscape makes no sense for eps
device,xsize=xsize
device,ysize=ysize      ;; determine the aspect ratio and size of your plot
device,xoffset=0        ;; I'm not sure if you really need this
device,/encapsulated    ;; to create eps output


device, filename='D:\Gaia_Wykresy\deklinacja.eps'
pol=FltArr(2,5937); polozenie supernowych deklinacja
loc=FltArr(1,36)
loc2=FltArr(1,36)

FOR I=0,35 DO loc[I] = I*5 - 90
;print, loc
;****************Wczytywanie tabele z ekstynkcja*****************
;
;***********************Filtru B*********************************
close, 105 
openr,105,'D:\Gaia_Wykresy\Polozenie_sup.txt'
readf,105,pol
close, 105


!P.MULTI = [0,1,1]
;*******************Pierwszy wykres************************************
AXISCOLORNAME=7   
BACKCOLORNAME=143
;z = histogram(pol[1,*],BINSIZE = 5,MIN = -90,Location = loc2)
cgHistoplot, pol[1,*],$
     MININPUT = -90,$
     COLOR='BLUE',$
     datacolorname = 'NAVY',$
     POLYCOLOR='HONEYDEW',$
     Location = loc,$
     BINSIZE=5,$
     Title='Ilosc zaobserwowanych supernowych', $
     XTitle='Szerokosc galaktyczna', $
     YTitle='Ilosc',$
     
     /FILL
     
;oplot,loc2, z/(6.283*abs((cos(loc2 - 90) - cos(loc2 - 85))))
 ;*************Zamykanie PS**************************************
 device, /close_file 
 set_plot, entry_device
end