defmodule MyEnum do
    # Apply fnc to each element
    def each([], fnc), do: []
    def each([h|t], fnc) do
        [fnc.(h)|each(t, fnc)]
    end
    # Filter elements from list
    def filter([], fnc), do: []
    def filter([h|t], fnc) do
        if fnc.(h) do
            [h | filter(t, fnc)]
        else
            filter(t, fnc)
        end
    end

    # All? function from Enum module
    def all([], fnc), do: true
    def all([h|t], fnc) do
        if fnc.(h) do
            all(t, fnc)
        else
            false
        end
    end

#     take(collection, count)
    # Takes the first count items from the collection
    def take(list, count), do: _take(list, count, 0)

    def _take(_, count, count), do: []
    def _take([h|t], count, temp) do
        [h|_take(t, count, temp+1)]
    end

# Returns a collection of every nth item in the collection, starting with the first element
    def take_every(list, nth), do: _take_every(list, nth, 1)

    def _take_every([], _, _), do: []

    def _take_every([h|t], nth, temp) do
        if nth == temp do
            [h | _take_every(t, nth, 1)]
        else
            _take_every(t, nth, temp+1)
        end
    end

# take_while(collection, fun)

    def take_while([], fnc), do: []

    def take_while([h|t], fnc) do
        if fnc.(h) == true do
            [h | take_while(t, fnc)]
        else
            []
        end
    end

    # Split collection into two collections
    def split(collection, count), do: _split(collection, count, [])

    def _split(coll, 0, acc), do: {acc, coll}

    def _split([h|t], temp, acc) do
        _split(t, temp-1, acc ++ [h])
    end

end