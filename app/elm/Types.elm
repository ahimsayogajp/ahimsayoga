module Types exposing (..)

import Bootstrap.Grid as Grid
import Bootstrap.Navbar as Navbar exposing (attrs)
import Bootstrap.Alert as Alert
import Bootstrap.Grid.Col as Col
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
    | NavbarMsg Navbar.State
    | TranslationsLoaded (Result Http.Error Translations)

type alias Model =
    { currentPage : Page
    , navbarState : Navbar.State
    , translations: Translations
    }
