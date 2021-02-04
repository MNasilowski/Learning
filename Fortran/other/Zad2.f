c	Marcin Nasilowski
c	Zad 2 metody numeryczne tlumaczenie z VB na FORTRAN
c	Poniewa¿ program wczesniej napisany dzia³a³ na "dowolnym PC" w sensie Microsoftu wysy³am t³umaczenie
c	na jezyk bardziej Linuksolubny napocz¹tek zadanie 2 

c	*************************FUNKCJA*********************************
		double precision FUNCTION f(x)
			double precision x
			f =exp(x) - 3*x**2
		end
c	*****************************************************************	
	
c	********************POCHODNA FUNKCJI******************************
		double precision FUNCTION fprim(x)
			double precision x
			fprim =exp(x) - 6*x
		end
c	*******************************************************************


		program Zad2
c	****************DEKLARACJA ZMIENNYCH*******************************
		Implicit none
			double precision a,b,c,c2,epsilon,f, fprim
			integer i
c	**************NADAWANIE WARTOSCI POCZATKOWYCH**********************
      	i = 0
      	a = 0.5
      	b = 1
	  	print*,("podaj wartosc dokladnosci")
	  	read*,epsilon 
c	***********************METODA BISEKCJI*****************************
101     continue
            c2 = c
            c = b + a
            c = c / 2
            If ((f(a) * f(c)) .LT. 0) Then
                b = c
            Else
                a = c
            EndIf
            i = i + 1
        IF (Abs(c - c2).GT.epsilon) then
        goto 101
        end if 
c#      tbwynik3.Text = c.ToString
		print*,("METODA BISEKCJI")
		print*,("miejsce zerowe"),c
		WRITE(*,900),("wartosc funkcji w miejscu zerowym"),f(c)
		print*,("ilosc iteracji"),i
c	******************METODA NEWTONA************************************		
        c = 1
        i = 0
102     continue
            c2 = c
            c = c2 - f(c2) / fprim(c2)
            i = i + 1
        IF (Abs(c - c2).GT.epsilon) then
        goto 102
        end if
        print*,("METODA NEWTONA")
        print*,("miejsce zerowe"),c
        WRITE(*,900),("wartosc w miejscu zerowym"),f(c)
        print*,("ilosc iteracji"),i
900		FORMAT(A,f14.12)
    	END
