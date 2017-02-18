defmodule MyMacro do

  defmacro operacion({:+, _contexto, [a,b]}) do
    quote do
      c=unquote(a)+unquote(b)
      IO.puts "#{unquote(a)} más #{unquote(b)} es igual a #{c}"
      c
    end
  end

  defmacro operacion({:*, _contexto, [a,b]}) do
    quote do
      c=unquote(a)*unquote(b)
      IO.puts "#{unquote(a)} por #{unquote(b)} es igual a #{c}"
      c
    end
  end
end
