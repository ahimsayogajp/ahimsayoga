module Page exposing (render_page)

import Routing exposing (..)
import Types exposing (..)
import Html exposing (..)
import Pages.Home
import Pages.Schedule
import Pages.About
import Pages.Instructors
import Pages.Contact

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
