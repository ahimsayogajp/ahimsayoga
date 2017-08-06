module View exposing (view)

import Bootstrap.Grid as Grid
import Bootstrap.Navbar as Navbar
import Html exposing (Html, div, text)
import Html.Attributes exposing (class, href)
import Pages.Home
import Routing exposing (Route(..))
import Types exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ Grid.container [] [ navbar model ]
        , Grid.container [ class "spacer-12" ] [ content model ]
        ]


navbar : Model -> Html Msg
navbar model =
    Navbar.config NavbarMsg
        |> Navbar.withAnimation
        |> Navbar.brand [ href "#" ] [ text "Service Doc" ]
        |> Navbar.items
            [ Navbar.itemLink [ href <| Routing.getLink Home ] [ text "Home" ]
            , Navbar.itemLink [ href <| Routing.getLink Home ] [ text "Home again" ]
            ]
        |> Navbar.view model.navbar


content : Model -> Html Msg
content model =
    case model.subPage of
        HomePage pageModel ->
            Html.map HOmePageMsg <| Pages.Home.view pageModel
