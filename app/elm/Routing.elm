module Routing exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)
import Types exposing (..)

-- ROUTING


route : Parser (Page -> a) a
route =
    oneOf
        [ UrlParser.map Home (UrlParser.s "home")
        , UrlParser.map About (UrlParser.s "about")
        , UrlParser.map AboutEn (UrlParser.s "en" </> UrlParser.s "about")
        ]


locFor : Location -> Msg
locFor location =
    parseHash route location
        |> GoTo
