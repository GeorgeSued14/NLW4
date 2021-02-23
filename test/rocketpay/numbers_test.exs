defmodule Rocketpay.NumberTest do
  use ExUnit.Case

  alias Rocketpay.Number

  describe "sum_from_file/1" do
    test "when there is a file with the given name, returns the sum of numbers" do
      response = Number.sum_from_file("numbers")

      expected_response = {:ok, %{result: 37}}
      assert response == expected_response
    end

    test "when there is no file with the given name, returns an error" do
      response = Number.sum_from_file("banana")

      expected_response = {:error, "Invalid file!"}
      assert response == expected_response
    end
  end
end
