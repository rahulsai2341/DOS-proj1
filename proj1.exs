defmodule VampireNumber.Boss do

  def work(args) do
    {x,""} = Integer.parse(Enum.at(args,0))
    {y,""} = Integer.parse(Enum.at(args,1))
    size = y-x
    batch_size = (y-x)/11000 |> ceil
    batches = Enum.chunk_every(x..y, batch_size)
    children = [
              {VampireServer, []}
            ]

    Supervisor.start_link(children, [strategy: :one_for_one, name: VampireNumber.Supervisor])
    {:ok, pid} = VampireServer.start_link([])
          tsks =   Enum.map( batches, fn each_list ->
                  task = Task.async(fn -> VampireNumber.getVampireNums(each_list) end) end)
            ls = Enum.map(tsks,  fn task -> Task.await(task, :infinity) end)
            Enum.each( ls, fn list -> if list != [] do VampireServer.store(pid, list) end
          end)


      list = GenServer.call(pid, {:getdata})
      VampireFormatter.format_output(list)
  end

  end
:observer.start()
VampireNumber.Boss.work(System.argv())
