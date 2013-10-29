-module(filter).
-export([main/0]).    

% Tuesday 29 October 2013

filter(Delim) ->
    case io:fread("", "~d") of
        eof ->
            ok;
        {ok, [N]} when N < Delim ->
            io:format("~p~n", [N]),
            filter(Delim);
        {ok, [_]} -> filter(Delim)
    end.

main() -> 
    {ok, [Piv]} = io:fread("", "~d"),
    filter(Piv).
