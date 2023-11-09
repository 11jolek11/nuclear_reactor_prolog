:- abolish(store_ans/2).
% To run main, run the Repl and type 'main.' into the prompt
main :- write('Hello, world!').

:- consult('./io_utils/get_list_of_numbers.pl').
:- consult('./io_utils/get_list.pl').
:- consult('./io_utils/get_number.pl').
:- consult('./io_utils/get_yes_or_no.pl').
:- consult('./io_utils/get_single_char.pl').
:- consult('./message.pl').
:- consult('./io_utils/get_string.pl').
:- consult('./pipes.pl').

:- dynamic store_ans/2.
ask_user(Q, A) :- store_ans(Q, A).

%:- dynamic reactor_number/1.
%ask_reactor_number(N) :- store_ans(Q, N).

start :-
    write('Witaj w systemie ekspertowym obsługi reaktora jądrowego.'),nl,
    write('W celu uzyskania pomocnych informacji odpowiedz na poniższe pytania.'),nl,
    write('#######################################################################'), nl,
    write('Kiedy zostaniesz poproszony o wprowadzenie kilku wartości (listy wartości), aby zakończyć wprowadzanie należy użyć kombinacji klawiszy Ctrl + D'), nl,
    % Clear the previous answers
    %clear_answers,
    write("d"),
    % Interact with user.
    decision_tree.

%clear_answers :- retract(store_ans(_, _)), fail.
clear_answers :- retract(store_ans(_, _)), !.

 
% ask_question(Trigger, Typ_pobieranych_danych, Result) :- 
ask_question(Trigger, Pobieracz_danych, Result) :- 
  /*ensure_loaded('./message.pl'),
  ensure_loaded('./io_utils/get_list_of_numbers.pl'),
  ensure_loaded('./io_utils/get_list.pl'),
  ensure_loaded('./io_utils/get_number.pl'),
  ensure_loaded('./io_utils/get_yes_or_no.pl'),
  ensure_loaded('./io_utils/get_single_char.pl'),*/
  user_message(Trigger),
  call(Pobieracz_danych, Result).
  % ask_user(Trigger, Result).

decision_tree :-
  % Pytanie 1
  ask_question(q_reactor_number, read_integer, Result),
  % ask_user(q_reactor_number, Result),
  % We do absolotely freaking nothing

  % Pytanie 2
  ask_question(q_are_there_errors, get_yes_or_no, Result_2),
  (Result_2 = no ->
    % Pytanie 3
    ask_question(q_which_system, get_char, Result_3),
    (Result_3 = a ->
      % Pytanie 4
      ask_question(q_coolant, get_yes_or_no, Result_4),
      (Result_4 = no ->
        % Pytanie 5
        ask_question(q_coolant_quantity, read_integer, Result_5),
        ask_user(q_coolant_quantity, Result_5),
        % Pytanie 6
        ask_question(
          q_coolant_quantity_in_warehouse, read_integer, Result_6),
          (Result_6 > 0 ->
            system_message(d_coolant_from_warehouse);
          Result_6 < 0 ->
            system_message(d_buy_coolant)
          );
      Result_4 = yes ->
        % Pytanie 8
        ask_question(q_humidity, get_yes_or_no, Result_8),
        (Result_8 = yes ->
          % Pytanie 7
          ask_question(q_pipes_connections, read_stream_lines, Result_7),
          check_pipe_connections(Result_7)
        ,
        Result_8 = no ->
          % Pytanie 9
          ask_question(q_water_spillage, get_yes_or_no, Result_9),
          (Result_9 = no ->
            % Pytanie 7
            ask_question(q_pipes_connections, read_stream_lines, Result_7),
              check_pipe_connections(Result_7)
            ,
          Result_9 = yes ->
            system_message(d_remove_water)
          )
        )
      );
    Result_3 = b ->
      % Pytanie 17
      ask_question(q_number_of_rods, read_integer, Result_17),
      ask_question(q_rods_level, read_integer, Result_18),
      ask_question(q_moderator_type, read_stream_single_line, Result_19),
      (Result_17 > 0, Result_18 > 10, (Result_19 is "Graffit" ; Result_19 is "Ciężka woda") -> system_message(d_rods_ok)  ; system_message(d_rods_error)
      );
      % ###################################################################################
  Result_2 = yes ->
    write('no'),
  % Pytanie 10
    ask_question(q_radiation, read_integer, Result_10),
    % TODO(11jolek11): tu dodać gromadzenie wiedzy
        (Result_10 < 50 -> 
        % Pytanie 12
        ask_question(q_temperature_over_norm, get_yes_or_no, Result_12),
            (Result_12 = yes -> 
              % Pytanie 13
              ask_question(q_co2_is_present, get_yes_or_no, Result_13),
                (Result_13 = yes ->
                  % Pytanie 15
                  (ask_question(q_leak_from_control_rod, get_yes_or_no, Result_15),
                    ( Result_15 = yes -> system_message(d_reactor_damaged); system_message(d_fire)))
                  ;
                  (
                  % Pytanie 14
                  % FIXME(11jolek11): Czy tu jest dobre pytanie?
                    ask_question(q_cooling_diagnostics, get_yes_or_no, Result_14),
                    (
                    Result_14 = no -> system_message(d_ok_but_careful); ask_question(q_coolant, get_yes_or_no, Result_4)
                    )
                )
            )
        )
    ;
    %Pytanie 17
    ask_question(q_number_of_rods, read_integer, Result_17),
    ask_question(q_rods_level, read_integer, Result_18),
    ask_question(q_moderator_type, read_stream_single_line, Result_19),
      (Result_17 > 0, Result_18 > 10, (Result_19 is "Graffit" ; Result_19 is "Ciężka woda") -> system_message(d_rods_ok)  ; system_message(d_rods_error))
    )
  ); ########## <--------------------------
).



batter_level(Battery) :-
  integer(Battery),
  Battery >= 10.
