include("Flashcard.jl")
import .Flashcard

include("DeckOfFlashcards.jl")
import .DeckOfFlashcards

println("hello wurld")

try
    mkdir("current_decks")
catch
end

newOpenOrQuit = "default"
while (newOpenOrQuit != "Quit")
    println("Hello! Do you want to create a new deck of flashcards, or open an existing deck?")
    println("Enter \"New\" for a new deck, \"Open\" to open an existing deck, or \"Quit\" to quit:")
    global newOpenOrQuit = readline()

        # force user to enter New, Open or Quit
        while ((newOpenOrQuit != ("New")) && (newOpenOrQuit != ("Open")) && (newOpenOrQuit != ("Quit")))
        println("Invalid input. Please enter \"New\" for a new deck, \"Open\" to open an existing deck, or \"Quit\" to quit:")
        newOpenOrQuit = readline()
        end

        # if user wants to create a new deck of flashcards
        if (newOpenOrQuit == "New")
            deckOne = DeckOfFlashcards
        end

        # if user wants to open an existing deck of flashcards
        if (newOpenOrQuit == "Open")
        end

end
