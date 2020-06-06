c	Marcin Nasilowski
c	program sortujacy tabele
	program sortowanietaeli
	implicit none
	integer n ,m,j,i
	parameter (n = 20, m =2)
	real tab(n),pom
	call srand (m)
	do 10 i = 1,n
	tab (i) = rand(0) 
10	continue
	j = 1
20	continue
C       to continue nie jest konieczne.
	if(tab(j).LT.(tab(j+1))) then
	pom = tab(J+1)
	tab(j+1) = tab(j)
	tab(j) = pom
	print *,j, tab(j)
	j = j-1
	else
	j=j+1
	end if
	if (j.LT.n) then
	go to 20
	end IF	
	print*,tab
	end

C       Bardzo zwarty program. Choc jesli mialby byc on dluzszy, przydaloby
C       sie w nim troche "powietrza", a i wciecia w "do" i "if" bylyby mile
C       widziane. To czego jeszcze sie w nim niedopatrzylem, to wspomnianej
C       w tresci zadania procedury inicjujacej wektor wykorzystujacej 
C       SRAND/RAND - w powyzszym programie wszystko dzieje sie w jednym
C       segmencie.
C
C       [4.0 pkt/5]
