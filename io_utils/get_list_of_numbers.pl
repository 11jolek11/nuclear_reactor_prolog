:- module(get_list_of_numbers, [
    read_stream_lines_as_integers/2,
    read_stream_lines_as_integers/1
    ])

/*
Convert list of strings in list of numbers
*/
strings_to_numbers([], []).
strings_to_numbers([Nh|Nt], [Sh|St]) :-
    number_string(Nh, Sh),
    strings_to_numbers(Nt, St).

/*
 Reads Stream line by line, until EOF (Ctrl-D), returns List of Lines and conf all to number
 */
read_stream_lines_as_integers(Stream, Numbers) :-
    is_stream(Stream) ->
        read_string(Stream, _, Str),
        split_string(Str, "\n", "\n", Lines),
    	strings_to_numbers(Numbers, Lines)
    ; type_error("Existing stream", Stream).

    /*
 Reads user_input line by line, until EOF (Ctrl-D), returns List of Lines and conv all to number
 */
read_stream_lines_as_integers(Lines) :-
    read_stream_lines(user_input, Lines).

