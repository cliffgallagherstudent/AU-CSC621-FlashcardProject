include("Flashcard.jl")
import .Flashcard

include("DeckOfFlashcards.jl")
import .DeckOfFlashcards

println("hello", " wurld")

#=try
    mkdir("current_decks")
catch
end=#

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
            #=
            println("What do you want to call this deck?")
            deckName = readline()
            deckOne = DeckOfFlashcards("deckName", Flashcard[])=#


            #= Instead of having a DeckOfFlashcards object:
            If I ask the user how many flashcards they want in the deck, I can create an array
            of that many flashcard objects
            Do I need a deckName? Or can I get away with just a filename? Maybe
            something like "What do you want to call this deck? This will be the filename where
            the individual flashcards are saved"
            =#
            println("What do you want to call this deck?")
            println("This is the name the deck will save with")
            deckName = readline()
            deckFileName = string(deckName, ".txt")
            println(deckFileName)
            open(deckFileName, "w") do file
                #write(file, "here is some random text")
            end

            #mv(abspath(deckFileName), abspath("current_decks"), force=true)

            println("How many flashcards do you want in this deck?")
            numberOfCardsString = readline()
            numberOfCardsInt = parse(Int, numberOfCardsString)
            #println(numberOfCardsInt)
            deckOne = Array{Flashcard}(undef, numberOfCardsInt)
            println("There will be ", numberOfCardsString,  " cards in this deck.")
            open(deckFileName, "w") do file
                for i = 1:numberOfCardsInt
                    println("What do you want card ", i, ", side one, to say?")
                    cardSideOne = readline()
                    println("What do you want card ", i, ", side two, to say?")
                    cardSideTwo = readline()
                    flashcard = Flashcard(cardSideOne, cardSideTwo)
                        write(file, cardSideOne, "\n", cardSideTwo, "\n")
                end
            end
        end

        # if user wants to open an existing deck of flashcards
        if (newOpenOrQuit == "Open")
            println("Here are the available decks to open:")
            for (root, dir, files) in walkdir(".")
                for file in files
                    if (occursin(".txt", file))
                        println(file)
                    end
                end
            end
        end
end
