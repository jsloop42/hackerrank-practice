%-module(pan).
%-export([is_pan/1]).

% Friday 01 November 2013

is_pan(P) ->
    Len = string:len(P),
    case re:run(P, "([A-Z]){5}[0-9]{4}[A-Z]", [global]) of
        {match, [[{0, 10}, {4, 1}]]} when Len =:= 10 ->
            true;
        nomatch ->
            false;
        {_,_} ->
            false
    end.

compute_match(P) ->
    case is_pan(P) of
        true ->
            io:format("YES~n", []);
        false ->
            io:format("NO~n", [])
    end.

read_input() ->
    case io:get_line("") of
        eof ->
            ok;
        P ->
            compute_match(string:strip(P--"\n")),
            read_input()
    end.

main(_) ->
    _ = io:fread("", "~d"),
    read_input().
