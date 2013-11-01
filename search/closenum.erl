-module(closenum).
-export([unique/2, permute_pairs/2, diff_pairs/1, diff_pairs/3, lowest_diff/1]).

% Saturday 02 November 2013.
% This is a working program. But it computes all pairs. However we do not have to 
% compute pairs. Instead sort the list and find the difference of nth with (n-1)th
% element. See mindiff for an optimized version instead.

%-mode(compile).
%-compile({inline, [s/1]}).

s([X, Y]) when X > Y -> [Y, X];
s(L) -> L.

diff_pairs(L) -> diff_pairs(L, [], []).
diff_pairs([], DTL, DL) -> {DTL, DL};
diff_pairs(L, DTL, DL) ->
    [A,B] = hd(L),
    {X,[]} = string:to_integer(A),
    {Y,[]} = string:to_integer(B),
    %io:format("~p ~p~n", [X, Y]),
    %using abs so that we get the least difference and not minmum, considering negative numbers
    Diff = abs(Y-(X)), 
    diff_pairs(tl(L), [{Diff,[X,Y]}|DTL], [Diff|DL]).

%unique(L) -> unique(L, []).

unique([], UL) -> UL;
unique([H|T], UL) ->
    case lists:member(H,T) of
        true ->
            unique(T, UL);
        false ->
            unique(T, [H|UL])
    end;

% List of lists
%unique(L, UL) ->
%    [X,Y] = hd(L),
%    case lists:member([Y,X], L) of
%        true ->
%            unique(L--[[Y,X]], [[X,Y]|UL]);
%        false ->
%            unique(tl(L), UL)
%    end.

unique(L, UL) ->
    [X,Y] = hd(L),
    case lists:member([Y,X], L) of
        true ->
            unique(tl(L), [[Y,X]|UL]);
        false ->
            unique(tl(L), UL)
    end.

% http://stackoverflow.com/q/19741294/235273
uniq(L, Alg) ->
    case Alg of
        v1 ->
            erase(),
            [put(s(K), ok) || K <- L],
            [K || {K, _} <- erase() ];
        v2 ->
            sets:to_list(sets:from_list([s(K) || K <- L]));
        v3 ->
            T = ets:new(set, [private, set]),
            ets:insert(T, [{s(K)} || K <- L]),
            R = [K || {K} <- ets:tab2list(T)],
            ets:delete(T),
            R;
        v4 ->
            lists:usort([s(K) || K <- L])
    end.

permute_pairs(Lst, Alg) ->
    case Alg of
        unique ->  % too slow
            unique([[X,Y] || X <- Lst, Y <- Lst, X =/= Y], []);
        usort ->
            P = [[X,Y] || X <- Lst, Y <- Lst, X =/= Y],
            lists:usort([lists:sort(X) || X <- P]);
        usort1 ->
            [[X,Y] || X <- Lst, Y <- Lst, X > Y];
        diff ->
            [[X,Y] || X <- Lst, Y <- Lst, X =/= Y];
        v1 ->
            uniq([[X,Y] || X <- Lst, Y <- Lst, X =/= Y], v1);
        v2 ->
            uniq([[X,Y] || X <- Lst, Y <- Lst, X =/= Y], v2);
        v3 ->
            uniq([[X,Y] || X <- Lst, Y <- Lst, X =/= Y], v3);
        v4 ->
            uniq([[X,Y] || X <- Lst, Y <- Lst, X =/= Y], v4)
    end.

split(S, D) ->
    re:split(S, D, [{return,list}]).

%display_num(Min, L) ->
%    display_num(Min, L, []).
%
%display_num(_, [], DL) ->
%    L = lists:sort(unique(lists:flatten(DL))),
%    lists:map(fun(X) -> io:format("~s ", [integer_to_list(X)]) end, L),
%    ok;   
%display_num(Min, L, DL) ->
%    try
%        [{Min, [X,Y]}] = hd(L),
%        display_num(Min, tl(L), [[Y,X]|[DL]])
%    catch
%        _:_ -> 
%        display_num(Min, tl(L), DL)
%    end.

lowest_diff(L) ->
    UL = permute_pairs(lists:sort(L), usort1), %calling with unique is slower
    %io:format("len: ~p~n", [length(UL)]),
    {DTL, DL} = diff_pairs(UL),    
    Min = lists:min(DL),
    %io:format("~p~n", [DTL]),
    %io:format("~nMin: ~p~n", [Min]),
    KL = proplists:get_all_values(Min, DTL),
    %io:format("~p~n", [lists:usort(lists:flatten(KL))]).
    SL = lists:usort(lists:flatten(KL)),
    lists:map(fun(X) -> io:format("~s ", [integer_to_list(X)]) end, SL).

read_input() ->
    case io:get_line("") of
        eof ->
            ok;
        N ->
            lowest_diff(split(string:strip(N--"\n"), " "))
    end.

main(_) ->
    _ = io:fread("", "~d"),
    read_input().
