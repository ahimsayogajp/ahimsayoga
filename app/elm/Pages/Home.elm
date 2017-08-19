module Pages.Home exposing (update)

import Types exposing (..)
import Html as H exposing (Html, text, div, img)
import Menu exposing (..)
import Html.Attributes as A exposing (id, class, href, src, style, title, alt, type_, scope)
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import I18Next exposing (t)

update : Model -> Html Msg
update model =
    div []
        [ content model
        , div [class "nav-wrapper nav", id "nav"] [render_menu model]
        ]

content : Model -> Html Msg
content model =
    div []
        [ Grid.simpleRow
            [ Grid.col
                [ Col.lg12, Col.attrs ([ A.class "box text-center" ]) ]
                [ H.section [ class "hero" ]
                    [ div [ class "container text-xs-center" ]
                        [ div [ class "row" ]
                        [ div [ class "col-md-12" ]
                            [ H.a [ class "hero-brand", href "/", title "Home" ]
                            [ img [ alt "Bell Logo", src "img/logo.png" ]
                                []
                            ]
                            ]
                        ]
                        , div [ class "container justify-content-center" ]
                        [ H.h1 []
                            [ text "Shivam Yoga Center" ]
                        , H.p [ class "location" ]
                            [ text "Kanazawa 金沢 & Komatsu 小松" ]
                        , H.p [ class "tagline" ]
                            [ text (t model.translations "home.intro") ]
                        , H.a [ class "btn btn-full", href "/#/schedule" ]
                            [ text "スケジュール" ]
                        , H.a [ class "btn btn-full", href "/#/en/schedule" ]
                            [ text "Schedule" ]
                        ]
                        ]
                    ]
                ]
            ]
        ]
