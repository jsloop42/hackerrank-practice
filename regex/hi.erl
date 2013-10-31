%-module(pan).
%-export([is_pan/1]).

% Friday 01 November 2013

is_hi(L) ->
    case re:run(L, "^hi [^d]", [global, caseless]) of
        {match, [[{0, 4}]]} ->
            true;
        nomatch ->
            false;
        {_,_} ->
            false
    end.

compute_match(L) ->
    case is_hi(L) of
        true ->
            io:format("~s~n", [L]);
        false ->
            ok
    end.

read_input() ->
    case io:get_line("") of
        eof ->
            ok;
        L ->
            compute_match(string:strip(L--"\n")),
            read_input()
    end.

main(_) ->
    _ = io:fread("", "~d"),
    read_input().
