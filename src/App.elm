module App exposing (init, update, subscriptions)

import Bootstrap.Navbar as Navbar
import Navigation exposing (Location)
import Pages.Home
import Routing exposing (Route(..))
import Types exposing (..)


-- init : Location -> ( Model, Cmd Msg )
-- init location =
--     let
--         ( navbarState, navbarCmd ) =
--             Navbar.initialState NavbarMsg

--         currentLocation =
--             Routing.parse location

--         ( page, pageCmd ) =
--             pageFromRoute currentLocation Nothing
--     in
--         { currentLocation = currentLocation
--         , history = []
--         , navbar = navbarState
--         , subPage = page
--         }
--             ! [ navbarCmd
--               , pageCmd
--               ]

init : Navigation.Location -> ( Model, Cmd Msg )
init location =
  ( Model [Url.parseHash route location]
  , Cmd.none
  )


pageFromRoute : Maybe Route -> Maybe Route -> ( Page, Cmd Msg )
pageFromRoute route lastRoute =
    case route of
        Just Home ->
            homePage Nothing

        Nothing ->
            homePage Nothing


homePage : ( Page, Cmd Msg )
homePage =
    let
        ( pageModel, pageCmd ) =
            Pages.Home.init
    in
        ( HomePage pageModel, Cmd.map HomePageMsg pageCmd )


-- update : Msg -> Model -> ( Model, Cmd Msg )
-- update msg model =
--     case msg of
--         NewUrl url ->
--             model ! [ Navigation.newUrl url ]

--         UrlChange location ->
--             let
--                 currentLocation =
--                     Routing.parse location

--                 ( page, cmd ) =
--                     pageFromRoute currentLocation model.currentLocation
--             in
--                 { model
--                     | history = location :: model.history
--                     , currentLocation = currentLocation
--                     , subPage = page
--                 }
--                     ! [ cmd ]

--         NavbarMsg state ->
--             { model | navbar = state } ! []

--         HomePageMsg pageMsg ->
--             case model.subPage of
--                 HomePage pageModel ->
--                     let
--                         ( pageModel_, pageCmd ) =
--                             Pages.Home.update pageMsg pageModel
--                     in
--                         { model | subPage = HomePage pageModel_ }
--                             ! [ Cmd.map HomePageMsg pageCmd ]

--                 _ ->
--                     model ! []

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NewUrl url ->
      ( model
      , Navigation.newUrl url
      )

    UrlChange location ->
      ( { model | history = Url.parseHash route location :: model.history }
      , Cmd.none
      )


-- subscriptions : Model -> Sub Msg
-- subscriptions model =
--     let
--         homeSub =
--             case model.subPage of
--                 HomePage subModel ->
--                     Sub.map HomePageMsg <| Pages.Home.subscriptions subModel

--                 _ ->
--                     Sub.none
--     in
--         Sub.batch
--             [ Navbar.subscriptions model.navbar NavbarMsg
--             , homeSub
--             ]

-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
