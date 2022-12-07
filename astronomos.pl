%Resolvedor do problema disponível em: https://rachacuca.com.br/logica/problemas/astronomos-amadores/
%Há cinco astrônomos, possuindo seis atributos cada.
%Cada atributo possui cinco valores possíveis, que não podem ser repetidos entre astrônomos.

%Cor da camisa
camisa(amarela).
camisa(azul).
camisa(verde).
camisa(branca).
camisa(vermelha).

%Nome
nome(alan).
nome(cleber).
nome(luis).
nome(milton).
nome(vinicius).

%Idade
idade(27).
idade(29).
idade(32).
idade(33).
idade(35).

%Constelação a que observa
constelacao(andromeda).
constelacao(aries).
constelacao(orion).
constelacao(escorpiao).
constelacao(pegasus).

%Altura (em centímetros)
altura(166).
altura(170).
altura(172).
altura(175).
altura(181).

%Esporte do qual gosta
esporte(futebol).
esporte(basquete).
esporte(volei).
esporte(natacao).
esporte(sinuca).

%X está ao lado de Y
aoLado(X,Y,Lista) :- nextto(X,Y,Lista);nextto(Y,X,Lista).
                       
%X está à esquerda de Y (em qualquer posição à esquerda)
aEsquerda(X,Y,Lista) :- nth0(IndexX,Lista,X), 
                        nth0(IndexY,Lista,Y), 
                        IndexX < IndexY.
                        
%X está à direita de Y (em qualquer posição à direita)
aDireita(X,Y,Lista) :- aEsquerda(Y,X,Lista). 

%X está no canto se ele é o primeiro ou o último da lista
noCanto(X,Lista) :- last(Lista,X).
noCanto(X,[X|_]).

todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H,T)), todosDiferentes(T).

solucao(ListaSolucao) :- 

    ListaSolucao = [
        astronomo(Camisa1, Nome1, Idade1, Constelacao1, Altura1, Esporte1),
        astronomo(Camisa2, Nome2, Idade2, Constelacao2, Altura2, Esporte2),
        astronomo(Camisa3, Nome3, Idade3, Constelacao3, Altura3, Esporte3),
        astronomo(Camisa4, Nome4, Idade4, Constelacao4, Altura4, Esporte4),
        astronomo(Camisa5, Nome5, Idade5, Constelacao5, Altura5, Esporte5)
    ],

    %Na segunda posição está o astrônomo com a camisa Vermelha.
    Camisa2 = vermelha,

    %O homem de 29 anos está em uma das pontas.
    noCanto(astronomo(_, _, 29, _, _, _), ListaSolucao),

    %O astrônomo de Vermelho está em algum lugar entre quem gosta de Natação e quem tem 35 anos, nessa ordem.
    aDireita(astronomo(vermelha, _, _, _, _, _), astronomo(_, _, _, _, _, natacao), ListaSolucao),
    aEsquerda(astronomo(vermelha, _, _, _, _, _), astronomo(_, _, 35, _, _, _), ListaSolucao),

    %O astrônomo de 32 anos gosta de jogar Basquete.
    member(astronomo(_, _, 32, _, _, basquete), ListaSolucao),

    %Quem gosta de Vôlei está ao lado de quem tem 1,66 m de altura.
    aoLado(astronomo(_, _, _, _, _, volei), astronomo(_, _, _, _, 166, _), ListaSolucao),

    %Milton está em algum lugar à direita de quem está de Branco.
    aDireita(astronomo(_, milton, _, _, _, _), astronomo(branca, _, _, _, _, _), ListaSolucao),

    %O astrônomo de 1,70 m está observando a constelação de Andrômeda.
    member(astronomo(_, _, _, andromeda, 170, _), ListaSolucao),

    %Os astrônomos que gostam de Futebol e Basquete estão lado a lado.
    aoLado(astronomo(_, _, _, _, _, futebol), astronomo(_, _, _, _, _, basquete), ListaSolucao),

    %Quem está observando a constelação de Pegasus está em algum lugar entre Cleber e o homem de Branco, nessa ordem.
    aDireita(astronomo(_, _, _, pegasus, _, _), astronomo(_, cleber, _, _, _, _), ListaSolucao),
    aEsquerda(astronomo(_, _, _, pegasus, _, _), astronomo(branca, _, _, _, _, _), ListaSolucao),

    %Luís está usando uma camisa Branca.
    member(astronomo(branca, luis, _, _, _, _), ListaSolucao),
    
    %O homem que gosta de Natação está exatamente à esquerda de quem tem 27 anos.
    aEsquerda(astronomo(_, _, _, _, _, natacao), astronomo(_, _, 27, _, _, _), ListaSolucao),

    %O astrônomo de 1,81 m gosta de jogar Vôlei.
    member(astronomo(_, _, _, _, 181, volei), ListaSolucao),

    %Alan está em uma das pontas.
    noCanto(astronomo(_, alan, _, _, _, _), ListaSolucao),
    
    %O astrônomo que está observando a constelação de Escorpião está ao lado do astrônomo de 1,72 m.
    aoLado(astronomo(_, _, _, escorpiao, _, _), astronomo(_, _, _, _, 172, _), ListaSolucao),

    %O astrônomo de Amarelo está observando Orion.
    member(astronomo(amarela, _, _, orion, _, _), ListaSolucao),
    
    %O homem de 1,70 m está exatamente à direita do astrônomo de 29 anos.
    aDireita(astronomo(_, _, _, _, 170, _), astronomo(_, _, 29, _, _, _), ListaSolucao),

    %Cleber gosta de jogar Futebol.
    member(astronomo(_, cleber, _, _, _, futebol), ListaSolucao),
    
    %Na quinta posição está quem gosta de jogar Sinuca.
    Esporte5 = sinuca,

    %O astrônomo de 33 anos é o mais baixo.
    member(astronomo(_, _, 33, _, 166, _), ListaSolucao),
    
    %O astrônomo de Verde está em algum lugar entre quem tem 29 anos e quem observa a constelação de Escorpião, nessa ordem.
    aDireita(astronomo(verde, _, _, _, _, _), astronomo(_, _, 29, _, _, _), ListaSolucao),
    aEsquerda(astronomo(verde, _, _, _, _, _), astronomo(_, _, _, escorpiao, _, _), ListaSolucao),

    %O homem de 1,66 m está observando a constelação de Aries.
    member(astronomo(_, _, _, aries, 166, _), ListaSolucao),

    %Testa todas as possibilidades
    camisa(Camisa1), camisa(Camisa2), camisa(Camisa3), camisa(Camisa4), camisa(Camisa5),
    todosDiferentes([Camisa1, Camisa2, Camisa3, Camisa4, Camisa5]),

    nome(Nome1), nome(Nome2), nome(Nome3), nome(Nome4), nome(Nome5),
    todosDiferentes([Nome1, Nome2, Nome3, Nome4, Nome5]),

    idade(Idade1), idade(Idade2), idade(Idade3), idade(Idade4), idade(Idade5),
    todosDiferentes([Idade1, Idade2, Idade3, Idade4, Idade5]),

    constelacao(Constelacao1), constelacao(Constelacao2), constelacao(Constelacao3), constelacao(Constelacao4), constelacao(Constelacao5),
    todosDiferentes([Constelacao1, Constelacao2, Constelacao3, Constelacao4, Constelacao5]),

    altura(Altura1), altura(Altura2), altura(Altura3), altura(Altura4), altura(Altura5),
    todosDiferentes([Altura1, Altura2, Altura3, Altura4, Altura5]),

    esporte(Esporte1), esporte(Esporte2), esporte(Esporte3), esporte(Esporte4), esporte(Esporte5),
    todosDiferentes([Esporte1, Esporte2, Esporte3, Esporte4, Esporte5]).
