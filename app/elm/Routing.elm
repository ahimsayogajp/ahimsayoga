module Routing exposing (..)

import Html exposing (..)
import Html.Attributes as A exposing (id, class, href, src, style, title, alt, type_, scope)
import Navigation exposing (Location)
import UrlParser exposing (..)
import Types exposing (..)

-- ROUTING


route : Parser (Page -> a) a
route =
    oneOf
        [ UrlParser.map Home (UrlParser.s "home")
        , UrlParser.map HomeEn (UrlParser.s "en" </> UrlParser.s "home")
        , UrlParser.map Schedule (UrlParser.s "schedule")
        , UrlParser.map ScheduleEn (UrlParser.s "en" </> UrlParser.s "schedule")
        , UrlParser.map About (UrlParser.s "about")
        , UrlParser.map AboutEn (UrlParser.s "en" </> UrlParser.s "about")
        , UrlParser.map Instructors (UrlParser.s "instructors")
        , UrlParser.map InstructorsEn (UrlParser.s "en" </> UrlParser.s "instructors")
        , UrlParser.map Contact (UrlParser.s "contact")
        , UrlParser.map ContactEn (UrlParser.s "en" </> UrlParser.s "contact")
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


locFor : Location -> Msg
locFor location =
    parseHash route location
        |> GoTo
