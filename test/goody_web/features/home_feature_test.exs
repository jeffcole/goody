defmodule GoodyWeb.HomeFeatureTest do
  use GoodyWeb.FeatureCase, async: true

  alias Wallaby.Query

  test "visitors have joy", %{session: session} do
    session
    |> visit("/")
    |> assert_has(Query.text("Oh Goody!"))
  end
end
