/*
 Reads user_input single line, until EOF (Ctrl-D), returns Line
 */
read_stream_single_line(Stream, Str) :-
    is_stream(Stream) ->
        read_string(Stream, "\n", "\r\t ", _, Str)
    ; type_error("Existing stream", Stream).

% TODO(11jolek11): Check if workon win11
/*
 Reads user_input single line, until EOF (Ctrl-D), returns Line
 */
read_stream_single_line(Str) :-
    read_stream_single_line(user_input, Str).

