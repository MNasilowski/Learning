c	Marcin Nasi³owski
c	Zad 9 Metody Numeryczne
c	funkcja któr¹ program ponizej calkuje		
		integer function fun(double precision x)
			fun = sin(x)
		end
c	program calkujacy funkcje fun metoda monte carlo		
		
		program zad9
		
c	**********************************************************************************
		implicit none
		call srand(time())
		double precision x1,y1,y2,fa,fb
		integer i,wym,ilosc
		parameter (wym = 20,ilosc = 1000)
		character nazwapliku, stat
		double precision calka(wym)
c	****************************OZNACZENIA*********************************************
c	x1  			wylosowany argument funkci
c	y1				wylosowana wartosc funkcji
c	y2				wartosc funkcji w punkcie x1
c	calka 			wartosci calki
c	i   			zmienna liczaca
c	a				pocz¹tek przedzialu
c	fa				wartosc funkcji w punkcie a
c	b				koniec przedzialu
c	fb				wartosc funkcji w punkcie b
c	tak				ilosc punktów pod funkcj¹
c	wym				wymiar tabeli przechowywujacej kolejne szacowania calki
c	ilosc			ilosc losowan po ktorych zostaje zapisana wartosc calki
c	nazwapliku		jak sama nazwa wskazuje ta zmienna przechowyywuje nazwe pliku
c	stat			status z jakim bedzie otwierany plik nazwapliku	
c	************************************************************************************	
		do 101 k=1,wym
			do 100 i=1,k*ilosc
			x1 = a+(rand())*ABS(b-a)
			y1 = minimum + rand()*ABS(fb - fa)
			y2 = fun(x1)
			if (y2.GT.y1) then
				tak = tak+1
			end if
100			continue
101		continue
		calka(k) = ABS(b-a)*(minimum+ABS(fb-fa)*Tak/(k*ilosc))
		print*,calka(K)
c		open(Unit = 20,File = nazwapliku,status = stat,ERR = 888)
		
		
		
		