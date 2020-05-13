%Laboratorium 5.
%Zad 1
didbetter(X,Y,order(X,Y,_)).
didbetter(X,Y,order(X,_,Y)).
didbetter(X,Y,order(_,X,Y)).

clue1(S) :- didbetter(child(peter,_), child(_, red), S).
clue2(S) :- didbetter(child(jack,gold),child(_, green), S).


%Zad 2 

onstreet(X, s(X,_,_,_,_)).
onstreet(X, s(_,X,_,_,_)).
onstreet(X, s(_,_,X,_,_)).
onstreet(X, s(_,_,_,X,_)).
onstreet(X, s(_,_,_,_,X)).

onleft(X,Y, s(X,Y,_,_,_)).
onleft(X,Y, s(_,X,Y,_,_)).
onleft(X,Y, s(_,_,X,Y,_)).
onleft(X,Y, s(_,_,_,X,Y)).

middle(X, s(_,_,X,_,_)).

first(X, s(X,_,_,_,_)).

nextto(X,Y,S):-onleft(X,Y,S).
nextto(Y,X,S):-onleft(X,Y,S).


clue(S):-
	onstreet(house(red,englishman,_,_,_),S),
	onstreet(house(_,spaniard,_,dog,_),S),
	onstreet(house(green,_,coffe,_,_),S),
	onstreet(house(_,ukrainian,tea,_,_),S),
	onleft(house(green,_,_,_,_),house(ivory,_,_,_,_),S),
	onstreet(house(_,_,_,snail,tennis),S),
	onstreet(house(yellow,_,_,_,chess),S),
	middle(house(_,_,milk,_,_),S),
	first(house(_,norwegian,_,_,_),S),
	nextto(house(_,_,_,_,rugby),house(_,_,_,fox,_),S),
	nextto(house(_,_,_,_,chess),house(_,_,_,horse,_),S),
	onstreet(house(_,_,orangejuice,_,volleyball),S),
	onstreet(house(_,japanese,_,_,go),S),
	nextto(house(_,norwegian,_,_,_),house(blue,_,_,_,_),S),
	nextto(house(_,_,tea,_,_),house(_,_,milo,_,_),S),
    	onstreet(house(_, _, _,zebra, _), S).