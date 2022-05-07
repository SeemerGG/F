%Задание 11
simple_digit(N):-simple_digit(N,2),!.
simple_digit(1,2):-!.
simple_digit(N,N):-!.
simple_digit(N,Y):-N mod Y =:= 0 -> fail,!;NewY is Y+1,simple_digit(N,NewY).

sum_simple_del(N):-sum_simple_del(N,2,1),!.
sum_simple_del(N,N,Sum):-(simple_digit(N) -> NewSum is N+Sum,write(NewSum);write(Sum)),!.
sum_simple_del(N,Y,Sum):-N mod Y =:= 0,simple_digit(Y) -> NewSum is Sum+Y,NewY is Y+1,sum_simple_del(N,NewY,NewSum);NewY is Y+1,sum_simple_del(N,NewY,Sum).

%������� 12

sum_digit(N,X):-sum_digit(N,0,X).
sum_digit(0,Sum,Sum):-!.
sum_digit(N,Sum,X):-NewN is N div 10,NewSum is (N mod 10)+Sum,sum_digit(NewN,NewSum,X).

mult_del(N,M):-mult_del(N,2,1,M),!.
mult_del(N,N,TM,TM):-!.
mult_del(N,Y,TM,M):-N mod Y =:= 0,sum_digit(Y,X),sum_digit(N,U),X<U->NewY is Y+1,NewTM is TM*Y,mult_del(N,NewY,NewTM,M);NewY is Y+1,mult_del(N,NewY,TM,M).

%������� 13

zad13(N,M,K):-NewN is N+1,NewM is M+1,zad13(2,NewN,2,NewM,0,K),!.
zad13(N,N,_,_,Count,Count):-!.
zad13(A,N,M,M,Count,K):-NewA is A+1,zad13(NewA,N,2,M,Count,K).
zad13(A,N,B,M,Count,K):-X is A**B,NewB is B+1,(srav(X,A,NewB,N,M) -> NewCount is Count+1,zad13(A,N,NewB,M,NewCount,K);zad13(A,N,NewB,M,Count,K)).
srav(_,N,_,N,_):-!.
srav(X,A,M,N,M):-NewA is A+1,srav(X,NewA,2,N,M).
srav(X,A,B,N,M):-(A<N,B<M -> (X2 is A**B,X =:= X2 -> fail,!;NewB is B+1,srav(X,A,NewB,N,M))).

%������� 14

lenght_list([],0).
lenght_list([_|T],X):-lenght_list(T,X1),X is X1+1.



%
append([],X,X).
append([H|T],X,[H|T1]):-append(T,X,T1).

read_list(A,N):-read_list([],A,0,N).
read_list(A,A,N,N):-!.
read_list(List,A,I,N):-	I1 is I+1,read(X),append(List,[X],List1),read_list(List1,A,I1,N).

write_list([]):-!.
write_list([H|T]):-write(H),write(' '),write_list(T).
%

%������� 15

getLast([], _, _):-!, fail.
getLast([H], H, []):-!.
getLast([H|T], R, [H|RL]):-getLast(T, R, RL).

shift(L,[E|RL]):-getLast(L,E,RL),!.
shift_2(L,[E|RL]):-shift(L,R),shift(R,[E|RL]).

zad15(N):-read_list(List,N),shift_2(List,List2),write_list(List2).

% Задание 16
%Находит значение элемента который входит в список один раз
solo_digit(List,X):-count_list(List,List_counts),solo_digit(X,List,List_counts),!.
solo_digit(X,[X|_],[1|_]):-!.
solo_digit(X,[H|T],[HC|TC]):-solo_digit(X,T,TC).

zad16(N):-read_list(List,N),solo_digit(List,X),write(X).
test(List):-count_list(List,List_counts),write_list(List_counts).

%Формирует список вхождений
count_list(List,List_counts):-count_list(List,List,List_counts,[]),!.
count_list([],_,L,L):-!.
count_list([H|T],List,List_counts,TList):-count_el(H,List,Count),append(TList,[Count],NewTList),count_list(T,List,List_counts,NewTList).

%Количество вхождений элемента н в список
count_el(N,List,Count):-count_el(N,List,Count,0),!.
count_el(_,[],Count,Count).
count_el(N,[H|T],Count,TCount):-(N =:= H -> NewTCount is TCount+1,count_el(N,T,Count,NewTCount);count_el(N,T,Count,TCount)).

% Задания 17

% Находит минимальный элемент в списке
min([H|T],X):-min(T,X,H),!.
min([],X,X):-!.
min([H|T],X,TMin):-H < TMin -> min(T,X,H);min(T,X,TMin).

%Находит максимальный элемент в списке
max([H|T],X):-max(T,X,H),!.
max([],X,X):-!.
max([H|T],X,TMax):-H > TMax -> max(T,X,H);max(T,X,TMax).

%Меняет элементы со значениями Н и М местами в списке
swap(N,M,List,X):-swap(N,M,List,[],X),!.
swap(_,_,[],X,X):-!.
swap(N,M,[H|T],NewList,X):-(H =:= N -> append(NewList,[M],NewNewList),swap(N,M,T,NewNewList,X);(H =:= M -> append(NewList,[N],NewNewList),swap(N,M,T,NewNewList,X);append(NewList,[H],NewNewList),swap(N,M,T,NewNewList,X))),!.

zad17(N):-read_list(List,N),min(List,X),max(List,Y),swap(X,Y,List,NewList),write_list(NewList).

%Задание 18

zad18(N):-read_list(List,N),shift(List, NewList),write_list(NewList).

%Задание 19

count_chet(List,X):-count_chet(List,X,0).
count_chet([],X,X):-!.
count_chet([H|T],X,TCount):-(H mod 2 =:= 0 -> NewTCount is TCount+1,count_chet(T,X,NewTCount);count_chet(T,X,TCount)),!.

zad19(N):-read_list(List,N),count_chet(List,X),write(X).

%Задание 20

list_el_belong(List,A,B,NewList):-list_el_belong(List,A,B,NewList,[]),!.
list_el_belong([],_,_,NewList,NewList):-!.
list_el_belong([H|T],A,B,NewList,TList):-(A =< H,B >= H -> append(TList,[H],NewTList),list_el_belong(T,A,B,NewList,NewTList);list_el_belong(T,A,B,NewList,TList)),!.

zad20(N):-read_list(List,N),read(A),read(B),list_el_belong(List,A,B,NewList),write_list(NewList).
