man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

%??????? 11
father(X,Y):-parent(X,Y),man(X).
father(X):-father(Y,X), write(Y).

%??????? 12
sister(X,Y):-parent(U,X),parent(U,Y),X\=Y,woman(U),woman(X).
sister(X):-sister(Y,X),write(Y),nl,fail.

%??????? 13
grand_son(X,Y):-man(X),parent(Y,U),parent(U,X).
grand_sons(X):-grand_son(Y,X),write(Y),nl,fail.

%??????? 14
grand_mom_son(X,Y):-(man(X),woman(Y),parent(Y,U),parent(U,X);man(Y),woman(X),parent(X,U),parent(U,Y)),!.

%??????? 15
mul_digit(X,Y):-X<10,Y is X mod 10,!.
mul_digit(X,Y):-NewX is X div 10,mul_digit(NewX,Y1),Y is (X mod 10)*Y1,!.
mul_digit(X):-mul_digit(X,Y),write(Y),!.

%??????? 16
mul_digit_down(X,Y):-X<10,Y is X mod 10.
mul_digit_down(X,Y):-NewX is X div 10,NewY is Y * (X mod 10),mul_digit(NewX,NewY).
mul_digit_down(X):-mul_digit(X,Y),write(Y),!.
%??????? 17

search_no_chet(X,Y):-X<10,AnsX is X mod 10,(AnsX mod 2 =:= 0,AnsX>3 -> Y is 1;Y is 0).
search_no_chet(X,Y):-NewX is X div 10,search_no_chet(NewX,Y1),AnsX is X mod 10,(AnsX mod 2 =:= 0,AnsX>3 -> Y is Y1+1;Y is Y1).
search_no_chet(X):-search_no_chet(X,Y),write(Y),!.
%??????? 18

search_no_chet_down(X):-search_no_chet_down(X,0),!.
search_no_chet_down(0,Y):-write(Y),!.
search_no_chet_down(X,Y):-NewX is X div 10,AnsX is X mod 10,(AnsX mod 2 =:= 0,AnsX>3 -> NewN is Y+1;NewN is Y),search_no_chet_down(NewX,NewN).

%??????? 19

bibonachi(1,1):-!.
bibonachi(2,1):-!.
bibonachi(N, X):- N1 is N - 1, N2 is N - 2, bibonachi(N1, X1), bibonachi(N2, X2), X is X1 + X2.
%??????? 20

fib(N,X):-fib(1,1,2,N,X).
fib(_,F,N,N,F):-!.
fib(A,B,K,N,X):-C is A+B, K1 is K+1,fib(B,C,K1,N,X).
