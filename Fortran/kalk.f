c		**************************
		
		subroutine opisfunkcji()
		print*(obs³ugiwane operacje)
		print*(dodawanie   a+b)
		print*(odejmowanie a-b)
		print*(dzielenie   a/b)
		print*(mnozenie    a*b)
		print*(potega      a^b)
		print*(przyk³adowe wyrazenie 10+10*2)
		end
		
C		***************************
		program kalkulator
		implicit none
c		*** m zmienna okreslajaca max ilosc znakow w wierszu		
		integer m
		parameter(m=30)
c		*** operacja tablica zawierajaca operacje znajdujace sie w wierszu
		character*4 operacja(M)
c		***Wyra¿eni wyrazenie ktore ma program policzyc
		character*(M) wyrazenie
c		***Tablica wartosci znalezionych w wyrazeniu
		real Tabwar(M)
		print*,'Podaj wyrazenie które chcesz obliczyc'
		print*,'wrazie watpliwosci wpisz - HELP'
		read*,wyrazenie
		if(operacja.eq.'Help') then
		call opisfunkcji()
		end if
c		***zamiana ciagu znakow na operacje i wartosci

		do 10 i = 1,M
			znak = wyrazenie(i:i)
				if (ichar(znak).ge.ichar('0').and.ichar(znak).le.ichar('9')) then
					if(pomk.eq.0) then
					k = k+1
					pomk = 1
					end if
				tabwar(j) = tabwar(j)*10 + ichar(znak) - ichar('0')
				else
					if(pomj.eq.0) then 
					j = j+1
					pomj = 1
					end if
				operacja(k) = operacja(k)//znak 
				end if 
10		continue
c		***koniec zamiany poczatek sumowania
c		*** szukamy kolejnosci dzia³an
c		*** zaczynamy od pierwszego mnozenia od lewej a nastepnie w kolejnosci mnozenie potem dodawanie	
if (operacj.eq.'+') then
		wynik = a+b
		end if
		if(operacja.eq.'-') then
		wynik = a - b
		end If
		if( operacja.eq.'/' .or operacja.eq.':') then
		wynik = a/b
		end If
		If (operacja.eq.'*') then
		wynik = a*b
		end if
		end