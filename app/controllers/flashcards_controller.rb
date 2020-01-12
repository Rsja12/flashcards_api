class FlashcardsController < ApplicationController

    def index
        flashcards = Flashcard.all
        render json: flashcards
    end

    def show
        flashcard = Flashcard.find_by(id: params[:id])
        if flashcard
            render json: flashcard
        else
            render json: { message: 'Flashcard not found' }
        end
    end

    def create
        flashcard = flashcard.new(flashcard_params)
        if flashcard.save
            render json: flashcard
        else
            render json: { message: 'Flashcard not created' }
        end
    end

    def update
        flashcard = Topic.find_by(id: params[:id])
        flashcard.update(flashcard_params)
        
        render json: flashcard
    end


    private

    def flashcard_params
        params.require(:flashcard).permit(:name, :description)
    end

end
