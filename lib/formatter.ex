defmodule VampireFormatter do
  # Client API
  def format_output(list) do

    Enum.each( list, fn({n, vf}) -> op = format_output(n, vf)
      IO.puts op
     end)
  end

   def format_output(n, vf) do
        op = [n]
        op = Enum.join(Enum.reduce(vf, op, fn {x, y}, acc -> acc ++ [x] ++ [y] end), " ")
        op
    end
end
