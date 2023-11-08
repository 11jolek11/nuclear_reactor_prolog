:- module(get_list, [
    read_stream_lines/2,
    read_stream_lines/1
]).


/*
Reads entire Stream, stop on the end of stream (EOF symbol)
*/
%read_stream(Stream, []) :-
%    at_end_of_stream(Stream).

/*
Reads entire Stream and return a list
*/
%read_stream(Stream, [H| T]) :-
%    \+ at_end_of_stream(Stream),
%    read(Stream, H),
%    read_stream(Stream,L).

/*
Reads entire stdin, stop on the end of stream (EOF symbol of Ctrl+D)
*/
%read_stream(Stream, []) :-
%    at_end_of_stream(user_input).

/*
Reads entire stdin and return a list
*/
%read_stream([H| T]) :-
%    \+ at_end_of_stream(user_input),
%    read(user_input, H),
%    read_stream(user_input,L).

% TODO(11jolek11): Check if workon win11
/*
 Reads Stream line by line, until EOF (Ctrl-D), returns List of Lines
 */
read_stream_lines(Stream, Lines) :-
    is_stream(Stream) ->
        read_string(Stream, _, Str),
        split_string(Str, "\n", "\n", Lines)
    ; type_error("Existing stream", Stream).

% TODO(11jolek11): Check if workon win11
/*
 Reads user_input line by line, until EOF (Ctrl-D), returns List of Lines
 */
read_stream_lines(Lines) :-
    read_stream_lines(user_input, Lines).

