module View exposing (view)

import Types exposing (..)
import Html exposing (..)
import Html.Events exposing (onClick)
import Pages.Home
import Pages.Schedule
import Pages.About
import Pages.Instructors
import Pages.Contact


-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "SPA application" ]
        , render_menu model
        , render_page model
        ]


render_menu : Model -> Html Msg
render_menu model =
    let
        menu_content =
            case model.currentPage of
                HomeEn ->
                    en_menu

                ScheduleEn ->
                    en_menu

                AboutEn ->
                    en_menu

                InstructorsEn ->
                    en_menu

                ContactEn ->
                    en_menu

                _ ->
                    jp_menu
    in
        div [] menu_content


jp_menu : List (Html Msg)
jp_menu =
    [
        button [ onClick (LinkTo "/#/home") ] [ text "Home" ]
        , button [ onClick (LinkTo "/#/schedule") ] [ text "Schedule" ]
        , button [ onClick (LinkTo "/#/about") ] [ text "About" ]
        , button [ onClick (LinkTo "/#/instructors") ] [ text "Instructors" ]
        , button [ onClick (LinkTo "/#/contact") ] [ text "Contact" ]
    ]

en_menu : List (Html Msg)
en_menu =
    [
        button [ onClick (LinkTo "/#/en/home") ] [ text "HomeEn" ]
        , button [ onClick (LinkTo "/#/en/schedule") ] [ text "ScheduleEn" ]
        , button [ onClick (LinkTo "/#/en/about") ] [ text "AboutEn" ]
        , button [ onClick (LinkTo "/#/en/instructors") ] [ text "InstructorsEn" ]
        , button [ onClick (LinkTo "/#/en/contact") ] [ text "ContactEn" ]
    ]


render_page : Model -> Html Msg
render_page model =
    let
        page_content =
            case model.currentPage of
                Home ->
                    Pages.Home.update model

                HomeEn ->
                    Pages.Home.update model

                Schedule ->
                    Pages.Schedule.update model

                ScheduleEn ->
                    Pages.Schedule.update model

                About ->
                    Pages.About.update model

                AboutEn ->
                    Pages.About.update model

                Instructors ->
                    Pages.Instructors.update model

                InstructorsEn ->
                    Pages.Instructors.update model

                Contact ->
                    Pages.Contact.update model

                ContactEn ->
                    Pages.Contact.update model
    in
        div [] [ page_content ]
