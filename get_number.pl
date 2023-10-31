
/*
Reads number from given Stream.

Read bc it may be usefullllll for you Lukasz
https://www.amzi.com/manuals/amzi/pro/ref_io.htm


Streams in Prolog:
    user_input [0] - standard input device. Typically the console for environments that support consoles, e.g. Unix and the Windows console (old DOS box).
    user_output [1] - standard output device. Typically the console for environments that support consoles, e.g. Unix and the Windows console (old DOS box).
    user_error [2] - standard error device. Typically the console for environments that support consoles, e.g. Unix and the Windows console (old DOS box).
    user_function [3] - Optional application defined stream. Used for special applications that need to create custom Prolog streams. See Logic Server API for details. See note below as well.
*/
read_integer_from_stream(N, Stream) :- 
    read_line_to_codes(Stream, Codes),
    number_codes(N, Codes),
    !.

/*
Reads number from standard stream
*/
%TODO(11jolek11): Check if work under Windows
read_integer(N) :-
    read_integer_from_stream(N, user_input).

