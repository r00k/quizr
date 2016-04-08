module Main (..) where

import Html exposing (..)
import Html.Attributes exposing (for, id, type', value)


type alias Question =
  { category : String
  , difficulty : String
  , text : String
  }


initialQuestion : Question
initialQuestion =
  { category = "Movie"
  , difficulty = "Hard"
  , text = "What is the name of the first Star Wars movie?"
  }


main : Html
main =
  view initialQuestion


view : Question -> Html
view question' =
  div
    []
    [ pageTitle
    , question question'
    ]


pageTitle : Html
pageTitle =
  h1 [] [ text "QuizR" ]


question : Question -> Html
question question' =
  section
    []
    [ dl
        []
        [ dt [] [ text "Category" ]
        , dd [] [ text question'.category ]
        , dt [] [ text "Difficulty" ]
        , dd [] [ text question'.difficulty ]
        ]
    , h2 [] [ text "What's the name of the first Star Wars movie?" ]
    , answerForm
    ]


answerForm : Html
answerForm =
  form
    []
    [ label [ for "answer" ] [ text "What's your answer?" ]
    , input [ type' "text", id "answer" ] []
    , input [ type' "submit", value "Submit your answer" ] []
    ]
