PRO WIDMO_1a
;****************************************************************
entry_device = !D.NAME & help, entry_device 
set_plot, 'PS' 
device,/helvetica       ;; for nice ps fonts
device,/portrait        ;; landscape makes no sense for eps
device,xsize=xsize
device,ysize=ysize      ;; determine the aspect ratio and size of your plot
device,xoffset=0        ;; I'm not sure if you really need this
device,/encapsulated    ;; to create eps output
device, filename='D:\Gaia_Wykresy\Widmo_1a.eps'
widmo=FltArr(2,3000)


openr,101,'D:\Gaia_Wykresy\Widmo_1a.txt'
readf,101,widmo
close, 101
CGplot, widmo[0,*],widmo[1,*]/0.000000009, COLOR = 'NAVY',$
    XRANGE = [0,2000],$
    Title='WIDMO SUPERNOWEJ Ia', $
    XTitle='DLUGOSC FALI [nm]', $
    YTitle='STRUMIEN'
oplot, [615, 615], [0 , 1], COLOR ='black', linestyle = 1
oplot, [656, 656], [0 , 1], COLOR ='black', linestyle = 2


CGplot, [1350, 1500], [0.87 , 0.87], COLOR ='NAVY', /OVERPLOT
CGPlot, [1350, 1500], [0.80 , 0.80], LINESTYLE = 1,COLOR ='BLACK', /OVERPLOT
CGPlot, [1350, 1500], [0.73 , 0.73], LINESTYLE = 2,COLOR ='BLACK', /OVERPLOT
cgText, 0.75, 0.79, /NORMAL, 'Widmo', COLOR='NAVY'
cgText, 0.75, 0.74, /NORMAL, 'Si II ', COLOR='black'
cgText, 0.75, 0.69, /NORMAL, 'H alpha', COLOR='black'

 ;*************Zamykanie PS**************************************
 device, /close_file 
 set_plot, entry_device
end