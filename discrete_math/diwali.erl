-module(diwali).
-export([pow/2, prod/3]).

% Sunday 10 November 2013

pow(N, Ex) -> prod(N, Ex, 1).

prod(_, 0, Acc) -> Acc;
prod(N, Ex, Acc) -> prod(N, Ex-1, Acc*N).

display_output(N) -> io:format("~p~n", [N rem pow(10,5)]).

compute_light_comb(N) -> display_output(pow(2, N)-1).

read_input() ->
    case io:fread("", "~d") of
        eof ->
            ok;
        {ok, [N]} ->
            compute_light_comb(N),
            read_input();
        _ ->
            read_input()
    end.

main(_) ->
    _ = io:fread("", "~d"),
    read_input().
