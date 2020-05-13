pro LightCurve
;****************************************************************
;entry_device = !D.NAME & help, entry_device 
;set_plot, 'PS' 
;device,/helvetica       ;; for nice ps fonts
;device,/portrait        ;; landscape makes no sense for eps
;device,xsize=xsize
;device,ysize=ysize      ;; determine the aspect ratio and size of your plot
;device,xoffset=0        ;; I'm not sure if you really need this
;device,/encapsulated    ;; to create eps output
;device, filename='D:\Wyniki'
kroki = 1000
widmo=FltArr(3,218491)
strumien = FltArr(kroki + 1,90,2500)
dlugosc = FltArr(2500)
filtrG = FltArr(2,2500)
czas = FltArr(kroki + 1)

strumien_bolometryczny = FltArr(kroki + 1,90)
jasnosc_obserwowana = FltArr(Kroki + 1,110)
dni = IntArr(110)
zety = FltArr(kroki + 1)
prawdo = FltArr(kroki + 1)
sumalz = FltArr(61,kroki + 1)
sumaz = FltArr(2,kroki + 1)
ro = 0.0000228
C = 299792458 ;m/s
H = 70400 ;m/s/Mpc
dz = 0.00005

time = FltArr(2,6)
time[0,0] = 81
time[0,1] = 52
time[0,2] = 44
time[0,3] = 36
time[0,4] = 28
time[0,5] = 22
time[1,0] = 0.002
time[1,1] = 0.154
time[1,2] = 0.566
time[1,3] = 0.201
time[1,4] = 0.057
time[1,5] = 0.020


openr,101,'F:\Gaia_2014_09\sn1a_flux.v1.2.dat'
readf,101,widmo
close, 101

openr,101,'F:\Gaia_2014_09\FiltrG.txt'
readf,101,filtrG
close, 101

wielka_suma = 0
wielka_suma2 = 0
sumasum = FltArr(61)

FOR l = 0, 60 DO BEGIN
sumasum[l] = 0
ENDFOR

FOR j = 0, kroki DO BEGIN
sumaz[1,j] = 0
sumaz[0,j] = j*dz
FOR i = 0, 60 DO BEGIN
sumalz[i,j] = 0
ENDFOR
ENDFOR 

 
FOR k = 0, 2499 DO BEGIN
  dlugosc[k] = k + 1
ENDFOR

FOR k = 0, 109 DO BEGIN
  dni[k] = k
ENDFOR

FOR k = 0, kroki DO BEGIN
  zety[k] = k*dz
ENDFOR

FOR i = 0, kroki DO BEGIN
FOR j = 0, 89 DO BEGIN
FOR k = 0, 100 DO BEGIN
  strumien[i,j,k] = 0
ENDFOR
ENDFOR
ENDFOR  


FOR j = 0, 89 DO BEGIN
FOR k = 99, 2499 DO BEGIN
  strumien[0,j,k] = widmo[2,j*2401.0 + k - 99]
ENDFOR
ENDFOR

;dodajemy przesunięcie ku czerwieni
FOR i = 0, kroki DO BEGIN
FOR j = 0, 89 DO BEGIN
FOR k = 0, 2499 DO BEGIN
  strumien[i,j,k] = strumien[0,j,UINT(k/(1 + i*dz))]
ENDFOR
ENDFOR
ENDFOR  

FOR i = 0, kroki DO BEGIN
FOR j = 0, 89 DO BEGIN
FOR k = 0, 2499 DO BEGIN
  strumien[i,j,k] = strumien[i,j,k]*FiltrG[1,k]
ENDFOR
ENDFOR
ENDFOR  

FOR i = 0, kroki DO BEGIN
FOR j = 0, 89 DO BEGIN
strumien_bolometryczny[i,j] = 0
ENDFOR
ENDFOR  

FOR i = 0, kroki DO BEGIN
FOR j = 0, 89 DO BEGIN
FOR k = 0, 1200 DO BEGIN
strumien_bolometryczny[i,j] = strumien_bolometryczny[i,j] + strumien[i,j,k]
ENDFOR
ENDFOR
ENDFOR 
;MAMY WYZNACZONY STRUMIEŃ BOLOMETRYCZNY CZAS WYZNACZYĆ KRZYWE BLASKU 
 
strumien_max = strumien_bolometryczny[0,22]

FOR AG = 0, 5 DO BEGIN
  sig = 0.55
  FOR l = -30, 30 DO BEGIN
    IF (l EQ 0) THEN sig = 0.55
    Jasnosc_max = -18.67 + l*sig/10
    suma = 0
    FOR i = 0, kroki DO BEGIN
      z = i * dz
      dystans = c*z*(1 + 0.8 * z)/H
      if (dystans EQ 0) then dystans = 0.00001
      FOR j = 0, 89 DO BEGIN
        jasnosc_obserwowana[i,j] = Jasnosc_max - 2.5*ALOG10(strumien_bolometryczny[i,j]/(strumien_max*dystans*dystans)) + 25
      ENDFOR
      skok  = (jasnosc_obserwowana[i,79] - jasnosc_obserwowana[i,89])*0.1
      FOR j = 90, 109 DO BEGIN
        jasnosc_obserwowana[i,j] = jasnosc_obserwowana[i,j - 1] - skok
      ENDFOR
    ENDFOR  
    FOR i = 0, kroki DO BEGIN
      czas[i] = 0
      FOR j = 1, 109 DO BEGIN
        IF (jasnosc_obserwowana[i,j] LT 19) THEN BEGIN
        IF czas[i] EQ 0 THEN czas[i] = czas[i] - (1 - (19 - jasnosc_obserwowana[i,j])/(jasnosc_obserwowana[i,j - 1] - jasnosc_obserwowana[i,j]))  
          czas[i] = czas[i] + 1           
        ENDIF
        IF (jasnosc_obserwowana[i,j - 1] LT 19 AND (jasnosc_obserwowana[i,j] GT 19))  THEN czas[i] = czas[i] + (1 - (jasnosc_obserwowana[i,j] - 19)/(jasnosc_obserwowana[i,j] - jasnosc_obserwowana[i,j - 1])) 
      ENDFOR
    ENDFOR  
  ;prawdopodobieństwo zauwazenia supernowej w odleglosic z
    FOR i = 0, kroki DO BEGIN
      pomoc = ((czas[i])*1.0)/(time[0,AG]*1.0)
      IF pomoc LT 0 THEN pomoc = 0
      IF pomoc GT 1 THEN pomoc = 1
      prawdo[i] = pomoc
    ENDFOR
    po = (GAUSS_PDF((l+1)*0.1) - GAUSS_PDF(l*0.1))
    ;IF (l EQ 0 ) THEN print, zety[*],prawdo[*]
    suma = 0
    FOR i = 0,kroki - 1 DO BEGIN
 
      z1 = i * dz
      z2 = (i + 1) * dz
      R1 = c*z1/H
      R2 = c*z2/H
      ro = (0.794*z1 + 0.204)*0.0001
      DV = 4*3.141596 * 0.826311 *(R2^3 - R1^3)/3
      suma = suma + DV * ro* prawdo[i+1]
      sumaz[1,i] = sumaz[1,i] + DV * ro * prawdo[i+1]*po* time[1,AG] 
    ENDFOR
    wielka_suma = wielka_suma + suma*po
    sumasum[l + 30] = sumasum[l + 30] + suma*po*time[1,AG] ;Od jasności
  ENDFOR
wielka_suma2= wielka_suma2 + wielka_suma*time[1,AG]
wielka_suma = 0
ENDFOR
FOR i = 0, kroki DO BEGIN
sumaz[0,i] = i*dz
FOR l = 0, 60 DO BEGIN
sumaz[1,i] = sumaz[1,i] + sumalz[l,i] 
ENDFOR
ENDFOR
suma = 0 
 
FOR i = 0, 60 DO BEGIN
print, sumasum[i]
ENDFOR

print, wielka_suma2, suma
end