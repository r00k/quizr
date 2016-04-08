module Question.Model (Model, initialQuestion) where


type alias Model =
  { category : String
  , difficulty : String
  , text : String
  }


initialQuestion : Model
initialQuestion =
  { category = "Movie"
  , difficulty = "Hard"
  , text = "What is the name of the first Star Wars movie?"
  }
