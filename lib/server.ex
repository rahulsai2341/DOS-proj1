defmodule VampireServer do
  use GenServer

  def start_link(number_list) do
    GenServer.start_link(__MODULE__, number_list)
  end

  # Server API
  def handle_call({:getdata}, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:store, number_list}, state) do
    state = state ++ number_list
    {:noreply, state}
  end

  def init(number_list) do
    {:ok, []}
  end

  def store(pid, list) do
    GenServer.cast(pid, {:store, list})
  end

end

# Get fangs for a given number
defmodule VampireNumber do
    def getfangs(n) do
        if rem(getlength(n), 2) == 1 do
            {:not_vampire, n}
        else
            half_length = div(getlength(n), 2)
            sorted = Enum.sort(String.codepoints("#{n}"))
            fangs = Enum.filter(factor_pairs(n), fn {a, b} ->
            getlength(a) == half_length && getlength(b) == half_length &&
            Enum.count([a, b], fn x -> rem(x, 10) == 0 end) != 2 &&
            Enum.sort(String.codepoints("#{a}#{b}")) == sorted
            end)
            if fangs==[] do
              {:not_vampire,n}
            end
            {:vampire, fangs}
        end
    end

    def factor_pairs(n) do
        beginnum = trunc(n / :math.pow(10, div(getlength(n), 2)))
        endnum  = :math.sqrt(n) |> round
        for i <- beginnum .. endnum, rem(n, i) == 0, do: {i, div(n, i)}
    end

    def getlength(n), do: length(to_charlist(n))

    def getVampireNums(number_list) do
      result = []
      result = for number <- number_list do
        result = case VampireNumber.getfangs(number) do
          {:not_vampire, number} ->nil
          {:vampire, []} -> nil
          {:vampire, fangs} -> result = result ++ fangs
            {number, fangs}
        end
      end
      filtered_op = Enum.filter(result, &!is_nil(&1))
      filtered_op
    end
end
