defmodule Inmana.WelcomerTest do
  use ExUnit.Case, async: true

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user name is banana and the age is \"42\", returns a special message" do
      params = %{"name" => "banana", "age" => "42"}

      result = Welcomer.welcome(params)

      assert result == {:ok, "You are very special, banana"}
    end

    test "when the user age is at least \"18\", returns a standard message" do
      params = %{"name" => "joe", "age" => "18"}

      result = Welcomer.welcome(params)

      assert result == {:ok, "Welcome, joe"}
    end

    test "when the user age is under \"18\", returns an error message" do
      params = %{"name" => "brocolli", "age" => "10"}

      result = Welcomer.welcome(params)

      assert result == {:error, "You shall not pass, brocolli"}
    end
  end
end
