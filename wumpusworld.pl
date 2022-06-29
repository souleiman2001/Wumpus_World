%a.Room(X,Y) the room in position (x,y). You can also use a list [x,y]
%b.Breeze(R(X,Y)) there is a breeze in room R(X,Y). Can also be Breeze([x,y])
%c. Pit((R(X,Y)) there is a pit in room R(X,Y)
%d. Wumpus(R(X,Y) the Wumpus in room R(X,Y)
%e. Stench(R(X,Y)) room R(X,Y) stenche
%f. Gold(R(X,Y)) there is gold in room R(X,Y)
%g. AdjacentTo (R(X,Y), R(ZT)) room R(T,Z) is adjacent to room R(X,Y)
%h. Safe(R(X,Y)) room R(X,Y) is safe
%i. GrabGold () grab the gold in the current room 
%j. ShootWumpus(R(X,Y)) shoot the Wumpus in room R(X,Y) only from adjacent rooms
%Safe (Room[X,Y]) ? and will return all the rooms (X,Y) that safe from the given starting 
%position
%You may also ask GrabGoldGold() and will return true if gold is in current position and 
%false if not 
%ShootWumpus() and will return true if the Wumpus is in one of the adjacent rooms and 
%false if not



%location of starting position
mypositionlist([[1,1]]).
%location of gold
mygoldlist([[3,2]]).
%location of stench
mystenchlist([[1,2],[1,4]]).
%location of wumpus
mywumpusloc([[1,3]]).
%location breeze 
mybreezelist([[2,1],[3,2],[4,1],[3,4],[4,3]]).
%safe roooms
mysaferooms([[1,4],[1,2],[1,1],[2,1],[2,2],[2,3],[2,4],[3,2],[3,4],[4,1],[4,2],[4,3]]).
%list of rooms where there is a pits
mypitlist([[3,1],[3,3],[4,4]]).


% to print the current position
currentpos(X) :-
    format('current position:'),nl,
    mypositionlist(L),member(X,L).


% to print lists of saferooms,gold,stench,wumpus, breeze

listofsaferooms(X) :-
    format('list of safe rooms:'),nl,
    mysaferooms(L),member(X,L).
    
    
gold(X) :-
    format('gold here'),nl,
    mygoldlist(L),member(X,L).
stench(X) :-
    format('stench here'),nl,
    mystenchlist(L),member(X,L).
    
wumpus(X) :-
    format('wumpus here'),nl,
    mywumpusloc(L),member(X,L).

breeze(X) :-
    format('breeze here'),nl,
    mybreezelist(L),member(X,L).


pit(X) :-
    format('pit here'),nl,
    mypitlist(L),member(X,L).


same([], []).

same([H1|R1], [H2|R2]):-
    H1 = H2,
    same(R1, R2).



adjacenthuntercell([X, Y], [A, B]) :- 
    A1 is A+ 1,
    [X, Y] = [A1, B]; 
    A2 is A - 1,
    [X, Y] = [A2, B]; 
    B1 is B + 1,
    [X, Y] = [A, B1]; 
    B2 is B - 1,
    [X, Y] = [A, B2].


grabgoldgold(A,B) :-
    same([A,B],[3,2]).
  
doesitstench(A,B) :-
    same([A,B],[1,2]);
    same([A,B],[1,4]).

doesitcontainwumpus(A,B) :-
    same([A,B],[1,3]).

doesitcontainbreeze(A,B) :-
    same([A,B],[2,1]);
    same([A,B],[3,2]);
    same([A,B],[4,1]);
    same([A,B],[3,4]);
    same([A,B],[4,3]).

doesitcontainpit(A,B) :-
    same([A,B],[3,1]);
    same([A,B],[3,3]);
    same([A,B],[4,4]).




% [X,Y] is the location of the position from where the agent will shoot 
shoot(X,Y) :-
    adjacenthuntercell([X, Y], [1, 3]),
    format('wumpus was killed. Loud scream!!!!').

isthisroomsafe(X,Y) :-
   same([X,Y],[1,1]);
   same([X,Y],[1,2]);
   same([X,Y],[1,4]);
   same([X,Y],[2,1]);
   same([X,Y],[2,2]);
   same([X,Y],[2,3]);
   same([X,Y],[2,4]);
   same([X,Y],[3,2]);
   same([X,Y],[3,4]);
   same([X,Y],[4,1]);
   same([X,Y],[4,2]);
   same([X,Y],[4,3]).