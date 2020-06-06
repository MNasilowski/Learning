c		Marcin Nasi³owski
c		Zbiór procedur do operacji na macierzach
c		*******************Lista procedur**************************************
c		divM(A,B,C,wym)	mno¿y macierze typu DP A(wym,wym)*B(wym,wym)=C(wym,wym) 
c						wym    typu int
c		rownM(A,X,Y,wym)rozwi¹zuje uk³ad rownan A(wym,wym)*X(wym) = Y(wym)
c						A,X,Y  typu DP
c						wym	   typu int
c		printM(M,wym)	wyswietla macierz M(wym,wym)
c						M	   typu DP
c						wym	   typu int
c		LU(A,L,U,wym)	rozklad LU macierzy A(wym,wym)
c						A,L,U  typu DP
c						wym	   typu int	
c		odwM(A,B,wym)	znajduje macierz B(wym,wym) odwrotna do A(wym,wym)
c						A,B    typu DP
c						wym	   typu int
c		***********************lista Funkcji***********************************
c		dimM(A,wym)		znajduje wyznacznik macierzy A(wym,wym)
c						A,dimM typu DP
c						wym    typu int
c		***********************************************************************


							
c		**************************MNOZENIE MACIERZY****************************
		subroutine divM(A,B,C,wym)
		implicit none
		integer wym,i,j,k
		double precision A(wym,wym),B(wym,wym),C(wym,wym)
		do 110 j = 1,wym
			do 111 i =1,wym
				C(j,i) = 0
				do 112 k = 1,wym
					C(j,i) = C(j,i) + A(j,k)*B(k,i)
112				continue
111 		continue
110 	continue				
		continue
		end
c		***********************************************************************		

c		*******************ZEROWANIE WEKTORA***********************************
		subroutine zerW(X,wym)
		integer wym, i
		double precision X(wym)
		do 401 i = 1,wym
			X(i) = 0
401		continue
		end 		
c		***********************************************************************




c		***********************Uklad Rownan A*X = Y ***************************
c		******A dowolna macierz X wektor szukany Y dany wektor		
		subroutine rownM(A,X,Y,wym)
		implicit none
		integer wym, i,j
		double precision A(wym,wym), X(wym), Y(wym), L(wym,wym), U(wym,wym)
		double precision suma, Z(wym)
		call zerW(Z,wym)
c		rozkladamy macierz na A na LU
		call LU(A,L,U,wym)
c		rozwiazujemy uklad L*Z = Y
		do 210 i = 1,wym
			suma = 0
			do 211 j = 1, i-1
			suma = suma + Z(j)*L(i,j)
211		continue			
			Z(i) = Y(i) - suma
210		continue
c		rozwiazujemy uklad U*X = Z
		do 212 i = wym,1,-1
			suma = 0
			do 213 j = i+1,wym
			suma = suma + X(j)*U(i,j)
213		continue		
			X(i) = (Z(i) - suma)/U(i,i)
			
212		continue
		end
c		***********************************************************************





c		************************Drukowanie Macierzy****************************
		Subroutine printM(L,wym)
		integer wym,i,j
		double precision L(wym,wym)
		character*12 txt
c		do 302 i = 1,wym
c		print*,(L(i,j),j=1,wym)
c302		continue		
		
		txt = '('//CHAR(ichar("0") + wym)// '(F8.3,A1))'
		do 301 i = 1,wym
			Write(*,txt),(L(i,j)," ",j=1,wym)
301		continue
		end
c		***********************************************************************





c		**************************ROZKLAD LU***********************************
		subroutine LU(A,L,R,wym)
		implicit none
		integer wym,i,j,k
		double precision L(wym,wym),R(wym,wym), A(wym,wym)
		double precision suma
c		*****NADAWANIE WARTOSCI OCZYWISTYCH
		do	201 i=1,wym
			do 202 j=1,wym
			L(i,j) = 0
			R(i,j) = 0
202			continue
		L(i,i) = 1
201		continue
c		*****NADAWANIE WARTOSCI MNIEJ OCZYWISTYCH
		DO 203 i=1,wym
c		*****PIERWEJ MACIERZ R
			do 204 j=i,wym
				suma = 0
				do 205 k=1,i-1
				suma = suma + L(i,k)*R(k,j)
205				continue
			R(i,j) = A(i,j) - suma
204		continue
c		*****TERAZ MACIERZ L
			do 206 j=i+1,wym
				suma = 0
				do 207 k=1,i-1
				suma = suma + L(j,k)*R(k,i)
207				continue
			L(j,i) = 1/R(i,i) *(A(j,i) - suma)
206		continue
203		continue
		end
c		***********************************************************************



c		********************A DO MINUS PIERWSZEJ*******************************
		SUBROUTINE odwM(A,B,wym)
		implicit none
		integer wym, i,j
		double precision A(wym,wym), B(wym,wym), IV(wym),BV(wym),dimM,d
c		*****
		d = dimM(A,wym)
		do 403 i=1,wym
			do 404 j=1,wym
				IV(j) = 0
404			continue
			IV(i) = 1
			call rownM(A,BV,IV,wym)
			do 405 j=1,wym
				B(j,i) = BV(j)
405			continue
403		continue
		end		
c		***********************************************************************


c		***************************WYZNACZNIK MACIERZY*************************
		double precision Function dimM(A,wym)
		implicit none
		integer wym, i
		double precision A(wym,wym),L(wym,wym),U(wym,wym)
		dimM = 1
		call LU(A,L,U,wym)
		do 501 i = 1,wym
			dimM = dimM*U(i,i)
501		continue
		end