module Main (..) where

import Task exposing (Task)
import Effects exposing (Effects)
import App.Model exposing (..)
import App.View
import Html exposing (Html)
import App.Update exposing (init, update, Action)
import StartApp


app : StartApp.App Model
app =
  StartApp.start
    { init = init
    , view = App.View.view
    , update = update
    , inputs = []
    }


main : Signal Html
main =
  app.html


port tasks : Signal (Task Effects.Never ())
port tasks =
  app.tasks
