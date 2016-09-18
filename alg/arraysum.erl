-module(arraysum).
-export([main/0]).

% Sunday, 18 September 2016

sum(L) -> lists:sum(L).

read_input() ->
    case io:get_line("") of
        eof ->
            ok;
        N ->
            L = lists:map(fun(X) -> 
                    {Int, _} = string:to_integer(X), 
                    Int 
                end, 
                string:tokens(N, " ")),
            io:format("~p", [sum(L)])
    end.

main() ->
    _ = io:fread("", "~d"),
    read_input().