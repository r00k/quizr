module Question.View (view) where

import Html exposing (..)
import Html.Attributes exposing (for, id, type', value)
import Html.Events exposing (on, targetValue)
import Question.Model exposing (Model)
import Question.Update exposing (Action(..))


view : Signal.Address Action -> Model -> Html
view address question' =
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
    , answerForm question' address
    ]


answerForm : Model -> Signal.Address Action -> Html
answerForm question' address =
  form
    []
    [ label [ for "answer" ] [ text "What's your answer?" ]
    , text question'.response
    , input
        [ type' "text"
        , id "answer"
        , on "input" targetValue (Signal.message address << UpdateResponse)
        ]
        []
    , input [ type' "submit", value "Submit your answer" ] []
    ]
