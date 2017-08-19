module View exposing (view)

import UrlParser exposing (..)
import Bootstrap.Grid as Grid
import Bootstrap.Navbar as Navbar exposing (attrs)
import Bootstrap.Alert as Alert
import Bootstrap.Grid.Col as Col
import Types exposing (..)
import Html exposing (..)
import Html.Attributes as A exposing (id, class, href, src, style, title, alt, type_, scope)
import Html.Events exposing (onClick)
import I18Next exposing
      ( t
      , tr
      , Translations
      , Delims(..)
      , initialTranslations
      , fetchTranslations
      )
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
        item_links =
            case model.currentPage of
                HomeEn ->
                    en_menu model

                ScheduleEn ->
                    en_menu model

                AboutEn ->
                    en_menu model

                InstructorsEn ->
                    en_menu model

                ContactEn ->
                    en_menu model

                _ ->
                    jp_menu model

    in
        Navbar.config NavbarMsg
            |> Navbar.lightCustomClass "navbar-inverse"
            |> Navbar.withAnimation
            |> Navbar.collapseSmall
            |> Navbar.container
            |> Navbar.brand [ href "/" ] [
                img [ alt "", src "img/logo-nav.png" ][]
            ]
            |> Navbar.items item_links
            |> Navbar.customItems [ socialMenu ]
            |> Navbar.view model.navbarState


-- custom items/ right menu
socialMenu : Navbar.CustomItem msg
socialMenu =
    Navbar.customItem
        (Html.nav [ class "social-nav pull-right hidden-sm-down" ]
            [ Html.a [ href "http://facebook.com/ahimsayogajp" ]
                [ Html.i [ class "fa fa-facebook" ]
                    []
                ]
            , Html.a [ href "http://instagram.com/ahimsayogajp" ]
                [ Html.i [ class "fa fa-instagram" ]
                    []
                ]
            , Html.a [ href "http://twitter.com/ahimsayogajp" ]
                [ Html.i [ class "fa fa-twitter" ]
                    []
                ]
            , Html.a [ href "https://www.youtube.com/channel/UCihAjjXntS8Q-5a4wBIolgQ" ]
                [ Html.i [ class "fa fa-youtube" ]
                    []
                ]
            , Html.a [ href "mailto:miki@ahimsayoga.jp" ]
                [ Html.i [ class "fa fa-envelope" ]
                    []
                ]
            ]
        )


jp_menu : Model -> List (Navbar.Item Msg)
jp_menu model =
    [ Navbar.itemLink (linkAttrs About) [ text (t model.translations "nav.about") ]
    , Navbar.itemLink (linkAttrs Schedule) [ text (t model.translations "nav.schedule") ]
    , Navbar.itemLink (linkAttrs Instructors) [ text (t model.translations "nav.instructors") ]
    , Navbar.itemLink (linkAttrs Contact) [ text (t model.translations "nav.contact") ]
    ]

en_menu : Model -> List (Navbar.Item Msg)
en_menu model =
    [ Navbar.itemLink (linkAttrs AboutEn) [ text (t model.translations "nav.about") ]
    , Navbar.itemLink (linkAttrs ScheduleEn) [ text (t model.translations "nav.schedule") ]
    , Navbar.itemLink (linkAttrs InstructorsEn) [ text (t model.translations "nav.instructors") ]
    , Navbar.itemLink (linkAttrs ContactEn) [ text (t model.translations "nav.contact") ]
    ]

linkAttrs : Page -> List (Html.Attribute Msg)
linkAttrs page =
    let
        uri =
            case page of
                Home ->
                    "/#/home"

                HomeEn ->
                    "/#/en/home"

                Schedule ->
                    "/#/schedule"

                ScheduleEn ->
                    "/#/en/schedule"

                About ->
                    "/#/about"

                AboutEn ->
                    "/#/en/about"

                Instructors ->
                    "/#/instructors"

                InstructorsEn ->
                    "/#/en/instructors"

                Contact ->
                    "/#/contact"

                ContactEn ->
                    "/#/en/contact"
    in
        [ A.href <| uri ]


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
