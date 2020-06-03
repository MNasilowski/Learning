c		Marcin Nasi³owski
c		Zadanie 4 seria 3
c		funkcja zamieniajaca iczby w przedziale  0 - 20 z charcter na integer
		integer function zlnz(zmienna)
		character zmienna*2	
c		print*,zmienna	
c		zlnz = 21
		if (zmienna.eq.'0') then
			zlnz = 0
		end if
			if (zmienna.eq.'1') then
			zlnz = 1
		end if
			if (zmienna.eq.'2') then
			zlnz = 2
		end if
		if (zmienna.eq.'3') then
			zlnz = 3
		end if
			if (zmienna.eq.'4') then
			zlnz = 4
		end if
			if (zmienna.eq.'5') then
			zlnz = 5
		end if
			if (zmienna.eq.'6') then
			zlnz = 6
		end if
			if (zmienna.eq.'7') then
			zlnz = 7
		end if
			if (zmienna.eq.'8') then
			zlnz = 8
		end if
		if (zmienna.eq.'9') then
			zlnz = 9
		end if
		if (zmienna.eq.'10') then
			zlnz = 10
		end if
			if (zmienna.eq.'11') then
			zlnz = 11
		end if
			if (zmienna.eq.'12') then
			zlnz = 12
		end if
		if (zmienna.eq.'13') then
			zlnz = 13
		end if
			if (zmienna.eq.'14') then
			zlnz = 14
		end if
			if (zmienna.eq.'15') then
			zlnz = 15
		end if
			if (zmienna.eq.'16') then
			zlnz = 16
		end if
			if (zmienna.eq.'17') then
			zlnz = 17
		end if
			if (zmienna.eq.'18') then
			zlnz = 18
		end if
		if (zmienna.eq.'19') then
			zlnz = 19
		end if	
		if (zmienna.eq.'20') then
			zlnz = 20
		end if	
		end
c		*******************************************************	
c		poczatek glownego programu
c		*******************************************************
		Program wczytujacydane
		implicit none
		integer k,i,ilosc,o,n,mini,maxi,minw,maxw,suma,sumaw,wiersz,iloscliczb,iargc,x,zlnz
c		k - zmienna do ktorej wczytyuje informacje z pliku
c		i - zmienna pomocnicza
c		ilosc - ilosc liczb w wierszu
c		n - cyfra dziesietna numeru znaku od ktorego zaczynamy wczytywanie
c		n - jak wyzej cyfra jednosci
c		mini maxi - zmienne w ktorych sa przechowywane maxymalne i minimalne wartosci
c		minw maxw - jak wyzej ale w wierszu
c		suma - suma elementow w pliku
c		sumaw - suma elementow w wierszu
c 		wiersz - numer badanego wiersza
		real srednia
		character for*20,ilos*2,M*2,nazwapliku*15,iloscch*2
		x = iargc()
		if (x.EQ.0)then
			print *,'podaj nazwe pliku z danymi'
			read*,nazwapliku
			print*,'podaj ilosæ liczb 4-ro cyfrowych w wierszu'
			read*,ilosc
		end if
		if (x.EQ.1) then
			call getarg(1,iloscch)
			ilosc = zlnz(iloscch)
			print*,'podaj ilosæ liczb 4-ro cyfrowych w wierszu'
			read*,nazwapliku
		end If
		if (x.EQ.2) then
			call getarg(1,iloscch)
			ilosc = zlnz(iloscch)
			call getarg(2,nazwapliku)		
		end If
		If(ilosc.eq.0) then
			stop
		end If
		open(Unit = 20,File = nazwapliku,status = 'old')
c	nadawanie wartosci poczatkowy'ch
c		read *,ilosc
		read (20,'(I4)'),k
		mini = k
		maxi = k
		BACKSPACE (20)
		wiersz = 0
		sumaw = 0 
		suma = 0
		iloscliczb = 0
c	badanie calego pliku
222		continue
		wiersz = wiersz +1
		minw = 0
		maxw = 10000
		sumaw = 0
c	badanie wiersza
		do 111 i=0,ilosc-1
		iloscliczb = iloscliczb +1	
		n = ICHAR('0') +(i*4)/10 
		o = ICHAR('0') +MOD((i*4),10)
		ilos = CHAR(N)
		m = char(o)
c		print*,ilos,m,n,o
		for = '('//ilos//m//'X,I4)'
		read(20,for,end = 200),k	
		goto 400
200     continue
		if (i.eq.0) then
			go to 300
		end if
400		continue
c	sumowanie liczb
		suma = suma + k
c	wyszukiwanie maximum
			if (k.GT.maxi) then
				maxi = k
			end if
c	wyszukiwanie minimum
			if (K.LT.mini) then
				mini = k
			end if
c	sumowanie liczb w wierszu
		sumaw = sumaw+k
c	wyszukiwanie maximum w wierszu
			if (k.lt.maxw) then
				maxw = k
			end if
c	syszukiwanie minimum w wierszu
			if (k.GT.minw) then
				minw = k
			end if
c		print*,k
		if ((ilosc-1).NE.i) then
		BACKSPACE (20)
		end if
111		continue
c		liczenie sredniej w wierszu
c		srednia = (sumaw*1.0)/ilosc	
c		wyswietlanie informacji o wierszu
c		print*,'srednia artmetyczna elementow w ',wiersz,'wierszu =',srednia
c		print*,'minimalna wartosc w ',wiersz,'wierszu = ',minw
c		print*,'maxymalna wartosc w ',wiersz,'wierszu = ',maxw
		go to 222
300		continue
		srednia = (suma*1.0)/(iloscliczb-1)
c		print*,iloscliczb
		print*,'srednia artmetyczna elementow  =',srednia
		print*,'minimalna wartosc  = ',mini
		print*,'maxymalna wartosc  = ',maxi
		end 