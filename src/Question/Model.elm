module Question.Model (Model, initialModel, Status(..)) where


type Status
  = Correct
  | Incorrect
  | Unanswered


type alias Model =
  { category : String
  , difficulty : String
  , text : String
  , response : String
  , status : Status
  , answer : String
  }


initialModel : Model
initialModel =
  { category = "Movie"
  , difficulty = "Hard"
  , text = "What is the name of the first Star Wars movie?"
  , response = ""
  , status = Unanswered
  , answer = "Star Wars"
  }
