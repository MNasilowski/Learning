c		Marcin Nasi³owski
c		zadanie 3 seria 5		
		program sumaszeregu1223334444
		implicit none
		integer n,i,j,k
		double precision suma,pomoc,tmp,pom
		suma = 0
		print*,'podaj ile wyrazow program ma zsumowac'
		read*,n
		do 10 i = 1,n
		pomoc = 0
		K = 0
C		FRAGMENT KODU LICZASY Z ILU ZNAKOW SK£ADA SIE LIUCZBA I
12			continue
			k=k+1
			pom = MOD(I,10*k)
			if (pom.ne.I)then
			goto 12
			END iF
C		*******************************************************		
			do 11 j=0,i-1
			pomoc = pomoc +i*((10**(K))**(j))
			print*,pomoc
C		W powyzszej 
11			continue
			print (*,30),pomoc
		suma = suma+pomoc
10		continue
		print*,'suma szeregu wynosi:',suma
		end

C       Dobrze, tyle ze program poprawnie dziala tylko do N=9. Oczywiscie, o
C       ile sens maja takie liczby, jak np. dla N=10 10101010101010101010. Au-
C       torzy zadania milcza na ten temat, a ja sie upieral nie bede. Prosze
C       sie jednak zastanowic, jak zmodyfikowac powyzszy program, by bral pod
C       uwage rowniez i takie liczby. I czy to w ogole jest mozliwe.
C
C       [5.0 pkt/5]
