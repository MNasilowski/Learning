%Laboratorium 2:

parent(pam,bob).
parent(tom,bob).
parent(tom,liz).
parent(bob,ann).
parent(bob,pat).
parent(joe,jim).
parent(pat,jim).

female(pam).
female(ann).
female(pat).
female(liz).
male(tom).
male(bob).
male(joe).
male(jim).

child(X,Y) :- parent(Y,X).
mother(X,Y) :- parent(X,Y), female(X).
father(X,Y) :- parent(X,Y), male(X).
grandparent(X,Y) :- parent(X,Z), parent(Z,Y).
greatgreatgrandparent(X,Y) :- parent(X,X1), parent(X1,X2), parent(X2,Y).

ancestor(X,Z):- parent(X,Z).
ancestor(X,Z):- parent(X,Y), ancestor(Y,Z).

%Zad 2 
edge(p(1,1),p(2,2)).
edge(p(1,2),p(2,2)).
edge(p(2,2),p(2,3)).
edge(p(2,3),p(3,3)).
edge(p(2,2),p(3,1)).
edge(p(3,1),p(2,1)).
%edge(p(2,1),p(1,1)).

%Ostatni edge zapętla graf

connection(X,Z):- edge(X,Z).
connection(X,Z):- edge(X,Y), connection(Y,Z).
