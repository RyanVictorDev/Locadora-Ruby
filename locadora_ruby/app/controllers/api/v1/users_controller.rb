class Api::V1::UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    def create
        service = UserService.new(user_params)
        result = service.create
        
        if result[:success]
            render json: result[:user], status: :created
        else
            render json: { errors: result[:errors] }, status: :unprocessable_entity
        end
    end

    def show
        user = User.find_by(id: params[:id])
        if user
            render json: user, status: :ok, serializer: UserSerializer
        else
            render json: { error: "Usuário não encontrado" }, status: :not_found
        end
    end

    private 

    def user_params
        params.require(:user).permit(:name, :email, :password, :role)
    end
end
