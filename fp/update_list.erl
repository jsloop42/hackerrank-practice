-module(update_list).
-export([main/0]).    

% Tuesday 29 October 2013

r(L) ->
    case io:fread("", "~d") of
        eof -> 
            ok;
        {ok, [N]} ->
            io:format("~p~n", [abs(N)]),
            r([N|L])
    end.

main() -> r([]).
