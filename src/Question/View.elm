module Question.View (view) where

import Html exposing (..)
import Html.Attributes exposing (for, id, type', value)
import Html.Events exposing (on, targetValue)
import Question.Model exposing (Model, Status(..))
import Question.Update exposing (Action(..))
import Util.CustomEvent exposing (onSubmit)


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
    , h3 [] [ text (questionStatus question') ]
    , answerForm question' address
    ]

questionStatus : Model -> String
questionStatus model =
  case model.status of
    Correct ->
      "You're right!"

    Incorrect ->
      "Nope, not right."

    Unanswered ->
      ""


answerForm : Model -> Signal.Address Action -> Html
answerForm question' address =
  form
    [ onSubmit address AnswerQuestion ]
    [ label [ for "answer" ] [ text "What's your answer?" ]
    , input
        [ type' "text"
        , id "answer"
        , on "input" targetValue (Signal.message address << UpdateResponse)
        ]
        []
    , input [ type' "submit", value "Submit your answer" ] []
    ]
