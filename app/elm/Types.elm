module Types exposing (..)

type Page
    = Home
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

type alias Model =
    { currentPage : Page
    }
