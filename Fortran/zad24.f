c		Marcin Nasilowski
c		program znajdujacy 2 najwieksze i 2 najmniejsze elementy wektora
		program wekor
		implicit none
		character nazwa*20
		integer n,i,j,k,m
		parameter(m = 20)
		double precision  tab(m), tab2(m),pom,vmin,vmax,mini,maxi
		print*,'podaj nazwe pliku z wektorem'
		read*,nazwa
		open(20,file = nazwa,status = 'old')
c		**********************************
		do 30 i=1,m
		read(20,*,end = 444),tab(i)
		tab2(i) = tab(i)
30  	continue
c		**********************************
		go to 445
444		continue
		n = i-1
445		continue
c		**********************************
			j = 1
40		continue
		if(tab2(j).LT.(tab2(j+1))) then
			pom = tab2(J+1)
			tab2(j+1) = tab2(j)
			tab2(j) = pom
			j = j-1
		else
			j=j+1
		end if
		if (j.LT.n) then
		go to 40
		end IF	
c		***********************************
		mini = tab2(n)
		maxi = tab2(1)
c		***********************************
		If(mini.eq.maxi) then
			print*,'wszystke elementy wekora sa rowne:',mini
			stop
		end if
c		***********************************
		do 52 i = 1, n-1
		if (tab(i).NE.tab(i+1)) then
		end if	
52		continue
c		***********************************
		do 50 i = n,1,-1
		if (tab2(i).GT.mini) then
			vmin = tab2(i)
			goto 100
		end IF
50		continue
100		continue
c		***********************************
		do 51 i = 1,n
		if (tab2(i).lT.maxi) then
			vmax = tab2(i)
			goto 101
		end IF
51		continue
101		continue
c		***********************************
		close(20)
c		print*,tab
c		print*,tab2
		print*,'wartosc minimalna wektora wynosi',mini
		print*,'i znajduje sie na pozycjach:'
		do 55 i = 1,n
			if(tab(i).EQ.mini)then
			print*,i
			end if
55		continue
		print*,'wartosc vicemin wektora wynosi',vmin
		print*,'i znajduje sie na pozycjach:'
		do 56 i = 1,n
			if(tab(i).EQ.vmin)then
			print*,i
			end if
56		continue
		print*,'wartosc vicemax wektora wynosi',vmax
		print*,'i znajduje sie na pozycjach:'
		do 57 i = 1,n
			if(tab(i).EQ.vmax)then
			print*,i
			end if
57		continue
		print*,'wartosc maxymalna wektora wynosi',maxi
		print*,'i znajduje sie na pozycjach:'
		do 58 i = 1,n
			if(tab(i).EQ.maxi)then
			print*,i
			end if
58		continue
		end