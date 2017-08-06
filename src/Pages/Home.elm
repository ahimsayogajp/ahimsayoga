module Pages.Home exposing (Model, Msg, init, update, view)

import Bootstrap.Alert as Alert
import Bootstrap.Button as Button
import Bootstrap.Form.Input as Input
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Bootstrap.Grid.Row as Row
import Html exposing (Html, div, text, h5, span)
import Html.Attributes exposing (class, href)


type alias Model =
    { view : Model
    }



init : Model
init =
    { view = view
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetTableQuery query ->
            { model | tableQuery = query } ! []

        SetTableState state ->
            { model | tableState = state } ! []


view : Model -> Html Msg
view model =
    let
        alertMessage =
            case model.deleteAlert of
                Just message ->
                    Alert.danger [ text message ]

                Nothing ->
                    text ""

        lowerQuery =
            String.toLower model.tableQuery

        allProperties =
            \x -> String.join "|" [ x.name, x.hostedOn, x.description ]

        filter =
            List.filter (String.contains lowerQuery << String.toLower << allProperties)
    in
        Grid.container []
            [ Grid.row [ Row.attrs [ class "spacer-12" ] ]
                [ Grid.col [ Col.md12 ] [ h5 [] [ text "Home" ] ]
                ]
            , Grid.row []
                [ Grid.col [] [ Button.linkButton [ Button.attrs [ href <| "http://google.com" ] ] [ text "Add" ] ]
                , Grid.col []
                    [ Input.text
                        [ Input.placeholder "Search"
                        , Input.value model.tableQuery
                        , Input.onInput SetTableQuery
                        ]
                    ]
                ]
            , Grid.row [ Row.attrs [ class "spacer-12" ] ]
                [ Grid.col [ Col.md12 ]
                    [ text "nothing" ]
                ]
            ]
