pro Mapa
;****************************************************************
;entry_device = !D.NAME & help, entry_device 
;set_plot, 'PS' 
;device,/helvetica       ;; for nice ps fonts
;device,/portrait        ;; landscape makes no sense for eps
;device,xsize=xsize
;device,ysize=ysize      ;; determine the aspect ratio and size of your plot
;device,xoffset=0        ;; I'm not sure if you really need this
;device,/encapsulated    ;; to create eps output
;device, filename='D:\Gaia_Wykresy\K_Korekcja.eps'

r=FltArr(2,5000)
openr,101,'D:\Gaia_Wykresy\polsup.txt'
readf,101,r
close, 101

cgplot, r[0,*],r[1,*],$
  title='Widmo Supernowej 1a',$
  xtitle='Dlugosc fali [A]',$
  ytitle='Zdolnosc kwantowa w %',$
  COLOR='NAVY',$
  YRANGE = [-90,90],$
  XRANGE = [0,400],$
  psym = 2,$
  SYMSIZE = 0.1
end