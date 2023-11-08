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
    clear_answers,
    % Interact with user.
    ???.

    
:- dynamic(store_ans/2)
ask_user(Q, A) :- store_ans(Q, A).


clear_answers :- retract(store_ans(_, _)), fail.

ask_question()
