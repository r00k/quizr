module Question.Update (update, init) where

import Question.Model exposing (..)
import Effects exposing (Effects)


type Action
  = Noop


update : Action -> Model -> ( Model, Effects Action )
update action model =
  ( model, Effects.none )


init : ( Model, Effects Action )
init = 
  ( initialModel, Effects.none )
