defmodule Helloworld.CalculatorServerTest do
  use ExUnit.Case
  alias Helloworld.CalculatorServer

  setup do
    # Falls der CalculatorServer noch nicht gestartet wurde (beispielsweise in der Testumgebung),
    # wird er hier gestartet. Andernfalls wird der vorhandene Prozess genutzt.
    if Process.whereis(CalculatorServer) == nil do
      start_supervised!({CalculatorServer, []})
    end
    :ok
  end

  describe "add/2" do
    test "returns the sum when both inputs are integers" do
      assert CalculatorServer.add(10, 5) == 15
      assert CalculatorServer.add(0, 0) == 0
      assert CalculatorServer.add(-5, 3) == -2
    end

    test "returns an error tuple when any argument is not an integer" do
      assert CalculatorServer.add(10, "5") == {:error, "Both inputs must be integers"}
      assert CalculatorServer.add("10", 5) == {:error, "Both inputs must be integers"}
      assert CalculatorServer.add(10.0, 5) == {:error, "Both inputs must be integers"}
    end
  end
end
