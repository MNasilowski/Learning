pro K_Korekcja
;****************************************************************
entry_device = !D.NAME & help, entry_device 
set_plot, 'PS' 
device,/helvetica       ;; for nice ps fonts
device,/portrait        ;; landscape makes no sense for eps
device,xsize=xsize
device,ysize=ysize      ;; determine the aspect ratio and size of your plot
device,xoffset=0        ;; I'm not sure if you really need this
device,/encapsulated    ;; to create eps output
device, filename='D:\Gaia_Wykresy\K_Korekcja.eps'

widmo=FltArr(2,1200)
G=FltArr(2,1200)


openr,101,'D:\Gaia_Wykresy\Widmo_1a.txt'
readf,101,widmo
close, 101
openr,102,'D:\Gaia_Wykresy\G.txt'
readf,102,G
close, 102
!P.MULTI = [0,2,1]
;*******************Pierwszy wykres************************************
cgplot, widmo[0,*],widmo[1,*]*10000000000,$
  title='Widmo Supernowej 1a',$
  xtitle='Dlugosc fali [A]',$
  ytitle='Zdolnosc kwantowa w %',$
  COLOR='NAVY',$
  YRANGE = [0,100]
cgplot,G[0,*]/10,G[1,*],linestyle = 1,/OVERPLOT,$
  COLOR='NAVY'

;**************Dodajemy Legende**********************************
 ;oplot, [800, 900], [90, 90]
 ;oplot, [800, 900], [85, 85], linestyle = 1
 ;xyouts, 920, 89, 'Widmo'
 ;xyouts, 920, 84, 'Filtr G'
;**************Drugi wykres**************************************
 cgplot, widmo[0,*],widmo[1,*]*G[1,*]*100000000,$
  title='Widmo w filtrze G',$
  xtitle='Dlugosc fali [A]',$
  YRANGE = [0,100],$
  COLOR='NAVY',$
  LEGENDS = 1
 ;oplot, [800, 900], [90, 90]
 ;xyouts, 920, 89, 'Widmo'
 !P.MULTI = [0, 1, 1]
 ;*************Zamykanie PS**************************************
 device, /close_file 
 set_plot, entry_device
end