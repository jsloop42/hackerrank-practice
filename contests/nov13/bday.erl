-module(bday).
-export([display_cost/1, compute_cost/1]).

% Saturday November 16 2013

display_cost(N) -> io:format("~p~n", [N]).

compute_cost(L) -> lists:sum(L)/2.

read_input(L) ->
    try
        case io:fread("", "~d") of
            eof ->
                display_cost(compute_cost(L)),
                ok;
            {ok, [N]} ->
                read_input([N|L])
        end
    catch
        error:{case_clause,{error,{fread, integer}}} -> read_input(L); % if input contains spaces
        error:_ -> read_input(L) % catch other error if any
    end.

main(_) ->
    _ = io:fread("", "~d"),
    read_input([]).
