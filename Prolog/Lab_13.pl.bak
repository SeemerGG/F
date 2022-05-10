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

