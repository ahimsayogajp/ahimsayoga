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
    div []
        [ button [ onClick (LinkTo "/#/home") ] [ text "Home" ]
        , button [ onClick (LinkTo "/#/schedule") ] [ text "Schedule" ]
        , button [ onClick (LinkTo "/#/en/schedule") ] [ text "ScheduleEn" ]
        , button [ onClick (LinkTo "/#/about") ] [ text "About" ]
        , button [ onClick (LinkTo "/#/en/about") ] [ text "AboutEn" ]
        , button [ onClick (LinkTo "/#/instructors") ] [ text "Instructors" ]
        , button [ onClick (LinkTo "/#/en/instructors") ] [ text "InstructorsEn" ]
        , button [ onClick (LinkTo "/#/contact") ] [ text "Contact" ]
        , button [ onClick (LinkTo "/#/en/contact") ] [ text "ContactEn" ]
        ]


render_page : Model -> Html Msg
render_page model =
    let
        page_content =
            case model.currentPage of
                Home ->
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
