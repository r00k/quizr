module App.Update (Action(HandleQuestionAction), init, update) where

import App.Model exposing (..)
import Question.Update
import Effects exposing (Effects)


type Action
  = Noop
  | HandleQuestionAction Question.Update.Action


init : ( Model, Effects Action )
init =
  ( initialModel, Effects.none )


update : Action -> Model -> ( Model, Effects Action )
update action model =
  case action of
    Noop ->
      ( initialModel, Effects.none )

    HandleQuestionAction action' ->
      let
        ( model', effects' ) =
          Question.Update.update action' model.currentQuestion
      in
        ( { model | currentQuestion = model' }
        , Effects.map HandleQuestionAction effects'
        )
