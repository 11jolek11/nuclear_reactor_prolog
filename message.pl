user_message(q_reactor_number) :-
  nl,
  write("Podaj numer reaktora do sprawdzenia: "), 
  nl.


user_message(q_are_there_errors) :-
  nl,
  write("Czy czujniki bezpieczeństwa zgłaszają jakieś błedy? (Y/N)"), 
  nl.


user_message(q_pipes_connections) :-
  nl,
  write("Wprowadź listę podłączeń rur do sprawdzenia: "),
  nl.


user_message(q_which_system) :-
  nl,
  write("Który system chciałbyś sprawdzić?"), nl,
  write("a) System chłodzenia"), nl,
  write("b) Prętów moderatora"),
  nl.


user_message(q_radiation) :-
  nl,
  write("Podaj poziom promieniowania: "), 
  nl.


user_message(q_coolant) :-
  nl,
  write("Czy do systemu chłodzenia wpompowano chłodziwo?"),
  nl.


user_message(q_coolant_quantity) :-
  nl,
  write("Jak dużo chłodziwa pozostało w reaktorze?"),
  nl.


user_message(q_coolant_quantity_in_warehouse) :-
  nl,
  write("Jak dużo chłodziwa pozostało na magazynie?"),
  nl.


user_message(q_humidity) :-
  nl,
  write("Czy poziom wilgotności na hali spełnia normy? (Y/N)"),
  nl.


user_message(q_water_spillage) :-
  nl,
  write("Czy na hali jest rozlana woda?"),
  nl.


user_message(q_cooling_diagnostics) :-
  nl,
  write("Czy chcesz dokonać diagnostyki systemu chłodzenia?"),
  nl.


user_message(q_dosimeter_or_reactor) :-
  nl,
  write("Molizwy wyciek lub uszkodenie dozymetru. Co chcesz sprawdzić? Dozymetr czy reaktor?"), 
  nl.

user_message(q_temperature_over_norm) :-
  nl,
  write("Czy czujniki temperatury zgłaszają podwyższoną temperaturę?"), 
  nl.

user_message(q_co2_is_present) :-
  nl,
  write("Czy czujniki dymu zgłaszają obecność CO2?"), 
  nl.

user_message(q_leak_from_control_rod) :-
  nl,
  write("Czy stwierdzono wyciek moderatora z prętów kontrolnych?"), 
  nl.

user_message(q_reactor_shielding_damaged) :-
  nl,f
  write("Czy osłona reaktora jest uszkodzona?"), 
  nl.

user_message(q_number_of_rods) :-
  nl,
  write("Podaj liczbę prętów: "), 
  nl.
% Tu niech przyjmuje string:
user_message(q_moderator_type) :-
  nl,
  write("Podaj typ moderatora: "),
  nl.

user_message(q_rods_level) :-
  nl,
  write("Podaj stopień wsunięcia pretów: "), 
  nl.


system_message(d_coolant_from_warehouse) :-
  nl,
  write("Uzupełnij poziom chłodziwa z magazynu."), 
  nl.

system_message(d_buy_coolant) :-
  nl,
  write("Brak odpowiedniej ilości chłodziwa w magazynie"),
  nl,
  write("Należy zakupić chłodziwo u autoryzowanego sprzedawcy"),
  % nl,
  % write("🤣🤣🤣🤣🤣🤣🤣🤣🤣🤣 "),
  nl.

system_message(d_system_ok) :-
  nl,
  write("System działa sprawnie i jest gotowy do działania."),
  nl.

system_message(d_pipe_error) :-
  nl,
  write("Złe podłączenie rur"),
  nl.

system_message(d_remove_water) :-
  nl,
  write("Należy oczyścić halę z wody."),
  nl.

system_message(d_rods_error) :-
  nl,
  write("Prawdopodbnie, żle założono pręty kontrolne."),
  nl,
  write("Należy przeprowadzić manualną diagnozę prętów.")
  nl.

system_message(d_rods_ok) :-
  nl,
  write("Pręty kontrolne zostały założone poprawnie."), nl
  write("Można uruchomić reaktor, ale zaleca się dalszą diagnostykę"),
  nl.
  

  system_message(d_reactor_damaged) :-
  nl,
  write("Doszło do uszkodzenia reaktora, a w natępstwie wycieku radioaktywnych substancji. Nie można uruchomić reaktora."), 
  nl.

system_message(d_fire) :-
  nl,
  write("Na hali jest pożar. Nie zaleca się uruchomienia reaktora."), 
  nl.


system_message(d_ok_but_careful) :-
  nl,
  write("Można uruchomić system aczkolwiek zalecana jest diagnostyka pozostałych systemów."),
  nl.


system_message(d_reactor_shield_damaged) :-
  nl,
  write("Należy natychmiast ewakuować halę."),
  nl.


system_message(d_unknown_reason) :-
  nl,
  write("Nieznana przyczyna, zalecane sprawdzenie przez technika"),
  nl.
