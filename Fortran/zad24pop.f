c		Marcin Nasilowski
c		program znajdujacy 2 najwieksze i 2 najmniejsze elementy wektora
c		*****komentaze umieszczone przezemnie oznaczy³em 5 gwiazdkami 
		program wekor
		implicit none
		character nazwa*20
		integer n,i,j,k,m
C       Zmiennej "k" nigdzie nie jest uzywana w programie. Zmienna "n" rowniez
C       okaze sie zreszta niepotrzebna.
c		*****zmienna n jest bardzo potrzebna
c		*****zmienna k by³a wpisana automatycznie. przed pisaniem dluzszego programu deklaruje kilka zmiennych pomocniczych
c		*****slozacych miedzy innymi do obslugi petli do, tymi zmiennymi sa zazwyczaj zmienne i,j,k.
c		***** "K" jak widac jest zbedne
		parameter(m = 20)
		double precision  tab(m), tab2(m),pom,vmin,vmax,mini,maxi
c		*****double precision tab(m), tab2(m),pom,vmin,vmax,mini,maxi
		print*,'podaj nazwe pliku z wektorem'
		read*,nazwa
		n = m
c		***** linia ktorej brakowa³o w programie:)
		open(20,file = nazwa,status = 'old')
C       Przydalaby sie obsluga bledow otwarcia urzadzenia.
c		 
c		**********************************
		do 30 i=1,m
C		read(20,*,end = 444),tab(i)
c		*****petla wczytujaca elementy wektora w przypadku konca pliku konczy wczytywanie 
		read(20,*,end = 444) tab(i)
		tab2(i) = tab(i)
30  	continue
c		**********************************
		go to 445
444		continue
		n = i-1
c		*****powyzsza linia ma sluzyc do znalezienia ilosci elementow wektora do tej lini dostajemy siê jedynie 
c		*****jezeli jest mniej niz 20 elementow. nieprawidlowe dzialanie programu u Pana by³o spowodowane brakiem
c		*****wczeœniejszego nadania wartoœci zmiennej n. W przypadku gdy Pañski wektor mia³ d³ógoœæ przynajmniej 20 
c		*****program nie dzia³a prawid³owo.  		
C       Do czego powyzsza linia ma sluzyc?
C       I tu zaczyna sie historia zmiennej "n", dzieki ktorej program mocno
C       sie bronil przez prawidlowym dzialaniem.
445		continue
c		**********************************
			j = 1
40		continue
C       Nie za duzo przypadkiem tych continue?
c		*****Nie czemu mia³o by ich byc zadozo??
c		*****print *,'j ', j, tab2(j)
		if(tab2(j).LT.(tab2(j+1))) then
			pom = tab2(J+1)
			tab2(j+1) = tab2(j)
			tab2(j) = pom
			j = j-1
C			print *,'j- ', j, tab2(j)
		else
			j=j+1
C			print *,'j+ ', j, tab2(j)
		end if
		if (j.LT.n) then
C       Ja wiem, ze fragment ten zywcem zostal skopiowany z zad14.f, stad tez
C       wynika podmiana zmiennych.
c		*****if (j.LT.m) then
		go to 40
		end IF	
c		***********************************
		mini = tab2(n)
C       (zmienna "n")
c		*****mini = tab2(m)
		maxi = tab2(1)
c		***********************************
c		*****print *,'ble'
		If(mini.eq.maxi) then
			print*,'wszystke elementy wekora sa rowne:',mini
			stop
		end if
c		***********************************
		do 52 i = 1, n-1
C       (zmienna "n")
c		*****do 52 i = 1, m-1
		if (tab(i).NE.tab(i+1)) then
		end if	
52		continue
C       Powyzszy fragment programu co mial robic?
c		*****Nie mam pojecia wczesniej móg³ do czegoœ s³ó¿yæ ale z powodu nieczytelnosci kodu zapomnia³em go wykasowac
c		***********************************
		do 50 i = n,1,-1
C       (zmienna "n")
c		*****do 50 i = m,1,-1
		if (tab2(i).GT.mini) then
			vmin = tab2(i)
			goto 100
		end IF
50		continue
100		continue
c		***********************************
		do 51 i = 1,n
C       (zmienna "n")
c		*****do 51 i = 1,m
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
C       (zmienna "n")
c		*****do 55 i = 1,m
			if(tab(i).EQ.mini)then
			print*,i
			end if
55		continue
		print*,'wartosc vicemin wektora wynosi',vmin
		print*,'i znajduje sie na pozycjach:'
		do 56 i = 1,n
c        (zmienna "n")
c		*****do 56 i = 1,m
			if(tab(i).EQ.vmin)then
			print*,i
			end if
56		continue
		print*,'wartosc vicemax wektora wynosi',vmax
		print*,'i znajduje sie na pozycjach:'
		do 57 i = 1,n
C       (zmienna "n")
c		*****do 57 i = 1,m
			if(tab(i).EQ.vmax)then
			print*,i
			end if
57		continue
		print*,'wartosc maxymalna wektora wynosi',maxi
		print*,'i znajduje sie na pozycjach:'
		do 58 i = 1,n	
C       (zmienna "n")
c		*****do 58 i = 1,m
		if(tab(i).EQ.maxi)then
			print*,i
			end if
58		continue
		end

C       Program sie skompilowal, ale proba jego uruchomienia powodowala
C       naruszenie ochrony pamieci i zrzut pliku core. Okazalo sie, ze
C       wszystkiemu winna jest uzywana w programie - a zupelnie niepotrzebna -
C       - zmienna "n". To wlasnie "dzieki" niej program probowal sie odwolywac
C       do nieistniejacych elementow wektora, a tym samym do obszarow pamieci,
C       do ktorych odwolywac sie nie powinien. Dopiero usuniecie tej, wystepu-
C       jacej wielokrotnie w programie usterki sprawialo, ze program znajduje 
C       to, co trzeba.
C         Martwi to, ze program przed wyslaniem nie zostal przetestowany, zanim
C       zostal wyslany do sprawdzenia.
C
C       [1.5 pkt/5], choc czesc punktacji za pomysl posortowania wektora przed
C                    znajdywaniem wartosci minimalnych i maksymalnych.
c		*****Pomys³ posortowania tablicy przed szukaniem wartosci minimalnych i maksymalnych 
c		*****spowodowa³ pojawienie sie magicznej zmiennej "n" w przypadku gdy wektor znajduj¹cy siê w pliku
c		*****posiada³ mniej niz "m" elementow a my zak³adalismy ¿e w ostatnim elemencie wektora 
c		*****znajduje sie wartosc minimalna program nie mia³ prawa dzia³aæ prawid³owo
c		*****W programie nale¿a³o by poprawic wyœwietlanie pozycji wartosci minimalnych i maksymalnych
c		*****Przy czêstym powtarzniu sie wartosci max i min wyprowadzane informacje staj¹ sie nieczytalne
