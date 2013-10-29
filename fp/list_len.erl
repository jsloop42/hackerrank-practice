-module(list_len).
-export([main/0]).

% Tuesday 29 October 2013

len(A) -> 
    case io:fread("", "~d") of
        eof ->
            io:format("~p~n", [A]),
            ok;
        {ok, [N]} ->
            len(A+1)
    end.

main() -> len(0).
