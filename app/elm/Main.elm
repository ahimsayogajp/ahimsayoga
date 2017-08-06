module Main exposing (main)

import App exposing (init, update, subscriptions)
import View exposing (view)
import Types exposing (..)
import Routing exposing (..)
import Navigation exposing (..)


-- Main


main : Program Never Model Msg
main =
    Navigation.program locFor
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
