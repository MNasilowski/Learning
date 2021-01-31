%Laboratorium 3.

isnumber(zero).
isnumber(s(X)) :- isnumber(X).

isequal(X,X) :- isnumber(X).
isequal(s(X),s(Y)):- isequal(X,Y).

lessthanequal(zero, X) :- isnumber(X).
lessthanequal(s(X), s(Y)):- lessthanequal(X,Y).

add1(zero, X, X):- isnumber(X).
add1(s(X), Y, s(Z)) :- add1(X,Y,Z).

%Zadania:
odd1(s(zero)).
odd1(s(s(X))) :- odd1(X).

even1(zero).
even1(s(s(X))):-even1(X).

times1(zero,X,zero):- isnumber(X).
times1(s(X), Y, Z) :- times1(X,Y,Q), add1(Y,Q,Z).

%quotient(X, Y, Z):-times(Z, Y, X).

%remainder(X, X, zero):-isnumber(X).
%remainder(zero, X, zero):-isnumber(X).
%remainder(s(X), Y, s(Z)):-remainder(X, Y, Z).

quotient(X,X,s(zero)).
quotient(X,Y,Z):-lessthanequal(Z,X),times1(Y,Z,W1),times1(Y,s(Z),W2),lessthanequal(W1,X),lessthanequal(X,W2).

remainder(X, X, zero).
remainder(_, s(zero), zero).
remainder(X, Y, Z):-quotient(X,Y,W),times1(Y,W,W2),add1(W2,Z,X).


fact1(zero, s(zero)).
fact1(s(X),Z) :- fact1(X,Y), times1(Y,s(X),Z).

fibonaci(zero,zero).
fibonaci(s(zero),s(zero)).
fibonaci(s(s(X)),Y) :- fibonaci(s(X),Y1), fibonaci(X,Y2),add1(Y1,Y2,Y).

shownum1(zero,0).
shownum1(s(X), M) :- shownum1(X,N), M is N + 1.

timesnum(X,Y,Z) :- shownum(XS,X),shownum(YS,Y),times1(XS,YS,ZS),shownum(ZS,Z).
