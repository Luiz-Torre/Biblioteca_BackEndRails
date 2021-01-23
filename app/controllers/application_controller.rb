class ApplicationController < ActionController::API
    def current_user
        token = request.headers["Authorization"]
        token = token.split(" ").last if token.present?
        return nil unless token.present?
        decoded = JsonWebToken.decode(token)
        return nil unless decoded.present?
        User.find_by(id: decoded[0]["user_id"])
    end
end
