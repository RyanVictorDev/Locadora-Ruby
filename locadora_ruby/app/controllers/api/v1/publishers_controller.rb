class Api::V1::PublishersController < ApplicationController
    def index
        publishers = Publisher.all
        render json: publishers
    end

    def create
        service = PublisherService.new(publisher_params)
        result = service.create
        
        if result[:success]
            render json: result[:publisher], status: :created
        else
            render json: { errors: result[:errors] }, status: :unprocessable_entity
        end
    end

    private
    
    def publisher_params
        params.require(:publisher).permit(:name, :email, :site)
    end
end
