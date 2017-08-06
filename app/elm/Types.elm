module Types exposing (..)

type Page
    = Home
    | About
    | AboutEn

type Msg
    = GoTo (Maybe Page)
    | LinkTo String

type alias Model =
    { currentPage : Page
    }
