-module(sum_odd).
-export([main/0]).

% Wednesday 30 October 2013

sum(Acc) ->
    case io:fread("", "~d") of
        eof ->
            io:format("~p~n", [Acc]),
            ok;
        {ok, [N]} when N rem 2 =/= 0 ->
            sum(Acc+(N));
        {ok, [_]} ->
            sum(Acc)
    end.

main() -> sum(0).
