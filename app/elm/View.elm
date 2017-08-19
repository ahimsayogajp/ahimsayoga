module View exposing (view)

import Types exposing (..)
import Menu exposing (..)
import Page exposing (..)
import Html exposing (..)


-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "SPA application" ]
        , render_menu model
        , render_page model
        ]
