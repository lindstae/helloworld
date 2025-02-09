defmodule Helloworld.CalculatorServer do
  @moduledoc """
  A GenServer that encapsulates the calculator logic.

  Supports addition of two integers, with error handling for invalid inputs.

  ## Examples

      iex> Helloworld.CalculatorServer.start_link()
      {:ok, pid}

      iex> Helloworld.CalculatorServer.add(2, 3)
      5

      iex> Helloworld.CalculatorServer.add(2, "3")
      {:error, "Both inputs must be integers"}

      iex> Helloworld.CalculatorServer.crash()
      ** (RuntimeError) Intentional crash to test restart
  """

  use GenServer
  require Logger

  ## API

  @doc """
  Starts the CalculatorServer and registers it under the module name.
  """
  def start_link(_opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)

  end

  @doc """
  Returns the sum of two integers.

  Returns an error tuple if invalid inputs are provided.
  """
  def add(a, b) do
    GenServer.call(__MODULE__, {:add, a, b})
    Logger.info("This is an info message")
    Logger.debug("Debug information", module: __MODULE__)
  end

  @doc """
  Deliberately crashes the CalculatorServer for testing supervisor restarts.
  """
  def crash do
    GenServer.cast(__MODULE__, :crash)
  end

  ## Callbacks

  @impl true
  def init(:ok) do
    # No state is required for basic addition.
    {:ok, nil}
  end

  @impl true
  def handle_call({:add, a, b}, _from, state) when is_integer(a) and is_integer(b) do
    x = a + b
    Logger.info("The sum of #{a} and #{b} is #{x}")
    {:reply, a + b, state}
  end

  @impl true
  def handle_call({:add, _a, _b}, _from, state) do
    {:reply, {:error, "Both inputs must be integers"}, state}
  end

  @impl true
  def handle_cast(:crash, state) do
    # Purposefully crash the server.
    raise "Intentional crash to test restart"
    {:noreply, state}
  end
end
