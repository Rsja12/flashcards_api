class TopicsController < ApplicationController

    def index
        topics = Topic.all
        render json: topics.to_json(:include => {:flashcards => {:only => [:id, :name, :description, :topic_id]}})
    end

    def show
        topic = Topic.find_by(id: params[:id])
        if topic
            render json: topic.to_json(:include => {:flashcards => {:only => [:id, :name, :description, :topic_id]}})
        else
            render json: { message: 'Topic not found' }
        end
    end

    def create
        topic = Topic.new(topic_params)
        if topic.save
            render json: topic
        else
            render json: { message: 'Topic not created' }
        end
    end

    def update
        topic = Topic.find_by(id: params[:id])
        topic.update(topic_params)
        
        render json: topic
    end

    private

    def topic_params
        params.require(:topic).permit(:name)
    end

end
