defmodule Comprehensions do
	@import MyLists
	def span_primes(n) do
		for nn <- MyLists.span(1, n),
            Set.member?((for x <- MyLists.span(2, n),
                    y <- MyLists.span(1, div(x, 2)),
                    rem(x, y) == 0, x != y, y != 1,
                    into: HashSet.new, do: x), nn) == false,
            do: nn
	end


    def is_prime(1), do: true
    def is_prime(2), do: true
    def is_prime(3), do: true
    def is_prime(x) do
        results = for y <- MyLists.span(2, div(x, 2)), rem(x, y) == 0, do: y
        if length(results) == 0 do
            true
        else
            false
        end
    end
end