class ApplicationController < ActionController::API
  before_action :authorize_request

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header

    decoded = AuthService.decode(header)

    if decoded
      @current_user = User.find_by(id: decoded[:user_id])
      render json: { error: "Usuário não encontrado" }, status: :unauthorized unless @current_user
    else
      render json: { error: "Token inválido ou ausente" }, status: :unauthorized
    end
  end
end
