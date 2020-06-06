c		Marcin Nasi³owski
c		zadanie 3 seria 5		
		program sumaszeregu1223334444
		implicit none
		integer n,i,j
		double precision suma,pomoc
		suma = 0
		print*,'podaj ile wyrazow program ma zsumowac'
		read*,n
		do 10 i = 1,n
		pomoc = 0
			do 11 j=0,i-1
			pomoc = pomoc +i*(10**(j))
11			continue
		suma = suma+pomoc
10		continue
		print*,'suma szeregu wynosi:',suma
		end