module Types exposing (..)

import Bootstrap.Navbar as Navbar
import Navigation exposing (Location)
import Pages.Home
import Routing exposing (Route)


type Msg
    = NewUrl String
    | UrlChange Location
    | NavbarMsg Navbar.State
    | HomePageMsg Pages.Home.Msg


type alias Model =
    { currentLocation : Maybe Route
    , history : List Location
    , navbar : Navbar.State
    , subPage : Page
    }


type Page
    = HomePage Pages.Home.Model
