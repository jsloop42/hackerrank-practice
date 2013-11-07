% Thursday 07 November 2013
% pigeonhole principle

display_result(N) -> io:format("~p~n", [N]).

match_socks(P) -> display_result(P+1).

read_input() ->
    case io:fread("", "~d") of
        eof -> ok;
        {ok, [P]} -> 
            match_socks(P),
            read_input()
    end.

main(_) ->
    {ok, _} = io:fread("", "~d"),
    read_input().

