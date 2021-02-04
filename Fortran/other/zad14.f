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
	if(tab(j).LT.(tab(j+1))) then
	pom = tab(J+1)
	tab(j+1) = tab(j)
	tab(j) = pom
	j = j-1
	else
	j=j+1
	end if
	if (j.LT.n) then
	go to 20
	end IF	
	print*,tab
	end