module LangWidget exposing (langswitcher)

import Types exposing (..)
import Html exposing (..)
import Html.Attributes as A exposing (id, class, href, src, style, title, alt, type_, scope)

langswitcher : Model -> Html Msg
langswitcher model =
    div [ class "lang-switcher-wrapper" ] [
        div [ class "lang-switcher" ]
        [
            Html.a [ href "/#/schedule" ]
            [ text "日本語" ],
            Html.a [ href "/#/en/schedule" ]
            [ text "English" ]
        ]
    ]
