node(a).
node(b).
node(c).
node(d).
edge(a,b).
edge(a,c).
edge(a,d).
edge(c,d).
node(X) :- edge(X,_).
node(X) :- edge(_,X).
travel_to(X,X,[]).
travel_to(X,Y,[Z|Cs]) :- edge(X,Z), travel_to(Z,Y,Cs).