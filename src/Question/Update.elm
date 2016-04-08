module Question.Update (update) where


type Action
  = Noop


update : Action -> Model -> Model
update action model =
  model
