module View exposing (view)

import Types exposing (..)
import Page exposing (..)
import Html exposing (..)


-- VIEW


view : Model -> Html Msg
view model =
    div []
        [
            render_page model
        ]
