c		Marcin Nasi³owski zadanie 11
c		Program rozwi¹zuj¹cy równanie ró¿niczkowe metod¹ predictor corrector


C		*********************POCHODNA FUNKCJI**********************************
		double precision function fprim(x,y)
		double precision x,y
		fprim = x*x - 2*y
		end
c		***********************************************************************

c		*********************PROGRAM GLOWNY************************************		
		program PC
		implicit none
		Integer n,wym,i
		Parameter (wym = 41)
		double precision TAB(3,wym), h, fprim
c		***********************************************************************

c		*********************OZNACZENIA****************************************
c		n 					 numer kroku
c		h					 dlugosc kroku
c		wym 				 wymiar tabeli dla nas 41 
c		i 					 zmienna sterujaca petlami moze sie przyda moze nie.
c		TAB(1,n) = X 		 argument funkcji
c		TAB(2,n) = Y 		 wartosc funkcji
c		TAB(3,n) = yprim	 pochodna funkcji w entym kroku	
c		***********************************************************************

c		*********************NADAWANIE WARTOSCI POCZATKOWYCH*******************
		h = 0.1
		do 11 i=1,wym
		tab(1,i) = (i-1)*0.1
11		continue
		tab(2,1) = 2.000000
		tab(2,2) = 1.637779
		tab(2,3) = 1.343060
		do 12 i=1,wym
		tab(3,i) = fprim(tab(1,i),tab(2,i))
12		continue
c		***********************************************************************

c		*********************HELLO WORLD ALBO POCZATEK LICZENIA****************
		do 13 n = 4,wym
c		****liczymy predictor
			tab(2,n) = tab(2,n-3) + 1.5*h*(tab(3,n-1) + tab(3,n-2))
c		****liczymy pochodna
			tab(3,n) = fprim(tab(1,n),tab(2,n))
c		****poprawiamy correctorem
			tab(2,n) = tab(2,n-1) +0.5* h * (tab(3,n) + tab(3,n-1))
c		****i idziemy dalej		
13		continue
c		***********************************************************************

c		*********************HELLO WORD ALBO WYSWIETLANIE WYNIKOW**************
		PRINT*,('***PROGRAM ROZWIAZUJACY ROWNANIA ROZNICZKOWE***')
		PRINT*,("Rownanie y' + 2y = x^2")
		PRINT*,("Badany przedzial od 0 do 4")
		PRINT*,("Gestosc krokow 0,1")
		PRINT*,(" ")
		PRINT*,("_______WYNIKI_________")
		PRINT*,("X- --Y------ --Y'-----")
		OPEN(Unit = 20,File = "dane.txt")
		DO 14 n = 1, wym
		WRITE(*,101),(Tab(i,n),(" "),i=1,3)
		WRITE(20,101),(Tab(i,n),(" "),i=1,3)
14		CONTINUE
		CLOSE(20)
		PRINT*,("WYNIKI zostaly zapisany do pliku dane.txt")
		PRINT*,("Kolejnosc kolumn w pliku jak wyzej")
c		***********************************************************************

c		*********************FORMATY*******************************************
101		FORMAT((f3.1),(A),(f9.6),(A),(f9.6),(A))
c		*********************RIP***********************************************
		END 