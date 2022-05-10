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

in_list([El,_],El).
in_list([_,T],E1):-in_list(T,El).