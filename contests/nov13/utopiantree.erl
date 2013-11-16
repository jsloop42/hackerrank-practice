-module(utopiantree).
-export([compute_growth/1, compute_growth_mem/1, display_result/1]).

% Saturday 16 November 2013
% Memoization function which is using process dictionary is slower than
% normal computation. The longest time in the hackerrank test case results was 1.36s.
% My test cases: (inputs separated by comma must actually be in new lines).
% Inputs:10,1000,5000,5500,6000,7000,8000,10000,15000,16000,18000
% Program was ran using escript and interpreted.
% +-------+-------+
% |normal |memoize|
% +-------+-------+
% | 4.265 | 6.047 |
% | 4.235 | 5.984 |
% | 4.250 | 5.969 |
% +-------+-------+
% Also the garbage collection kicks in during the end which counts to the total
% time. ETS would be a better choice.

display_result(N) -> io:format("~p~n", [N]).

compute_growth(0) -> 1;
compute_growth(Cycles) when Cycles rem 2 =:= 0 -> compute_growth(Cycles-1)+1;
compute_growth(Cycles) -> compute_growth(Cycles-1)*2.

save(Key, Value) -> put({utree, Key}, Value).
retrieve(Key) -> get({utree, Key}).

compute_growth_mem(0) -> 1;
compute_growth_mem(Cycles) when Cycles rem 2 =:= 0 -> compute_growth_mem(Cycles-1)+1;
compute_growth_mem(Cycles) ->
    case retrieve(Cycles) of
        undefined when Cycles rem 5000 =:= 0-> %save for multiples of 5000s only
            Growth = compute_growth_mem(Cycles-1)*2,
            save(Cycles,Growth),
            Growth;
        undefined -> compute_growth_mem(Cycles-1)*2;
        Val -> Val
    end.

read_input() ->
    try
        case io:fread("", "~d") of
            eof -> ok;
            {ok, [N]} ->
                %display_result(compute_growth_mem(N)),
                display_result(compute_growth(N)),
                read_input()
        end
    catch
        error:_ -> read_input()
    end.

main(_) ->
    _Tests = io:get_line(""),
    read_input().
