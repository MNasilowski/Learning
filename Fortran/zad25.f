		integer function liczwyr(record)
		character record*(*)
		character znak*1
		integer i,pom,k
		k = len(record)
		pom = 0
		liczwyr = 0
			do 44 i=1,k
			znak = record(i:i)
				if (znak.ne.''.and.pom.eq.0) then
				liczwyr = liczwyr+1
				pom = 1
				end if
		
				if (znak.eq.'') then
				pom = 0
				end if
44			continue
		end
		
c		*************************

		program wc1
		implicit none
		character nazwapliku*20
		character wiersz*80
		integer Blad,liczwyr,iloscwyr
		iloscwyr = 0
		
		print*,'podaj nazwe pliku z danymi'
		read*,nazwapliku
		open(unit = 34,File = nazwapliku,status='old',err =22,Iostat = Blad)

55			continue
			read(34,'(A80)',end = 300),wiersz
			iloscwyr = iloscwyr + liczwyr(wiersz)	
			go to 55
			
300		continue
		iloscwyr = iloscwyr + liczwyr(wiersz)
		print*,'ilosc wyrazow w pliku wynosi :',iloscwyr
		stop
22		continue
		print*,'blad nr',blad
		end


		
		
		