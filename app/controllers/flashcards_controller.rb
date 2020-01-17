class FlashcardsController < ApplicationController

    def index
        topic = Topic.find_by(id: params[:topic_id])
        flashcards = topic.flashcards 
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
        # byebug
        topic = Topic.find_by(id: params[:topic_id])
        flashcard = topic.flashcards.build(flashcard_params)
        if flashcard.save
            render json: topic.to_json(:include => {:flashcards => {:only => [:name, :description, :topic_id]}})
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
