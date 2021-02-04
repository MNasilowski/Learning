c		Marcin Nasi³owski
c		Zad 8
c		program wykorzystuje procedury z pliku matrixlib.f
		program za8
		implicit none
		character*15 nazwapliku
		integer wym, j,i
		parameter(wym = 8)
		double precision A(wym,wym), B(wym,wym), C(wym,wym)
		nazwapliku = "macierz.txt"
		print*,("*****PROGRAM MACIERZ ODWROTNA DO A *****")
		print*,("macierz zostanie wczytana z pliku macierz.txt")
		open(Unit = 10,File=nazwapliku)
		do 107 j=1,wym
			Read(10,*),(A(j,i),i=1,wym)
107		continue
		CLOSE(10)
		print*,("***Macierz A wczytana")
		call printM(A,wym)
		call odwM(A,B,wym)
		print*,("***Macierz odwrotna do A")
		call printM(B,wym)
		print*,("***Sprawdzenie A*B")
		call divM(A,B,C,wym)
		call printM(C,wym)
		end