module Routing exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)
import Types exposing (..)

-- ROUTING


route : Parser (Page -> a) a
route =
    oneOf
        [ UrlParser.map Home (UrlParser.s "home")
        , UrlParser.map Schedule (UrlParser.s "schedule")
        , UrlParser.map ScheduleEn (UrlParser.s "en" </> UrlParser.s "schedule")
        , UrlParser.map About (UrlParser.s "about")
        , UrlParser.map AboutEn (UrlParser.s "en" </> UrlParser.s "about")
        , UrlParser.map Instructors (UrlParser.s "instructors")
        , UrlParser.map InstructorsEn (UrlParser.s "en" </> UrlParser.s "instructors")
        , UrlParser.map Contact (UrlParser.s "contact")
        , UrlParser.map ContactEn (UrlParser.s "en" </> UrlParser.s "contact")
        ]


locFor : Location -> Msg
locFor location =
    parseHash route location
        |> GoTo
