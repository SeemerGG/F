append([],X,X).
append([H|T],X,[H|T1]):-append(T,X,T1).

read_list(List,N):-read_list(List,N,[],0),!.
read_list(List,N,List,N):-!.
read_list(List,N,NewList,I):-NewI is I+1,read(X),append(NewList,[X],NewNewList),read_list(List,N,NewNewList,NewI).

write_list([]):-!.
write_list([H|T]):-write(H),write(' '),write_list(T).

%Задание 11
create_index_list_zad11(List,Answer):-create_index_list_zad11(List,[],0,Answer).
create_index_list_zad11([H|[]],ListIndex,_,ListIndex):-!.
create_index_list_zad11([H1,H2|T],ListIndex,I,Answer):-NewI is I+1,(H2 < H1 -> append(ListIndex,[NewI],NewListIndex),create_index_list_zad11([H2|T],NewListIndex,NewI,Answer);
	create_index_list_zad11([H2|T],ListIndex,NewI,Answer)).

lenght_list([],0).
lenght_list([_|T],X):-lenght_list(T,X1),X is X1+1,!.

zad11(N):-read_list(List,N),create_index_list_zad11(List,IndexList),lenght_list(IndexList,X),write(X),nl,write_list(IndexList).

%Задание 12

symmetric_difference(List1,List2,Answer):-symmetric_difference(List1,List2,NewList,[]),symmetric_difference(List2,List1,Answer,NewList).
symmetric_difference([],List2,Answer,Answer):-!.
symmetric_difference([H|T],List2,Answer,NewList):-srav(H,List2) -> append(NewList,[H],NewNewList),symmetric_difference(T,List2,Answer,NewNewList);symmetric_difference(T,List2,Answer,NewList).

srav(N,[]).
srav(N,[H|T]):-N =:= H -> fail,!;srav(N,T).

zad12(N,M):-read_list(List1,N),read_list(List2,M),symmetric_difference(List1,List2,Answer),write_list(Answer).

%Задание 13

count_sort(List,Answer):-list_count(List,CountList),count_sort(CountList,[],Answer).
count_sort([],TList,TList):-!.
count_sort(List,TList,Answer):-max_count(List,[X,Y]),del_el([X,Y],List,NewList),build_list_to_count(X,Y,NewTList,TList),count_sort(NewList,NewTList,Answer).

max([X1,X],[Y1,Y],[X1,X]):-X>=Y,!.
max(_,Y,Y).

max_count([X],X):-!.
max_count([[H1,H2]|T],R):-max_count(T,R1),max([H1,H2],R1,R).

del_el(_,[],[]).
del_el(X,[X|T],T):-!.
del_el(X,[Y|T],[Y|L]):-del_el(X,T,L).

build_list_to_count(El,Count,List):-build_list_to_count(El,Count,List,[]).
build_list_to_count(_,0,List,List):-!.
build_list_to_count(El,Count,List,TList):-NewCount is Count-1,append(TList,[El],NewTList),build_list_to_count(El,NewCount,List,NewTList).

list_count(List,Answer):-list_count(List,[],Answer,List).
list_count([],NewList,NewList,_):-!.
list_count([H|T],NewList,Answer,List):-prov_on_presence(H,T) -> count(H,List,X),list_count(T,[[H,X]|NewList],Answer,List);list_count(T,NewList,Answer,List).

count(N,List,X):-count(N,0,List,X).
count(_,TN,[],TN):-!.
count(N,TN,[H|T],X):-N =:= H -> NewTN is TN+1,count(N,NewTN,T,X);count(N,TN,T,X).

prov_on_presence(_,[]):-!.
prov_on_presence(N,[H1|T]):-N =:= H1 -> fail,!;prov_on_presence(N,T).

zad13(N):-read_list(List,N),count_sort(List,NewList),write_list(NewList).

test(List):-list_count(List,Ans),write_list(Ans).

%Задание 14
in_list([],_):-fail.
in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

zad14:- Hairs=[_,_,_],
	in_list(Hairs,[belokurov,_]),
	in_list(Hairs,[rizhov,_]),
	in_list(Hairs,[chernov,_]),
	in_list(Hairs,[_,blond]),
	in_list(Hairs,[_,redhead]),
	in_list(Hairs,[_,brunette]),
	not(in_list(Hairs,[belokurov,blond])),
	not(in_list(Hairs,[rizhov,redhead])),
	not(in_list(Hairs,[chernov,brunette])),
	write(Hairs),!.

%Задание 15

zad15:-Girls=[_,_,_],
	in_list(Girls,[anna,Z,Z]),
	in_list(Girls,[natalya,_,green]),
	in_list(Girls,[valya,_,_]),
	in_list(Girls,[_,white,_]),
	in_list(Girls,[_,green,_]),
	in_list(Girls,[_,blue,_]),
	in_list(Girls,[_,_,white]),
	in_list(Girls,[_,_,green]),
	in_list(Girls,[_,_,blue]),
	not(in_list(Girls,[valya,Y,Y])),
	not(in_list(Girls,[natalya,X,X])),
	not(in_list(Girls,[valya,white,white])),
	write(Girls),!.

%Задание 16
% профессия, имя, наличие сестёр, возвраст <0,1,2>, родственники
zad16:-Friends=[_,_,_],
	in_list(Friends,[slesar,_,0,0,_]),
	in_list(Friends,[tokar,_,_,1,_]),
	in_list(Friends,[svarman,_,_,_,_]),
	in_list(Friends,[_,semenov,_,2,borisov]),
	in_list(Friends,[_,ivanov,_,_,_]),
	in_list(Friends,[_,borisov,1,_,semenov]),
	in_list(Friends,[slesar,Who1,_,_,_]),
	in_list(Friends,[svarman,Who2,_,_,_]),
	in_list(Friends,[tokar,Who3,_,_,_]),
	write('slesar ='),write(Who1),nl,write('svarman ='),write(Who2),nl,write('tokar ='),write(Who3),!.

%Задание 17

zad17:-Drinks=[_,_,_,_],
	in_list(Drinks,[bottle,_]),
	in_list(Drinks,[glass,_]),
	in_list(Drinks,[jug,_]),
	in_list(Drinks,[pot,_]),
	in_list(Drinks,[_,water]),
	in_list(Drinks,[_,milk]),
	in_list(Drinks,[_,lemonade]),
	in_list(Drinks,[_,kvas]),
	not(in_list(Drinks,[bottle,milk])),
	not(in_list(Drinks,[bottle,water])),
	not(in_list(Drinks,[pot,water])),
	not(in_list(Drinks,[pot,lemonade])),
	right([jug,_],[_,lemonade],Drinks),
	right([_,lemonade],[_,kvas],Drinks),
	near([glass,_],[pot,_],Drinks),
	near([glass,_],[_,milk],Drinks),
	write(Drinks),!.

right(_,_,[]):-fail.
right(A,B,[A|[B|_]]).
right(A,B,[_|T]):-right(A,B,T).

left(_,_,[]):-fail.
left(A,B,[B,[[B|A]|_]]).
left(A,B,[_|T]):-left(A,B,T).

near(A,B,T):-right(A,B,T).
near(A,B,T):-left(A,B,T).


% Задание 18

zad18:-Men=[_,_,_,_],
	in_list(Men,[voronov,_]),
	in_list(Men,[pavlov,_]),
	in_list(Men,[levitskiy,_]),
	in_list(Men,[sahorov,_]),
	in_list(Men,[_,dancer]),
	in_list(Men,[_,artist]),
	in_list(Men,[_,writer]),
	in_list(Men,[_,singer]),
	not(in_list(Men,[voronov,singer])),
	not(in_list(Men,[levitskiy,singer])),
	not(in_list(Men,[pavlov,writer])),
	not(in_list(Men,[pavlov,artist])),
	not(in_list(Men,[voronov,writer])),
	not(in_list(Men,[sahorov,writer])),
	write(Men),!.

% Задание 19

zad19:-Friends=[_,_,_],
	in_list(Friends,[mikal,_,_,_]),
	in_list(Friends,[samon,_,_,_]),
	in_list(Friends,[richard,_,_,What]),
	in_list(Friends,[_,1,_,_]),
	in_list(Friends,[_,2,_,_]),
	in_list(Friends,[_,3,_,_]),
	in_list(Friends,[_,_,american,_]),
	in_list(Friends,[_,_,israeli,_]),
	in_list(Friends,[Who,_,australian,_]),
	in_list(Friends,[_,_,_,kriket]),
	in_list(Friends,[_,_,_,basketboll]),
	in_list(Friends,[_,_,_,tenis]),
	in_list(Friends,[mikal,_,_,basketboll]),
	not(in_list(Friends,[mikal,_,american,_])),
	in_list(Friends,[samon,_,israeli,_]),
	not(in_list(Friends,[samon,_,_,tenis])),
	in_list(Friends,[_,1,_,kriket]),
	write('australian ='),write(Who),nl,write('richard ='),write(What),!.

% Задание 20

	name("Tomas","James Tomas").
    name("Tomas","Tomas Gerbert").
    name("Gerbert","Tomas Gerbert").
    name("Gerbert","Gerbert Frensis").
    name("Frensis","Gerbert Frensis").
    name("Frensis","Frensis James").
    name("James","Frensis James").
    name("James","James Tomas").

    stronger(P1,P2,[P1|T]):-in_list(T,P2),!.
    stronger(P1,P2,[_|T]):-stronger(P1,P2,T).

    insert_every_position(X, [X|T], T).
    insert_every_position(X, [H|T], [H|S]):-
        insert_every_position(X, T, S).

    permutation([], []).
    permutation([H|T], R):-
        permutation(T, X), insert_every_position(H, R, X).

zad20:-
        permutation(["James Tomas","Tomas Gerbert","Gerbert Frensis","Frensis James"],L),
        name("Tomas",A0),
        name("Gerbert",B0),
        stronger(B0,A0,L),
        name("Frensis",C0),
        stronger(C0,B0,L),
        name("Frensis",C1),
        name("Tomas",A1),
        name("Gerbert",B1),
        stronger(A1,C1,L),
        stronger(B1,C1,L),
        name("Gerbert",B2),
        name("James",D0),
        stronger(D0,B2,L),
        name("Frensis",C2),
        stronger(B2,C2,L),
		write(L),!.





