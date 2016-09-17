-module(gcd).
-export([gcd/2]).

% Saturday, 17 September 2016

gcd(A, B) when A =:= B -> A;
gcd(A, B) when A > B -> gcd(A-B, B);
gcd(A, B) -> gcd(A, B-A).

read_input() ->
    case io:get_line("") of
        eof ->
            ok;
        N ->
            [H|T] = lists:map(fun(X) -> 
                    {Int, _} = string:to_integer(X), 
                    Int 
                end, 
                string:tokens(N, " ")),
            io:format("~p", [gcd(H, hd(T))])
    end.

main(_) ->
    read_input().
