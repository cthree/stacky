defmodule Stack do
  use GenServer

  def start_link(initial_value) do
    GenServer.start_link(__MODULE__, List.wrap(initial_value))
  end

  def init(initial_value), do: {:ok, initial_value}

  def pop(stack_pid), do: GenServer.call(stack_pid, :pop)
  def push(stack_pid, value), do: GenServer.cast(stack_pid, {:push, value})

  def handle_call(:pop, _, stack) do
    {value, stack} = List.pop_at(stack, 0)
    {:reply, value, stack}
  end

  def handle_cast({:push, v}, stack), do: {:noreply, stack ++ [v]}
end