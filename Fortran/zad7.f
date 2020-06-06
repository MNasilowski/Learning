c		Marcin Nasi³owski
c		Zad 7 i 8
c		wykorzystuje procedury z matrixlib.f	
		program zad7
		implicit none
		integer wym, i,j,pom
		parameter (wym = 8)
		double precision L(wym,wym),R(wym,wym),A(wym,wym),C(wym,wym)
		double precision X(wym),Y(wym)
		character*15 nazwapliku
c		********************START INTEREAKCJI**********************************
		nazwapliku = "macierz.txt"
		print*,("***********PROGRAM ROZKLAD LU MACIERZY A ***********")
		print*,("macierz zostanie wczytana z pliku macierz.txt")
c		print*,("Podaj nazwe pliku z macierza A")
c		read*,nazwapliku
c		********************WCZYTYWANIE DANYCH*********************************
		open(Unit = 10,File=nazwapliku,Status = "OLD",ERR = 103)
		do 107 j=1,wym
			Read(10,*),(A(j,i),i=1,wym)
107		continue
		CLOSE(10)
c		***********************************************************************
		print*,("Macierz A")
		call printM(A,wym)
		call LU(A,L,R,wym)
		print*,("Macierz Dolnotrujkatna")
		call printM(L,wym)
		print*,("Macierz gurnotrujkatna")
		call printM(R,wym)
		call divM(L,R,C,wym)
		print*,("Sprawdzenie L*U")
		call printM(c,wym)
c		***********************************************************************
		go to 104
c		*****Blad przy otwieraniu pliku
103		continue
		print*,("nie udalo siê otworzyc pliku program zostal zamkniety")
c		***********************************************************************
104		continue
		end