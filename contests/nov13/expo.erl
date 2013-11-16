-module(expo).
-export([strings_to_integer/1, compute_mod_exp/2, display_result/1]).

% Modular Exponentiation.
% The highest time taken for a test case at hackerrank.com was 15.35s.
% Saturday 16 November 2013.

display_result(N) -> io:format("~p~n", [N]).

compute_mod_exp(Base, Exp) -> 
    crypto:bytes_to_integer(crypto:mod_pow(Base,Exp,trunc(math:pow(10,9)+7))).

tidy_string(Str) -> string:strip(Str--"\n").

strings_to_integer(SL) -> lists:map(fun(X) -> erlang:list_to_integer(X) end, SL).

read_input() ->
    try io:get_line("") of
        eof -> ok;
        L ->
            [B,E] = strings_to_integer(string:tokens(tidy_string(L), " ")),
            display_result(compute_mod_exp(B,E)),
            read_input()
    catch
        error:Any -> io:format("~p~n", [Any])
    end.

main(_) ->
    _ = io:get_line(""),
    read_input().
    
