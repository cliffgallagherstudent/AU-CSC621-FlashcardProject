struct Flashcard
    sideOne::String
    sideTwo::String
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

            println("What do you want to call this deck?")
            println("This is the name the deck will save with")
            deckName = readline()
            deckFileName = string(deckName, ".txt")
            println(deckFileName)
            open(deckFileName, "w") do file
        end

            println("How many flashcards do you want in this deck?")
            numberOfCardsString = readline()
            numberOfCardsInt = parse(Int, numberOfCardsString)
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
            println("Type the name of the file you want to open.")
            chosenDeck = readline()

            # choose the deck the user typed
            for (root, dir, files) in walkdir(".")
                for file in files
                    if (occursin(chosenDeck, file))
                        try
                            #read in the data from the deck the user chose
                            open(chosenDeck) do file

                                # go line-by-line
                                i = 1
                                questionOrAnswer = "temp"
                                for line in eachline(file)
                                    if ((i % 2) != 0)
                                        questionOrAnswer = "Question:"
                                    else
                                        questionOrAnswer = "Answer:"
                                    end
                                    println(questionOrAnswer)
                                    displayedText = line
                                    println(line)
                                    i += 1
                                    println("Enter \"Continue\" to continue")
                                    nextCard = readline()
                                    while (nextCard != "Continue")
                                        println("Invalid\n", questionOrAnswer, "\n", displayedText, "\nEnter \"Continue\" to continue")
                                        nextCard = readline()
                                    end
                                end
                            end
                        catch
                            println("File does not exist.")
                        end
                    end
                end
            end
        end
end
