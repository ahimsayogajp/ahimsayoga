module Pages.Schedule exposing (update)

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
        , Grid.container [] [ content model ]
        , render_footer model
        ]


content : Model -> Html Msg
content model =
    div []
        [
            H.section [ class "schedule", id "schedule" ]
            [ div [ class "container text-xs-center" ]
                [ H.h2 [class "text-center"]
                [ text (t model.translations "schedule.title") ]
                , div [ class "schedule-intro" ]
                [ H.p []
                    [ text (t model.translations "schedule.intro.p1")  ,H.a [ href "contact" ]
                    [ text (t model.translations "nav.contact") ] ,text (t model.translations "schedule.intro.p2")
                    ]
                ]
                , H.table [ class "table table-responsive" ]
                [ H.thead [ class "thead-default" ]
                    [ H.tr []
                    [ H.th []
                        [ text (t model.translations "schedule.locations.title") ]
                    , H.th []
                        [ text (t model.translations "schedule.days.mon") ]
                    , H.th []
                        [ text (t model.translations "schedule.days.tues") ]
                    , H.th []
                        [ text (t model.translations "schedule.days.wed") ]
                    , H.th []
                        [ text (t model.translations "schedule.days.thurs") ]
                    , H.th []
                        [ text (t model.translations "schedule.days.fri") ]
                    , H.th []
                        [ text (t model.translations "schedule.days.sat") ]
                    , H.th []
                        [ text (t model.translations "schedule.days.sun") ]
                    ]
                    ]
                , H.tbody []
                    [ H.tr []
                    [ H.th [ scope "row" ]
                        [ H.a [ href "http://ahimsayoga.jp/contact" ]
                        [ text (t model.translations "schedule.locations.ahimsa.title") ]
                        , H.br []
                        []
                        , H.span [ class "address" ]
                        [ text (t model.translations "schedule.locations.ahimsa.address") ]
                        ]
                    , H.td []
                        [ text "-" ]
                    , H.td []
                        [ text ("10am - 60" ++ (t model.translations "schedule.pricing.mins")) ]
                    , H.td []
                        [ text "-" ]
                    , H.td []
                        [ text ("7pm - 60" ++ (t model.translations "schedule.pricing.mins")) ]
                    , H.td []
                        [ text "-" ]
                    , H.td []
                        [ text "-" ]
                    , H.td []
                        [ text "-" ]
                    ]
                    , H.tr []
                    [ H.th [ scope "row" ]
                        [ H.a [ href "http://takigaharafarm.com" ]
                        [ text (t model.translations "schedule.locations.takigahara.title") ]
                        , H.br []
                        []
                        , H.span [ class "address" ]
                        [ text (t model.translations "schedule.locations.takigahara.address") ]
                        ]
                    , H.td []
                        [ text "-" ]
                    , H.td []
                        [ text "-" ]
                    , H.td []
                        [ text "-" ]
                    , H.td []
                        [ text "-" ]
                    , H.td []
                        [ text "-" ]
                    , H.td []
                        [ text ("10am - 60" ++ (t model.translations "schedule.pricing.mins")) ]
                    , H.td []
                        [ text "-" ]
                    ]
                    , H.tr []
                    [ H.th [ scope "row" ]
                        [ H.a [ href "https://goo.gl/maps/jhapfk1SZeE2" ]
                        [ text (t model.translations "schedule.locations.kiboagaoka.title") ]
                        , H.br []
                        []
                        , H.span [ class "address" ]
                        [ text (t model.translations "schedule.locations.kiboagaoka.address") ]
                        ]
                    , H.td []
                        [ text "-" ]
                    , H.td []
                        [ text "-" ]
                    , H.td []
                        [ text "-" ]
                    , H.td []
                        [ text "-" ]
                    , H.td []
                        [ text ("1:30pm & 7pm - 60" ++ (t model.translations "schedule.pricing.mins"))
                        ]
                    , H.td []
                        [ text "-" ]
                    , H.td []
                        [ text "-" ]
                    ]
                    ]
                ],
                H.h3 [class "class-cost-title"] [text (t model.translations "schedule.pricing.title")],
                div [class "class-cost"]
                    [   H.p [class "drop-in"] [
                            H.strong [] [text ((t model.translations "schedule.pricing.dropin") ++ ": ")],
                            text ("1,200円")
                        ],
                        H.p [class "monthly"] [
                            H.strong [] [text ((t model.translations "schedule.pricing.monthly") ++ ": ")],
                            text ("4 " ++ (t model.translations "schedule.pricing.classes")  ++ " - 4,000円")
                        ]
                    ]
                ]
            ]
        ]
