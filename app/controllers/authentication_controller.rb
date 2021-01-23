class AuthenticationController < ApplicationController
  def login
  end

  def sign_up
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :cpf, :telephone, :role, :password, :password_digest, :email)
  end
end
