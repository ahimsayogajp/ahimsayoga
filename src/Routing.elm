module Routing exposing (..)

import Navigation
import UrlParser as Url exposing ((</>), (<?>), s, int, stringParam, top)


-- type Route
--     = Home


type Route
  = Home
  | About
  | AboutEn


parse : Navigation.Location -> Maybe Route
parse location =
    Url.parseHash route location


-- route : Url.Parser (Route -> c) c
-- route =
--     Url.oneOf
--         [ Url.map Home <| Url.top
--         ]

-- URL PARSING

route : Url.Parser (Route -> a) a
route =
  Url.oneOf
    [ Url.map Home top
    , Url.map About (s "about")
    , Url.map AboutEn (s "en" </> s "about")
    ]

getLink : Route -> String
getLink route =
    case route of
        Home ->
            "#/home"
