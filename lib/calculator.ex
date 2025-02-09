defmodule Helloworld.Calculator do
  @moduledoc """
  A simple calculator module for arithmetic operations.

  Currently supports addition of two integers.

  ## Examples

      iex> Helloworld.Calculator.add(2, 3)
      5

      iex> Helloworld.Calculator.add(2, "x")
      {:error, "Both inputs must be integers"}
  """

  @doc """
  Returns the sum of two integers.

  If either argument is not an integer, returns an error tuple.

  ## Examples

      iex> Helloworld.Calculator.add(10, 5)
      15

      iex> Helloworld.Calculator.add(10, "5")
      {:error, "Both inputs must be integers"}
  """
  def add(a, b) when is_integer(a) and is_integer(b) do
    a + b
  end

  def add(_, _) do
    {:error, "Both inputs must be integers"}
  end
end
