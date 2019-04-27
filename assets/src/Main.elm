module Main exposing (main, view)

import Browser
import Html exposing (Html, h1, text)


main : Program () () msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


init : ()
init =
    ()


update : msg -> model -> ()
update msg model =
    ()


view : model -> Html msg
view model =
    h1 []
        [ text "Oh Goody!"
        ]
