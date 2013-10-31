-module(trig).
-export([s/1,c/1,d/1,t/2]).

% Friday, 01 November 01 2013
d(S)->io:format("~p~n",[t(S,3)]).
t(F,N)->P=math:pow(10,N),trunc(F*P)/P.
p(X,N)->math:pow(X,N).
s(X)->X-p(X,3)/6+p(X,5)/120-p(X,7)/5040+p(X,9)/362880.
c(X)->1-p(X,2)/2+p(X,4)/24-p(X,6)/720+p(X,8)/40320.
o(N)->d(s(N)), d(c(N)).
r()->case io:fread("", "~s") of eof->ok;{ok,[N]}->case string:to_float(N) of
{Z,[]}->o(Z),r();{error, no_float}->{Z,_}=string:to_integer(N),o(Z),r()end end.    
main(_)->_=io:get_line(""),r().
