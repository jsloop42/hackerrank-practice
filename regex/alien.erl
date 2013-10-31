-module(alien).
-export([is_name/1]).

% Friday 01 November 01 2013.

is_name(S) ->
    Len = string:len(S),
    case re:run(S, "[_|\.][0-9]+[a-zA-Z]*_?", [global]) of
        {match, [[{0, L}]]} when L =:= Len ->
            true;
        nomatch ->
            false;
        {_,_} ->
            false
    end.

read_input() ->
    case io:get_line("") of
        eof ->
            ok;
        L ->
            case is_name(string:strip(L--"\n")) of
                true -> 
                    io:format("VALID~n", []),
                    read_input();
                false ->
                    io:format("INVALID~n", []),
                    read_input()
                end
    end.

main(_) ->
    _ = io:fread("", "~d"),
    read_input().
