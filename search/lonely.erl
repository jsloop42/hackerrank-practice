-module(lonely).
-export ([find_lonely/1]).

% Friday 01 November 2013

split(S, D) ->
    re:split(S, D, [{return,list}]).

find_lonely([]) -> [];
find_lonely([H|T])  ->
    case lists:member(H, T) of
        true ->
            find_lonely(T--[H]);
        false ->
            H
    end.

read_input() ->
    case io:get_line("") of
        eof ->
            ok;
        N ->
            X = find_lonely(split(string:strip(N--"\n"), " ")),
            io:format("~s~n", [X]),
            read_input()
    end.

main(_) ->
    _ = io:fread("", "~d"),
    read_input().
