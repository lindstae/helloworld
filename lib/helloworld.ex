defmodule Helloworld do
  @moduledoc """
  Documentation for `Helloworld`.
  """

  use Application


  @impl true
  def start(_type, _args) do
    children = [
      {Helloworld.CalculatorServer, []}
    ]

    opts = [strategy: :one_for_one, name: Helloworld.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @doc """
  Simple hello world function.
  """
  def hello do
    :world
  end
end
