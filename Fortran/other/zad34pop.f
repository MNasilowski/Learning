c		Marcin Nasiloski
c		procedura znajdujaca podzielniki liczby 
		subroutine podzielniki(liczba,tab,size)
		implicit none
		integer liczba, size,i,j
c		liczba - badana liczba size - wymiar tablicy tab tablica w ktorej sa przechowywane podzielniki
		integer tab(size)
		j = 1
		do 10 i = 1, liczba
		 if (mod(liczba,i).eq.0) then
		 	tab(j) = i
		 	j = j + 1
		 	if (j.gt.size) then
		 		print*,'dzielniki liczby',liczba,'nie mieszcza sie w tabeli'
		 		go to 111
		 	end if
		 end if
10		 continue
111		 continue
		 end
c		 program sprawdzajacy dzialanie powyzszej procedury
c		 program beznazwy
c		 implicit none
c		 integer wymiar, jakasliczba,j
c		 parameter (wymiar = 50)
c		 integer tablica(wymiar)
c		 read*,jakasliczba
c		 call	podzielniki(jakasliczba,tablica,wymiar)
c		 print*,tablica
c		 end

C       W poprzedniej wersji programu odkomentowalem segment glowny dlatego,
C       ze bez tego program sie nie kompiluje i nie dziala. W wymaganiach do-
C       tyczacych rozwiazan zadan domowych bylo jasno powiedziane, ze podprog-
C       ramowi ma zawsze towarzyszyc stosowny segment glowny.
