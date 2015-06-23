defmodule Comprehensions do
	@import MyLists
	def span_primes(n) do
		for x <- MyLists.span(2, n),
			y <- MyLists.span(2, div(x, 2)),
				rem(x, y) == 0,
				x != y, do: {x, y}
	end

end