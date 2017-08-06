-- module Main exposing (main)

-- import App exposing (init, update, subscriptions)
-- import View exposing (view)
-- import Types exposing (Model, Msg(UrlChange))
-- import Navigation exposing (Location)


-- main : Program Never Model Msg
-- main =
--     Navigation.program UrlChange
--         { init = init
--         , view = view
--         , update = update
--         , subscriptions = subscriptions
--         }

import Html exposing (Html, a, button, code, div, h1, li, text, ul)
import Html.Events exposing (onClick)
import Navigation
import UrlParser as Url exposing ((</>), (<?>), s, int, stringParam, top)



main =
  Navigation.program UrlChange
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }



-- MODEL


type alias Model =
  {
      history : List (Maybe Route)
  }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
  ( Model [Url.parseHash route location]
  , Cmd.none
  )



-- URL PARSING


type Route
  = Home
  | About
  | AboutEn


route : Url.Parser (Route -> a) a
route =
  Url.oneOf
    [ Url.map Home top
    , Url.map About (s "about")
    , Url.map AboutEn (s "en" </> s "about")
    ]



-- UPDATE


type Msg
  = NewUrl String
  | UrlChange Navigation.Location


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



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none



-- VIEW


view : Model -> Html Msg
view model =
        div []
            [ h1 [] [ text "Links" ]
            , ul [] (List.map viewLink [ "/", "#/about/", "/#/en/about/", "/blog/37", "/blog/?search=cats" ])
            , h1 [] [ text "History" ]
            , ul [] (List.map viewRoute model.history)
            ]


viewLink : String -> Html Msg
viewLink url =
  li [] [ button [ onClick (NewUrl url) ] [ text url ] ]


viewRoute : Maybe Route -> Html msg
viewRoute maybeRoute =
  case maybeRoute of
    Nothing ->
      li [] [ text "Invalid URL"]

    Just route ->
      li [] [ code [] [ text (routeToString route) ] ]


routeToString : Route -> String
routeToString route =
  case route of
    Home ->
      "This is the home page"

    About ->
      "Just an about page"

    AboutEn ->
      "The English version"
