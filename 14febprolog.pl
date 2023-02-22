male(cronos).
male(zeus).
male(poseidon).
male(hades).
male(apollo).
male(ares).
male(hermes).
male(hercules).
male(perseus).
male(theseus).

female(gaia).
female(demeter).
female(athena).
female(hera).
female(hestia).
female(artemis).
female(aphrodite).
female(helen).
female(rhea).


husband_of(cronos, rhea).
husband_of(zeus, hera).
husband_of(hades, hestia). 
wife_of(hera, zeus).

mother_of(gaia,cronos).
mother_of(rhea,zeus).
mother_of(rhea,poseidon).
mother_of(rhea,hades).

father_of(zeus, hercules).
father_of(zeus, hermes ).
father_of(zeus, ares).
father_of(zeus, athena).
father_of(zeus, apollo).


wife_of(X,Y) :- husband_of(Y,X).
married_to(X,Y) :- husband_of(X,Y).
married_to(X,Y) :- wife_of(X,Y).


parent_of(X,Y) :- mother_of(X,Y).
parent_of(X,Y) :- father_of(X,Y).

grandparent_of(X,Y) :- parent_of(X,B), parent_of(B,Y).

grandfather_of(X,Y) :- grandparent_of(X,Y), male(X).
grandmother_of(X,Y) :- grandparent_of(X,Y), female(X).

sibling_of(C,D) :- mother_of(X,C), mother_of(X,D), D\=C.
sibling_of(C,D) :- father_of(X,C), father_of(X,D), C\=D.

brother_of(X,Y) :- sibling_of(X,Y), male(X).
sister_of(X,Y) :- sibling_of(X,Y), female(X).

aunt_of(X,Y) :- parent_of(A,Y), sibling_of(A, X), female(X).
uncle_of(X,Y) :- parent_of(A,Y), sibling_of(A, X), male(X).

