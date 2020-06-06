C		Marcin Nasilowski
c		zad 2
c		odpowiednik wyslanego wczesniej WindowsAplication1\form2.vb
c		*******************LICZENIE WARTOSCI***********************************		
		double precision Function suma(wielomian,x,wym)
		implicit none
		integer wym,j
		double precision wielomian(wym),x
		suma = wielomian(1)
        do 100 j = 2,wym
            suma = suma + wielomian(j) * x**(j-1)
100		continue
		end
c		***********************************************************************
c		*******************DZIELENIE*******************************************
		integer function poldiv(wielomian,wym,c,wielomian2)
		implicit none
		integer wym
		double precision wielomian(wym),wielomian2(wym),c
c		*****Deklaracje wewnetrzne
		Integer j
        wielomian2(wym) = 0
        wielomian2(wym-1) = wielomian(wym)
        Do 101 j = (wym -2),1,(-1)
            wielomian2(j) = wielomian(j) + c * wielomian2(j+1)
101     continue
		poldiv=1
		end		
c		***********************************************************************
c		**********************MNOZENIE*****************************************		
		integer Function polint(wielomian,wym,d,wielomian3)
		implicit none
        integer wym,j
        double precision wielomian(wym),wielomian3(wym+1),c,d
        c = -d
        wielomian3(wym) = wielomian(wym-1)
        do 102 j = wym,1,-1
            wielomian3(j) = wielomian(j - 1) + c * wielomian(j)
102		continue
		polint = 1
    	End 
c		***********************************************************************

c		**************KROTKI PROGRAM TESTUJACY FUNKCJE*************************
		program zad3f
		implicit none
		integer wym, i,poldiv, polint, help
		parameter (wym = 9)
		double precision wielomian(wym), wielomian2(wym), wielomian3(wym+1)
		double precision suma,x,wart
c		***********************************************************************
		
c		*********************OZNACZENIA****************************************
c		wym				maksymalny wymiar wielomianu
c		wielomian		wczytany  wielomian
c		wielomian2		wielomian wynik dzielenia
c		wielomian3		wielomian wynik mnozenia
c		x				liczba iks
c		suma			wartosc wielomianu w punkcie x
c		***********************************************************************

c		****************NADAWANIE WARTOSCI POCZATKOWYHC************************
c		*****badany wielomian
c		*****zerujemy wielomian
		do 21 i = 1,wym
		wielomian(i) = 0
21		continue
c		****wczytujemy wielomian krok po kroku
		print*,("podaj wspolczynniki wielomianu od zerowego do maks osmego")
		print*,("wpisanie wartosci nie liczbowej zakonczy wczytywanie")
		do 22 i = 1,wym
		Read(*,*,ERR = 100,END  = 100),wielomian(i)
22		continue
c		****jak bedzie blad przy wczytywaniu lub sami zakonczymy to koniec
100		continue
		print*,("*******PROGRAM ROBIACY ROZNE RZECZY Z WIELOMIANEM***************"
		print*,("podaj liczbe 'a' dla ktorej bedzie znaleziona wartosc wielomianu")
		print*,("wielomian zostanie takze pomnozony i podzielony przez x - a")
		read*,x
c		****Jak wielomian
c		***************FUNKCJE*************************************************
		wart = suma(wielomian,x,wym)
		help = poldiv(wielomian,wym,x,wielomian2)
		help = polint(wielomian,wym,x,wielomian3)
		Print*,("**********WYNIKI*********")
		Print*,("wartoœc wielomianu w punkcie a wynosi")
		Print*,wart
		Print*,("wielomian pomnozony przez dwumian x - a ma kolejne wspolczynniki")
		Print*,(wielomian3(i),i=1,wym)
		Print*,("wielomian podzielony przez dwumian x - a ma kolejne wspolczynniki")
		Print*,(wielomian2(i),i=2,wym)
		Print*, ("reszta z dzielenia ="),wielomian2(1)
c		***********************************************************************
		end





