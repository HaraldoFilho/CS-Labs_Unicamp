%%% MC336 - PARADIGMAS DE PROGRAMACAO - 1s2008
%%% Prof. Jacques Wainer
%%% ------------------------------------------
%%% PROJETO PROLOG
%%% Aluno: Haraldo Sergio A. Pereira Filho
%%% RA: 003059


%%% Parte 1:

% hull(+Pontos,-Resultado)
% ------------------------

hull(Pontos,[]) :-
 length(Pontos,Tamanho),
 Tamanho < 3,
 !.

hull(Pontos,Resultado) :-
 ponto_inicial(Pontos,Inicial),
 wrap(Inicial,Inicial,Inicial,Pontos,[],Resultado),
 !.


% wrap(+PontoInicial,+PontoAnterior,+PontoAtual,+Pontos,+ResultadoParcial,-Resultado)
% -----------------------------------------------------------------------------------

wrap(Inicial,_Anterior,_Atual,_Pontos,Resultado,Resultado) :-
 last(Resultado,Inicial).

wrap(Inicial,Anterior,Atual,Pontos,ResultadoParcial,Resultado) :-
 remove(Atual,Pontos,PontosSemAtual),
 proximo_ponto([Atual,Anterior],PontosSemAtual,Proximo),
 remove(Proximo,Pontos,PontosSemProximo),
 append(ResultadoParcial,[Proximo],ResultadoParcialProximo),
 wrap(Inicial,Atual,Proximo,PontosSemProximo,ResultadoParcialProximo,Resultado).


% ponto_inicial(+Pontos,-Resultado)
% ---------------------------------

ponto_inicial(Pontos,Resultado) :- ponto_inicial(Pontos,[],Resultado).


% ponto_inicial(+Pontos,+PontoCandidato,-Resultado)
% -------------------------------------------------

ponto_inicial([],Resultado,Resultado).

ponto_inicial([FirstPontos|RestPontos],[],Resultado) :-
 ponto_inicial(RestPontos,FirstPontos,Resultado).

ponto_inicial([[X,Y]|RestPontos],[_X_Inicial,Y_Inicial],Resultado) :-
 Y < Y_Inicial,
 ponto_inicial(RestPontos,[X,Y],Resultado).

ponto_inicial([[X,Y]|RestPontos],[X_Inicial,Y_Inicial],Resultado) :-
 Y =:= Y_Inicial,
 X > X_Inicial,
 ponto_inicial(RestPontos,[X,Y],Resultado).

ponto_inicial([_FirstPontos|RestPontos],Inicial,Resultado) :-
 ponto_inicial(RestPontos,Inicial,Resultado).


% proximo_ponto(+PontoReferencia,+Pontos,-Resultado)
% --------------------------------------------------

proximo_ponto(Referencia,Pontos,Resultado) :- proximo_ponto(Referencia,Pontos,[],Resultado).


% proximo_ponto(+PontoReferencia,+Pontos,+PontoCandidato,-Resultado)
% ------------------------------------------------------------------

proximo_ponto(_Referencia,[],Resultado,Resultado).

proximo_ponto(_Referencia,[Ponto|[]],[],Ponto).

proximo_ponto([FirstReferencia|[SecondReferencia|RestReferencia]],[FirstPontos|[SecondPontos|RestPontos]],[],Resultado) :-
 menor_angulo(FirstReferencia,SecondReferencia,FirstPontos,SecondPontos,MenorAngulo),
 proximo_ponto([FirstReferencia|[SecondReferencia|RestReferencia]],RestPontos,MenorAngulo,Resultado).

proximo_ponto([FirstReferencia|[SecondReferencia|RestReferencia]],[FirstPontos|RestPontos],Proximo,Resultado) :-
 menor_angulo(FirstReferencia,SecondReferencia,Proximo,FirstPontos,MenorAngulo),
 proximo_ponto([FirstReferencia|[SecondReferencia|RestReferencia]],RestPontos,MenorAngulo,Resultado).


% menor_angulo(+PontoOrigem,+PontoReferencia,+Ponto1,+Ponto2,-Resultado)
% ----------------------------------------------------------------------

menor_angulo([X0,Y0],[X1,Y1],[X2,Y2],[X3,Y3],[X2,Y2]) :-
 angulo([X1,Y1],[X0,Y0],A1),
 angulo([X0,Y0],[X2,Y2],A2),
 angulo([X0,Y0],[X3,Y3],A3),
 abs(A2-A1) < abs(A3-A1).

menor_angulo([X0,Y0],[X1,Y1],[X2,Y2],[X3,Y3],[X3,Y3]) :-
 angulo([X1,Y1],[X0,Y0],A1),
 angulo([X0,Y0],[X2,Y2],A2),
 angulo([X0,Y0],[X3,Y3],A3),
 abs(A3-A1) < abs(A2-A1).

menor_angulo([X0,Y0],[_,_],[X2,Y2],[X3,Y3],[X2,Y2]) :-
 menor_distancia([X0,Y0],[X2,Y2],[X3,Y3],[X2,Y2]).

menor_angulo([X0,Y0],[_,_],[X2,Y2],[X3,Y3],[X3,Y3]) :-
 menor_distancia([X0,Y0],[X2,Y2],[X3,Y3],[X3,Y3]).


% menor_distancia(+PontoReferencia,+Ponto1,+Ponto2,-Resultado)
% ------------------------------------------------------------

menor_distancia([X0,Y0],[X1,Y1],[X2,Y2],[X1,Y1]) :-
 dist([X0,Y0],[X1,Y1],D1),
 dist([X0,Y0],[X2,Y2],D2),
 D1 < D2.
 
menor_distancia([_,_],[_,_],[X,Y],[X,Y]).


% dist(+Ponto1,+Ponto2,-Resultado)
% --------------------------------

dist([X0,Y0],[X1,Y1],D) :- D is sqrt((X0-X1)^2+(Y0-Y1)^2).


% angulo(+PontoReferencia,+Ponto,-Resultado)
% ------------------------------------------

angulo([X0,Y0],[X1,Y1],A) :- quadrante([X0,Y0],[X1,Y1],0), A is 0.
angulo([X0,Y0],[X1,Y1],A) :- quadrante([X0,Y0],[X1,Y1],1), A is atan(abs((Y1-Y0)/(X1-X0))).
angulo([X0,Y0],[X1,Y1],A) :- quadrante([X0,Y0],[X1,Y1],2), A is pi-atan(abs((Y1-Y0)/(X1-X0))).
angulo([X0,Y0],[X1,Y1],A) :- quadrante([X0,Y0],[X1,Y1],3), A is pi+atan(abs((Y1-Y0)/(X1-X0))).
angulo([X0,Y0],[X1,Y1],A) :- quadrante([X0,Y0],[X1,Y1],4), A is 2*pi-atan(abs((Y1-Y0)/(X1-X0))).
angulo([X0,Y0],[X1,Y1],A) :- quadrante([X0,Y0],[X1,Y1],1.2), A is pi/2.
angulo([X0,Y0],[X1,Y1],A) :- quadrante([X0,Y0],[X1,Y1],2.3), A is pi.
angulo([X0,Y0],[X1,Y1],A) :- quadrante([X0,Y0],[X1,Y1],3.4), A is 3*pi/2.
angulo([X0,Y0],[X1,Y1],A) :- quadrante([X0,Y0],[X1,Y1],4.1), A is 2*pi.


% quadrante(+PontoReferencia,+Ponto,-Resultado)
% ---------------------------------------------

quadrante([X0,Y0],[X1,Y1],0) :- X1-X0 =:= 0, Y1-Y0 =:= 0.
quadrante([X0,Y0],[X1,Y1],1) :- X1-X0 > 0, Y1-Y0 > 0.
quadrante([X0,Y0],[X1,Y1],2) :- X1-X0 < 0, Y1-Y0 > 0.
quadrante([X0,Y0],[X1,Y1],3) :- X1-X0 < 0, Y1-Y0 < 0.
quadrante([X0,Y0],[X1,Y1],4) :- X1-X0 > 0, Y1-Y0 < 0.
quadrante([X0,Y0],[X1,Y1],1.2) :- X1-X0 =:= 0, Y1-Y0 > 0.
quadrante([X0,Y0],[X1,Y1],2.3) :- X1-X0 < 0, Y1-Y0 =:= 0.
quadrante([X0,Y0],[X1,Y1],3.4) :- X1-X0 =:= 0, Y1-Y0 < 0.
quadrante([X0,Y0],[X1,Y1],4.1) :- X1-X0 > 0, Y1-Y0 =:= 0.


% remove(+Elemento,+Lista,-Resultado)
% -----------------------------------

remove(_,[],[]) :- !.
remove(E,L,R) :- remove(E,L,[],R), !.

% remove(+Elemento,+Lista,+ResultadoParcial,-Resultado)
% -----------------------------------------------------

remove(_,[],R,R).
remove(E,[E|L],RP,R) :- remove(E,L,RP,R).
remove(E,[X|L],RP,R) :- append(RP,[X],A), remove(E,L,A,R).


%%% Parte 2:

% camadas(+Pontos,-Resultado)
% ---------------------------

camadas(Pontos,Resultado) :-
 conta_camadas(Pontos,0,Resultado),
 !.


% conta_camadas(+Pontos,+Contador,-Resultado)
% -------------------------------------------

conta_camadas(Pontos,Resultado,Resultado) :-
 length(Pontos,Tamanho),
 Tamanho < 3.

conta_camadas(Pontos,Contador,Resultado) :-
 hull(Pontos,Hull),
 retira(Hull,Pontos,PontosSemHull),
 ContadorIncrementado is Contador + 1,
 conta_camadas(PontosSemHull,ContadorIncrementado,Resultado).


% retira(+Elementos,+Lista,-Resultado)
% ------------------------------------

retira([],Resultado,Resultado).

retira([FirstLista1|RestLista1],Lista2,Resultado) :-
 remove(FirstLista1,Lista2,Removido),
 retira(RestLista1,Removido,Resultado).
