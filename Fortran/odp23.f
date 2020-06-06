		program najwiekszywspolnydzielnik
		implicit none
		integer liczbapierwsza, liczbadruga, liczbawieksza, liczbamniejsza, i, j
C       W tym miejscu przydalby sie komunikat, czego program chce od
C       uzytkownika.
		read *,liczbapierwsza, liczbadruga
		If (liczbapierwsza.GT.liczbadruga) then
			liczbawieksza   = liczbapierwsza
			liczbamniejsza  = liczbadruga 
		else
		  	liczbawieksza  = liczbadruga 
			liczbamniejsza = liczbapierwsza
		End IF
10		continue
		j = mod(liczbawieksza,liczbamniejsza)
		liczbawieksza = liczbamniejsza
		i = liczbamniejsza
		liczbamniejsza = j
		print*,j
		If (j.NE.0) then 
			goto 10
		end IF
		print *,'NWD = ',i
		end

C       Program poprawnie znajduje najwiekszy wspolny dzielnik.
C
C       [4.5 pkt/5]
