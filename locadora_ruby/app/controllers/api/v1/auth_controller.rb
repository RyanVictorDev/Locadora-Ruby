class Api::V1::AuthController < ApplicationController
    skip_before_action :authorize_request, only: [:login]


    def login
        user = User.find_by(email: params[:email])

        if user&.authenticate(params[:password])
            token = AuthService.encode({ user_id: user.id })

            render json: {
                token: token,
                user: UserSerializer.new(user)
            }, status: :ok
        else
            render json: { error: "Email ou senha inválidos" }, status: :unauthorized
        end
    end
end
