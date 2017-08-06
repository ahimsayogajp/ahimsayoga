module View exposing (view)

import Types exposing (..)
import Html exposing (..)
import Html.Events exposing (onClick)
import Pages.Home
import Pages.About


-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "SPA application" ]
        , render_menu model
        , render_page model
        ]


render_menu : Model -> Html Msg
render_menu model =
    div []
        [ button [ onClick (LinkTo "/#/home") ] [ text "Home" ]
        , button [ onClick (LinkTo "/#/about") ] [ text "About" ]
        , button [ onClick (LinkTo "/#/en/about") ] [ text "AboutEn" ]
        ]


render_page : Model -> Html Msg
render_page model =
    let
        page_content =
            case model.currentPage of
                Home ->
                    Pages.Home.update model

                About ->
                    Pages.About.update model

                AboutEn ->
                    Pages.About.update model
    in
        div [] [ page_content ]
