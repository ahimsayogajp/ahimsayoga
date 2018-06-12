module Pages.Contact exposing (update)

import LangWidget exposing (..)
import Types exposing (..)
import Html exposing (..)
import Menu exposing (..)
import Footer exposing (..)
import Html as H exposing (Html, text, div, img)
import Html.Attributes as A exposing (id, class, href, src, style, title, alt, type_, scope)
import Bootstrap.Grid as Grid
import I18Next exposing (t)

update : Model -> Html Msg
update model =
    div []
        [ div [class "nav-wrapper nav", id "nav"] [render_menu model]
        , langswitcher model
        , Grid.container [] [ content model ]
        , render_footer model
        ]

content : Model -> Html Msg
content model =
    div []
        [
            H.section [ class "contact" ]
            [ div [ class "container" ]
                [ H.h2 [class "text-center"]
                [ text (t model.translations "contact.title") ]
                , H.address []
                [ H.p []
                    [ H.strong []
                    [ text (t model.translations "contact.location.title") ]
                    , H.br []
                    [] ,text (t model.translations "contact.location.address.line1")
                    , H.br []
                    [] ,text (t model.translations "contact.location.address.line2")
                    , H.br []
                    [] ,text (t model.translations "contact.location.address.line3")
                    ]
                , H.abbr [ title "Phone" ]
                    [ H.i [ class "fa fa-phone" ]
                    []
                    ]
                , H.a [ href "tel:+817044408396" ]
                    [ text "070-4440-8396" ]
                , H.br []
                    []
                , H.abbr [ title "Email" ]
                    [ H.i [ class "fa fa-envelope" ]
                    []
                    ]
                , H.a [ href "mailto:hello@ahimsayoga.jp" ]
                    [ text "hello@ahimsayoga.jp" ]
                ]
                , div [ id "map" ]
                []
                ]
            ]
        ]

