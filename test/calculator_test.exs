defmodule Helloworld.CalculatorTest do
  use ExUnit.Case
  alias Helloworld.Calculator

  describe "add/2" do
    test "returns the sum when both arguments are integers" do
      assert Calculator.add(10, 5) == 15
      assert Calculator.add(-1, -1) == -2
    end

    test "returns an error tuple when any argument is not an integer" do
      assert Calculator.add(10, "5") == {:error, "Both inputs must be integers"}
      assert Calculator.add("10", 5) == {:error, "Both inputs must be integers"}
      assert Calculator.add(10.0, 5) == {:error, "Both inputs must be integers"}
      assert Calculator.add(10, 5.5) == {:error, "Both inputs must be integers"}
    end
  end
end
