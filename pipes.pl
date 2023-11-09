% segment_hydrauliczny(nazwa_segmentu, start_segmentu, koniec_segmentu)
% connection(start_pipe, next_pipe)


segment("a", 26, 29).
segment("b", 13, 20).
segment("c", 56, 62).

%kanalizacja
connection(26, 27).
connection(27, 28).
connection(28, 29).

%połączenie system chłodniczy a magazyn chłodziwa
connection(56, 57).
connection(57, 58).
connection(58, 60).
connection(60, 61).
connection(61, 62).

%połączenie system chłodniczy a filtr chłodziwa
connection(13, 16).
connection(16, 17).
connection(17, 18).
connection(18, 20).

check_connection(Target, Target).
check_connection(Start, Target) :-
    connection(Start, Next),
    check_connection(Next, Target).

check_pipe_connections([]).
check_pipe_connections([H| T]) :- segment(H, Starter, Docelowy), check_connection(Starter, Docelowy), check_pipe_connections(T).
