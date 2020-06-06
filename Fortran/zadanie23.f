		program najwiekszywspolnydzielnik
		implicit none
		integer liczbapierwsza, liczbadruga, liczbawieksza, liczbamniejsza, i, j
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