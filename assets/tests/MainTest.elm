module MainTest exposing (suite)

import Main
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector exposing (text)


suite : Test
suite =
    describe "view"
        [ test "delights visitors" <|
            \_ ->
                Main.view ()
                    |> Query.fromHtml
                    |> Query.has [ text "Oh Goody!" ]
        ]
