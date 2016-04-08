module Main (..) where

import Html exposing (..)
import Question.Model exposing (..)
import Question.View
import Question.Update exposing (init, update)
import StartApp


app : StartApp.App Model
app =
  StartApp.start 
    { init = init
    , view = view
    , update = update
    , inputs = []
    }


main : Signal Html
main =
  app.html


view : Model -> Html
view question' =
  div
    []
    [ pageTitle
    , Question.View.view question'
    ]


pageTitle : Html
pageTitle =
  h1 [] [ text "QuizR" ]
