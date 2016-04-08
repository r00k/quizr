module Question.Update (update, init, Action(..)) where

import Question.Model exposing (..)
import Effects exposing (Effects)


type Action
  = Noop
  | UpdateResponse String
  | AnswerQuestion


update : Action -> Model -> ( Model, Effects Action )
update action model =
  case action of
    Noop ->
      ( model, Effects.none )

    UpdateResponse response ->
      ( { model | response = response }, Effects.none )

    AnswerQuestion ->
      let
        calculateAnswerStatus =
          if model.answer == model.response then
            Correct
          else
            Incorrect
      in
        ( { model | status = calculateAnswerStatus }, Effects.none )


init : ( Model, Effects Action )
init =
  ( initialModel, Effects.none )
