defmodule Inmana.RestaurantTest do
  alias Ecto.Changeset
  use Inmana.DataCase, async: true, async: true
  alias Inmana.Restaurant

  describe "changeset/1" do
    test "when all params are valid, resturns a valid changeset" do
      params = %{name: "Siri-cascudo", email: "siri-siri@cascudo.com"}

      response = Restaurant.changeset(params)

      assert %Changeset{
               changes: %{name: "Siri-cascudo", email: "siri-siri@cascudo.com"},
               valid?: true
             } = response
    end

    test "when there are invalid params, resturns an invalid changeset" do
      params = %{name: "S", email: ""}

      response = Restaurant.changeset(params)
      expected = %{email: ["can't be blank"], name: ["should be at least 2 character(s)"]}

      assert %Changeset{
               valid?: false
             } = response

      assert errors_on(response) == expected
    end
  end
end
