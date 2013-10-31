-module(lang).
-export([is_lang/1, read_input/0, split/2]).

% Friday 01 November 2013

split(S, D) ->
    re:split(S, D, [{return,list}]).

is_lang(L) -> lists:member(L,
          ['C','CPP','JAVA','PYTHON','PERL','PHP','RUBY','CSHARP','HASKELL',
           'CLOJURE','BASH','SCALA','ERLANG','CLISP','LUA','BRAINFUCK','JAVASCRIPT',
           'GO','D','OCAML','R','PASCAL','SBCL','DART','GROOVY','OBJECTIVEC']).

read_input() ->
    case io:get_line("") of
        eof ->
            ok;
        L ->            
            [S] = tl(split(string:strip(L--"\n"), " ")),
            LA = list_to_atom(S),
            case is_lang(LA) of
                true -> 
                    io:format("VALID~n", []),
                    read_input();
                false ->
                    io:format("INVALID~n", []),
                    read_input()
                end
    end.

main(_) ->
    _ = io:fread("", "~d"),
    read_input().
