c		Marcin Nasi³owski 
c		Zadanie 1 seria 3
		program tablica9na9wczytywanazpliku
		implicit none
		integer m,i,j,iargc,n
		parameter(m=9)
		character nazwapliku*20
		real tab(M,M),pow(M-1),pon(M-1)
		n = iargc()
		if (n.eq.1) then
			call getarg(1,nazwapliku)
		else
			print*,'podaj nazwe pliku z tabel¹'
			read*,nazwapliku
		end if
		
			do 900 i = 1,m-1
			POW(I) = 0
			PON(i) = 0
900		CONTINUE
		nazwapliku = 'dane2.txt'
		open(Unit = 20,File = nazwapliku,status = 'old')
		do 200 i=1,M
		read(20,*,end = 300),(tab(j,i),j=1,m)
200		continue
300 	continue
		do 500 i = 1,m
			do 600 j = 1,m
			if (i.gt.J) then
				pow(i-j)=pow(i-j) + tab(i,j)
			end if
			if (J.gt.I) then
				pon(j-i)=pon(j-i) + tab(i,j)
			end if
600		continue		
500		continue
		do 700 i = 1,m-1
			POW(I) = POW(I)/(m-I)
			PON(i) = PON(I)/(m-i)
700		CONTINUE
c 		drukowanie tabeli
C		do 400 i = 1,9
C		print*,(tab(j,i),j=1,9)
C400	continue
		print*,'pow (',(pow(i),',',i=1,m-1),')'
		print*,'pon (',(pon(i),',',i=1,m-1),')'
		end