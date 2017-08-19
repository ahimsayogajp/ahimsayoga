module App exposing (init, update, subscriptions)

import Navigation exposing (..)
import UrlParser exposing (..)
import Types exposing (..)
import Routing exposing (..)
import I18Next exposing
      ( t
      , tr
      , Translations
      , Delims(..)
      , initialTranslations
      , fetchTranslations
      )


init : Location -> ( Model, Cmd Msg )
init location =
    let
        page =
            case parseHash route location of
                Nothing ->
                    Home

                Just page ->
                    page

        initialModel =
            { currentPage = page
            , translations = initialTranslations
            }
    in
        ( initialModel, Cmd.batch [ fetchTranslations TranslationsLoaded "/locale/translations.jp.json" ] )



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

        TranslationsLoaded (Ok translations) ->
            ( { model | translations = translations },
                fetchLang model
            )

        TranslationsLoaded (Err _) ->
            ( model, Cmd.none )


-- LOAD CORRECT LANG PER ROUTE

fetchLang : Model -> Cmd Msg
fetchLang model =
    case model.currentPage of
        HomeEn ->
            fetchTranslations TranslationsLoaded "/locale/translations.en.json"

        ScheduleEn ->
            fetchTranslations TranslationsLoaded "/locale/translations.en.json"

        AboutEn ->
            fetchTranslations TranslationsLoaded "/locale/translations.en.json"

        InstructorsEn ->
            fetchTranslations TranslationsLoaded "/locale/translations.en.json"

        ContactEn ->
            fetchTranslations TranslationsLoaded "/locale/translations.en.json"

        _ ->
            fetchTranslations TranslationsLoaded "/locale/translations.jp.json"


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
