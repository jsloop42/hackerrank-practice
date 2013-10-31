
% Friday 01 November 2013.

is_hr(L) ->
    case re:run(L, "hackerrank", [caseless]) of
        {match, [{_, 10}]} ->
            true;
        nomatch ->
            false;
        {_,_} ->
            false
    end.

read_input(C) ->
    case io:get_line("") of
        eof ->
            io:format("~p~n", [C]),
            ok;
        L ->
            case is_hr(string:strip(L--"\n")) of
                true -> 
                    read_input(C+1);
                false ->
                    read_input(C)
                end
    end.

main(_) ->
    _ = io:fread("", "~d"),
    read_input(0).
