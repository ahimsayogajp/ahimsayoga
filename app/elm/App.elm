module App exposing (init, update, subscriptions)

import Navigation exposing (..)
import UrlParser exposing (..)
import Types exposing (..)
import Routing exposing (..)


init : Location -> ( Model, Cmd Msg )
init location =
    let
        page =
            case parseHash route location of
                Nothing ->
                    Home

                Just page ->
                    page
    in
        ( Model page, Cmd.none )



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GoTo maybepage ->
            case maybepage of
                Nothing ->
                    ( { model | currentPage = Home }, Cmd.none )

                Just page ->
                    ( { model | currentPage = page }, Cmd.none )

        LinkTo path ->
            ( model, newUrl path )


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none