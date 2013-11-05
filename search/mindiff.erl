-module(mindiff).
-export([diff/1, diff/2, disp/1]).

% Tuesday 05 November 2013

%-mode(compile).

diff(L) -> diff(L, []).

diff([_|[]], DTL) -> DTL;
diff([X,Y|T], DTL) ->
    %io:format("~p~n", [L]),
    Diff = abs(Y-(X)),
    diff([Y|T], [{Diff,[Y,X]}|DTL]).

disp([]) -> [];
disp(DTL) ->
    {Min,_} = lists:min(DTL),
    %io:format("~p~n",[Min]),
    L = proplists:get_all_values(Min, DTL),
    %io:format("~p~n",[L]),
    %io:format("~p~n",[L1]),
    %lists:map(fun(X) -> io:format("~s ", [integer_to_list(X)]) end, lists:flatten(L)).
    lists:map(fun(X) -> io:format("~s ", [integer_to_list(X)]) end, lists:reverse(lists:flatten(L))).

%read_input(Inp) ->
%    case io:fread("", "~d") of
%        eof ->
%            %io:format("~p~n", [lists:usort(Inp)]),
%            io:format("~p~n", [Inp]),
%            %Min = lists:min(lists:zipwith(fun(X,Y) -> abs(Y-(X)) end, Inp, tl(Inp)++[0])),
%            %DTL = diff(lists:usort(Inp)),
%            %KL = proplists:get_all_values(Min, DTL),
%            %io:format("~p~n", [DTL]),
%            %io:format("~p~n", [lists:min(DTL)]),
%            %disp(DTL),
%            ok;
%        {ok, [N]} ->
%            read_input([N|Inp]);
%        _ -> read_input(Inp)
%    end.

split(S, D) ->
    re:split(S, D, [{return,list}]).

read_input_str() ->
    case io:get_line("") of
        eof ->
            ok;
        N ->
            L = lists:map(fun(X) -> list_to_integer(X) end, split(string:strip(N--"\n"), " ")),
            %DTL = diff(lists:usort(split(string:strip(N--"\n"), " "))),
            DTL = diff(lists:usort(L)),
            %io:format("~p~n", [DTL]),
            disp(DTL)
    end.

main(_) ->
    _ = io:fread("", "~d"),
    %read_input([]).
    read_input_str().
