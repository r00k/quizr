module Question.View (view) where

import Html exposing (..)
import Html.Attributes exposing (for, id, type', value)
import Question.Model exposing (Model)


view : Model -> Html
view question' =
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
