-module(handshake).
-export([compute_handshake/1]).

% Monday 11 November 2013

display_output(N) -> io:format("~p~n", [N]).

compute_handshake(0) -> 0;
compute_handshake(N) -> 
    H = lists:foldl(fun(X,Y) -> X+Y end, 0, lists:seq(1,N-1)),
    display_output(H).


read_input() ->
    case io:fread("", "~d") of
        eof ->
            ok;
        {ok, [N]} ->
            compute_handshake(N),
            read_input()
    end.

main(_) ->
    _ = io:fread("", "~d"),
    read_input().
