% Задание 14

read_str(S,N):-get0(X),r_str(S,N,0,[],X).
r_str(S,N,N,S,10):-!.
r_str(S,N,K,TS,X):-NewK is K + 1,append(TS,[X],NewTS),get0(NewX),r_str(S,N,NewK,NewTS,NewX).

write_str([]):-!.
write_str([H|T]):-put(H),write_str(T).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

zad1_1:-	read_str(A,N),write_str(A),write(', '),write_str(A),write(', '),
		write_str(A),write(', '),write(N).

count_words(A,K):-count_words(A,0,K).

count_words([],K,K):-!.
count_words(A,I,K):-skip_space(A,A1),get_word(A1,Word,A2),Word \=[],I1 is I+1,count_words(A2,I1,K),!.
count_words(_,K,K).

skip_space([32|T],A1):-skip_space(T,A1),!.
skip_space(A1,A1).

get_word([],[],[]):-!.
get_word(A,Word,A2):-get_word(A,[],Word,A2).

get_word([],Word,Word,[]).
get_word([32|T],Word,Word,T):-!.
get_word([H|T],W,Word,A2):-append(W,[H],W1),get_word(T,W1,Word,A2).

get_words(A,Words,K):-get_words(A,[],Words,0,K).

get_words([],B,B,K,K):-!.
get_words(A,Temp_words,B,I,K):-
	skip_space(A,A1),get_word(A1,Word,A2),Word \=[],
	I1 is I+1,append(Temp_words,[Word],T_w),get_words(A2,T_w,B,I1,K),!.
get_words(_,B,B,K,K).

most_frequent_word(S,Word):-get_words(S,Words,_),delete_clone_words(Words,WordsWC),list_words_on_freq(WordsWC,Words,WordsWF),search_max_fre(WordsWF,Word).

search_max_fre([[H,K]|T],Max):-search_max_fre(T,Max,H,K).
search_max_fre([],Max,Max,_).
search_max_fre([[H,K]|T],Max,TMax,TMaxK):-K > TMaxK -> search_max_fre(T,Max,H,K);search_max_fre(T,Max,TMax,TMaxK).

list_words_on_freq(Words,OldWords,NewWords):-list_words_on_freq(Words,OldWords,NewWords,[]).
list_words_on_freq([],_,NewWords,NewWords):-!.
list_words_on_freq([H|T],OldWords,NewWords,TWords):-count_freq(H,OldWords,Count),append(TWords,[[H,Count]],NewTWords),list_words_on_freq(T,OldWords,NewWords,NewTWords).

count_freq(H,Words,Count):-count_freq(H,Words,Count,0).
count_freq(_,[],Count,Count):-!.
count_freq(H,[X|T],Count,TCount):-srav(X,H) -> NewTCount is TCount+1,count_freq(H,T,Count,NewTCount);count_freq(H,T,Count,TCount).

delete_clone_words([H|T],NewWords):-delete_clone_words(T,NewWords,[H]).
delete_clone_words([],NewWords,NewWords):-!.
delete_clone_words([H|T],NewWords,TNewWords):-obhod(H,TNewWords) -> delete_clone_words(T,NewWords,TNewWords);append(TNewWords,[H],NewTNewWords),delete_clone_words(T,NewWords,NewTNewWords).

obhod(H,[H|_]):-!.
obhod(H,[_|T]):-obhod(H,T).


srav([],[]).
srav([H|T],[H|Y]):-srav(T,Y).

zad1_3:-read_str(S,_),most_frequent_word(S,Word),write_str(Word).

zad1_4:-read_str([H|T],N),(N > 5 -> vivod3([H|T]);vivod(H,N)).

vivod3([H1,H2,H3|T]):-write_str([H1,H2,H3]),vivod3_last([H1,H2,H3|T]).
vivod3_last([_,H2,H3|T]):-vivod3_last([H2,H3|T]).
vivod3_last([H1,H2,H3|[]]):-write_str([H1,H2,H3]),!.

vivod(H,N):-vivod(H,N,0,[]).
vivod(_,N,N,List):-write_str(List),!.
vivod(H,N,I,List):-NewI is I+1,append(List,[H],NewList),vivod(H,N,NewI,NewList).

zad1_5:-read_str(S,_),last_el(S,El),num_list(S,El,NewList,[],0),write(NewList).

last_el([H],H):-!.
last_el([_|T],El):-last_el(T,El).

num_list([],_,List,List,_):-!.
num_list([H|T],LastEl,NewList,TList,I):-NewI is I+1,(H =:= LastEl -> append(TList,[I],NewTList),num_list(T,LastEl,NewList,NewTList,NewI);num_list(T,LastEl,NewList,TList,NewI)).

% Задание 12

read_str_f(A,N,Flag):-get0(X),r_str_f(X,A,[],N,0,Flag).
r_str_f(-1,A,A,N,N,0):-!.
r_str_f(10,A,A,N,N,1):-!.
r_str_f(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str_f(X1,A,B1,N,K1,Flag).

read_list_str(List,List_len):-read_str_f(A,N,Flag),r_l_s(List,List_len,[A],[N],Flag).
r_l_s(List,List_len,List,List_len,0):-!.
r_l_s(List,List_len,Cur_list,Cur_list_len,_):-
	read_str_f(A,N,Flag),append(Cur_list,[A],C_l),append(Cur_list_len,[N],C_l_l),
	r_l_s(List,List_len,C_l,C_l_l,Flag).

zad2_1:-see('c:/Users/PcBoyarin/Desktop/FaLP_Lab/Prolog/Lab_14/test.txt'),read_list_str(List,List_len),seen,srav_lens(List,List_len,Max),write_str(Max).

srav_lens([H|T],[K|T2],Max):-srav_lens(T,T2,Max,H,K).
srav_lens([],[],Max,Max,_):-!.
srav_lens([H|T],[K|T2],Max,TMax,TK):-K > TK -> srav_lens(T,T2,Max,H,K);srav_lens(T,T2,Max,TMax,TK).

zad2_2:-see('c:/Users/PcBoyarin/Desktop/FaLP_Lab/Prolog/Lab_14/test2_2.txt'),read_list_str(List,_),seen,s_without_space(List,K,0),write(K).

s_without_space([],K,K):-!.
s_without_space([H|T],K,TK):-have_cpace(H) -> s_without_space(T,K,TK);NewTK is TK + 1,s_without_space(T,K,NewTK).

have_cpace([32|_]):-!.
have_cpace([_|T]):-have_cpace(T).

zad2_3:-see('c:/Users/PcBoyarin/Desktop/FaLP_Lab/Prolog/Lab_14/test2_3.txt'),read_list_str(List,_),sred_A_all(List,X),seen,vibor_A(List,NewList,[],X),write_list_str(NewList),!.

vibor_A([],NewList,NewList,_):-!.
vibor_A([H|T],NewList,TList,Sred):-obhod_A(H,K,0),(K>Sred -> append(TList,[H],NewTList),vibor_A(T,NewList,NewTList,Sred);vibor_A(T,NewList,TList,Sred)).


sred_A_all(List,X):-count_str(List,K),count_A(List,Sum),X is Sum/K.
%/
count_str([],0).
count_str([_|T],X):-count_str(T,X1),X is X1+1.

count_A(List,Count):-count_A(List,Count,0).
count_A([],Count,Count):-!.
count_A([H|T],Count,TCount):-obhod_A(H,K,0),NewTCount is TCount+K,count_A(T,Count,NewTCount).

obhod_A([],K,K):-!.
obhod_A([97|T],K,TK):-NewTK is TK+1,obhod_A(T,K,NewTK).
obhod_A([65|T],K,TK):-NewTK is TK+1,obhod_A(T,K,NewTK).
obhod_A([_|T],K,TK):-obhod_A(T,K,TK).

zad2_4:-see('c:/Users/PcBoyarin/Desktop/FaLP_Lab/Prolog/Lab_14/test2_4.txt'),read_list_str(List,_),seen,all_words_in_one(List,AllWords,[]),most_frequent_word(AllWords,Word),write_str(Word).

%вСЕ СЛОВА В ОДНОЙ СТРОКЕ
all_words_in_one([],All,All):-!.
all_words_in_one([H|T],AllWotds,TAll):-add_all_el(H,TAll,NewTAll),append(NewTAll,[32],NewNewTAll),all_words_in_one(T,AllWotds,NewNewTAll).

add_all_el([],All,All):-!.
add_all_el([H|T],TAll,NewTAll):-append(TAll,[H],NewAll),add_all_el(T,NewAll,NewTAll).

zad2_5:-see('c:/Users/PcBoyarin/Desktop/FaLP_Lab/Prolog/Lab_14/test2_5.txt'),read_list_str(List,_),seen,list_strs_in_list_words(List,NewList,[]),write(List),nl,write(NewList),nl,
	vibor_non_clone_s(NewList,Strs),tell('c:/Users/PcBoyarin/Desktop/FaLP_Lab/Prolog/Lab_14/answer2_5.txt'),write_list_str(Strs),told.


vibor_non_clone_s(List,Strs):-vibor_non_clone_s(List,Strs,[]).
vibor_non_clone_s([],S,S):-!.
vibor_non_clone_s([H|T],Strs,TStrs):-proverka(H,T,T) -> append(TStrs,[H],NewTStrs),vibor_non_clone_s(T,Strs,NewTStrs);vibor_non_clone_s(T,Strs,NewTStrs).

proverka([],_,_):-!.
proverka([_,T],[],T1):-proverka(T,T1,T1).
proverka([H|T],[H1|T1],OldList):-proverka_word(H,H1) -> proverka([H|T],T1,OldList);fail,!.

proverka_word(_,[]):-!.
proverka_word(H,[X|T]):-srav(H,X) -> fail,!;proverka_word(H,T).

list_strs_in_list_words([],L,L):-!.
list_strs_in_list_words([H|T],NewList,TList):-get_words(H,Words,_),append(TList,[Words],NewTList),list_strs_in_list_words(T,NewList,NewTList).

% Задание 3

zad3:-read_str(A,_),count_russians(A,C),write(C).

count_russians(A,C):-count_russians(A,C,0).
count_russians([],G,G):-!.
count_russians([H|T],C,I):- (H > 1039,H < 1104 -> I1 is I + 1,count_russians(T,C,I1),!;count_russians(T,C,I),!).

% Задание 4

zad4:-read_str(A,_),only_small_latinica(A,NewA),flip_list(NewA,FlipA),srav(NewA,FlipA).

only_small_latinica(A,NewA):-only_small_latinica(A,NewA,[]).
only_small_latinica([],A,A):-!.
only_small_latinica([H|T],NewA,TA):-(H>96,H<123 -> append(TA,[H],NewTA),only_small_latinica(T,NewA,NewTA);only_small_latinica(T,NewA,TA)).

flip_list(A,NewA):-flip_list(A,NewA,[]).
flip_list([],A,A):-!.
flip_list([H|T],NewA,TA):-flip_list(T,NewA,[H|TA]).

% Задание 5

zad5:-see('c:/Users/PcBoyarin/Desktop/FaLP_Lab/Prolog/Lab_14/test5.txt'),read_list_str(List,_),all_words_in_one(List,A,[]),write(A),nl,seen,search_date(A,Daties),write_list_str(Daties).

search_date(A,Daties):-search_date(A,Daties,[]).
search_date([],Daties,Daties):-!.
search_date([_,_,_,_,_,_,_,_,_|[]],Daties,Daties):-!.
search_date([_,_,_,_,_,_,_,_|[]],Daties,Daties):-!.
search_date([_,_,_,_,_,_,_|[]],Daties,Daties):-!.
search_date([_,_,_,_,_,_|[]],Daties,Daties):-!.
search_date([_,_,_,_,_|[]],Daties,Daties):-!.
search_date([_,_,_,_|[]],Daties,Daties):-!.
search_date([_,_,_|[]],Daties,Daties):-!.
search_date([_,_|[]],Daties,Daties):-!.
search_date([_|[]],Daties,Daties):-!.
search_date([H1,H2,H3,H4,H5,H6,H7,H8,H9,H10|T],Daties,TA):-(H1<50,H1>47,H3=:=46,H4>47,H4<52,H5>47,H5<58,H6=:=46,H7>47,H7<58,H8>47,H8<58,H9>47,H9<58,H10>47,H10<58 -> append(TA,[[H1,H2,H3,H4,H5,H6,H7,H8,H9,H10]],NewTA),
search_date(T,Daties,NewTA);search_date([H2,H3,H4,H5,H6,H7,H8,H9,H10|T],Daties,TA)).

% Задание 6

in_list([H|_],H).
in_list([_|T],El):-in_list(T,El).

in_list_ex([H|T],H,T).
in_list_ex([H|T],El,[H|T1]):-in_list_ex(T,El,T1).
%
buil_razm_s_p(K):-read_str(List,_),tell('c:/Users/PcBoyarin/Desktop/FaLP_Lab/Prolog/Lab_14/test6_1.txt'),razm_s_p(List,K,[]),told.

razm_s_p(_,0,R):-write_str(R),nl,!,fail.
razm_s_p(List,N,R):-NewN is N-1,in_list(List,E),razm_s_p(List,NewN,[E|R]).
%
build_perestanovki:-read_str(List,_),tell('c:/Users/PcBoyarin/Desktop/FaLP_Lab/Prolog/Lab_14/test6_2.txt'),perestanovki(List,[]),told.
perestanovki([],R1):-write_str(R1),nl,!,fail.
perestanovki(List,R):-in_list_ex(List,E,T),perestanovki(T,[E|R]).
%
build_razm(K):-read_str(List,_),tell('c:/Users/PcBoyarin/Desktop/FaLP_Lab/Prolog/Lab_14/test6_3.txt'),razm(List,K,[]),told.
razm(_,0,R):-write_str(R),nl,!,fail.
razm(List,N,R):-NewN is N-1,in_list_ex(List,E,T),razm(T,NewN,[E|R]).
%
build_sets:-read_str(A,_),tell('c:/Users/PcBoyarin/Desktop/FaLP_Lab/Prolog/Lab_14/test6_4.txt'),all_pod(Set,A),write_str(Set),nl,fail,told.
all_pod([],[]).
all_pod([H|T1],[H|T2]):-all_pod(T1,T2).
all_pod(T,[_|T2]):-all_pod(T,T2).
%
build_soch(K):-read_str(A,_),tell('c:/Users/PcBoyarin/Desktop/FaLP_Lab/Prolog/Lab_14/test6_4.txt'),soch(R,K,A),write_str(R),nl,fail,told.
soch([],0,_):-!.
soch([H|T],N,[H|T1]):-NewN is N-1,soch(T,NewN,T1).
soch(T,N,[_|T1]):-soch(T,N,T1).
%
build_soch_s_p(K):-read_str(A,_),tell('c:/Users/PcBoyarin/Desktop/FaLP_Lab/Prolog/Lab_14/test6_4.txt'),soch_s_p(Soch,K,A),write_str(Soch),nl,fail,told.
soch_s_p([],0,_):-!.
soch_s_p([H|T],N,[H|T1]):-NewN is N-1,soch(T,NewN,[H|T1]).
soch_s_p(T,N,[_|T1]):-soch_s_p(T,N,T1).

%Задание 7
zad7:-tell('c:/Users/PcBoyarin/Desktop/FaLP_Lab/Prolog/Lab_14/test7.txt'),fun7([97,98,99,100,101,102],5,[]),told,!.

fun7(_,0,R):-aa(R,0) -> write_str(R),nl,!,fail;!,fail.
fun7(List,N,R):-NewN is N-1,in_list(List,E),fun7(List,NewN,[E|R]).

%zad7:-buil_razm_s_p(5),see('c:/Users/PcBoyarin/Desktop/FaLP_Lab/Prolog/Lab_14/test6_1.txt'),read_list_str(List,_),seen,write_list_str(List),search_aa(List,NewList,[]),tell('c:/Users/PcBoyarin/Desktop/FaLP_Lab/Prolog/Lab_14/test7.txt'),write_list_str(NewList).told.

%search_aa([],List,List):-!.
%search_aa([H|T],List,TList):-aa(H,0)->append(TList,[H],NewTList),search_aa(T,List,NewTList).

aa([],2):-!.
aa([],_):-fail,!.
aa([H|T],K):- H=:=97-> NewK is K+1,aa(T,NewK);aa(T,K).


