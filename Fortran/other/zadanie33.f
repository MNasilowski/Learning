
		real function silnia(numer)
		real i,numer
		silnia = 1
		do 20 i=1,numer
		silnia = silnia*i
20		continue
		end function
c		* * * * * * * * * * * * * * * * * * * * * * * *
c		 * * * * * * * * * * * * * * * * * * * * * * *
c		  * * * * * * * * * * * * * * * * * * * * * *
		program liczacycosinusmetodasumowaniaszeregu
		implicit none
		real suma,x,dokladnosc, silnia,n
		
		n = 0
		suma = 0
		print*,'podaj argument'
		read*,x
		print*,'podaj dokladnosc'
		read*,dokladnosc
		
10		continue
		suma = suma + ((-1)**n)*((x)**(2*n))/(silnia(2*n))
		n=n+1
		If (ABS(suma - cos(x)).GT.dokladnosc) then
		goto 10
		end if
		print *,suma
		end
		