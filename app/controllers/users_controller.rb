class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      render json: UserSerializer.new(@user), status: :created
    else
      render json: ErrorSerializer.new(@user), status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:username, :password, :first_name, :last_name, :email, :phone)
  end
end
