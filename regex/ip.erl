-module(ip).
-export([is_ipv4/1, is_ipv6/1, main/1, compute_match/1, read_input/0]).

% Friday 01 November 2013 01:51 AM

is_ipv4(IP) ->
    Len = string:len(IP),
    case re:run(IP, "((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\.|$)){4}", [global]) of
        {match, [[{A, B}, {C, D}, {C, D}, {B, A}]]} ->
            if 
                A =:= 0 andalso B =< Len andalso Len =< 15 -> true;
                true -> false
            end;
        {match, [[{_, _}, _ , _ , _]]} ->
            false;
        nomatch ->
            false;
        _ ->
            false
    end.

is_ipv6(IP) ->
    Len = string:len(IP),
    case re:run(IP, "(?:[0-9a-f]{0,4}\:){7}[0-9a-f]{0,4}", [global]) of
        {match, [[{Begin, MLen}]]} ->
            if 
                Begin =:= 0 andalso MLen =:= Len andalso Len =< 39 -> true;
                true -> false
            end;
        nomatch ->
            false;
        {_,_} ->
            false
    end.

compute_match(IP) ->
    V4 = is_ipv4(IP),
    case V4 of
        true ->
            io:format("IPv4~n", []);
        false ->
            V6 = is_ipv6(IP),
            case V6 of
                true ->
                    io:format("IPv6~n", []);
                false ->
                    io:format("Neither~n", [])
            end
    end.

read_input() ->
    case io:get_line("") of
        eof ->
            ok;
        IP ->
            compute_match(string:strip(IP--"\n")),
            read_input()
    end.

main(_) ->
    _ = io:fread("", "~d"),
    read_input().
