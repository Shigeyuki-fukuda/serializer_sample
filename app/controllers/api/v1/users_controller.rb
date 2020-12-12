class Api::V1::UsersController < ApplicationController
  def show
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      head :ok
    else
      head :bad_request
    end
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirm)
  end
end
