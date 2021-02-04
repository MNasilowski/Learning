		program badajacywielomian
		implicit none
		integer wspolczynniki(10)
		complex miejscazerowe(10),fx(10),punkt1, punkt2
		double precision epsilon
		epsilon = 0.00001
		punkt1 = (1,1)
101		continue
		
		if(ABS(punkt1-punkt2).LT.epsilon)then 
		goto 101 
		end if
		print*,ABS(punkt1-punkt2)
		end