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

end