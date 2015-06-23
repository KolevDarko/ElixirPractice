defmodule MyLists do
	def square([]), do: []
	def square([head|tails]), do: [head*head | square(tails)]

	def map(_fnc, []), do: []
	def map(fnc, [head|tails]), do: [fnc.(head) | map(fnc, tails)]

	def mapsum(l, fnc), do: _mapsum(l, 0, fnc)

	def _mapsum([], acc, _fnc), do: acc
	def _mapsum([head | tails], acc, fnc) do
	  _mapsum(tails, acc + fnc.(head), fnc)
	end

	def max([head|tails]), do: _max([head|tails], head)
	
	def _max([], result), do: result

	def _max([head|tails], init) when head > init do
		_max(tails, head)
	end
	
	def _max([head|tails], init) do
		_max(tails, init)
	end

	def caesar([], _n), do: []
	
	def caesar([head|tails], n) when head + n > 'z' do
		[('a'-'z')+head+n | caesar(tails, n)]
	end
	
	def caesar([head|tails], n) do
		[head+n | caesar(tails, n)]
	end

	def span(from, to) do
		_span(from, to, to, [])
	end

	def _span(from, to, from, acc), do: [from|acc]

	def _span(from, to, current, acc) do
		_span(from, to, current - 1, [current | acc])
	end

end