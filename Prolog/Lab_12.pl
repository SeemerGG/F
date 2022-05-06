%Р—Р°РґР°РЅРёРµ 11
simple_digit(N):-simple_digit(N,2),!.
simple_digit(1,2):-!.
simple_digit(N,N):-!.
simple_digit(N,Y):-N mod Y =:= 0 -> fail,!;NewY is Y+1,simple_digit(N,NewY).

sum_simple_del(N):-sum_simple_del(N,2,1),!.
sum_simple_del(N,N,Sum):-(simple_digit(N) -> NewSum is N+Sum,write(NewSum);write(Sum)),!.
sum_simple_del(N,Y,Sum):-N mod Y =:= 0,simple_digit(Y) -> NewSum is Sum+Y,NewY is Y+1,sum_simple_del(N,NewY,NewSum);NewY is Y+1,sum_simple_del(N,NewY,Sum).

%Задание 12

sum_digit(N,X):-sum_digit(N,0,X).
sum_digit(0,Sum,Sum):-!.
sum_digit(N,Sum,X):-NewN is N div 10,NewSum is (N mod 10)+Sum,sum_digit(NewN,NewSum,X).

mult_del(N,M):-mult_del(N,2,1,M),!.
mult_del(N,N,TM,TM):-!.
mult_del(N,Y,TM,M):-N mod Y =:= 0,sum_digit(Y,X),sum_digit(N,U),X<U->NewY is Y+1,NewTM is TM*Y,mult_del(N,NewY,NewTM,M);NewY is Y+1,mult_del(N,NewY,TM,M).

%Задание 13

zad13(N,M,K):-NewN is N+1,NewM is M+1,zad13(2,NewN,2,NewM,0,K),!.
zad13(N,N,_,_,Count,Count):-!.
zad13(A,N,M,M,Count,K):-NewA is A+1,zad13(NewA,N,2,M,Count,K).
zad13(A,N,B,M,Count,K):-X is A**B,NewB is B+1,(srav(X,A,NewB,N,M) -> NewCount is Count+1,zad13(A,N,NewB,M,NewCount,K);zad13(A,N,NewB,M,Count,K)).
srav(_,N,_,N,_):-!.
srav(X,A,M,N,M):-NewA is A+1,srav(X,NewA,2,N,M).
srav(X,A,B,N,M):-(A<N,B<M -> (X2 is A**B,X =:= X2 -> fail,!;NewB is B+1,srav(X,A,NewB,N,M))).

%Задание 14

lenght_list([],0).
lenght_list([_|T],X):-lenght_list(T,X1),X is X1+1.

%Задание 15

