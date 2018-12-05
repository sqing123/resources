%%
-module(compute).

-export([multiply/2]).

%% Return behaviour of compute based on a probability P

action(P) when P > 90 ->
    crash;

action(P) when P >= 80 andalso P =< 90 ->
    fast;

action(_) ->
    {slow, rand:uniform(5)}.


compute({slow, N}, Fun) ->
    timer:sleep(N * 1000),
    Fun();

compute(fast, Fun) ->
    Fun();

compute(crash, Fun) ->
    throw({blew_up, Fun()}).

%%
%% multiply two numbers that crashes or takes seconds to compute some
%% of the time.
%%
multiply(X, Y) ->
    Probability = rand:uniform(100),
    compute(action(Probability), fun() -> X * Y end).