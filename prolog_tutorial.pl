maxodd([],0).
maxodd([X],X).
maxodd([X,Y|Xs], Res) :-
	maxodd(Xs, Res1),
	Res is max(X,Res1).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


deleteNList(N,List,Res) :- deleteNList(N,List,Res,N).
deleteNList(_,[],[],_).
deleteNList(N,[_|Tail],TempRes,1) :-
	deleteNList(N,Tail,TempRes,N).
deleteNList(N,[Head|Tail],[Head|TempRes],K) :-
	K > 1,
	K1 is K - 1,
	deleteNList(N,Tail,TempRes,K1).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


replace_first([],X, Y, []).
replace_first([H|T], X, Y, [ResHead|T]) :-
	X == H,
	ResHead is Y.
replace_first([H|T], X, Y, [H|ResTail]) :-
	X \== H,
	replace_first(T, X, Y, ResTail).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


position(X, L, Res) :- position(X, L, 1, Res).
position(X, [], Y, []).
position( X, [X|T],Y, [Y|ResTail]) :-
    Y1 is Y+1,
    position( X, T, Y1, ResTail).
position(X, [H|T], Y, Res) :-
    Y1 is Y+1,
    position(X, T, Y1, Res).

