class AuthenticationController < ApplicationController
  def login
    user = User.find_by(email: params[:user][:email])
    user = user&.authenticate(params[:user][:password])
    if user
      token = JsonWebToken.encode(user_id: user.id)
      render json: {token: token}
    
    else
      render json: {message: "Email ou senha incorreta"}, status: 401
    end
  end

  # def sign_up
  #   @user = User.new(user_params)

  #   if @user.save
  #     render json: @user, status: :created, location: @user
  #   else
  #     render json: @user.errors, status: :unprocessable_entity
  #   end
  # end
  # private
  # def user_params
  #   params.require(:user).permit(:name, :cpf, :telephone, :role, :password, :password_confirmation, :email)
  # end
end
