include("Flashcard.jl")
import .Flashcard

struct DeckOfFlashcards
    Flashcard[]
    deckName::String
end
