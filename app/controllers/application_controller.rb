class ApplicationController < ActionController::API
    rescue_from CanCan::AccessDenied do |exception|
        render json: {message: "Permissao Negada, você não tem permissão a esse acesso"}, status: 403
    end
    def current_user
        token = request.headers["Authorization"]
        token = token.split(" ").last if token.present?
        return nil unless token.present?
        decoded = JsonWebToken.decode(token)
        return nil unless decoded.present?
        User.find_by(id: decoded[0]["user_id"])
    end
end
