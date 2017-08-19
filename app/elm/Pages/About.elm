module Pages.About exposing (update)

import Types exposing (..)
import Html exposing (..)
import I18Next exposing
      ( t
      , tr
      , Translations
      , Delims(..)
      , initialTranslations
      , fetchTranslations
      )

update : Model -> Html Msg
update model =
    text (t model.translations "nav.about")
