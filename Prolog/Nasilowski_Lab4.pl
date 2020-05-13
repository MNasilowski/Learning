Laboratorium 4.

isList([]).
isList([_|Tail]) :- isList(Tail)

member(Head, [Head|_]).
member(X, [_|Tail]):-member(X, Tail).

concat([], L2, L2).
concat([Head|Tail], L2, [Head|L3]):-concat(Tail, L2, L3).

delete(Head, [Head|Tail], Tail).
delete(X, [Y|Tail], [Y|L1]):-delete(X, Tail, L1).

member(Head, [Head|_]).
member(X, [_|Tail]):-member(X, Tail).

concat([], L2, L2).
concat([Head|Tail], L2, [Head|L3]):-concat(Tail, L2, L3).

delete(Head, [Head|Tail], Tail).
delete(X, [Y|Tail], [Y|L1]):-delete(X, Tail, L1).

len([], zero).
len([_|Tail], s(X)):-len(Tail, X).

rlen([],zero). 
rlen([X|Tail],Y):- rlen(Tail,Y1),isList(X),rlen(X,Y2), add1(Y1,Y2,Y). 
rlen([X|Tail],Y):- rlen(Tail,Y1),\+isList(X),add1(Y1,s(zero),Y).

Zadania:
sum([], zero).
sum([Head|Tail], X):-sum(Tail, W), add1(W, Head, X).

avg(X, N):-sum(X, W), len(X, Z), quotient1(W, Z, N).

count(_, [], zero).
count(X, [X|Tail], s(N)):-count(X, Tail, N).
count(X, [Head|Tail], N):-X\=Head, count(X, Tail, N).

repeat([], _, _).
repeat([Head|Tail], L, N):-count(Head, L, N), repeat(Tail, L, N).

double(X, N):-repeat(X, N, s(s(zero))).

