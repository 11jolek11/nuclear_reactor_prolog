% To run main, run the Repl and type 'main.' into the prompt
main :- write('Hello, world!').

consult('./io_utils/get_list_of_numbers.pl').
consult('./io_utils/get_list.pl').
consult('./io_utils/get_number.pl').
consult('./io_utils/get_yes_or_no.pl').

start :-
    write('Witaj w systemie ekspertowym obsługi reaktora jądrowego.'),nl,
    write('W celu uzyskania pomocnych informacji odpowiedz na poniższe pytania.'),nl,
    % Clear the previous answers
    clear_answers.
    % Interact with user.

    
:- dynamic store_ans/2.
ask_user(Q, A) :- store_ans(Q, A).

:- dynamic reactor_number/1.
ask_reactor_number(N) :- store_ans(Q, A).


clear_answers :- retract(store_ans(_, _)), fail.
  
% ask_question(Trigger, Typ_pobieranych_danych, Result) :- 
ask_question(Trigger, Pobieracz_danych, Result) :- 
  user_message(Trigger),
  call(Pobieracz_danych, Result).

decision_tree :-
  % Pytanie 1
  ask_question(q_reactor_number, read_integer, Result),
  ask_user(q_reactor_number, Result),
  % We do absolotely freaking nothing

  % Pytanie 2
  ask_question(q_are_there_errors, get_yes_or_no, Result).



% dozymetry
% Result - lista informacyjna o dozymetrze
% Jeśli Result[0] in supported_brands && Result[1] in supported_models &&
% int(Result[2]) > 10 ->
%  ask_question(czy osłona uszkodzona);
% eLsE ->
%  ask_question(ile prętów))

% unpack_ans(List, Brand, Model, Battery_level):-

% unpack_single_element_from_list(Element, Tail, Input) :-
  % append([Element], Tail, Input).
  % [Marka|].

supported_dosimeter_models("XD-16").
supported_dosimeter_models("WTF-15").

supported_dosimeter_mark("Bosch").
batter_level(Battery) :-
  integer(Battery),
  Battery >= 10.

dosimeter_handling(Marka, Model, Battery) :-
  ensure_loaded('./io_utils/get_list.pl'),
  read_stream_lines(Lines),
  [Marka|Model_battery] = Lines,
  [Model|Tail] = Model_battery,
  [Battery|T] = Tail,
  supported_dosimeter_models(Model),
  supported_dosimeter_mark(Marka),
  batter_level(Battery).
  
  
  

unpack_single_element_from_list(Element, Tail, Tail).

% show_records([]).
% show_records([A|B]) :-
%   format('ID = ~w\tName = ~w\tGrade = ~w~n',A),
% show_records(B).