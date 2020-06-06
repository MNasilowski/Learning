c		marcin nasi³owski
c		zadanie 1 seria 5
		subroutine Indeks(WK, Indks,N)
		implicit none
		integer N
		integer Indks(N)
		real wk(N),posortowanewk(N), pom
		integer i,j
c		przepisywanie wektora wk do tabeli w ktorej odbedzie sie sortowanie		
			do 10 i=1,N
			posortowanewk(i) = wk(i)
10			continue		

c		sortowanie tabeli posortowanewk
		do 20 i=1,N 
			do 30 j=1,N -1
				If(posortowanewk(j).gt.posortowanewk(j+1)) then
					pom = posortowanewk(j)
					posortowanewk(j) = posortowanewk(j+1)
					posortowanewk(j+1) = pom
				end if
30			continue
20		continue		
c		wype³nianie tabeli indeks
		do 40 i = 1,N
			do  50 j= 1,n
				if(wk(j).eq.posortowanewk(i)) then
				indks(i) = j
				end if
50			continue	
40		continue
		end
		
c		* * * * * * * * * * * * * * * *	
c		*******************************		
		
		program main
		implicit none
		integer M,j,czas
		parameter ( M=10)
		integer I(M)
		real wektor(M)
		czas = Time()
		call srand(czas)
			do 10 j=1,M
			wektor(j) = rand(0)
10			continue		
		call indeks(wektor,I,M)
		print*,'Badany wektor'
		print*,'         ***     '
		do 9 j = 1,M
		print*,'WK[',j,']=',wektor(j)
9		continue
		print*,'         ***     '
		print*,'Wektor indeksow'
		print*,'I [',(I(j),j=1,m),']'
		end
		