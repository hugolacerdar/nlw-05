defmodule InmanaWeb.RestaurantsViewTest do
  use InmanaWeb.ConnCase, async: true
  alias Inmana.Restaurant
  alias InmanaWeb.RestaurantsView
  import Phoenix.View

  describe "render/2" do
    test "renders create.json" do
      params = %{name: "Siri-cascudo", email: "siri-siri@cascudo.com"}

      {:ok, restaurant} = Inmana.create_restaurant(params)

      response = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
               message: "Restaurant created!",
               restaurant: %Restaurant{
                 email: "siri-siri@cascudo.com",
                 id: _id,
                 inserted_at: _inserted_at,
                 name: "Siri-cascudo",
                 updated_at: _updated_at
               }
             } = response
    end
  end
end
