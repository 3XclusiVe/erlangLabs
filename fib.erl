-module(fib).
-export([fib_p/1]).
-export([fib_g/1]).
-export([tail_fib/1]).


fib_p(0) -> 0;
fib_p(1) -> 1;
fib_p(N) -> fib_p(N-1) + fib_p(N-2).

fib_g(N) when N == 0 -> N;
fib_g(N) when N == 1 -> N;
fib_g(N) -> fib_g(N-1) + fib_g(N-2).


tail_fib(0) -> 0;
tail_fib(1) -> 1; 
tail_fib(N) -> private_tail_fib(0, 1, 2, N).

private_tail_fib(Previous, Current, End, N) 
	when End >= N -> Previous + Current;
private_tail_fib(Previous, Current, End, N) ->
	private_tail_fib(Current, Previous + Current, End + 1, N).

