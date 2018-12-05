-module(preq).

-type request() :: {Tag::atom(), mfargs()}.
-type mfargs() :: {Mod::module(), Fun::atom, Args::[term()]}.
-type result() :: {Tag::atom(), Res::term()}.

-spec execute(PreqPid::pid(), [request()]) -> {ok, [result()]}
                                             | {error, Reason}.

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, noargs, []).

execute(PreqPid, Requests) ->
    gen_server:call(execute).   

init(noargs) ->
    ok.

handle_call() ->
    ok.

handle_cast() ->
    ok.

handle_info() ->
    ok.