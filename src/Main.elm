module Main (..) where

import Html exposing (..)
import Question.Model exposing (..)
import Question.View


main : Html
main =
  view initialQuestion


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
