mujer(monikalittow).                               
mujer(thelmazepeda).
mujer(palmiraquan).
mujer(nancyquan).

hombre(rufinoquan).
hombre(marcoquan).
hombre(raulquan).
hombre(gabrielquan).
hombre(andresquan).
hombre(carloslittowdangel).
hombre(carloslittowzepeda).
hombre(carlitoslittow).
hombre(christoferlittow).
hombre(adrianalvarez).
hombre(eduardoalvarez).
hombre(rolandoalvarez).

progenitor(monikalittow,andresquan).
progenitor(monikalittow,gabrielquan).
progenitor(thelmazepeda,monikalittow).
progenitor(thelmazepeda,carloslittowzepeda).
progenitor(nancyquan,adrianalvarez).
progenitor(nancyquan,eduardoalvarez).
progenitor(rufinoquan,raulquan).
progenitor(rufinoquan,marcoquan).
progenitor(rufinoquan,nancyquan).
progenitor(raulquan,gabrielquan).
progenitor(raulquan,andresquan).
progenitor(carloslittowdangel,carloslittowzepeda).
progenitor(carloslittowdangel,monikalittow).
progenitor(carloslittowzepeda,carlitoslittow).
progenitor(carloslittowzepeda,christoferlittow).
progenitor(rolandoalvarez,adrianalvarez).
progenitor(rolandoalvarez,eduardoalvarez).

% X es hijo si es hombre y si Y es el progenitor
hijo(X,Y) :- hombre(X), progenitor(Y,X), \+ (X = Y).

% X es hija si es mujer y si Y es el progenitor
hija(X,Y) :- mujer(X), progenitor(Y,X), \+ (X = Y).

% X es padre de Y si este es hombre y progenitor de Y
padre(X,Y) :- hombre(X), progenitor(X,Y), \+ (X = Y).

% X es madre de Y si este es mujer y progenitor de Y
madre(X,Y) :- mujer(X), progenitor(X,Y), \+ (X = Y).

% X es abuelo de Y si X es padre de Z y Z es padre de Y
abuelo(X,Y) :- padre(X,Z), padre(Z,Y), \+ (X = Y).

% X es abuela de Y si X es madre de Z y Z es madre de Y
abuela(X,Y) :- madre(X,Z), madre(Z,Y), \+ (X = Y).

% X es hermano de Y si X es hombre y comparten a Z como progenitor
hermano(X,Y) :- hombre(X), progenitor(Z,X), progenitor(Z,Y), \+ (X = Y).

% X es hermana de Y si X es mujer y comparten a Z como progenitor
hermana(X,Y) :- mujer(X), progenitor(Z,X), progenitor(Z,Y), \+ (X = Y).

% X es tio de Y si X es hombre y Z es su progenitor, y Z es el abuelo o abuela de Y, pero X no es el padre de X
tio(X,Y) :- hombre(X), progenitor(Z,X), (abuelo(Z,Y) ; abuela(Z,Y)), \+ (padre(X,Y)), \+ (X = Y).

% X es tia de Y si X es mujer y Z es su progenitor, y Z es el abuelo o abuela de Y, pero X no es la madre de Y
tia(X,Y) :- mujer(X), progenitor(Z,X), (abuelo(Z,Y) ; abuela(Z,Y)), \+ (madre(X,Y)), \+ (X = Y).

% X es el sobrino de Y si el progenitor de X es el tio de Y y X es hombre
primo(X,Y) :- hombre(X), progenitor(Z,X), (tio(Z,Y) ; tia(Z,Y)), \+ (X = Y).

% X es la sobrina de Y si el progenitor de X es el tio o tia de Y y X es mujer
prima(X,Y) :- mujer(X), progenitor(Z,X), (tio(Z,Y) ; tia(Z,Y)), \+ (X = Y).

% X es sobrino de Y si X es hombre, y el progenitor de X es el hermano o la hermana de Y
sobrino(X,Y) :- hombre(X), progenitor(Z,X), ((hermano(Z,Y) ; hermana(Z,Y)) ; (casado(Y,W), ((hermano(Z,W) ; hermana(Z,W))))), \+ (X = Y).

% X es sobrina de Y si X es mujer, y el progenitor de X es el hermano o la hermana de Y
sobrina(X,Y) :- mujer(X), progenitor(Z,X), ((hermano(Z,Y) ; hermana(Z,Y)) ; (casado(Y,W), ((hermano(Z,W) ; hermana(Z,W))))), \+ (X = Y).

% X está casado a Y si ambos son progenitores de Z
casado(X,Y) :- progenitor(X,Z), progenitor(Y,Z).