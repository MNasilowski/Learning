		program saper
		implicit none
		integer wymiar,m,x,y
		parameter (wymiar = 10,m = 2)
		integer Tab(0:wymiar+1,0:wymiar+1)
		do 10 i = 1 , wymiar
			x = rand(0)*10
		call srand (m)
		