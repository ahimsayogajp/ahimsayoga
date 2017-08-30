module LangWidget exposing (langswitcher)

import Types exposing (..)
import Html exposing (..)
import Html.Attributes as A exposing (id, class, href, src, style, title, alt, type_, scope)

langswitcher : Model -> Html Msg
langswitcher model =
    let
        switcher =
            case model.currentPage of
                Home ->
                    div [ class "lang-switcher" ]
                    [
                        Html.a [ class "active", href "/#" ]
                        [ text "日本語" ],
                        Html.a [ href "/#/en" ]
                        [ text "English" ]
                    ]
                HomeEn ->
                    div [ class "lang-switcher" ]
                    [
                        Html.a [ href "/#" ]
                        [ text "日本語" ],
                        Html.a [ class "active", href "/#/en" ]
                        [ text "English" ]
                    ]

                Schedule ->
                    div [ class "lang-switcher" ]
                    [
                        Html.a [ class "active", href "/#/schedule" ]
                        [ text "日本語" ],
                        Html.a [ href "/#/en/schedule" ]
                        [ text "English" ]
                    ]

                ScheduleEn ->
                    div [ class "lang-switcher" ]
                    [
                        Html.a [ href "/#/schedule" ]
                        [ text "日本語" ],
                        Html.a [ class "active", href "/#/en/schedule" ]
                        [ text "English" ]
                    ]

                About ->
                    div [ class "lang-switcher" ]
                    [
                        Html.a [ class "active", href "/#/about" ]
                        [ text "日本語" ],
                        Html.a [ href "/#/en/about" ]
                        [ text "English" ]
                    ]

                AboutEn ->
                    div [ class "lang-switcher" ]
                    [
                        Html.a [ href "/#/about" ]
                        [ text "日本語" ],
                        Html.a [ class "active", href "/#/en/about" ]
                        [ text "English" ]
                    ]

                Instructors ->
                    div [ class "lang-switcher" ]
                    [
                        Html.a [ class "active", href "/#/instructors" ]
                        [ text "日本語" ],
                        Html.a [ href "/#/en/instructors" ]
                        [ text "English" ]
                    ]

                InstructorsEn ->
                    div [ class "lang-switcher" ]
                    [
                        Html.a [ href "/#/instructors" ]
                        [ text "日本語" ],
                        Html.a [ class "active", href "/#/en/instructors" ]
                        [ text "English" ]
                    ]

                Contact ->
                    div [ class "lang-switcher" ]
                    [
                        Html.a [ class "active", href "/#/contact" ]
                        [ text "日本語" ],
                        Html.a [ href "/#/en/contact" ]
                        [ text "English" ]
                    ]

                ContactEn ->
                    div [ class "lang-switcher" ]
                    [
                        Html.a [ href "/#/contact" ]
                        [ text "日本語" ],
                        Html.a [ class "active", href "/#/en/contact" ]
                        [ text "English" ]
                    ]

    in
    div [ class "lang-switcher-wrapper" ] [
        switcher
    ]
