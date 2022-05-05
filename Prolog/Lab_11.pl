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

%Задание 11
father(X,Y):-parent(X,Y),man(X).
father(X):-father(Y,X), write(Y).

%Задание 12
sister(X,Y):-parent(U,X),parent(U,Y),X\=Y,woman(U),woman(X).
sister(X):-sister(Y,X),write(Y),nl,fail.

%Задание 13
grand_son(X,Y):-man(X),parent(Y,U),parent(U,X).
grand_sons(X):-grand_son(Y,X),write(Y),nl,fail.

%Задание 14
grand_mom_son(X,Y):-(man(X),woman(Y),parent(Y,U),parent(U,X);man(Y),woman(X),parent(X,U),parent(U,Y)),!.

%Задание 15
mul_digit(X,Y):-X<10,Y is X mod 10,!.
mul_digit(X,Y):-NewX is X div 10,mul_digit(NewX,Y1),Y is (X mod 10)*Y1,!.
mul_digit(X):-mul_digit(X,Y),write(Y),!.
%Задание 16
mul_digit_down(X,Y):-X<10,Y is X mod 10.
mul_digit_down(X,Y):-NewX is X div 10,NewY is Y * (X mod 10),mul_digit(NewX,NewY).
mul_digit_down(X):-mul_digit(X,Y),write(Y),!.
