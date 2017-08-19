module Types exposing (..)

import Http
import I18Next exposing
      ( t
      , tr
      , Translations
      , Delims(..)
      , initialTranslations
      , fetchTranslations
      )

type Page
    = Home
    | HomeEn
    | Schedule
    | ScheduleEn
    | About
    | AboutEn
    | Instructors
    | InstructorsEn
    | Contact
    | ContactEn

type Msg
    = GoTo (Maybe Page)
    | LinkTo String
    | TranslationsLoaded (Result Http.Error Translations)

type alias Model =
    { currentPage : Page
    , translations: Translations
    }
