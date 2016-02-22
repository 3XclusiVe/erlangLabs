-module(mobius).
-export([is_prime/1]).
-export([prime_factors/1]).
-export([is_square_multiple/1]).
-export([find_square_multiples/2]).

is_prime(N) -> 
private_is_prime(N, trunc(math:sqrt(N))).

private_is_prime(1, _) -> true;
private_is_prime(2, _) -> true;
private_is_prime(_, 1) -> true;
private_is_prime(N, Devider) ->
	if
		N rem Devider == 0 -> false;
		N rem Devider /= 0 -> private_is_prime(N, Devider - 1)
	end.

prime_factors(N) ->
private_prime_factors(N, [], 2).

private_prime_factors(1, [], _) -> [1];
private_prime_factors(1, NumberList, _) -> NumberList;
%private_prime_factors(N, NumberList, N) -> NumberList ++ [N];
private_prime_factors(N, NumberList, Devider) -> 
	if
		N rem Devider == 0 -> 
		private_prime_factors(N div Devider, NumberList ++ [Devider], 2);
		N rem Devider /= 0 -> 
		private_prime_factors(N, NumberList, Devider + 1)
	end.

is_square_multiple(N) ->
	List = prime_factors(N),
	erlang:length(List) /= sets:size(sets:from_list(List)).
	

find_square_multiples(Count, MaxNumber) -> 
private_find_square_multiples(Count, 2, MaxNumber, 0).

private_find_square_multiples(Count, CurrentNumber, _, Count) -> CurrentNumber - Count;
private_find_square_multiples(Count, CurrentNumber, MaxNumber, _) 
	when CurrentNumber >= MaxNumber + Count -> fail; 
private_find_square_multiples(Count, CurrentNumber, MaxNumber, CurrentCount) ->
case is_square_multiple(CurrentNumber) of
	true -> private_find_square_multiples(Count, CurrentNumber + 1, MaxNumber, CurrentCount + 1);
	false -> private_find_square_multiples(Count, CurrentNumber + 1, MaxNumber, 0)
end.


