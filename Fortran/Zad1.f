		program tablica
		implicit none
		real wartoscktorawczytujezklawiatury,ilosc,iloscujm,iloscdod,srdndod,srdnujm,mindod,minujm,maxdod,maxujm, i
		iloscujm=0
		iloscdod=0
		srdnujm=0
		srdndod=0
		read *,wartoscktorawczytujezklawiatury
10		continue
		if(wartoscktorawczytujezklawiatury.LT.0) then
			if(iloscujm.eq.0) then
			minujm = wartoscktorawczytujezklawiatury
			maxujm = wartoscktorawczytujezklawiatury
			end if
			iloscujm = iloscujm + 1
			srdnujm = srdnujm + wartoscktorawczytujezklawiatury
			IF(wartoscktorawczytujezklawiatury.LT.minujm) then
				minujm = wartoscktorawczytujezklawiatury
			end IF
			IF(wartoscktorawczytujezklawiatury.GT.maxujm) then
				maxujm = wartoscktorawczytujezklawiatury
			END IF
		end IF
c		**wartosci dodatnie**
		if(wartoscktorawczytujezklawiatury.GE.0) then
			if(iloscdod.eq.0) then
			mindod = wartoscktorawczytujezklawiatury
			maxdod = wartoscktorawczytujezklawiatury
			end if
			iloscdod = iloscdod + 1
			srdndod = srdndod + wartoscktorawczytujezklawiatury
			IF(wartoscktorawczytujezklawiatury.LT.mindod) then
				mindod = wartoscktorawczytujezklawiatury
			end IF
			IF(wartoscktorawczytujezklawiatury.GT.maxdod) then
				maxdod = wartoscktorawczytujezklawiatury
			END IF
		end IF
		read (*,*,END = 300)wartoscktorawczytujezklawiatury
		goto 10
300		continue		
		srdndod = srdndod/iloscdod
		srdnujm = srdnujm/iloscujm
		print*,'srednia artmetyczna wartosci ujemnych',srdnujm
		print*,'srednia artmetyczna wartosci dodatnich',srdndod
		print*,'max wartosc dodatnia',maxdod
		print*,'max wartosc ujemna',maxujm
		print*,'min warosc ujemna',minujm
		print*,'min wartosc dodatnia',mindod
		end