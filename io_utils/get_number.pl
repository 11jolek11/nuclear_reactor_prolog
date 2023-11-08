use_module(library(readutil)). % Is it legal?

/*
Reads number from given Stream.

Streams in Prolog:
    user_input [0] - standard input device. Typically the console for environments that support consoles, e.g. Unix and the Windows console (old DOS box).
    user_output [1] - standard output device. Typically the console for environments that support consoles, e.g. Unix and the Windows console (old DOS box).
    user_error [2] - standard error device. Typically the console for environments that support consoles, e.g. Unix and the Windows console (old DOS box).
    user_function [3] - Optional application defined stream. Used for special applications that need to create custom Prolog streams.

Uses readutil module from swi-prolog.
*/
read_number_from_stream(N, Stream) :- 
    is_stream(Stream) -> % If Stream is a existing stream do smth
        read_line_to_codes(Stream, Codes),
        number_codes(N, Codes),
        !
    ; % Else
        type_error("Existing stream", Stream).



/*
Reads integer from given Stream
*/
read_integer_from_stream(N, Stream) :-
    read_number_from_stream(N, Stream),
    integer(N) -> true;
        type_error("Integer", N).

/*
Reads integer from standard (system) stream
*/
read_integer(N) :-
    read_integer_from_stream(N, user_input).

/*
Reads floats from given Stream
*/
read_float_from_stream(N, Stream) :-
    read_number_from_stream(N, Stream),
    float(N) -> true;
        type_error("Float", N).

/*
Reads float from standard (system) stream
*/
read_float(N) :-
    read_float_from_stream(N, user_input).

