		program tablica2D
		implicit none
		integer NR,NC,I,J
		parameter (NR=4,NC=2)
		Real tab(NR,NC),suma,srednia
		read *,((tab(I,J),J=1,NC),I=1,NR)
C       Brakuje komunikatu, chociazby takiego, ze program chce jakiejkolwiek
C       dane. Nie mowiac o tym, ze przydalaby sie informacja o tym, lie jest
C       wierszy, a ile kolumn. Nie zaszkodziloby tez napisac, jak bedzie
C       zapelniana tablica, czy wierszami, czy kolumnami.
C		DO 1 i=1,NR
C			do 2 j = 1 ,NC
C			TAB(I,j) = 0
C2			continue
C1		continue
C       Dlaczego???
C       Czemu uzytkownik ma sie najpierw nawstukiwac liczb, a potem jego praca
C       idzie w kable, bo program pracowicie zeruje elementy tablicy?
		DO 10 i=1,NR
		suma = 0
			do 20 j = 1 ,NC
			suma = suma + Tab(I,J)
20			continue
		srednia = suma/NC
		print*,'srednia w',i,'-tym wierszu wynosi',srednia
10		continue
		DO 30 i=1,NC
		suma = 0
			do 40 j = 1 ,NR
			suma = suma + Tab(J,I)
40			continue
		srednia = suma/NR
		print*,'srednia w',i,'-tej kolumnie wynosi',srednia
30		continue
		END

C       Gdyby nie feralny fragment z zerowaniem tablicy, program poprawnie
C       liczylby srednie. A tak - generowal stado zer. Przeciez to wychodzi
C       podczas pierwszego uruchomienia programu! Niestety pokazuje to, ze
C       program nie byl w ogole testowany.
C
C       [3.0 pkt/5] za nieuruchomiony program.
