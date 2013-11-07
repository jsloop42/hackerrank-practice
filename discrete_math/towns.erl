% Thursday 07 November 2013

display_result(N) -> io:format("~p~n", [N]).

npath(L) -> display_result(lists:foldl(fun(X, Y) -> X*Y end, 1, L) rem 1234567).

split(S, D) ->
    re:split(S, D, [{return,list}]).

read_input() ->
    _ = io:get_line(""),
    case io:get_line("") of
        eof -> ok;
        N ->
            L = lists:map(fun(X) -> list_to_integer(X) end, split(string:strip(N--"\n"), " ")),
            npath(L),
            read_input()
    end.

main(_) ->
    {ok, _} = io:fread("", "~d"),
    read_input().
